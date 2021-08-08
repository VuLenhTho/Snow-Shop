<%@ page import="com.vulenhtho.snow.util.SecurityUtil" %>
<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/web/head-new.jsp" %>

</head>

<body id="body" style="font-family: Helvetica,Arial">

<%@include file="/common/web/header-new.jsp" %>

<div class="hero-slider">
    <div class="slider-item th-fullpage hero-area" style="background-image: url('/aviato/images/slider/slider-1.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 text-center">
                    <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">Snow shop</p>
                    <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">Vẻ đẹp tiềm ẩn<br> trong
                        từng chi tiết.</h1>
                    <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn"
                       href="/products">Xem ngay</a>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-item th-fullpage hero-area" style="background-image: url('/aviato/images/slider/slider-3.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 text-left">
                    <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">Snow shop</p>
                    <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">Vẻ đẹp tiềm ẩn<br> trong
                        từng chi tiết.</h1>
                    <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn"
                       href="/products">Xem ngay</a>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-item th-fullpage hero-area" style="background-image: url('/aviato/images/slider/slider-2.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 text-right">
                    <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">Snow shop</p>
                    <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">Vẻ đẹp tiềm ẩn<br> trong
                        từng chi tiết.</h1>
                    <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn"
                       href="/products">Xem ngay</a>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="product-category section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title text-center">
                    <h2>Danh mục sản phẩm</h2>
                </div>
            </div>
            <div class="col-md-6">
                <div class="category-box">
                    <a href="/products">
                        <img src="/aviato/images/shop/category/category-1.jpg" alt=""/>
                        <div class="content">
                            <h3>Sản phẩm khuyến mại</h3>
                            <p>Săn ngay HOT deal!!!</p>
                        </div>
                    </a>
                </div>
                <div class="category-box">
                    <a href="/products">
                        <img src="/aviato/images/shop/category/category-2.jpg" alt=""/>
                        <div class="content">
                            <h3>Style chất</h3>
                            <p>Thể hiện cá tính của riêng bạn</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="category-box category-box-2">
                    <a href="/products">
                        <img src="/aviato/images/shop/category/category-3.jpg" alt=""/>
                        <div class="content">
                            <h3>Bộ sưu tập hè 2021</h3>
                            <p>Sẵn sàng cho mùa hè rực rỡ</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="products section bg-gray">
    <div class="container">
        <div class="row">
            <div class="title text-center">
                <h2>Xu hướng</h2>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${trendProducts}" var="trendProduct">
                <div class="col-md-4">
                    <div class="product-item">
                        <a href="/product/${trendProduct.id}">
                            <div class="product-thumb">
                                <c:if test="${trendProduct.isDiscount == true}">
                                    <span class="bage">Sale</span>
                                </c:if>
                                <img class="img-responsive" src="${trendProduct.thumbnail}" alt="product-img"/>
                            </div>
                            <div class="product-content">
                                <h4>${trendProduct.name}</h4>
                                <c:if test="${trendProduct.isDiscount == true}">
                                    <p style="color: red" class="price"><del style="color: gray;">${trendProduct.originalPrice}</del>&nbsp; ${trendProduct.vnPrice}</p>
                                </c:if>
                                <c:if test="${trendProduct.isDiscount != true}">
                                    <p class="price">${trendProduct.vnPrice}</p>
                                </c:if>

                            </div>
                        </a>
                    </div>
                </div>

            </c:forEach>

        </div>

    </div>
</section>

<%@include file="/common/web/footer-new.jsp" %>
<!--
Essential Scripts
=====================================-->

<!-- Main jQuery -->
<script src="/aviato/plugins/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.1 -->
<script src="/aviato/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap Touchpin -->
<script src="/aviato/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<!-- Instagram Feed Js -->
<script src="/aviato/plugins/instafeed/instafeed.min.js"></script>
<!-- Video Lightbox Plugin -->
<script src="/aviato/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
<!-- Count Down Js -->
<script src="/aviato/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

<!-- slick Carousel -->
<script src="/aviato/plugins/slick/slick.min.js"></script>
<script src="/aviato/plugins/slick/slick-animation.min.js"></script>

<!-- Google Mapl -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script type="text/javascript" src="/aviato/plugins/google-map/gmap.js"></script>

<!-- Main Js File -->
<script src="/aviato/js/script.js"></script>


</body>
</html>
