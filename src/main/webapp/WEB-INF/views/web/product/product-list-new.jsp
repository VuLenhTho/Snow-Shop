<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/web/head-new.jsp" %>

</head>

<body id="body" style="font-family: Helvetica,Arial">

<%@include file="/common/web/header-new.jsp" %>

<section class="page-header" style="font-family: Helvetica,Arial">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="content">
                    <h2 class="page-name" style="font-family: Helvetica,Arial">Mua sắm ngay!</h2>
                    <ol class="breadcrumb">
                        <li><a href="/home">Trang chủ</a></li>
                        <li class="active"><a href="/products">Sản phẩm</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="products section">
    <form action="<c:url value="/products"/>" id="formSubmit" method="get">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="widget">
                        <h4 class="widget-title">Sắp xếp theo</h4>
                        <select id="sort" class="form-control" name="sort">
                            <option data-display="Select" selected="selected" value="${filter.sort}">
                                <c:if test="${filter.sort=='date-des'}">Mới nhất</c:if>
                                <c:if test="${filter.sort=='hot-des'}">Bán chạy</c:if>
                                <c:if test="${filter.sort=='price-des'}">Giá giảm dần</c:if>
                                <c:if test="${filter.sort=='price-asc'}">Giá tăng dần</c:if>
                            </option>
                            <c:if test="${filter.sort=='date-des'}">
                                <option value="hot-des">Bán chạy</option>
                                <option value="price-des">Giá giảm dần</option>
                                <option value="price-asc">Giá tăng dần</option>
                            </c:if>
                            <c:if test="${filter.sort=='hot-des'}">
                                <option value="date-des">Mới nhất</option>
                                <option value="price-des">Giá giảm dần</option>
                                <option value="price-asc">Giá tăng dần</option>
                            </c:if>
                            <c:if test="${filter.sort=='price-des'}">
                                <option value="date-des">Mới nhất</option>
                                <option value="hot-des">Bán chạy</option>
                                <option value="price-asc">Giá tăng dần</option>
                            </c:if>
                            <c:if test="${filter.sort=='price-asc'}">
                                <option value="date-des">Mới nhất</option>
                                <option value="hot-des">Bán chạy</option>
                                <option value="price-des">Giá giảm dần</option>
                            </c:if>
                        </select>

                    </div>
                    <div class="widget product-category">
                        <h4 class="widget-title">Thể loại</h4>
                        <div class="panel-group commonAccordion" id="accordion" role="tablist"
                             aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseOne"
                                           aria-expanded="true" aria-controls="collapseOne">
                                            Quần áo
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                                     aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <ul>
                                            <li><a href="<c:url value="/products?subCategoryId=3"/>">Quần jean</a></li>
                                            <li><a href="<c:url value="/products?subCategoryId=1"/>">Áo phông</a></li>
                                            <li><a href="<c:url value="/products?subCategoryId=9"/>">Quần Baggy</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse"
                                           data-parent="#accordion"
                                           href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Váy
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                     aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <ul>
                                            <li><a href="<c:url value="/products?subCategoryId=5"/>">Váy liền thân</a>
                                            </li>
                                            <li><a href="<c:url value="/products?subCategoryId=2"/>">Chân váy</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-9">
                    <div class="row">

                        <c:forEach items="${productList}" var="product">
                            <div class="col-md-4">
                                <a href="/product/${product.id}">
                                    <div class="product-item">
                                        <div class="product-thumb">
                                            <c:if test="${product.isDiscount == true}">
                                                <span class="bage">Sale</span>
                                            </c:if>
                                            <img class="img-responsive" src="${product.thumbnail}"
                                                 alt="product-img"/>
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
                    <ul class="pagination" id="pagination"></ul>
                    <input type="hidden" value="1" id="page" name="page">
                    <input type="hidden" value="12" id="size" name="size">
                </div>

            </div>
        </div>
    </form>
    <form action="<c:url value="/products"/>" id="formSearch" method="get">
        <input type="hidden" id="search-data" name="search">
    </form>
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
<script src="<c:url value="/template/paging/jquery.twbsPagination.js"/>"></script>
<script src="<c:url value="/template/paging/jquery.twbsPagination.min.js"/>"></script>

<!-- Google Mapl -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script type="text/javascript" src="/aviato/plugins/google-map/gmap.js"></script>

<!-- Main Js File -->
<script src="/aviato/js/script.js"></script>
<script>
    $(function () {
        $('#sort').change(function () {
            $('#formSubmit').submit();
        });
    });

    $('#searchButton').click(function () {
        var search1 = document.getElementById("search1");
        var search2 = document.getElementById("search2");
        if (search1 != null) {
            document.getElementById("search-data").value = search1.value;
        } else {
            document.getElementById("search-data").value = search2.value;
        }
        $('#formSearch').submit();
    })
</script>
<script type="text/javascript">
    var totalPages = ${totalPage};
    var currentPage = ${currentPage + 1};
    var limit = 12;
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            limit: 12,
            onPageClick: function (event, page) {
                if (currentPage !== page) {
                    $('#size').val(limit);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        })
    });
</script>

</body>
</html>
