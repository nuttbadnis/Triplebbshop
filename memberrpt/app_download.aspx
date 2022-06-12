<%@ Page Language="VB" AutoEventWireup="false" CodeFile="app_download.aspx.vb" Inherits="app_download" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT DOWNLOAD</title>

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

    <link type="text/css" rel="stylesheet" href="App_Inc/_css/main.css?vs=17" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/stockShop.css?vs=17" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/mapReport.css?vs=17" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartShop.css?vs=17" />
    <link type="text/css" rel="stylesheet" href="https://memberrpt.triplet.co.th/App_Inc/_css/chartApp.css?vs=17" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script src="App_Inc/_js/panu.js?vs=17"></script>

    <style type="text/css">
     .w-fil {
        width: 143px !important;
    }
    </style>
</head>
<body>
    <input runat="server" id="hide_uemail" type="hidden">
    <input runat="server" id="hide_upermiss" type="hidden">
    <input runat="server" id="hide_sess_ro" type="hidden">
    <input runat="server" id="hide_sess_cluster" type="hidden">
    <form id="form1" runat="server">

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="app_g10.aspx">
                    <span class="glyphicon icon-stats-bars"></span> MEMBERRPT
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="full-bar"><a href="app_g10.aspx">G10 จำนวนลูกค้า App ใหม่</a></li>
                    <li class="full-bar"><a href="app_chart2.aspx">G20 สัดส่วนลูกค้า App ใช้ที่งานแล้ว</a></li>
                    <li class="full-bar"><a href="app_chart3.aspx">G30 อัตราการชักชวนสำเร็จแต่ละช่องทาง</a></li>
                    <li class="full-bar"><a href="app_chart4.aspx">G40 สัดส่วนลูกค้าใช้ App แต่ละช่องทาง</a></li>
                    <li class="full-bar"><a href="app_g50.aspx">G50 แนวโน้ม</a></li>

                    <li class="mini-bar"><a href="app_g10.aspx" title="G10 จำนวนลูกค้า App ใหม่">G10</a></li>
                    <li class="mini-bar"><a href="app_chart2.aspx" title="G20 สัดส่วนลูกค้า App ใช้ที่งานแล้ว">G20</a></li>
                    <li class="mini-bar"><a href="app_chart3.aspx" title="G30 อัตราการชักชวนสำเร็จแต่ละช่องทาง">G30</a></li>
                    <li class="mini-bar"><a href="app_chart4.aspx" title="G40 สัดส่วนลูกค้าใช้ App แต่ละช่องทาง">G40</a></li>
                    <li class="mini-bar"><a href="app_g50.aspx">G50</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a class="link-in" href="app_download.aspx"><span class="glyphicon glyphicon-save-file"></span> Download</a></li>
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
            <div class="col-xs-12 box-container" style="padding: 20px;">
                <div class="panel panel-default">
                    <div class="panel-heading"><b>L10 ข้อมูล Account ที่ยังไม่มีการเข้าใช้งาน 3BB Member App</b></div>
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">Cluster</span>
                                <select id="sel_cluster_L10" class="form-control input-sm">
                                    <option value="">Loading.</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-sm" id="btn_download_L10">
                                    <!-- <span class="glyphicon glyphicon-search" aria-hidden="true"></span>  -->
                                    Download Excel
                                </button>
                                <input runat="server" id="hide_cluster" type="hidden">
                                <input id="btn_download_hidden" OnServerClick="Load_Excel" runat="server" type="submit" style="display:none;">
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading"><b>L20 ข้อมูล Account ที่ติดต่อแต่ละช่องทาง (ตั้งแต่ 1 ตุลาคม 2019 เป็นต้นไป)</b></div>
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">ช่วงวันที่</span>
                                <input type="text" class="form-control input-sm w-fil datepicker" maxlength="10" id="txt_start_date_L20" readonly>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">ถึงวันที่</span>
                                <input type="text" class="form-control input-sm w-fil datepicker" maxlength="10" id="txt_end_date_L20" readonly>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">Cluster</span>
                                <select id="sel_cluster_L20" class="form-control input-sm">
                                    <option value="">Loading.</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-sm" id="btn_download_L20">
                                    Download Excel
                                </button>
                            </div>

                             <br>
                             <br>
                             *ช่วงวันที่ตาม วันที่ติดต่อ SHOP, INSTALL, REPAIR
                        </div>
                    </div>
                </div>
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading"><b>L25 ข้อมูลลูกค้าสมัครใหม่ ที่ติดต่อแต่ละช่องทาง (ตั้งแต่ 1 ตุลาคม 2019 เป็นต้นไป)</b></div>
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">ช่วงวันที่</span>
                                <input type="text" class="form-control input-sm w-fil datepicker" maxlength="10" id="txt_start_date_L25" readonly>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">ถึงวันที่</span>
                                <input type="text" class="form-control input-sm w-fil datepicker" maxlength="10" id="txt_end_date_L25" readonly>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">Cluster</span>
                                <select id="sel_cluster_L25" class="form-control input-sm">
                                    <option value="">Loading.</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-sm" id="btn_download_L25">
                                    Download Excel
                                </button>
                            </div>

                             <br>
                             <br>
                             **อธิบายเพิ่มเติม <br>
                             - ช่วงวันที่ตาม PIS DATE <br> 
                             - ถ้าหากช่วงวันที่เลือก ไม่ได้ติดต่อ SHOP, INSTALL, REPAIR ข้อมูลทีมที่ติดต่อจะเป็นค่าว่าง <br> 
                             - คอลัมน์ วันที่เริ่มใช้งาน APP (ตัดรายการที่มีการใช้เครื่องซ้ำ) คือ ตัดรายการที่พบว่ามีการ Login ซ้ำบนเครื่องเดิม ด้วยรหัสลูกค้า (Customer_Ref) มากกว่า 3 รหัสลูกค้าขึ้นไป <br>
                             ตรวจสอบรายละเอียดได้ที่ L30
                        </div>
                    </div>
                </div>
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading"><b>L30 ข้อมูลเครื่องมือถือ ที่มีการลง 3BB Member App. มากกว่า 3 Customer_Ref ขึ้นไป</b></div>
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">Cluster</span>
                                <select id="sel_cluster_L30" class="form-control input-sm">
                                    <option value="">Loading.</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-sm" id="btn_download_L30">
                                    Download Excel
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading"><b>L40 ข้อมูลสรุปสถานะผู้ใช้ Member Application แยกตามจังหวัด ณ สิ้นวัน (ตั้งแต่ 1 ตุลาคม 2019 เป็นต้นไป)</b></div>
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">ช่วงวันที่</span>
                                <input type="text" class="form-control input-sm w-fil datepicker" maxlength="10" id="txt_start_date_L40" readonly>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">ถึงวันที่</span>
                                <input type="text" class="form-control input-sm w-fil datepicker" maxlength="10" id="txt_end_date_L40" readonly>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">Cluster</span>
                                <select id="sel_cluster_L40" class="form-control input-sm">
                                    <option value="">Loading.</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-sm" id="btn_download_L40">
                                    Download Excel
                                </button>
                            </div>

                             <br>
                             <br>
                             **เงื่อนไข <br>
                             1. ตัดรายการที่พบว่ามีการ Login ซ้ำบนเครื่องเดิม ด้วยรหัสลูกค้า (Customer_Ref) มากกว่า 3 รหัสลูกค้าขึ้นไป <br>
                             2. ยกเว้น ทางพื้นที่แจ้ง Account ที่มีการตรวจสอบแล้วว่ามีการใช้งานจริงบนเครื่อง จะนำ Account นั้นมานับรวม <br>
                             3. ยกเว้น Account ที่เป็น Employee Package จะนำมานับรวมให้
                        </div>
                    </div>
                </div>
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading"><b>L50 ข้อมูลรายการที่แนะนำ โดยพนักงานที่มีการแนะนำลูกค้าตั้งแต่ 20 รายขึ้นไป แล้วลูกค้ากลับเข้ามาใช้ App. ไม่ถึง 5%</b></div>
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-sm" id="btn_download_L50">
                                    Download Excel
                                </button>
                            </div>

                             <br>
                             <br>
                             **เงื่อนไข ลูกค้าที่แนะนำติดตั้ง App ได้สำเร็จในเดือนกุมภาพันธ์ แต่มีการกลับเข้ามาใช้ App. ซ้ำน้อยกว่า 5%<br>
                        </div>
                    </div>
                </div>
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading"><b>L60 ข้อมูล Account ที่เคยเข้าใช้งาน 3BB Member App เพียงครั้งเดียว</b></div>
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">Cluster</span>
                                <select id="sel_cluster_L60" class="form-control input-sm">
                                    <option value="">Loading.</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-sm" id="btn_download_L60">
                                    Download Excel
                                </button>
                            </div>

                             <br>
                             <br>
                             **ลูกค้าที่มีการใช้งานมากกว่า 1 ครั้ง หมายถึง Account ที่ Login ครั้งแรก และครั้งล่าสุด เป็นคนละวันกัน<br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
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
                <a class='btn btn-default' onclick="$('html,body').animate({scrollTop:0},'slow');return false;" title="กลับขึ้นด้านบน">
                    <i class="glyphicon glyphicon-chevron-up"></i>
                </a>
            </span>
        </div>
    </div>
