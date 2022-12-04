@extends('user.layouts.master')

@section('title','Chi tiết đơn hàng')

@section('main-content')
<div class="card">
  @if($order->status=='new')
    <!-- <h5 class="card-header">Đơn hàng<a href="{{route('order.pdf',$order->id)}}" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i> Xuất PDF</a> -->
  @elseif($order->status=='process')
    <h5 class="card-header">Đơn hàng<a href="{{route('order.pdf',$order->id)}}" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i> Xuất PDF</a>
  @elseif($order->status=='delivered')
    <h5 class="card-header">Đơn hàng<a href="{{route('order.pdf',$order->id)}}" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i> Xuất PDF</a>
  @else
    <span class="badge badge-danger">{{$order->status}}</span>
  @endif
<!-- <h5 class="card-header">Đơn hàng<a href="{{route('order.pdf',$order->id)}}" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i> Xuất PDF</a> -->
  </h5>
  <div class="card-body">
    @if($order)
    <table class="table table-striped table-hover">
      <thead>
        <tr>
            <th>ID</th>
            <th>Mã đơn hàng</th>
            <th>Tên khách hàng</th>
            <th>Email</th>
            <th>Tổng số lượng</th>
            <!-- <th>Phí vận chuyển</th> -->
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td>{{$order->id}}</td>
            <td>{{$order->order_number}}</td>
            <td>{{$order->first_name}} {{$order->last_name}}</td>
            <td>{{$order->email}}</td>
            <td>{{$order->quantity}}</td>
            <!-- <td>{{$order->price,0}} vnđ</td> -->
            <td>{{number_format($order->total_amount,0)}} vnđ</td>
            <td>
                @if($order->status=='new')
                    <span class="badge badge-primary">Đơn hàng mới</span>
                @elseif($order->status=='process')
                    <span class="badge badge-warning">Đang giao hàng</span>
                @elseif($order->status=='delivered')
                    <span class="badge badge-success">Đã giao hàng</span>
                @else
                    <span class="badge badge-danger">Đơn hàng đã bị hủy</span>
                @endif
            </td>


        </tr>
      </tbody>
    </table>

    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-4 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">THÔNG TIN ĐƠN HÀNG</h4>
              <table class="table">
                    <tr class="">
                        <td>Mã đơn hàng</td>
                        <td> : {{$order->order_number}}</td>
                    </tr>
                    <tr>
                        <td>Ngày đặt hàng</td>
                        <td> : {{$order->created_at->format('d/m/Y')}} lúc {{$order->created_at->format('H:i')}} </td>
                    </tr>

                    <tr>
                        <td>Tổng số lượng</td>
                        <td> : {{$order->quantity}}</td>
                    </tr>

                    <!-- <tr>
                      @php
                          $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
                      @endphp
                        <td>Phí vận chuyển</td>
                        <td>{{$order->price,0}} vnđ</td>
                    </tr> -->
                    <tr>
                        <td>Tổng tiền</td>
                        <td> : {{number_format($order->total_amount,0)}} vnđ</td>
                    </tr>
                    <tr>
                      <td>Phương thức thanh toán</td>
                      <td> : @if($order->payment_method=='cod') Thanh toán khi giao hàng @else Paypal @endif</td>
                    </tr>
                    <tr>
                        <td>Trạng thái thanh toán</td>
                        <td> : {{$order->payment_status}}</td>
                    </tr>
              </table>
            </div>
          </div>
            <div class="col-lg-4 col-lx-4">
                <div class="order-info">
                    <h4 class="text-center pb-4">Chi tiết sản phẩm</h4>
                    <table class="table">
                        @if(@$order->cart_info->isNotEmpty())
                            @foreach(@$order->cart_info as $cart_info_item)
                                <tr>
                                    <td>Tên sản phẩm:</td>
                                    <td>{{@$cart_info_item->product->title}}</td>
                                </tr>
                                <tr>
                                    <td>Số lượng:</td>
                                    <td>{{@$cart_info_item->quantity}}</td>
                                </tr>
                                <tr>
                                    <td>Đơn giá</td>
                                    <td>{{@$cart_info_item->price}}</td>
                                </tr>
                            @endforeach
                        @endif

                    </table>
                </div>
            </div>

          <div class="col-lg-4 col-lx-4">
            <div class="shipping-info">
              <h4 class="text-center pb-4">THÔNG TIN VẬN CHUYỂN</h4>
              <table class="table">
                    <tr class="">
                        <td>Tên đầy đủ</td>
                        <td> : {{$order->first_name}} {{$order->last_name}}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td> : {{$order->email}}</td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td> : {{$order->phone}}</td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td> : {{$order->address1}}, {{$order->address2}}</td>
                    </tr>
                    <tr>
                        <td>Quốc gia</td>
                        <td> : {{$order->country}}</td>
                    </tr>
                    <tr>
                        <td>Mã bưu điện</td>
                        <td> : {{$order->post_code}}</td>
                    </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    @endif

  </div>
</div>
@endsection

@push('styles')
<style>
    .order-info,.shipping-info{
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4,.shipping-info h4{
        text-decoration: underline;
    }

</style>
@endpush
