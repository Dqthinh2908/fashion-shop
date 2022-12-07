<?php

namespace App;

use App\Models\Role;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','role','photo','status','provider','provider_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function orders(){
        return $this->hasMany('App\Models\Order');
    }
    public function roles()
    {
        return $this->belongsToMany(Role::class,'user_role','user_id','role_id');
    }
    public function checkPermissionAccess($permissionCheck)
    {
        //B1 Lấy được tất cả các quyền user login vào hệ thống
        //B2 So Sánh giá trị đưa vào của router hiện tại xem có tồn tại trong các quyền mà mình lấy được hay không
        $roles = auth()->user()->roles;
        foreach($roles as $role)
        {
            $permissions = $role->permissions;
            if($permissions->contains('key_code',$permissionCheck))
            {
                return true;
            }
        }
        return false;

    }
}
