<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Role;
use App\Models\Permission;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Log;

class RoleController extends Controller
{
    private $role;
    private $permission;
    public function __construct(Role $roles,Permission $permission)
    {
        $this->permission = $permission;
        $this->role = $roles;
    }
    public function index()
    {
        if(Gate::denies('list_role'))
        {
            abort('403');
        }
        $dataRoles = Role::all();
        return view('backend.roles.index',compact('dataRoles'));
    }
    public function showAddRoles()
    {
        if(Gate::denies('add_role'))
        {
            abort('403');
        }
        $permissionsParent = $this->permission->where('parent_id',0)->get();
        return view('backend.roles.addRoles',compact('permissionsParent'));
    }
    public function handleAddRoles(Request $request)
    {
        try {
           DB::beginTransaction();
            $role = $this->role->create([
                'name'=> $request->name,
                'description'=>$request->display_name,
            ]);
            $role->permissions()->attach($request->permission_id);
            DB::commit();
            if ($role) {
                request()->session()->flash('success', 'Đã thêm vai trò thành công');
            } else {
                request()->session()->flash('error', 'Đã xảy ra lỗi khi thêm vai trò');
            }
            return redirect()->route('showRoles');

        }catch (\Exception $exception)
        {
            Log::error('Message :'. $exception->getMessage() . '--- Line' . $exception->getLine());
            request()->session()->flash('error', 'Đã xảy ra lỗi khi thêm vai trò');
            return redirect()->route('showRoles');

        }

    }
    public function showEditRoles(Request $request,$id)
    {
        if(Gate::denies('update_role'))
        {
            abort('403');
        }
        $permissionsParent = $this->permission->where('parent_id',0)->get();
        $role = $this->role->find($id);
        $permissionsChecked = $role->permissions;
        // dd($permissionsChecked);
        return view('backend.roles.editRoles',compact('permissionsParent','role','permissionsChecked'));
    }
    public function handleEditRoles(Request $request, $id)
    {
        $role = $this->role->find($id);
        $role->update([
            'name'=> $request->name,
            'description'=>$request->display_name,
        ]);

        $role->permissions()->sync($request->permission_id);
        if ($role) {
            request()->session()->flash('success', 'Cập nhật vai trò thành công');
        } else {
            request()->session()->flash('error', 'Đã xảy ra lỗi khi cập nhật vai trò');
        }
        return redirect()->route('showRoles');
    }
    public function handleDeleteRoles(Request $request, $id)
    {
        if(Gate::denies('delete_role'))
        {
            abort('403');
        }
        $deleteRole = Role::destroy($id);
        if($deleteRole)
        {
            request()->session()->flash('success', 'Xóa vai trò thành công');
            return redirect()->route('showRoles');
        }else
        {
            request()->session()->flash('error', 'Đã xảy ra lỗi khi xóa vai trò');
            return redirect()->route('showRoles');

        }
    }
    public function showTrashRole()
    {
        $dataTrashed = Role::onlyTrashed()->get();
        return view('backend.roles.showRoleTrash',compact('dataTrashed'));
    }
    public function handleRoleRestore($id)
    {
        $data= Role::withTrashed()->find($id);
        $data->restore();
        return redirect()->route('showRoles')->with('msg','Khôi phục dữ liệu thành công')->with('type','success');
    }
    public function handleRoleForce($id)
    {
        $dataForce = Role::withTrashed()->find($id);
        $dataForce->forceDelete();
        return redirect()->route('showRoles')->with('msg','Dữ liệu đã được xóa vĩnh viễn')->with('type','success');
    }


}