</footer>

<div id="page_loading" class="modal-backdrop">
    <div class="in-loading not-nm">
        <span class="glyphicon icon-clock gly-spin"></span><span id="txt_loading"> กรุณารอสักครู่...</span>
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
$.datepicker.regional['th'] ={
    // minDate: new Date(2019, (7-1), 24),
    minDate: new Date(2019, (10-1), 1),
    maxDate: -1,
    dateFormat: 'dd/mm/yy',  
    dayNamesMin: ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'],   
    monthNames: ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม']
};

$.datepicker.setDefaults($.datepicker.regional['th']);

$( function() {
    getDateDefault();
});

$(document).ready(function() { 
    checkLogin();

     $(window).scroll(function(){  
         if($(document).scrollTop()>100){
             $("#gotoTop").show();
         }else{  
             $("#gotoTop").hide(); 
         }  
     });  

    if(navigator.userAgent.indexOf('MSIE')>0){  
        $('#txt_loading').html(" คุณกำลังใช้โปรแกรมที่ไม่สนับสนุน กรุณาใช้ Chrome หรือ Firefox");
        $('#page_loading').fadeIn();
    }  
    else {
        $('#page_loading').fadeIn();
    }

    getDateDefault();
    loadClusterACC();
    $('#page_loading').fadeOut();

    // modalAlert("เป็นข้อมูลล่าสุดถึงวันที่ 30 ก.ย. <br>ส่วนฐานข้อมูลเดือนปัจจุบัน อยู่ระหว่างดำเนินการ");
});

