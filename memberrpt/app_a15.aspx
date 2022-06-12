<%@ Page Language="VB" AutoEventWireup="false" CodeFile="app_a15.aspx.vb" Inherits="app_a15" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT A15</title>

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
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartDark.css?vs=1999" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script type="text/javascript" src="App_Inc/canvasjs-2.3.2/canvasjs.min.js"></script>
    <script type="text/javascript" src="App_Inc/jquery.inview/jquery.inview.min.js"></script>
    <script type="text/javascript" src="App_Inc/Highcharts-7.1.3/code/highcharts.js"></script>

    <script type="text/javascript" src="App_Inc/_js/panu.js?vs=19"></script>

    <style type="text/css">
    .hide-tr-10020, .hide-tr-10050, .hide-tr-10070, .hide-tr-xpt {
        display: none;
    }

    #btn_wk {
        display: none;
        position: absolute;
        z-index: 1;
    }

    #btn_wk_fake {
        position: absolute;
        z-index: 1;
    }

    .hl-75per {
        background-color:#ff8d00;
    }

    .hl-30days {
        color:#12e55c;
    }

    .hl-60days {
        color:#F1C500;
        color:#12e55c;
    }

    .hl-90days {
        color:#4796ff;
        color:#12e55c;
    }

    .txt-yell {
        color: #FF5722;
    }

    .table-code {
       position: absolute;
       top: 10px;
       right: 10px; 
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
                    <li class="active full-bar"><a href="app_a15.aspx">A15 สถิติ ก.พ. 2020</a></li>
                    <li class="full-bar"><a href="app_a20.aspx">A20 ความถี่การใช้งาน App</a></li>
                    <li class="full-bar"><a href="app_a30.aspx">A30 ข้อมูลการใช้ Point</a></li>
                    <li class="full-bar"><a href="app_a35.aspx">A35 ข้อมูลการใช้ Coin</a></li>
                    <li class="full-bar"><a href="app_a40.aspx">A40 ข้อมูลการชำระเงิน</a></li>

                    <li class="mini-bar"><a href="app_a10.aspx" title="A10 สถิติการใช้งาน App">A10</a></li>
                    <li class="active mini-bar"><a href="app_a15.aspx">A15 สถิติ ก.พ. 2020</a></li>
                    <li class="mini-bar"><a href="app_a20.aspx" title="A20 ความถี่การใช้งาน App">A20</a></li>
                    <li class="mini-bar"><a href="app_a30.aspx" title="A30 ข้อมูลการใช้ Point">A30</a></li>
                    <li class="mini-bar"><a href="app_a35.aspx" title="A35 ข้อมูลการใช้ Coin">A35</a></li>
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

  <!--   <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <p class="title-target">แสดงสถานะจำนวนผู้ใช้ Application แยกตาม Cluster ณ. สิ้นวันที่ <span class="target-date">__/__/____</span></p>
                <div class="inview" id="display_target_75">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>

            </div>
        </div>
    </div> -->

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <p class="title-target">แสดงสถานะจำนวนผู้ใช้ Application แยกตาม Cluster ณ. สิ้นวันที่ <span class="target-date">__/__/____</span></p>
                <b class="table-code">A15/T10</b>
                <p class="title-target txt-yell">[Suspend] เงื่อนไขเพิ่มเติม: ไม่นับยอดติดตั้ง App ที่ได้รับการแนะนำจากพนักงานในเดือน ก.พ.63 ที่มียอดบันทึกแนะนำลูกค้าตั้งแต่ 20 รายขึ้นไป แล้วมีลูกค้ากลับเข้ามาใช้ App. ไม่ถึง 5%</p>
                <div class="inview" id="display_target_75_suspend">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
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

<div id="modal_notice" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-nm">
        <div class="modal-content">
            <div class="modal-header" style="border-radius: 3px; background-color: #ff8100;color: #fff;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">ประกาศ</h4>
            </div>
            <div class="modal-body" style="padding:0; padding-top: 60px; background-color: #0e3047; text-align: center; color: #fff;">
                <span id="txt_notice">ขณะนี้กำลังซ่อมฐานข้อมูล หน้า A10-A30 คาดว่าจะแล้วเสร็จในเวลาประมาณ 16:00 น.</span>
                <img src="App_Inc/_img/building-webpage.gif" style="width: 598px;">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>

<script type="text/javascript">
var color_target = "#00a03a";
var color_forecast = "#e8d000";
var color_accam = "#ff8c00";

var colorSet_R = ['#12e55c'];
var colorSet_G1 = ['#4796ff', '#FD8C16', '#12e55c'];
var colorSet_G2 = ['#ea6500', '#00b740'];
var colorSet_r3 = ['#12e55c', '#F1C500', '#4796ff'];
var colorSet_r4 = ['#4796ff', '#FD8C16', '#0059ce', '#bf3d1c', '#8dc900', '#02B53E'];
var colorSet_10RO = ['#70C14A', '#009688', '#31C3D9', '#4983C4', '#A25AA1', '#ff8eb1', '#EE5545', '#E6B211', '#AE8C4C', '#888'];
var colorSet_M3 = ['#8e1aa3', '#541af2', color_forecast, '#005eb7'];

var data_target75 = [];
var by_target75 = "CLUSTERS75";
var order_target75 = "asc";

var data_target75_suspend = [];

var arrayBTN = []
arrayBTN['CLUSTERS75'] = [];
arrayBTN['AppUsed_PERCENT'] = [];
arrayBTN['SHOP_PERCENT'] = [];
arrayBTN['INSTALL_PERCENT'] = [];
arrayBTN['susp_AppUsed_PERCENT'] = [];

arrayBTN['CLUSTERS75']['asc'] = "<a class='a-sort' id='sort_CLUSTERS75' onclick='dataSortTarget75(\"CLUSTERS75\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['CLUSTERS75']['desc'] = "<a class='a-sort' id='sort_CLUSTERS75' onclick='dataSortTarget75(\"CLUSTERS75\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['AppUsed_PERCENT']['asc'] = "<a class='a-sort' id='sort_AppUsed_PERCENT' onclick='dataSortTarget75(\"AppUsed_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['AppUsed_PERCENT']['desc'] = "<a class='a-sort' id='sort_AppUsed_PERCENT' onclick='dataSortTarget75(\"AppUsed_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['SHOP_PERCENT']['asc'] = "<a class='a-sort' id='sort_SHOP_PERCENT' onclick='dataSortTarget75(\"SHOP_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['SHOP_PERCENT']['desc'] = "<a class='a-sort' id='sort_SHOP_PERCENT' onclick='dataSortTarget75(\"SHOP_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['INSTALL_PERCENT']['asc'] = "<a class='a-sort' id='sort_INSTALL_PERCENT' onclick='dataSortTarget75(\"INSTALL_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['INSTALL_PERCENT']['desc'] = "<a class='a-sort' id='sort_INSTALL_PERCENT' onclick='dataSortTarget75(\"INSTALL_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['susp_AppUsed_PERCENT']['asc'] = "<a class='a-sort' id='sort_susp_AppUsed_PERCENT' onclick='dataSortTarget75(\"susp_AppUsed_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['susp_AppUsed_PERCENT']['desc'] = "<a class='a-sort' id='sort_susp_AppUsed_PERCENT' onclick='dataSortTarget75(\"susp_AppUsed_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
</script>

<script type="text/javascript" src="App_Inc/_js/chartApp.js?vs=1999"></script>
<script type="text/javascript" src="App_Inc/_js/chartDark.js?vs=199"></script>

<script type="text/javascript">
$(document).ready(function() { 

    loadTableTarget75();
});

function loadTableTarget75SUSPEND(){
    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY_v2002";
    console.log("loadTableTarget75SUSPEND = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0) {
                $('.target-date').html(ddmmyyyyDate(data[0].DATE_DATA));

                $.each(data,function( i,item ) {
                    data_target75_suspend.push({
                        RO: item.RO,
                        CLUSTERS: item.CLUSTERS,
                        CUSTOMER: parseInt(data_target75[i].CUSTOMER),
                        AppUsed: parseInt(data_target75[i].AppUsed),
                        AppUsed_PERCENT: parseFloat(data_target75[i].AppUsed_PERCENT),
                        susp_CUSTOMER: parseInt(item.CUSTOMER),
                        susp_AppUsed: parseInt(item.AppUsed),
                        susp_AppUsed_PERCENT: parseFloat(item.AppUsed_PERCENT),
                    });
                });
            }

            console.log(data_target75_suspend);

            htmlTableTarget75SUSPEND(data_target75_suspend);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function htmlTableTarget75SUSPEND(data) {
    var total_CUSTOMER = 0;
    var total_AppUsed = 0;

    var total_SUSPEND_CUSTOMER = 0;
    var total_SUSPEND_AppUsed = 0;

    var txt_html = "<div id='display_target_75_suspend'>" +
    "<table id='table_target_75_suspend' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
    "<thead style='font-weight: normal'>" +
        "<tr>    " +
            "<th rowspan='2'>RO</th> " +
            "<th rowspan='2' style='min-width:125px;'>CLUSTERS " + arrayBTN['CLUSTERS75'][order_target75] + "</th>   " +
            "<th rowspan='2' width='16%' style='text-align:center;'>จำนวนลูกค้า</th>   " +
            "<th colspan='2' style='text-align:center;'>จำนวนผู้ใช้ Application </th>   " +
            "<th colspan='2' style='text-align:center;'>จำนวนผู้ใช้ Application <span class='txt-yell'>*Suspend*</span></th>   " +
        "</tr>" +
        "<tr>    " +
            "<th width='16%' style='text-align:center;'>ใช้ App แล้ว</th>    " +
            "<th width='16%' style='text-align:center;'>ใช้ App แล้ว (%) " + arrayBTN['AppUsed_PERCENT'][order_target75] + "</th> " +
            "<th width='16%' style='text-align:center;' class='txt-yell'>ใช้ App แล้ว</th>  " +
            "<th width='16%' style='text-align:center;' class='txt-yell'>ใช้ App แล้ว (%) " + arrayBTN['susp_AppUsed_PERCENT'][order_target75] + "</th> " +
        "</tr>" +
    "</thead>" +
    "<tbody>";

    $.each(data,function( i,item ) {
        var cluster_id = item.RO + item.CLUSTERS;
        cluster_id = cluster_id.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');

        txt_html += "" +
        "<tr>" +
        "<td>" + item.RO + "</td>" + 
        "<td>" + item.CLUSTERS + "</td>" + 
        "<td align='right'>" + parseInt(item.CUSTOMER).toLocaleString() + "</td>" +
        "<td align='right'>" + parseInt(item.AppUsed).toLocaleString() + "</td>";

        if (parseFloat(item.AppUsed_PERCENT) >= 75) {
            txt_html += "<td align='right' class='hl-75per'><span class='glyphicon icon-star-full' style='color:#ffe783;font-size:14px;'></span> " + parseFloat(item.AppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        else {
            txt_html += "<td align='right'>" + parseFloat(item.AppUsed_PERCENT).toFixed(1) + "%</td>";
        }

        txt_html += "<td align='right'>" + parseInt(item.susp_AppUsed).toLocaleString() + "</td>";

        if (parseFloat(item.susp_AppUsed_PERCENT) >= 75) {
            txt_html += "<td align='right' class='hl-75per'><span class='glyphicon icon-star-full' style='color:#ffe783;font-size:14px;'></span> " + parseFloat(item.susp_AppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        else {
            txt_html += "<td align='right'>" + parseFloat(item.susp_AppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        "</tr>";

        total_CUSTOMER += parseFloat(item.CUSTOMER);
        total_AppUsed += parseFloat(item.AppUsed);

        total_SUSPEND_CUSTOMER += parseFloat(item.susp_CUSTOMER);
        total_SUSPEND_AppUsed += parseFloat(item.susp_AppUsed);
    });

    txt_html += "</tbody>" +
    "<tfoot style='background-color: #2a2a2a;'>" +
    "<tr class='txt-bold'>    " +
    "<td colspan='2'>Total</td>   " +
    "<td align='right'>" + parseInt(total_CUSTOMER).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseInt(total_AppUsed).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseFloat((total_AppUsed/total_CUSTOMER)*100).toFixed(1) + "%</td> " +
    "<td align='right'>" + parseInt(total_SUSPEND_AppUsed).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseFloat((total_SUSPEND_AppUsed/total_SUSPEND_CUSTOMER)*100).toFixed(1) + "%</td> " +
    "</tr>   " + 
    "</tfoot>" +
    "</table>" +
    "</div>";

    $('#display_target_75_suspend').replaceWith(txt_html);

    $('#table_target_75_suspend').fadeIn();

    var pfoot = "รายละเอียดข้อมูลในตาราง<br>" +
    "* จำนวนลูกค้าของแต่ละ Cluster ใช้ จำนวนลูกค้า ณ. สิ้นวันที่ 01 ต.ค. 2562<br>" + 
    "* ยกเว้น จำนวนลูกค้าของ RO10 ใช้จำนวนลูกค้า ณ. สิ้นวันที่ 31 ธ.ค. 2562 (เพื่อให้สอดคล้องกับการแบ่งพื้นที่ใหม่ในพื้นที่ RO10)<br>" +
    "* จำนวนลูกค้าใช้ App แล้ว หมายถึง Account ที่ยังคงสถานะใช้บริการ (ไม่นับ Account ที่ยกเลิกบริการ TX, TA)<br>" +
    "<span class='txt-yell'>* [Suspend] ไม่นับยอดติดตั้ง App ที่ได้รับการแนะนำจากพนักงานในเดือน ก.พ.63 ที่มียอดบันทึกแนะนำลูกค้าตั้งแต่ 20 รายขึ้นไป แล้วมีลูกค้ากลับเข้ามาใช้ App. ไม่ถึง 5%</span>";

    pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
    $('#display_target_75_suspend').append(pfoot);

    $('#sort_' + by_target75).addClass('active-sort')
}

function loadTableTarget75(){
    // var url = "ajax_chart.aspx?qrs=SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY";
    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_TARGET75_PERTEAM_DAILY_v2002";
    console.log("loadTableTarget75 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0) {
                $('.target-date').html(ddmmyyyyDate(data[0].DATE_DATA));

                data_target75 = data;

                loadTableTarget75SUSPEND();
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function dataSortTarget75(by = '', order = '') {
    by_target75 = by;
    order_target75 = order;

    data_target75_suspend = dataSort(data_target75_suspend, by_target75, order_target75);
    htmlTableTarget75SUSPEND(data_target75_suspend);
}

function dataSort(data, by = '', order = '') {

    if(by == 'AppUsed_PERCENT'){
        data.sort(function(a, b){return a.AppUsed_PERCENT - b.AppUsed_PERCENT});
    }
    else if(by == 'susp_AppUsed_PERCENT'){
        data.sort(function(a, b){return a.susp_AppUsed_PERCENT - b.susp_AppUsed_PERCENT});
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

function explanTarget75Prove(id, cluster) {
    var prov_class = 'perteam-prov-' + id;

    if($('.' + prov_class).length == 0) {
        loadTableTarget75Prov(prov_class, id, cluster);
    } else {
        if($('.' + prov_class).is(":hidden")){
            // $('#g_perteam_' + id).replaceWith("<span id='g_perteam_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");
            // $('.' + prov_class).show();

            $('.' + prov_class).remove();
            loadTableTarget75Prov(prov_class, id, cluster);
        }
        else {
            $('#g_perteam_' + id).replaceWith("<span id='g_perteam_" + id + "' class='glyphicon glyphicon-plus'></span>");
            $('.' + prov_class).hide();
        }
    }
}

function loadTableTarget75Prov(prov_class, id, cluster){
    $('#g_perteam_' + id).replaceWith("<span id='g_perteam_" + id + "' class='glyphicon glyphicon-refresh gly-spin'></span>");

    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_TARGET75_PROV_PERTEAM_DAILY&cluster=" + cluster;
    console.log("loadTableTarget75Prov = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0){
                data = dataSort(data, by_target75, order_target75);

                var txt_html = "";

                $.each(data,function( i,item ) {
                    txt_html += "<tr class='" + prov_class + " tr-target-perteam-prov'>    " +
                    "<td align='right' colspan='2'>" + item.PROVINCE + "</td>   " +
                    "<td align='right'>" + parseInt(item.CUSTOMER).toLocaleString() + "</td>" +
                    // "<td align='right'>" + parseInt(item.TARGET_75).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseInt(item.AppUsed).toLocaleString() + "</td>" +
                    "<td align='right'>" + ((item.AppUsed/item.CUSTOMER)*100).toFixed(1) + "%</td>" +
                    "<td align='right'>" + parseFloat(item.SHOP).toFixed(1) + "%</td>" +
                    "<td align='right'>" + parseFloat(item.INSTALL).toFixed(1) + "%</td>" +
                    "<td align='right'>" + parseFloat(item.REPAIR).toFixed(1) + "%</td>" +
                    "</tr>";
                });

                $('#tr_perteam_' + id).after(txt_html);

                $('#g_perteam_' + id).replaceWith("<span id='g_perteam_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");
            }
        },
        error: function(x, t, m) {
            $('#g_perteam_' + id).replaceWith("<span id='g_perteam_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");

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