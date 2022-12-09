<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\Product;
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
        return view('backend.purchase.create',compact($data_product));
    }
}
