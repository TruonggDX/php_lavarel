@extends('shop_layout')
@section('content')

    <!--Page Banner Start-->
    <div class="page-banner" style="background-image: url(../public/kidolshop/images/banner/banner-shop.png)">
        <div class="container">
            <div class="page-banner-content text-center">
                <h2 class="title">Chi tiết sản phẩm</h2>
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="{{URL::to('/home')}}">Trang chủ</a></li>
                    <li class="breadcrumb-item">Chi tiết sản phẩm</li>
                </ol>
            </div>
        </div>
    </div>
    <!--Page Banner End-->

    <?php

    use App\Http\Controllers\ProductController;
    use Illuminate\Support\Facades\Session;

    $image = json_decode($product->ImageName)[0];
    $get_time_sale = ProductController::get_sale_pd($product->idProduct);
    $SalePrice = $product->Price;
    if ($get_time_sale) $SalePrice = $product->Price - ($product->Price / 100) * $get_time_sale->Percent;
    ?>

        <!--Shop Single Start-->
    <div class="shop-single-page section-padding-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="shop-image">
                        <div class="shop-single-preview-image">
                            <img class="product-zoom" src="{{asset('storage/kidoldash/images/product/'.$image)}}"
                                 alt="">

                            @if($get_time_sale)
                                @if($product->QuantityTotal == '0')
                                    <span class="sticker-new label-sale">HẾT HÀNG</span>
                                @else
                                    <span class="sticker-new label-sale">-{{$get_time_sale->Percent}}%</span>
                                @endif
                            @elseif($product->QuantityTotal == '0')
                                <span class="sticker-new label-sale">HẾT HÀNG</span>
                            @endif
                        </div>
                        <div id="gallery_01" class="shop-single-thumb-image shop-thumb-active swiper-container">
                            <div class="swiper-wrapper">
                                @foreach(json_decode($product->ImageName) as $img)
                                    <div class="swiper-slide single-product-thumb">
                                        <a class="active" href="#"
                                           data-image="{{asset('storage/kidoldash/images/product/'.$img)}}">
                                            <img src="{{asset('storage/kidoldash/images/product/'.$img)}}" alt="">
                                        </a>
                                    </div>
                                @endforeach
                            </div>

                            <!-- Add Arrows -->
                            <div class="swiper-thumb-next"><i class="fa fa-angle-right"></i></div>
                            <div class="swiper-thumb-prev"><i class="fa fa-angle-left"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shop-single-content">
                        <h3 class="title">{{$product->ProductName}}</h3>
                        <span class="product-sku">Mã sản phẩm: <span>{{$product->idProduct}}</span></span>
                        <div class="text-primary">Đã Bán: {{$product->Sold}} sản phẩm</div>
                        <div class="text-primary">Còn Lại: {{$product->QuantityTotal}} sản phẩm</div>
                        <div class="text-primary">Lượt Yêu Thích: {{$count_wish}} </div>
                        <!-- <div class="product-rating">
                            <ul class="rating-star">
                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                            </ul>
                            <span>No reviews</span>
                        </div> -->
                        <div class="thumb-price">
                            @if($SalePrice < $product->Price)
                                <span class="old-price">{{number_format($product->Price,0,',','.')}}đ</span>
                                <span class="current-price">{{number_format(round($SalePrice,-3),0,',','.')}}đ</span>
                                <span class="discount">-{{$get_time_sale->Percent}}%</span>
                            @else
                                <span class="current-price">{{number_format($product->Price,0,',','.')}}đ</span>
                            @endif
                        </div>
                        <div>{!!$product->ShortDes!!}</div>

                        <div class="shop-single-material pt-3">
                            <div class="material-title col-lg-2">{{$name_attribute->AttributeName}}:</div>
                            <ul class="material-list">
                                @foreach($list_pd_attr as $key => $pd_attr)
                                    <li>
                                        <div class="material-radio">
                                            <input type="radio" value="{{$pd_attr->idProAttr}}" class="AttrValName"
                                                   name="material" id="{{$pd_attr->idProAttr}}"
                                                   data-name="{{$pd_attr->AttrValName}}"
                                                   data-qty="{{$pd_attr->Quantity}}">
                                            <label for="{{$pd_attr->idProAttr}}">{{$pd_attr->AttrValName}}</label>
                                        </div>
                                    </li>
                                @endforeach
                            </ul>
                        </div>

                        <div class="mt-20 qty-of-attr-label">Còn Lại: {{$name_attribute->Quantity}}</div>

                        <form method="POST">
                            @csrf
                            <div class="product-quantity d-flex flex-wrap align-items-center pt-30">
                                <span class="quantity-title">Số Lượng: </span>
                                <div class="quantity d-flex align-items-center">
                                    <button type="button" class="sub-qty"><i class="ti-minus"></i></button>
                                    <input type="number" class="qty-buy" name="qty_buy" value="1"/>
                                    <button type="button" class="add-qty"><i class="ti-plus"></i></button>
                                </div>
                            </div>

                            <input type="hidden" name="idProduct" id="idProduct" value="{{$product->idProduct}}">
                            <input type="hidden" name="PriceNew" id="PriceNew" value="{{round($SalePrice,-3)}}">
                            <input class="qty-of-attr" name="qty_of_attr" type="hidden"
                                   value="{{$name_attribute->Quantity}}">

                            <input type="hidden" id="AttributeName" name="AttributeName"
                                   value="{{$name_attribute->AttributeName}}">
                            <input type="hidden" id="AttributeProduct" name="AttributeProduct">
                            <input type="hidden" id="idProAttr" name="idProAttr">

                            <div class="text-primary alert-qty"></div>

                            <div class="product-action d-flex flex-wrap">
                                <div class="action">
                                    <button type="button" class="btn btn-primary add-to-cart">Thêm vào giỏ hàng</button>
                                </div>
                                <div class="action">
                                    <a class="add-to-wishlist" data-id="{{$product->idProduct}}" data-tooltip="tooltip"
                                       data-placement="right" title="Thêm vào yêu thích"><i class="fa fa-heart"></i></a>
                                </div>
                            </div>
                            <div class="text-primary alert-add-to-cart"></div>

                            <div class="dynamic-checkout-button">
                                <!-- <div class="checkout-checkbox">
                                    <input type="checkbox" id="disabled">
                                    <label for="disabled"><span></span> I agree with the terms and conditions </label>
                                </div> -->
                                <div class="checkout-btn">
                                    <input type="submit" formaction="{{URL::to('/buy-now')}}"
                                           class="btn btn-primary buy-now" value="Mua ngay"/>
                                    <!-- <button type="button" class="btn btn-primary buy-now">Mua ngay</button> -->
                                </div>
                            </div>
                            <div class="text-primary alert-buy-now"></div>
                            <?php
                            $error = Session::get('error');
                            if ($error) {
                                echo '<div class="text-danger">' . $error . '</div>';
                                Session::put('error', null);
                            }
                            ?>
                        </form>
                    </div>
                </div>
            </div>
            <!--Shop Single End-->


            <!--Shop Single info Start-->
            <div class="shop-single-info">
                <div class="shop-info-tab">
                    <ul class="nav justify-content-center" role="tablist">
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab1" role="tab">Mô
                                tả/Chi tiết</a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab2" role="tab">Đánh giá</a>
                        </li>
                    </ul>
                </div>

                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                        <div class="description">
                            <p>{!!$product->DesProduct!!}</p>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                        <div class="reviews">
                            <h3 class="review-title">Đánh giá của khách hàng</h3>

                            <ul class="reviews-items" id="review-list">
                                <li><p class="loading">Đang tải đánh giá...</p></li>
                            </ul>


                            <style>
                                .star-rating {
                                    display: flex;
                                    flex-direction: row-reverse; /* Đảo ngược vị trí sao */
                                    justify-content: flex-start;
                                    gap: 5px;
                                }

                                .star-rating input {
                                    display: none; /* Ẩn input radio */
                                }

                                .star-rating label {
                                    font-size: 25px;
                                    color: #ccc; /* Màu sao mặc định */
                                    cursor: pointer;
                                    transition: color 0.3s;
                                }

                                /* Hiển thị sao màu vàng khi được chọn */
                                .star-rating input:checked ~ label,
                                .star-rating label:hover,
                                .star-rating label:hover ~ label {
                                    color: gold;
                                }
                                .star{
                                    min-width: 50px;
                                }
                            </style>
                            <div class="reviews-form">

                                @if(Session::has('idCustomer') && $hasPurchased)
                                    <form action="{{ route('comment.add') }}" method="POST">
                                        @csrf
                                        <input type="hidden" name="idProduct" value="{{ $product->idProduct }}">
                                        <input type="hidden" name="idCustomer" value="{{ Session::get('idCustomer') }}">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="reviews-rating">
                                                    <label>Số sao</label>
                                                    <div class="star-rating">
                                                        @for ($i = 5; $i >= 1; $i--)
                                                            <input type="radio" id="star{{ $i }}" name="Rating" value="{{ $i }}" {{ $i == 5 ? 'checked' : '' }}>
                                                            <label for="star{{ $i }}"><i class="fa fa-star"></i></label>
                                                        @endfor
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <label>Nội dung đánh giá</label>
                                                    <textarea name="Comment" class="form-control" placeholder="Viết đánh giá của bạn ..." required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <button type="submit" class="btn btn-dark">Đánh giá</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                @else
                                    <p class="text-danger">Bạn chỉ có thể đánh giá khi đã mua sản phẩm này.</p>
                                @endif

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Chỉnh Sửa Bình Luận -->
    <div id="customEditModal" class="custom-modal">
        <div class="custom-modal-content">
            <span class="custom-close">&times;</span>
            <h2>Chỉnh sửa bình luận</h2>
            <input type="hidden" id="editCommentId">

            <div class="rating-stars">
                <span class="star" data-value="1">★</span>
                <span class="star" data-value="2">★</span>
                <span class="star" data-value="3">★</span>
                <span class="star" data-value="4">★</span>
                <span class="star" data-value="5">★</span>
            </div>

            <textarea id="editCommentText" placeholder="Nhập bình luận..."></textarea>
            <button id="saveComment">Lưu</button>
        </div>
    </div>

    <!-- CSS -->
    <style>
        /* Overlay Modal */
        .custom-modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        /* Nội dung Modal */
        .custom-modal-content {
            background: white;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
            text-align: center;
        }

        /* Nút Đóng */
        .custom-close {
            position: absolute;
            right: 15px;
            top: 10px;
            cursor: pointer;
            font-size: 20px;
        }

        /* Ngôi sao đánh giá */
        .rating-stars {
            display: flex;
            justify-content: center;
            margin: 10px 0;
        }

        .star {
            font-size: 24px;
            cursor: pointer;
            color: #ccc;
            transition: color 0.3s;
        }

        .star.active {
            color: #FFD700; /* Màu vàng */
        }

        /* Textarea */
        #editCommentText {
            width: 100%;
            height: 80px;
            margin: 10px 0;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Nút Lưu */
        #saveComment {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        #saveComment:hover {
            background-color: #0056b3;
        }
    </style>

    <!--Shop Single End-->

    <!--New Product Start-->
    @if($list_related_product->count() > 0)
        <div class="new-product-area section-padding-2">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-9 col-sm-11">
                        <div class="section-title text-center">
                            <h2 class="title">Sản Phẩm Liên Quan</h2>
                            <p>A perfect blend of creativity, energy, communication, happiness and love. Let us arrange
                                a smile for you.</p>
                        </div>
                    </div>
                </div>
                <div class="product-wrapper">
                    <div class="swiper-container product-active">
                        <div class="swiper-wrapper">
                            @foreach($list_related_product as $key => $related_product)
                                <div class="swiper-slide">
                                    <div class="single-product">
                                        <div class="product-image">
                                                <?php $image = json_decode($related_product->ImageName)[0]; ?>
                                            <a href="{{URL::to('/shop-single/'.$related_product->ProductSlug)}}">
                                                <img src="{{asset('storage/kidoldash/images/product/'.$image)}}" alt="">
                                            </a>

                                                <?php
                                                $SalePrice = $related_product->Price;
                                                $get_time_sale = ProductController::get_sale_pd($related_product->idProduct);
                                                ?>

                                            @if($get_time_sale)
                                                    <?php $SalePrice = $related_product->Price - ($related_product->Price / 100) * $get_time_sale->Percent; ?>
                                                <div class="product-countdown">
                                                    <div data-countdown="{{$get_time_sale->SaleEnd}}"></div>
                                                </div>
                                                @if($related_product->QuantityTotal == '0')
                                                    <span class="sticker-new soldout-title">Hết hàng</span>
                                                @else
                                                    <span
                                                        class="sticker-new label-sale">-{{$get_time_sale->Percent}}%</span>
                                                @endif
                                            @elseif($related_product->QuantityTotal == '0')
                                                <span class="sticker-new soldout-title">Hết hàng</span>;
                                            @endif

                                            <div class="action-links">
                                                <ul>
                                                    <!-- <li><a class="AddToCart-Single" data-id="{{$related_product->idProduct}}" data-PriceNew="{{$SalePrice}}" data-token="{{csrf_token()}}" data-tooltip="tooltip" data-placement="left" title="Thêm vào giỏ hàng"><i class="icon-shopping-bag"></i></a></li> -->
                                                    <li><a class="add-to-compare"
                                                           data-idcat="{{$related_product->idCategory}}"
                                                           id="{{$related_product->idProduct}}" data-tooltip="tooltip"
                                                           data-placement="left" title="So sánh"><i
                                                                class="icon-sliders"></i></a></li>
                                                    <li><a class="add-to-wishlist"
                                                           data-id="{{$related_product->idProduct}}"
                                                           data-tooltip="tooltip" data-placement="left"
                                                           title="Thêm vào danh sách yêu thích"><i
                                                                class="icon-heart"></i></a></li>
                                                    <li><a class="quick-view-pd"
                                                           data-id="{{$related_product->idProduct}}"
                                                           data-tooltip="tooltip" data-placement="left"
                                                           title="Xem nhanh"><i class="icon-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-content text-center">
                                            <!-- <ul class="rating">
                                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                            </ul> -->
                                            <h4 class="product-name"><a
                                                    href="{{URL::to('/shop-single/'.$related_product->ProductSlug)}}">{{$related_product->ProductName}}</a>
                                            </h4>
                                            <div class="price-box">
                                                @if($SalePrice < $related_product->Price)
                                                    <span class="old-price">{{number_format($related_product->Price,0,',','.')}}đ</span>
                                                    <span class="current-price">{{number_format(round($SalePrice,-3),0,',','.')}}đ</span>
                                                @else
                                                    <span class="current-price">{{number_format($related_product->Price,0,',','.')}}đ</span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>

                        <!-- Add Arrows -->
                        <div class="swiper-next"><i class="fa fa-angle-right"></i></div>
                        <div class="swiper-prev"><i class="fa fa-angle-left"></i></div>
                    </div>
                </div>
            </div>
        </div>
    @endif


    <div id="modal-AddToCart">

    </div>

    <!--Brand Start-->
    <div class="brand-area">
        <div class="container">
            <div class="brand-active swiper-container">
                <div class="swiper-wrapper">
                    <div class="single-brand swiper-slide">
                        <img src="{{asset('public/kidolshop/images/brand/brand-1.jpg')}}" alt="">
                    </div>
                    <div class="single-brand swiper-slide">
                        <img src="{{asset('public/kidolshop/images/brand/brand-2.jpg')}}" alt="">
                    </div>
                    <div class="single-brand swiper-slide">
                        <img src="{{asset('public/kidolshop/images/brand/brand-3.jpg')}}" alt="">
                    </div>
                    <div class="single-brand swiper-slide">
                        <img src="{{asset('public/kidolshop/images/brand/brand-4.jpg')}}" alt="">
                    </div>
                    <div class="single-brand swiper-slide">
                        <img src="{{asset('public/kidolshop/images/brand/brand-5.jpg')}}" alt="">
                    </div>
                    <div class="single-brand swiper-slide">
                        <img src="{{asset('public/kidolshop/images/brand/brand-6.jpg')}}" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Brand End-->

    <!-- Validate QuantityBuy & Add To Cart & Buy Now -->
    <script>
        $(document).ready(function () {
            var idCustomer = '<?php echo Session::get('idCustomer'); ?>';
            var $Quantity = parseInt($('.qty-of-attr').val());
            $("input:radio[name=material]:first").attr('checked', true);
            $('#idProAttr').val($("input:radio[name=material]:first").val());

            var AttributeProduct = $('#AttributeName').val() + ': ' + $('.AttrValName').data("name");
            $('#AttributeProduct').val(AttributeProduct);

            $("input:radio[name=material]").on('click', function () {
                $(".qty-buy").val("1");
                $('.alert-qty').html("");
                $('.alert-add-to-cart').html("");
                $('.alert-buy-now').html("");
                $idAttribute = $(this).attr("id");
                $AttrValName = $(this).data("name");
                $Quantity = $(this).data("qty");
                $('.qty-of-attr-label').html("Còn Lại: " + $Quantity);
                $('.qty-of-attr').val($Quantity);

                AttributeProduct = $('#AttributeName').val() + ': ' + $AttrValName;
                $('#AttributeProduct').val(AttributeProduct);

                $('#idProAttr').val($("#" + $idAttribute).val());
            });

            $('.add-qty').on('click', function () {
                var $input = $(this).prev();
                var currentValue = parseInt($input.val());
                if (currentValue >= $Quantity) {
                    $('.alert-qty').html("Vượt quá số lượng sản phẩm hiện có!");
                } else {
                    $input.val(currentValue + 1);
                }
            });

            $('.sub-qty').on('click', function () {
                var $input = $(this).next();
                var currentValue = parseInt($input.val());
                (currentValue == 1) ? currentValue : $input.val(currentValue - 1);
            });

            $('.buy-now').on('click', function (e) {
                if ($(".qty-buy").val() > $Quantity) {
                    $('.alert-buy-now').html("Vượt quá số lượng sản phẩm hiện có!");
                    e.preventDefault();
                }
            });

            $('.add-to-cart').on('click', function () {
                if (idCustomer == "") {
                    window.location.href = '../login';
                } else if ($(".qty-buy").val() > $Quantity) {
                    $('.alert-add-to-cart').html("Vượt quá số lượng sản phẩm hiện có!");
                } else {
                    var idProduct = $('#idProduct').val();
                    var AttributeProduct = $('#AttributeProduct').val();
                    var QuantityBuy = $('.qty-buy').val();
                    var PriceNew = $('#PriceNew').val();
                    var _token = $('input[name="_token"]').val();
                    var qty_of_attr = $('.qty-of-attr').val();
                    var idProAttr = $('#idProAttr').val();

                    $.ajax({
                        url: '{{url("/add-to-cart")}}',
                        method: 'POST',
                        data: {
                            idProduct: idProduct,
                            idProAttr: idProAttr,
                            AttributeProduct: AttributeProduct,
                            QuantityBuy: QuantityBuy,
                            PriceNew: PriceNew,
                            qty_of_attr: qty_of_attr,
                            _token: _token
                        },
                        success: function (data) {
                            $('#modal-AddToCart').html(data);
                            $('.modal-AddToCart').modal('show');
                        }
                    });
                }
            });
        });

    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const stars = document.querySelectorAll(".reviews-rating .star");
            const ratingValue = document.getElementById("ratingValue");

            stars.forEach(star => {
                star.addEventListener("click", function () {
                    const value = this.getAttribute("data-value");
                    ratingValue.value = value;

                    stars.forEach(s => s.querySelector("i").classList.replace("fa-star", "fa-star-o"));
                    for (let i = 0; i < value; i++) {
                        stars[i].querySelector("i").classList.replace("fa-star-o", "fa-star");
                    }
                });
            });
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let productName = "{{ $product->ProductName }}";
            let encodedName = btoa(encodeURIComponent(productName)); // Mã hóa tên sản phẩm

            let apiUrl = `/api/product/${encodedName}/comments`;

            fetch(apiUrl)
                .then(response => response.json())
                .then(data => {
                    console.log('da', data)
                    let reviewList = document.getElementById("review-list");
                    reviewList.innerHTML = ""; // Xóa nội dung loading

                    if (data.length === 0) {
                        reviewList.innerHTML = "<li><p class='no-comments'>Chưa có đánh giá nào.</p></li>";
                        return;
                    }

                    data.forEach(comment => {
                        let stars = "";
                        for (let i = 1; i <= 5; i++) {
                            stars += `<li class="${i <= comment.Rating ? 'rating-on' : ''}"><i class="fa fa-star"></i></li>`;
                        }

                        let commentHtml = `
                <li id="comment-${comment.idView}">
                    <div class="single-review">
                        <div class="rating-date">
                            <ul class="rating">${comment.username}</ul>
                            <span class="date">${new Date(comment.created_at).toLocaleDateString()}</span>
                        </div>
                        <div class="rating-date">
                            <ul class="rating">${stars}</ul>
                        </div>
                        <p id="comment-text-${comment.idView}">${comment.Comment}</p>
                         @if(Session::has('idCustomer'))
                        <div class="review-actions">
                    <button class="edit-comment" data-id="${comment.idView}">✏️ Chỉnh sửa</button>
                            <button class="delete-comment" data-id="${comment.idView}">🗑 Xóa</button>
                        </div>
                          @endif
                        </div>
                    </li>`;
                        reviewList.innerHTML += commentHtml;
                    });
                    const modal = document.getElementById("customEditModal");
                    const closeBtn = document.querySelector(".custom-close");
                    const saveBtn = document.getElementById("saveComment");
                    const stars = document.querySelectorAll(".star");

                    // Mở Modal khi nhấn nút chỉnh sửa
                    document.querySelectorAll(".edit-comment").forEach(button => {
                        button.addEventListener("click", function () {
                            let commentId = this.getAttribute("data-id");
                            let commentText = document.getElementById(`comment-text-${commentId}`).innerText;

                            document.getElementById("editCommentId").value = commentId;
                            document.getElementById("editCommentText").value = commentText;

                            // Lấy số sao từ bình luận
                            let ratingStars = document.querySelectorAll(`#comment-${commentId} .rating li.rating-on`).length;
                            highlightStars(ratingStars);

                            modal.style.display = "flex";
                        });
                    });

                    // Đóng Modal khi nhấn nút X
                    closeBtn.addEventListener("click", function () {
                        modal.style.display = "none";
                    });

                    // Đóng Modal khi nhấn ngoài modal
                    window.addEventListener("click", function (e) {
                        if (e.target === modal) {
                            modal.style.display = "none";
                        }
                    });

                    // Xử lý chọn số sao
                    stars.forEach(star => {
                        star.addEventListener("click", function () {
                            let value = this.getAttribute("data-value");
                            highlightStars(value);
                        });
                    });

                    // Hàm làm nổi bật số sao đã chọn
                    function highlightStars(count) {
                        stars.forEach(star => star.classList.remove("active"));
                        for (let i = 0; i < count; i++) {
                            stars[i].classList.add("active");
                        }
                    }

                    // Xử lý lưu bình luận
                    saveBtn.addEventListener("click", function () {
                        let commentId = document.getElementById("editCommentId").value;
                        let commentText = document.getElementById("editCommentText").value;
                        let rating = document.querySelectorAll(".star.active").length;

                        fetch(`/api/comments/${commentId}`, {
                            method: "PUT",
                            headers: {
                                "Content-Type": "application/json"
                            },
                            body: JSON.stringify({ comment: commentText, rating: rating })
                        })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    alert("Cập nhật thành công!");
                                    document.getElementById(`comment-text-${commentId}`).innerText = commentText;
                                    modal.style.display = "none";
                                    location.reload(); // Tải lại trang để cập nhật
                                } else {
                                    alert("Cập nhật thất bại!");
                                }
                            })
                            .catch(error => console.error("Lỗi khi cập nhật bình luận:", error));
                    });
                    document.querySelectorAll(".delete-comment").forEach(button => {
                        button.addEventListener("click", function () {
                            let commentId = this.getAttribute("data-id");
                            if (confirm("Bạn có chắc chắn muốn xóa bình luận này không?")) {
                                deleteComment(commentId);
                            }
                        });
                    });
                })
                .catch(error => {
                    console.error("Lỗi khi tải đánh giá:", error);
                    document.getElementById("review-list").innerHTML = "<li><p class='error'>Lỗi khi tải đánh giá!</p></li>";
                });
        });

        function deleteComment(commentId) {
            fetch(`/api/comments/${commentId}`, {
                method: "DELETE"
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        document.getElementById(`comment-${commentId}`).remove();
                        alert("Bình luận đã được xóa!");
                    } else {
                        alert("Xóa thất bại!");
                    }
                })
                .catch(error => console.error("Lỗi khi xóa bình luận:", error));
        }

        //////
    </script>
@endsection
