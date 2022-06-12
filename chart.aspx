<%@ Page Language="VB" AutoEventWireup="false" CodeFile="chart.aspx.vb" Inherits="chart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>สถิติ เปิดปิดสำนักงาน [3BB Shop Back Office]</title>

	<link rel="shortcut icon" href="App_Inc/3bfav.ico" type="image/x-icon">
	<link rel="icon" href="App_Inc/3bfav.ico" type="image/x-icon">

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-147236441-1"></script>
    <script type="text/javascript" src="App_Inc/gtag_3bbback.js?id=UA-147236441-1&vs=12"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
    <script src="App_Inc/jquery-1.11.3.min.js"></script>

    <link rel="stylesheet" type="text/css" href="App_Inc/jquery-ui-1.11.4/jquery-ui.css"/>
    <script type="text/javascript" src="App_Inc/jquery-ui-1.11.4/jquery-ui.js"></script>

    <link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
    <script src="App_Inc/bootstrap/js/bootstrap.js"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />

    <link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=1222" />
    <link type="text/css" rel="stylesheet" href="App_Inc/stockShop.css?vs=12" />
    <link type="text/css" rel="stylesheet" href="App_Inc/mapReport.css?vs=12" />
    <link type="text/css" rel="stylesheet" href="App_Inc/chartShop.css?vs=12" />
    <link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

    <script type="text/javascript" src="App_Inc/canvasjs.min.js"></script>

    <script src="App_Inc/panu.js?vs=12"></script>

    <style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Kanit|Mitr|Ubuntu|Pacifico');

    .container {
        padding: 15px;
        border-radius: 3px;
        background-color: #fff;
        font-family: 'Kanit', sans-serif;
        border: 1px solid #e8e8e8;
    }

    body {
    	overflow-y: scroll;
    	background-color: #f1f1f1;
    }

    body .container-a {
		min-height: 510px;
    }

    .load_center {
        text-align: center;
        margin: auto;
        width: 50%;
        margin-top: 150px;
        font-size: 28px;
        color: #dfdfdf;
    }

    .canvasjs-chart-canvas {
        font-family: 'Kanit', sans-serif !important;
    }
    
    .head-desc {
        text-align: center;
        font-size: 12px;
        color: gray;
    }

    .modal-xl {
    	width: 1280px;
    }
    </style>
