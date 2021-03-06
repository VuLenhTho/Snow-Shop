<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <%@include file="/common/web/head.jsp" %>
    <link href="<c:url value="/template/assets/plugins/sweetalert/css/sweetalert.css"/>" rel="stylesheet">
</head>

<body>
<%@include file="/common/web/header.jsp" %>

<!-- Start Shop Page  -->
<div class="shop-box-inner" style="font-family: Helvetica,Arial">
    <form action="<c:url value="/products"/>" id="formSubmit" method="get">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <c:if test="${filter.search != null}">
                                <input class="form-control" placeholder="Tìm kiếm..." type="text"
                                       value="${filter.search}" name="search" id="search1">
                            </c:if>
                            <c:if test="${filter.search == null}">
                                <input class="form-control" placeholder="Tìm kiếm..." type="text" name="search"
                                       id="search2">
                            </c:if>
                            <button type="button" id="searchButton"><i class="fa fa-search"></i></button>

                            <input type="hidden" name="subCategoryId" value="${filter.subCategoryId}"
                                   id="subCategoryId">
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>Thể loại</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree"
                                 id="list-group-men" data-children=".sub-men">
                                <c:forEach items="${category}" var="category">
                                    <div class="list-group-collapse sub-men">
                                        <a class="list-group-item list-group-item-action"
                                           href="<c:url value="#sub-men${category.id}"/>"
                                           data-toggle="collapse" aria-expanded="true"
                                           aria-controls="sub-men${category.id}">${category.name}
                                        </a>
                                        <div class="collapse show" id="sub-men${category.id}"
                                             data-parent="#list-group-men">
                                            <div class="list-group">
                                                <c:forEach items="${category.subCategoryDTOS}" var="subCategory">
                                                    <a href="<c:url value="/admin/products?subCategoryId=${subCategory.id}"/>"
                                                       class="list-group-item list-group-item-action">${subCategory.name}
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right"
                     style="font-family: Helvetica,Arial">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>Sắp xếp</span>
                                    <select id="sort" class="selectpicker show-tick form-control" name="sort"
                                            data-placeholder="$ USD">
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

                            </div>
                            <a>
                                <button id="btnDeleteProducts" class="btn btn-danger" type="button">Xóa sản phẩm
                                </button>
                            </a>

                            <a href="/admin/product/create">
                                <button id="btnAddProduct" class="btn btn-danger" type="button">Thêm sản phẩm</button>
                            </a>
                        </div>

                        <div class="row product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">
                                        <c:forEach items="${productList}" var="product">

                                            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                <div class="products-single fix">
                                                    <div class="box-img-hover">
                                                        <a href="/admin/product/${product.id}">
                                                            <c:if test="${product.isDiscount == true}">
                                                                <div class="type-lb">
                                                                    <p class="sale">Sale</p>
                                                                </div>
                                                            </c:if>

                                                            <img src="${product.thumbnail}" class="img-fluid"
                                                                 alt="Image">
                                                        </a>
                                                    </div>
                                                    <div class="why-text">
                                                        <input type="checkbox" class="check-box" name="productId"
                                                               title=""
                                                               value="${product.id}">
                                                        <h4 style=" white-space: nowrap;text-overflow: ellipsis; overflow: hidden;">${product.name}</h4>
                                                        <c:if test="${product.isDiscount == true}">
                                                            <p style="display: inline-block">
                                                                <del>${product.originalPrice}</del>
                                                                Chỉ còn:&nbsp;
                                                            </p>
                                                            <h4 style="color: red;display: inline-block"> ${product.vnPrice}</h4>
                                                        </c:if>
                                                        <c:if test="${product.isDiscount != true}">
                                                            <h4>${product.vnPrice}</h4>
                                                        </c:if>

                                                    </div>

                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <ul class="pagination" id="pagination"></ul>
                    <input type="hidden" value="1" id="page" name="page">
                    <input type="hidden" value="12" id="size" name="size">
                </div>
            </div>
        </div>
    </form>
    <input type="hidden" value="${token}" id="token">

    <form action="<c:url value="/products"/>" id="formSearch" method="get">
        <input type="hidden" id="search-data" name="search">
    </form>

</div>
<!-- End Shop Page -->

<!-- End Instagram Feed  -->

<%@include file="/common/web/footer.jsp" %>

<!-- ALL JS FILES -->
<script src="<c:url value="/shoptemplate/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/popper.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/bootstrap.min.js"/>"></script>
<!-- ALL PLUGINS -->
<script src="<c:url value="/shoptemplate/js/jquery.superslides.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/bootstrap-select.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/inewsticker.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/bootsnav.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/images-loded.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/isotope.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/baguetteBox.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/form-validator.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/contact-form-script.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/custom.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/jquery.nicescroll.min.js"/>"></script>
<script src="<c:url value="/template/paging/jquery.twbsPagination.js"/>"></script>
<script src="<c:url value="/template/paging/jquery.twbsPagination.min.js"/>"></script>
<script src="<c:url value="/template/assets/plugins/sweetalert/js/sweetalert.min.js"/>"></script>
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

    $('#btnDeleteProducts').click(function () {
        let ids = [];
        let formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name === "productId") {
                let id = parseInt(v.value, 10);
                ids.push(id);
            }
        });

        if (ids.length < 1) {
            swal("Hãy chọn những sản phẩm muốn xóa!", {
                icon: "info",
            });
        } else {
            swal({
                title: "Bạn có chắc không?",
                text: "Những sản phẩm này sẽ bị xóa!",
                icon: "warning",
                buttons: {
                    cancel: {
                        text: "Quay lại",
                        visible: true,
                    },
                    confirm: {
                        text: "Xóa",
                        visible: true,
                    }
                },
                dangerMode: true
            })
                .then((willDelete) => {
                    if (willDelete) {
                        let idsRequestDTO = {ids: ids}
                        callDeleteProducts(idsRequestDTO);
                    }
                });
        }
    })

    function callDeleteProducts(data) {
        let token = document.getElementById("token").value;

        $.ajax({
            url: ('http://localhost:8888/api/admin/products'),
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'text',
            headers: {
                Authorization: token
            },
            success: function () {
                swal({
                    title: "Xóa thành công",
                    icon: "success",
                })
                    .then((value) => {
                        location.reload();
                    });
            },
            error: function (xhr, textStatus, errorThrown) {
                let mesTitle = "Xóa thất bại, có lỗi xảy ra";
                swal(mesTitle, {
                    icon: "error",
                });
            }
        });
    }

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