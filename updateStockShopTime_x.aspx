<%@ Page Language="VB" AutoEventWireup="false" CodeFile="updateStockShopTime.aspx.vb" Inherits="updateStockShopTime" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>ข้อมูลเวลาเปิด-ปิด [3BB Shop Back Office]</title>

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
	
	<script src="App_Inc/var.js?vs=12"></script>
	<script src="App_Inc/panu.js?vs=12"></script>
	<style type="text/css">
		.dis-none{
			display: none;
		}
		.form-500 input[type="text"], .form-500 input[type="file"], .form-500 select, .form-500 textarea ,.input-500 .form-control {
			width: auto;
			min-width: 500px;
			max-width: 100%;
		}

		.left-label {
			text-align: left !important;
		}
		.ui-autocomplete {
			z-index: 99999; 
		}
		#modal_alert {
			z-index: 99999; 
		}
		.txt-blue-rec {
			color: #245a79;
		}
		.txt-orange {
			color: #f7941d;
		}
	</style>
</head>
<body>
	<form method="post" runat="server">
		<input runat="server" id="hide_uemail" type="hidden">
		<input runat="server" id="hide_upermiss" type="hidden">
		<input runat="server" id="hide_no_approve" type="hidden">
		<input runat="server" id="hide_token" type="hidden">

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
							<div class="arrow-box-active">
								<span class="glyphicon glyphicon-time" aria-hidden="true"></span> ข้อมูลเวลาเปิด-ปิด
							</div>
							<a href="uploadStockShopPicture.aspx">
								<div class="arrow-box">
									<span class="glyphicon glyphicon-picture" aria-hidden="true"></span> อัพโหลดรูปภาพ
								</div>
							</a>
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
					<div class="col-xs-2" id="prove_0_pending" style="display:none;">
						<a href="admin_approval.aspx" class="pending" title="3BB Shop Approval">
							<span class="glyphicon glyphicon-retweet" aria-hidden="true"></span> รอ MKT
						</a>
					</div>
					<div class="col-xs-2" id="prove_3_pending" style="display:none;">
						<a href="admin_approval.aspx" class="pending" title="3BB Shop Approval">
							<span class="glyphicon glyphicon-retweet" aria-hidden="true"></span> รออนุมัติ
						</a>
					</div>
				</div>
				<hr class="end-row">
				<div class="row" style="display:none;">
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_mon"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ปิด วันจันทร์</span>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_tue"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ปิด วันอังคาร</span>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_wed"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ปิด วันพุธ</span>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_thu"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ปิด วันพฤหัส</span>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_fri"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ปิด วันศุกร์</span>
						</div>
					</div>
				</div>
				<!-- <hr class="end-row"> -->
				<div class="row">
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_off_sat"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ปิด วันเสาร์</span>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_off_sun"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ปิด วันอาทิตย์</span>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_off_holiday"> 
							</span>
							<span class="input-group-addon txt-bold txt-red">ปิด วันนักขัตฤกษ์</span>
						</div>
					</div>
				</div>
				<hr class="line">
				<div class="row">
					<div class="col-xs-3">
						<div class="input-group chk-group alldy">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_same_evday"> 
							</span>
							<span class="input-group-addon txt-bold">เปิด-ปิด เวลาเดียวกันทุกวัน</span>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div id="group_day5">
					<div class="row">
						<div class="col-xs-2">
							<label class="open-time">เปิด-ปิด สำนักงาน</label>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาเปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="08:30" id="txt_shop_open5">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="18:00" id="txt_shop_close5">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<label class="every-day-time">ทุกวัน</label>
							<label class="day-time weekday-str">วันธรรมดา (จันทร์-ศุกร์)</label>
						</div>
					</div>
					<hr class="end-row">
					<div class="row dis-none">
						<div class="col-xs-2">
							<label class="open-time">เปิด-ปิด รับเงินสด</label>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาเปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="08:30" id="txt_cash_open5">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="18:00" id="txt_cash_close5">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<label class="every-day-time">ทุกวัน</label>
							<label class="day-time weekday-str">วันธรรมดา (จันทร์-ศุกร์)</label>
						</div>
					</div>
					<hr class="end-row dis-none">
					<div class="row dis-none">
						<div class="col-xs-2">
							<label class="open-time">เปิด-ปิด รับเช็ค/บัตรเครดิต</label>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาเปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="08:30" id="txt_credit_open5">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="18:00" id="txt_credit_close5">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<label class="every-day-time">ทุกวัน</label>
							<label class="day-time weekday-str">วันธรรมดา (จันทร์-ศุกร์)</label>
						</div>
					</div>
					<hr class="end-row dis-none">
				</div>
				<div id="group_day2">
					<div class="row">
						<div class="col-xs-2">
							<label class="open-time">เปิด-ปิด สำนักงาน</label>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาเปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="08:30" id="txt_shop_open2">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="18:00" id="txt_shop_close2">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-4">
							<label class="day-time weekend-str">วันหยุด (เสาร์-อาทิตย์)</label>
						</div>
					</div>
					<hr class="end-row">
					<div class="row dis-none">
						<div class="col-xs-2">
							<label class="open-time">เปิด-ปิด รับเงินสด</label>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาเปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="08:30" id="txt_cash_open2">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="18:00" id="txt_cash_close2">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-4">
							<label class="day-time weekend-str">วันหยุด (เสาร์-อาทิตย์)</label>
						</div>
					</div>
					<hr class="end-row dis-none">
					<div class="row dis-none">
						<div class="col-xs-2">
							<label class="open-time">เปิด-ปิด รับเช็ค/บัตรเครดิต</label>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาเปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="08:30" id="txt_credit_open2">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เวลาปิด</span>
								<input runat="server" type="text" class="form-control txt-blue txt-time" maxlength="5" placeholder="18:00" id="txt_credit_close2">
								<span class="input-group-addon">น.</span>
							</div>
						</div>
						<div class="col-xs-4">
							<label class="day-time weekend-str">วันหยุด (เสาร์-อาทิตย์)</label>
						</div>
					</div>
					<hr class="end-row dis-none">
					<div class="row dis-none" id="group_monday">
						<div class="col-xs-3">
							<label class="open-time">วันจันทร์ ใช้เวลาทำการเดียวกับ</label>
						</div>
						<div class="col-xs-2">
							<div class="input-group chk-group">
								<span class="input-group-addon">
									<input runat="server" type="radio" name="chk_monday_time" id="chk_monday_time5" checked> 
								</span>
								<span class="input-group-addon txt-bold ">วันธรรมดา</span>
							</div>
						</div>
						<div class="col-xs-2">
							<div class="input-group chk-group">
								<span class="input-group-addon">
									<input runat="server" type="radio" name="chk_monday_time" id="chk_monday_time2"> 
								</span>
								<span class="input-group-addon txt-bold">วันหยุด</span>
							</div>
						</div>
					</div>
					<hr class="end-row">
					<div class="row" id="group_monday">
						<div class="col-xs-3">
							<label class="open-time">วันศุกร์ ใช้เวลาทำการเดียวกับ</label>
						</div>
						<div class="col-xs-2">
							<div class="input-group chk-group">
								<span class="input-group-addon">
									<input runat="server" type="radio" name="chk_friday_time" id="chk_friday_time5" checked> 
								</span>
								<span class="input-group-addon txt-bold ">วันธรรมดา</span>
							</div>
						</div>
						<div class="col-xs-2">
							<div class="input-group chk-group">
								<span class="input-group-addon">
									<input runat="server" type="radio" name="chk_friday_time" id="chk_friday_time2"> 
								</span>
								<span class="input-group-addon txt-bold">วันหยุด</span>
							</div>
						</div>
					</div>
					<hr class="end-row">
					<div class="row" id="group_holiday">
						<div class="col-xs-3">
							<label class="open-time">วันนักขัตฤกษ์ ใช้เวลาทำการเดียวกับ</label>
						</div>
						<div class="col-xs-2">
							<div class="input-group chk-group">
								<span class="input-group-addon">
									<input runat="server" type="radio" name="chk_holiday_time" id="chk_holiday_time5"> 
								</span>
								<span class="input-group-addon txt-bold ">วันธรรมดา</span>
							</div>
						</div>
						<div class="col-xs-2">
							<div class="input-group chk-group">
								<span class="input-group-addon">
									<input runat="server" type="radio" name="chk_holiday_time" id="chk_holiday_time2" checked> 
								</span>
								<span class="input-group-addon txt-bold">วันหยุด</span>
							</div>
						</div>
					</div>
				</div>
				<hr class="line">
				<div class="form-inline">
					<span class="text-remark"><b class="valid">หมายเหตุ: <a href="holidays.aspx" target="_blank">คลิกเพื่อดูรายการวันหยุดนักขัตฤกษ์</a></b></span>
					<span class="text-remark"><b class="valid">หมายเหตุ: หากเวลาเปิดหรือเวลาปิดเป็นค่าว่าง จะไม่แสดงผลเวลาทำการ</b></span>
					<span class="text-remark"><b class="valid">หมายเหตุ: หากข้อมูลอยู่ระหว่างรออนุมัติ จะไม่สามารถบันทึกข้อมูลอีกได้ (ต้องรอให้เสร็จสิ้น หรือยกเลิกคำขอเดิม)</b></span>
					<span class="text-remark"><b class="valid">หมายเหตุ: หากมีปัญหา ไม่สามารถตั้งค่าเวลาทำการได้ กรุณาติดต่อ <a href="mailto:support_pos@jasmine.com">support_pos@jasmine.com</a></b></span>
					<input runat="server" id="hide_newshop" type="hidden">
					<input runat="server" id="hide_follow_id" type="hidden">
					<button type="button" class="btn btn-default btn-primary" id="btn_example">
						<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> แสดงตัวอย่าง
					</button>
					<button runat="server" type="button" class="btn btn-default btn-success" id="btn_submit" OnServerClick="Submit_ShopStock" style="display:none;">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> บันทึกข้อมูล
					</button>
					<button type="button" class="btn btn-default btn-warning" id="btn_modal_follow">
						<span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> สร้างคำขออนุมัติ
					</button>
					<a class="btn btn-default btn-primary" id="btn_skip" style="display:none;" href="#" role="button">
						<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> ข้าม
					</a>
				</div>
			</div>
		</div> 
	</div>
