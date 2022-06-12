<%@ Page Language="VB" AutoEventWireup="false" CodeFile="app_a40.aspx.vb" Inherits="app_a40" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT A40</title>

    <link rel="shortcut icon" href="App_Inc/favicon.ico" type="image/x-icon">
    <link rel="icon" href="App_Inc/favicon.ico" type="image/x-icon">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-146935196-1"></script>
    <script type="text/javascript" src="App_Inc/_js/gtag_memberrpt.js?id=UA-146935196-1&vs=18"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
    <script src="App_Inc/jquery-1.11.3.min.js"></script>

    <link rel="stylesheet" type="text/css" href="App_Inc/jquery-ui-1.11.4/jquery-ui.css"/>
    <script type="text/javascript" src="App_Inc/jquery-ui-1.11.4/jquery-ui.js"></script>

    <script type="text/javascript" src="App_Inc/jquery-cookie/jquery.cookie.js"></script>

    <link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
    <script src="App_Inc/bootstrap/js/bootstrap.js"></script>

    <link rel="stylesheet" href="App_Inc/bootstrap-notify/animate.css" />
    <script src="App_Inc/bootstrap-notify/bootstrap-notify.js"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />

    <link type="text/css" rel="stylesheet" href="App_Inc/_css/main.css?vs=19" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/stockShop.css?vs=19" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/mapReport.css?vs=19" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartShop.css?vs=19" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartApp.css?vs=199" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartDark.css?vs=19999" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script type="text/javascript" src="App_Inc/canvasjs-2.3.2/canvasjs.min.js"></script>
    <script type="text/javascript" src="App_Inc/jquery.inview/jquery.inview.min.js"></script>
    <!-- <script type="text/javascript" src="App_Inc/Highcharts-7.1.3/code/highcharts.js"></script> -->
    <script src="https://code.highcharts.com/stock/highstock.js"></script>

    <script type="text/javascript" src="App_Inc/_js/panu.js?vs=19"></script>

    <style type="text/css">
        .table-code {
           position: absolute;
           top: 10px;
           right: 10px; 
       }

       .tr-a40-t10-cluster .gclose {
            color: #ff5757;
        }
    </style>
</head>
<body>
    <input runat="server" id="hide_uemail" type="hidden">
    <input runat="server" id="hide_upermiss" type="hidden">
    <form id="form1" runat="server"></form>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="default.aspx">
                    <span class="glyphicon icon-stats-bars"></span> MEMBERRPT
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="full-bar"><a href="app_a10.aspx">A10 สถิติการใช้งาน App</a></li>
                    <li class="full-bar"><a href="app_a15.aspx">A15 สถิติ ก.พ. 2020</a></li>
                    <li class="full-bar"><a href="app_a20.aspx">A20 ความถี่การใช้งาน App</a></li>
                    <li class="full-bar"><a href="app_a30.aspx">A30 ข้อมูลการใช้ Point</a></li>
                    <li class="active full-bar"><a href="app_a40.aspx">A40 ข้อมูลการชำระเงิน</a></li>

                    <li class="mini-bar"><a href="app_a10.aspx">A10</a></li>
                    <li class="mini-bar"><a href="app_a15.aspx">A15</a></li>
                    <li class="mini-bar"><a href="app_a20.aspx">A20</a></li>
                    <li class="mini-bar"><a href="app_a30.aspx">A30</a></li>
                    <li class="active mini-bar"><a href="app_a40.aspx">A40 ข้อมูลการชำระเงิน</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="app_download.aspx"><span class="glyphicon glyphicon-save-file"></span> Download</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">รายงานอื่นๆ <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="app_a10.aspx">A10 กราฟเข้าใช้ App</a></li>
                            <li><a href="app_g10.aspx">G10 กราฟลง App ใหม่</a></li>
                            <li><a href="../empquest/sms_m40.aspx">M40 สำรวจโครงการ</a></li>
                            <li><a href="../meterrpt/e10.aspx">E10 มิเตอร์ไฟฟ้า</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="inview" id="rd_r40040">
        <div class="container">
            <div class="row row-container">
                <div class="col-xs-12 box-container">
                    <div id="rd_r40040_value">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row row-container">
                <div class="col-xs-12 box-container">
                    <div id="rd_r40040_ma30">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">

            <div class="col-xs-6 box-container">
                <div class="inview" id="rd_r40030_value">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 box-container">
                <div id="rd_r40030_per">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 
	<div class="inview" id="rd_r401050">
        <div class="container">
            <div class="row row-container">
                <div class="col-xs-12 box-container">
                    <div id="rd_r40010">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                    <div id="info_r40010"></div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row row-container">
                <div class="col-xs-6 box-container">
                    <div id="rd_r40050">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                </div>

                <div class="col-xs-6 box-container">
                    <div id="rd_r40051">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">

            <div class="col-xs-6 box-container">
                <div class="inview" id="rd_r40021_value">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 box-container">
                <div id="rd_r40021_per">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">

            <div class="col-xs-6 box-container">
                <div class="inview" id="rd_r40022_value">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>

            <div class="col-xs-6 box-container">
                <div id="rd_r40022_per">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <b class="table-code">A40/T10</b>
                <p class="title-target">แสดงจำนวน Account ที่ชำระผ่าน QR แยกตาม Cluster ณ. สิ้นวันที่ <span class="target-date">__/__/____</span></p>

                <div class="inview" id="display_a40_t10">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
	-->
</div>

<footer class="footer">
    <div class="container">
        <div class="pull-left">
            <p>Copyright &copy; 2019 by support_pos</p>
            <p>เพื่อการใช้งานเต็มประสิทธิภาพ กรุณาใช้เบราว์เซอร์ Chrome หรือ Firefox</p>
            <img onerror="imgError(this);" src="http://posbcs.triplet.co.th/pos.ico" style="left: -100px; position: absolute;">
        </div>

        <div class="pull-right">
            <span id="gotoTop">
                <a class='btn btn-default btn-lg' onclick="$('html,body').animate({scrollTop:0},'slow');return false;" title="กลับขึ้นด้านบน">
                    <i class="glyphicon glyphicon-chevron-up"></i> TOP
                </a>
            </span>
        </div>
    </div>
