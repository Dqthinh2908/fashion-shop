<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $table = 'permissions';
    protected $guarded = [];
    public function permissionChildrent()
    {
        return $this->hasMany(Permission::class,'parent_id');
    }
}