</head>
<body>
    <input runat="server" id="hide_uemail" type="hidden">
    <input runat="server" id="hide_upermiss" type="hidden">
    <form id="form1" runat="server"></form>

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="default.aspx">3BB SHOP <span class="bn2line">BACK<br>OFFICE</span></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="default.aspx">ข้อมูลสำนักงาน</a></li>
                    <li class="dropdown active">
    					<a class="dropdown-toggle" data-toggle="dropdown" href="#">รายงาน/สถิติ <b class="caret"></b></a>
    					<ul class="dropdown-menu">
    						<li><a href="report_premium_receive_shop.aspx">รายชื่อ Shop รับของพรีเมี่ยม</a></li>
    						<li><a href="report_store_closetemp.aspx">รายงานสำนักงานปิดชั่วคราว</a></li>
    						<li><a href="report.aspx">รายงานเปิดปิด ณ วันปัจจุบัน</a></li>
    						<li><a href="history.aspx">ประวัติ เปิดปิดสำนักงาน</a></li>
    						<li class="active"><a href="chart.aspx">สถิติ เปิดปิดสำนักงาน</a></li>
    						<li><a href="holidays.aspx">รายการวันหยุดนักขัตฤกษ์</a></li>
    						<li class="divider"></li>
    						<li><a href="tbbapp/">สถิติ 3BB Member Application</a></li>
    					</ul>
    				</li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">รายชื่อตามสิทธิ์ <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="ro_province.aspx">รายชื่อผู้อำนวยการ/ผู้จัดการ</a></li>
                            <li><a href="user_list.aspx">รายชื่อผู้มีสิทธิ์ แก้ไขข้อมูล 3BB Shop</a></li> 
                            <li><a href="contract/viewer_list.aspx">รายชื่อผู้มีสิทธิ์ ระบบข้อมูลสัญญา 3BB Shop</a></li> 
                            <li><a href="checklist/user_active_pos.aspx">รายชื่อผู้มีสิทธิ์ ระบบรายการตรวจสอบ 3BB Shop</a></li> 
                            <li><a href="empquest/verify_list.aspx">รายชื่อผู้มีสิทธิ์ Verify ข้อมูลโครงการ</a></li> 
                            <li><a href="tbbapp/daily_mail_to_list.aspx">รายชื่อผู้มีสิทธิ์ MEMBERRPT</a></li> 
                            <li><a href="issuelog/poi_informant.aspx">รายชื่อผู้มีสิทธิ์ ISSUE LOG</a></li> 
                        </ul>
                    </li>
                    <li id="li_contract" runat="server"><a href="contract/allContract.aspx">ข้อมูลสัญญา</a></li>
                    <li><a href="checklist/default.aspx">รายการตรวจสอบ</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
    				<li class="use_loged" style="display:none;">
    					<a href="manual.aspx" style="font-size:13px; font-weight:600;">
    						<span class="glyphicon glyphicon-question-sign" aria-hidden="true" style="color:#ccc;"></span> คู่มือ
    					</a>
    				</li>

                    <li id="li_login" style="display:none;">
                        <a href="login.aspx" style="font-size:12px; font-weight:600;">
                            <span class="glyphicon glyphicon-lock" aria-hidden="true" style="color:#0088f5;"></span> Log in
                        </a>
                    </li>

                    <li class="dropdown use_loged" style="display:none;">
                        <a href="#" id="user_logon" runat="server" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        </a>
                        <ul class="dropdown-menu">
    						<li><a href="admin_approval.aspx" target="_blank">สถานะการอนุมัติ</a></li> 
    						<li role="separator" class="divider"></li> 
    						<li><a href="logoutOauth.aspx">ออกจากระบบ</a></li> 
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<div class="container container-a container-1">
	<div class="row">
		<div class="col-xs-12">
			<p class="head-title">สถิติ จำนวนวันที่เปิดทันเวลา ของสำนักงาน 3BB Shop แยกตาม RO (ตั้งแต่ 1 มกราคม 2020)</p>
			<p class="head-desc">*สามารถคลิกเพื่อดูรายจังหวัด</p>
			<div id="chartContainer">
				<div class="load_center">
					<span class="glyphicon glyphicon-refresh gly-spin"></span>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

</div>

<footer class="footer">
    <div class="container">
        <div class="pull-left">
            <p>Copyright &copy; 2016 by <a href="mailto:support_pos@jasmine.com">support_pos@jasmine.com</a></p>
            <p>เพื่อการใช้งานเต็มประสิทธิภาพ กรุณาใช้เบราว์เซอร์ Chrome หรือ Firefox</p>
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

<div id="modal_chart" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><span id="txt_ro_lg"></span> <span id="txt_cp_lg" style="font-size:16px;"></span></h4>
			</div>
			<div class="modal-body" style="min-height: 450px;">
				<div id="bar_chart_stack_chart_modal"></div>
			</div>
		</div>
	</div>
</div>

<div id="modal_chart_xl" class="modal fade" style="overflow-x: auto;" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><span id="txt_pv_xl"></span> <span id="txt_cp_xl" style="font-size:16px;"></span></h4>
			</div>
			<div class="modal-body" style="min-height: 450px;">
				<div id="bar_chart_stack_chart_modal_xl"></div>
			</div>
		</div>
	</div>
</div>

</body>
</html>

<script type="text/javascript">

$(document).ready(function() { 
    checkLogin();

    // $("html,body").scrollTop(50);

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

    chartStatOpenGoodSum();
	$('#page_loading').fadeOut();
});