</footer>

<div id="page_loading" class="modal-backdrop">
    <div class="in-loading not-nm">
        <span class="glyphicon icon-spinner7 gly-spin"></span><span id="txt_loading"> กรุณารอสักครู่...</span>
    </div>
    <div class="in-loading not-ie">
        <h3><strong>ระบบไม่รองรับการใช้งานด้วยโปรแกรม Internet Explorer กรุณาใช้ Chrome หรือ Firefox</strong></h3>
    </div>
</div>

<div id="modal_alert" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">แจ้งเตือน</h4>
            </div>
            <div class="modal-body">
                <p id="txt_alert">ข้อความ</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>

<script type="text/javascript">
var colorSet_a410 = ['#a0a0a0', '#12e55c', '#4796ff', '#c0ff5b', '#FD8C16'];
var colorSet_a421 = ['#12e55c', '#4796ff', ];
var colorSet_a422 = ['#00c143', '#12e55c', '#c0ff5b', '#24A7DD', '#2980f2', '#4796ff', '#6523ff', '#0C2F80'];
var colorSet_a430 = ['#12e55c', '#4796ff', '#ffde5b', '#f15723', '#a0a0a0', '#60AFFF', '#FF9628'];
var colorSet_a450 = ['#12e55c', '#4796ff', '#c0ff5b'];

var data_T10 = [];
var by_T10 = "T10_CLUSTERS";
var order_T10 = "asc";

var arrayBTN = []
arrayBTN['T10_CLUSTERS'] = [];
arrayBTN['BEFORE_QR'] = [];
arrayBTN['SINCE_QR'] = [];
arrayBTN['NEW_SINCE_QR'] = [];
arrayBTN['PERCENT_QR'] = [];

