<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;
use App\Models\Cart;
use Illuminate\Support\Str;
use Helper;

class CartController extends Controller
{
    protected $product = null;
    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    public function addToCart(Request $request)
    {
        if (empty(Auth()->user()->id)) {
            request()->session()->flash('error', 'Vui lòng đăng nhập');
            return back();
        }
        if (empty($request->slug)) {
            request()->session()->flash('error', 'Sản phẩm không hợp lệ');
            return back();
        }
        $product = $this->product::where('slug', $request->slug)->first();
        // return $product;
        if (empty($product)) {
            request()->session()->flash('error', 'Sản phẩm không hợp lệ');
            return back();
        }

        $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id', null)->where('product_id', $product->id)->first();
        // return $already_cart;
        if ($already_cart) {
            // dd($already_cart);
            $already_cart->quantity = $already_cart->quantity + 1;
            $already_cart->amount = $product->price + $already_cart->amount;
            // return $already_cart->quantity;
            if ($already_cart->product->purchase->quantity < $already_cart->quantity || $already_cart->product->purchase->quantity <= 0) return back()->with('error', 'Hàng không đủ!');

            $already_cart->save();
        } else {

            $cart = new Cart;
            $cart->user_id = auth()->user()->id;
            $cart->product_id = $product->id;
            $cart->price = ($product->price - ($product->price * $product->discount) / 100);
            $cart->quantity = 1;
            $cart->amount = $cart->price * $cart->quantity;
            $cart->size_product = $request->size_product;

            if ($cart->product->purchase->quantity < $cart->quantity || $cart->product->purchase->quantity <= 0) return back()->with('error', 'Hàng không đủ!');
            $cart->save();
            $wishlist = Wishlist::where('user_id', auth()->user()->id)->where('cart_id', null)->update(['cart_id' => $cart->id]);
        }
        request()->session()->flash('success', 'Sản phẩm đã thêm vào giỏ hàng thành công!');
        return back();
    }

    public function singleAddToCart(Request $request)
    {

        $request->validate([
            'slug'      =>  'required',
            'quant'      =>  'required',
        ]);

        if (empty(Auth()->user()->id)) {
            request()->session()->flash('error', 'Vui lòng đăng nhập');
            return back();
        }

        $product = Product::where('slug', trim($request->slug))->with('purchase')->first();
        if (isset($product->purchase) && $product->purchase->quantity < $request->quant[1] || !isset($product->purchase)) {
            return back()->with('error', 'Hết hàng, Bạn có thể bổ sung các sản phẩm khác.');
        }
        if (($request->quant[1] < 1) || empty($product)) {
            request()->session()->flash('error', 'Sản phẩm không hợp lệ');
            return back();
        }

        $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id', null)->where('product_id', $product->id)->where('size_product',@$request->size_product)->first();
        // return $already_cart;
        if ($already_cart) {
            $already_cart->quantity = $already_cart->quantity + $request->quant[1];
            // $already_cart->price = ($product->price * $request->quant[1]) + $already_cart->price ;
            $already_cart->amount = ($product->price * $request->quant[1]) + $already_cart->amount;

            if ($already_cart->product->purchase->quantity < $already_cart->quantity || $already_cart->product->purchase->quantity <= 0) return back()->with('error', 'Hàng không đủ!');
            $already_cart->save();
        } else {
            $cart = new Cart;
            $cart->user_id = auth()->user()->id;
            $cart->product_id = $product->id;
            $cart->price = ($product->price - ($product->price * $product->discount) / 100);
            $cart->quantity = $request->quant[1];
            $cart->size_product = $request->size_product;
            $cart->amount = (($product->price - ($product->price * $product->discount) / 100) * $request->quant[1]);

            if ($cart->product->purchase->quantity < $cart->quantity || $cart->product->purchase->quantity <= 0) return back()->with('error', 'Hàng không đủ!');
            // return $cart;
            $cart->save();
        }
        request()->session()->flash('success', 'Sản phẩm thêm vào giỏ hàng thành công.');
        return back();
    }

    public function cartDelete(Request $request)
    {
        $cart = Cart::find($request->id);
        if ($cart) {
            $cart->delete();
            request()->session()->flash('success', 'Gỡ giỏ hàng thành công!');
            return back();
        }
        request()->session()->flash('error', 'Hãy thử lại!');
        return back();
    }

    public function cartUpdate(Request $request)
    {
        if ($request->quant) {
            $error = array();
            $success = '';
            foreach ($request->quant as $k => $quant) {
                $id = $request->qty_id[$k];
                $cart = Cart::find($id);
                if ($quant > 0 && $cart) {
                    if ($cart->product->purchase->quantity < $quant) {
                        request()->session()->flash('error', 'Sản phẩm quá số lượng trong kho');
                        return back();
                    }
                    $cart->quantity = ($cart->product->purchase->quantity > $quant) ? $quant  : $cart->product->purchase->quantity;

                    if ($cart->product->purchase->quantity <= 0) continue;
                    $after_price = ($cart->product->price - ($cart->product->price * $cart->product->discount) / 100);
                    $cart->amount = $after_price * $quant;
                    $cart->save();
                    $success = 'Cập nhật giỏ hàng thành công!';
                } else {
                    $error[] = 'Giỏ hàng không hợp lệ!';
                }
            }
            return back()->with($error)->with('success', $success);
        } else {
            return back()->with('Giỏ hàng không hợp lệ!');
        }
    }


    public function checkout(Request $request)
    {
        if (empty(Cart::where('user_id', auth()->user()->id)->where('order_id', null)->first())) {
            request()->session()->flash('error', 'Giỏ hàng trống!');
            return back();
        }
        $user_profile = '';
        $country_items = Config('country') ?? '';
        if(Auth::check())
        {
            $user_profile = Auth()->user();
        }
        return view('frontend.pages.checkout',compact('user_profile','country_items'));
    }
}
