<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;
use Illuminate\Support\Facades\Log;

class UsersController extends Controller
{
    protected $user;
    protected $role;
    public function __construct(User $user, Role $role)
    {
        $this->user = $user;
        $this->role = $role;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::orderBy('id', 'ASC')->paginate(10);
        return view('backend.users.index')->with('users', $users);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = $this->role->all();
        return view('backend.users.create',compact('roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate(
            $request,
            [
                'name' => 'string|required|max:30',
                'email' => 'string|required|unique:users',
                'password' => 'string|required',
                'status' => 'required|in:active,inactive',
                'photo' => 'nullable|string',
            ]
        );
        $data = $request->all();
        $dataInsert = [
            'name' => $request->name,
            'email'=>$request->email,
            'password'=>bcrypt($request->password),
            'status'=>$request->status,
            'photo'=>$request->photo,
            'role'=>'admin'
        ];
        try {
            DB::beginTransaction();
            $user = User::create($dataInsert);
            $roleIds = $request->role_id;
            $user->roles()->attach($roleIds);
            DB::commit();
            if ($user) {
                request()->session()->flash('success', 'Đã thêm người dùng thành công');
            } else {
                request()->session()->flash('error', 'Đã xảy ra lỗi khi thêm người dùng');
            }
            return redirect()->route('users.index');


        }catch (\Exception $exception)
        {
            Log::error('Message :'. $exception->getMessage() . '--- Line' . $exception->getLine());

        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $roles = $this->role->all();
        // dd($roles);
        $user = $this->user->find($id);
        $rolesOfUser = $user->roles;
        return view('backend.users.edit',compact('roles','user','rolesOfUser'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate(
            $request,
            [
                'name' => 'string|required|max:30',
                'email' => 'string|required',
                'status' => 'required|in:active,inactive',
                'photo' => 'nullable|string',
            ]
        );
        try {
            DB::beginTransaction();
            $this->user->find($id)->update([
                'name' => $request->name,
                'email'=>$request->email,
                'status'=>$request->status,
                'photo'=>$request->photo,
            ]);
            $user = $this->user->find($id);
            $user->roles()->sync($request->role_id);
            DB::commit();
            if ($user) {
                request()->session()->flash('success', 'Đã thêm người dùng thành công');
            } else {
                request()->session()->flash('error', 'Đã xảy ra lỗi khi thêm người dùng');
            }
            return redirect()->route('users.index');
        }catch (\Exception $exception)
        {
            Log::error('Message :'. $exception->getMessage() . '--- Line' . $exception->getLine());

        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $delete = User::findorFail($id);
        $status = $delete->delete();
        if ($status) {
            request()->session()->flash('success', 'Xóa người dùng thành công!');
        } else {
            request()->session()->flash('error', 'Đã xảy ra lỗi khi xóa người dùng');
        }
        return redirect()->route('users.index');
    }
}
