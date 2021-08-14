<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/admin/head.jsp" %>
    <title>Quản lý đơn hàng</title>
    <style>
        table {
            color: #000000;
            border-left: 1px solid black;
            border-right: 1px solid black;
            border-bottom: 1px solid black;

        }

        div {
            font-family: Helvetica, Arial, sans-serif;
        }

    </style>

    <link rel="stylesheet" href="<c:url value="/shoptemplate/css/style.css"/>">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="<c:url value="/shoptemplate/css/responsive.css"/>">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/shoptemplate/css/custom.css"/>">
    <link href="/template/css/style.css" rel="stylesheet">
    <script src="/template/js/modernizr-3.6.0.min.js"></script>

</head>

<body class="v-light vertical-nav fix-header fix-sidebar">
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
        </svg>
    </div>
</div>
<div id="main-wrapper">
    <%@include file="/common/admin/header.jsp" %>
    <%@include file="/common/admin/menu.jsp" %>
    <div class="content-body" style="background-color: white">


        <div class="row" style="color: #000000">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <form action="<c:url value="/admin/reportByYear"/>" id="formSubmit" method="get">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label" for="year">Chọn năm
                                        </label>
                                        <div class="col-lg-9">
                                            <input type="number" id="year" name="year" min="2021" value="2021"
                                                   class="form-control mb-2" placeholder="Chọn năm..">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button id="btnCreateReport" type="submit" class="btn btn-rounded btn-info"><i
                                    class="fa fa-check"></i> </span>Tạo báo cáo
                            </button>
                        </form>
                        <br>
                        <br>
                        <h4 class="card-title">Báo cáo năm ${reportData.year}:</h4>

                        <div class="row">
                            <div class="col-sm-7 col-lg-7">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="totalProduct">Tổng số sản phẩm bán được:</label>
                                                <div class="col-lg-9">
                                                    <br>
                                                    <p id="totalProduct">${totalProduct}</p>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="moneyFromSale">Tổng tiền thu
                                                    về:</label>
                                                <div class="col-lg-9">
                                                    <p id="moneyFromSale">${reportData.vnMoneyFromSale}</p>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="interestMoney">Tổng tiền
                                                    lãi:
                                                </label>
                                                <div class="col-lg-9">
                                                    <p id="interestMoney">${reportData.vnInterestMoney}</p>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="importMoney">Tiền nhập:
                                                </label>
                                                <div class="col-lg-9">
                                                    <p id="importMoney">${reportData.vnImportMoney}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Biểu đồ doanh thu 7 tháng đầu năm</h4>
                                        <canvas id="lineChart" width="500" height="250"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Biểu đồ doanh thu 6 tháng cuối năm</h4>
                                        <canvas id="lineChart2" width="500" height="250"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Biểu đồ tỉ lệ sản phẩm bán được của từng loại sản phẩm</h4>                        <br>
                                        <br>
                                        <br>
                                        <div id="flotPie1" class="flot-chart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <%@include file="/common/admin/footer.jsp" %>


    </div>


    <!-- Common JS -->
    <script src="<c:url value="/template/assets/plugins/common/common.min.js"/>"></script>
    <!-- Custom script -->
    <script src="<c:url value="/template/js/custom.min.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/wysihtml5/js/wysihtml5-0.3.0.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/wysihtml5/js/bootstrap-wysihtml5.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/wysihtml5/js/wysihtml5-init.js"/>"></script>
    <script src="<c:url value="/template/paging/jquery.twbsPagination.js"/>"></script>
    <script src="<c:url value="/template/paging/jquery.twbsPagination.min.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/sweetalert/js/sweetalert.min.js"/>"></script>

    <script src="/template/assets/plugins/chartjs/Chart.bundle.js"></script>
    <script src="/template/assets/plugins/chartjs/chartjs-init.js"></script>
    <script>
        (function ($) {
            "use strict";

            //line chart
            var ctx = document.getElementById("lineChart");
            ctx.height = 150;
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7"],
                    datasets: [
                        {
                            label: "Tổng tiền thu về",
                            borderColor: "rgba(28,0,75,0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(255,254,254,0.25)",
                            data: ${totalSale1To7}
                        },
                        {
                            label: "Tổng tiền lãi",
                            borderColor: "rgba(248,0,0,0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(255,255,255,0.5)",
                            pointHighlightStroke: "rgba(26,179,148,1)",
                            data: ${interest1To7}
                        }
                        ,
                        {
                            label: "Tiền nhập",
                            borderColor: "rgba(0,80,9,0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(255,255,255,0.5)",
                            pointHighlightStroke: "rgba(26,179,148,1)",
                            data: ${importMoney1To7}
                        }
                    ]
                },
                options: {
                    responsive: true,
                    tooltips: {
                        mode: 'index',
                        intersect: false
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    }

                }
            });

        })(jQuery);


    </script>
    <script>
        (function ($) {
            "use strict";

            //line chart
            var ctx = document.getElementById("lineChart2");
            ctx.height = 150;
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ["Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                    datasets: [
                        {
                            label: "Tổng tiền thu về",
                            borderColor: "rgba(144,	104,	190,.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(255,254,254,0.25)",
                            data: ${totalSale7To12}
                        },
                        {
                            label: "Tổng tiền lãi",
                            borderColor: "rgba(110,	211,	207, 0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(255,255,255,0.5)",
                            pointHighlightStroke: "rgba(26,179,148,1)",
                            data: ${interest7To12}
                        }
                        ,
                        {
                            label: "Tiền nhập",
                            borderColor: "rgba(110,	211,	207, 0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(255,255,255,0.5)",
                            pointHighlightStroke: "rgba(26,179,148,1)",
                            data: ${importMoney7To12}
                        }
                    ]
                },
                options: {
                    responsive: true,
                    tooltips: {
                        mode: 'index',
                        intersect: false
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    }

                }
            });

        })(jQuery);

    </script>

<%-- Bieu do hinh tron   --%>
        <!--  flot-chart js -->
        <script src="/template/assets/plugins/flot/js/jquery.flot.min.js"></script>
        <script src="/template/assets/plugins/flot/js/jquery.flot.pie.js"></script>
        <script src="/template/assets/plugins/flot/js/jquery.flot.resize.js"></script>
        <script src="/template/assets/plugins/flot/js/jquery.flot.spline.js"></script>
        <%--    <script src="/template/assets/plugins/flot/js/jquery.flot.init.js"></script>--%>
        <script>
            var piedata = [{
                label: "Quần Jeans",
                data: [
                    [1, ${tongQuanJeans}]
                ],
                color: '#878b8e'
            },
                {
                    label: "Áo phông",
                    data: [
                        [1, ${tongAoPhong}]
                    ],
                    color: '#794e2f'
                },
                {
                    label: "Quần Baggy",
                    data: [
                        [1, ${tongQuanBaggy}]
                    ],
                    color: '#9068be'
                },
                {
                    label: "Váy liền thân",
                    data: [
                        [1, ${tongVayLienThan}]
                    ],
                    color: '#e62739'
                },
                {
                    label: "Chân váy",
                    data: [
                        [1, ${tongChanVay}]
                    ],
                    color: '#173e43'
                }
            ];

            $.plot('#flotPie1', piedata, {
                series: {
                    pie: {
                        show: true,
                        radius: 1,
                        label: {
                            show: true,
                            radius: 2 / 3,
                            formatter: labelFormatter,
                            threshold: 0.1
                        }
                    }
                },
                grid: {
                    hoverable: true,
                    clickable: true
                }
            });

            function labelFormatter(label, series) {
                return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
            }
        </script>
</body>

</html>
