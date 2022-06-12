<%@ Page Language="VB" AutoEventWireup="false" CodeFile="uploadStockShopPicture.aspx.vb" Inherits="uploadStockShopPicture" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>อัพโหลดรูปภาพ [3BB Shop Back Office]</title>

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
	
	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=12" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />
	
	<script src="App_Inc/panu.js?vs=12"></script>

	<style type="text/css">
		iframe {
			width: 100%;
			height: 100%;
		}
		.pic_ex {
			margin-bottom: 15px;
			width: 380px;
			height: 280px;
		}
		./*conclosed {
			display: none;
		}*/
	</style>
	<script language="javascript" type="text/javascript">
	var stemp = 0;
	var duratime = 1500;

	var temp_picture1 = "";
	var temp_picture2 = "";
	var temp_picture3 = "";
	var temp_img_map = "";
	</script>
</head>
<body>
	<form method="post" runat="server">
		<input runat="server" id="hide_uemail" type="hidden">
		<input runat="server" id="hide_upermiss" type="hidden">

		<input runat="server" id="hide_no_shopStock" type="hidden">
		<input runat="server" id="hide_no_approve" type="hidden" value="0">
		<input runat="server" id="hide_approve_status" type="hidden" value="999">

		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="default.aspx">3BB SHOP <span class="bn2line">BACK<br>OFFICE</span></a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a data-toggle="tab" href="default.aspx">ข้อมูลสำนักงาน</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">รายงาน/สถิติ <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="report_premium_receive_shop.aspx">รายชื่อ Shop รับของพรีเมี่ยม</a></li>
								<li><a href="report_store_closetemp.aspx">รายงานสำนักงานปิดชั่วคราว</a></li>
								<li><a href="report.aspx">รายงานเปิดปิด ณ วันปัจจุบัน</a></li>
								<li><a href="history.aspx">ประวัติ เปิดปิดสำนักงาน</a></li>
								<li><a href="chart.aspx">สถิติ เปิดปิดสำนักงาน</a></li>
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
						<li class="use_loged">
							<a href="manual.aspx" style="font-size:13px; font-weight:600;">
								<span class="glyphicon glyphicon-question-sign" aria-hidden="true" style="color:#ccc;"></span> คู่มือ
							</a>
						</li>
						
						<li class="dropdown use_loged">
							<a href="#" id="user_logon" runat="server" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							</a>
							<ul class="dropdown-menu">
								<li><a href="logoutOauth.aspx">ออกจากระบบ</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<ol class="breadcrumb">
			<li id="li_shopcode" >Shop</li>
			<li class="active">แก้ไขข้อมูลสำนักงาน</li>
		</ol>

		<div class="container">
			<div class="form-center">
				<span id="MyMessage" runat="server"></span>

				<div class="row">
					<div class="col-xs-10">
						<div id="link_out" class="outer-arrow-box">
							<a href="updateStockShop.aspx">
								<div class="arrow-box arrow-first">
									<span class="glyphicon glyphicon-file" aria-hidden="true"></span> ข้อมูลทั่วไป
								</div>
							</a>
							<a href="updateStockShopTime.aspx">
								<div class="arrow-box">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span> ข้อมูลเวลาเปิด-ปิด
								</div>
							</a>
							<div class="arrow-box-active">
								<span class="glyphicon glyphicon-picture" aria-hidden="true"></span> อัพโหลดรูปภาพ
							</div>
							<a href="updateStockShopNote.aspx">
								<div class="arrow-box">
									<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> หมายเหตุแสดงบนเว็บ 3BB
								</div>
							</a>
							<a href="manual.aspx" target="_blank">
								<div class="arrow-box-manual">
									<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> คู่มือการใช้งาน
								</div>
							</a>
						</div>
					</div>
					<div class="col-xs-2" id="prove_pending" style="display:none;">
						<a href="admin_approval.aspx" class="pending" title="3BB Shop Approval">
							<span class="glyphicon glyphicon-retweet" aria-hidden="true"></span> รออนุมัติ
						</a>
					</div>
				</div>
				<hr class="end-row">

				<div class="row">
					<div class="col-xs-10">
						<div id="fake_progress" class="progress" style="width:380px; display:none;">
							<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" style="width:0%">
							</div>
						</div>
						<div class="conclosed" style="margin-left: -5px;">
							<iframe runat="server" id="iFrameUpload" frameborder="0" scrolling="no"></iframe>
							<span class="text-remark"><b class="valid">**กรุณาเลือกรูปภาพ size ไม่เกิน 500 Kb และขนาดภาพ 800x600 pixel เท่านั้น</b></span>
							<span class="text-remark"><b class="valid">**กรณีที่ไม่มีรูป image map ให้เว้นว่างไว้ ไม่ต้องอัพโหลด</b></span>
						</div>
						<!-- <h1 class="txt-red">ขณะนี้ไม่สามารถอัพโหลดรูปภาพได้ อยู่ระหว่างตรวจสอบ และแก้ไขค่ะ</h1> -->
						<!-- <h3 class="txt-red">ระบบอัพโหลดรูปภาพ 3BB Shop ปิดปรังปรุงชั่วคราว คาดว่าจะใช้ได้วันที่ 12 เม.ย. ค่ะ</h3> -->
					</div>
				</div>
				<hr class="end-row">

				<div class="row" id="row_img">
					<div class="col-xs-5">
						<div class="input-group">
							<label>Image 1</label><br>
							<img class="img-thumbnail pic_ex" id="image1" src="App_Inc/preview_800x600.png">
						</div>
					</div>
					<div class="col-xs-5">
						<div class="input-group">
							<label>Image 2</label><br>
							<img class="img-thumbnail pic_ex" id="image2" src="App_Inc/preview_800x600.png">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-5">
						<div class="input-group">
							<label>Image 3</label><br>
							<img class="img-thumbnail pic_ex" id="image3" src="App_Inc/preview_800x600.png">
						</div>
					</div>
					<div class="col-xs-5">
						<div class="input-group">
							<label>Image Map</label><br>
							<img class="img-thumbnail pic_ex" id="ImageMap" src="App_Inc/preview_800x600.png">
						</div>
					</div>
				</div>
				<div class="form-inline conclosed">
					<button type="button" class="btn btn-default btn-warning" id="btn_upload_again">
						<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> อัพโหลดอีกครั้ง
					</button>
					<a class="btn btn-default btn-primary" id="btn_skip" href="admin_approval.aspx" role="button">
						<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> เสร็จสิ้น
					</a>
				</div>
			</div>
		</div> 
	</div>
