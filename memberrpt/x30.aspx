<%@ Page Language="VB" AutoEventWireup="false" CodeFile="x30.aspx.vb" Inherits="x30" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT X30</title>

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
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartShop.css?vs=18" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartApp.css?vs=17" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script src="App_Inc/_js/panu.js?vs=17"></script>

    <style type="text/css">
        body {
            background-color: #fff;
        }
        body .container-table {
            min-width: 98%;
            min-height: 450px;
            background-color: #fff;
            border-radius: 3px;
            font-size: 12px;
            position: relative;
        }

        .b-title {
            line-height: 50px;
            font-size: 20px;
        }

        #table_rec th {
            color: #fff;
            text-align: center;
        }

        #table_rec th.rec {
            color: #0B5394;
        }

        #table_rec th.bcs {
            background-color: #0B5394;
        }

        #table_rec th.point {
            background-color: #e69138;
        }

        #table_rec th.coin {
            background-color: #1e7e34;
        }
        .coin-head{
            font-size: 20px;
            font-weight: lighter;
            padding: 2px !important;
            color: #1e7e34 !important;
        }

        .txt-grey {
            color: grey;
        }

        #btn_export {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        /*.title-target {
            text-align: center;
            padding: 10px;
        }*/
    </style>
</head>
<body>
    <input runat="server" id="hide_uemail" type="hidden">
    <input runat="server" id="hide_upermiss" type="hidden">
    <input runat="server" id="hide_sess_ro" type="hidden">
    <input runat="server" id="hide_sess_cluster" type="hidden">
    <form id="form1" runat="server">

    <nav class="navbar navbar-inverse" style="margin-bottom: 2px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="default.aspx">
                    <span class="glyphicon icon-stats-bars"></span> MEMBERRPT
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <%-- <h5 class="head-nav bg-navy text-center">POINT SYSTEM</h5> --%>
                    <li class="full-bar"><a href="x10.aspx">X10 RECONCILE 3BBPOINT ACC NULL</a></li>
                    <li class="full-bar"><a href="x20.aspx">X20 RECONCILE 3BBPOINT vs VAS</a></li>
                    <li class="full-bar active"><a href="x30.aspx">X30 RECONCILE COIN vs VAS</a></li>

                    <li class="mini-bar"><a href="x10.aspx">X10</a></li>
                    <li class="mini-bar"><a href="x20.aspx">X20</a></li>
                    <li class="mini-bar active"><a href="x30.aspx">X30</a></li>
                </ul>
                <%-- <ul class="nav navbar-nav">
                    <h5 class="head-nav bg-orange text-center">COIN SYSTEM</h5>
                --%>
            </div>
        </div>
    </nav>
	<div class="container container-table">
        <p class="txt-red">
            <b class="b-title">RECONCILE COIN VS VAS</b> 

            <br>เริ่มตรวจสอบตั้งแต่ข้อมูล: <span id="first_check">...</span>
            <br>รอบล่าสุด: <span id="last_check">...</span>

            <!-- <br>รายละเอียดเงื่อนไข 
            <br>- ข้อมูลลูกค้า ตั้งต้นจาก ALL_LOGIN ที่สถานะ 'PE', 'OK', 'SU', 'TW' แต่ไม่มีใน DB 3BBPOINT (x_customer)
            <br>- CUST_TYPE ต้องขึ้นต้นด้วย Res
            <br>- PACKAGE_NAME  ต้องมีคำว่า 3BB
            <br>
            <br>*ข้อมูล PACKAGE_NAME จาก table DCBI.TRANSIT_CLR003 
            <br>*แต่ถ้าใน TRANSIT_CLR003 ยังไม่มี (สถานะ PE) จะไปหา PACKAGE_NAME จาก table POSBATCH.PAY_ORDER_3BBPOINT
            <br>*ตัด CUST_REF ที่เป็นหน่วยงาน 3BB ออก (BLACKLIST_CUST_REF_3BBPOINT) -->
        </p>

        <!-- <button type="button" class="btn btn-primary btn-sm" id="btn_export">Download Excel</button> -->

        <div id="onthetable"></div>
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

<div id="modal_stop_alert" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">ปิดแจ้งเตือน</h4>
            </div>
            <div class="modal-body">
                <p>เนื่องจากอยู่ระหว่างรอการตรวจสอบรายการนี้</p>
                <input type="hidden" id="hide_error_id">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" data-dismiss="modal">ไม่</button>
                <button type="button" class="btn btn-danger" id="btn_stop_alert" data-dismiss="modal">ยืนยัน ปิดแจ้งเตือน</button>
            </div>
        </div>
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

    getMaxDateReconcile();
    loadTableReconcile();
});

