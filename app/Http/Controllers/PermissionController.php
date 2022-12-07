<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Role;
use App\Models\Permission;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class PermissionController extends Controller
{
    private $permission;
    public function __construct(Permission $permission)
    {
        $this->permission = $permission;
    }
    public function showPermissionRole()
    {
        return view('backend.permission.addPermission');
    }
    public function handleAddPermission(Request $request)
    {
        try {
            DB::beginTransaction();
            $permission = Permission::create([
                'name' => 'Danh mục ' . $request->module_parent,
                'display_name'=>$request->module_parent,
                'parent_id'=> 0
            ]);
            foreach($request->module_childrent as $key => $value)
            {
                Permission::create([
                    'name' => $key . ' ' .$permission->display_name,
                    'display_name'=>$key . ' ' .$request->module_parent,
                    'parent_id'=> $permission->id,
                    'key_code'=>$value. '_' .$request->module_parent
                ]);
            }
            DB::commit();
            if ($permission) {
                request()->session()->flash('success', 'Đã thêm vai trò thành công');
            } else {
                request()->session()->flash('error', 'Đã xảy ra lỗi khi thêm vai trò');
            }
            return redirect()->back();

        }catch (\Exception $exception)
        {
            Log::error('Message :'. $exception->getMessage() . '--- Line' . $exception->getLine());
            request()->session()->flash('error', 'Đã xảy ra lỗi khi thêm vai trò');
            return redirect()->route('showRoles');

        }

    }
}