</form>

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
		</div>
	</div>
</div>

<div id="page_loading" class="modal-backdrop">
	<div class="in-loading not-nm">
		<span class="glyphicon glyphicon-refresh gly-spin"></span><span id="txt_loading"> กรุณารอสักครู่...</span>
	</div>
	<div class="in-loading not-ie">
		<h3><strong>ระบบไม่รองรับการใช้งานด้วยโปรแกรม Internet Explorer กรุณาใช้ Chrome หรือ Firefox</strong></h3>
	</div>
</div>

<footer class="footer">
	<div class="container">
		<div style="padding:10px;">
			<div class="pull-left">
				<p>Copyright &copy; 2016 by <a href="mailto:support_pos@jasmine.com">support_pos@jasmine.com</a></p>
				<p>เพื่อการใช้งานเต็มประสิทธิภาพ กรุณาใช้เบราว์เซอร์ Chrome หรือ Firefox</p>
			</div>

			<div class="pull-right">
				<span id="top-link-block">
					<a class='btn btn-default' onclick="$('html,body').animate({scrollTop:0},'slow');return false;">
						<i class="glyphicon glyphicon-chevron-up"></i>
					</a>
				</span>
			</div>
		</div>
	</div>
</footer>

<script type="text/javascript">
loadStockShopPicture();

$(document).ready(function() {
	var g_code = '?shop_code=' + _GET('shop_code');
	$('#link_out a').each(function(){
		this.href += g_code;
	})
	
	$("#li_shopcode").html(_GET('shop_code'));
});

$('#iFrameUpload').on("load", function () {
	checkUpload();
})

$('#btn_upload_again').click(function() {
	location.reload();
	$('html,body').scrollTop(0);
});

function loadStockShopPicture() {
	var url = 'updateStockShopJson.aspx?qrs=loadStockShopPicture&shop_code=' + _GET('shop_code');
	console.log(url);
	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			if(data.length > 0){

				if(data[0].approve_status == 0){
					$('#hide_approve_status').val(data[0].approve_status);

					loadStockShopPictureProve();
				}
				else{
					$('#hide_no_shopStock').val(data[0].no);

					$('#image1').attr('src',data[0].picture1);
					$('#image2').attr('src',data[0].picture2);
					$('#image3').attr('src',data[0].picture3);
					$('#ImageMap').attr('src',data[0].img_map);

					temp_picture1 = data[0].picture1;
					temp_picture2 = data[0].picture2;
					temp_picture3 = data[0].picture3;
					temp_img_map = data[0].img_map;
				}
			}
			else{
				modalAlert("ไม่มีรหัสสาขา " + _GET('shop_code'));
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					window.location = "default.aspx";
				})
			}
		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

