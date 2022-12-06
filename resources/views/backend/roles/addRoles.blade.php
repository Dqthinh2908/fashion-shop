@extends('admin.layout-admin')
@section('title','Thêm vai trò')
@push('stylesheets')
    <style>
        .card-header{
            background-color:#c3c3c3;
        }
    </style>
@endpush
@push('scripts')
    <script>
        $('.checkbox_wrapper').on('click', function(){
            $(this).parents('.card').find('.checkbox_childrent').prop('checked',$(this).prop('checked'));
        })
        $('.checkall').on('click', function(){
            $(this).parents().find('.checkbox_childrent').prop('checked',$(this).prop('checked'));
            $(this).parents().find('.checkbox_wrapper').prop('checked',$(this).prop('checked'));
        })
    </script>
@endpush
@section('content')
    <div class="container-fluid"> 
            <div class="row">
                <form action="{{route('admin.handleAddRoles')}}" method="POST"  style="width:100%;">
                    @csrf
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <h1>Thêm vai trò mới</h1>
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <div class="mb-3">
                            <label for="titleNews" class="form-label">Tên vai trò</label>
                            <input type="name" name="name" class="form-control" id="username">
                        </div>
                        <div class="mb-3">
                            <label for="titleNews" class="form-label">Miêu tả vai trò</label>
                            <textarea name="display_name" class="form-control" row="4"></textarea>
                        </div>         
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">
                                    <input type="checkbox" class="checkall" name="" id="">
                                    checkall
                                </label>
                            </div>
                           @foreach($permissionsParent as $key => $value) 
                            <div class="card border-primary mb-3 col-md-12" >
                                <div class="card-header">
                                    <label for="">
                                        <input type="checkbox" class="checkbox_wrapper" value="">
                                    </label>
                                    Module {{ $value->name }}
                                </div>
                                <div class="row">
                                    @foreach($value->permissionChildrent as $permissionChildrentItem)
                                    <div class="card-body text-primary col-md-3">
                                        <h5 class="card-title">
                                            <label for="">
                                                <input type="checkbox" class="checkbox_childrent" name="permission_id[]" value="{{ $permissionChildrentItem->id  }}">
                                            </label>
                                            {{ $permissionChildrentItem->name }}
                                        </h5>
                                    </div>
                                    @endforeach              
                                </div>
                            </div>
                            @endforeach                    
                        </div>
                        
                    </div>
                    <button type="submit" class="btn btn-primary">Thêm vai trò</button>
                </form>
            </div>         
    </div>
@endsection
