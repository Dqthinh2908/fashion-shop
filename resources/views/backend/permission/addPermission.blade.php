@extends('backend.layouts.master')
@section('title','Add Permissions')
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
@section('main-content')
    <div class="container-fluid">
            <div class="row">
                <form action="{{route('handleAddPermission')}}" method="POST" style="width:100%;"  >
                    @csrf
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <h1>Thêm phân quyền vai trò mới</h1>
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <div class="form-group">
                            <label for="" class="form-label">Chọn tên module</label>
                            <select name="module_parent" id="" class="form-control">
                                <option value="">Chọn tên module</option>
                                @foreach(config('permissions.table_module') as $moduleItem)
                                <option value="{{  $moduleItem }}">{{  $moduleItem }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                @foreach(config('permissions.module_childrent') as $key => $moduleItemChildrent)
                                <div class="col-md-3">
                                    <label for="">
                                        <input type="checkbox" value="{{ @$key }}" name="module_childrent[{{@$moduleItemChildrent}}]">
                                        {{$moduleItemChildrent }}
                                    </label>
                                </div>
                                @endforeach
                            </div>
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
    </div>
@endsection
