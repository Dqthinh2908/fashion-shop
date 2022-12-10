<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Shipping;
use App\User;
use PDF;
use Notification;
use Helper;
use Illuminate\Support\Str;
use App\Notifications\StatusNotification;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::orderBy('created_at', 'DESC')->paginate(10);
        return view('backend.order.index')->with('orders', $orders);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'required|string',
            'address1' => 'required|string',
            'phone' => 'required|numeric',
            'email' => 'required|email'
        ],
            [
                'first_name.required'=>'Họ và tên không được để trống',
                'first_name.string'=>'Họ và tên phải là chữ',
                'email.email'=>'Email chưa đúng định dạng',
                'email.required'=>'Email không được để trống',
                'address1.required'=>'Địa chỉ không dược để trồng',
                'address1.string'=>'Địa chỉ cần nhập là kí tự chữ',
            ]);

        if (empty(Cart::where('user_id', auth()->user()->id)->where('order_id', null)->first())) {
            request()->session()->flash('error', 'Giỏ hàng trống!');
            return back();
        }
        $cart_product_update = Cart::where('user_id', auth()->user()->id)->where('order_id', null)->with('product.purchase')->get()->groupBy('product_id');
        $data_product_cart = $this->tranformProductOrder($cart_product_update);
        $check_update = $this->checkUpdateProductPurcharse($data_product_cart);

        if($check_update)
        {
            foreach ($data_product_cart as $product_id => $quantity_cart)
            {
                $data_purchase = Purchase::where('product_id',$product_id)->first();
                $number_quantity_update = $data_purchase->quantity - $quantity_cart;
                Purchase::findOrFail($data_purchase->id)->update(['quantity'=>$number_quantity_update]);
            }
        }else
        {
            request()->session()->flash('error', 'Sản phẩm bạn đặt đã quá số lượng trong kho!');
            return back();
        }


        $order = new Order();
        $order_data = $request->all();
        $order_data['order_number'] = 'ORD-' . strtoupper(Str::random(10));
        $order_data['user_id'] = $request->user()->id;
        $order_data['shipping_id'] = $request->shipping;
        $shipping = Shipping::where('id', $order_data['shipping_id'])->pluck('price');
        // return session('coupon')['value'];
        $order_data['sub_total'] = Helper::totalCartPrice();
        $order_data['quantity'] = Helper::cartCount();
        if (session('coupon')) {
            $order_data['coupon'] = session('coupon')['value'];
        }
        if ($request->shipping) {
            if (session('coupon')) {
                $order_data['total_amount'] = Helper::totalCartPrice() + $shipping[0] - session('coupon')['value'];
            } else {
                $order_data['total_amount'] = Helper::totalCartPrice() + $shipping[0];
            }
        } else {
            if (session('coupon')) {
                $order_data['total_amount'] = Helper::totalCartPrice() - session('coupon')['value'];
            } else {
                $order_data['total_amount'] = Helper::totalCartPrice();
            }
        }
        // return $order_data['total_amount'];
        $order_data['status'] = "new";
        if (request('payment_method') == 'paypal') {
            $order_data['payment_method'] = 'paypal';
            $order_data['payment_status'] = 'Đã thanh toán';
        } else {
            $order_data['payment_method'] = 'cod';
            $order_data['payment_status'] = 'Chưa thanh toán';
        }
        $order->fill($order_data);
        $status = $order->save();
        if ($order)
            // dd($order->id);
            $users = User::where('role', 'admin')->first();
        $details = [
            'title' => 'Đơn hàng mới được tạo',
            'actionURL' => route('order.show', $order->id),
            'fas' => 'fa-file-alt'
        ];
        Notification::send($users, new StatusNotification($details));
        if (request('payment_method') == 'paypal') {
            return redirect()->route('payment')->with(['id' => $order->id]);
        } else {
            session()->forget('cart');
            session()->forget('coupon');
        }
        Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => $order->id]);

        // dd($users);
        request()->session()->flash('success', 'Sản phẩm của bạn đã được đặt hàng thành công');
        return redirect()->route('home');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $order = Order::getAllOrder($id);
        // return $order;
        return view('backend.order.show')->with('order', $order);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $order = Order::find($id);
        return view('backend.order.edit')->with('order', $order);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $order = Order::find($id);
        $this->validate($request, [
            'status' => 'required|in:new,process,delivered,cancel'
        ]);
        $data = $request->all();
        // return $request->status;
        if($data['status'] == 'delivered')
        {
            $status = $order->update([
                'status'=>$data['status'],
                'payment_status'=>'Đã thanh toán'
            ]);
        }else
        {
            $status = $order->update([
                'status'=>$data['status'],
            ]);
        }
        if ($status) {
            request()->session()->flash('success', 'Cập nhật đơn hàng thành công!');
        } else {
            request()->session()->flash('error', 'Hãy thử lại');
        }
        return redirect()->route('order.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $order = Order::find($id);
        if ($order) {
            $status = $order->delete();
            if ($status) {
                request()->session()->flash('success', 'Xóa đơn hàng thành công!');
            } else {
                request()->session()->flash('error', 'Không thể xóa đơn hàng!');
            }
            return redirect()->route('order.index');
        } else {
            request()->session()->flash('error', 'Không tìm thấy đơn hàng!');
            return redirect()->back();
        }
    }

    public function orderTrack()
    {
        return view('frontend.pages.order-track');
    }

    public function productTrackOrder(Request $request)
    {
        // return $request->all();
        $order = Order::where('user_id', auth()->user()->id)->where('order_number', $request->order_number)->first();
        if ($order) {
            if ($order->status == "new") {
                request()->session()->flash('success', 'Đơn hàng của bạn đã được đặt. Vui lòng chờ.');
                return redirect()->route('home');
            } elseif ($order->status == "process") {
                request()->session()->flash('success', 'Đơn đặt hàng của bạn đang được xử lý, vui lòng đợi.');
                return redirect()->route('home');
            } elseif ($order->status == "delivered") {
                request()->session()->flash('success', 'Đơn hàng của bạn đã được giao thành công.');
                return redirect()->route('home');
            } else {
                request()->session()->flash('error', 'Đơn đặt hàng của bạn đã bị hủy. vui lòng thử lại');
                return redirect()->route('home');
            }
        } else {
            request()->session()->flash('error', 'Số đơn đặt hàng không hợp lệ, vui lòng thử lại');
            return back();
        }
    }

    // PDF generate
    public function pdf(Request $request)
    {
        $order = Order::getAllOrder($request->id);
        // return $order;
        $file_name = $order->order_number . '-' . $order->first_name . '.pdf';
        // return $file_name;
        $pdf = \Barryvdh\DomPDF\PDF::loadview('backend.order.pdf', compact('order'));
        return $pdf->download($file_name);
    }
    // Income chart
    public function incomeChart(Request $request)
    {
        $year = \Carbon\Carbon::now()->year;
        // dd($year);
        $items = Order::with(['cart_info'])->whereYear('created_at', $year)->where('status', 'delivered')->get()
            ->groupBy(function ($d) {
                return \Carbon\Carbon::parse($d->created_at)->format('m');
            });
        $result = [];
        foreach ($items as $month => $item_collections) {
            foreach ($item_collections as $item) {
                $amount = $item->cart_info->sum('amount');
                // dd($amount);
                $m = intval($month);
                // return $m;
                isset($result[$m]) ? $result[$m] += $amount : $result[$m] = $amount;
            }
        }
        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $monthName = date('F', mktime(0, 0, 0, $i, 1));
            $data[$monthName] = (!empty($result[$i])) ? number_format((float)($result[$i]), 0, '.', '') : 0.0;
        }
        return $data;
    }
    public function tranformProductOrder($total_product_order)
    {
        $data_array = array();
        $sum_quantity = 0;
        $sum_amount = 0;
        $i  = 0;

        foreach ($total_product_order as $key => $value)
        {
            foreach ($value as $data)
            {
                $i++;
                $sum_quantity += $data->quantity;

            }
            $data_array[$key] = $sum_quantity;
            if($i == count($value))
            {
                $sum_quantity = 0;
            }
        }
        return $data_array;
    }
    public function checkUpdateProductPurcharse($data_product_cart)
    {
        if(!empty($data_product_cart))
        {
            $flag_check = true;
            foreach ($data_product_cart as $product_id =>$quantity_cart)
            {
                $data_purchase = Purchase::where('product_id',$product_id)->first();
                if(empty($data_purchase))
                {
                    $flag_check = false;
                }

                if((int)$data_purchase->quantity > $quantity_cart)
                {
                    $count_product = $data_purchase->quantity - $quantity_cart;
                    if($count_product < 0)
                    {
                        $flag_check = false;
                    }
                }else
                {
                    $flag_check = false;
                }
            }
        }
        return $flag_check;
    }

}
