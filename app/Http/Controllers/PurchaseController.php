<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\Product;
use Illuminate\Support\Facades\Log;

class PurchaseController extends Controller
{

    public function index(Request $request,$id)
    {
        $data_product = Product::findOrFail($id);
        if(empty($data_product))
        {
            request()->session()->flash('error', 'Không tìm thấy thông tin sản phẩm');
            return redirect()->route('product.index');

        }
        $date = Carbon::now()->format('Y-m-d');
        $data_purchare = Purchase::where('product_id',$id)->first();
        $is_update = 0;
        if(!empty($data_purchare))
        {
            $is_update = 1;
        }
        return view('backend.purchase.create',compact('data_product','is_update','date','data_purchare'));
    }
    public function create(Request $request)
    {
        $request->validate([
            'date_purcharse'=>'required',
            'quantity'=>'required',
            'price'=>'required',
        ],[
            'date_purcharse.required'=> 'Ngày nhập hàng không được để trống',
            'quantity.required'=>'Số lượng không được để trống',
            'price.required'=>'Đơn giá không được để trống',
        ]);
        try {
            $data_item = $request->all();
            $dataInsert = [
                'product_id'=>$data_item['product_id'],
                'quantity'=>$data_item['quantity'],
                'price'=>$data_item['price'],
                'date_import'=>date('Y-m-d', strtotime($data_item['date_purcharse'])),
            ];
            $insert = Purchase::create($dataInsert);
            if($insert)
            {
                request()->session()->flash('success', 'Đã thêm sản phẩm vào kho thành công');
                return redirect()->route('product.index');
            }else{
                request()->session()->flash('success', 'Thêm vào kho thất bại');
                return redirect()->route('product.index');
            }
        }catch (\Exception $e)
        {
            Log::error($e->getMessage());
        }


    }
    public function update(Request $request,$id)
    {
        $request->validate([
            'date_purcharse'=>'required',
            'quantity'=>'required',
            'price'=>'required',
        ],[
            'date_purcharse.required'=> 'Ngày nhập hàng không được để trống',
            'quantity.required'=>'Số lượng không được để trống',
            'price.required'=>'Đơn giá không được để trống',
        ]);
        try {
            $dataUpdate = Purchase::where('product_id',$id)->update([
                'date_import'=>$request->date_purcharse,
                'quantity'=>$request->quantity,
                'price'=>$request->price,
            ]);
            if($dataUpdate)
            {
                request()->session()->flash('success', 'Cập nhật dữ liệu vào kho thành công');
                return redirect()->route('product.index');
            }else{
                request()->session()->flash('success', 'Cập nhật dữ liệu vào kho thất bại');
                return redirect()->route('product.index');
            }
        }catch (\Exception $exception)
        {
            Log::error($exception->getMessage());
        }


    }
}
