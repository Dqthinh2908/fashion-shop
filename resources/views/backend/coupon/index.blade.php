@extends('backend.layouts.master')

@section('main-content')
 <!-- DataTales Example -->
 <div class="card shadow mb-4">
     <div class="row">
         <div class="col-md-12">
            @include('backend.layouts.notification')
         </div>
     </div>
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary float-left">Danh sách mã giảm giá</h6>
      <a href="{{route('coupon.create')}}" class="btn btn-primary btn-sm float-right" data-toggle="tooltip" data-placement="bottom" title="Thêm mã giảm giá"><i class="fas fa-plus"></i> Thêm mã giảm giá</a>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        @if(count($coupons)>0)
        <table class="table table-bordered" id="banner-dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>#</th>
              <th>Mã giảm giá</th>
              <th>Kiểu</th>
              <th>Giá trị</th>
              <th>Trạng thái</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody>
          <?php $i = 1 ?>
            @foreach($coupons as $coupon)
                <tr>
                    <td>{{@$i++}}</td>
                    <td>{{@$coupon->code}}</td>
                    <td>
                        @if(@$coupon->type=='fixed')
                            <span class="badge badge-primary">{{@$coupon->type}}</span>
                        @else
                            <span class="badge badge-warning">{{@$coupon->type}}</span>
                        @endif
                    </td>
                    <td>
                        @if(@$coupon->type=='fixed')
                            {{number_format(@$coupon->value,0)}} vnđ
                        @else
                            {{@$coupon->value}}%
                        @endif</td>
                    <td>
                        @if(@$coupon->status=='active')
                            <span class="badge badge-success">{{$coupon->status}}</span>
                        @else
                            <span class="badge badge-warning">{{$coupon->status}}</span>
                        @endif
                    </td>
                    <td>
                        <a href="{{route('coupon.edit',$coupon->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="Sửa" data-placement="bottom"><i class="fas fa-edit"></i></a>
                        <form method="POST" action="{{route('coupon.destroy',[$coupon->id])}}">
                          @csrf
                          @method('delete')
                              <button class="btn btn-danger btn-sm dltBtn" data-id={{$coupon->id}} style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                        </form>
                    </td>

                </tr>
            @endforeach
          </tbody>
        </table>
        <span style="float:right">{{$coupons->links()}}</span>
        @else
          <h6 class="text-center">Không tìm thấy mã giảm giá</h6>
        @endif
      </div>
    </div>
</div>
@endsection

@push('styles')
  <link href="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <style>
      div.dataTables_wrapper div.dataTables_paginate{
          display: none;
      }
      .zoom {
        transition: transform .2s; /* Animation */
      }

      .zoom:hover {
        transform: scale(3.2);
      }
  </style>
@endpush

@push('scripts')

  <!-- Page level plugins -->
  <script src="{{asset('backend/vendor/datatables/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="{{asset('backend/js/demo/datatables-demo.js')}}"></script>
  <script>

      $('#banner-dataTable').DataTable( {
            "columnDefs":[
                {
                    "orderable":false,
                    "targets":[4,5]
                }
            ]
        } );

        // Sweet alert

        function deleteData(id){

        }
  </script>
  <script>
    $(document).ready(function(){
      $.ajaxSetup({
          headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
      });
        $('.dltBtn').click(function(e){
          var form=$(this).closest('form');
            var dataID=$(this).data('id');
            // alert(dataID);
            e.preventDefault();
            swal({
                  title: "Bạn có muốn xóa dữ liệu?",
                  text: "Nếu bạn xóa, không thể phục hồi lại dữ liệu!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
              })
              .then((willDelete) => {
                  if (willDelete) {
                     form.submit();
                  } else {
                      swal("Dữ liệu an toàn!");
                  }
              });
        })
    })
</script>
@endpush
