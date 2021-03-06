<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.vulenhtho.snow.util.SecurityUtil" %>
<!-- Start Top Header Bar -->
<section class="top-header">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-xs-12 col-sm-4">
                <div class="contact-number">
                    <i class="tf-ion-ios-telephone"></i>
                    <span style="font-size: 16px">0337 416 807</span>
                </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <!-- Site Logo -->
                <div class="logo text-center">
                    <a href="/home">
                        <!-- replace logo here -->
                        <svg width="400px" height="60px" viewBox="0 0 155 60" version="1.1"
                             xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink">
                            <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="40"
                               font-family="gentona" font-weight="bold">
                                <g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
                                    <text   id="AVIATO">
                                        <tspan x="50" y="325">Snow Shop</tspan>
                                    </text>
                                </g>
                            </g>
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <!-- Cart -->
                <c:set value="<%=SecurityUtil.getUserName()%>" var="name"/>
                <ul class="top-menu text-right list-inline">
                    <c:if test="${name != null && name != 'anonymousUser'}">
                        <c:if test="${isAdmin != true}">
                            <li class="cart-nav">
                                <a style="font-size: 16px" href="/#">Xin ch??o <span><%=SecurityUtil.getUserName()%></span></a>
                            </li>
                            <li class="cart-nav">
                                <a style="font-size: 16px" href="<c:url value="/logout"/>">????ng xu???t</a>
                            </li>
                        </c:if>
                        <c:if test="${isAdmin == true}">
                            <li class="cart-nav">
                                <a style="font-size: 16px" href="/admin/home"><i >Qu???n l?? c???a h??ng</i></a>
                            </li>
                            <li class="cart-nav">
                                <a style="font-size: 16px" href="<c:url value="/logout"/>">????ng xu???t</a>
                            </li>
                        </c:if>

                    </c:if>
                    <c:if test="${name == null || name == 'anonymousUser'}">
                        <li class="cart-nav"><a style="font-size: 16px" href="<c:url value="/login"/>">????ng nh???p</a></li>
                    </c:if>

                    <li class="cart-nav">
                        <a style="font-size: 16px" href="/cart"><i class="tf-ion-android-cart"></i>Gi??? h??ng</a>
                    </li>

                    <!-- Search -->
                    <li class="dropdown search dropdown-slide">
                        <a style="font-size: 16px" href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                class="tf-ion-ios-search-strong"></i> T??m ki???m</a>
                        <ul class="dropdown-menu search-dropdown">
                            <li>
                                <form action="<c:url value="/products"/>" id="formSearchHeader" method="get">
                                    <input type="search" name="search" id="search" class="form-control" placeholder="Search...">
                                </form>
                            </li>
                        </ul>
                    </li><!-- / Search -->

                </ul><!-- / .nav .navbar-nav .navbar-right -->
            </div>
        </div>
    </div>
</section><!-- End Top Header Bar -->


<!-- Main Menu Section -->
<section class="menu">
    <nav class="navbar navigation">
        <div class="container">
            <div class="navbar-header">
                <h2 class="menu-title">Main Menu</h2>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div><!-- / .navbar-header -->

            <!-- Navbar Links -->
            <div id="navbar" class="navbar-collapse collapse text-center">
                <ul class="nav navbar-nav">

                    <!-- Home -->
                    <li class="dropdown ">
                        <a style="color: #e52ce5" href="/home">Trang ch???</a>
                    </li><!-- / Home -->


                    <!-- Elements -->
                    <li  class="dropdown dropdown-slide">
                        <a style="color: #e52ce5"  href="<c:url value="/products"/>" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-delay="350"
                           role="button" aria-haspopup="true" aria-expanded="false">S???n ph???m<span
                                class="tf-ion-ios-arrow-down"></span></a>
                        <div style="color: #e52ce5"  class="dropdown-menu">
                            <div class="row">

                                <!-- Basic -->
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li class="dropdown-header">Qu???n ??o</li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="<c:url value="/products?subCategoryId=3"/>">Qu???n jeans</a></li>
                                        <li><a href="<c:url value="/products?subCategoryId=1"/>">??o ph??ng</a></li>
                                        <li><a href="<c:url value="/products?subCategoryId=9"/>">Qu???n Baggy</a></li>
                                    </ul>
                                </div>

                                <!-- Layout -->
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li class="dropdown-header">V??y</li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="<c:url value="/products?subCategoryId=5"/>">V??y li???n th??n</a></li>
                                        <li><a href="<c:url value="/products?subCategoryId=2"/>">Ch??n v??y</a></li>

                                    </ul>
                                </div>

                            </div><!-- / .row -->
                        </div><!-- / .dropdown-menu -->
                    </li><!-- / Elements -->


                    <li class="dropdown ">
                        <a style="color: #e52ce5" href="/home">Khuy???n m???i</a>
                    </li><!-- / Home -->


                    <li class="dropdown ">
                        <a style="color: #e52ce5"  href="/home">Gi???i thi???u</a>
                    </li><!-- / Home -->

                </ul><!-- / .nav .navbar-nav -->

            </div>
            <!--/.navbar-collapse -->
        </div><!-- / .container -->
    </nav>
</section>