</form>

<div id="page_loading" class="modal-backdrop">
	<div class="in-loading not-nm">
		<span class="glyphicon glyphicon-refresh gly-spin"></span><span id="txt_loading"> กรุณารอสักครู่...</span>
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
		</div>
	</div>
</div>


<div id="modal_alert_xl" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-l">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">แจ้งเตือน</h4>
			</div>
			<div class="modal-body">
				<p id="txt_alert_xl">ข้อความ</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
			</div>
		</div>
	</div>
</div>

<div id="modal_follow" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">สร้างคำขออนุมัติ เปลี่ยนเวลาทำการ ผ่านระบบ Follow Request</h4>
			</div>
			<div class="modal-body" style="font-size:13px;">
				<div class="panel panel-default">
					<div class="panel-heading">รายละเอียดคำขอ</div>
					<div class="panel-body">
						<div class="form-horizontal">
							<div class="space-br"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label">สาขาที่แจ้ง:</label>
								<span id="inn_select_shop" class="col-sm-9 control-label left-label"></span>
							</div>
							<div class="space-br"></div>
							<div class="form-group">
								<label class="col-sm-3 control-label">เวลาทำการใหม่:</label>
								<span runat="server" id="inn_tx01" class="col-sm-9 control-label left-label"></span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">เวลาทำการเดิม:</label>
								<span runat="server" id="inn_tx02" class="col-sm-9 control-label left-label"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">ผู้ตรวจสอบ และอนุมัติ</div>
					<div class="panel-body">
						<div class="form-horizontal">

							<div class="space-br"></div>
							<div class="form-group required">
								<!-- <label class="col-sm-3 control-label"><a href="http://posbcs.triplet.co.th/3bbShop/ro_province.aspx" target="_blank">ผู้จัดการจังหวัด</a></label> -->
								<label class="col-sm-3 control-label">ผู้ตรวจสอบ 1</label>
								<div class="col-sm-9">
									<div class="form-inline">
										<input type="text" id="auto_verify1" class="form-control input-sm box-search" placeholder="ค้นหาอัตโนมัติโดย ชื่อ หรืออีเมล์">
										<input runat="server" id="hide_uemail_verify1" xd="hide_uemail_verify1" type="hidden">
										<span id="txt_desc_verify1" class="txt-blue-rec" style="margin-left:10px;"></span>
									</div>
								</div>
							</div>
							<div class="form-group required">
								<!-- <label class="col-sm-3 control-label"><a href="http://posbcs.triplet.co.th/3bbShop/ro_cluster.aspx" target="_blank">ผู้จัดการ Cluster</a></label> -->
								<label class="col-sm-3 control-label">ผู้ตรวจสอบ 2</label>
								<div class="col-sm-9">
									<div class="form-inline">
										<input type="text" id="auto_verify2" class="form-control input-sm box-search" placeholder="ค้นหาอัตโนมัติโดย ชื่อ หรืออีเมล์">
										<input runat="server" id="hide_uemail_verify2" xd="hide_uemail_verify2" type="hidden">
										<span id="txt_desc_verify2" class="txt-blue-rec" style="margin-left:10px;"></span>
									</div>
								</div>
							</div>
							<div class="form-group required">
								<!-- <label class="col-sm-3 control-label"><a href="http://posbcs.triplet.co.th/3bbShop/ro_director.aspx" target="_blank">ผู้อำนวยการภาค</a></label> -->
								<label class="col-sm-3 control-label">ผู้อนุมัติ</label>
								<div class="col-sm-9">
									<div class="form-inline">
										<input type="text" id="auto_approve" class="form-control input-sm box-search" placeholder="ค้นหาอัตโนมัติโดย ชื่อ หรืออีเมล์">
										<input runat="server" id="hide_uemail_approve" xd="hide_uemail_approve" type="hidden">
										<span id="txt_desc_approve" class="txt-blue-rec" style="margin-left:10px;"></span>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<input id="hide_cur_time_open_weekday" type="hidden">
				<input id="hide_cur_time_open_weekend" type="hidden">
				<input id="hide_cur_day_off" type="hidden">
				<input id="hide_follow_ro" type="hidden">
				<input id="hide_follow_province_short" type="hidden">
				<button id="btn_send_follow" type="button" class="btn btn-success">
					<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> ยืนยันบันทึกคำขอ Follow Request
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
			</div>
		</div>
	</div>
