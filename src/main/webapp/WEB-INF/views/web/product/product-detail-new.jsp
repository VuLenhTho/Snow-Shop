<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <%@include file="/common/web/head-new.jsp" %>

</head>

<body id="body">
<%@include file="/common/web/header-new.jsp" %>

<section class="single-product">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <ol class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/products">Sản phẩm</a></li>
                    <li class="active">${product.name}</li>
                </ol>
            </div>
            <div class="col-md-6">

            </div>
        </div>
        <div class="row mt-20">
            <div class="col-md-5">
                <div class="single-product-slider">
                    <div id='carousel-custom' class='carousel slide' data-ride='carousel'>
                        <div class='carousel-outer'>
                            <!-- me art lab slider -->
                            <div class='carousel-inner '>
                                <div class='item active'>
                                    <img src='${bigImg[0]}' alt='' data-zoom-image="${bigImg[0]}"/>
                                </div>
                                <c:forEach items="${bigImg}" var="img">
                                    <c:if test="${img != bigImg[0]}">
                                        <div class='item '>
                                            <img src='${img}' alt='' data-zoom-image="${img}"/>
                                        </div>
                                    </c:if>
                                </c:forEach>

                            </div>

                            <!-- sag sol -->
                            <a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
                                <i class="tf-ion-ios-arrow-left"></i>
                            </a>
                            <a class='right carousel-control' href='#carousel-custom' data-slide='next'>
                                <i class="tf-ion-ios-arrow-right"></i>
                            </a>
                        </div>

                        <!-- thumb -->
                        <ol class='carousel-indicators mCustomScrollbar meartlab'>
                            <li data-target='#carousel-custom' data-slide-to='0' class='active'>
                                <img src='${smImg[0]}' alt=''/>
                            </li>
                            <c:forEach items="${smImg}" var="img">
                                <c:if test="${img != smImg[0]}">
                                    <li data-target='#carousel-custom' data-slide-to='0' class='active'>
                                        <img src='${img}' alt=''/>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="single-product-details">
                    <h2>${product.name}</h2>
                    <c:if test="${product.discountDTOS.size() < 1}">
                        <p class="product-price"> ${product.vnPrice}</p>
                        <br>
                        <br>
                        <h4>Mô tả sản phẩm:</h4>
                        <p class="product-description mt-20">${product.shortDescription}</p>
                    </c:if>
                    <c:if test="${product.discountDTOS.size() > 0}">
                        <p class="product-price">
                            <del>${product.vnOriginalPrice}</del>&nbsp; &nbsp;${product.vnPrice}</p>
                        <h4>Khuyến mại:</h4>
                        <c:forEach items="${product.discountDTOS}" var="discount">
                            <p>- ${discount.content}</p>
                        </c:forEach>
                        <br>
                        <br>
                        <h4>Mô tả sản phẩm:</h4>
                        <p class="product-description mt-20">${product.shortDescription}</p>
                    </c:if>


                    <div class="product-size">
                        <span>Màu:</span>
                        <select id="color" class="form-control">
                            <option value="0" selected="selected">Chọn màu</option>
                            <c:forEach items="${product.colorDTOS}" var="color">
                                <option value="${color.id}">${color.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="product-size">
                        <span>Size:</span>
                        <select id="size" class="form-control">
                            <option value="0" selected="selected">Chọn size</option>
                            <c:forEach items="${product.sizeDTOS}" var="sizeVar">
                                <option value="${sizeVar.id}">${sizeVar.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <p>Trạng thái: <h5 id="status"></h5></p>

                    <div class="product-quantity">
                        <span>Quantity:</span>
                        <div class="product-quantity-slider">
                            <input id="quantityPurchased" type="text" value="1" max="30" min="1"
                                   name="product-quantity">
                        </div>
                    </div>
                    <%--                    <a href="cart.html" class="btn btn-main mt-20">Add To Cart</a>--%>
                    <button id="btnAddToCart" type="button" class="btn btn-main mt-20">
                        Thêm vào giỏ hàng
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="products related-products section">
    <div class="container">
        <div class="row">
            <div class="title text-center">
                <h2>Sản phẩm liên quan</h2>
            </div>
        </div>
        <div class="row">

            <c:forEach items="${sameCategoryProducts}" var="product">
                <div class="col-md-3">
                    <a href="/product/${product.id}">
                        <div class="product-item">
                            <div class="product-thumb">
                                <span class="bage">Sale</span>
                                <img class="img-responsive" src="${product.thumbnail}" alt="product-img"/>
                            </div>
                            <div class="product-content">
                                <h4>${product.name}</h4>
                                <c:if test="${product.isDiscount == true}">
                                    <p class="price">
                                        <del>${product.originalPrice}</del>&nbsp; ${product.vnPrice}</p>
                                </c:if>
                                <c:if test="${product.isDiscount != true}">
                                    <p class="price">${product.vnPrice}</p>
                                </c:if>
                            </div>
                        </div>
                    </a>
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
<script src="<c:url value="/template/assets/plugins/sweetalert/js/sweetalert.min.js"/>"></script>
<!-- Google Mapl -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script type="text/javascript" src="/aviato/plugins/google-map/gmap.js"></script>

<!-- Main Js File -->
<script src="/aviato/js/script.js"></script>

<script>
    let size = document.getElementById("size").value;
    let color = document.getElementById("color").value;
    let sizes = ${sizes};
    let colors = ${colors};
    let quantity = ${quantity};
    let productStatus = '${productStatus}';
    let productStatusMessage = document.getElementById("status");
    let btnAddToCart = document.getElementById("btnAddToCart");
    handleStatus();

    $(function () {
        $('#color').change(function () {
            color = this.value;
            handleStatus();
        });
        $('#size').change(function () {
            size = this.value;
            handleStatus();
        });

    });

    function handleStatus() {
        if (productStatus === 'COMING_SOON') {
            productStatusMessage.innerHTML = "Sắp có";
            btnAddToCart.disabled = true;
            return;
        }
        if (productStatus === 'OUT_OF_STOCK') {
            productStatusMessage.innerHTML = "Hết hàng";
            btnAddToCart.disabled = true;
            return;
        }
        if (size == 0 || color == 0) {
            productStatusMessage.innerHTML = "";
            btnAddToCart.disabled = true;
            return;
        }
        for (var i = 0; i < sizes.length; i++) {
            if (sizes[i] == size && colors[i] == color && quantity[i] > 0) {
                productStatusMessage.innerHTML = "Còn hàng";
                btnAddToCart.disabled = false;
                return;
            }
        }
        productStatusMessage.innerHTML = "Hết hàng";
        btnAddToCart.disabled = true;
    }
</script>
<script>
    document.getElementById("btnAddToCart").onclick = function () {
        addToCart()
    };

    function addToCart() {
        let productInfo = {
            productId: '${product.id}',
            colorId: document.getElementById("color").value,
            sizeId: document.getElementById("size").value,
            quantity: document.getElementById("quantityPurchased").value,
            price: '${product.price}'
        }

        addProductToCart(productInfo);
    }

    function addProductToCart(productInfo) {
        $.ajax({
            url: ('http://localhost:8080/addToCart?productId=' + productInfo.productId + '&colorId=' + productInfo.colorId
                + '&sizeId=' + productInfo.sizeId + '&price=' + productInfo.price + '&quantity=' + productInfo.quantity),
            type: 'GET',
            contentType: 'application/json',
            dataType: 'text',
            statusCode: {
                401: function () {
                    window.location = "http://localhost:8080/login?mess=addToCart";
                },
                400: function () {
                    swal("Có lỗi xảy ra!!", "Liên hệ nhân viên bán hàng để được hỗ trợ!", "error")
                }
            },
            success: function () {
                swal("Thành công!", "Sản phẩm đã được thêm vào giỏ hàng", "success")
            }
        });
    }

</script>

</body>
</html>