function loadStockShopPictureProve() {
	var url = 'updateStockShopJson.aspx?qrs=loadStockShopPictureProve&shop_code=' + _GET('shop_code');
	console.log(url);
	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			if(data.length > 0){
				$('#prove_pending').show();
				$('#hide_no_approve').val(data[0].no_approve);
				$('#hide_no_shopStock').val(data[0].no_shopStock);

				$('#image1').attr('src',data[0].picture1);
				$('#image2').attr('src',data[0].picture2);
				$('#image3').attr('src',data[0].picture3);
				$('#ImageMap').attr('src',data[0].img_map);

				temp_picture1 = data[0].picture1;
				temp_picture2 = data[0].picture2;
				temp_picture3 = data[0].picture3;
				temp_img_map = data[0].img_map;
			}
		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

function checkUpload(){
	if(stemp == 0)
		stemp = 1;
	else{
		stemp = 0;

		// $('#iFrameUpload').animate({width: 0, height: 0});
		$('#iFrameUpload').hide();
		$('#fake_progress').show();
		fakeProgress();

		setTimeout( function() {
			$("html,body").animate({ scrollTop: $("#row_img").offset().top }, 'slow');
			apiImgVasForSave();
		},duratime+500);

	}
}

function fakeProgress(){
	$('.progress-bar').animate( {width:'100%'}, {
		duration: duratime,
		step: function(now, fx) {
			var data= Math.round(now);
			$(this).html(data + '%');
		}
	});
}

function apiImgVasForSave(){
	var url = "file_get_content.aspx";
	$.ajax({
		url: url,
		cache: false,
		data: {link: "http://3bb.co.th/POS/checkFileName.php?&shop_code=" + _GET('shop_code')},
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			// console.log(data);

			if(typeof data == 'object'){
				// $('#image1').attr('src', data.img1);
				// $('#image2').attr('src', data.img2);
				// $('#image3').attr('src', data.img3);
				// $('#ImageMap').attr('src', data.img_map);

				var img1,img2,img3,img_map;

				if(data.img1 != "")
					img1 = data.img1;
				else
					img1 = temp_picture1;

				if(data.img2 != "")
					img2 = data.img2;
				else
					img2 = temp_picture2;

				if(data.img3 != "")
					img3 = data.img3;
				else
					img3 = temp_picture3;

				if(data.img_map != "")
					img_map = data.img_map;
				else
					img_map = temp_img_map;

				console.log("img1=" + img1, " img2=" + img2, " img3=" + img3, " img_map=" + img_map);
				saveStockShopPicture(img1, img2, img3, img_map);
			}
			else {
				ajaxError();
			}
		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

function saveStockShopPicture(img1, img2, img3, img_map){
	$.ajax({
		url: "updateStockShopJson.aspx?qrs=saveStockShopPicture",
		cache: false,
		type: "post",
		timeout: 60000,
		data: { 
			uemail: $('#hide_uemail').val(),
			upermiss: $('#hide_upermiss').val(),
			no_approve: $('#hide_no_approve').val(),
			no_shopStock: $('#hide_no_shopStock').val(),
			shop_code: _GET('shop_code'),
			img1: img1, 
			img2: img2, 
			img3: img3, 
			img_map: img_map
		},
		success: function( res ) {
			if(res != 0) {
				// loadStockShopPicture();
				$('#image1').attr('src', img1);
				$('#image2').attr('src', img2);
				$('#image3').attr('src', img3);
				$('#ImageMap').attr('src', img_map);

				if($('#hide_approve_status').val() == 0 && $('#hide_upermiss').val() == "BACKOFFICE_ADMIN"){
					modalAlert('บันทึกและอนุมัติแล้ว');
					$('#prove_pending').hide();
				}
				else {
					modalAlert('บันทึกเรียบร้อยแล้ว<br><br>กรุณาคลิกปุ่ม "เสร็จสิ้น""');
				}

			}
		},
		error: function(x, t, m) {
			modalAlert('ไม่สำเร็จ');
		}
	});
}

function ajaxError(){
	modalAlert("ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
	$('#modal_alert').on('hidden.bs.modal', function (e) {
		location.reload();
	})
}

$( document ).ajaxStart(function() {
	$('#page_loading').fadeIn();
});

$( document ).ajaxStop(function() {
	$('#page_loading').fadeOut();
});

</script> 
</body>
</html>
