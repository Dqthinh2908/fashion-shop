<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;
use App\Models\Permission;
use Illuminate\Database\Eloquent\SoftDeletes;

class Role extends Model
{
    use SoftDeletes;
    protected $table = 'roles';
    protected $guarded = [];

    public function user()
    {
        return $this->belongsToMany(User::class,'user_role','role_id','user_id');
    }
    public function permissions()
    {
        return $this->belongsToMany(Permission::class,'role_permission','role_id','permission_id');
    }
}
