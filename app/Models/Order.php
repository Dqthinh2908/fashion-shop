<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['user_id', 'order_number', 'sub_total', 'quantity', 'delivery_charge', 'status', 'total_amount', 'first_name', 'last_name', 'country', 'post_code', 'address1', 'address2', 'phone', 'email', 'payment_method', 'payment_status', 'shipping_id', 'coupon'];

    public function cart_info()
    {
        return $this->hasMany('App\Models\Cart', 'order_id', 'id');
    }
    public static function getAllOrder($id)
    {
        return Order::with('cart_info.product')->find($id);
    }
    public static function countActiveOrder()
    {
        $data = Order::count();
        if ($data) {
            return $data;
        }
        return 0;
    }
    public function cart()
    {
        return $this->hasMany(Cart::class);
    }

    public function shipping()
    {
        return $this->belongsTo(Shipping::class, 'shipping_id');
    }
    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }
    public static function getAllProductOrder()
    {
        $data = Order::with('cart_info.product')->orderBy('created_at','DESC')->get();
        $data_items = collect();
        if($data->isNotEmpty())
        {
            foreach ($data as  $value)
            {
                if($value->cart_info->isNotEmpty())
                {
                    $data_items->push($value->cart_info);
                }
            }
        }
        return $data_items->flatten()->groupBy('product_id');
    }
    public static function getProductsSold()
    {
        $data = Order::with('cart_info.product')->get();
        $data_items = collect();
        if($data->isNotEmpty())
        {
            foreach ($data as  $value)
            {
                if($value->cart_info->isNotEmpty())
                {
                    $data_items->push($value->cart_info);
                }
            }
        }
        return array_sum($data_items->flatten()->pluck('quantity')->toArray()) ?? '';
    }
}
