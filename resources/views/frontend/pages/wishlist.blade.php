@extends('frontend.layouts.master')
@section('title','Aristino | Trang danh sách yêu thích')
@section('main-content')
	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="{{('home')}}">Trang chủ<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="javascript:void(0);">Yêu thích</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Shopping Cart -->
	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
					<!-- Shopping Summery -->
							@if(count(Helper::getAllProductFromWishlist()) > 0)
								@foreach(Helper::getAllProductFromWishlist() as $key=>$wishlist)
                                    <?php $product = $wishlist->product ?>
                                        <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item {{@$product->cat_id}}">
                                            <div class="single-product">
                                                <div class="product-img">
                                                    <a href="{{route('product-detail',$product->slug)}}">
                                                        @php
                                                            $photo=explode(',',@$product->photo);
                                                        // dd($photo);
                                                        @endphp
                                                        <img class="default-img" src="{{@$photo[0]}}" alt="{{@$photo[0]}}">
                                                        <img class="hover-img" src="{{@$photo[0]}}" alt="{{@$photo[0]}}">
                                                    </a>
                                                    <div class="button-head">
                                                        <div class="product-action-2">
                                                            <a title="Thêm giỏ hàng" href="{{route('add-to-cart',@$product->slug)}}">Thêm giỏ hàng</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-content">
                                                    <h3><a href="{{route('product-detail',@$product->slug)}}">{{@$product->title}}</a></h3>
                                                    <div class="product-price">
                                                        @php
                                                            $after_discount=(@$product->price-($product->price*$product->discount)/100);
                                                        @endphp
                                                        <span>{{number_format(@$after_discount,0)}} vnđ</span>
                                                        <del style="padding-left:4%;">{{number_format(@$product->price,0)}} vnđ</del>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
{{--										@php--}}
{{--											$photo=explode(',',$wishlist->product['photo']);--}}
{{--										@endphp--}}
{{--										<td class="image" data-title="No"><img src="{{$photo[0]}}" alt="{{$photo[0]}}"></td>--}}
{{--										<td class="product-des" data-title="Description">--}}
{{--											<p class="product-name"><a href="{{route('product-detail',$wishlist->product['slug'])}}">{{$wishlist->product['title']}}</a></p>--}}
{{--											<p class="product-des">{!!($wishlist['summary']) !!}</p>--}}
{{--										</td>--}}
{{--										<td class="total-amount" data-title="Total"><span>{{$wishlist['amount']}} vnđ</span></td>--}}
{{--										<td><a href="{{route('add-to-cart',$wishlist->product['slug'])}}" class='btn text-white'>Thêm vào giỏ hàng</a></td>--}}
{{--										<td class="action" data-title="Remove"><a href="{{route('wishlist-delete',$wishlist->id)}}"><i class="ti-trash remove-icon"></i></a></td>--}}
								@endforeach
							@else
								<div>
									<p class="text-center">
										Không có sản phẩm trong danh sách yêu thích. <a href="{{route('product-grids')}}" style="color:blue;">Tiếp tục mua sắm</a>
									</p>
								</div>
							@endif


						</tbody>
					</table>
					<!--/ End Shopping Summery -->
			</div>
		</div>
	</div>
	<!--/ End Shopping Cart -->

	<!-- Start Shop Services Area  -->
	<section class="shop-services section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>Miễn phí ship</h4>
						<p>Đơn hàng trên 10.000.000 vnđ</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>Miễn phí trả hàng</h4>
						<p>Trong vòng 30 ngày</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-lock"></i>
						<h4>Thanh toán an toàn</h4>
						<p>Thanh toán an toàn 100%</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>Giá tốt nhất</h4>
						<p>Giá đảm bảo</p>
					</div>
					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Newsletter -->

	@include('frontend.layouts.newsletter')



@endsection
@push('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
@endpush