function getMaxDateReconcile() {
    var url = "ajax_chart.aspx?qrs=sp_report_reconcile_time_coin"

    console.log(url);

    $.ajax({
        url: url,
        dataType: "json",
        timeout: 60000,
        cache:false,
        success: function( data ) { 
            if(data.length > 0){
                $('#first_check').html(data[0].first_check);
                $('#last_check').html(data[0].last_check);
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    }).done(function() {
    });
}

function loadTableReconcile(){
    var url = "ajax_chart.aspx?qrs=sp_report_reconcile_error_coin";
    console.log("loadTableReconcile = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 

            var txt_html = "<div id='onthetable'>" +
                "<table id='table_rec' class='table table-bordered table-striped' cellspacing='0' width='100%' style='display:none;'>" +
                "<thead>" +
                "<tr>" +
                "<th class='coin-head' colspan='15'>COIN SYSTEM</th>   " +
                "</tr>   " +
                "<tr>" +
                "<th class='rec text-uppercase' colspan='5'>reconcile</th>   " +
                "<th class='bcs text-uppercase' colspan='5'>vas</th>   " +
                "<th class='coin text-uppercase' colspan='5'>coin system</th>   " +
                "</tr>   " +
                "<tr>    " +
                "<th class='rec'>error type</th> " +
                "<th class='rec'>reconcile date</th> " +
                "<th class='rec'>update type</th> " +
                "<th class='rec'>update date</th> " +
                "<th class='rec'>update by</th> " +
                "<th class='bcs'>ref_id</th> " +
                "<th class='bcs'>date_record</th> " +
                "<th class='bcs'>account_num</th> " +
                "<th class='bcs'>item_code</th> " +
                "<th class='bcs'>item_point</th> " +
                "<th class='coin'>ref_id</th> " +
                "<th class='coin'>date_record</th> " +
                "<th class='coin'>account_num</th> " +
                "<th class='coin'>item_code</th> " +
                "<th class='coin'>item_point</th> " +
                "</tr>" +
                "</thead>" +
                "<tbody>";

            if(data.length > 0) {
                $.each(data,function( i,item ) {
                    var txt_null = "<span class='txt-grey'>NULL</span>";
                    var txt_update = itemNull(item.update_date);

                    if(checkIsEmpty(item.update_date) ) {
                        txt_update = '<button class="btn btn-sm btn-danger" type="button" onclick="stopAlert(' + item.error_id + ')">ปิดแจ้งเตือน</button>';
                    }

                    txt_html += "" +
                    "<tr>" + 
                    "<td>" + itemNull(item.error_type) + "</td>" + 
                    "<td>" + itemNull(item.dtm_stamp) + "</td>" + 
                    "<td>" + itemNull(item.update_type) + "</td>" + 
                    "<td>" + txt_update + "</td>" + 
                    "<td>" + itemNull(item.update_by) + "</td>" + 
                    "<td>" + itemNullByText(item.vas_ref_id, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.log_vas_date_record, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.log_vas_account_num, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.log_vas_item_code, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.log_vas_item_point, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.point_ref_id, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.log_point_date_record, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.log_point_account_num, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.log_point_item_code, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.log_point_item_point, txt_null) + "</td>" + 
                    "</tr>";
                });

            }else{
                txt_html += "" +
                "<tr>" +
                "<td align='center' colspan='15'>ไม่มีข้อมูล</td>" + 
                "</tr>";
            }
            
            txt_html += "</table>" +
            "</div>";

            $('#onthetable').replaceWith(txt_html);
            $('#table_rec').fadeIn();
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function stopAlert(error_id){
    $('#hide_error_id').val(error_id);
    $('#modal_stop_alert').modal("show");
}

$('#btn_stop_alert').click(function() {
    var url = "ajax_chart.aspx?qrs=sp_update_reconcile_error_coin";

  $.ajax({
    url: url,
    type: "post",
    timeout: 60000,
    cache: false,
    data: { 
      error_id: $('#hide_error_id').val(),
      update_type: "stop_alert",
      update_by: "x20_stop",
      // update_by: $('#hide_uemail').val(),
    },
    success: function( res ) {
      if(res > 0){
        loadTableReconcile();
      }
      else{
        modalAlert('ยืนยัน ไม่สำเร็จ');
      }
    },
    error: function(x, t, m) {
      modalAlert('ajax fail!');
    }
  });
});

$('#btn_export').click(function() {
    var url = "app_xport_x20.aspx";
    window.open(url);
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

</script>