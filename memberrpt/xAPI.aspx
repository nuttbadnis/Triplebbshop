<%@ Page Language="VB" AutoEventWireup="false" CodeFile="xAPI.aspx.vb" Inherits="xAPI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT API</title>

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
        .box-container {
            border: 0;
        }
        #pre_api {
            color: #004181;
            font-weight: bold;
            margin-top: 15px;
            font-family: 'kanit', sans-serif;
        }
        #pre_redis {
            color: #ff9903;
            font-size: 18px;
            font-weight: bold;
            min-height: 50px;
            font-family: 'kanit', sans-serif;
        }
        #pre_pg {
            color: #4caf50;
            font-size: 18px;
            font-weight: bold;
            min-height: 50px;
            font-family: 'kanit', sans-serif;
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
                <a class="navbar-brand" href="default.aspx">
                    <span class="glyphicon icon-stats-bars"></span> MEMBERRPT
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="full-bar"><a href="x10.aspx">X10 RECONCILE 3BBPOINT ACC NULL</a></li>
                    <li class="full-bar active"><a href="xAPI.aspx">API</a></li>
                    <!-- <li class="full-bar"><a href="xAPI_test.aspx">API (test)</a></li> -->

                    <li class="mini-bar"><a href="x10.aspx">X10</a></li>
                    <li class="mini-bar active"><a href="xAPI.aspx">API</a></li>
                    <!-- <li class="mini-bar"><a href="xAPI_test.aspx">API (test)</a></li> -->
                </ul>
            </div>
        </div>
    </nav>

	<div class="container container-table">
        <div class="col-xs-12 box-container" style="padding: 20px;">
            <div class="panel panel-default">
                <div class="panel-heading"><b>API GET POINT</b></div>
                <div class="panel-body">
                    <div class="col-xs-12">
                        <div class="form-inline">
                            <div class="input-group">
                                <span class="input-group-addon txt-bold">ACCOUNT</span>
                                <input type="text" class="form-control input-sm" maxlength="10" placeholder="208376288" value="208376288" id="txt_acc" >
                            </div>

                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-sm" id="btn_get">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 
                                    GET
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <pre id="pre_api"></pre> 
                    </div>

                    <div class="col-xs-6">
                        <label>redis api</label>
                        <pre id="pre_redis"></pre> 
                    </div>
                    <div class="col-xs-6">
                        <label>Postgres 
                            <select id="host_ip">
                              <option value="10.11.15.208">10.11.15.208 [prod]</option>
                              <option value="10.11.7.103">10.11.7.103 [rep new]</option>
                              <option value="10.11.7.58">10.11.7.58 [rep readonly]</option>
                              <option value="10.11.7.57">10.11.7.57 [test/dev]</option>
                          </select>
                        </label>
                        <pre id="pre_pg"></pre> 
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
        $('#page_loading').fadeOut();
    }
});

$('#btn_get').click(function() {
    redisProdGetPoint();
});

function redisProdGetPoint(){
    var api = "http://bcsvasapi.triplet.co.th/bcs-vas-red-api/resources/vas/redis/customer/get/point/account.json?account_num="
    var acc = $('#txt_acc').val();
    $('#pre_api').html(api + acc)

    var url = "ajax_chart.aspx?qrs=redisProdGetPoint&acc=" + acc;
    console.log("redisProdGetPoint = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            console.log(data);
            // console.log("data.resultCode = " + data.resultCode);
            // console.log("data.customerPoint.length = " + data.customerPoint.length);
            var json_customerPoint = {};

            if (data.resultCode == 1) {
                if (data.customerPoint.length > 0) {
                    json_customerPoint = data.customerPoint[0];
                }
            }

            if (Object.keys(json_customerPoint).length > 0) {
                console.log(json_customerPoint);
                // var myString = JSON.stringify(json_customerPoint);
                // console.log(myString);
                // $('#span_list').html(myString);

                // el_up.innerHTML = JSON.stringify(json_customerPoint); 

                // document.getElementById("pre_redis").innerHTML = JSON.stringify(json_customerPoint, undefined, 4); 
                // document.getElementById("pre_redis").innerHTML = JSON.stringify(data, undefined, 4); 

            }
            else {
                // document.getElementById("pre_redis").innerHTML = "ไม่พบผลลัพธ์ [" + acc + "]";
            }
                document.getElementById("pre_redis").innerHTML = JSON.stringify(data, undefined, 4); 

                pgGetPoint(acc);

        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function pgGetPoint(acc){
    var host_ip = $('#host_ip').val();
    var url = "https://posbcs.triplet.co.th/panuTestPHP/point_pg_for_xapi.php?host=" + host_ip + "&account_num=" + acc;
    console.log("pgGetPoint = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            console.log(data);

            document.getElementById("pre_pg").innerHTML = JSON.stringify(data, undefined, 4); 

        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

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