</div>

<div id="modal_example" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">ตัวอย่างเวลาทำการ ที่แสดงบนหน้าเว็บ</h4>
			</div>
			<div class="modal-body">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">เวลาทำการใหม่:</label>
						<span id="inn_ex01" class="col-sm-9 control-label left-label"></span>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">เวลาทำการเดิม:</label>
						<span id="inn_ex02" class="col-sm-9 control-label left-label"></span>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"></label>
						<span id="inn_ex03" class="col-sm-9 control-label left-label txt-bold txt-red">
							
						</span>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
			</div>
		</div>
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

<script type="text/javascript" src="App_Inc/external_followreq.js?vs=122222"></script>

<script type="text/javascript">
// loadStockShopTime();
loadStockShopDayOff();
currentStockShopDayTime();
chk_checked_allday();
checkStockShopTimeHardCode();

$(document).ready(function() {
	var g_code = '?shop_code=' + _GET('shop_code');
	$('#link_out a').each(function(){
		this.href += g_code;
	})
	$("#btn_skip").attr("href", "uploadStockShopPicture.aspx" + g_code + "#new");

	$("#li_shopcode").html(_GET('shop_code'));

	if(getHash() == "new") {
		$('#btn_skip').show();
		$('.navbar-brand').text('CREATE NEW 3BB SHOP');
		$('#hide_newshop').val("new");
	}

	if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN" ) {
		// $("#btn_modal_follow").hide();
		$("#btn_submit").show();
	}
});

