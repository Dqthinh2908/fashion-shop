@extends('admin.layout-admin')
@section('title','Vai trò đã xóa')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <p> This is Trash Roles page !</p>
                <a class="btn btn-primary" href="{{route('admin.showRoles')}}"> Quay lại</a>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <?php if(!empty($messageSuccess)):?>
                <h6 class="alert alert-success" role="alert"><?= $messageSuccess ?></h6>
                <?php endif; ?>
                <?php if(!empty($messageError)):?>
                <h6 class="alert alert-danger" role="alert"><?= $messageError?></h6>
                <?php endif; ?>
                @if(session('msg'))
                    <div class="alert alert-{{session('type')}}">
                        {{session('msg')}}
                    </div>
                @endif
                <table class="table ">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên vai trò</th>
                        <th>Mô tả vai trò</th>
                        <th colspan="2" width="5%" class="text-center">Action</th>
                    </tr>
                    </thead>
                        <tbody>
                        @foreach($dataTrashed as $key => $value)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>{{$value->name}}</td>
                            <td>{{$value->description}}</td>
                            <td>
                                <a class="btn btn-success" href="{{ route('admin.handleRoleRestore',['id'=>$value->id])}} }}">Phục hồi</a>
                            </td>
                            <td>
                                @can('role_delete')
                                <a class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="{{route('admin.handleRoleForce',['id'=>$value->id])}}">Xóa vĩnh viễn</a>
                                @endcan
                            </td>
                        </tr>
                            @endforeach
                        </tbody>
                </table>
            </div>

        </div>
    </div>

@endsection
