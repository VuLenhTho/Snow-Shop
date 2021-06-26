<%@ page import="com.vulenhtho.snow.util.SecurityUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="header">
    <div class="nav-header">
        <div class="brand-logo"><a style="padding-top: 5px" href="/home"><!-- replace logo here -->
            <svg width="135px" height="29px" viewBox="0 0 155 29" version="1.1"
                 xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink">
                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="40"
                   font-family="AustinBold, Austin" font-weight="bold">
                    <g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
                        <text id="AVIATO">
                            <tspan x="108.94" y="325"> Snow</tspan>
                        </text>
                    </g>
                </g>
            </svg>
        </a>
        </div>
        <div class="nav-control">
<%--            <div class="hamburger"><span class="line"></span> <span class="line"></span> <span class="line"></span>--%>
<%--            </div>--%>
        </div>
    </div>
    <div class="header-content">
        <div class="header-left">
            <ul>
<%--                <li class="icons position-relative"><a href="javascript:void(0)"><i--%>
<%--                        class="icon-magnifier f-s-16"></i></a>--%>
<%--                    <div class="drop-down animated bounceInDown">--%>
<%--                        <div class="dropdown-content-body">--%>
<%--                            <div class="header-search" id="header-search">--%>
<%--                                <form action="#">--%>
<%--                                    <div class="input-group">--%>
<%--                                        <input type="text" class="form-control" placeholder="Search">--%>
<%--                                        <div class="input-group-append"><span class="input-group-text"><i class="icon-magnifier"></i></span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </li>--%>
            </ul>
        </div>
        <div class="header-right">
            <ul>
                <li class="icons">
                    Xin chào <span id="creator"><%=SecurityUtil.getUserName()%></span>
                </li>
                <li class="icons"><a href="javascript:void(0)"><i class="mdi mdi-account f-s-20" aria-hidden="true"></i></a>
                    <div class="drop-down dropdown-profile animated bounceInDown">
                        <div class="dropdown-content-body">
                            <ul>
                                <li><a href="/logout"><i class="icon-power"></i> <span>Đăng xuất</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>