arrayBTN['T10_CLUSTERS']['asc'] = "<a class='a-sort' id='sort_T10_CLUSTERS' onclick='dataSortT10(\"T10_CLUSTERS\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T10_CLUSTERS']['desc'] = "<a class='a-sort' id='sort_T10_CLUSTERS' onclick='dataSortT10(\"T10_CLUSTERS\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['BEFORE_QR']['asc'] = "<a class='a-sort' id='sort_BEFORE_QR' onclick='dataSortT10(\"BEFORE_QR\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['BEFORE_QR']['desc'] = "<a class='a-sort' id='sort_BEFORE_QR' onclick='dataSortT10(\"BEFORE_QR\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['SINCE_QR']['asc'] = "<a class='a-sort' id='sort_SINCE_QR' onclick='dataSortT10(\"SINCE_QR\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['SINCE_QR']['desc'] = "<a class='a-sort' id='sort_SINCE_QR' onclick='dataSortT10(\"SINCE_QR\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['NEW_SINCE_QR']['asc'] = "<a class='a-sort' id='sort_NEW_SINCE_QR' onclick='dataSortT10(\"NEW_SINCE_QR\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['NEW_SINCE_QR']['desc'] = "<a class='a-sort' id='sort_NEW_SINCE_QR' onclick='dataSortT10(\"NEW_SINCE_QR\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['PERCENT_QR']['asc'] = "<a class='a-sort' id='sort_PERCENT_QR' onclick='dataSortT10(\"PERCENT_QR\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['PERCENT_QR']['desc'] = "<a class='a-sort' id='sort_PERCENT_QR' onclick='dataSortT10(\"PERCENT_QR\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";

</script>

<script type="text/javascript" src="App_Inc/_js/chartApp.js?vs=19999"></script>
<script type="text/javascript" src="App_Inc/_js/chartDark.js?vs=199"></script>

<script type="text/javascript">
$(document).ready(function() { 
    startInview();
});

function startInview() {
    $('.inview').one('inview', function (e, isInView) {
        if (isInView) {
            switch (this.id) {
                case "rd_r401050": load_r40050();
                break;
                case "rd_r40021_value": load_r40021();
                break;
                case "rd_r40022_value": load_r40022();
                break;
                case "rd_r40030_value": load_r40030();
                break;
                case "rd_r40040": load_r40040();
                break;
                case "display_a40_t10": loadTableT10();
                break;
            }
        }
    });
}

function load_r40040() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=40040";
    console.log("load_40040 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var data_line_value = [];
            var data_c_rie_value = [];
            var start_data_r40040 = new Date(data[0].dtm);

            var arr_categories = [];
            var temp_categories = '';

            //ma7
            var data_line_ma7 = [];
            var data_c_rie_ma7 = [];
            var sma7 = simple_moving_averager(7);

            var arr_visible = ['DirecDebit', 'Emp', 'Other'];
            var j = 0;
            //ma7

            $.each(data,function( i,item ) {
                if(temp_categories != item.PAYMENT_CATEGORY){
                    temp_categories = item.PAYMENT_CATEGORY;
                    data_line_value[temp_categories] = [];

                    //ma7
                    data_line_ma7[temp_categories] = [];
                    sma7 = simple_moving_averager(7);
                    j = 0;
                    //ma7
                }

                data_line_value[temp_categories].push(parseInt(item.COUNT_PAY));

                //ma7
                var pushMA7 = Math.round(sma7(parseInt(item.COUNT_PAY)));
                if(j >= 7){
                    data_line_ma7[temp_categories].push(pushMA7);
                }
                j = j+1;
                //ma7
            });

            temp_categories = '';

            $.each(data,function( i,item ) {
                var cf_visible = true;

                if(temp_categories != item.PAYMENT_CATEGORY){
                    temp_categories = item.PAYMENT_CATEGORY;

                    if(arr_visible.indexOf(temp_categories) >= 0){
                        cf_visible = false;
                    }

                    data_c_rie_value.push({
                        marker: {
                            radius: 2,
                            symbol: 'circle',
                        },
                        name: temp_categories,
                        data: data_line_value[temp_categories],
                        pointStart: setPointStart(start_data_r40040),
                        pointInterval: setDaysInterval(1),
                        visible: cf_visible
                    });

                    //ma7
                    data_c_rie_ma7.push({
                        marker: {
                            radius: 2,
                            symbol: 'circle',
                        },
                        name: temp_categories,
                        data: data_line_ma7[temp_categories],
                        pointStart: setPointStart(addDays(start_data_r40040, 7)),
                        pointInterval: setDaysInterval(1),
                        visible: cf_visible
                    });
                    //ma7
                }
            });

             var rd_chart = Highcharts.chart("rd_r40040_value", {
                colors: colorSet_a430,
                chart: {
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สถิติการชำระเงินทุกช่องทาง 6 เดือนล่าสุด",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    type: 'datetime',
                    tickInterval: setDaysInterval(14),
                    labels: {
                        format: '{value:%d/%m/%Y}',
                    }, 
                    gridLineWidth: 1,
                },
                yAxis: { 
                    title: {
                        text: '',
                    },
                    min: 0,
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.x:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                series: data_c_rie_value
            });

            loadFlagEventPushCrie(rd_chart);

            rd_chart = Highcharts.chart("rd_r40040_ma30", {
                colors: colorSet_a430,
                chart: {
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "ค่าเฉลี่ย 7 วัน การชำระเงินทุกช่องทาง 6 เดือนล่าสุด",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    type: 'datetime',
                    min: setPointStart(start_data_r40040),
                    tickInterval: setDaysInterval(14),
                    labels: {
                        format: '{value:%d/%m/%Y}',
                    }, 
                    gridLineWidth: 1,
                },
                yAxis: { 
                    title: {
                        text: '',
                    },
                    min: 0,
                },
                legend: {
                    maxHeight: 30
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.x:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                series: data_c_rie_ma7
            });

            loadFlagEventPushCrie(rd_chart);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

// function load_r40040() {
//     var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=40040";
//     console.log("load_40040 = " + url);

//     $.ajax({
//         url: url,
//         cache: false,
//         dataType: "json",
//         timeout: 60000,
//         success: function(data) { 
//             var data_line_value = [];
//             var data_c_rie_value = [];
//             var start_data_r40040 = new Date(data[0].dtm);

//             var arr_categories = [];
//             var temp_categories = '';

//             //ma30
//             var data_line_ma30 = [];
//             var data_c_rie_ma30 = [];
//             var sma30 = simple_moving_averager(30);

//             var arr_visible = ['DirecDebit', 'Emp', 'Other'];
//             var j = 0;
//             //ma30

//             $.each(data,function( i,item ) {
//                 if(temp_categories != item.PAYMENT_CATEGORY){
//                     temp_categories = item.PAYMENT_CATEGORY;
//                     data_line_value[temp_categories] = [];

//                     //ma30
//                     data_line_ma30[temp_categories] = [];
//                     sma30 = simple_moving_averager(30);
//                     j = 0;
//                     //ma30
//                 }

//                 data_line_value[temp_categories].push(parseInt(item.COUNT_PAY));

//                 //ma30
//                 var pushMA30 = Math.round(sma30(parseInt(item.COUNT_PAY)));
//                 if(j >= 30){
//                     data_line_ma30[temp_categories].push(pushMA30);
//                 }
//                 j = j+1;
//                 //ma30
//             });

//             temp_categories = '';

//             $.each(data,function( i,item ) {
//                 var cf_visible = true;

//                 if(temp_categories != item.PAYMENT_CATEGORY){
//                     temp_categories = item.PAYMENT_CATEGORY;

//                     if(arr_visible.indexOf(temp_categories) >= 0){
//                         cf_visible = false;
//                     }

//                     data_c_rie_value.push({
//                         marker: {
//                             radius: 2,
//                             symbol: 'circle',
//                         },
//                         name: temp_categories,
//                         data: data_line_value[temp_categories],
//                         pointStart: setPointStart(start_data_r40040),
//                         pointInterval: setDaysInterval(1),
//                         visible: cf_visible
//                     });

//                     //ma30
//                     data_c_rie_ma30.push({
//                         marker: {
//                             radius: 2,
//                             symbol: 'circle',
//                         },
//                         name: temp_categories,
//                         data: data_line_ma30[temp_categories],
//                         pointStart: setPointStart(addDays(start_data_r40040, 30)),
//                         pointInterval: setDaysInterval(1),
//                         visible: cf_visible
//                     });
//                     //ma30
//                 }
//             });

//              var rd_chart = Highcharts.chart("rd_r40040_value", {
//                 colors: colorSet_a430,
//                 chart: {
//                     type: 'line',
//                     style: {
//                         fontFamily: 'Kanit'
//                     }
//                 },
//                 title: {
//                     text: "สถิติการชำระเงินทุกช่องทาง 6 เดือนล่าสุด",
//                     style: {
//                         fontSize: '14px',
//                     }
//                 },
//                 xAxis: {
//                     type: 'datetime',
//                     tickInterval: setDaysInterval(14),
//                     labels: {
//                         format: '{value:%d/%m/%Y}',
//                     }, 
//                     gridLineWidth: 1,
//                 },
//                 yAxis: { 
//                     title: {
//                         text: '',
//                     },
//                     min: 0,
//                 },
//                 tooltip: {
//                     shared: true,
//                     headerFormat: '<p style="font-size: 14px">{point.x:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
//                     style: {
//                         "fontSize": "14px",
//                     },
//                 },
//                 series: data_c_rie_value
//             });

//             loadFlagEventPushCrie(rd_chart);

//             rd_chart = Highcharts.chart("rd_r40040_ma30", {
//                 colors: colorSet_a430,
//                 chart: {
//                     type: 'line',
//                     style: {
//                         fontFamily: 'Kanit'
//                     }
//                 },
//                 title: {
//                     text: "ค่าเฉลี่ย 30 วัน การชำระเงินทุกช่องทาง 6 เดือนล่าสุด",
//                     style: {
//                         fontSize: '14px',
//                     }
//                 },
//                 xAxis: {
//                     type: 'datetime',
//                     min: setPointStart(start_data_r40040),
//                     tickInterval: setDaysInterval(14),
//                     labels: {
//                         format: '{value:%d/%m/%Y}',
//                     }, 
//                     gridLineWidth: 1,
//                 },
//                 yAxis: { 
//                     title: {
//                         text: '',
//                     },
//                     min: 0,
//                 },
//                 legend: {
//                     maxHeight: 30
//                 },
//                 tooltip: {
//                     shared: true,
//                     headerFormat: '<p style="font-size: 14px">{point.x:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
//                     style: {
//                         "fontSize": "14px",
//                     },
//                 },
//                 series: data_c_rie_ma30
//             });

//             loadFlagEventPushCrie(rd_chart);
//         },
//         error: function(x, t, m) {
//             console.log('x>' + x + ' t>' + t + ' m>' + m);

//             ajaxError();
//         }
//     });
// }

function loadFlagEventPushCrie(rd_chart) {
    var url = "ajax_chart.aspx?qrs=SP_FLAG_EVENT_A40";
    console.log("loadFlagEventPushCrie = " + url);

    var y_flag = rd_chart.chartHeight;
    y_flag = rd_chart.legend.legendHeight - y_flag + 90;

    var y_flax = rd_chart.xAxis[0].height * -1;

    if(y_flax > y_flag) {
        y_flag = y_flax;
    }

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            $.each(data,function( i,item ) {
                var x_dtm = new Date(item.dtm);
                var EVENT_TITLE = itemNull(item.EVENT_TITLE);
                var EVENT_TEXT = itemNull(item.EVENT_TEXT);
                var FLAG_COLOR = itemNullByText(item.FLAG_COLOR, '#FFFFFF');
                var FONT_COLOR = itemNullByText(item.FONT_COLOR, '#343436');

                rd_chart.addSeries({
                    type: 'flags',
                    allowOverlapX: true,
                    shape: 'squarepin',
                    name: EVENT_TITLE,
                    color: FLAG_COLOR,
                    fillColor: FLAG_COLOR,
                    lineColor: FLAG_COLOR,
                    style: {
                        "fontSize": "12px", 
                        color: FONT_COLOR
                    },
                    data: [{ 
                        x: setPointStart(x_dtm), 
                        title: EVENT_TITLE,
                        text: EVENT_TEXT, 
                    }],
                    states: {
                        hover: {
                            fillColor: FLAG_COLOR,
                            lineColor: FLAG_COLOR,
                        },
                    },
                    cursor: 'none',
                    y: y_flag,
                    showInLegend: false
                });
            });
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r40030() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=40030";
    console.log("load_40030 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 

            var data_bar_value = [];
            var data_bar_per = [];
            var data_c_rie_value = [];
            var data_c_rie_percent = [];

            var arr_categories = [];
            var temp_categories = '';

            $.each(data,function( i,item ) {
                var str_categories = getStrMMYYYY(item.mm, item.yyyy, "");

                if(temp_categories != str_categories){
                    temp_categories = str_categories;
                    arr_categories.push(str_categories);
                }
            });

            data.sort((a,b) => (a.PAYMENT_CATEGORY > b.PAYMENT_CATEGORY) ? 1 : ((b.PAYMENT_CATEGORY > a.PAYMENT_CATEGORY) ? -1 : 0)); 
            
            temp_categories = '';
            $.each(data,function( i,item ) {
                if(temp_categories != item.PAYMENT_CATEGORY){
                    temp_categories = item.PAYMENT_CATEGORY;
                    data_bar_value[temp_categories] = [];
                    data_bar_per[temp_categories] = [];
                }

                data_bar_value[temp_categories].push({
                    y: parseInt(item.COUNT_PAY),
                    per: parseFloat(item.PERCENT_PAY),
                });

                // data_bar_value[temp_categories].push(parseInt(item.COUNT_PAY));
                // data_bar_per[temp_categories].push(parseFloat(item.PERCENT_PAY));
            });

            temp_categories = '';
            $.each(data,function( i,item ) {
                if(temp_categories != item.PAYMENT_CATEGORY){
                    temp_categories = item.PAYMENT_CATEGORY;

                    data_c_rie_value.push({
                        name: temp_categories,
                        data: data_bar_value[temp_categories],
                        maxPointWidth: 75,
                    });

                    // data_c_rie_percent.push({
                    //     name: temp_categories,
                    //     data: data_bar_per[temp_categories],
                    //     maxPointWidth: 75,
                    // });
                }
            });

            Highcharts.chart('rd_r40030_value', {
                colors: colorSet_a430,
                chart: {
                    height: 400,
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "จำนวนครั้งการชำระเงิน ผ่านทุกช่องทาง",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                },
                yAxis: {
                    title: {
                        text: '',
                    },
                    stackLabels: {
                        enabled: true,
                        allowOverlap: true,
                        rotation: -90,
                        x: 15,
                        y: 15,
                        style: {
                            fontSize: '12px',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'white'
                        }
                    }
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                        }
                    },
                },
                series: data_c_rie_value
            });

            Highcharts.chart('rd_r40030_per', {
                colors: colorSet_a430,
                chart: {
                    height: 400,
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สัดส่วนการชำระเงิน ผ่านทุกช่องทาง",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                },
                yAxis: {
                    title: {
                        text: '',
                    },
                    labels: {
                        format: '{value}%'
                    },
                    min: 0,
                    max: 100
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                    pointFormat: '<span style="color:{point.color}">●</span> {series.name}: <b>{point.percentage:.0f}%</b><br/>',
                },
                plotOptions: {
                    column: {
                        stacking: 'percent',
                        dataLabels: {
                            enabled: true,
                            formatter: function () {
                                return Math.round(100 * this.y / this.total) + '%';
                            },
                        }
                    },
                },
                series: data_c_rie_value
                // tooltip: {
                //     shared: true,
                //     headerFormat: '<p style="font-size: 14px">{point.key}</p><br><hr>',
                //     style: {
                //         "fontSize": "14px",
                //     },
                //     valueSuffix: '%'
                // },
                // plotOptions: {
                //     column: {
                //         stacking: 'percent',
                //         dataLabels: {
                //             enabled: true,
                //             format: '{y}%',
                //         }
                //     },
                // },
                // series: data_c_rie_percent
            });
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r40021() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=40021";
    console.log("load_40021 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 

            var data_bar_value = [];
            var data_bar_per = [];
            var data_c_rie_value = [];
            var data_c_rie_percent = [];

            var arr_categories = [];
            var temp_categories = '';

            $.each(data,function( i,item ) {
                var str_categories = getStrMMYYYY(item.mm, item.yyyy, "");

                if(temp_categories != str_categories){
                    temp_categories = str_categories;
                    arr_categories.push(str_categories);
                }
            });

            data.sort((a,b) => (a.PayByCanal > b.PayByCanal) ? 1 : ((b.PayByCanal > a.PayByCanal) ? -1 : 0)); 
            
            temp_categories = '';
            $.each(data,function( i,item ) {
                if(temp_categories != item.PayByCanal){
                    temp_categories = item.PayByCanal;
                    data_bar_value[temp_categories] = [];
                    data_bar_per[temp_categories] = [];
                }

                data_bar_value[temp_categories].push({
                    y: parseInt(item.COUNT_PAY),
                    per: parseFloat(item.PERCENT_PAY),
                });

                // data_bar_value[temp_categories].push(parseInt(item.COUNT_PAY));
                // data_bar_per[temp_categories].push(parseFloat(item.PERCENT_PAY));
            });

            temp_categories = '';
            $.each(data,function( i,item ) {
                if(temp_categories != item.PayByCanal){
                    temp_categories = item.PayByCanal;

                    data_c_rie_value.push({
                        stack: 'column1',
                        name: temp_categories,
                        data: data_bar_value[temp_categories],
                        maxPointWidth: 75,
                    });

                    // data_c_rie_percent.push({
                    //     stack: 'column1',
                    //     name: temp_categories,
                    //     data: data_bar_per[temp_categories],
                    //     maxPointWidth: 75,
                    // });
                }
            });

            Highcharts.chart('rd_r40021_value', {
                colors: colorSet_a421,
                chart: {
                    height: 400,
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "จำนวนครั้งการชำระเงิน ผ่านช่องทาง Web & App ",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                },
                yAxis: {
                    title: {
                        text: '',
                    },
                    stackLabels: {
                        enabled: true,
                        allowOverlap: true,
                        rotation: -90,
                        x: 12,
                        y: 15,
                        style: {
                            fontSize: '12px',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'white'
                        }
                    }
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                        }
                    },
                },
                series: data_c_rie_value
            });

            Highcharts.chart('rd_r40021_per', {
                colors: colorSet_a421,
                chart: {
                    height: 400,
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สัดส่วนการชำระเงิน ผ่านช่องทาง Web & App",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                },
                yAxis: {
                    title: {
                        text: '',
                    },
                    labels: {
                        format: '{value}%'
                    },
                    min: 0,
                    max: 100
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                    pointFormat: '<span style="color:{point.color}">●</span> {series.name}: <b>{point.percentage:.0f}%</b><br/>',
                },
                plotOptions: {
                    column: {
                        stacking: 'percent',
                        dataLabels: {
                            enabled: true,
                            formatter: function () {
                                return Math.round(100 * this.y / this.total) + '%';
                            },
                        }
                    },
                },
                series: data_c_rie_value
            });
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r40022() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=40022";
    console.log("load_40022 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 

            var data_bar_value = [];
            var data_bar_per = [];
            var data_c_rie_value = [];
            var data_c_rie_percent = [];

            var arr_categories = [];
            var temp_categories = '';

            $.each(data,function( i,item ) {
                var str_categories = getStrMMYYYY(item.mm, item.yyyy, "");

                if(temp_categories != str_categories){
                    temp_categories = str_categories;
                    arr_categories.push(str_categories);
                }
            });

            data.sort((a,b) => (a.PayType > b.PayType) ? 1 : ((b.PayType > a.PayType) ? -1 : 0)); 
            
            $.each(data,function( i,item ) {
                var str_categories = item.PayByCanal + " " + item.PayType;

                if(temp_categories != str_categories){
                    temp_categories = str_categories;
                    data_bar_value[temp_categories] = [];
                    data_bar_per[temp_categories] = [];
                }

                data_bar_value[temp_categories].push({
                    y: parseInt(item.COUNT_PAY),
                    per: parseFloat(item.PERCENT_PAY),
                });

                // data_bar_value[temp_categories].push(parseInt(item.COUNT_PAY));
                // data_bar_per[temp_categories].push(parseFloat(item.PERCENT_PAY));
            });

            temp_categories = '';
            $.each(data,function( i,item ) {
                var str_categories = item.PayByCanal + " " + item.PayType;

                if(temp_categories != str_categories){
                    temp_categories = str_categories;

                    data_c_rie_value.push({
                        stack: 'column2',
                        name: temp_categories,
                        data: data_bar_value[temp_categories],
                        maxPointWidth: 35,
                    });

                    // data_c_rie_percent.push({
                    //     stack: 'column2',
                    //     name: temp_categories,
                    //     data: data_bar_per[temp_categories],
                    //     maxPointWidth: 35,
                    // });
                }
            });

            load_r40023(data_c_rie_value, data_c_rie_percent, arr_categories);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}


function load_r40023(data_c_rie_value, data_c_rie_percent, arr_categories) {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=40023";
    console.log("load_40023 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var data_bar_value = [];
            var data_bar_per = [];
            var temp_categories = '';

            data.sort((a,b) => (a.PayType > b.PayType) ? 1 : ((b.PayType > a.PayType) ? -1 : 0)); 
            
            $.each(data,function( i,item ) {
                var str_categories = item.PayByCanal + " " + item.PayType;

                if(temp_categories != str_categories){
                    temp_categories = str_categories;
                    data_bar_value[temp_categories] = [];
                    data_bar_per[temp_categories] = [];
                }

                data_bar_value[temp_categories].push({
                    y: parseInt(item.COUNT_PAY),
                    per: parseFloat(item.PERCENT_PAY),
                });

                // data_bar_value[temp_categories].push(parseInt(item.COUNT_PAY));
                // data_bar_per[temp_categories].push(parseFloat(item.PERCENT_PAY));
            });

            temp_categories = '';
            $.each(data,function( i,item ) {
                var str_categories = item.PayByCanal + " " + item.PayType;

                if(temp_categories != str_categories){
                    temp_categories = str_categories;

                    data_c_rie_value.push({
                        stack: 'column3',
                        name: temp_categories,
                        data: data_bar_value[temp_categories],
                        maxPointWidth: 35,
                    });

                    // data_c_rie_percent.push({
                    //     stack: 'column3',
                    //     name: temp_categories,
                    //     data: data_bar_per[temp_categories],
                    //     maxPointWidth: 35,
                    // });
                }
            });

            Highcharts.chart('rd_r40022_value', {
                colors: colorSet_a422,
                chart: {
                    height: 400,
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "จำนวนครั้งการชำระเงิน ผ่านช่องทาง Web & App ",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                },
                yAxis: {
                    title: {
                        text: '',
                    },
                    reversedStacks: false,
                    stackLabels: {
                        enabled: true,
                        allowOverlap: true,
                        rotation: -90,
                        x: 12,
                        y: 15,
                        style: {
                            fontSize: '12px',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'white'
                        }
                    }
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                        }
                    },
                },
                series: data_c_rie_value
            });

            Highcharts.chart('rd_r40022_per', {
                colors: colorSet_a422,
                chart: {
                    height: 400,
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สัดส่วนการชำระเงิน ผ่านช่องทาง Web & App",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                },
                yAxis: {
                    title: {
                        text: '',
                    },
                    reversedStacks: false,
                    labels: {
                        format: '{value}%'
                    },
                    min: 0,
                    max: 100
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                    pointFormat: '<span style="color:{point.color}">●</span> {series.name}: <b>{point.percentage:.0f}%</b><br/>',
                },
                plotOptions: {
                    column: {
                        stacking: 'percent',
                        dataLabels: {
                            enabled: true,
                            formatter: function () {
                                return Math.round(100 * this.y / this.total) + '%';
                            },
                        }
                    },
                },
                series: data_c_rie_value
            });
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r40050() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=40051";
    console.log("load_40050 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var data_count_new_user_qr = [];
            var data_count_old_user_qr = [];
            var start_data_r40050 = new Date(data[0].dtm);

            $.each(data,function( i,item ) {
                data_count_new_user_qr.push(parseInt(item.COUNT_NEW_USER_QR));
                data_count_old_user_qr.push(parseInt(item.COUNT_OLD_USER_QR));
            });

            var rd_chart = Highcharts.chart("rd_r40050", {
                colors: colorSet_a450,
                chart: {
                    // type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "จำนวน Account ที่ชำระผ่าน QR Code รายใหม่ กับ รายเก่า",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    type: 'datetime',
                    tickInterval: setDaysInterval(14),
                    labels: {
                        format: '{value:%d/%m/%Y}',
                    }, 
                    gridLineWidth: 1,
                },
                yAxis: { 
                    title: {
                        text: '',
                    },
                    min: 0,
                    stackLabels: {
                        enabled: true,
                        allowOverlap: true,
                        rotation: -90,
                        x: 12,
                        y: 15,
                        style: {
                            fontSize: '12px',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'white'
                        }
                    },
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.x:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                        }
                    },
                },
                series: [
                {
                    type: 'column',
                    name: 'ชำระผ่าน QR Code รายใหม่',
                    data: data_count_new_user_qr,
                    pointStart: setPointStart(start_data_r40050),
                    pointInterval: setDaysInterval(1),
                    maxPointWidth: 35,
                }, 
                {
                    type: 'column',
                    name: 'ชำระผ่าน QR Code รายเก่า',
                    data: data_count_old_user_qr,
                    pointStart: setPointStart(start_data_r40050),
                    pointInterval: setDaysInterval(1),
                    maxPointWidth: 35,
                }, {
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'ชำระผ่าน QR Code รายใหม่',
                    data: data_count_new_user_qr,
                    pointStart: setPointStart(start_data_r40050),
                    pointInterval: setDaysInterval(1),
                }, 
                ]
            });

            rd_chart = Highcharts.chart("rd_r40051", {
                colors: colorSet_a450,
                chart: {
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สัดส่วน Account ที่ชำระผ่าน QR Code รายใหม่ กับ รายเก่า",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    type: 'datetime',
                    tickInterval: setDaysInterval(14),
                    labels: {
                        format: '{value:%d/%m/%Y}',
                    }, 
                    gridLineWidth: 1,
                },
                yAxis: { 
                    title: {
                        text: '',
                    },
                    labels: {
                        format: '{value}%'
                    },
                    min: 0,
                    max: 100
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                tooltip: {
                    shared: true,
                    // headerFormat: '<p style="font-size: 14px">{point.key}</p><br><hr>',
                    headerFormat: '<p style="font-size: 14px">{point.x:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                    pointFormat: '<span style="color:{point.color}">●</span> {series.name}: <b>{point.percentage:.0f}%</b><br/>',
                },
                plotOptions: {
                    column: {
                        stacking: 'percent',
                        dataLabels: {
                            enabled: true,
                            formatter: function () {
                                return Math.round(100 * this.y / this.total) + '%';
                            },
                        }
                    },
                },
                series: [{
                    name: 'ชำระผ่าน QR Code รายใหม่',
                    data: data_count_new_user_qr,
                    pointStart: setPointStart(start_data_r40050),
                    pointInterval: setDaysInterval(1),
                    maxPointWidth: 35,
                }, 
                {
                    name: 'ชำระผ่าน QR Code รายเก่า',
                    data: data_count_old_user_qr,
                    pointStart: setPointStart(start_data_r40050),
                    pointInterval: setDaysInterval(1),
                    maxPointWidth: 35,
                }, 
                ]
            });

            load_r40010(data);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r40010(data50) {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=40010";
    console.log("load_40010 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var max_y = 0;
            var data_count_total = [];
            var data_count_web = [];
            var data_count_app = [];
            var data_count_new_user_qr = [];

            var start_data_r40010 = new Date(data[0].dtm);
            var start_data_r40050 = new Date(data50[0].dtm);

            var data_MA30_total = [];
            var SMA30_total = simple_moving_averager(30);

            $.each(data50,function( i,item ) {
                data_count_new_user_qr.push(parseInt(item.COUNT_NEW_USER_QR));
                max_y = findMax(max_y, parseInt(item.COUNT_NEW_USER_QR));
            });

            $.each(data,function( i,item ) {
                data_count_total.push(parseInt(item.COUNT_TOTAL));
                data_count_web.push(parseInt(item.COUNT_WEB));
                data_count_app.push(parseInt(item.COUNT_APP));

                var pushMA30 = Math.round(SMA30_total(parseInt(item.COUNT_TOTAL)));
                if(i >= 30){
                    data_MA30_total.push(pushMA30);
                }

                max_y = findMax(max_y, parseInt(item.COUNT_TOTAL));
                max_y = findMax(max_y, parseInt(item.COUNT_WEB));
                max_y = findMax(max_y, parseInt(item.COUNT_APP));
            });


            var rd_chart = Highcharts.chart("rd_r40010", {
                colors: colorSet_a410,
                chart: {
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สถิติการชำระเงินผ่าน Web & App 6 เดือนล่าสุด",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    type: 'datetime',
                    tickInterval: setDaysInterval(14),
                    labels: {
                        format: '{value:%d/%m/%Y}',
                    }, 
                    gridLineWidth: 1,
                },
                yAxis: [
                { 
                    // title: {
                    //     text: 'จำนวนครั้ง | จำนวน Account',
                    //     style: {
                    //         fontSize: '16px',
                    //         color: "#4796ff",
                    //     }
                    // },
                    title: {
                        text: '',
                    },
                    min: 0,
                    max: max_y,
                }, { 
                    // title: {
                    //     text: 'ค่าเฉลี่ย 30 วัน',
                    //     style: {
                    //         fontSize: '16px',
                    //         color: "#FD8C16",
                    //     }
                    // },
                    // min: 0,
                    title: {
                        text: '',
                    },
                    min: 0,
                    max: max_y,
                    opposite: true
                }
                ],
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.x:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                series: [
                {
                    yAxis: 0,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง ชำระเงินผ่าน Web & App',
                    data: data_count_total,
                    pointStart: setPointStart(start_data_r40010),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง ชำระเงินผ่าน App',
                    data: data_count_app,
                    pointStart: setPointStart(start_data_r40010),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง ชำระเงินผ่าน Web ',
                    data: data_count_web,
                    pointStart: setPointStart(start_data_r40010),
                    pointInterval: setDaysInterval(1),
                },
                {
                    yAxis: 0,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account ที่ชำระผ่าน QR Code รายใหม่*',
                    data: data_count_new_user_qr,
                    pointStart: setPointStart(start_data_r40050),
                    pointInterval: setDaysInterval(1),
                }, 
                {
                    yAxis: 1,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'ค่าเฉลี่ย 30 วัน ชำระเงินผ่าน Web & App',
                    data: data_MA30_total,
                    pointStart: setPointStart(addDays(start_data_r40010, 30)),
                    pointInterval: setDaysInterval(1),
                },
                ]
            });

            loadFlagEventPushCrie(rd_chart);

            var pfoot = '*จำนวน Account ที่ไม่เคยชำระเงินผ่าน Qr Code มาก่อนหน้านี้ (ตั้งแต่ 1 ม.ค. 2020)';
            // pfoot += "<br>*กราฟนี้จะอัพเดทข้อมูลล่าสุด เวลาประมาณ 8:30 น."
            pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
            $('#info_r40010').append(pfoot);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function loadTableT10(){
    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_A40T10_DAILY";
    console.log("loadTableT10 = " + url);

    $('#gdesc_a10_t10').html("");

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0) {
                $('.target-date').html(ddmmyyyyDate(data[0].DATE_DATA));

                data_T10 = data;
            }

            htmlTableT10(data_T10);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function htmlTableT10(data) {
    var total_BEFORE_QR = 0;
    var total_SINCE_QR = 0;
    var total_NEW_SINCE_QR = 0;
    var total_TARGET_75 = 0;

    var txt_html = "<div id='display_a40_t10'>" +
    "<table id='table_a40_t10' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
    "<thead style='font-weight: normal'>" +
        "<tr>    " +
            "<th>RO</th> " +
            "<th style='min-width:125px;'>CLUSTERS " + arrayBTN['T10_CLUSTERS'][order_T10] + "</th>   " +
            "<th width='18%' style='text-align:center;'>จำนวนลูกค้าชำระผ่าน QR<br>ก่อน 1 มิ.ย." + arrayBTN['BEFORE_QR'][order_T10] + "</th>   " +
            "<th width='18%' style='text-align:center;'>จำนวนลูกค้าชำระผ่าน QR<br>ตั้งแต่ 1 มิ.ย." + arrayBTN['SINCE_QR'][order_T10] + "</th>   " +
            "<th width='18%' style='text-align:center;'>จำนวนลูกค้าที่ชำระด้วย QR<br>เป็นครั้งแรก ตั้งแต่ 1 มิ.ย." + arrayBTN['NEW_SINCE_QR'][order_T10] + "</th>   " +
            "<th width='18%' style='text-align:center;'>สัดส่วนลูกค้าที่ชำระด้วย QR<br>เป็นครั้งแรก จากที่ชำระ<br>ในเดือน มิ.ย. ทั้งหมด" + arrayBTN['PERCENT_QR'][order_T10] + "</th>   " +
        "</tr>" +
    "</thead>" +
    "<tbody>";

    $.each(data,function( i,item ) {
        var cluster_id = item.RO + item.CLUSTER;
        cluster_id = cluster_id.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');

        txt_html += "" +
        "<tr id='tr_a40_t10_" + cluster_id + "' onclick='explanT10Prove(\"" + cluster_id + "\", \"" + item.CLUSTER + "\")' class='tr-a40-t10-cluster'>" + 
        "<td>" + item.RO + "</td>" + 
        "<td><span id='g_a40_t10_" + cluster_id + "' class='glyphicon glyphicon-plus'></span> " + item.CLUSTER + "</td>" + 
        "<td align='right'>" + parseInt(item.BEFORE_QR).toLocaleString() + "</td>" +
        "<td align='right'>" + parseInt(item.SINCE_QR).toLocaleString() + "</td>" +
        "<td align='right'>" + parseInt(item.NEW_SINCE_QR).toLocaleString() + "</td>" +
        "<td align='right'>" + parseFloat(item.PERCENT_QR).toFixed(1) + "%</td>" +
        "</tr>";

        total_BEFORE_QR += parseFloat(item.BEFORE_QR);
        total_SINCE_QR += parseFloat(item.SINCE_QR);
        total_NEW_SINCE_QR += parseFloat(item.NEW_SINCE_QR);
    });

    txt_html += "</tbody>" +
    "<tfoot style='background-color: #2a2a2a;'>" +
    "<tr class='txt-bold'>    " +
    "<td colspan='2'>Total</td>   " +
    "<td align='right'>" + parseInt(total_BEFORE_QR).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseInt(total_SINCE_QR).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseInt(total_NEW_SINCE_QR).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseFloat((total_NEW_SINCE_QR/total_SINCE_QR)*100).toFixed(1) + "%</td> " +
    "</tr>   " + 
    "</tfoot>" +
    "</table>" +
    "</div>";

    $('#display_a40_t10').replaceWith(txt_html);

    $('#table_a40_t10').fadeIn();

    var pfoot = " *เริ่มรับชำระผ่าน ThaiQR ทุกแบงค์ตั้งแต่ 16/04/2020";
    pfoot = "<p class='pfoot' style='margin-bottom: 20px;'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";

    $('#display_a40_t10').append(pfoot);

    $('#sort_' + by_T10).addClass('active-sort')
}

function explanT10Prove(id, cluster) {
    var prov_class = 'appused-prov-' + id;

    if($('.' + prov_class).length == 0) {
        loadTableT10Prov(prov_class, id, cluster);
    } else {
        if($('.' + prov_class).is(":hidden")){
            $('.' + prov_class).remove();
            loadTableT10Prov(prov_class, id, cluster);
        }
        else {
            $('#g_a40_t10_' + id).replaceWith("<span id='g_a40_t10_" + id + "' class='glyphicon glyphicon-plus'></span>");
            $('.' + prov_class).hide();
        }
    }
}

function loadTableT10Prov(prov_class, id, cluster){
    $('#g_a40_t10_' + id).replaceWith("<span id='g_a40_t10_" + id + "' class='glyphicon glyphicon-refresh gly-spin'></span>");

    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_A40T10_PROV_DAILY&cluster=" + cluster;
    console.log("loadTableT10Prov = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0){
                data = dataSort(data, by_T10, order_T10);

                var txt_html = "";

                $.each(data,function( i,item ) {
                    txt_html += "<tr class='" + prov_class + " tr-a40-t10-prov'>    " +
                    "<td align='right' colspan='2'>" + item.PROVINCE + "</td>   " +
                    "<td align='right'>" + parseInt(item.BEFORE_QR).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseInt(item.SINCE_QR).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseInt(item.NEW_SINCE_QR).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseFloat(item.PERCENT_QR).toFixed(1) + "%</td>" +
                    "</tr>";
                });

                $('#tr_a40_t10_' + id).after(txt_html);

                $('#g_a40_t10_' + id).replaceWith("<span id='g_a40_t10_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");
            }
        },
        error: function(x, t, m) {
            $('#g_a40_t10_' + id).replaceWith("<span id='g_a40_t10_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");

            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function dataSortT10(by = '', order = '') {
    by_T10 = by;
    order_T10 = order;
    data_T10 = dataSort(data_T10, by_T10, order_T10);
    htmlTableT10(data_T10);
}

function dataSort(data, by = '', order = '') {
    if(by == 'BEFORE_QR'){
        data.sort(function(a, b){return a.BEFORE_QR - b.BEFORE_QR});
    }
    else if(by == 'SINCE_QR'){
        data.sort(function(a, b){return a.SINCE_QR - b.SINCE_QR});
    }
    else if(by == 'SINCE_QR'){
        data.sort(function(a, b){return a.SINCE_QR - b.SINCE_QR});
    }
    else if(by == 'NEW_SINCE_QR'){
        data.sort(function(a, b){return a.NEW_SINCE_QR - b.NEW_SINCE_QR});
    }
    else if(by == 'PERCENT_QR'){
        data.sort(function(a, b){return a.PERCENT_QR - b.PERCENT_QR});
    }
    else {
        data.sort((a,b) => (a.CLUSTERS > b.CLUSTERS) ? 1 : ((b.CLUSTERS > a.CLUSTERS) ? -1 : 0));
        data.sort((a,b) => (a.RO > b.RO) ? 1 : ((b.RO > a.RO) ? -1 : 0));
    }

    if(order == 'desc'){
        data.reverse();
    }

    return data;
}
</script>

<style type="text/css">
.canvasjs-chart-credit, .highcharts-credits {
    display: none;
}
</style>