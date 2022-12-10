<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;

class WishlistController extends Controller
{
    protected $product = null;
    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    public function wishlist(Request $request)
    {
        // dd($request->all());
        if (empty($request->slug)) {
            request()->session()->flash('error', 'Sản phẩm không hợp lệ!');
            return back();
        }
        $product = Product::where('slug', $request->slug)->first();
        // return $product;
        if (empty($product)) {
            request()->session()->flash('error', 'Sản phẩm không hợp lệ!');
            return back();
        }

        $already_wishlist = Wishlist::where('user_id', auth()->user()->id)->where('cart_id', null)->where('product_id', $product->id)->first();
        // return $already_wishlist;
        if ($already_wishlist) {
            request()->session()->flash('error', 'Sản phẩm bạn chọn đã có trong danh sách yêu thích');
            return back();
        } else {

            $wishlist = new Wishlist;
            $wishlist->user_id = auth()->user()->id;
            $wishlist->product_id = $product->id;
            $wishlist->price = ($product->price - ($product->price * $product->discount) / 100);
            $wishlist->quantity = 1;
            $wishlist->amount = $wishlist->price * $wishlist->quantity;
            if(!isset($wishlist->product->purchase))
            {
                return back()->with('error', 'Sản phẩm đã hết hàng!');
            }
            if ($wishlist->product->purchase->quantity < $wishlist->quantity || $wishlist->product->purchase->quantity <= 0) return back()->with('error', 'Sản phẩm đã hết hàng!');
            $wishlist->save();
        }
        request()->session()->flash('success', 'Sản phẩm đã thêm vào danh sách yêu thích');
        return back();
    }

    public function wishlistDelete(Request $request)
    {
        $wishlist = Wishlist::find($request->id);
        if ($wishlist) {
            $wishlist->delete();
            request()->session()->flash('success', 'Đã gỡ danh sách yêu thích');
            return back();
        }
        request()->session()->flash('error', 'Hãy thử lại!');
        return back();
    }
}