$(".txt-time").keypress(function(event){
	if(event.which != 8 && isNaN(String.fromCharCode(event.which))){
		event.preventDefault();
	}
});

$('.txt-time').keyup(function() {
	$el = $(this);

	if($el.val().length == 2) {
		$el.val($el.val() + ":");
	}
});

$('.txt-time').focusout(function() {
	var regx_hhmm = new RegExp('^(0[0-9]|1[0-9]|2[0-4]):[0-5][0-9]$');
	$el = $(this);
	
	if(regx_hhmm.test($el.val()) == false && $el.val() != ""){
		modalAlert("เวลาไม่ถูกต้อง!! (hh:mm)");

		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el.val("");
			$el.focus();
		})
	}
});

$("#chk_off_holiday").change(function() {
	chk_checked_holiday();
});

$('#chk_same_evday').change(function() {
	chk_checked_allday();
});

$('input[type=radio][name=chk_friday_time]').change(function() {
	chk_day_str();
});

$('input[type=radio][name=chk_holiday_time]').change(function() {
	chk_day_str();
});

function chk_day_str() {
	var weekdaystr = "จันทร์-ศุกร์";
	var weekendstr = "เสาร์-อาทิตย์";

	if($('#chk_friday_time2').prop("checked") == true) {
		weekdaystr = "จันทร์-พฤหัสบดี";
		weekendstr = "ศุกร์-อาทิตย์";
	}

	if($('#chk_off_holiday').prop("checked") == false) {
		if($('#chk_holiday_time5').prop("checked") == true) {
			weekdaystr += " และนักขัตฤกษ์";
		}
		if($('#chk_holiday_time2').prop("checked") == true) {
			weekendstr += " และนักขัตฤกษ์";
		}
	}

	weekdaystr = "วันธรรมดา (" + weekdaystr + ")";
	weekendstr = "วันหยุด (" + weekendstr + ")";

	$('.weekday-str').html(weekdaystr);
	$('.weekend-str').html(weekendstr);
}