function chartStatOpenGoodSum() {
	var url = "chartJson.aspx?qrs=chartStatOpenGoodSum";
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function(data) { 
			// console.log(data);
			data = covertDataJsonY(data);

			CanvasJS.addColorSet("barColorsSet", ['#5C99FC']);

			var chart = new CanvasJS.Chart("chartContainer", {
				animationEnabled: true,
				colorSet: "barColorsSet",
				axisY: {
					labelFontFamily: "Kanit"
				},
				axisX: {
					labelFontFamily: "Kanit"
				},
				toolTip: {
					fontFamily: "Kanit",
					shared: true,
					contentFormatter: function (e) {
						var content = e.entries[0].dataPoint.label + " <span class='txt-red' style='font-size:12px;'>คลิกเพื่อดูรายจังหวัด</span>";

						for (var i = e.entries.length-1; i >= 0; i--){
							content += "<br>"      
							content += "<span style='color: " + e.entries[i].dataSeries.color + ";'>" + e.entries[i].dataSeries.name + ":</span> <span>" + e.entries[i].dataPoint.y.toLocaleString() + " วัน</span>";
						}       
						return content;
					}
				},
				legend: {
					verticalAlign: "bottom",
					horizontalAlign: "center",
					fontFamily: "Kanit",
					fontWeight: "normal"
				},
				dataPointMaxWidth: 50,
				data: [
				{
					cursor: "pointer",	
					click: chartStatOpenGoodSumPv,
					type: "column",
					showInLegend: "true",
					legendText: "จำนวนวันที่เปิดทันเวลา",
					name: "จำนวนวันที่เปิดทันเวลา",
					indexLabel: "{y}",
					indexLabelPlacement: "inside",
					indexLabelFontColor: "white",
					indexLabelFontFamily: "Kanit",
					indexLabelFontSize: 12,
					dataPoints: data
				}]
			});

			chart.render();
		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});

	function covertDataJsonY(data) {
		$.each(data,function( i,item ) {
			item.y = parseInt(item.y);
		});

		return data;
	}
}

function chartStatOpenGoodSumPv(e) {

	// if(e.dataPoint.label == "RO10"){
	// 	chartStatOpenGoodSumShop(e);
	// }
	// else if(e.dataPoint.label == "RO10/1"){
	// 	chartStatOpenGoodSumShop(e);
	// }
	// else if(e.dataPoint.label == "RO10/6"){
	// 	chartStatOpenGoodSumShop(e);
	// }
	// else if(e.dataPoint.label == "RO10/9"){
	// 	chartStatOpenGoodSumShop(e);
	// }
	// else {
		var ro = e.dataPoint.label;
		ro = ro.replace("RO", "");

		$('#page_loading').fadeIn();
		$('#txt_ro_lg').html("RO" + ro);
		$('#txt_cp_lg').html("สถิติ จำนวนวันที่เปิดทันเวลา ของสำนักงาน 3BB Shop แยกตามจังหวัด (ตั้งแต่ 1 มกราคม 2020)");
		$('#bar_chart_stack_chart_modal').html("");

		var url = "chartJson.aspx?qrs=chartStatOpenGoodSumPv&ro=" + ro;
		console.log(url);

		$.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 60000,
			success: function(data) { 
				// console.log(data);
				data = covertDataJsonY(data);

				CanvasJS.addColorSet("barColorsSet", ['#FF7F00']);

				var chart = new CanvasJS.Chart("bar_chart_stack_chart_modal", {
					width: 865,
					animationEnabled: true,
					colorSet: "barColorsSet",
					axisY: {
						labelFontFamily: "Kanit"
					},
					axisX: {
						labelFontFamily: "Kanit"
					},
					toolTip: {
						fontFamily: "Kanit",
						shared: true,
						contentFormatter: function (e) {
							var content = e.entries[0].dataPoint.label + " <span class='txt-red' style='font-size:12px;'>คลิกเพื่อดูราย Shop</span>";

							for (var i = e.entries.length-1; i >= 0; i--){
								content += "<br>"      
								content += "<span style='color: " + e.entries[i].dataSeries.color + ";'>" + e.entries[i].dataSeries.name + ":</span> <span>" + e.entries[i].dataPoint.y.toLocaleString() + " วัน</span>";
							}       
							return content;
						}
					},
					legend: {
						verticalAlign: "bottom",
						horizontalAlign: "center",
						fontFamily: "Kanit",
						fontWeight: "normal"
					},
					dataPointMaxWidth: 50,
					data: [
					{
						cursor: "pointer",	
						click: chartStatOpenGoodSumShop,
						type: "column",
						showInLegend: "true",
						legendText: "จำนวนวันที่เปิดทันเวลา",
						name: "จำนวนวันที่เปิดทันเวลา",
						indexLabel: "{y}",
						indexLabelPlacement: "inside",
						indexLabelFontColor: "white",
						indexLabelFontFamily: "Kanit",
						indexLabelFontSize: 12,
						dataPoints: data
					}]
				});

				chart.render();
			},
			error: function(x, t, m) {
				console.log('x>' + x + ' t>' + t + ' m>' + m);

				ajaxError();
			}
		});

		$('#modal_chart').modal("show");
		$('#page_loading').fadeOut();
	// }

	function covertDataJsonY(data) {
		$.each(data,function( i,item ) {
			item.y = parseInt(item.y);
		});

		return data;
	}
}

