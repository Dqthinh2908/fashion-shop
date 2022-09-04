@extends('frontend.layouts.master')

@section('title','Aristino | Về chúng tôi')

@section('main-content')

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">Trang chủ<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">Về chúng tôi</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- About Us -->
	<section class="about-us section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-12">
						<div class="about-content">
							@php
								$settings=DB::table('settings')->get();
							@endphp
							<h3>Chào mừng bạn đến với <span>Aristino</span></h3>
							<h7 style="font-weight: bold">TỪ NHỎ ĐẾN LỚN <br>
								TỪ TỐT ĐẾN VĨ ĐẠI <br></h7>
							<p>
								Thành công của người đàn ông bắt đầu từ những điều nhỏ bé <br>
								Chặng đường chinh phục làng thời trang của Aristino cũng khởi đầu từ những bước đi nhỏ.<br>	
								Từ bàn chải đến chiếc quần sịp nam giới đầu tiên <br>
								Năm 2012, kinh tế toàn cầu suy thoái, màu đen ảm đạm phủ kín bức tranh kinh tế trong nước và thế giới. Giữa khó khăn và biến động, anh Tăng Văn Khanh - CEO Aristino hiện tại vẫn quyết định bắt đầu hành trình khởi nghiệp của mình với thương hiệu bàn chải Bizs+. <br>
								Bizs+ ra đời với khát khao mang đến sản phẩm tiêu dùng chất lượng cao do người Việt, cho người Việt. Trên hành trình đó, anh Khanh nhìn thấy những giá trị tiềm năng của thị trường thời trang, đặc biệt đối với sản phẩm đồ lót cho nam giới. <br>
								Ở thời điểm đó, 82% thị phần đồ lót tại Việt Nam bị chiếm lĩnh bởi các sản phẩm nhập khẩu tiểu ngạch kém chất lượng, trong khi đại bộ phận người Việt khó lòng “chạm” tới những sản phẩm cao cấp hơn. Và thương hiệu Aristino đã ra đời với dòng sản phẩm đầu tiên - quần sịp cho nam giới, bước đầu trên hành trình chinh phục thị trường thời trang Việt. <br>
								Từ những sản phẩm đầu tay được mang đi “chào hàng” tại các shop nhỏ lẻ, cho tới  Showroom nội y đầu tiên khai trương ở Times City, Aristino đã có một bước tiến dài bằng sự tâm huyết và kiên định của người sáng lập cùng các cộng sự của anh.<br> 						
								Từ quần sịp đến sứ mệnh “làm đẹp” cho nam giới Việt<br>
								Từ thành công đầu tiên với dòng sản phẩm đơn giản nhưng cần thiết đối với nam giới, Aristino tiếp tục lắng nghe, thấu hiểu để đồng hành cùng đàn ông Việt trong công cuộc làm đẹp, đáp ứng tới những nhu cầu nhỏ nhất. Các dòng sản phẩm áo thun, áo sơ mi, quần âu, quần kaki, phụ kiện... lần lượt được cho ra đời, mang tới cho nam giới Việt những “giải pháp ăn mặc” ưu việt và toàn diện.<br>
								Với tầm nhìn trở thành công ty thời trang có quy mô lớn nhất Việt Nam, chúng tôi không ngừng nghiên cứu chuyên sâu về công nghệ tạo nên chất lượng sản phẩm, nắm giữ và làm chủ chuỗi giá trị cốt lõi. Phương châm của Aristino là lấy khách hàng làm trung tâm, mang đến dịch vụ từ trái tim.	
								Cho tới hiện tại, Aristino đã xây dựng một hệ thống phân phối sản phẩm lớn mạnh với hơn gần 60 Showroom và hàng trăm điểm bán trên cả nước, vì vậy chúng tôi tin rằng tầm nhìn đó vẫn đang được hiện thực hóa mỗi ngày.<br>								
								Sự chuyển mình mạnh mẽ trong hành trình tạo nên “Dấu ấn Việt Nam” trong thời trang<br>
								Với định vị là thương hiệu “Made in Việt Nam”, sản phẩm Aristino sử dụng chất liệu thiên nhiên và đặc biệt chú trọng thiết kế phom dáng phù hợp cho hình thể người Việt.<br>
								Năm 2020 tiếp tục đánh dấu sự chuyển mình mạnh mẽ của thương hiệu Aristino về tầm nhìn và sứ mệnh. Ngoài việc giúp người Việt Nam trở nên phong cách, tự tin hơn, Aristino còn mong muốn đánh thức niềm tự hào, tình yêu quê hương, đất nước, bằng việc phát triển và nâng tầm phong cách quý ông qua những thiết kế hiện đại, tinh tế, lịch lãm, phong cách châu Âu nhưng được lấy cảm hứng từ chính đất nước con người Việt.<br>  
								Giống như hình ảnh người đàn ông không ngừng phấn đấu phát triển sự nghiệp, đại bàng Aristino cũng không ngừng “lột xác” và chuyển mình để sẵn sàng “sải cánh vươn tầm” thế giới.
								“Kẻ thù của tốt là vĩ đại”, không chỉ dừng lại ở việc xác lập vị thế trong nước, Aristino còn tham vọng dấn thân vào thị trường thời trang thế giới. Trong đó xác định 2 hướng đi quan trọng: Một là, nhạy bén trong tư duy thiết kế và đón đầu các xu hướng mới phù hợp với dòng chảy thời trang. Hai là, bắt tay với các nhà thiết kế và thương hiệu đẳng cấp thế giới để mang đến những bộ sưu tập không chỉ chất lượng cho người tiêu dùng mà còn chinh phục được hoàn toàn giới mộ điệu.</p>
							<div class="button">
								<a href="{{route('blog')}}" class="btn">Bài viết của chúng tôi</a>
								<a href="{{route('contact')}}" class="btn primary">Liên hệ</a>
							</div>
						</div>
					</div>
					{{-- <div class="col-lg-6 col-12">
						<div class="about-img overlay">
							<img src="" alt="@foreach($settings as $data) {{$data->photo}} @endforeach">
						</div>
					</div> --}}
				</div>
			</div>
	</section>
	<!-- End About Us -->


	<!-- Start Shop Services Area -->
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
	<!-- End Shop Services Area -->

	@include('frontend.layouts.newsletter')
@endsection
