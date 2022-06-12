<%@ Page Language="VB" AutoEventWireup="false" CodeFile="x10.aspx.vb" Inherits="x10" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT X10</title>

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
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartApp.css?vs=17" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script src="App_Inc/_js/panu.js?vs=17"></script>

    <style type="text/css">
        body {
            background-color: #eee;
        }
        body .container-table {
            min-height: 450px;
            background-color: #fff;
            border-radius: 3px;
            font-size: 12px;
            position: relative;
        }

        .b-title {
            line-height: 50px;
            font-size: 14px;
        }

        #table_rec th {
            color: #fff;
            text-align: center;
        }

        #table_rec th.bcs {
            background-color: #0B5394;
        }

        #table_rec th.point {
            background-color: #e69138;
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

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="default.aspx">
                    <span class="glyphicon icon-stats-bars"></span> MEMBERRPT
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="full-bar active"><a href="x10.aspx">X10 RECONCILE 3BBPOINT ACC NULL</a></li>

                    <li class="mini-bar active"><a href="x10.aspx">X10</a></li>
                </ul>
            </div>
        </div>
    </nav>

	<div class="container container-table">
        <p class="txt-red">
            <b class="b-title">RECONCILE 3BBPOINT ACC NULL</b> (ข้อมูลล่าสุด ณ วันที่ <span id="reconcile_date">__/__/____</span>)

            <br>รายละเอียดเงื่อนไข 
            <br>- ข้อมูลลูกค้า ตั้งต้นจาก ALL_LOGIN ที่สถานะ 'PE', 'OK', 'SU', 'TW' แต่ไม่มีใน DB 3BBPOINT (x_customer)
            <br>- CUST_TYPE ต้องขึ้นต้นด้วย Res
            <br>- PACKAGE_NAME  ต้องมีคำว่า 3BB
            <br>
            <br>*ข้อมูล PACKAGE_NAME จาก table DCBI.TRANSIT_CLR003 
            <br>*แต่ถ้าใน TRANSIT_CLR003 ยังไม่มี (สถานะ PE) จะไปหา PACKAGE_NAME จาก table POSBATCH.PAY_ORDER_3BBPOINT
            <br>*ตัด CUST_REF ที่เป็นหน่วยงาน 3BB ออก (BLACKLIST_CUST_REF_3BBPOINT)
        </p>

        <button type="button" class="btn btn-primary btn-sm" id="btn_export">Download Excel</button>

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
    var url = "ajax_chart.aspx?qrs=getMaxDateReconcile"

    console.log(url);

    $.ajax({
        url: url,
        dataType: "json",
        timeout: 60000,
        cache:false,
        success: function( data ) { 
            if(data.length > 0){
                $('#reconcile_date').html(data[0].max_date);
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    }).done(function() {
    });
}

function loadTableReconcile(){
    var url = "ajax_chart.aspx?qrs=SP_RECONCILE_3BBPOINT_ACC_NULL";
    console.log("loadTableReconcile = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0) {
                var txt_html = "<div id='onthetable'>" +
                "<table id='table_rec' class='table table-bordered table-striped' cellspacing='0' width='100%' style='display:none;'>" +
                "<thead>" +
                "<tr>" +
                "<th rowspan='2'></th>   " +
                "<th class='bcs' colspan='10'>ALL_LOGIN</th>   " +
                "<th class='point' colspan='3'>x_customer</th>   " +
                "</tr>   " +
                "<tr>    " +
                "<th class='bcs'>LAST_LOGIN</th> " +
                "<th class='bcs'>FIRST_LOGIN</th> " +
                "<th class='bcs'>CUSTOMER_REF</th> " +
                "<th class='bcs'>CUST_TYPE</th> " +
                "<th class='bcs'>ACCOUNT_NUM</th> " +
                "<th class='bcs'>ACCOUNT_NAME</th> " +
                "<th class='bcs'>PACKAGE_NAME</th> " +
                "<th class='bcs'>STATUS</th> " +
                "<th class='bcs'>PIS_DATE</th> " +
                "<th class='bcs'>PAID_DATE</th> " +
                "<th class='point'>x_name</th> " +
                "<th class='point'>x_cust_ref</th> " +
                "<th class='point'>x_package_name</th> " +
                "</tr>" +
                "</thead>" +
                "<tbody>";

                $.each(data,function( i,item ) {
                    var txt_null = "<span class='txt-grey'>NULL</span>";

                    txt_html += "" +
                    "<tr>" + 
                    "<td>" + (i+1) + "</td>" + 
                    "<td>" + itemNullByText(item.LAST_LOGIN, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.FIRST_LOGIN, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.CUSTOMER_REF, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.CUST_TYPE, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.ACCOUNT_NUM, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.ACCOUNT_NAME, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.PACKAGE_NAME, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.PRODUCT_STATUS, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.PIS_DATE, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.PAID_DATE, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.x_name, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.x_cust_ref, txt_null) + "</td>" + 
                    "<td>" + itemNullByText(item.x_package_name, txt_null) + "</td>" + 
                    "</tr>";
                });

                txt_html += "</table>" +
                "</div>";

                $('#onthetable').replaceWith(txt_html);

                $('#table_rec').fadeIn();
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

$('#btn_export').click(function() {
    var url = "app_xport_x10.aspx";
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