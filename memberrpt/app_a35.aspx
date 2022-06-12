<%@ Page Language="VB" AutoEventWireup="false" CodeFile="app_a35.aspx.vb" Inherits="app_a35" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT A35</title>

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
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartApp.css?vs=20" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartDark.css?vs=199" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script type="text/javascript" src="App_Inc/canvasjs-2.3.2/canvasjs.min.js"></script>
    <script type="text/javascript" src="App_Inc/jquery.inview/jquery.inview.min.js"></script>
    <script type="text/javascript" src="App_Inc/Highcharts-7.1.3/code/highcharts.js"></script>

    <script type="text/javascript" src="App_Inc/_js/panu.js?vs=19"></script>

    <style type="text/css">
    .hide-tr-10020, .hide-tr-10050, .hide-tr-10070, .hide-tr-xpt {
        display: none;
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
                    <li class="full-bar active"><a href="app_a35.aspx">A35 ข้อมูลการใช้ Coin</a></li>
                    <li class="full-bar"><a href="app_a40.aspx">A40 ข้อมูลการชำระเงิน</a></li>

                    <li class="mini-bar"><a href="app_a10.aspx" title="A10 สถิติการใช้งาน App">A10</a></li>
                    <li class="mini-bar"><a href="app_a15.aspx" title="A15 สถิติ ก.พ. 2020">A15</a></li>
                    <li class="mini-bar"><a href="app_a20.aspx" title="A20 ความถี่การใช้งาน App">A20</a></li>
                    <li class="mini-bar"><a href="app_a30.aspx" title="A30 ข้อมูลการใช้ Point">A30</a></li>
                    <li class="mini-bar active"><a href="app_a35.aspx">A35 ข้อมูลการใช้ Coin</a></li>
                    <li class="mini-bar"><a href="app_a40.aspx" title="A40 ข้อมูลการชำระเงิน">A40</a></li>
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

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <div class="inview" id="rd_r10084">
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
                <div class="inview" id="rd_r10082">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>

                <div class="col-xs-6" style="padding:0">
                    <div id="rd_r10082_coin"></div>
                </div>

                <div class="col-xs-6" style="padding:0">
                    <div id="rd_r10082_avg"></div>
                </div>
                <!-- <div id="rd_r10032"></div> -->

                <!-- <div id="info_r10020"></div> -->

                <div id="display_r10082"></div>
                <!-- <div id="display_r10032"></div> -->
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <div class="inview" id="rd_r10083">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
                
                <div id="rd_r10083_per"></div>
                <div id="display_r10083"></div>
                <%-- <div id="display_r10083_per"></div> --%>
            </div>
        </div>
    </div>

    <div class="container" style="display:none;">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <p class="title-target">สรุปจำนวนผู้ใช้ Application และ Coin แต่ละเดือน (ข้อมูลเดือนล่าสุด ณ. สิ้นวันที่ <span class="xpt-date">__/__/____</span>)</p>
                <div class="inview" id="display_x_point">
                    <h2 class="text-center">ไม่มีข้อมูล</h2>
                    <%-- <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div> --%>
                </div>

            </div>
        </div>
    </div>
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
var colorSet_r84 = ['#4796ff', '#F15723', '#8dc900', '#a0a0a0'];
var colorSet_r82 = ['#4796ff', '#8dc900', '#a0a0a0', '#0059ce'];
var colorSet_r82coin = ['#FD8C16'];
var colorSet_r82avg = ['#ffdf44', '#0059ce'];
// var colorSet_inout = ['#12E55C', '#BF3D1C'];
// var colorSet_inout = ['#4796ff', '#FD8C16', '#0059ce', '#bf3d1c', '#8dc900'];
var colorSet_inout = ['#4796ff', '#bf3d1c', '#FD8C16', '#8dc900', '#ffdf44'];
</script>

<script type="text/javascript" src="App_Inc/_js/chartApp.js?vs=1999"></script>
<script type="text/javascript" src="App_Inc/_js/chartDark.js?vs=199"></script>

<script type="text/javascript">
$(document).ready(function() { 
    load_r10082();
    // load_r10032();
    startInview();
});

function startInview() {
    $('.inview').one('inview', function (e, isInView) {
        if (isInView) {
            switch (this.id) {
                case "rd_r10084": load_r10084();
                break;
                case "rd_r10083": load_r10083();
                break;
                //case "display_x_point": loadTableAccXpoint();
                //break;
            }
        }
    });
}

function load_r10083() {
    //var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10083";
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10085";
    console.log("load_10085 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {
            // R10083 = ที่รับ
            // R10085 = adjust
            // R10082 = redeem
            // R10085 + R10082 = ที่ใช้

            var data_R10082_acc_coin = [];
            var data_R10083_acc_coin = [];
            var data_R10085_acc_coin = [];
            
            var data_R10085_adjust_acc_coin = [];
            var data_nonused_acc_coin = [];

            var data_R10082_per_coin = [];
            var data_R10083_per_coin = [];
            var data_R10085_per_coin = [];

            var start_data_r10083 = new Date(data[0].dtm);
            var accam_add_coin = 0;
            var accam_used_coin = 0;
            var accam_redeem_coin = 0;

            var accam_adjust_coin = 0;
            var accam_nonused_coin = 0;

            $.each(data,function( i,item ) {
                accam_add_coin += parseInt(item.R10083_sum_coin);
                accam_used_coin += parseInt(item.R10082_sum_coin)+parseInt(item.R10085_sum_coin);
                accam_adjust_coin += parseInt(item.R10085_sum_coin);
                accam_redeem_coin += parseInt(item.R10082_sum_coin);

                accam_nonused_coin += parseInt(item.R10083_sum_coin)-(parseInt(item.R10082_sum_coin)+parseInt(item.R10085_sum_coin));
                
                data_R10083_acc_coin.push(accam_add_coin);
                data_R10085_acc_coin.push(accam_used_coin);
                data_R10085_adjust_acc_coin.push(accam_adjust_coin);
                data_R10082_acc_coin.push(accam_redeem_coin);

                data_nonused_acc_coin.push(accam_nonused_coin);

                //---------------------------------------------------------
                var percal_all = accam_add_coin;//(accam_add_coin - accam_used_coin) + accam_adjust_coin + accam_redeem_coin;

                var percal_add_coin = accam_add_coin - accam_used_coin;
                percal_add_coin = calPercent(percal_add_coin, percal_all);
                percal_add_coin = parseFloat(fixDecimal(2, percal_add_coin));

                var percal_used_coin = calPercent(accam_adjust_coin, percal_all);
                percal_used_coin = parseFloat(fixDecimal(2, percal_used_coin));

                var percal_redeem_coin = calPercent(accam_redeem_coin, percal_all);
                percal_redeem_coin = parseFloat(fixDecimal(2, percal_redeem_coin));

                data_R10083_per_coin.push(percal_add_coin);
                data_R10085_per_coin.push(percal_used_coin);
                data_R10082_per_coin.push(percal_redeem_coin);

                /////////////////////////////////
 
            });

            <%-- console.table(data_R10083_acc_coin);
            console.table(data_R10085_acc_coin);
            console.table(data_R10082_acc_coin); --%>

            Highcharts.chart("rd_r10083", {
                colors: colorSet_inout,
                chart: {
                    height: 500,
                    //renderTo: 'container',
                    type: 'area',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "ข้อมูล Coin สะสมรายวัน ",
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
                        text: ''
                    },
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                plotOptions: {
                    //series: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                },
                series: [
                 {
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'ยอด Coin ที่ให้สะสม',
                    data: data_R10083_acc_coin,
                    pointStart: setPointStart(start_data_r10083),
                    pointInterval: setDaysInterval(1),
                }
                , { 
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'ยอด Coin ที่ถูกใช้สะสม',
                    data: data_R10085_acc_coin,
                    pointStart: setPointStart(start_data_r10083),
                    pointInterval: setDaysInterval(1), 
                }
                , { 
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'ยอด Coin ที่ถูก redeem',
                    data: data_R10082_acc_coin,
                    pointStart: setPointStart(start_data_r10083),
                    pointInterval: setDaysInterval(1), 
                }]
            });

            Highcharts.chart("rd_r10083_per", {
                colors: colorSet_inout,
                chart: {
                    height: 365,
                    type: 'area',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    // text: "สัดส่วน Point ทียังไม่ถูกใช้ กับถูกใช้แล้ว ",
                    text: "",
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
                        text: ''
                    },
                    labels: {
                        format: '{value}%'
                    },
                    min: 0,
                    max: 100
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                    valueSuffix: '%'
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                    area: {
                        stacking: 'percent',
                    }
                },
                series: [
                {
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'เปอร์เซ็น ยอด Coin คงเหลือในระบบ',
                    data: data_R10083_per_coin,
                    pointStart: setPointStart(start_data_r10083),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'เปอร์เซ็น ยอด Coin ที่ถูก Adjust สะสม',
                    data: data_R10085_per_coin,
                    pointStart: setPointStart(start_data_r10083),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'เปอร์เซ็น ยอด Coin ที่ถูก Redeem สะสม',
                    data: data_R10082_per_coin,
                    pointStart: setPointStart(start_data_r10083),
                    pointInterval: setDaysInterval(1),
                }]
            });

            var txt_table = "<div id='display_r10083'>" +
            "<table id='table_r10083' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead style='font-weight: normal'>" +
            "<tr >" +
            "<th rowspan='2'>วันที่</th>" +
            "<th colspan='5' style='text-align:center;'>ข้อมูล Coin สะสมรายวัน</th>" +
            "<th colspan='3' style='text-align:center;'>เปอร์เซ็น Coin สะสมรายวัน</th>" +
            "</tr>" +
            "<tr>" +
                "<th style='vertical-align:middle;text-align:center;color:" + colorSet_inout[0] + ";'>ยอด Coin ที่ให้สะสม </th>   " +
                "<th style='text-align:center;color:" + colorSet_inout[1] + ";'>ยอด Coin ที่ถูก <br/> Adjust สะสม </th>   " +
                "<th style='text-align:center;color:" + colorSet_inout[2] + ";'>ยอด Coin ที่ถูก <br/> Redeem สะสม </th>   " +
                "<th style='vertical-align:middle;text-align:center;color:" + colorSet_inout[3] + ";'>ยอด Coin ที่ถูกใช้สะสม </th>   " +
                "<th style='vertical-align:middle;text-align:center;color:" + colorSet_inout[4] + ";'>ยอด Coin คงเหลือในระบบ </th>   " +
                "<th style='vertical-align:middle;text-align:center;color:" + colorSet_inout[0] + ";'>ยอด Coin คงเหลือในระบบ </th>   " +
                "<th style='text-align:center;color:" + colorSet_inout[1] + ";'>ยอด Coin ที่ถูก <br/> Adjust สะสม </th>   " +
                "<th style='text-align:center;color:" + colorSet_inout[2] + ";'>ยอด Coin ที่ถูก <br/> Redeem สะสม </th>   " +
            "</tr>" +
            "</thead>" +
            "<tbody>";

            for (var i = data.length - 1; i >= 0; i--) {
                var cls_tr = ""

                if(i <= data.length-6){
                    cls_tr = "hide-tr-10020"
                }

                txt_table += "<tr class='" + cls_tr + "'>" + 
                "<td>" + data[i].dtm + "</td>" + 
                "<td align='right'>" + data_R10083_acc_coin[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10085_adjust_acc_coin[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10082_acc_coin[i].toLocaleString() + "</td>" +
                "<td align='right'>" + data_R10085_acc_coin[i].toLocaleString() + "</td>" +
                "<td align='right'>" + data_nonused_acc_coin[i].toLocaleString() + "</td>" +
                "<td align='right'>" + data_R10083_per_coin[i].toLocaleString() + "%</td>" + 
                "<td align='right'>" + data_R10085_per_coin[i].toLocaleString() + "%</td>" + 
                "<td align='right'>" + data_R10082_per_coin[i].toLocaleString() + "%</td>" +
                //"<td align='right'>" + data_R10082_avg[i].toLocaleString() + "</td>" + 
                "</tr>";
            };

            txt_table += "</tbody>" +
            "<tfoot class='dilld'>" +
            "<tr class='full-tr-10020'><td colspan='9' onclick=\"full_table('10020');\"><span class='glyphicon glyphicon-menu-down'></span> แสดงทั้งหมด</td></tr>" +
            "<tr class='hide-tr-10020'><td colspan='9' onclick=\"hide_table('10020');\"><span class='glyphicon glyphicon-menu-up'></span> แสดงน้อยลง</td></tr>" +
            "</tfoot>" +
            "</table>" +
            "</div>";

            $('#display_r10083').replaceWith(txt_table);
            $('#table_r10083').fadeIn();

            <%-- var txt_table = "<div id='display_r10083_per'>" +
            "<table id='table_r10083_per' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead>" +
            "<tr style='font-weight: normal'>" +
            "<th>วันที่</th>   " +
            "<th width='22%' style='text-align:center;color:" + colorSet_inout[0] + ";'>เปอร์เซ็น Coin ที่ยังไม่ถูกใช้สะสม </th>   " +
            "<th width='22%' style='text-align:center;color:" + colorSet_inout[1] + ";'>เปอร์เซ็น Coin ที่ถูกใช้แล้วสะสม </th>   " +
            "<th width='22%' style='text-align:center;color:" + colorSet_inout[2] + ";'>เปอร์เซ็น Coin ที่ถูกใช้สะสมรายวัน </th>   " +
            "</tr>" +
            "</thead>" +
            "<tbody>";

            for (var i = data.length - 1; i >= 0; i--) {
                var cls_tr = ""

                if(i <= data.length-6){
                    cls_tr = "hide-tr-10020"
                }

                txt_table += "<tr class='" + cls_tr + "'>" + 
                "<td>" + data[i].dtm + "</td>" + 
                "<td align='right'>" + data_R10083_per_coin[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10082_per_coin[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10085_per_coin[i].toLocaleString() + "</td>" +
                //"<td align='right'>" + data_R10082_avg[i].toLocaleString() + "</td>" + 
                "</tr>";
            };

            txt_table += "</tbody>" +
            "<tfoot class='dilld'>" +
            "<tr class='full-tr-10020'><td colspan='4' onclick=\"full_table('10020');\"><span class='glyphicon glyphicon-menu-down'></span> แสดงทั้งหมด</td></tr>" +
            "<tr class='hide-tr-10020'><td colspan='4' onclick=\"hide_table('10020');\"><span class='glyphicon glyphicon-menu-up'></span> แสดงน้อยลง</td></tr>" +
            "</tfoot>" +
            "</table>" +
            "</div>";

            $('#display_r10083_per').replaceWith(txt_table);
            $('#table_r10083_per').fadeIn(); --%>
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r10082() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10082";
    console.log("load_10082 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var data_R10082_count_in_day = [];
            var data_R10082_count_acc = [];
            var data_R10082_sum_coin = [];
            var data_R10082_avg = [];

            var data_R10082_count_acc_accum = [];
            var data_R10082_sum_coin_accum = [];

            var max_y = 0;
            var max_y2 = 0;
            var start_data_r10082 = new Date(data[0].dtm);

            let count_acc_accum = 0;
            let sum_coin_accum = 0;

            $.each(data,function( i,item ) {
                
                data_R10082_count_in_day.push(parseInt(item.R10082_count_in_day));
                data_R10082_count_acc.push(parseInt(item.R10082_count_acc));
                data_R10082_sum_coin.push(parseInt(item.R10082_sum_coin));

                count_acc_accum += parseInt(item.R10082_count_in_day);
                sum_coin_accum += parseInt(item.R10082_sum_coin);

                data_R10082_count_acc_accum.push(parseInt(count_acc_accum));
                data_R10082_sum_coin_accum.push(parseInt(sum_coin_accum));

                //max_y2 = findMax(max_y2, parseInt(item.R10082_count_in_day));
                max_y = findMax(max_y, parseInt(item.R10082_count_acc));
                max_y2 = findMax(max_y2, parseInt(item.R10082_sum_coin));

                data_R10082_avg.push( parseFloat(fixDecimal(1, (parseInt(item.R10082_count_in_day) / parseInt(item.R10082_count_acc)) )) );
            });

            <%-- console.log(data_R10082_count_acc);
            console.log(data_R10082_count_acc_accum);

            console.log(data_R10082_sum_coin);
            console.log(data_R10082_sum_coin_accum); --%>


            Highcharts.chart("rd_r10082", {
                colors: colorSet_r82,
                chart: {
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สถิติจำนวนการใช้งาน Coin รายวัน ",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    type: 'datetime',
                    tickInterval: setDaysInterval(7),
                    labels: {
                        format: '{value:%d/%m/%Y}',
                    }, 
                    gridLineWidth: 1,
                },
                yAxis: [
                    { 
                        title: {
                            text: 'จำนวน Account ที่ใช้',
                            style: {
                                fontSize: '14px',
                                color: "#4796ff",
                            }
                        },
                        min: 0,
                        max: max_y
                    }, { 
                        title: {
                            text: 'จำนวน Coin ที่ใช้',
                            style: {
                                fontSize: '14px',
                                color: "#8dc900",
                            }
                        },
                        min: 0,
                        max: max_y2,
                        opposite: true
                    }
                ],
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                },
                series: [
                {
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account ที่ใช้',
                    data: data_R10082_count_acc,
                    pointStart: setPointStart(start_data_r10082),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 1,    
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Coin ที่ใช้',
                    data: data_R10082_sum_coin,
                    pointStart: setPointStart(start_data_r10082),
                    pointInterval: setDaysInterval(1),
                }]
            });

            <%-- Highcharts.chart("rd_r10082_coin", {
                colors: colorSet_r82coin,
                chart: {
                    height: 275,
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: " ",
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
                        text: ''
                    },
                    // max: 1000000
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                },
                series: [
                {
                    lineWidth: 1,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Coin ที่ใช้',
                    data: data_R10082_sum_coin,
                    pointStart: setPointStart(start_data_r10082),
                    pointInterval: setDaysInterval(1),
                }
                ]
            }); --%>

            <%-- Highcharts.chart("rd_r10082_avg", {
                colors: colorSet_r82avg,
                chart: {
                    height: 275,
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: " ",
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
                        text: ''
                    },
                    opposite: true,
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">{point.key:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                },
                series: [
                {
                    lineWidth: 1,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง/จำนวน Account',
                    data: data_R10082_avg,
                    pointStart: setPointStart(start_data_r10082),
                    pointInterval: setDaysInterval(1),
                }
                ]
            }); --%>

            var txt_table = "<div id='display_r10082'>" +
            "<table id='table_r10082' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead>" +
            "<tr style='font-weight: normal'>" +
            "<th>วันที่</th>   " +
            //"<th width='22%' style='text-align:center;color:" + colorSet_r82[0] + ";'>จำนวนครั้งที่ใช้ </th>   " +
            "<th width='22%' style='text-align:center;color:" + colorSet_r82[0] + ";'>จำนวน Account ที่ใช้ </th>   " +
            "<th width='22%' style='text-align:center;color:" + colorSet_r82[1] + ";'>จำนวน Coin ที่ใช้ </th>   " +
            "<th width='22%' style='text-align:center;color:" + colorSet_r82[2] + ";'>จำนวน Account สะสม </th>   " +
            "<th width='22%' style='text-align:center;color:" + colorSet_r82[3] + ";'>จำนวน Coin สะสม </th>   " +
            //"<th width='22%' style='text-align:center;color:" + colorSet_r82avg[0] + ";'>จำนวนครั้ง/จำนวน Account  <button type='button' class='btn btn-x-tr btn-danger hide-tr-10020' onclick=\"hide_table('10020');\"><span class='glyphicon glyphicon-remove'></span></button></th>   " +
            "</tr>" +
            "</thead>" +
            "<tbody>";

            for (var i = data.length - 1; i >= 0; i--) {
                var cls_tr = ""

                if(i <= data.length-6){
                    cls_tr = "hide-tr-10020"
                }

                txt_table += "<tr class='" + cls_tr + "'>" + 
                "<td>" + data[i].dtm + "</td>" + 
                //"<td align='right'>" + data_R10082_count_in_day[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10082_count_acc[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10082_sum_coin[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10082_count_acc_accum[i].toLocaleString() + "</td>" +
                "<td align='right'>" + data_R10082_sum_coin_accum[i].toLocaleString() + "</td>" +  
                //"<td align='right'>" + data_R10082_avg[i].toLocaleString() + "</td>" + 
                "</tr>";
            };

            txt_table += "</tbody>" +
            "<tfoot class='dilld'>" +
            "<tr class='full-tr-10020'><td colspan='5' onclick=\"full_table('10020');\"><span class='glyphicon glyphicon-menu-down'></span> แสดงทั้งหมด</td></tr>" +
            "<tr class='hide-tr-10020'><td colspan='5' onclick=\"hide_table('10020');\"><span class='glyphicon glyphicon-menu-up'></span> แสดงน้อยลง</td></tr>" +
            "</tfoot>" +
            "</table>" +
            "</div>";

            $('#display_r10082').replaceWith(txt_table);
            $('#table_r10082').fadeIn();

            // var pfoot = 'แสดงแนวโน้มการเข้าใช้งาน App ในแต่ละวัน ทั้งจำนวนครั้ง, จำนวน Account และแสดงจำนวนครั้ง, จำนวน Account ที่ไม่นับวันที่ Login ครั้งแรกออกไป ซึ่งเสมือนเป็นลูกค้าที่มีการใช้งาน App. จริงๆ';
            // pfoot += "<br>*กราฟนี้จะอัพเดทข้อมูลล่าสุด เวลาประมาณ 8:30 น."
            // pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
            // $('#info_r10020').append(pfoot);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function loadTableAccXpoint(){
    var url = "ajax_chart.aspx?qrs=SP_TBB_X_POINT_MONTHLY";
    console.log("loadTableAccXpoint = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0) {
                $('.xpt-date').html(ddmmyyyyDate(data[0].DATE_DATA));

                var txt_table = "<div id='display_x_point'>" +
                "<table id='table_x_point' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
                "<thead style='font-weight: normal'>" +
                    "<tr>    " +
                        "<th rowspan='2'>เดือน</th> " +
                        "<th rowspan='2' style='text-align:center;'>จำนวนลูกค้าที่มี App สะสม</th> " +
                        "<th colspan='2' style='text-align:center;'>ยอด Accout ที่เข้าใช้ App (รายเดือน)</th>   " +
                        "<th colspan='5' style='text-align:center;'>ยอดการใช้ Point (รายเดือน)<button type='button' class='btn btn-x-tr btn-danger hide-tr-xpt' onclick=\"hide_table('xpt');\"><span class='glyphicon glyphicon-remove'></span></button></th>   " +
                    "</tr>" +
                    "<tr>    " +
                        "<th style='text-align:center;'>จำนวน Accout</th>   " +
                        "<th style='text-align:center;'>คิดเป็น % เทียบกับ<br>ลูกค้ามี App สะสม</th>   " +
                        "<th style='text-align:center;'>จำนวน Account</th>   " +
                        "<th style='text-align:center;'>คิดเป็น % เทียบกับ<br>Accout เข้าใช้ App</th>   " +
                        "<th style='text-align:center;'>คิดเป็น % เทียบกับ<br>ลูกค้ามี App สะสม</th>   " +
                        "<th style='text-align:center;'>จำนวน Point ที่ใช้</th>   " +
                        "<th style='text-align:center;'>เฉลี่ยใช้ Point ต่อ Account</th>   " +
                    "</tr>" +
                "</thead>" +
                "<tbody>";

                $.each(data,function( i,item ) {
                    var cls_tr = ""

                    if(i > 4){
                        cls_tr = "hide-tr-xpt";
                    }

                    txt_table += "<tr class='" + cls_tr + "'>" + 
                    "<td>" + item.YYYYMM + "</td>" + 
                    "<td align='right'>" + (parseInt(item.acc_FIRST_LOGIN_ACCAM) > 0 ? parseInt(item.acc_FIRST_LOGIN_ACCAM).toLocaleString() : "-") + "</td>" +
                    "<td align='right'>" + (parseInt(item.acc_ACTIVE_APP) > 0 ? parseInt(item.acc_ACTIVE_APP).toLocaleString() : "-") + "</td>" +
                    "<td align='right'>" + (parseFloat(item.per_ACTIVE_APP) > 0 ? parseFloat(item.per_ACTIVE_APP).toFixed(1) + "%" : "-") + "</td>" +
                    "<td align='right'>" + (parseInt(item.acc_USED_PT) > 0 ? parseInt(item.acc_USED_PT).toLocaleString() : "-") + "</td>" +
                    "<td align='right'>" + (parseFloat(item.per_USED_PT_ACTIVE) > 0 ? parseFloat(item.per_USED_PT_ACTIVE).toFixed(1) + "%" : "-") + "</td>" +
                    "<td align='right'>" + (parseFloat(item.per_USED_PT) > 0 ? parseFloat(item.per_USED_PT).toFixed(1) + "%" : "-") + "</td>" +
                    "<td align='right'>" + (parseInt(item.x_PT) > 0 ? parseInt(item.x_PT).toLocaleString() : "-") + "</td>" +
                    "<td align='right'>" + (parseFloat(item.avg_PT_USED_PT) > 0 ? parseFloat(item.avg_PT_USED_PT).toFixed(1).toLocaleString() : "-") + "</td>" +
                    "</tr>";
                });

                txt_table += "</tbody>" +
                "<tfoot class='dilld'>" +
                "<tr class='full-tr-xpt'><td colspan='9' onclick=\"full_table('xpt');\"><span class='glyphicon glyphicon-menu-down'></span> แสดงทั้งหมด</td></tr>" +
                "<tr class='hide-tr-xpt'><td colspan='9' onclick=\"hide_table('xpt');\"><span class='glyphicon glyphicon-menu-up'></span> แสดงน้อยลง</td></tr>" +
                "</tfoot>" +
                "</table>" +
                "</div>";

                $('#display_x_point').replaceWith(txt_table);
                $('#table_x_point').fadeIn();
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}


function load_r10084() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10084";
    console.log("load_10084 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            console.log(data);
            var arr_categories = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'];

            var data_date = "";
            var data_r10084_day_count = [];
            var data_r10084_average_7 = [];
            var data_r10084_average_30 = [];
            var data_r10084_last_year = [];

            if(data.length > 0) {
                data_date = data[0].DATA_DATE;
            }

            $.each(data,function( i,item ) {
                data_r10084_day_count.push(parseInt(item.day_count));
                data_r10084_average_7.push(parseInt(item.average_7));
                data_r10084_average_30.push(parseInt(item.average_30));
                data_r10084_last_year.push(parseInt(item.last_year));
            });
            console.log(data_r10084_day_count);

            Highcharts.chart("rd_r10084", {
                colors: colorSet_r84,
                chart: {
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "กราฟ แสดงสถิติการใช้ Coin เฉลี่ยรายชั่วโมง เทียบกับ ข้อมูลประจำวันที่ " + data_date,
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                },
                yAxis: { 
                    title: {
                        text: ''
                    },
                },
                // tooltip: {
                //     shared: true,
                //     headerFormat: '<p style="font-size: 14px">{point.key:วัน%Aที่ %d/%m/%Y}</p><br><hr>',
                //     style: {
                //         "fontSize": "14px",
                //     },
                // },
                // plotOptions: {
                //     column: {
                //         stacking: 'normal',
                //         dataLabels: {
                //             enabled: true,
                //             color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                //         }
                //     },
                // },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px">ชั่วโมงที่ {point.key}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                series: [
                {
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'เมื่อวาน',
                    data: data_r10084_day_count,
                }
                , {
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'ค่าเฉลี่ย 7 วัน',
                    data: data_r10084_average_7,
                }
                , {
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'ค่าเฉลี่ย 30 วัน',
                    data: data_r10084_average_30,
                }
                , {
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'ปีที่แล้ว',
                    data: data_r10084_last_year,
                }]
            });
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}
</script>

<style type="text/css">
.canvasjs-chart-credit, .highcharts-credits {
    display: none;
}
</style>