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
      <h6 class="m-0 font-weight-bold text-primary float-left">Danh sách sản phẩm</h6>
      <a href="{{route('product.create')}}" class="btn btn-primary btn-sm float-right" data-toggle="tooltip" data-placement="bottom" title="Thêm sản phẩm"><i class="fas fa-plus"></i> Thêm sản phẩm</a>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        @if(count($products)>0)
        <table class="table table-bordered" id="product-dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>STT</th>
              <th>Tiêu đề</th>
              <th>Danh mục</th>
              <th>Là danh mục cha?</th>
              <th>Giá</th>
              <th>Giảm giá</th>
              <th>Size</th>
              <th>Tình trạng</th>
              <th>Thương hiệu</th>
              <th>Số lượng</th>
              <th>Ảnh</th>
              <th>Trạng thái</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1 ?>
            @foreach($products as $product)
              @php
              $sub_cat_info=DB::table('categories')->select('title')->where('id',$product->child_cat_id)->get();
              // dd($sub_cat_info);
              $brands=DB::table('brands')->select('title')->where('id',$product->brand_id)->get();
              @endphp
                <tr>
                    <td>{{$i++}}</td>
                    <td>{{$product->title}}</td>
                    <td>{{$product->cat_info['title']}}
                      <sub>
                          {{$product->sub_cat_info->title ?? ''}}
                      </sub>
                    </td>
                    <td>{{(($product->is_featured==1)? 'Có': 'Không')}}</td>
                    {{-- <td>{{$product->price}} vnđ</td> --}}
                    <td>{{number_format($product['price'],0)}} vnđ</td>
                    <td>{{$product->discount}}% OFF</td>
                    <td>{{$product->size}}</td>
                    <td>{{$product->condition}}</td>
                    <td> {{ucfirst($product->brand->title)}}</td>
                    <td>
                      @if(isset($product->purchase) && @$product->purchase->quantity > 0)
                      <span class="badge badge-primary">{{@$product->purchase->quantity}}</span>
                      @else
                      <span class="badge badge-danger">Hết hàng</span>
                      @endif
                    </td>
                    <td>
                        @if($product->photo)
                            @php
                              $photo=explode(',',$product->photo);
                              // dd($photo);
                            @endphp
                            <img src="{{$photo[0]}}" class="img-fluid zoom" style="max-width:80px" alt="{{$product->photo}}">
                        @else
                            <img src="{{asset('backend/img/thumbnail-default.jpg')}}" class="img-fluid" style="max-width:80px" alt="avatar.png">
                        @endif
                    </td>
                    <td>
                        @if($product->status=='active')
                            <span class="badge badge-success">{{$product->status}}</span>
                        @else
                            <span class="badge badge-warning">{{$product->status}}</span>
                        @endif
                    </td>
                    <td>
                        <a href="{{route('product.edit',$product->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:26px; width:26px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i style="font-size: 13px;margin-left: -3px" class="fas fa-edit"></i></a>
                    <form method="POST" action="{{route('product.destroy',[$product->id])}}">
                      @csrf
                      @method('delete')
                          <button class="btn btn-danger btn-sm dltBtn" data-id={{$product->id}} style="height:26px; width:26px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i style="font-size: 13px;margin-left: -3px" class="fas fa-trash-alt"></i></button>
                        </form>
                        <a href="{{route('showPurchaseAdd',$product->id)}}" class="btn btn-warning btn-sm float-left mr-1" style="height:26px; width:26px;border-radius:50%" data-toggle="tooltip" title="Nhập hàng" data-placement="bottom"><i style="font-size: 13px;margin-left: -3px" class="fas fa-edit"></i></a>
                    </td>
                </tr>
            @endforeach
          </tbody>
        </table>
        <span style="float:right">{{$products->links()}}</span>
        @else
          <h6 class="text-center">Không tìm thấy sản phẩm!</h6>
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
        transform: scale(5);
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

      $('#product-dataTable').DataTable( {
          "columnDefs":[
              {
                  "orderable":true,
                  "targets":[10]
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
                  title: "Bạn có muốn xóa sản phẩm?",
                  text: "Nếu bạn xóa, không thể phục hồi lại dữ liệu!",
                  icon: "warning",
                  dangerMode: true,
                buttons: true,

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