function chk_checked_holiday() {
	if($('#chk_off_holiday').prop("checked") == true) {
		$('#group_holiday').hide();
	}
	else {
		$('#group_holiday').show();
	}
	
	chk_day_str();
}

function chk_checked_allday() {
	if($('#chk_same_evday').prop("checked") == true) {
		// every_day = true;
		$('#group_day2').hide();
		$('.day-time').hide();
		$('.every-day-time').show();
		$('.alldy').addClass('alldy-selected');
	}
	else {
		// every_day = false;
		$('#group_day2').show();
		$('.day-time').show();
		$('.every-day-time').hide();
		$('.alldy').removeClass('alldy-selected');
	}

	chk_day_str();
}

function loadStockShopDayOff() {
	var url = "updateStockShopJson.aspx?qrs=loadStockShopDayOff&shop_code=" + _GET('shop_code');
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 

			if(data.length > 0){
				if(data[0].approve_status == 0 || data[0].approve_status == 3){
					loadStockShopDayTimeProve(data[0].approve_status);
				}
				else{
					if(data[0].mon == 1){
						$('#chk_mon').prop('checked', true);
					}
					if(data[0].tue == 1){
						$('#chk_tue').prop('checked', true);
					}
					if(data[0].wed == 1){
						$('#chk_wed').prop('checked', true);
					}
					if(data[0].thu == 1){
						$('#chk_thu').prop('checked', true);
					}
					if(data[0].fri == 1){
						$('#chk_fri').prop('checked', true);
					}
					if(data[0].sat == 1){
						$('#chk_off_sat').prop('checked', true);
					}
					if(data[0].sun == 1){
						$('#chk_off_sun').prop('checked', true);
					}

					loadStockShopTime();
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

function loadStockShopTime() {
	var url = "updateStockShopJson.aspx?qrs=loadStockShopTime&shop_code=" + _GET('shop_code');
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 

			if(data.length == 3){
				if(data[0].day_7 == 1 || (
					data[0].shop_open == data[1].shop_open && 
					data[0].shop_close == data[1].shop_close && 
					data[0].cash_open == data[1].cash_open && 
					data[0].cash_close == data[1].cash_close && 
					data[0].credit_open == data[1].credit_open && 
					data[0].credit_close == data[1].credit_close
				)){
					$('#chk_same_evday').prop('checked', true);
					chk_checked_allday();
				}

				if(data[0].holiday_time == 2 || data[0].holiday_time == 5){
					$('#chk_holiday_time' + data[0].holiday_time).prop('checked', true);
				}
				else {
					$('#chk_off_holiday').prop('checked', true);
				}

				if(data[0].monday_time == 2 || data[0].monday_time == 5){
					$('#chk_monday_time' + data[0].monday_time).prop('checked', true);
				}

				if(data[0].friday_time == 2 || data[0].friday_time == 5){
					$('#chk_friday_time' + data[0].friday_time).prop('checked', true);
				}

				chk_checked_holiday();

				$('#txt_shop_open5').val(data[0].shop_open);
				$('#txt_shop_close5').val(data[0].shop_close);
				$('#txt_cash_open5').val(data[0].cash_open);
				$('#txt_cash_close5').val(data[0].cash_close);
				$('#txt_credit_open5').val(data[0].credit_open);
				$('#txt_credit_close5').val(data[0].credit_close);

				$('#txt_shop_open2').val(data[1].shop_open);
				$('#txt_shop_close2').val(data[1].shop_close);
				$('#txt_cash_open2').val(data[1].cash_open);
				$('#txt_cash_close2').val(data[1].cash_close);
				$('#txt_credit_open2').val(data[1].credit_open);
				$('#txt_credit_close2').val(data[1].credit_close);
			}
			else{
				modalAlert("ข้อมูลเวลาเปิด-ปิด มีปัญหา <br>กรุณาติดต่อ support_pos@jasmine.com");
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

function loadStockShopDayTimeProve(approve_status) {
	var url = "updateStockShopJson.aspx?qrs=loadStockShopDayTimeProve&shop_code=" + _GET('shop_code') + "&approve_status=" + approve_status;
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 

			if(data.length > 0){
				if (approve_status == 3) {
					$('#btn_submit').prop('disabled', true);
				}

				$('#btn_modal_follow').prop('disabled', true);
				$('#prove_' + approve_status + '_pending').show();
				
				$('#hide_no_approve').val(data[0].no_approve);
				
				if(data[0].dayoff_sat == 1){
					$('#chk_off_sat').prop('checked', true);
				}
				if(data[0].dayoff_sun == 1){
					$('#chk_off_sun').prop('checked', true);
				}

				if(data[0].day_7 == 1 || (
					data[0].wd_shop_open == data[0].we_shop_open && 
					data[0].wd_shop_close == data[0].we_shop_close && 
					data[0].wd_cash_open == data[0].we_cash_open && 
					data[0].wd_cash_close == data[0].we_cash_close && 
					data[0].wd_credit_open == data[0].we_credit_open && 
					data[0].wd_credit_close == data[0].we_credit_close
					)){
					$('#chk_same_evday').prop('checked', true);
					chk_checked_allday();
				}

				if(data[0].holiday_time == 2 || data[0].holiday_time == 5){
					$('#chk_holiday_time' + data[0].holiday_time).prop('checked', true);
				}
				else {
					$('#chk_off_holiday').prop('checked', true);
				}
				chk_checked_holiday();

				$('#txt_shop_open5').val(data[0].wd_shop_open);
				$('#txt_shop_close5').val(data[0].wd_shop_close);
				$('#txt_cash_open5').val(data[0].wd_cash_open);
				$('#txt_cash_close5').val(data[0].wd_cash_close);
				$('#txt_credit_open5').val(data[0].wd_credit_open);
				$('#txt_credit_close5').val(data[0].wd_credit_close);

				$('#txt_shop_open2').val(data[0].we_shop_open);
				$('#txt_shop_close2').val(data[0].we_shop_close);
				$('#txt_cash_open2').val(data[0].we_cash_open);
				$('#txt_cash_close2').val(data[0].we_cash_close);
				$('#txt_credit_open2').val(data[0].we_credit_open);
				$('#txt_credit_close2').val(data[0].we_credit_close);
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


$('#btn_modal_follow').click(function() {
	$('#hide_uemail_verify1').val("");
	$('#hide_uemail_verify2').val("");
	$('#hide_uemail_approve').val("");

	// if(checkSubmit()){
		$('#inn_select_shop').html(_GET('shop_code').toUpperCase());
		$('#inn_tx01').html("");
		$('#inn_tx02').html("");

		loadRoProvince();
		exampleStockShopDayTime();
	// }
});


$('#btn_example').click(function() {
	exampleStockShopDayTime(1);
});

function currentStockShopDayTime() {
	var url = "updateStockShopJson.aspx?qrs=currentStockShopDayTime&shop_code=" + _GET('shop_code');
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 

			if(data.length > 0){
				$('#hide_cur_time_open_weekday').val(data[0].time_open_weekday);
				$('#hide_cur_time_open_weekend').val(data[0].time_open_weekend);
				$('#hide_cur_day_off').val(data[0].day_off);
			}

		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

function exampleStockShopDayTime(show_ex = 0) {
	var chk_same_evday = 0;
	var chk_off_sat = 0; 
	var chk_off_sun = 0; 
	var chk_holiday_time5 = 0; 
	var chk_holiday_time2 = 0; 
	var chk_off_holiday = 0; 

	var chk_monday_time5 = 0; 
	var chk_monday_time2 = 0; 
	var chk_friday_time5 = 0; 
	var chk_friday_time2 = 0; 

	if($('#chk_same_evday').prop("checked") == true) chk_same_evday = 1;
	if($('#chk_off_sat').prop("checked") == true) chk_off_sat = 1;
	if($('#chk_off_sun').prop("checked") == true) chk_off_sun = 1;
	if($('#chk_holiday_time5').prop("checked") == true) chk_holiday_time5 = 1;
	if($('#chk_holiday_time2').prop("checked") == true) chk_holiday_time2 = 1;
	if($('#chk_off_holiday').prop("checked") == true) chk_off_holiday = 1;

	if($('#chk_monday_time5').prop("checked") == true) chk_monday_time5 = 1;
	if($('#chk_monday_time2').prop("checked") == true) chk_monday_time2 = 1;
	if($('#chk_friday_time5').prop("checked") == true) chk_friday_time5 = 1;
	if($('#chk_friday_time2').prop("checked") == true) chk_friday_time2 = 1;

	var url = "updateStockShopJson.aspx?qrs=exampleStockShopDayTime";
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		timeout: 60000,
		dataType: "json",
		data: {
			shop_code: _GET('shop_code'),
			uemail: $('#hide_uemail').val(),

			chk_same_evday,
			chk_off_sat,
			chk_off_sun,
			chk_holiday_time5,
			chk_holiday_time2,
			chk_off_holiday,

			chk_monday_time5,
			chk_monday_time2,
			chk_friday_time5,
			chk_friday_time2,

			shop_open5: $('#txt_shop_open5').val(),
			shop_close5: $('#txt_shop_close5').val(),
			shop_open2: $('#txt_shop_open2').val(),
			shop_close2: $('#txt_shop_close2').val(),
		},
		success: function( data ) {
			if(data.length > 0){
				var cur_time_open_weekday = "";
				var new_time_open_weekday = "";

				if(checkNotEmpty(data[0].time_open_weekday)){
					new_time_open_weekday = "เปิดบริการ: " + data[0].time_open_weekday;

					if(checkNotEmpty(data[0].time_open_weekend)){
						new_time_open_weekday += htm_br + data[0].time_open_weekend;
					}

					if(checkNotEmpty(data[0].day_off)){
						new_time_open_weekday += htm_br + "ปิดทำการ: " + data[0].day_off;
					}

					cur_time_open_weekday = "เปิดบริการ: " + $('#hide_cur_time_open_weekday').val();

					if(checkNotEmpty($('#hide_cur_time_open_weekend').val())){
						cur_time_open_weekday += htm_br + $('#hide_cur_time_open_weekend').val();
					}

					if(checkNotEmpty($('#hide_cur_day_off').val())){
						cur_time_open_weekday += htm_br + "ปิดทำการ: " + $('#hide_cur_day_off').val();
					}

					if(show_ex == 1) {
						$('#inn_ex01').html(new_time_open_weekday);
						$('#inn_ex02').html(cur_time_open_weekday);
						$('#inn_ex03').html("");

						if(new_time_open_weekday == cur_time_open_weekday){
							$('#inn_ex03').html("*ข้อมูลยังไม่มีการเปลี่ยนแปลง");
						}

						$('#modal_example').modal("show");
					}
					else {

						if(new_time_open_weekday == cur_time_open_weekday){
							var txt_alert = "ไม่สามารถสร้างคำขอได้ เพราะข้อมูลยังไม่มีการเปลี่ยนแปลง";
							modalAlert(txt_alert);
						}
						else {
							$('#inn_tx01').html(new_time_open_weekday);
							$('#inn_tx02').html(cur_time_open_weekday);

							$('#modal_follow').modal("show");
						}
					}
				}
				else{
					modalAlert("กรุณากรอกเวลาทำการ ให้ถูกต้อง");
				}
			}

		},
		error: function() {
			modalAlert("ไม่สำเร็จ (ex daytime str error) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
		}
	});
}

$('#btn_send_follow').click(function() {
	if( $("#hide_uemail_verify1").val() == "" ){
		modalAlert("กรุณากรอก ผู้จัดการจังหวัด");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#auto_verify1').focus();
		})
		return false;
	}
	else if( $("#hide_uemail_verify2").val() == "" ){
		modalAlert("กรุณากรอก ผู้จัดการ Cluster");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#auto_verify2').focus();
		})
		return false;
	}
	else if( $("#hide_uemail_approve").val() == "" ){
		modalAlert("กรุณากรอก ผู้อำนวยการภาค");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#auto_approve').focus();
		})
		return false;
	}
	else {
		$('#modal_follow').modal("hide");
		send_follow();
	}
});

function send_follow() {
	console.log("api: " + new_backof20_api);

	// console.log("shop_code: " + _GET('shop_code').toUpperCase());
	// console.log("ro: " + $('#hide_follow_ro').val());
	// console.log("province_short: " + $('#hide_follow_province_short').val());

	// console.log("token: " + $('#hide_token').val());
	// console.log("uemail: " + $('#hide_uemail').val());
	// console.log("uemail_cc2: " + "waraporn.kaw");

	// console.log("uemail_verify1: " + $('#hide_uemail_verify1').val());
	// console.log("uemail_verify2: " + $('#hide_uemail_verify2').val());
	// console.log("uemail_approve: " + $('#hide_uemail_approve').val());

	// console.log("tx01: " + convertHTML($('#inn_tx01').html()));
	// console.log("tx02: " + convertHTML($('#inn_tx02').html()));

	$.ajax({
		url: new_backof20_api,
		cache: false,
		timeout: 60000,
		type: "post",
		data: {
			shop_code: _GET('shop_code').toUpperCase(),
			ro: $('#hide_follow_ro').val(),
			province_short: $('#hide_follow_province_short').val(),

			token: $('#hide_token').val(),
			uemail: $('#hide_uemail').val(),
			uemail_cc1: "",
			uemail_cc2: "waraporn.kaw",

			uemail_verify1: $('#hide_uemail_verify1').val(),
			uemail_verify2: $('#hide_uemail_verify2').val(),
			uemail_approve: $('#hide_uemail_approve').val(),

			tx01: convertHTML($('#inn_tx01').html()),
			tx02: convertHTML($('#inn_tx02').html())
		},
		success: function( follow_id ) {
			console.log("follow_id = " + follow_id);

			$('#hide_follow_id').val(follow_id);

			popupFollow("backof20", follow_id);
			// $('#btn_submit').click();
		},
		error: function() {
			modalAlert("ไม่สำเร็จ (api follow fail!!) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
		}
	});
}

function checkStockShopTimeHardCode() {
	var url = "updateStockShopJson.aspx?qrs=checkStockShopTimeHardCode&shop_code=" + _GET('shop_code');
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 

			if(data.length > 0){
				$('#btn_submit').prop('disabled', true);
				$('#btn_modal_follow').prop('disabled', true);

				var txt_alert = "สำนักงาน " + _GET('shop_code') + " ใช้เวลาทำการแบบพิเศษ (Hard Code)";
				txt_alert += "<br><br><b class='txt-blue-rec'>เปิดบริการ:</b> <span class='txt-orange'>" + data[0].time_open_weekday + "</span>";

				if(data[0].time_open_weekend != ""){
					txt_alert += "<br><span class='txt-orange' style='margin-left: 69px;'>" + data[0].time_open_weekend + "</span>";
				}

				if(data[0].day_off != ""){
					txt_alert += "<br><br><b class='txt-red'>ปิดทำการ: " + data[0].day_off + "</b>";
				}

				txt_alert += "<br><br><br><span style='border: 1px solid #b6d1e9;padding: 15px;border-radius: 5px;'>";
				txt_alert += "หากต้องการเปลี่ยนแปลงเวลาทำการ กรุณาติดต่อ <a href='mailto:support_pos@jasmine.com'>support_pos@jasmine.com</a></span>";

				$("#modal_alert .modal-dialog").removeClass("modal-sm");

				modalAlert(txt_alert);
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					$("#txtar_note_desc").focus();
					$("#modal_alert .modal-dialog").addClass("modal-sm");
				})
			}

		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}
</script> 
</body>
</html>