function chartStatOpenGoodSumShop(e) {
	console.log(e)
	// $('#modal_chart').modal("hide");

	var pv;

	// if(e.dataPoint.label == "RO10"){
	// 	pv = "BKK";
	// }
	// else if(e.dataPoint.label == "RO10/1"){
	// 	pv = "SPN";
	// }
	// else if(e.dataPoint.label == "RO10/6"){
	// 	pv = "TRI";
	// }
	// else if(e.dataPoint.label == "RO10/9"){
	// 	pv = "PTI";
	// }
	// else {
		// pv = e.dataPoint.label;
	// }
	pv = e.dataPoint.province_short;
	
	$('#page_loading').fadeIn();
	$('#txt_pv_xl').html("[" + pv + "]");
	$('#txt_cp_xl').html("สถิติ เปอร์เซ็นเปิดทันเวลา ของสำนักงาน 3BB Shop แยกตาม Shop (ตั้งแต่ 1 มกราคม 2020)");
	$('#bar_chart_stack_chart_modal_xl').html("");

	var url = "chartJson.aspx?qrs=chartStatOpenGoodSumShop&pv=" + pv;
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function(data) { 
			$('#txt_pv_xl').html("[" + pv + " " + data.length + " สาขา]");
			var barWidth = 50;
			var Orientation = "horizontal";
			var axisXlabelAngle = 0;
			var axisXFontSize = 14;

			if(data.length > 70){
				barWidth = 10;
				Orientation = "vertical";
				axisXlabelAngle = 0;
				axisXFontSize = 10;
			}
			else if(data.length > 50){
				barWidth = 20;
				Orientation = "vertical";
			}
			else if(data.length > 30){
				barWidth = 30;
			}
			else if(data.length > 20){
				barWidth = 40;
			}
			
			if(data.length > 15){
				axisXlabelAngle = -90;
			}

			console.log(barWidth);
			data = covertDataJsonY(data);

			CanvasJS.addColorSet("barColorsSet", ['#AF005F']);

			var chart = new CanvasJS.Chart("bar_chart_stack_chart_modal_xl", {
				width: 1250,
				animationEnabled: true,
				colorSet: "barColorsSet",
				dataPointWidth: barWidth,
				axisY: {
					suffix: "%",
					maximum: 100,
					// minimum: 80,
					// viewportMinimum: 80,
					labelFontFamily: "Kanit"
				},
				axisX: {
					labelAngle: axisXlabelAngle,
					interval: 1,
					labelFontSize: axisXFontSize,
					labelFontFamily: "Kanit",
				},
				toolTip: {
					fontFamily: "Kanit",
					shared: true,
						contentFormatter: function (e) {
							var content = e.entries[0].dataPoint.label;

							for (var i = e.entries.length-1; i >= 0; i--){
								content += "<br>"      
								content += "<span style='color: " + e.entries[i].dataSeries.color + ";'>" + e.entries[i].dataSeries.name + ":</span> <span>" + e.entries[i].dataPoint.y.toLocaleString() + "%</span>";
							}       
							return content;
						}
				},
				legend: {
					verticalAlign: "bottom",
					horizontalAlign: "center",
					fontFamily: "Kanit",
					fontWeight: "normal"
				},
				data: [
				{
					type: "column",
					showInLegend: "true",
					legendText: "เปอร์เซ็นเปิดทันเวลา",
					name: "เปอร์เซ็นเปิดทันเวลา",
					indexLabel: "{y}",
					indexLabelPlacement: "inside",
					indexLabelFontColor: "white",
					indexLabelFontFamily: "Kanit",
					indexLabelOrientation: Orientation,
					indexLabelFontSize: 12,
					yValueFormatString: "#,##0\"%\"",
					dataPoints: data
				}]
			});

			chart.render();
		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});

	function covertDataJsonY(data) {
		$.each(data,function( i,item ) {
			item.y = parseInt(item.y);
		});

		return data;
	}

	$('#modal_chart_xl').modal("show");
	$('#page_loading').fadeOut();
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


<style type="text/css">
.canvasjs-chart-credit {
	display: none;
}
</style>