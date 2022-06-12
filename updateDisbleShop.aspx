<%@ Page Language="VB" AutoEventWireup="false" CodeFile="updateDisbleShop.aspx.vb" Inherits="updateDisbleShop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>ไม่แสดงในระบบ [3BB Shop Back Office]</title>

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
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=12" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<script src="App_Inc/panu.js?vs=12"></script>
	
	<style type="text/css">
		.txt-blue {
			color: #004181;
		}
	</style>
</head>
<body>
	<form method="post" runat="server">
		<input runat="server" id="hide_uemail" type="hidden">
		<input runat="server" id="hide_upermiss" type="hidden">
		<input runat="server" id="hide_no_shopStock" type="hidden">

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
			<li id="li_shopcode">Shop</li>
			<li class="active"><span class="glyphicon glyphicon-eye-close"></span> แก้ไขไม่แสดงในระบบ</li>
		</ol>

		<div class="container">
			<div class="form-center">
				<div class="row">
					<div class="col-xs-3">
						<div class="input-group">
							<span class="input-group-addon txt-bold">รหัสสำนักงาน</span>
							<input id="txt_shop_code" type="text" class="form-control" style="text-transform:uppercase" readonly>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="input-group">
							<span class="input-group-addon txt-bold">ชื่อสำนักงาน</span>
							<input id="txt_shop_name" type="text" class="form-control" readonly>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="input-group">
							<span class="input-group-addon txt-bold">ประเภท</span>
							<input id="txt_shop_type" type="text" class="form-control" readonly>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-3">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_dis_3bb_shop"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ไม่แสดง 3BB Shop Back Office</span>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_dis_contract"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ไม่แสดง 3BB Shop Contract File</span>
						</div>
					</div>
				</div>

				<hr class="line">
				<div class="form-inline">
					<input runat="server" id="hide_pre_dis_3bb_shop" type="hidden">
					<input runat="server" id="hide_pre_dis_contract" type="hidden">
					<button runat="server" type="button" class="btn btn-default btn-success" id="btn_submit" OnServerClick="Submit_ShopStock">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> บันทึกข้อมูล
					</button>
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
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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
$(document).ready(function() {
	$("#li_shopcode").html(_GET('shop_code'));

	checkShopCode();
});

function checkShopCode() {
	var url = 'updateStockShopJson.aspx?qrs=checkShopCode&shop_code=' + _GET('shop_code');

	$.ajax({
		url: url,
		cache: false,
		timeout: 60000,
		success: function( res ) { 
			if(res == 0){
				modalAlert("ไม่มีรหัสสาขา " + _GET('shop_code'));
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					window.location = "default.aspx";
				})
			}
			else {
				loadDisableShopDesc();
			}
		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});

	$('#goto_shopnote').attr("href", $('#goto_shopnote').attr('href') + "?shop_code=" + _GET('shop_code'));
}

function loadDisableShopDesc() {
	var url = 'updateStockShopJson.aspx?qrs=loadDisableShopDesc&shop_code=' + _GET('shop_code');
	console.log(url);
	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			if(data.length > 0){

					$('#hide_no_shopStock').val(data[0].no);
					$('#txt_shop_code').val(data[0].shop_code);
					$('#txt_shop_name').val(data[0].shop_name);
					$('#txt_shop_type').val(data[0].storeKiosType_name);

					$('#hide_pre_dis_3bb_shop').val(data[0].dis_3bb_shop);
					$('#hide_pre_dis_contract').val(data[0].dis_contract);

					if(data[0].dis_3bb_shop == 1){
						$('#chk_dis_3bb_shop').prop('checked', true);
					}

					if(data[0].dis_contract == 1){
						$('#chk_dis_contract').prop('checked', true);
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
</body>
</html>
