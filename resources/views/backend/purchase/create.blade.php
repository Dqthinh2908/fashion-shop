@extends('backend.layouts.master')

@section('main-content')
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    @if($is_update)
        <div class="card">
            <h5 class="card-header">Cập nhật sản phẩm trong kho hàng</h5>
            <div class="card-body">
                <form method="post" action="{{route('handleUpdatePurchase',['id'=>$data_product->id])}}">
                    @csrf
                    <div class="form-group col-xl-2 col-lg-2" style="padding:0">
                        <label for="inputTitle" class="col-form-label">Ngày nhập kho</label>
                        <input id="inputTitle" type="date" name="date_purcharse" value="{{@$data_purchare->date_import}}" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="inputEmail" class="col-form-label">Tên sản phẩm</label>
                        <input id="inputEmail" type="text" disabled   value="{{@$data_product->title}}" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-form-label">Ảnh sản phẩm</label>
                        <div>
                            <img src="{{@$data_product->photo}}" class="img-fluid zoom" style="max-width:200px" alt="{{@$data_product->photo}}">

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-form-label">Số lượng sản phẩm</label>
                        <input id="inputEmail" type="text" min="1" name="quantity" placeholder="Nhập số lượng"  value="{{@$data_purchare->quantity}}" class="form-control">

                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-form-label">Đơn giá (VNĐ)</label>
                        <input id="inputEmail" type="text" min="1" name="price" placeholder="Nhập số tiền"  value="{{@$data_purchare->price}}" class="form-control">

                    </div>

                    <button class="btn btn-success" type="submit">Cập nhật</button>
                </form>
            </div>
        </div>
    @else
<div class="card">
    <h5 class="card-header">Nhập kho hàng</h5>
    <div class="card-body">
      <form method="post" action="{{route('handleAddPurchase')}}">
        @csrf
          <div class="form-group col-lg-2" style="padding:0">
              <label for="inputTitle" class="col-form-label">Ngày nhập kho</label>
              <input id="inputTitle" type="date" name="date_purcharse" value="{{@@$date}}" class="form-control">
          </div>
          <input type="hidden" name="product_id" value="{{@$data_product->id}}">
          <div class="form-group">
              <label for="inputEmail" class="col-form-label">Tên sản phẩm</label>
              <input id="inputEmail" type="text" disabled placeholder="Nhập email"  value="{{@$data_product->title}}" class="form-control">
          </div>
          <div class="form-group">
              <label for="inputEmail" class="col-form-label">Ảnh sản phẩm</label>
              <div>
                  <img src="{{$data_product->photo}}" class="img-fluid zoom" style="max-width:200px" alt="{{$data_product->photo}}">
              </div>

          </div>
          <div class="form-group">
              <label for="inputEmail" class="col-form-label">Số lượng sản phẩm</label>
              <input id="inputEmail" type="text" min="1" required name="quantity" placeholder="Nhập số lượng"  value="" class="form-control">

          </div>
          <div class="form-group">
              <label for="inputEmail" class="col-form-label">Đơn giá (VNĐ)</label>
              <input id="inputEmail" type="text" min="1" step="any" required name="price" placeholder="Nhập số tiền"  value="" class="form-control">
          </div>
           <button class="btn btn-success" type="submit">Nhập kho</button>
      </form>
    </div>
</div>
@endif

@endsection

@push('styles')
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>
<script src="{{asset('backend/vendor/datepicker/bootstrap-datepicker.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

<script>
    $('#lfm').filemanager('image');

    $(document).ready(function() {
      $('#summary').summernote({
        placeholder: "Viết mô tả.....",
          tabsize: 2,
          height: 100
      });
    });

    $(document).ready(function() {
      $('#description').summernote({
        placeholder: "Viết mô tả chi tiết.....",
          tabsize: 2,
          height: 150
      });
    });
    $('.date-picker-end').datepicker({
        orientation: "bottom right",
        format: '<?php echo e('dd/mm/yyyy'); ?>',
        autoclose: true,
        todayBtn: false,
        todayHighlight: false,
        enableOnReadonly: true,
    }).on("changeDate", function (e) {
        $('.date-picker-start').datepicker({
            orientation: "left",
            format: '<?php echo e('dd/mm/yyyy'); ?>',
            autoclose: true,
            todayBtn: true,
            todayHighlight: true,
            endDate: e.date
        });
    });
    // $('select').selectpicker();

</script>

<script>
  $('#cat_id').change(function(){
    var cat_id=$(this).val();
    // alert(cat_id);
    if(cat_id !=null){
      // Ajax call
      $.ajax({
        url:"/admin/category/"+cat_id+"/child",
        data:{
          _token:"{{csrf_token()}}",
          id:cat_id
        },
        type:"POST",
        success:function(response){
          if(typeof(response) !='object'){
            response=$.parseJSON(response)
          }
          // console.log(response);
          var html_option="<option value=''>----Chọn danh mục----</option>"
          if(response.status){
            var data=response.data;
            // alert(data);
            if(response.data){
              $('#child_cat_div').removeClass('d-none');
              $.each(data,function(id,title){
                html_option +="<option value='"+id+"'>"+title+"</option>"
              });
            }
            else{
            }
          }
          else{
            $('#child_cat_div').addClass('d-none');
          }
          $('#child_cat_id').html(html_option);
        }
      });
    }
    else{
    }
  })
</script>
@endpush
