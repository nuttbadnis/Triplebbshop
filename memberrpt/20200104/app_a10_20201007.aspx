<%@ Page Language="VB" AutoEventWireup="false" CodeFile="app_a10.aspx.vb" Inherits="app_a10" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT A10</title>

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
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartDark.css?vs=199999" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script type="text/javascript" src="App_Inc/canvasjs-2.3.2/canvasjs.min.js"></script>
    <script type="text/javascript" src="App_Inc/jquery.inview/jquery.inview.min.js"></script>
    <script type="text/javascript" src="App_Inc/Highcharts-7.1.3/code/highcharts.js"></script>
    <script type="text/javascript" src="App_Inc/button-checkbox/button-checkbox.js"></script>

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
            color: #444;
            background-color:#00FF00;
        }

        .hl-70per {
            color: #444;
            background-color:#00FF33;
        }

        .hl-65per {
            color: #444;
            background-color:#00FF66;
        }

        .hl-60per {
            color: #444;
            background-color:#00FF99;
        }

        .hl-30days {
            color:#12e55c;
        }

        .hl-60days {
            color:#F1E33E;
            color:#12e55c;
        }

        .hl-90days {
            color:#4796ff;
            color:#12e55c;
        }

        .table-code {
         position: absolute;
         top: 10px;
         right: 10px; 
     }

     .tr-target-newcust-cluster .glyphicon {
        color: #F1E33E;
    }

    .tr-target-daily-cluster .gclose, .tr-target-perteam-cluster .gclose, .tr-target-appused-cluster .gclose, .tr-target-newcust-cluster .gclose {
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
                    <li class="active full-bar"><a href="app_a10.aspx">A10 สถิติการใช้งาน App</a></li>
                    <li class="full-bar"><a href="app_a15.aspx">A15 สถิติ ก.พ. 2020</a></li>
                    <li class="full-bar"><a href="app_a20.aspx">A20 ความถี่การใช้งาน App</a></li>
                    <li class="full-bar"><a href="app_a30.aspx">A30 ข้อมูลการใช้ Point</a></li>
                    <li class="full-bar"><a href="app_a40.aspx">A40 ข้อมูลการชำระเงิน</a></li>

                    <li class="active mini-bar"><a href="app_a10.aspx">A10 สถิติการใช้งาน App</a></li>
                    <li class="mini-bar"><a href="app_a15.aspx">A15</a></li>
                    <li class="mini-bar"><a href="app_a20.aspx">A20</a></li>
                    <li class="mini-bar"><a href="app_a30.aspx">A30</a></li>
                    <li class="mini-bar"><a href="app_a40.aspx">A40</a></li>
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
                <div class="inview" id="rd_g10">
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
                <button type="button" class="btn btn-sm btn-dl btn-primary" id="btn_export_r10070">Download Excel</button>

                <div class="inview" id="rd_r10070">
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
                <div class="btn-group" data-toggle="buttons" id="btn_wk_fake">
                    <label class="btn btn-sm btn-default active disabled">
                        <input type="checkbox" autocomplete="off"> รายวัน
                    </label>
                    <label class="btn btn-sm btn-default disabled">
                        <input type="checkbox" autocomplete="off"> รอสักครู่..
                    </label>
                </div>
                <div class="btn-group" data-toggle="buttons" id="btn_wk">
                    <label class="btn btn-sm btn-radtype active">
                        <input type="radio" name="btn-r10020" value="r10022" checked> รายวัน
                    </label>
                    <label class="btn btn-sm btn-radtype">
                        <input type="radio" name="btn-r10020" value="r10032"> รายสัปดาห์
                    </label>
                </div>

                <div class="inview" id="rd_r10022">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>

                <div id="rd_r10032"></div>

                <div id="info_r10020"></div>

                <div id="display_r10022"></div>
                <div id="display_r10032"></div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container box-container">
            <div class="col-xs-6">
                <div class="inview" id="rd_r10060">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>

            <div class="col-xs-6">
                <div id="rd_r10040">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>

            <div id="info_r10040"></div>
            <div id="display_r10040"></div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <div class="inview" id="rd_r10050">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>

                <div id="display_r10050"></div>
            </div>
        </div>
    </div>

    <div class="container container-description">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <p>
                    **เงื่อนไข <br>
                    - หากใน 1 นาที Account ที่เข้าใช้งานมากกว่า 1 ครั้ง ระบบจะนับเป็น 1 ครั้ง<br>
                    - มีข้อมูลการใช้งาน APP ตั้งแต่วันที่ 10 กรกฏาคม 2562 เป็นต้นไป<br>
                    - ข้อมูลอัพเดททุกสิ้นวัน Data ต้นทางจาก TMP_3BBAPP_MACUUID และ TMP_3BBAPP ของ BCS
                </p>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <b class="table-code">A10/T10</b>
                <p class="title-target">แสดงสถานะจำนวนผู้ใช้ Application แยกตาม Cluster ณ. สิ้นวันที่ <span class="target-date">__/__/____</span></p>

                <div id="rd_a10_t10_cluster1"></div>
                <div id="rd_a10_t10_cluster2"></div>
                <p id="gdesc_a10_t10" class="pfoot"></p>

                <div class="inview" id="display_a10_t10">
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
                <b class="table-code">A10/T20</b>
                <p class="title-target">แสดงจำนวนผู้เข้าใช้ Application แยกตาม Cluster ในช่วง 30, 60 และ 90 วันล่าสุด ณ. สิ้นวันที่ <span class="appused-date">__/__/____</span></p>
                <div class="inview" id="display_a10_t20">
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
                <b class="table-code">A10/T30</b>
                <button type="button" class="btn btn-sm btn-dl btn-primary" id="btn_export_a10_t30">Download รายจังหวัด</button>

                <p class="title-target">
                    กราฟสัดส่วนการเข้าใช้ 3BB Member App. ของลูกค้าติดตั้งใหม่ (PIS)

                    <select id="sel_t30_version" class="input-sm" style="color: #555;line-height: 15px;height: 32px;">
                        <option value="202005">เดือน พ.ค. 2020</option>
                        <option value="202004">เดือน เม.ย. 2020</option>
                        <option value="202003">เดือน มี.ค. 2020</option>
                    </select>

                    <span class="button-checkbox">
                        <button type="button" class="btn btn-sm" style="line-height: 15px;height: 31px;" data-color="warning">เฉพาะลูกค้า Resident</button>
                        <input type="checkbox" id="chk_t30_resident" class="hidden" checked />
                    </span>
                </p>


                <div id="rd_a10_t30"></div>
                <p id="gdesc_a10_t30" class="pfoot"></p>

                <div class="inview" id="display_a10_t30">
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

<div id="modal_notice2" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-nm">
        <div class="modal-content">
            <div class="modal-header" style="border-radius: 3px; background-color: #ff8100;color: #fff;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">ประกาศ</h4>
            </div>
            <div class="modal-body" style="padding:0; padding-top: 60px; background-color: #0e3047; text-align: center; color: #fff;">
                <span id="txt_notice">เกิดปัญหากับข้อมูลวันที่ 11/03/2020 ตอนนี้อยู่ระหว่างดำเนินการ<br>จึงมีข้อมูลแสดงถึงวันที่ 10/03/2020 ขออภัยในความไม่สะดวก</span>
                <img src="App_Inc/_img/building-webpage.gif" style="width: 300px;">
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
var colorSet_r3 = ['#12e55c', '#F1E33E', '#4796ff'];
var colorSet_r4 = ['#4796ff', '#FD8C16', '#0059ce', '#bf3d1c', '#8dc900', '#02B53E'];
var colorSet_10RO = ['#70C14A', '#009688', '#31C3D9', '#4983C4', '#A25AA1', '#ff8eb1', '#EE5545', '#E6B211', '#AE8C4C', '#888'];
var colorSet_M3 = ['#8e1aa3', '#541af2', color_forecast, '#005eb7'];

var numtext_FIRST_LOGIN_ACCAM = 0;
var numtext_REAL_LOGIN_ACCAM = 0;
var numtext_acc90days = 0;
var numtext_avg30 = 0;

// ---------------------------------------------- var T10
var data_T10 = [];
var by_T10 = "T10_CLUSTERS";
var order_T10 = "asc";

var arrayBTN = []
arrayBTN['T10_CLUSTERS'] = [];
arrayBTN['AppUsed_PERCENT'] = [];
arrayBTN['RealAppUsed_PERCENT'] = [];
arrayBTN['SHOP_PERCENT'] = [];
arrayBTN['INSTALL_PERCENT'] = [];
arrayBTN['REPAIR_PERCENT'] = [];

arrayBTN['T10_CLUSTERS']['asc'] = "<a class='a-sort' id='sort_T10_CLUSTERS' onclick='dataSortT10(\"T10_CLUSTERS\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T10_CLUSTERS']['desc'] = "<a class='a-sort' id='sort_T10_CLUSTERS' onclick='dataSortT10(\"T10_CLUSTERS\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['AppUsed_PERCENT']['asc'] = "<a class='a-sort' id='sort_AppUsed_PERCENT' onclick='dataSortT10(\"AppUsed_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['AppUsed_PERCENT']['desc'] = "<a class='a-sort' id='sort_AppUsed_PERCENT' onclick='dataSortT10(\"AppUsed_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['RealAppUsed_PERCENT']['asc'] = "<a class='a-sort' id='sort_RealAppUsed_PERCENT' onclick='dataSortT10(\"RealAppUsed_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['RealAppUsed_PERCENT']['desc'] = "<a class='a-sort' id='sort_RealAppUsed_PERCENT' onclick='dataSortT10(\"RealAppUsed_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['SHOP_PERCENT']['asc'] = "<a class='a-sort' id='sort_SHOP_PERCENT' onclick='dataSortT10(\"SHOP_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['SHOP_PERCENT']['desc'] = "<a class='a-sort' id='sort_SHOP_PERCENT' onclick='dataSortT10(\"SHOP_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['INSTALL_PERCENT']['asc'] = "<a class='a-sort' id='sort_INSTALL_PERCENT' onclick='dataSortT10(\"INSTALL_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['INSTALL_PERCENT']['desc'] = "<a class='a-sort' id='sort_INSTALL_PERCENT' onclick='dataSortT10(\"INSTALL_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['REPAIR_PERCENT']['asc'] = "<a class='a-sort' id='sort_REPAIR_PERCENT' onclick='dataSortT10(\"REPAIR_PERCENT\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['REPAIR_PERCENT']['desc'] = "<a class='a-sort' id='sort_REPAIR_PERCENT' onclick='dataSortT10(\"REPAIR_PERCENT\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";

var inROhalf = ["RO01", "RO02", "RO03", "RO04", "RO05", "RO06"]; 
var data_forecast_cluster1 = [];
var data_forecast_cluster2 = [];

// ---------------------------------------------- var T20
var data_T20 = [];
var by_T20 = "T20_CLUSTERS";
var order_T20 = "asc";

arrayBTN['T20_CLUSTERS'] = [];
arrayBTN['AppUsedA10'] = [];
arrayBTN['AppUsed_30days'] = [];
arrayBTN['AppUsed_60days'] = [];
arrayBTN['AppUsed_90days'] = [];
arrayBTN['PERCENT_30days'] = [];
arrayBTN['PERCENT_60days'] = [];
arrayBTN['PERCENT_90days'] = [];

arrayBTN['T20_CLUSTERS']['asc'] = "<a class='a-sort' id='sort_T20_CLUSTERS' onclick='dataSortT20(\"T20_CLUSTERS\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T20_CLUSTERS']['desc'] = "<a class='a-sort' id='sort_T20_CLUSTERS' onclick='dataSortT20(\"T20_CLUSTERS\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['AppUsedA10']['asc'] = "<a class='a-sort' id='sort_AppUsedA10' onclick='dataSortT20(\"AppUsedA10\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['AppUsedA10']['desc'] = "<a class='a-sort' id='sort_AppUsedA10' onclick='dataSortT20(\"AppUsedA10\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['AppUsed_30days']['asc'] = "<a class='a-sort' id='sort_AppUsed_30days' onclick='dataSortT20(\"AppUsed_30days\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['AppUsed_30days']['desc'] = "<a class='a-sort' id='sort_AppUsed_30days' onclick='dataSortT20(\"AppUsed_30days\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['AppUsed_60days']['asc'] = "<a class='a-sort' id='sort_AppUsed_60days' onclick='dataSortT20(\"AppUsed_60days\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['AppUsed_60days']['desc'] = "<a class='a-sort' id='sort_AppUsed_60days' onclick='dataSortT20(\"AppUsed_60days\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['AppUsed_90days']['asc'] = "<a class='a-sort' id='sort_AppUsed_90days' onclick='dataSortT20(\"AppUsed_90days\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['AppUsed_90days']['desc'] = "<a class='a-sort' id='sort_AppUsed_90days' onclick='dataSortT20(\"AppUsed_90days\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['PERCENT_30days']['asc'] = "<a class='a-sort' id='sort_PERCENT_30days' onclick='dataSortT20(\"PERCENT_30days\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['PERCENT_30days']['desc'] = "<a class='a-sort' id='sort_PERCENT_30days' onclick='dataSortT20(\"PERCENT_30days\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['PERCENT_60days']['asc'] = "<a class='a-sort' id='sort_PERCENT_60days' onclick='dataSortT20(\"PERCENT_60days\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['PERCENT_60days']['desc'] = "<a class='a-sort' id='sort_PERCENT_60days' onclick='dataSortT20(\"PERCENT_60days\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['PERCENT_90days']['asc'] = "<a class='a-sort' id='sort_PERCENT_90days' onclick='dataSortT20(\"PERCENT_90days\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['PERCENT_90days']['desc'] = "<a class='a-sort' id='sort_PERCENT_90days' onclick='dataSortT20(\"PERCENT_90days\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";

// ---------------------------------------------- var T30
var url_T30_append = "_RESIDENT";
var str_T30_append = "(เฉพาะลูกค้า Resident)";

var data_T30 = [];
var by_T30 = "T30_CLUSTERS";
var order_T30 = "asc";

arrayBTN['T30_CLUSTERS'] = [];
arrayBTN['T30_NewCust_LastDate'] = [];
arrayBTN['T30_NewCust_LastAmount'] = [];
arrayBTN['T30_AppUsed_LastDate'] = [];
arrayBTN['T30_Percent_LastDate'] = [];
arrayBTN['T30_AppUsed_LastAmount'] = [];
arrayBTN['T30_Percent_LastAmount'] = [];
arrayBTN['T30_CLUSTERS']['asc'] = "<a class='a-sort' id='sort_T30_CLUSTERS' onclick='dataSortT30(\"T30_CLUSTERS\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T30_CLUSTERS']['desc'] = "<a class='a-sort' id='sort_T30_CLUSTERS' onclick='dataSortT30(\"T30_CLUSTERS\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['T30_NewCust_LastDate']['asc'] = "<a class='a-sort' id='sort_T30_NewCust_LastDate' onclick='dataSortT30(\"T30_NewCust_LastDate\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T30_NewCust_LastDate']['desc'] = "<a class='a-sort' id='sort_T30_NewCust_LastDate' onclick='dataSortT30(\"T30_NewCust_LastDate\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['T30_NewCust_LastAmount']['asc'] = "<a class='a-sort' id='sort_T30_NewCust_LastAmount' onclick='dataSortT30(\"T30_NewCust_LastAmount\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T30_NewCust_LastAmount']['desc'] = "<a class='a-sort' id='sort_T30_NewCust_LastAmount' onclick='dataSortT30(\"T30_NewCust_LastAmount\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['T30_AppUsed_LastDate']['asc'] = "<a class='a-sort' id='sort_T30_AppUsed_LastDate' onclick='dataSortT30(\"T30_AppUsed_LastDate\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T30_AppUsed_LastDate']['desc'] = "<a class='a-sort' id='sort_T30_AppUsed_LastDate' onclick='dataSortT30(\"T30_AppUsed_LastDate\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['T30_Percent_LastDate']['asc'] = "<a class='a-sort' id='sort_T30_Percent_LastDate' onclick='dataSortT30(\"T30_Percent_LastDate\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T30_Percent_LastDate']['desc'] = "<a class='a-sort' id='sort_T30_Percent_LastDate' onclick='dataSortT30(\"T30_Percent_LastDate\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['T30_AppUsed_LastAmount']['asc'] = "<a class='a-sort' id='sort_T30_AppUsed_LastAmount' onclick='dataSortT30(\"T30_AppUsed_LastAmount\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T30_AppUsed_LastAmount']['desc'] = "<a class='a-sort' id='sort_T30_AppUsed_LastAmount' onclick='dataSortT30(\"T30_AppUsed_LastAmount\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
arrayBTN['T30_Percent_LastAmount']['asc'] = "<a class='a-sort' id='sort_T30_Percent_LastAmount' onclick='dataSortT30(\"T30_Percent_LastAmount\", \"desc\")'><span class='glyphicon icon-sort-amount-asc'></span></a>";
arrayBTN['T30_Percent_LastAmount']['desc'] = "<a class='a-sort' id='sort_T30_Percent_LastAmount' onclick='dataSortT30(\"T30_Percent_LastAmount\", \"asc\")'><span class='glyphicon icon-sort-amount-desc'></span></a>";
</script>

<script type="text/javascript" src="App_Inc/_js/chartApp.js?vs=1999"></script>
<script type="text/javascript" src="App_Inc/_js/chartDark.js?vs=199"></script>

<script type="text/javascript">
$(document).ready(function() { 
    // $('#modal_notice').modal('show');
    // $('#modal_notice2').modal('show');

    loadYYYYMM();
    step0_G10();
    startInview();
});

function startInview() {
    $('.inview').one('inview', function (e, isInView) {
        if (isInView) {
            switch (this.id) {
                case "rd_r10022": load_r10022();
                break;
                case "rd_r10070": load_r10070();
                break;
                case "rd_r10060": load_r10060();
                break;
                case "rd_r10050": load_r10050();
                break;
                case "display_a10_t10": loadTableT10();
                break;
                case "display_a10_t20": loadTableT20();
                break;
                case "display_a10_t30": loadTableT30();
                break;
            }
        }
    });
}

function step0_G10() {
    var url = "ajax_chart.aspx?qrs=SP_NUMTEXT_DASH_MAIL_DAILY";
    console.log("step0_G10 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0){
                numtext_FIRST_LOGIN_ACCAM = parseInt(data[0].FIRST_LOGIN_ACCAM);
                numtext_REAL_LOGIN_ACCAM = parseInt(data[0].REAL_LOGIN_ACCAM);
                numtext_acc90days = parseInt(data[0].acc90days);
                numtext_avg30 = parseInt(data[0].avg30);

                step1_G10();
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function step1_G10() {
    var url = "ajax_chart.aspx?qrs=SP_ACCAM_DAILY_FIRST_LOGIN";
    console.log("step1_G10 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var temp_max_perday = 0;

            var highchart_data_line_day_count = [];
            var highchart_data_line_day_accom = [];
            var highchart_data_line_real_accom = [];
            
            var start_data_line_day = new Date(data[0].dtm);

            $.each(data,function( i,item ) {
                highchart_data_line_day_count.push(parseInt(item.FIRST_LOGIN_COUNT));
                highchart_data_line_day_accom.push(parseInt(item.FIRST_LOGIN_ACCAM));
                highchart_data_line_real_accom.push(parseInt(item.REAL_LOGIN_ACCAM));

                if(temp_max_perday < parseInt(item.FIRST_LOGIN_COUNT)){
                    temp_max_perday = parseInt(item.FIRST_LOGIN_COUNT);
                }
            });

            temp_max_perday = temp_max_perday*1.8;

            Highcharts.chart('rd_g10', {
                colors: colorSet_G1,
                chart: {
                    // type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สถิติจำนวนลูกค้าสมัคร APP รายวัน ",
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
                        text: 'ยอดรายวัน',
                        style: {
                            fontSize: '18px',
                            color: "#60AFFF",
                        }
                    },
                    min: 0,
                    max: temp_max_perday,
                }, { 
                    title: {
                        text: 'ยอดสะสม',
                        style: {
                            fontSize: '18px',
                            color: "#FD8C16",
                        }
                    },
                    min: 0,
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
                    series: {
                        events: {
                            legendItemClick: function () {
                                return false; 
                            }
                        }
                    },
                },
                series: [{
                    yAxis: 0,
                    type: 'column',
                    marker: {
                        symbol: 'circle',
                    },
                    name: 'จำนวนลูกค้าใหม่แต่ละวัน',
                    data: highchart_data_line_day_count,
                    pointStart: setPointStart(start_data_line_day),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 1,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'จำนวนลูกค้าสะสม',
                    data: highchart_data_line_day_accom,
                    pointStart: setPointStart(start_data_line_day),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 1,
                    marker: {
                        radius: 2,
                        symbol: 'circle',
                    },
                    name: 'จำนวนลูกค้าสะสม ที่มีการใช้งานมากกว่า 1 วัน',
                    data: highchart_data_line_real_accom,
                    pointStart: setPointStart(start_data_line_day),
                    pointInterval: setDaysInterval(1),
                }]
            });

            var pfoot = "ล่าสุด มีจำนวนลูกค้าที่ใช้งาน App สะสมแล้ว <b>" + numtext_FIRST_LOGIN_ACCAM.toLocaleString() + "</b> account โดยเป็นลูกค้าที่เคยเข้าใช้อีก หลังจากวันแรกที่ใช้ จำนวน <b>" + numtext_REAL_LOGIN_ACCAM.toLocaleString() + "</b> account";
            pfoot += "<br>มีลูกค้าที่กลับมาใช้ซ้ำในช่วง 90 วัน จำนวน <b>" + numtext_acc90days.toLocaleString() + "</b> account และในช่วง 30 วันที่ผ่านมา มีลูกค้าใหม่เพิ่มขึ้นเฉลี่ย วันละ <b>" + numtext_avg30.toLocaleString() + "</b> account";
            pfoot += "<br>*ลูกค้าที่มีการใช้งานมากกว่า 1 วัน หมายถึง Account ที่ Login ครั้งแรก และครั้งล่าสุด เป็นคนละวันกัน"
            pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
            $('#rd_g10').append(pfoot);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r10022() {
    var thisid = "rd_r10022";

    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10022";
    console.log("load_10022 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var data_R10030_count_in_day = [];
            var data_R10030_count_acc = [];
            var data_R10020_count_in_day = [];
            var data_R10020_count_acc = [];
            var data_R10022_count_in_day = [];
            var data_R10022_count_acc = [];
            var data_R10024_count_pay = [];

            var max_y = 0;
            var max_y2 = 0;
            var start_data_r10020 = new Date(data[0].dtm);

            $.each(data,function( i,item ) {
                data_R10030_count_in_day.push(parseInt(item.R10030_count_in_day));
                data_R10030_count_acc.push(parseInt(item.R10030_count_acc));
                data_R10020_count_in_day.push(parseInt(item.R10020_count_in_day));
                data_R10020_count_acc.push(parseInt(item.R10020_count_acc));
                data_R10022_count_in_day.push(parseInt(item.R10022_count_in_day));
                data_R10022_count_acc.push(parseInt(item.R10022_count_acc));
                data_R10024_count_pay.push(parseInt(item.R10024_count_pay));

                max_y = findMax(max_y, parseInt(item.R10030_count_in_day));
                max_y = findMax(max_y, parseInt(item.R10030_count_acc));
                max_y = findMax(max_y, parseInt(item.R10020_count_in_day));
                max_y = findMax(max_y, parseInt(item.R10020_count_acc));

                // max_y2 = findMax(max_y, parseInt(item.R10022_count_in_day));
                max_y2 = findMax(max_y2, parseInt(item.R10022_count_acc));
                max_y2 = findMax(max_y2, parseInt(item.R10024_count_pay));
            });

            max_y2 = max_y2*2;

            Highcharts.chart(thisid, {
                colors: colorSet_r4,
                chart: {
                    height: 560,
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สถิติจำนวนการใช้งาน APP รายวัน ",
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
                            text: 'จำนวน การเข้าใช้งาน',
                            style: {
                                fontSize: '14px',
                                color: "#FD8C16",
                            }
                        },
                        min: 0,
                        max: max_y
                    }, { 
                        title: {
                            text: 'จำนวน การใช้ Point และชำระเงิน',
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
                    // series: {
                    //     events: {
                    //         legendItemClick: function () {
                    //             return false; 
                    //         }
                    //     }
                    // },
                },
                series: [{
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง',
                    data: data_R10020_count_in_day,
                    pointStart: setPointStart(start_data_r10020),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account',
                    data: data_R10020_count_acc,
                    pointStart: setPointStart(start_data_r10020),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง (ไม่นับวันที่ Login ครั้งแรก)',
                    data: data_R10030_count_in_day,
                    pointStart: setPointStart(start_data_r10020),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account (ไม่นับวันที่ Login ครั้งแรก)',
                    data: data_R10030_count_acc,
                    pointStart: setPointStart(start_data_r10020),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 1,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account ที่ใช้ Point',
                    data: data_R10022_count_acc,
                    pointStart: setPointStart(start_data_r10020),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    yAxis: 1,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวนการชำระเงินผ่านช่องทาง 3BB Web/3BB App.',
                    data: data_R10024_count_pay,
                    pointStart: setPointStart(start_data_r10020),
                    pointInterval: setDaysInterval(1),
                }]
            });

            var txt_table = "<div id='display_r10022'>" +
            "<table id='table_r10022' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead>" +
            "<tr style='font-weight: normal'>" +
            "<th rowspan='2' style='text-align:center;'>วันที่</th>   " +
            "<th colspan='4' style='text-align:center;'>จำนวนการใช้งาน APP</th>   " +
            "<th rowspan='2' width='18%' style='text-align:center;color:" + colorSet_r4[4] + ";'>จำนวน Account ที่ใช้ Point</th>   " +
            "<th rowspan='2' width='18%' style='text-align:center;color:" + colorSet_r4[5] + ";'>จำนวนการชำระเงินผ่านช่องทาง<br>3BB Web/3BB App. <button type='button' class='btn btn-x-tr btn-danger hide-tr-10020' onclick=\"hide_table('10020');\"><span class='glyphicon glyphicon-remove'></span></button></th>   " +
            
            "</tr>" +
            "<tr style='font-weight: normal'>" +
            "<th width='13%' style='text-align:center;color:" + colorSet_r4[0] + ";'>จำนวนครั้ง </th>   " +
            "<th width='13%' style='text-align:center;color:" + colorSet_r4[1] + ";'>จำนวน Account</th>   " +
            "<th width='13%' style='text-align:center;color:" + colorSet_r4[2] + ";'>จำนวนครั้ง<br>(ไม่นับ Login ครั้งแรก)</th>   " +
            "<th width='13%' style='text-align:center;color:" + colorSet_r4[3] + ";'>จำนวน Account<br>(ไม่นับ Login ครั้งแรก)</th>" +
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
                "<td align='right'>" + data_R10020_count_in_day[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10020_count_acc[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10030_count_in_day[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10030_count_acc[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10022_count_acc[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_R10024_count_pay[i].toLocaleString() + "</td>" + 
                "</tr>";
            };

            txt_table += "</tbody>" +
            "<tfoot class='dilld'>" +
            "<tr class='full-tr-10020'><td colspan='7' onclick=\"full_table('10020');\"><span class='glyphicon glyphicon-menu-down'></span> แสดงทั้งหมด</td></tr>" +
            "<tr class='hide-tr-10020'><td colspan='7' onclick=\"hide_table('10020');\"><span class='glyphicon glyphicon-menu-up'></span> แสดงน้อยลง</td></tr>" +
            "</tfoot>" +
            "</table>" +
            "</div>";

            $('#display_r10022').replaceWith(txt_table);

            $('#table_r10022').fadeIn();

            var pfoot = 'แสดงแนวโน้มการเข้าใช้งาน App ในแต่ละวัน ทั้งจำนวนครั้ง, จำนวน Account และแสดงจำนวนครั้ง, จำนวน Account ที่ไม่นับวันที่ Login ครั้งแรกออกไป ซึ่งเสมือนเป็นลูกค้าที่มีการใช้งาน App. จริงๆ';
            pfoot += "<br>*กราฟนี้จะอัพเดทข้อมูลล่าสุด เวลาประมาณ 8:30 น."
            pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
            $('#info_r10020').append(pfoot);

            load_r10032();
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r10032() {
    var thisid = "rd_r10032";

    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10032";
    console.log("load_r10032 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {  
            var data_R10021_count_in_day = [];
            var data_R10021_count_acc = [];
            var data_R10031_count_in_day = [];
            var data_R10031_count_acc = [];
            var data_R10032_count_acc = [];
            var data_R10034_count_pay = [];
            var max_y = 0;
            var max_y2 = 0;

            var start_data_line_r10021 = new Date(data[0].dtm);
            var last_data_line_r10021 = new Date(data[data.length-1].dtm);

            $.each(data,function( i,item ) {
                if(i < data.length-1){
                    data_R10021_count_in_day.push({
                        mondiff: parseInt(6),
                        y: parseInt(item.R10021_count_in_day)
                    });

                    data_R10021_count_acc.push({
                        mondiff: parseInt(6),
                        y: parseInt(item.R10021_count_acc)
                    });

                    data_R10031_count_in_day.push({
                        mondiff: parseInt(6),
                        y: parseInt(item.R10031_count_in_day)
                    });

                    data_R10031_count_acc.push({
                        mondiff: parseInt(6),
                        y: parseInt(item.R10031_count_acc)
                    });

                    data_R10032_count_acc.push({
                        mondiff: parseInt(6),
                        y: parseInt(item.R10032_count_acc)
                    });

                    data_R10034_count_pay.push({
                        mondiff: parseInt(6),
                        y: parseInt(item.R10034_count_pay)
                    });
                }

                max_y = findMax(max_y, parseInt(item.R10021_count_in_day));
                max_y = findMax(max_y, parseInt(item.R10021_count_acc));
                max_y = findMax(max_y, parseInt(item.R10031_count_in_day));
                max_y = findMax(max_y, parseInt(item.R10031_count_acc));

                max_y2 = findMax(max_y2, parseInt(item.R10032_count_acc));
                max_y2 = findMax(max_y2, parseInt(item.R10034_count_pay));
            });

            max_y2 = max_y2*3;

            var last_wk_data_R10021_count_in_day = [];
            var last_wk_data_R10021_count_acc = [];
            var last_wk_data_R10031_count_in_day = [];
            var last_wk_data_R10031_count_acc = [];
            var last_wk_data_R10032_count_acc = [];
            var last_wk_data_R10034_count_pay = [];

            // วันสุดท้ายไม่ใช้วันจันทร์
            var mondiff = parseInt(data[data.length-1].mondiff);
            if(mondiff != 6){
                last_wk_data_R10021_count_in_day.push({
                    mondiff: parseInt(mondiff),
                    y: parseInt(data[data.length-1].R10021_count_in_day)
                });

                last_wk_data_R10021_count_acc.push({
                    mondiff: parseInt(mondiff),
                    y: parseInt(data[data.length-1].R10021_count_acc)
                });

                last_wk_data_R10031_count_in_day.push({
                    mondiff: parseInt(mondiff),
                    y: parseInt(data[data.length-1].R10021_count_in_day)
                });

                last_wk_data_R10031_count_acc.push({
                    mondiff: parseInt(mondiff),
                    y: parseInt(data[data.length-1].R10031_count_acc)
                });

                last_wk_data_R10032_count_acc.push({
                    mondiff: parseInt(mondiff),
                    y: parseInt(data[data.length-1].R10032_count_acc)
                });

                last_wk_data_R10034_count_pay.push({
                    mondiff: parseInt(mondiff),
                    y: parseInt(data[data.length-1].R10034_count_pay)
                });
            }
            else {
                data_R10021_count_in_day.push({
                    mondiff: parseInt(6),
                    y: parseInt(data[data.length-1].R10021_count_in_day)
                });

                data_R10021_count_acc.push({
                    mondiff: parseInt(6),
                    y: parseInt(data[data.length-1].R10021_count_acc)
                });

                data_R10031_count_in_day.push({
                    mondiff: parseInt(6),
                    y: parseInt(data[data.length-1].R10031_count_in_day)
                });

                data_R10031_count_acc.push({
                    mondiff: parseInt(6),
                    y: parseInt(data[data.length-1].R10031_count_acc)
                });

                data_R10032_count_acc.push({
                    mondiff: parseInt(6),
                    y: parseInt(data[data.length-1].R10032_count_acc)
                });

                data_R10034_count_pay.push({
                    mondiff: parseInt(6),
                    y: parseInt(data[data.length-1].R10034_count_pay)
                });
            }

            Highcharts.chart(thisid, {
                colors: colorSet_r4,
                chart: {
                    height: 560,
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สถิติจำนวนการใช้งาน APP รายสัปดาห์ ",
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
                            text: 'จำนวน การเข้าใช้งาน',
                            style: {
                                fontSize: '14px',
                                color: "#FD8C16",
                            }
                        },
                        min: 0,
                        max: max_y
                    }, { 
                        title: {
                            text: 'จำนวน การใช้ Point และชำระเงิน',
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
                    style: {
                        "fontSize": "14px",
                    },
                    useHTML: true,
                    borderColor: '#ff8c00',
                    formatter: function() {
                        var x_date = new Date(this.x)
                        var mondiff = this.points[0].point.mondiff;

                        var content = "";
                        content += Highcharts.dateFormat('วัน%Aที่ %d/%m/%Y', x_date);
                        x_date.setDate(x_date.getDate() + mondiff);
                        content += " ถึง " + Highcharts.dateFormat('วัน%Aที่ %d/%m/%Y', x_date);

                        for (var i = 0; i < this.points.length; i++) {
                            content += "<br>"      
                            content += "<span style='color: " + this.points[i].series.color + ";'>●</span> " + this.points[i].series.name + ": <b>" + this.points[i].y.toLocaleString() + "</b>";
                        };
                            
                        return content;
                    }
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                    series: {
                        // events: {
                        //     legendItemClick: function () {
                        //         return false; 
                        //     }
                        // }
                    },
                },
                series: [{
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง',
                    data: data_R10021_count_in_day,
                    pointStart: setPointStart(start_data_line_r10021),
                    pointInterval: setDaysInterval(7),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account',
                    data: data_R10021_count_acc,
                    pointStart: setPointStart(start_data_line_r10021),
                    pointInterval: setDaysInterval(7),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง (ไม่นับวันที่ Login ครั้งแรก)',
                    data: data_R10031_count_in_day,
                    pointStart: setPointStart(start_data_line_r10021),
                    pointInterval: setDaysInterval(7),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account (ไม่นับวันที่ Login ครั้งแรก)',
                    data: data_R10031_count_acc,
                    pointStart: setPointStart(start_data_line_r10021),
                    pointInterval: setDaysInterval(7),
                }
                , {
                    yAxis: 1,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account ที่ใช้ Point',
                    data: data_R10032_count_acc,
                    pointStart: setPointStart(start_data_line_r10021),
                    pointInterval: setDaysInterval(7),
                }
                , {
                    yAxis: 1,
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: 'จำนวนการชำระเงินผ่านช่องทาง 3BB Web/3BB App.',
                    data: data_R10034_count_pay,
                    pointStart: setPointStart(start_data_line_r10021),
                    pointInterval: setDaysInterval(7),
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 6,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง',
                    data: last_wk_data_R10021_count_in_day,
                    pointStart: setPointStart(last_data_line_r10021),
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: false
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 6,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account',
                    data: last_wk_data_R10021_count_acc,
                    pointStart: setPointStart(last_data_line_r10021),
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: false
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 6,
                        symbol: 'circle',
                    },
                    name: 'จำนวนครั้ง (ไม่นับวันที่ Login ครั้งแรก)',
                    data: last_wk_data_R10031_count_in_day,
                    pointStart: setPointStart(last_data_line_r10021),
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: false
                }
                , {
                    yAxis: 0,
                    marker: {
                        radius: 6,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account (ไม่นับวันที่ Login ครั้งแรก)',
                    data: last_wk_data_R10031_count_acc,
                    pointStart: setPointStart(last_data_line_r10021),
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: false
                }
                , {
                    yAxis: 1,
                    marker: {
                        radius: 6,
                        symbol: 'circle',
                    },
                    name: 'จำนวน Account ที่ใช้ Point',
                    data: last_wk_data_R10032_count_acc,
                    pointStart: setPointStart(last_data_line_r10021),
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: false
                }
                , {
                    yAxis: 1,
                    marker: {
                        radius: 6,
                        symbol: 'circle',
                    },
                    name: 'จำนวนการชำระเงินผ่านช่องทาง 3BB Web/3BB App.',
                    data: last_wk_data_R10034_count_pay,
                    pointStart: setPointStart(last_data_line_r10021),
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: false
                }]
            });

            $('#rd_r10032').hide();
            $('#btn_wk_fake').hide();
            $('#btn_wk').show();

            var txt_table = "<div id='display_r10032'>" +
            "<table id='table_r10032' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead>" +
            "<tr style='font-weight: normal'>" +
            "<th rowspan='2' style='text-align:center;'>วันจันทร์ที่</th>   " +
            "<th colspan='4' style='text-align:center;'>จำนวนการใช้งาน APP</th>   " +
            "<th rowspan='2' width='18%' style='text-align:center;color:" + colorSet_r4[4] + ";'>จำนวน Account ที่ใช้ Point</th>   " +
            "<th rowspan='2' width='18%' style='text-align:center;color:" + colorSet_r4[5] + ";'>จำนวนการชำระเงินผ่านช่องทาง<br>3BB Web/3BB App. <button type='button' class='btn btn-x-tr btn-danger hide-tr-10020' onclick=\"hide_table('10020');\"><span class='glyphicon glyphicon-remove'></span></button></th>   " +
            
            "</tr>" +
            "<tr style='font-weight: normal'>" +
            "<th width='13%' style='text-align:center;color:" + colorSet_r4[0] + ";'>จำนวนครั้ง </th>   " +
            "<th width='13%' style='text-align:center;color:" + colorSet_r4[1] + ";'>จำนวน Account</th>   " +
            "<th width='13%' style='text-align:center;color:" + colorSet_r4[2] + ";'>จำนวนครั้ง<br>(ไม่นับ Login ครั้งแรก)</th>   " +
            "<th width='13%' style='text-align:center;color:" + colorSet_r4[3] + ";'>จำนวน Account<br>(ไม่นับ Login ครั้งแรก)</th>" +
            "</tr>" +
            "</thead>" +
            "<tbody>";

            data.reverse();
            $.each(data,function( i,item ) {
                var cls_tr = ""

                if(i >= 5){
                    cls_tr = "hide-tr-10020"
                }

                txt_table += "<tr class='" + cls_tr + "'>" + 
                "<td>" + item.dtm + "</td>" + 
                "<td align='right'>" + parseInt(item.R10021_count_in_day).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.R10021_count_acc).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.R10031_count_in_day).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.R10031_count_acc).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.R10032_count_acc).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.R10034_count_pay).toLocaleString() + "</td>" + 
                "</tr>";
            });

            txt_table += "</tbody>" +
            "<tfoot class='dilld'>" +
            "<tr class='full-tr-10020'><td colspan='7' onclick=\"full_table('10020');\"><span class='glyphicon glyphicon-menu-down'></span> แสดงทั้งหมด</td></tr>" +
            "<tr class='hide-tr-10020'><td colspan='7' onclick=\"hide_table('10020');\"><span class='glyphicon glyphicon-menu-up'></span> แสดงน้อยลง</td></tr>" +
            "</tfoot>" +
            "</table>" +
            "</div>";

            $('#display_r10032').replaceWith(txt_table);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

$('input[type=radio][name=btn-r10020]').change(function() {
    if (this.value == 'r10032') {
        $('#rd_r10032').show();
        $('#table_r10032').show();

        $('#rd_r10022').hide();
        $('#table_r10022').hide();
    }
    else {
        $('#rd_r10022').show();
        $('#table_r10022').show();

        $('#rd_r10032').hide();
        $('#table_r10032').hide();
    }
});

function load_r10060(){
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10060";
    console.log("load_r10060 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {
            load_r10040(data);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r10040(data_R10060){
    var thisid = "rd_r10040";

    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10040";
    console.log("load_r10040 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {
            var max_y = 0;
            var arr_categories = [];
            var data_count_acc = [];

            $.each(data,function( i,item ) {
                if(item.GROUP_TIME == 'DAY'){
                    arr_categories.push(item.DAY_GROUP + " วันล่าสุด");
                    data_count_acc.push(parseInt(item.all_used));
                    max_y = findMax(max_y, parseInt(item.all_used));
                }
            });

            max_y = findMax(max_y, parseInt(data_R10060[0].COUNT_M3)); 
            max_y = findMax(max_y, parseInt(data_R10060[0].COUNT_M2)); 
            max_y = findMax(max_y, parseInt(data_R10060[0].COUNT_M1)); 
            max_y = findMax(max_y, parseInt(data_R10060[0].COUNT_LAST3M)); 
            max_y = findMax(max_y, parseInt(data_R10060[0].COUNT_LAST2M));

            Highcharts.chart("rd_r10040", {
                colors: colorSet_r3,
                chart: {
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit',
                    }
                },
                title: {
                    text: "จำนวนลูกค้า ที่เข้าใช้งาน ในช่วง 30, 60 และ 90 วันล่าสุด",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                    title: {
                        text: '',
                    },
                    labels: {
                        format: '{value}'
                    }
                },
                yAxis: {
                    title: {
                        text: 'จำนวน Account',
                    },
                    max: max_y
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px; font-weight: bold;">{point.key}</p><br><hr>',
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
                    series: {
                        events: {
                            legendItemClick: function () {
                                return false; 
                            }
                        }
                    },
                },
                series: [{
                    name: 'จำนวน Account',
                    maxPointWidth: 75,
                    data: data_count_acc,
                }, {
                }]
            });

            // data_count_acc = [644820, 550220, 640936, 347077, 454109];
            // arr_categories = ['ก.w. 2020', 'มี.ค. 2020', 'เม.ย. 2020', 'เข้าใช้ทั้ง 3 เดือนล่าสุด', 'เข้าใช้ทั้ง 2 เดือนล่าสุด'];
            data_count_acc = [
                parseInt(data_R10060[0].COUNT_M3), 
                parseInt(data_R10060[0].COUNT_M2), 
                parseInt(data_R10060[0].COUNT_M1), 
                parseInt(data_R10060[0].COUNT_LAST3M), 
                parseInt(data_R10060[0].COUNT_LAST2M), 
            ];
            arr_categories = [
                getStrYYMM(data_R10060[0].YYMM3, ""), 
                getStrYYMM(data_R10060[0].YYMM2, ""), 
                getStrYYMM(data_R10060[0].YYMM1, ""), 
                'เข้าใช้ทั้ง 3 เดือนล่าสุด', 
                'เข้าใช้ทั้ง 2 เดือนล่าสุด'
            ];

            Highcharts.chart("rd_r10060", {
                colors: colorSet_r3,
                chart: {
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit',
                    }
                },
                title: {
                    text: "จำนวนลูกค้า ที่กลับมาเข้าใช้งาน App. ในช่วง 3 เดือนล่าสุด",
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                    title: {
                        text: '',
                    },
                    labels: {
                        format: '{value}'
                    }
                },
                yAxis: {
                    title: {
                        text: 'จำนวน Account',
                    },
                    max: max_y
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px; font-weight: bold;">{point.key}</p><br><hr>',
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
                    series: {
                        events: {
                            legendItemClick: function () {
                                return false; 
                            }
                        }
                    },
                },
                series: [{
                    name: 'จำนวน Account',
                    maxPointWidth: 75,
                    data: data_count_acc,
                }, {
                }]
            });

            var pfoot = "แสดงจำนวนลูกค้า ที่กลับมาเข้าใช้งาน App. ในช่วง 3 เดือนที่ผ่านมา และจำนวนลูกค้า ที่เข้าใช้งาน ในช่วง 30, 60 และ 90 วันที่ผ่านมา ซึ่งจะทำให้เห็นว่า ลูกค้าที่เข้าใช้ในแต่ละเดือน เป็น Account ที่ซ้ำกันขนาดไหน";
            pfoot += "<br>*โดยมีเงื่อนไข <b>ไม่นับวันที่ Login ครั้งแรก</b> "
            pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
            $('#info_r10040').append(pfoot);

            var txt_table = "" +
            "<p class='title-target'>แสดงจำนวน Account ที่เข้าใช้แยกตาม จำนวน วันที่ เข้าใช้ซ้ำ ในแต่ละเดือน</p>" +
            "<div id='display_r10040'>" +
            "<table id='table_days_r10040' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead style='font-weight: normal'>" +
            "<tr>" +
            "<th>จำนวนวัน</th>" +
            "<th width='10%' style='text-align:center;'>1 วัน</th>" +
            "<th width='10%' style='text-align:center;'>2 วัน</th>" +
            "<th width='10%' style='text-align:center;'>3 วัน</th>" +
            "<th width='10%' style='text-align:center;'>4 วัน</th>" +
            "<th width='10%' style='text-align:center;'>5 วัน</th>" +
            "<th width='10%' style='text-align:center;'>6 วัน ขึ้นไป</th>" +
            "<th width='15%' style='text-align:center;'>รวมทั้งหมด</th>" +
            "<th width='15%' style='text-align:center;'>เฉลี่ย</th>" +
            "</tr>" +
            "</thead>" +
            "<tbody>";

            $.each(data,function( i,item ) {
                if(item.GROUP_TIME == 'DAY'){
                    txt_table += "<tr>" + 
                    "<td>" + item.DAY_GROUP + " วันล่าสุด</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_1).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_2).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_3).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_4).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_5).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_then_6).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.all_used).toLocaleString() + " Account</td>" + 
                    "<td align='right'>" + parseFloat(item.avg_used).toFixed(1) + " วัน</td>" + 
                    "</tr>";
                }
            });

            txt_table += "</tbody>" +
            "</table>" +
            "<p class='title-target'>แสดงจำนวน Account ที่เข้าใช้แยกตาม จำนวน ครั้งที่ เข้าใช้ซ้ำ ในแต่ละเดือน</p>" +
            "<table id='table_times_r10040' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead style='font-weight: normal'>" +
            "<tr>" +
            "<th>จำนวนครั้ง</th>" +
            "<th width='10%' style='text-align:center;'>1 ครั้ง</th>" +
            "<th width='10%' style='text-align:center;'>2 ครั้ง</th>" +
            "<th width='10%' style='text-align:center;'>3 ครั้ง</th>" +
            "<th width='10%' style='text-align:center;'>4 ครั้ง</th>" +
            "<th width='10%' style='text-align:center;'>5 ครั้ง</th>" +
            "<th width='10%' style='text-align:center;'>6 ครั้ง ขึ้นไป</th>" +
            "<th width='15%' style='text-align:center;'>รวมทั้งหมด</th>" +
            "<th width='15%' style='text-align:center;'>เฉลี่ย</th>" +
            "</tr>" +
            "</thead>" +
            "<tbody>";

            $.each(data,function( i,item ) {
                if(item.GROUP_TIME == 'TIME'){
                    txt_table += "<tr>" + 
                    "<td>" + item.DAY_GROUP + " วันล่าสุด</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_1).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_2).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_3).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_4).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_5).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.sum_used_then_6).toLocaleString() + "</td>" + 
                    "<td align='right'>" + parseInt(item.all_used).toLocaleString() + " Account</td>" + 
                    "<td align='right'>" + parseFloat(item.avg_used).toFixed(1) + " ครั้ง</td>" + 
                    "</tr>";
                }
            });

            txt_table += "</tbody>" +
            "</table>" +
            "</div>";

            $('#display_r10040').replaceWith(txt_table);
            $('#table_days_r10040').fadeIn();
            $('#table_times_r10040').fadeIn();

            pfoot = "เงื่อนไขข้อมูลในตาราง <b>ไม่นับวันที่ Login ครั้งแรก</b> "
            pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
            $('#display_r10040').append(pfoot);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r10070() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10070";
    console.log("load_r10070 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var temp_arr_label = "";
            var temp_arr_mm = data[0].mm;
            var i_mm = 0;

            var arr_categories = ['ไม่ได้เข้าใช้เกิน 1 ปี', ];
            var data_all = [];
            var data_real = [];

            $.each(data,function( i,item ) {
                var temp_in_loop = monthsShort[parseInt(item.mm)-1] + ' ' + item.yyyy;

                if(i > 0 & temp_arr_label != temp_in_loop) {
                    temp_arr_label = temp_in_loop;
                    arr_categories.push(temp_in_loop);
                }

                data_all.push(parseInt(item.all_appUsed));
                data_real.push(parseInt(item.real_appUsed));
            });

            Highcharts.chart('rd_r10070', {
                colors: colorSet_G2,
                chart: {
                    height: 365,
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: 'สถิติการ Login ครั้งสุดท้าย แยกตามเดือน',
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                    crosshair: true
                },
                yAxis: {
                    title: {
                        text: 'จำนวน Account',
                    },
                    stackLabels: {
                        enabled: true,
                        allowOverlap: true,
                        rotation: -90,
                        x: 8,
                        y: 15,
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'white'
                        }
                    }
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px; font-weight: bold;">{point.key}</p><br><hr>',
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
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                    series: {
                        events: {
                            legendItemClick: function () {
                                return false; 
                            }
                        }
                    },
                },
                series: [{
                    stack: 'Login ครั้งสุดท้าย ในเดือน',
                    name: 'Login ครั้งสุดท้าย ในเดือน',
                    data: data_all,
                    dataLabels: {
                        enabled: false
                    },
                }, {
                    stack: 'Login ครั้งสุดท้าย ในเดือน (เฉพาะที่เคยใช้ App มากกว่า 1 วัน)',
                    name: 'Login ครั้งสุดท้าย ในเดือน (เฉพาะที่เคยใช้ App มากกว่า 1 วัน)',
                    data: data_real,
                    dataLabels: {
                        enabled: false
                    },
                }]
            });

            var txt_table = "<div id='display_r10070'>" +
            "<table id='table_r10070' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead>" +
            "<tr style='font-weight: normal'>" +
            "<th></th>   " +
            "<th width='40%' style='text-align:center;color:" + colorSet_G2[0] + ";'>Login ครั้งสุดท้าย ในเดือน</th>   " +
            "<th width='40%' style='text-align:center;color:" + colorSet_G2[1] + ";'>Login ครั้งสุดท้าย ในเดือน (เฉพาะที่เคยใช้ App มากกว่า 1 วัน) <button type='button' class='btn btn-x-tr btn-danger hide-tr-10070' onclick=\"hide_table('10070');\"><span class='glyphicon glyphicon-remove'></span></button></th>   " +
            "</tr>" +
            "</thead>" +
            "<tbody>";

            var b = data.length;
            for (var i = data.length - 1; i >= 0; i--) {
                var cls_tr = ""

                if(i <= data.length-4){
                    cls_tr = "hide-tr-10070"
                }

                txt_table += "<tr class='" + cls_tr + "'>" + 
                "<td>" + arr_categories[i] + "</td>" + 
                "<td align='right'>" + data_all[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + data_real[i].toLocaleString() + "</td>" + 
                "</tr>";
            };

            txt_table += "</tbody>" +
            "<tfoot class='dilld'>" +
            "<tr class='full-tr-10070'><td colspan='5' onclick=\"full_table('10070');\"><span class='glyphicon glyphicon-menu-down'></span> แสดงทั้งหมด</td></tr>" +
            "<tr class='hide-tr-10070'><td colspan='5' onclick=\"hide_table('10070');\"><span class='glyphicon glyphicon-menu-up'></span> แสดงน้อยลง</td></tr>" +
            "</tfoot>" +
            "</table>" +
            "</div>";

            $('#display_r10070').replaceWith(txt_table);

            $('#table_r10070').fadeIn();
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r10050() {
    var thisid = "rd_r10050";

    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10050";
    console.log("load_r10050 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 

            var highchart_data_line_30 = [];
            var highchart_data_line_60 = [];
            var highchart_data_line_90 = [];
            var table_data_60 = [];
            var table_data_90 = [];

            var start_data_line_30 = new Date(data[0].DTM);
            var start_data_line_60 = new Date(start_data_line_30);
            var start_data_line_90 = new Date(start_data_line_30);

            $.each(data,function( i,item ) {
                highchart_data_line_30.push(parseInt(item.sum_DAY_GROUP_30));

                if(parseInt(item.sum_DAY_GROUP_60) > 0){
                    highchart_data_line_60.push(parseInt(item.sum_DAY_GROUP_60));
                    table_data_60.push(parseInt(item.sum_DAY_GROUP_60));
                }
                else {
                    table_data_60.push(0);
                }

                if(parseInt(item.sum_DAY_GROUP_90) > 0){
                    highchart_data_line_90.push(parseInt(item.sum_DAY_GROUP_90));
                    table_data_90.push(parseInt(item.sum_DAY_GROUP_90));
                }
                else {
                    table_data_90.push(0);
                }
            });

            start_data_line_60 = addDays(start_data_line_60, (highchart_data_line_30.length - highchart_data_line_60.length))
            start_data_line_90 = addDays(start_data_line_90, (highchart_data_line_30.length - highchart_data_line_90.length))
            
            Highcharts.chart(thisid, {
                colors: colorSet_r3,
                chart: {
                    height: 500,
                    type: 'line',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: "สถิติลูกค้าที่เข้าใช้งาน App ในช่วง 30, 60 และ 90 วันล่าสุด",
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
                yAxis: {
                    title: {
                        text: '',
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
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                    series: {
                        events: {
                            legendItemClick: function () {
                                return false; 
                            }
                        }
                    },
                },
                series: [{
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: '30 วันล่าสุด',
                    data: highchart_data_line_30,
                    pointStart: setPointStart(start_data_line_30),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: '60 วันล่าสุด',
                    data: highchart_data_line_60,
                    pointStart: setPointStart(start_data_line_60),
                    pointInterval: setDaysInterval(1),
                }
                , {
                    marker: {
                        radius: 3,
                        symbol: 'circle',
                    },
                    name: '90 วันล่าสุด',
                    data: highchart_data_line_90,
                    pointStart: setPointStart(start_data_line_90),
                    pointInterval: setDaysInterval(1),
                }]
            });

            var txt_table = "<div id='display_r10050'>" +
            "<table id='table_r10050' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
            "<thead>" +
            "<tr style='font-weight: normal'>" +
            "<th>วันที่</th>   " +
            "<th width='25%' style='text-align:center;color:" + colorSet_r3[0] + ";'>30 วันล่าสุด</th>   " +
            "<th width='25%' style='text-align:center;color:" + colorSet_r3[1] + ";'>60 วันล่าสุด</th>   " +
            "<th width='25%' style='text-align:center;color:" + colorSet_r3[2] + ";'>90 วันล่าสุด <button type='button' class='btn btn-x-tr btn-danger hide-tr-10050' onclick=\"hide_table('10050');\"><span class='glyphicon glyphicon-remove'></span></button></th>   " +
            "</tr>" +
            "</thead>" +
            "<tbody>";

            var b = data.length;
            for (var i = data.length - 1; i >= 0; i--) {
                var cls_tr = ""

                if(i <= data.length-6){
                    cls_tr = "hide-tr-10050"
                }

                var d60 = "-";
                if(table_data_60[i] > 0) {
                    d60 = table_data_60[i].toLocaleString();
                }

                var d90 = "-";
                if(table_data_90[i] > 0) {
                    d90 = table_data_90[i].toLocaleString();
                }

                txt_table += "<tr class='" + cls_tr + "'>" + 
                "<td>" + data[i].DTM + "</td>" + 
                "<td align='right'>" + highchart_data_line_30[i].toLocaleString() + "</td>" + 
                "<td align='right'>" + d60 + "</td>" + 
                "<td align='right'>" + d90 + "</td>" + 
                "</tr>";
            };

            txt_table += "</tbody>" +
            "<tfoot class='dilld'>" +
            "<tr class='full-tr-10050'><td colspan='5' onclick=\"full_table('10050');\"><span class='glyphicon glyphicon-menu-down'></span> แสดงทั้งหมด</td></tr>" +
            "<tr class='hide-tr-10050'><td colspan='5' onclick=\"hide_table('10050');\"><span class='glyphicon glyphicon-menu-up'></span> แสดงน้อยลง</td></tr>" +
            "</tfoot>" +
            "</table>" +
            "</div>";

            $('#display_r10050').replaceWith(txt_table);

            $('#table_r10050').fadeIn();

            var pfoot = "แสดงแนวโน้มการเข้าใช้งาน App ในช่วง 30, 60, 90 วัน ก่อนหน้า *โดยมีเงื่อนไข <b>ไม่นับวันที่ Login ครั้งแรก</b> ";
            pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
            $('#rd_r10050').append(pfoot);

            // var rr = "<br><br><br><br><br>";
            // for (var i = 0; i < 25; i++) {
            //     rr += ",sum(case when HOUR_DATA = " + i + " then total_h else 0 end) h" + i + " <br>";
            // };

            // $('#rd_r10050').append(rr);

        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function arrCrieMA7(data, label_str) {
    var temp_label = data[0].label;
    var r1 = 0, r2 = 0;

    var arr2 = [];
    arr2[r1] = [];

    $.each(data,function( i,item ) {
        if (temp_label != item.label) {
            temp_label = item.label;

            r1++;
            r2 = 0;

            arr2[r1] = [];
        }

        arr2[r1][r2++] = data[i];
    });

    var data_c_rie = [];

    $.each(arr2,function( i,item ) {
        data_c_rie.push(
        {
            marker: {
                radius: 3,
                symbol: 'circle',
            },
            name: label_str + arr2[i][0].label,
            pointStart: setPointStart(new Date(data[6].x)),
            pointInterval: setDaysInterval(1),
            data: arrMA7(arr2[i]),
        }
        );
    });

    function arrMA7(data) {
        var arrdata = [];
        var sma7_c1 = simple_moving_averager(7);

        $.each(data,function( i,item ) {
            var pushm7 = Math.round(sma7_c1(parseInt(item.y)));

            // arrdata.push(parseInt(item.y));
            if(i >= 7){
                arrdata.push(pushm7);
            }
        });

        return arrdata;
    }

    return data_c_rie
}

$("#btn_export_r10070").click(function() {
    window.open("app_xport_r10070.aspx");
});

$("#btn_export_a10_t30").click(function() {
    window.open("app_xport_a10_t30_newcust.aspx?res=" + url_T30_append);
});

function loadTableT10(){
    // var url = "ajax_chart.aspx?qrs=SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY";
    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_TARGET75_PERTEAM_DAILY";
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
            renderChartT10(data_T10);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function renderChartT10(data) {
    var temp_arr_label = "";
    var arr_categories = [];
    var arr_AppUsed_PERCENT = [];
    var arr_RealAppUsed_PERCENT = [];

    $.each(data,function( i,item ) {
        if(inROhalf.includes(item.RO)) {
            if(temp_arr_label != item.CLUSTERS) {
                temp_arr_label = item.CLUSTERS;
                arr_categories.push(item.CLUSTERS);
            }

            arr_AppUsed_PERCENT.push(parseFloat(item.AppUsed_PERCENT));
            arr_RealAppUsed_PERCENT.push(parseFloat(item.RealAppUsed_PERCENT));
        }
    });

    Highcharts.setOptions({
        colors: colorSet_G2, 
        lang: {
            thousandsSep: ','
        }
    });

    Highcharts.chart('rd_a10_t10_cluster1', {
        chart: {
            height: 250,
            type: 'column',
            style: {
                fontFamily: 'Kanit'
            }
        },
        title: {
            text: '',
        },
        xAxis: {
            categories: arr_categories,
            crosshair: true
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
            headerFormat: '<p style="font-size: 14px; font-weight: bold;">{point.key}</p><br><hr>',
            style: {
                "fontSize": "14px",
            },
            valueSuffix: '%'
        },
        legend: {
            // enabled: false
            symbolRadius: 0,
            padding: 0,
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                        return Highcharts.numberFormat(this.y,1) + '%';
                    },
                }
            },
            series: {
                events: {
                    legendItemClick: function () {
                        return false; 
                    }
                }
            },
        },
        series: [{
            stack: 'ใช้ App แล้ว',
            name: 'ใช้ App แล้ว',
            data: arr_AppUsed_PERCENT
        }, {
            stack: 'ใช้ App มากกว่า 1 ครั้ง',
            name: 'ใช้ App มากกว่า 1 ครั้ง',
            data: arr_RealAppUsed_PERCENT

        }]
    });

    // reset var
    temp_arr_label = "";
    arr_categories = [];
    arr_AppUsed_PERCENT = [];
    arr_RealAppUsed_PERCENT = [];

    $.each(data,function( i,item ) {
        if(inROhalf.includes(item.RO) == false) {
            if(temp_arr_label != item.CLUSTERS) {
                temp_arr_label = item.CLUSTERS;
                arr_categories.push(item.CLUSTERS);
            }

            arr_AppUsed_PERCENT.push(parseFloat(item.AppUsed_PERCENT));
            arr_RealAppUsed_PERCENT.push(parseFloat(item.RealAppUsed_PERCENT));
        }
    });

    Highcharts.chart('rd_a10_t10_cluster2', {
        chart: {
            height: 250,
            type: 'column',
            style: {
                fontFamily: 'Kanit'
            }
        },
        title: {
            text: '',
        },
        xAxis: {
            categories: arr_categories,
            crosshair: true
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
            headerFormat: '<p style="font-size: 14px; font-weight: bold;">{point.key}</p><br><hr>',
            style: {
                "fontSize": "14px",
            },
            valueSuffix: '%'
        },
        legend: {
            // enabled: false
            symbolRadius: 0,
            padding: 0,
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                        return Highcharts.numberFormat(this.y,1) + '%';
                    },
                }
            },
            series: {
                events: {
                    legendItemClick: function () {
                        return false; 
                    }
                }
            },
        },
        series: [{
            stack: 'ใช้ App แล้ว',
            name: 'ใช้ App แล้ว',
            data: arr_AppUsed_PERCENT
        }, {
            stack: 'ใช้ App มากกว่า 1 ครั้ง',
            name: 'ใช้ App มากกว่า 1 ครั้ง',
            data: arr_RealAppUsed_PERCENT

        }]
    });

    var gfoot = "<span class='glyphicon icon-info'></span> คำอธิบายกราฟ<br>" +
    "กราฟ แสดงให้เห็นว่า จากลูกค้าที่่มีการลง 3BB Member App. ของแต่ละ cluster มีลูกค้าที่กลับมาใช้จริง เทียบกันได้ในสัดส่วนเท่าไร ถ้าที่ไหนมียอดต่างกันน้อย น่าจะหมายถึง พนักงานได้อธิบายให้ลูกค้า ทราบถึงประโยชน์ของการมี 3BB Member App. ได้อย่างประสบความสำเร็จ" +
    "<br><br>";

    $('#gdesc_a10_t10').html(gfoot);
}

function htmlTableT10(data) {
    var total_CUSTOMER = 0;
    var total_AppUsed = 0;
    var total_RealAppUsed = 0;
    var total_TARGET_75 = 0;

    var avg_PerAppUsed = 0;
    var avg_SHOP = 0;
    var avg_INSTALL = 0;
    var avg_REPAIR = 0;

    var txt_html = "<div id='display_a10_t10'>" +
    "<table id='table_target_75' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
    "<thead style='font-weight: normal'>" +
        "<tr>    " +
            "<th rowspan='2'>RO</th> " +
            "<th rowspan='2' style='min-width:125px;'>CLUSTERS " + arrayBTN['T10_CLUSTERS'][order_T10] + "</th>   " +
            "<th rowspan='2' width='14%' style='text-align:center;'>จำนวนลูกค้า</th>   " +
            "<th colspan='4' style='text-align:center;'>จำนวนผู้ใช้ Application </th>   " +
            "<th colspan='3' style='text-align:center;'>เปอร์เซ็นรวม G40 ตามช่องทาง</th>   " +
        "</tr>" +
        "<tr>    " +
            // "<th width='13%' style='text-align:center;'>เป้า Cluster 75%</th>    " +
            "<th width='12%' style='text-align:center;'>ใช้ App แล้ว</th>    " +
            "<th width='12%' style='text-align:center;'>ใช้ App<br>มากกว่า 1 ครั้ง</th>    " +
            "<th width='12%' style='text-align:center;'>ใช้ App แล้ว (%) " + arrayBTN['AppUsed_PERCENT'][order_T10] + "</th> " +
            "<th width='12%' style='text-align:center;'>ใช้ App<br>มากกว่า 1 ครั้ง (%) " + arrayBTN['RealAppUsed_PERCENT'][order_T10] + "</th> " +
            "<th width='9%' style='text-align:center;'>ติดต่อ Shop " + arrayBTN['SHOP_PERCENT'][order_T10] + "</th> " +
            "<th width='9%' style='text-align:center;'>ช่างติดตั้ง " + arrayBTN['INSTALL_PERCENT'][order_T10] + "</th> " +
            "<th width='9%' style='text-align:center;'>ช่างซ่อม " + arrayBTN['REPAIR_PERCENT'][order_T10] + "</th> " +
        "</tr>" +
    "</thead>" +
    "<tbody>";

    $.each(data,function( i,item ) {
        var cluster_id = item.RO + item.CLUSTERS;
        cluster_id = cluster_id.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');

        txt_html += "" +
        "<tr id='tr_perteam_" + cluster_id + "' onclick='explanT10Prove(\"" + cluster_id + "\", \"" + item.CLUSTERS + "\")' class='tr-target-perteam-cluster'>" + 
        "<td>" + item.RO + "</td>" + 
        "<td><span id='g_perteam_" + cluster_id + "' class='glyphicon glyphicon-plus'></span> " + item.CLUSTERS + "</td>" + 
        "<td align='right'>" + parseInt(item.CUSTOMER).toLocaleString() + "</td>" +
        // "<td align='right'>" + parseInt(item.TARGET_75).toLocaleString() + "</td>" +
        "<td align='right'>" + parseInt(item.AppUsed).toLocaleString() + "</td>" +
        "<td align='right'>" + parseInt(item.RealAppUsed).toLocaleString() + "</td>";

        if (parseFloat(item.AppUsed_PERCENT) >= 75) {
            txt_html += "<td align='right'><span class='glyphicon icon-star-full' style='color:#ffe783;font-size:14px;'></span> " + parseFloat(item.AppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        else {
            txt_html += "<td align='right'>" + parseFloat(item.AppUsed_PERCENT).toFixed(1) + "%</td>";
        }

        if (parseFloat(item.RealAppUsed_PERCENT) >= 75) {
            txt_html += "<td align='right' class='hl-75per'><span class='glyphicon icon-star-full' style='color:#ffe783;font-size:14px;'></span> " + parseFloat(item.RealAppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        else if (parseFloat(item.RealAppUsed_PERCENT) >= 70) {
            txt_html += "<td align='right' class='hl-70per'>" + parseFloat(item.RealAppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        else if (parseFloat(item.RealAppUsed_PERCENT) >= 65) {
            txt_html += "<td align='right' class='hl-65per'>" + parseFloat(item.RealAppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        else if (parseFloat(item.RealAppUsed_PERCENT) >= 60) {
            txt_html += "<td align='right' class='hl-60per'>" + parseFloat(item.RealAppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        else {
            txt_html += "<td align='right'>" + parseFloat(item.RealAppUsed_PERCENT).toFixed(1) + "%</td>";
        }
        
        txt_html += "<td align='right'>" + parseFloat(item.SHOP).toFixed(1) + "%</td>" +
        "<td align='right'>" + parseFloat(item.INSTALL).toFixed(1) + "%</td>" +
        "<td align='right'>" + parseFloat(item.REPAIR).toFixed(1) + "%</td>" +
        "</tr>";

        total_CUSTOMER += parseFloat(item.CUSTOMER);
        total_AppUsed += parseFloat(item.AppUsed);
        total_RealAppUsed += parseFloat(item.RealAppUsed);
        // total_TARGET_75 += parseFloat(item.TARGET_75);

        // avg_PerAppUsed += parseFloat(item.AppUsed_PERCENT);
        avg_SHOP += parseFloat(item.SHOP);
        avg_INSTALL += parseFloat(item.INSTALL);
        avg_REPAIR += parseFloat(item.REPAIR);
    });

    // avg_PerAppUsed = parseFloat(avg_PerAppUsed/data.length);
    avg_SHOP = parseFloat(avg_SHOP/data.length);
    avg_INSTALL = parseFloat(avg_INSTALL/data.length);
    avg_REPAIR = parseFloat(avg_REPAIR/data.length);

    txt_html += "</tbody>" +
    "<tfoot style='background-color: #2a2a2a;'>" +
    "<tr class='txt-bold'>    " +
    "<td colspan='2'>Total</td>   " +
    "<td align='right'>" + parseInt(total_CUSTOMER).toLocaleString() + "</td>  " +
    // "<td align='right'>" + parseInt(total_TARGET_75).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseInt(total_AppUsed).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseInt(total_RealAppUsed).toLocaleString() + "</td>  " +
    "<td align='right'>" + parseFloat((total_AppUsed/total_CUSTOMER)*100).toFixed(1) + "%</td> " +
    "<td align='right'>" + parseFloat((total_RealAppUsed/total_CUSTOMER)*100).toFixed(1) + "%</td> " +
    // "<td align='right'>" + avg_PerAppUsed.toFixed(1) + "%</td> " +
    "<td align='right'>" + avg_SHOP.toFixed(1) + "%</td> " +
    "<td align='right'>" + avg_INSTALL.toFixed(1) + "%</td> " +
    "<td align='right'>" + avg_REPAIR.toFixed(1) + "%</td> " +
    "</tr>   " + 
    "</tfoot>" +
    "</table>" +
    "</div>";

    $('#display_a10_t10').replaceWith(txt_html);

    $('#table_target_75').fadeIn();

    var pfoot = "";
    pfoot += "เงื่อนไข Hilight คือ" +
    "<br>* คอลัมน์ [จำนวนลูกค้าใช้ App แล้ว (%)] จะมีดาว <span class='glyphicon icon-star-full' style='color:#ffe783;font-size:12px;'></span> ตั้งแต่ 75% " +
    "<br>* คอลัมน์ [จำนวนลูกค้าใช้ App มากกว่า 1 ครั้ง (%)] <span class='hl-60per'>ตั้งแต่ 60%</span>" + 
    " > <span class='hl-65per'>ตั้งแต่ 65%</span>" + 
    " > <span class='hl-70per'> ตั้งแต่ 70%</span> " +
    "และมีดาว <b class='hl-70per'><span class='glyphicon icon-star-full' style='color:#ffe783;font-size:12px;'></span> ตั้งแต่ 75%</b> ";
    

    pfoot += "<br><br>" +
    "รายละเอียดข้อมูลในตาราง" +
    "<br>* จำนวนลูกค้าของแต่ละ Cluster ใช้ จำนวนลูกค้า ณ. สิ้นวันที่ 01 ต.ค. 2562" + 
    "<br>* ยกเว้น จำนวนลูกค้าของ RO10 ใช้จำนวนลูกค้า ณ. สิ้นวันที่ 31 ธ.ค. 2562 (เพื่อให้สอดคล้องกับการแบ่งพื้นที่ใหม่ในพื้นที่ RO10)" +
    "<br>* จำนวนลูกค้าใช้ App แล้ว หมายถึง Account ที่ยังคงสถานะใช้บริการ (ไม่นับ Account ที่ยกเลิกบริการ TX, TA)";

    pfoot += "<br><br>" +
    "<a class='inonly btn btn-sm btn-default' href='app_download.aspx' title='Export excel'><span class='glyphicon glyphicon-save-file'></span> Download ข้อมูล Account ที่เคยใช้งาน App ครั้งเดียวได้ที่ L60</a>";

    pfoot = "<p class='pfoot' style='margin-bottom: 20px;'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
    $('#display_a10_t10').append(pfoot);

    $('#sort_' + by_T10).addClass('active-sort')
}

function explanT10Prove(id, cluster) {
    var prov_class = 'perteam-prov-' + id;

    if($('.' + prov_class).length == 0) {
        loadTableT10Prov(prov_class, id, cluster);
    } else {
        if($('.' + prov_class).is(":hidden")){
            // $('#g_perteam_' + id).replaceWith("<span id='g_perteam_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");
            // $('.' + prov_class).show();

            $('.' + prov_class).remove();
            loadTableT10Prov(prov_class, id, cluster);
        }
        else {
            $('#g_perteam_' + id).replaceWith("<span id='g_perteam_" + id + "' class='glyphicon glyphicon-plus'></span>");
            $('.' + prov_class).hide();
        }
    }
}

function loadTableT10Prov(prov_class, id, cluster){
    $('#g_perteam_' + id).replaceWith("<span id='g_perteam_" + id + "' class='glyphicon glyphicon-refresh gly-spin'></span>");

    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_TARGET75_PROV_PERTEAM_DAILY&cluster=" + cluster;
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
                    txt_html += "<tr class='" + prov_class + " tr-target-perteam-prov'>    " +
                    "<td align='right' colspan='2'>" + item.PROVINCE + "</td>   " +
                    "<td align='right'>" + parseInt(item.CUSTOMER).toLocaleString() + "</td>" +
                    // "<td align='right'>" + parseInt(item.TARGET_75).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseInt(item.AppUsed).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseInt(item.RealAppUsed).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseFloat(item.AppUsed_PERCENT).toFixed(1) + "%</td>" +
                    "<td align='right'>" + parseFloat(item.RealAppUsed_PERCENT).toFixed(1) + "%</td>" +
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

function loadTableT20(){
    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_APPUSED_A10_DAILY";
    console.log("loadTableT20 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0) {
                $('.appused-date').html(ddmmyyyyDate(data[0].DATE_DATA));

                data_T20 = data;
            }

            htmlTable20(data_T20);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function htmlTable20(data) {
    var txt_html = "<div id='display_a10_t20'>" +
    "<table id='table_appused_a10' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
    "<thead style='font-weight: normal'>" +
        "<tr>    " +
            "<th rowspan='2'>RO</th> " +
            "<th rowspan='2' style='min-width:125px;'>CLUSTERS " + arrayBTN['T20_CLUSTERS'][order_T20] + "</th>   " +
            "<th rowspan='2' style='text-align:center;'>จำนวนลูกค้าใช้ App แล้ว " + arrayBTN['AppUsedA10'][order_T20] + "</th>    " +
            "<th colspan='2' style='text-align:center;'>จำนวนผู้ใช้ 30 วันที่ผ่านมา</th>   " +
            "<th colspan='2' style='text-align:center;'>จำนวนผู้ใช้ 60 วันที่ผ่านมา</th>   " +
            "<th colspan='2' style='text-align:center;'>จำนวนผู้ใช้ 90 วันที่ผ่านมา</th>   " +
        "</tr>" +
        "<tr>    " +
            "<th style='text-align:center;'>จำนวน Account " + arrayBTN['AppUsed_30days'][order_T20] + "</th>" +
            "<th style='text-align:center;'>คิดเป็น %<br>จากผู้ที่ลง App แล้ว " + arrayBTN['PERCENT_30days'][order_T20] + "</th>    " +
            "<th style='text-align:center;'>จำนวน Account " + arrayBTN['AppUsed_60days'][order_T20] + "</th>" +
            "<th style='text-align:center;'>คิดเป็น %<br>จากผู้ที่ลง App แล้ว " + arrayBTN['PERCENT_60days'][order_T20] + "</th>    " +
            "<th style='text-align:center;'>จำนวน Account " + arrayBTN['AppUsed_90days'][order_T20] + "</th>" +
            "<th style='text-align:center;'>คิดเป็น %<br>จากผู้ที่ลง App แล้ว " + arrayBTN['PERCENT_90days'][order_T20] + "</th>    " +
        "</tr>" +
    "</thead>" +
    "<tbody>";

    $.each(data,function( i,item ) {
        var cluster_id = item.RO + item.CLUSTERS;
        cluster_id = cluster_id.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');

        txt_html += "" +
        "<tr id='tr_appused_" + cluster_id + "' onclick='explanT20Prove(\"" + cluster_id + "\", \"" + item.CLUSTERS + "\")' class='tr-target-appused-cluster'>" + 
        "<td>" + item.RO + "</td>" + 
        "<td><span id='g_appused_" + cluster_id + "' class='glyphicon glyphicon-plus'></span> " + item.CLUSTERS + "</td>" + 
        "<td align='right'>" + parseInt(item.AppUsed).toLocaleString() + "</td>" +
        "<td align='right'>" + parseInt(item.AppUsed_30days).toLocaleString() + "</td>";

        if (parseFloat(item.PERCENT_30days) >= 50) {
            txt_html += "<td align='right' class='hl-30days'>" + parseFloat(item.PERCENT_30days).toFixed(1) + "%</td>";
        }
        else {
            txt_html += "<td align='right'>" + parseFloat(item.PERCENT_30days).toFixed(1) + "%</td>";
        }

        txt_html += "<td align='right'>" + parseInt(item.AppUsed_60days).toLocaleString() + "</td>";

        if (parseFloat(item.PERCENT_60days) >= 60) {
            txt_html += "<td align='right' class='hl-60days'>" + parseFloat(item.PERCENT_60days).toFixed(1) + "%</td>";
        }
        else {
            txt_html += "<td align='right'>" + parseFloat(item.PERCENT_60days).toFixed(1) + "%</td>";
        }

        txt_html += "<td align='right'>" + parseInt(item.AppUsed_90days).toLocaleString() + "</td>";

        if (parseFloat(item.PERCENT_90days) >= 65) {
            txt_html += "<td align='right' class='hl-90days'>" + parseFloat(item.PERCENT_90days).toFixed(1) + "%</td>";
        }
        else {
            txt_html += "<td align='right'>" + parseFloat(item.PERCENT_90days).toFixed(1) + "%</td>";
        }

        txt_html += "</tr>";
    });
    "</table>" +
    "</div>";

    $('#display_a10_t20').replaceWith(txt_html);

    $('#table_appused_a10').fadeIn();

    var pfoot = "รายละเอียดข้อมูลในตาราง<br>" +
    "* Hilight คือ มีสัดส่วนการเข้าใช้ดีกว่าเกณฑ์ค่าเฉลี่ย (30 วัน ค่าเฉลี่ย 50%, 60 วัน ค่าเฉลี่ย 60%, 90 วัน ค่าเฉลี่ย 65%)<br>" +
    "* จำนวนลูกค้าใช้ App แล้ว หมายถึง Account ที่ยังคงสถานะใช้บริการ (ไม่นับ Account ที่ยกเลิกบริการ TX, TA)";
    pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
    $('#display_a10_t20').append(pfoot);

    $('#sort_' + by_T20).addClass('active-sort')
}

function explanT20Prove(id, cluster) {
    var prov_class = 'appused-prov-' + id;

    if($('.' + prov_class).length == 0) {
        loadTableT20Prov(prov_class, id, cluster);
    } else {
        if($('.' + prov_class).is(":hidden")){
            $('.' + prov_class).remove();
            loadTableT20Prov(prov_class, id, cluster);
        }
        else {
            $('#g_appused_' + id).replaceWith("<span id='g_appused_" + id + "' class='glyphicon glyphicon-plus'></span>");
            $('.' + prov_class).hide();
        }
    }
}

function loadTableT20Prov(prov_class, id, cluster){
    $('#g_appused_' + id).replaceWith("<span id='g_appused_" + id + "' class='glyphicon glyphicon-refresh gly-spin'></span>");

    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_APPUSED_PROV_A10_DAILY&cluster=" + cluster;
    console.log("loadTableT20Prov = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0){
                data = dataSort(data, by_T20, order_T20);

                var txt_html = "";

                $.each(data,function( i,item ) {
                    txt_html += "<tr class='" + prov_class + " tr-target-appused-prov'>    " +
                    "<td align='right' colspan='2'>" + item.PROVINCE + "</td>   " +
                    "<td align='right'>" + parseInt(item.AppUsed).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseInt(item.AppUsed_30days).toLocaleString() + "</td>";

                    if (parseFloat(item.PERCENT_30days) >= 50) {
                        txt_html += "<td align='right' class='hl-30days'>" + parseFloat(item.PERCENT_30days).toFixed(1) + "%</td>";
                    }
                    else {
                        txt_html += "<td align='right'>" + parseFloat(item.PERCENT_30days).toFixed(1) + "%</td>";
                    }

                    txt_html += "<td align='right'>" + parseInt(item.AppUsed_60days).toLocaleString() + "</td>";

                    if (parseFloat(item.PERCENT_60days) >= 60) {
                        txt_html += "<td align='right' class='hl-60days'>" + parseFloat(item.PERCENT_60days).toFixed(1) + "%</td>";
                    }
                    else {
                        txt_html += "<td align='right'>" + parseFloat(item.PERCENT_60days).toFixed(1) + "%</td>";
                    }

                    txt_html += "<td align='right'>" + parseInt(item.AppUsed_90days).toLocaleString() + "</td>";

                    if (parseFloat(item.PERCENT_90days) >= 65) {
                        txt_html += "<td align='right' class='hl-90days'>" + parseFloat(item.PERCENT_90days).toFixed(1) + "%</td>";
                    }
                    else {
                        txt_html += "<td align='right'>" + parseFloat(item.PERCENT_90days).toFixed(1) + "%</td>";
                    }
                    txt_html += "</tr>";
                });

                $('#tr_appused_' + id).after(txt_html);

                $('#g_appused_' + id).replaceWith("<span id='g_appused_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");
            }
        },
        error: function(x, t, m) {
            $('#g_appused_' + id).replaceWith("<span id='g_appused_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");

            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

$('#sel_t30_version').change(function() {
    loadTableT30();
});

$('#chk_t30_resident').change(function() {
    chk_t30_resident();
});

function chk_t30_resident() {
    url_T30_append = "";
    str_T30_append = "";

    if($('#chk_t30_resident').prop('checked') == true) {
       url_T30_append = "_RESIDENT";
       str_T30_append = "(เฉพาะลูกค้า Resident)";
    }

    loadTableT30();
}

function loadTableT30(){
    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_NEWCUST" + url_T30_append + "_A10_MONTH&yyyymm=" + $('#sel_t30_version').val();
    // var url = "ajax_chart.aspx?qrs=SP_TBB_APP_NEWCUST_A10_DAILY";
    console.log("loadTableT30 = " + url);

    $('#gdesc_a10_t30').html("");

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0) {
                $('.newcust-mmyyyy').html(mmyyyyStr(data[0].CAL_DATE));

                data_T30 = data;
            }

            htmlTableT30(data_T30);
            renderChartT30(data_T30)
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function T30Color(per) {
    per = parseFloat(per);

    if(per >= 90) {
        return "#06F52A"; 
    }
    else if(per >= 80) {
        return "#00FF10"; 
    }
    else if(per >= 75) {
        return "#29F500"; 
    }
    else if(per >= 70) {
        return "#83F120"; 
    }
    else if(per >= 65) {
        return "#C2FF00";
    }
    else if(per >= 60) {
        return "#FEF610";
    }
    else if(per >= 55) {
        return "#D6BD00";
    }
    else if(per >= 50) {
        return "#D69E20";
    }
    else if(per >= 45) {
        return "#D67020";
    }
    else if(per >= 40) {
        return "#D66700";
    }
    else if(per >= 35) {
        return "#E24F00";
    }
    else if(per >= 30) {
        return "#F74100";
    }

    return "#FF0000";
}

function renderChartT30(data) {
    var arr_Percent_LastAmount = [];
    var arr_categories = [];

    data.sort(function(a, b){return a.Percent_LastAmount - b.Percent_LastAmount});
    data.reverse();

    $.each(data,function( i,item ) {
        arr_categories.push(item.CLUSTERS);
                arr_Percent_LastAmount.push({
                    CLUSTERS: item.CLUSTERS,
                    y: parseFloat(item.Percent_LastAmount),
                    AppUsed_LastAmount: parseInt(item.AppUsed_LastAmount).toLocaleString(),
                    NewCust_LastAmount: parseInt(item.NewCust_LastAmount).toLocaleString(),
                    color: T30Color(item.Percent_LastAmount)
                });
    });

    Highcharts.setOptions({
        colors: colorSet_r4, 
        lang: {
            thousandsSep: ','
        }
    });

    Highcharts.chart('rd_a10_t30', {
        chart: {
            height: 600,
            type: 'bar',
            style: {
                fontFamily: 'Kanit',
            }
        },
        title: {
            text: '',
            // text: "กราฟสัดส่วนการเข้าใช้ 3BB Member App. ของลูกค้าติดตั้งใหม่ (PIS) " + $("#sel_t30_version option:selected").html(),
            // style: {
            //     fontSize: '14px',
            // }
        },
        xAxis: {
            categories: arr_categories,
            crosshair: true
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
            enabled: false
        },
        tooltip: {
            shared: true,
            useHTML: true,
            style: {
                "fontSize": "14px",
            },
            borderColor: "#fc8b16",
            formatter: function() {
                // console.log(this);
                var content = this.x;
                var asterisk = "";

                if(this.y > 80) {
                    asterisk += "<span class='glyphicon icon-star-full' style='color:#ffe783;font-size:14px;'></span>"
                } 
                if(this.y > 90) {
                    asterisk += "<span class='glyphicon icon-star-full' style='color:#ffe783;font-size:14px;'></span>"
                } 

                content = "<b>" + content + "</b>";
                content += "<br>"      
                content += "<span style='color: " + T30Color(this.y) + ";' class='glyphicon icon-stop2'></span> " + this.points[0].point.series.userOptions.name + ": <b>" + asterisk + " " + this.y + "%</b> ";
                content += "<br>"      
                content += "(จากยอด PIS สะสมในเดือน: " + this.points[0].point.NewCust_LastAmount + " มียอดติดตั้ง App สะสม: " + this.points[0].point.AppUsed_LastAmount + ")"      
                
                return content;
            }
        },
        plotOptions: {
            bar: {
                stacking: 'normal',
                dataLabels: {
                    align: 'right',
                    enabled: true,
                    formatter: function () {
                        return Highcharts.numberFormat(this.y,1) + '%';
                    },
                }
            },
            series: {
                borderRadius: 2,
                // color: {
                //     linearGradient: [0, 0, 500, 0],
                //     stops: [
                //     [0, 'red'],
                //     [1, '#00b740'],
                //     ]
                // },
                events: {
                    legendItemClick: function () {
                        return false; 
                    }
                }
            },
        },
        series: [{
            name: 'ยอดติดตั้ง App สะสม',
            data: arr_Percent_LastAmount,
        }],
    });

    var gfoot = "<span class='glyphicon icon-info'></span> คำอธิบายกราฟ<br>" +
    "กราฟ บอกว่า แต่ละ cluster มีลูกค้าติดตั้งใหม่ (PIS) กี่เปอร์เซ็นต์ ที่มีการเข้าใช้งาน 3BB Member App. ซึ่งกลุ่มลูกค้าใหม่ เป็นกลุ่มที่ได้ติดต่อกับ พนักงานทั้งส่วนขาย และ ติดตั้ง จึงควรที่จะมีสัดส่วนการเข้าใช้งาน App. ที่มากพอสมควร เป็นโอกาส ที่จะชักชวนลูกค้าได้ง่ายที่สุด" +
    "<br><br>";

    $('#gdesc_a10_t30').html(gfoot);
}

function htmlTableT30(data){
    var total_NewCust_LastDate  = 0;
    var total_NewCust_LastAmount = 0;
    var total_AppUsed_LastDate = 0;
    var total_AppUsed_LastAmount = 0;

    var txt_html = "<div id='display_a10_t30'>" +
    "<table id='table_used_newcust_daily' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
    "<thead>" +
    "<tr style='font-weight: normal'>" +
    // "<th colspan='2' class='sub-title'>คลิก <span class='glyphicon glyphicon-plus'></span> เพื่อแสดงข้อมูลรายจังหวัด</th>   " +
    "<th colspan='2'></th>   " +
    "<th colspan='2' style='text-align:center;'>ยอดลูกค้าใหม่ PIS " + str_T30_append + "</th> " +
    "<th colspan='4' style='text-align:center;'>ยอดติดตั้ง App " + str_T30_append + "</th>    " +
    "</tr>   " +
    "<tr style='font-weight: normal'>    " +
    "<th>RO</th> " +
    "<th style='min-width:125px;'>CLUSTERS " + arrayBTN['T30_CLUSTERS'][order_T30] + "</th>   " +
    "<th width='16%'>PIS วันล่าสุด " + arrayBTN['T30_NewCust_LastDate'][order_T30] + "</th>  " +
    "<th width='16%'>PIS สะสมในเดือน " + arrayBTN['T30_NewCust_LastAmount'][order_T30] + "</th>   " +
    "<th width='13%'>วันล่าสุด " + arrayBTN['T30_AppUsed_LastDate'][order_T30] + "</th> " +
    "<th width='13%'>% วันล่าสุด " + arrayBTN['T30_Percent_LastDate'][order_T30] + "</th> " +
    "<th width='13%'>สะสม " + arrayBTN['T30_AppUsed_LastAmount'][order_T30] + "</th> " +
    "<th width='13%'>% สะสม " + arrayBTN['T30_Percent_LastAmount'][order_T30] + "</th> " +
    "</tr>" +
    "</thead>" +
    "<tbody>";

    $.each(data,function( i,item ) {
        var asterisk = "";

        if(parseFloat(item.Percent_LastAmount) > 80) {
            asterisk += "<span class='glyphicon icon-star-full' style='color:#ffe783;font-size:14px;'></span>"
        } 
        if(parseFloat(item.Percent_LastAmount) > 90) {
            asterisk += "<span class='glyphicon icon-star-full' style='color:#ffe783;font-size:14px;'></span>"
        } 

        var cluster_id = item.RO + item.CLUSTERS;
        cluster_id = cluster_id.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');

        txt_html += "" +
        "<tr id='tr_newcust_" + cluster_id + "' onclick='explanT30Prove(\"" + cluster_id + "\", \"" + item.CLUSTERS + "\")' class='tr-target-newcust-cluster'>" + 
        "<td>" + item.RO + "</td>" + 
        "<td><span id='g_newcust_" + cluster_id + "' class='glyphicon glyphicon-plus'></span> " + item.CLUSTERS + "</td>" + 
        "<td align='right'>" + parseInt(item.NewCust_LastDate).toLocaleString() + "</td>" +
        "<td align='right'>" + parseInt(item.NewCust_LastAmount).toLocaleString() + "</td>" +
        "<td align='right'>" + parseInt(item.AppUsed_LastDate).toLocaleString() + "</td>" +
        "<td align='right'>" + parseFloat(item.Percent_LastDate).toFixed(1) + "%</td>" +
        "<td align='right'>" + parseInt(item.AppUsed_LastAmount).toLocaleString() + "</td>" +
        "<td align='right' style='color: " + T30Color(item.Percent_LastAmount) + ";'>" + asterisk + " " +  parseFloat(item.Percent_LastAmount).toFixed(1) + "%</td>" +
        "</tr>";

        total_NewCust_LastDate += parseFloat(item.NewCust_LastDate);
        total_NewCust_LastAmount += parseFloat(item.NewCust_LastAmount);
        total_AppUsed_LastDate += parseFloat(item.AppUsed_LastDate);
        total_AppUsed_LastAmount += parseFloat(item.AppUsed_LastAmount);
    });

    txt_html += "</tbody>" +
    "<tfoot style='background-color: #2a2a2a;'>" +
    "<tr>    " +
    "<td colspan='2'>Total</td>   " +
    "<td align='right'>" + total_NewCust_LastDate.toLocaleString() + "</td>  " +
    "<td align='right'>" + total_NewCust_LastAmount.toLocaleString() + "</td>   " +
    "<td align='right'>" + total_AppUsed_LastDate.toLocaleString() + "</td>  " +
    "<td align='right'>" + ((total_AppUsed_LastDate/total_NewCust_LastDate)*100).toFixed(1).toLocaleString() + "%</td> " +
    "<td align='right'>" + total_AppUsed_LastAmount.toLocaleString() + "</td>   " +
    "<td align='right'>" + ((total_AppUsed_LastAmount/total_NewCust_LastAmount)*100).toFixed(1).toLocaleString() + "%</td> " +
    "</tr>   " + 
    "</tfoot>" +
    "</table>" +
    "</div>";

    $('#display_a10_t30').replaceWith(txt_html);

    $('#table_used_newcust_daily').fadeIn();

    var pfoot = "รายละเอียดข้อมูลในตาราง<br>" +
    "*ยอดลูกค้าสมัครใหม่ PIS และติดตั้ง App สะสม <span style='color: #F1E33E;'>เริ่มนับตั้งแต่วันที่ " + ddmmyyyyDate(data[0].CAL_DATE, "01") + " ถึง " + ddmmyyyyDate(data[0].CAL_DATE) + "</span> <br>" +
    "1. ตัดรายการที่พบว่ามีการ Login ซ้ำบนเครื่องเดิม ด้วยรหัสลูกค้า (Customer_Ref) มากกว่า 3 รหัสลูกค้าขึ้นไป <br>" + 
    "2. ยกเว้น ทางพื้นที่แจ้ง Account ที่มีการตรวจสอบแล้วว่ามีการใช้งานจริงบนเครื่อง จะนำ Account นั้นมานับรวม <br>" + 
    "3. ยกเว้น Account ที่เป็น Employee Package จะนำมานับรวมให้";

    pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";

    $('#display_a10_t30').append(pfoot);

    $('#sort_' + by_T30).addClass('active-sort')
}

function explanT30Prove(id, cluster) {
    var prov_class = 'newcust-prov-' + id;

    if($('.' + prov_class).length == 0) {
        loadTableT30Prov(prov_class, id, cluster);
    } else {
        if($('.' + prov_class).is(":hidden")){
            $('.' + prov_class).remove();
            loadTableT30Prov(prov_class, id, cluster);
        }
        else {
            $('#g_newcust_' + id).replaceWith("<span id='g_newcust_" + id + "' class='glyphicon glyphicon-plus'></span>");
            $('.' + prov_class).hide();
        }
    }
}

function loadTableT30Prov(prov_class, id, cluster){
    $('#g_newcust_' + id).replaceWith("<span id='g_newcust_" + id + "' class='glyphicon glyphicon-refresh gly-spin'></span>");

    var url = "ajax_chart.aspx?qrs=SP_TBB_APP_NEWCUST" + url_T30_append + "_PROV_A10_MONTH&cluster=" + cluster + "&yyyymm=" + $('#sel_t30_version').val();
    // var url = "ajax_chart.aspx?qrs=SP_TBB_APP_NEWCUST_PROV_A10_DAILY&cluster=" + cluster;
    console.log("loadTableT30Prov = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0){
                data = dataSort(data, by_T30, order_T30);

                var txt_html = "";

                $.each(data,function( i,item ) {
                    txt_html += "<tr class='" + prov_class + " tr-target-newcust-prov'>    " +
                    "<td align='right' colspan='2'>" + item.PROVINCE + "</td>   " +
                    "<td align='right'>" + parseInt(item.NewCust_LastDate).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseInt(item.NewCust_LastAmount).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseInt(item.AppUsed_LastDate).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseFloat(item.Percent_LastDate).toFixed(1) + "%</td>" +
                    "<td align='right'>" + parseInt(item.AppUsed_LastAmount).toLocaleString() + "</td>" +
                    "<td align='right'>" + parseFloat(item.Percent_LastAmount).toFixed(1) + "%</td>" +
                    "</tr>";
                });

                $('#tr_newcust_' + id).after(txt_html);

                $('#g_newcust_' + id).replaceWith("<span id='g_newcust_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");
            }
        },
        error: function(x, t, m) {
            $('#g_newcust_' + id).replaceWith("<span id='g_newcust_" + id + "' class='glyphicon glyphicon-minus gclose'></span>");

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

function dataSortT20(by = '', order = '') {
    by_T20 = by;
    order_T20 = order;
    data_T20 = dataSort(data_T20, by_T20, order_T20);
    htmlTable20(data_T20);
}

function dataSortT30(by = '', order = '') {
    by_T30 = by;
    order_T30 = order;
    data_T30 = dataSort(data_T30, by_T30, order_T30);
    htmlTableT30(data_T30);
}

function dataSort(data, by = '', order = '') {
    if(by == 'AppUsed_PERCENT'){
        data.sort(function(a, b){return a.AppUsed_PERCENT - b.AppUsed_PERCENT});
    }
    else if(by == 'RealAppUsed_PERCENT'){
        data.sort(function(a, b){return a.RealAppUsed_PERCENT - b.RealAppUsed_PERCENT});
    }
    else if(by == 'SHOP_PERCENT'){
        data.sort(function(a, b){return a.SHOP - b.SHOP});
    }
    else if(by == 'INSTALL_PERCENT'){
        data.sort(function(a, b){return a.INSTALL - b.INSTALL});
    }
    else if(by == 'REPAIR_PERCENT'){
        data.sort(function(a, b){return a.REPAIR - b.REPAIR});
    }
    else if(by == 'AppUsed75' || by == 'AppUsedA10'){
        data.sort(function(a, b){return a.AppUsed - b.AppUsed});
    }
    else if(by == 'AppUsed_30days'){
        data.sort(function(a, b){return a.AppUsed_30days - b.AppUsed_30days});
    }
    else if(by == 'AppUsed_60days'){
        data.sort(function(a, b){return a.AppUsed_60days - b.AppUsed_60days});
    }
    else if(by == 'AppUsed_90days'){
        data.sort(function(a, b){return a.AppUsed_90days - b.AppUsed_90days});
    }
    else if(by == 'PERCENT_30days'){
        data.sort(function(a, b){return a.PERCENT_30days - b.PERCENT_30days});
    }
    else if(by == 'PERCENT_60days'){
        data.sort(function(a, b){return a.PERCENT_60days - b.PERCENT_60days});
    }
    else if(by == 'PERCENT_90days'){
        data.sort(function(a, b){return a.PERCENT_90days - b.PERCENT_90days});
    }
    else if(by == 'T30_NewCust_LastDate'){
        data.sort(function(a, b){return a.NewCust_LastDate - b.NewCust_LastDate});
    }
    else if(by == 'T30_NewCust_LastAmount'){
        data.sort(function(a, b){return a.NewCust_LastAmount - b.NewCust_LastAmount});
    }
    else if(by == 'T30_AppUsed_LastDate'){
        data.sort(function(a, b){return a.AppUsed_LastDate - b.AppUsed_LastDate});
    }
    else if(by == 'T30_Percent_LastDate'){
        data.sort(function(a, b){return a.Percent_LastDate - b.Percent_LastDate});
    }
    else if(by == 'T30_AppUsed_LastAmount'){
        data.sort(function(a, b){return a.AppUsed_LastAmount - b.AppUsed_LastAmount});
    }
    else if(by == 'T30_Percent_LastAmount'){
        data.sort(function(a, b){return a.Percent_LastAmount - b.Percent_LastAmount});
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

function loadYYYYMM() {
    var $el = $('#sel_t30_version');
    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("Loading.."));

    $.getJSON('ajax_chart.aspx?qrs=SP_DD_YYYYMM_A10', function(data) {
        $el.empty();

        $.each(data,function( i,item ) {
            var myStr = monthsShort[parseInt(item.MM)-1];
            var myStr = "เดือน " + myStr + ' ' + item.YYYY;

            $el.append($("<option></option>")
                .attr("value", item.YYYYMM).text(myStr));
        });
    });
}

function ddmmyyyyDate(dtd, d = ''){
    var x_dtd = new Date(dtd);

    var dd = x_dtd.getDate();
    var mm = x_dtd.getMonth() + 1;
    var yyyy = x_dtd.getFullYear();

    if(dd<10){
        dd='0'+dd
    } 

    if(mm<10){
        mm='0'+mm
    } 

    if(d != ''){
        dd = d;
    }

    return dd+'/'+mm+'/'+yyyy;
}
</script>

<style type="text/css">
.canvasjs-chart-credit, .highcharts-credits {
    display: none;
}
</style>