<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/admin/head.jsp" %>
    <title>Báo cáo theo khoảng thời gian</title>

    <!-- Custom Stylesheet -->
    <link href="/template/assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
          rel="stylesheet">
    <!-- Page plugins css -->
    <link href="/template/assets/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
    <!-- Color picker plugins css -->
    <link href="/template/assets/plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="/template/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
    <!-- Daterange picker plugins css -->
    <link href="/template/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
                        <form action="<c:url value="/admin/reportByRangeDate"/>" id="formSubmit" method="get">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="example">
                                        <h5 class="box-title m-t-30">Chọn khoảng thời gian</h5>
                                        <input class="form-control input-daterange-datepicker" type="text"
                                               name="daterange" value="${dateValue}">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br>
                            <%--                            08/01/2021 - 12/31/2021--%>
                            <button id="btnCreateReport" type="submit" class="btn btn-rounded btn-info"><i
                                    class="fa fa-check"></i> </span>Tạo báo cáo
                            </button>
                        </form>
                        <br>
                        <br>

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
    <script src="<c:url value="/template/assets/plugins/moment/moment.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"/>"></script>
    <!-- Clock Plugin JavaScript -->
    <script src="<c:url value="/template/assets/plugins/clockpicker/dist/jquery-clockpicker.min.js"/>"></script>
    <!-- Color Picker Plugin JavaScript -->
    <script src="<c:url value="/template/assets/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"/>"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="<c:url value="/template/assets/plugins/timepicker/bootstrap-timepicker.min.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"/>"></script>
    <script>
        // MAterial Date picker
        $('#mdate').bootstrapMaterialDatePicker({
            weekStart: 0,
            time: false
        });
        $('#timepicker').bootstrapMaterialDatePicker({
            format: 'HH:mm',
            time: true,
            date: false
        });
        $('#date-format').bootstrapMaterialDatePicker({
            format: 'dddd DD MMMM YYYY - HH:mm'
        });

        $('#min-date').bootstrapMaterialDatePicker({
            format: 'DD/MM/YYYY HH:mm',
            minDate: new Date()
        });
        // Clock pickers
        $('#single-input').clockpicker({
            placement: 'bottom',
            align: 'left',
            autoclose: true,
            'default': 'now'
        });
        $('.clockpicker').clockpicker({
            donetext: 'Done',
        }).find('input').change(function () {
            console.log(this.value);
        });
        $('#check-minutes').click(function (e) {
            // Have to stop propagation here
            e.stopPropagation();
            input.clockpicker('show').clockpicker('toggleView', 'minutes');
        });
        if (/mobile/i.test(navigator.userAgent)) {
            $('input').prop('readOnly', true);
        }
        // Colorpicker
        $(".colorpicker").asColorPicker();
        $(".complex-colorpicker").asColorPicker({
            mode: 'complex'
        });
        $(".gradient-colorpicker").asColorPicker({
            mode: 'gradient'
        });
        // Date Picker
        jQuery('.mydatepicker, #datepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        jQuery('#date-range').datepicker({
            toggleActive: true
        });
        jQuery('#datepicker-inline').datepicker({
            todayHighlight: true
        });
        // Daterange picker
        $('.input-daterange-datepicker').daterangepicker({
            buttonClasses: ['btn', 'btn-sm'],
            applyClass: 'btn-danger',
            cancelClass: 'btn-inverse'
        });
        $('.input-daterange-timepicker').daterangepicker({
            timePicker: true,
            format: 'MM/DD/YYYY h:mm A',
            timePickerIncrement: 30,
            timePicker12Hour: true,
            timePickerSeconds: false,
            buttonClasses: ['btn', 'btn-sm'],
            applyClass: 'btn-danger',
            cancelClass: 'btn-inverse'
        });
        $('.input-limit-datepicker').daterangepicker({
            format: 'MM/DD/YYYY',
            minDate: '06/01/2015',
            maxDate: '06/30/2015',
            buttonClasses: ['btn', 'btn-sm'],
            applyClass: 'btn-danger',
            cancelClass: 'btn-inverse',
            dateLimit: {
                days: 6
            }
        });
    </script>
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
