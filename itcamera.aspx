<%@ Page Language="VB" AutoEventWireup="false" CodeFile="itcamera.aspx.vb" Inherits="itcamera" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>ITCAMERA</title>

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-147236441-1"></script>
    <script type="text/javascript" src="App_Inc/gtag_3bbback.js?id=UA-147236441-1&vs=12"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
	<script src="App_Inc/jquery-1.11.3.min.js"></script>

	<link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
	<script src="App_Inc/bootstrap/js/bootstrap.js"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css" />
	<link type="text/css" rel="stylesheet" href="App_Inc/stockShop.css" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<script src="App_Inc/panu.js"></script>

	<style type="text/css">
	.container {
		font-family: 'Kanit', sans-serif;
	}

	#span1 {
		color: #245a79;
		font-weight: 600;
	}

	.panel-heading {
		font-size: 	20px;
	}

	.load_center {
		text-align: center;
		margin: auto;
		width: 50%;
		padding-top: 50px;
		padding-bottom: 50px;
		font-size: 28px;
		color: #dfdfdf;
	}
	</style>
</head>
<body>
	<form id="form1" runat="server" enctype="multipart/form-data"></form>

	<div class="container" style="margin: auto; width: 50%;">
		<div class="panel panel-default">
			<div class="panel-heading panel-fonting">ITCAMERA: <span id="span_shop_code"></span></div>
			<div id="panel_detail" class="panel-body" style="display:none;">
				<div class="form-horizontal">
					<blockquote>
						<p>
							สถานะกล้อง: <b id="span_status" class="txt-red">-</b>
						</p>
						<p style="color:gray; font-size: 12px;">
							ตรวจสอบกล้องล่าสุด: <span id="span_status_time">2018-00-00 00:00:00</span>
						</p>
					</blockquote>
					<blockquote>
						<p id="span_please" class="txt-blue">กรุณารอสักครู่..</p>
					</blockquote>
				</div>
				<!-- <div id="btn_go" class="form-horizontal" style="float:right; display:none;">
					<button type="button" class="btn" onclick="javascript:gotoITCAMERA()">รอ <span id="skip_deley">3</span> วินาที หรือคลิก</button>
				</div> -->
				<div id="btn_close" class="form-horizontal" style="float:right; display:none;">
					<button type="button" class="btn btn-warning" onclick="javascript:gotoITCAMERA()">ลองดู</button>
					<button type="button" class="btn btn-danger" onclick="javascript:window.close()">ปิด</button>
				</div>
				<div id="load_runtime" class="form-horizontal" style="color: gray; float:right; display:none;">
					<span id="span_runtime"></span><span id="wait" style="width: 10px; display: inline-block; font-weight: 600;">.</span>
					<button type="button" class="btn btn-danger" onclick="javascript:window.close()">ปิด</button>
				</div>
			</div>
			<div id="panel_load" class="panel-body">
				<div class="load_center">
					<span class="glyphicon glyphicon-refresh gly-spin"></span>
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
					<button type="button" class="btn" data-dismiss="modal">รอ</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="javascript:window.close()">ปิด</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	var link_camera;

	$(document).ready(function() {
		var gCode = _GET('shop_code');
		if(gCode != null) {
			if(gCode != "") {
				$('#span_shop_code').html(gCode.toUpperCase());

				apiITCAMERA();
			}
		}
	});

	function apiITCAMERA(){
		var url = "file_get_content.aspx";
		var api = "http://camera3bb.triplet.co.th/api2.php?shopcode=" + _GET('shop_code');
		// var api = "http://posbcs.triplet.co.th/exapi/ex.php";
		$.ajax({
			url: url,
			cache: false,
			data: {link: api},
			dataType: "json",
			timeout: 60000,
			success: function( data ) { 
				console.log(data);

			if(typeof data.error == 'undefined'){
				link_camera = data[0].link;

				$('#span_status').html(data[0].status);
				$('#span_status_time').html(data[0].last_update);

				if(data[0].status == "ON"){

					$('#span_status').addClass('txt-green');
					rShopCameraIcon(data[0].model);
				}
				else{
					$('#span_please').html('*ขณะนี้ไม่สามารถเชื่อมต่อกล้องได้ กรุณาดูอีกครั้งภายหลัง');
					$('#btn_close').show();
				}

				$('#panel_load').hide();
				$('#panel_detail').show();
				
			}
			else {
				console.log("data.error = " + data.error);
				ajaxError();
			}
		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

function gotoITCAMERA(maxloadtime) {
	var temp_alert = 0;
	var loadtime = 1;

	$('#span_runtime').html(loadtime + " วินาที");

	$('#btn_close').hide();
	$('#load_runtime').show();

	var downloadTimer = setInterval(function(){
		var span_time = ++loadtime;

		if(loadtime>=60){
			var min = loadtime/60;
			min = Math.floor(min);
			var sec = loadtime - min*60;

			span_time = min + " นาที " + sec + " วินาที";
		}
		else{
			span_time = loadtime + " วินาที";
		}

		$('#span_runtime').html(span_time);

		if(loadtime >= maxloadtime){
			if(temp_alert == 0){
				temp_alert = 1;
				modalAlert("กล้องโหลดนานเกินไป คุณจะรอต่อไหม..");
			}
			// clearInterval(downloadTimer);
		}
		var wait = document.getElementById("wait");
		if ( wait.innerHTML.length >= 3 ) 
			wait.innerHTML = "";
		else 
			wait.innerHTML += ".";
	},1000);

	// console.log(link_camera);
	window.location = link_camera;
}

function rShopCameraIcon(model) {
	var url = "defaultJson.aspx?qrs=rShopCameraIcon&model=" + model;
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		timeout: 60000,
		success: function( res ) { 
			var maxloadtime = 120;
			var txt_please = "";

			if(res == "n"){
				maxloadtime = 20;
				txt_please = "กรุณารอโหลดภาพ ประมาณ 20 วินาที<br>หากรอนานกว่านั้น แล้วยังไม่มีภาพ กรุณาปิดและเปิดใหม่";
			}
			else {
				maxloadtime = 120;
				txt_please = "กรุณารอโหลดภาพ ประมาณ 2 นาที<br>หากรอนานกว่านั้น แล้วยังไม่มีภาพ กรุณาปิดและเปิดใหม่";
			}

			$('#span_please').html(txt_please);

			gotoITCAMERA(maxloadtime);
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
</script> 
</body>
</html>
