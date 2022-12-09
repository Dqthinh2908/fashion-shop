<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $table = 'roles';
    protected $guarded = [];

    public function product()
    {
        return $this->hasOne(Product::class,'product_id','id');
    }
}