function getDateDefault() {
    var url = "ajax_chart.aspx?qrs=getDateDefault"

    console.log(url);

    $.ajax({
        url: url,
        dataType: "json",
        timeout: 60000,
        cache:false,
        success: function( data ) { 
            if(data.length > 0){
                $.datepicker.regional['th'] ={
                    maxDate: new Date(data[0].str_max_date)
                };

                $.datepicker.setDefaults($.datepicker.regional['th']);

                // $('#txt_start_date_L20').val(data[0].min_date);
                $('#txt_start_date_L20').val(data[0].max_date);
                $('#txt_end_date_L20').val(data[0].max_date);
                $("#txt_end_date_L20").datepicker( "option", "minDate", $('#txt_start_date_L20').val());
                $("#txt_start_date_L20").datepicker( "option", "maxDate", $('#txt_end_date_L20').val());

                $('#txt_start_date_L25').val(data[0].max_date);
                $('#txt_end_date_L25').val(data[0].max_date);
                $("#txt_end_date_L25").datepicker( "option", "minDate", $('#txt_start_date_L25').val());
                $("#txt_start_date_L25").datepicker( "option", "maxDate", $('#txt_end_date_L25').val());

                $('#txt_start_date_L40').val(data[0].max_date);
                $('#txt_end_date_L40').val(data[0].max_date);
                $("#txt_end_date_L40").datepicker( "option", "minDate", $('#txt_start_date_L40').val());
                $("#txt_start_date_L40").datepicker( "option", "maxDate", $('#txt_end_date_L40').val());
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    }).done(function() {
    });
}

$("#sel_cluster_L10, #sel_cluster_L20, #sel_cluster_L25, #sel_cluster_L30, #sel_cluster_L40, #sel_cluster_L60").change(function() {
    $('#sel_cluster_L20').val(this.value);
    $('#sel_cluster_L25').val(this.value);
    $('#sel_cluster_L30').val(this.value);
    $('#sel_cluster_L40').val(this.value);
    $('#sel_cluster_L60').val(this.value);
});

function loadClusterACC() {
    var $el1 = $('#sel_cluster_L10');
    var $el20 = $('#sel_cluster_L20');
    var $el25 = $('#sel_cluster_L25');
    var $el3 = $('#sel_cluster_L30');
    var $el4 = $('#sel_cluster_L40');
    var $el6 = $('#sel_cluster_L60');

    $el1.empty();
    $el20.empty();
    $el25.empty();
    $el3.empty();
    $el4.empty();
    $el6.empty();

    $el1.append($("<option></option>")
        .attr("value", "").text("Loading"));
    $el20.append($("<option></option>")
        .attr("value", "").text("Loading"));
    $el25.append($("<option></option>")
        .attr("value", "").text("Loading"));
    $el3.append($("<option></option>")
        .attr("value", "").text("Loading"));
    $el4.append($("<option></option>")
        .attr("value", "").text("Loading"));
    $el6.append($("<option></option>")
        .attr("value", "").text("Loading"));

    $.getJSON('ajax_chart.aspx?qrs=loadClusterACC', function(data) {
        $el1.empty();
        $el20.empty();
        $el25.empty();
        $el3.empty();
        $el4.empty();
        $el6.empty();

        $.each(data,function( i,item ) {
            $el1.append($("<option></option>")
                .attr("value", item.CLUSTERS).text(item.CLUSTERS));

            $el20.append($("<option></option>")
                .attr("value", item.CLUSTERS).text(item.CLUSTERS));

            $el25.append($("<option></option>")
                .attr("value", item.CLUSTERS).text(item.CLUSTERS));

            $el3.append($("<option></option>")
                .attr("value", item.CLUSTERS).text(item.CLUSTERS));

            $el4.append($("<option></option>")
                .attr("value", item.CLUSTERS).text(item.CLUSTERS));

            $el6.append($("<option></option>")
                .attr("value", item.CLUSTERS).text(item.CLUSTERS));
        });
    });
}

$('#btn_download_L10').click(function() {
    if($('#sel_cluster_L10').val() != ""){
        $('#hide_cluster').val($('#sel_cluster_L10').val());
        $('#btn_download_hidden').click();
    }
    else{
        ajaxError();
    }
});

$('#btn_download_L20').click(function() {
    if($('#sel_cluster_L20').val() != "" && $('#txt_start_date_L20').val() != "" && $('#txt_end_date_L20').val() != ""){
        var url = "app_xport_acc_type_team.aspx";
        url += "?cluster=" + $('#sel_cluster_L20').val();
        url += "&start_date=" + $('#txt_start_date_L20').val();
        url += "&end_date=" + $('#txt_end_date_L20').val();

        window.open(url);
    }
    else{
        ajaxError();
    }
});

$('#btn_download_L25').click(function() {
    if($('#sel_cluster_L25').val() != "" && $('#txt_start_date_L25').val() != "" && $('#txt_end_date_L25').val() != ""){
        var url = "app_xport_newcust_type_team.aspx";
        url += "?cluster=" + $('#sel_cluster_L25').val();
        url += "&start_date=" + $('#txt_start_date_L25').val();
        url += "&end_date=" + $('#txt_end_date_L25').val();

        window.open(url);
    }
    else{
        ajaxError();
    }
});

$('#btn_download_L30').click(function() {
    if($('#sel_cluster_L30').val() != ""){
        var url = "app_xport_duplicate_uuid.aspx";
        url += "?cluster=" + $('#sel_cluster_L30').val();

        window.open(url);
    }
    else{
        ajaxError();
    }
});

$('#btn_download_L40').click(function() {
    if($('#sel_cluster_L40').val() != "" && $('#txt_start_date_L40').val() != "" && $('#txt_end_date_L40').val() != ""){
        var url = "app_xport_target_province.aspx";
        url += "?cluster=" + $('#sel_cluster_L40').val();
        url += "&start_date=" + $('#txt_start_date_L40').val();
        url += "&end_date=" + $('#txt_end_date_L40').val();

        window.open(url);
    }
    else{
        ajaxError();
    }
});

$('#btn_download_L50').click(function() {
    var url = "app_xport_sgg_suspend.aspx";

    window.open(url);
});

$('#btn_download_L60').click(function() {
    if($('#sel_cluster_L60').val() != ""){
        var url = "app_xport_acc_used_once.aspx";
        url += "?cluster=" + $('#sel_cluster_L60').val();

        window.open(url);
    }
    else{
        ajaxError();
    }
});

function ajaxError(){
    modalAlert("ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
    $('#modal_alert').on('hidden.bs.modal', function (e) {
        location.reload();
    })
}

function modalAlert(e){
    $('#txt_alert').html(e)
    $('#modal_alert').modal("show");
}

$( document ).ajaxStart(function() {
    $('#page_loading').fadeIn();
});

$( document ).ajaxStop(function() {
    $('#page_loading').fadeOut();
});

$('#txt_start_date_L20').datepicker({
    onClose: function(selectedDate, inst) {
        console.log('minDate = ' + selectedDate);
        $("#txt_end_date_L20").datepicker( "option", "minDate", selectedDate);
    }
});
$('#txt_end_date_L20').datepicker({
    onClose: function(selectedDate, inst) {
        console.log('maxDate = ' + selectedDate);
        $("#txt_start_date_L20").datepicker( "option", "maxDate", selectedDate);
    }
});

$('#txt_start_date_L25').datepicker({
    onClose: function(selectedDate, inst) {
        console.log('minDate = ' + selectedDate);
        $("#txt_end_date_L25").datepicker( "option", "minDate", selectedDate);
    }
});
$('#txt_end_date_L25').datepicker({
    onClose: function(selectedDate, inst) {
        console.log('maxDate = ' + selectedDate);
        $("#txt_start_date_L25").datepicker( "option", "maxDate", selectedDate);
    }
});

$('#txt_start_date_L40').datepicker({
    onClose: function(selectedDate, inst) {
        console.log('minDate = ' + selectedDate);
        $("#txt_end_date_L40").datepicker( "option", "minDate", selectedDate);
    }
});
$('#txt_end_date_L40').datepicker({
    onClose: function(selectedDate, inst) {
        console.log('maxDate = ' + selectedDate);
        $("#txt_start_date_L40").datepicker( "option", "maxDate", selectedDate);
    }
});
</script>