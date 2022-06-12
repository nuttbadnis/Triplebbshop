<%@ Page Language="VB" AutoEventWireup="false" CodeFile="updateStockShopNote.aspx.vb" Inherits="updateStockShopNote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>หมายเหตุแสดงบนเว็บ 3BB [3BB Shop Back Office]</title>

	<link rel="shortcut icon" href="App_Inc/3bfav.ico" type="image/x-icon">
	<link rel="icon" href="App_Inc/3bfav.ico" type="image/x-icon">

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-147236441-1"></script>
    <script type="text/javascript" src="App_Inc/gtag_3bbback.js?id=UA-147236441-1&vs=12"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
	<script src="App_Inc/jquery-1.11.3.min.js"></script>

	<link rel="stylesheet" type="text/css" href="App_Inc/jquery-ui-1.11.4/jquery-ui.css"/>
	<!-- <script type="text/javascript" src="App_Inc/jquery-ui-1.11.4/jquery-ui.js"></script> -->
	<script type="text/javascript" src="App_Inc/jquery-ui-1.11.4.custom/jquery-ui-1.11.4.custom.js"></script> 

	<link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
	<script src="App_Inc/bootstrap/js/bootstrap.js"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=12" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<script src="App_Inc/var.js?vs=12"></script>
	<script src="App_Inc/panu.js?vs=12"></script>

	<style type="text/css">
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
	</style>

	<script type="text/javascript">
	$.datepicker.regional['th'] ={
		// changeYear: true,
		yearOffSet: 543,
		dateFormat: 'dd/mm/yy',
		dayNamesMin: ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'],   
		monthNames: ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม'],  
		prevText: 'ก่อนหน้า',
		nextText: 'ถัดไป',
		// defaultDate: '12/12/2560'
	};

	$.datepicker.setDefaults($.datepicker.regional['th']);

	$(document).ready(function() {
		$( "#txt_start_display" ).datepicker( $.datepicker.regional["th"] );
		$( "#txt_end_display" ).datepicker( $.datepicker.regional["th"] );
		$( "#txt_start_close" ).datepicker( $.datepicker.regional["th"] );
		$( "#txt_end_close" ).datepicker( $.datepicker.regional["th"] );

		$( "#txt_start_display" ).datepicker("setDate", new Date());
		$( "#txt_end_display" ).datepicker("setDate", new Date());
		$( "#txt_start_close" ).datepicker("setDate", new Date());
		$( "#txt_end_close" ).datepicker("setDate", new Date());
	});


	function setThDate(add_date){
		var today = new Date();
		today.setDate(today.getDate() + add_date)
		var dd = today.getDate();
		var mm = today.getMonth() + 1;
		var yyyy = today.getFullYear() + 543;

		if(dd<10){
			dd='0'+dd
		} 

		if(mm<10){
			mm='0'+mm
		} 

		return dd+'/'+mm+'/'+yyyy;
	}
    </script>
</head>
<body>
	<form method="post" runat="server">
		<input runat="server" id="hide_uemail" type="hidden">
		<input runat="server" id="hide_upermiss" type="hidden">
		<input runat="server" id="hide_get_no" type="hidden">
		<input runat="server" id="hide_token" xd="hide_token" type="hidden">

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
	</form>
	
	<form action="uploadStockShopNote.aspx" method="post" enctype="multipart/form-data" target="iframe_target" onSubmit="return uploadSubmit();">
		<iframe id="iframe_target" name="iframe_target" src="#" style="width:0;height:0;border:0px solid #fff;"></iframe>

		<ol class="breadcrumb">
			<li id="li_shopcode" >Shop</li>
			<li class="active">จัดการหมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB</li>
		</ol>

		<div class="container">
			<div class="form-center" id="note_box1">
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
							<a href="uploadStockShopPicture.aspx">
								<div class="arrow-box">
									<span class="glyphicon glyphicon-picture" aria-hidden="true"></span> อัพโหลดรูปภาพ
								</div>
							</a>
							<div class="arrow-box-active">
								<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> หมายเหตุแสดงบนเว็บ 3BB
							</div>
							<a href="manual.aspx" target="_blank">
								<div class="arrow-box-manual">
									<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> คู่มือการใช้งาน
								</div>
							</a>
						</div>
					</div>
				</div>
				<hr class="end-row">

				<table class="table table-striped" id="table_result"> 
					<thead> 
						<tr> 
							<th width="190">วันที่แสดงผล</th> 
							<th width="50" class="txt-red">ปิด</th> 
							<th width="190" class="txt-red">วันที่ปิดชั่วคราว</th> 
							<th style="max-width:650px;">หมายเหตุ แสดงบนเว็บ 3BB</th> 
							<th width="155"></th> 
							<th width="120"></th> 
						</tr> 
					</thead> 
					<tbody> 
						<tr> 
							<td>-</td> 
							<td>-</td> 
							<td>-</td> 
							<td>-</td> 
							<td>-</td>
						</tr> 
					</tbody> 
				</table>
				<hr class="end-row">
				<b style="font-size: 12px; color: #960000;">**หมายเหตุแจ้ง ปิดทำการชั่วคราวเต็มวัน ที่อนุมัติผ่านระบบ Follow Request จะไม่สามารถแก้ไขข้อมูลได้ เนื่องจากข้อมูลผ่านการตรวจสอบจากผู้มีอำนาจแล้ว</b>
			</div>
			<div class="form-center" id="note_box2" style="margin-top:20px;">
				<div class="row">
					<div class="col-xs-4">
						<div id="link_none" class="outer-arrow-box">
							<div class="arrow-box-3bb">
								<span id="head_title2"><span class='glyphicon glyphicon-plus' aria-hidden='true'></span> เพิ่มหมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB</span>
							</div>
						</div>
					</div>
					<div class="col-xs-8">
						<div id="prove_pending" style="display:none;">
							<a href="admin_approval.aspx" class="pending" title="3BB Shop Approval">
								<span class="glyphicon glyphicon-retweet" aria-hidden="true"></span> รอ MKT
							</a>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-3">
						<div class="input-group">
							<span class="input-group-addon txt-bold">กรณี</span>
							<select runat="server" id="sel_note_ex" class="form-control">
								<option value="">กรุณาเลือก</option>
							</select>
						</div>
					</div>
					<div class="col-xs-9">
						<span class="txt-blue" style="font-size:12px;">
							<!-- กรณีปิดทำการชั่วคราวเต็มวัน <b>ควรแจ้งล่วงหน้าไม่น้อยกว่า 3 วันทำการ</b> โดยระบบจะสร้างคำขอที่ระบบ Follow Request<br>เพื่ออนุมัติผ่าน ผู้จัดการจังหวัด, cluster และผู้อำนวยการภาค -->
						- กรณีปิดทำการชั่วคราวเต็มวัน <b>ควรแจ้งล่วงหน้าไม่น้อยกว่า 3 วันทำการ</b> โดยระบบจะสร้างคำขอออนุมัติผ่าน ผจก.จังหวัด, cluster และผอ.ภาค<br>
						- กรณีแจ้งหมายเหตุ ที่ไม่ปิดทำการเต็มวัน จะอนุมัติโดย Admin 3BB Shop Backoffice (ทีม MKT)
						</span>
					</div>
				</div>
				<div class="row group-ex-note" style="margin-top: 20px; display:none;">
					<div class="col-xs-8">
						<b class="txt-red">ข้อความตัวอย่าง</b><br>
						<div class="input-group" style="background: yellow; padding: 12px;">
							<span id="span_ex"></span>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-8">
						<div class="input-group" style="width: 100%;">
							<label>หมายเหตุแสดงบนเว็บ 3BB</label>
							<span class="txt-red group-ex-note" style="font-size:12px; display:none;"> *แก้ไขข้อความตัวอย่างใน <b class="txt-blue">[วงเล็บ]</b></span>
							<textarea id="txtar_note_desc" class="form-control" maxlength="500" rows="3" placeholder="ตัวอย่าง: เป็นศูนย์สำหรับประชาสัมพันธ์ และรับใบสมัครขอติดตั้งอินเตอร์เน็ต เพื่อให้ลูกค้ารับทราบข้อมูลข่าวสารของบริษัท ไม่มีการรับชำระค่าบริการ"></textarea>
							<span class="txt-red" style="font-size:12px;"> *จำนวนข้อความสูงสุด 500 ตัวอักษร</span>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-8">
						<div class="input-group" style="width: 100%;">
							<label>คำอธิบายชี้แจงผู้อนุมัติ </label>
							<textarea id="txtar_explain_desc" class="form-control" maxlength="500" rows="3" placeholder="ปิดก่อนเวลาเนื่องจากตรวจนับสต็อกสินค้าประจำปี / ปิดก่อนเวลาเนื่องจากจัดงานเลี้ยงสังสรรค์ประจำปี / เนื่องจากอินเตอร์เน็ตขัดข้องกำลังแก้ไข / เนื่องจากมีประกาศจากห้าง.."></textarea>
							<span class="txt-red" style="font-size:12px;"> *จำนวนข้อความสูงสุด 500 ตัวอักษร</span>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-4">
						<!-- <form action="uploadStockShopNote.aspx" method="post" enctype="multipart/form-data" target="iframe_target" onSubmit="return uploadSubmit();"> -->
							<div class="input-group">
								<span class="input-group-addon txt-bold">ไฟล์แนบ (ถ้ามี)</span>
								<input type="file" class="form-control up-file" name="file_attach" id="file_attach">
							</div>
							<input type="hidden" name="file_shop_code" id="file_shop_code">
							<input type="hidden" name="file_no_note" id="file_no_note">
							<input type="submit" name="submit" id="btn_upload" value="submit" style="display:none;">
							<!-- <iframe id="iframe_target" name="iframe_target" src="#" style="width:0;height:0;border:0px solid #fff;"></iframe> -->
						<!-- </form> -->
						<span class="txt-red" style="font-size:12px;">**ไฟล์ขนาดไม่เกิน 5MB และต้องเป็นไฟล์ pdf, jpg, png, zip, rar </span>
					</div>
					<div class="col-xs-8" id="present_file_attach"></div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-4">
						<div class="input-group">
							<span class="input-group-addon txt-bold">เริ่มแสดงผลวันที่</span>
							<input type="text" class="form-control txt-blue datepicker datedisplay" maxlength="10" placeholder="30/12/2559" id="txt_start_display" readonly>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="input-group">
							<span class="input-group-addon txt-bold">แสดงผลถึงวันที่</span>
							<input type="text" class="form-control txt-blue datepicker datedisplay" maxlength="10" placeholder="30/12/2559" id="txt_end_display" readonly>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input type="checkbox" id="chk_close_temp"> 
							</span>
							<span class="input-group-addon txt-bold">ปิดทำการชั่วคราวเต็มวัน 
								<a tabindex="0" role="button" data-container="body" data-toggle="popover" data-placement="right" data-content="เลือกปิดทำการชั่วคราวเต็มวัน และกำหนดช่วงวันที่ปิด <br><b class='txt-red'>เพื่อปิดไม่ให้ระบบเช็คเวลาเปิด/ปิด ในวันที่เลือก</b>">
									<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
								</a>
							</span>
						</div>
					</div>
				</div>
				<div class="row group-close-temp" style="display:none;">
					<div class="col-xs-12">
						<span class="txt-red" style="font-size:12px;"> **กรณีปิดทำการชั่วคราวเต็มวัน <b>ควรแจ้งล่วงหน้าไม่น้อยกว่า 3 วันทำการ</b> โดยระบบจะสร้างคำขอที่ระบบ Follow Request เพื่ออนุมัติผ่าน ผู้จัดการจังหวัด, cluster และผู้อำนวยการภาค</span>
					</div>
				</div>
				<hr class="end-row group-close-temp" style="display:none;">
				<div class="group-close-temp" style="display:none;">
					<div class="row">
						<div class="col-xs-4">
							<div class="input-group">
								<span class="input-group-addon txt-bold">เริ่มปิดวันที่</span>
								<input type="text" class="form-control txt-red datepicker dateclose" maxlength="10" placeholder="30/12/2559" id="txt_start_close" readonly>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="input-group">
								<span class="input-group-addon txt-bold">ปิดถึงวันที่</span>
								<input type="text" class="form-control txt-red datepicker dateclose" maxlength="10" placeholder="30/12/2559" id="txt_end_close" readonly>
							</div>
						</div>
					</div>
				</div>
				<hr class="line">
				<div class="form-inline">
					<input id="hide_no_note" type="hidden">
					<input id="hide_no_approve" type="hidden">
					<input id="hide_approve_status" type="hidden" value="999">
					<input id="hide_follow_id" type="hidden">

					<button type="button" class="btn btn-success" id="btn_new_submit">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> เพิ่มหมายเหตุ
					</button>
					<button type="button" class="btn btn-warning" id="btn_modal_follow" style="display:none;">
						<span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> สร้างคำขออนุมัติ
					</button>
					<button type="button" class="btn btn-success" id="btn_edit_submit" style="display:none;">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> แก้ไขหมายเหตุ
					</button>
					<button type="button" class="btn" id="btn_reset">
						<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span> เคลียร์ฟอร์ม
					</button>
					<!-- <a class="btn btn-primary" id="btn_skip" role="button">
						<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> เสร็จสิ้น
					</a> -->
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

<div id="modal_confirm" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">คุณต้องการลบข้อมูลนี้?</h4>
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-danger" id="btn_remove">ใช่</button>
				<button type="button" data-dismiss="modal" class="btn">ยกเลิก</button>
			</div>
		</div>
	</div>
</div>

<div id="modal_follow" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">สร้างคำขออนุมัติ ปิดทำการชั่วคราว ผ่านระบบ Follow Request</h4>
			</div>
			<div class="modal-body" style="font-size:13px;">
				<div class="panel panel-default">
					<div class="panel-heading">รายละเอียดคำขอ</div>
					<div class="panel-body">
						<div class="form-horizontal">
							<div class="space-br"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label">สาขาที่แจ้งปิด:</label>
								<span id="inn_select_shop" class="col-sm-9 control-label left-label"></span>
							</div>
							<div class="space-br"></div>
							<div class="form-group">
								<label class="col-sm-3 control-label">หมายเหตุแสดงบนเว็บ 3BB:</label>
								<span runat="server" id="inn_note_desc" class="col-sm-9 control-label left-label"></span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">คำอธิบายชี้แจงผู้อนุมัติ:</label>
								<span runat="server" id="inn_explain_desc" class="col-sm-9 control-label left-label"></span>
							</div>
							<div class="space-br"></div>
							<div class="form-group txt-recommend">
								<label class="col-sm-3 control-label">วันที่ขอปิดชั่วคราว:</label>
								<span runat="server" id="inn_mx01" class="col-sm-9 control-label left-label"></span>
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

<script type="text/javascript" src="App_Inc/external_followreq.js?vs=12_20210301"></script>

<script type="text/javascript">
var new_or_up = "";

$(document).ready(function() {
	var g_code = '?shop_code=' + _GET('shop_code');
	$('#link_out a').each(function(){
		this.href += g_code;
	})

	// var _href = $("a#link_follow").attr("href");
	// $('a#link_follow').attr("href", _href + '&shop_code=' + _GET('shop_code'));
	
	$("#li_shopcode").html(_GET('shop_code'));

	// $("#btn_skip").attr("href", "default.aspx?shop_code=" + _GET('shop_code'));
	$("#btn_skip").attr("href", "admin_approval.aspx");

	$('[data-toggle="popover"]').popover({html:true}); 

	$( "#txt_start_display" ).datepicker("setDate", null);
	$( "#txt_end_display" ).datepicker("setDate", null);
	$( "#txt_start_close" ).datepicker("setDate", null);
	$( "#txt_end_close" ).datepicker("setDate", null);

	resetForm();
	loadAllNotes();
	loadStockShopNoteEx();
});

$('body').on('click', function (e) {
    $('[data-toggle="popover"]').each(function () {
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
        }
    });
});

$('#btn_new_submit').click(function() {
	new_submit();
		// newStockShopNote();
});

$('#btn_edit_submit').click(function() {
	if(checkSubmit()){
		new_or_up = "up";
		uploadFileIframe();
	}
		// updateStockShopNote();
});

$('#btn_reset').click(function() {
	resetForm();
});

$('#chk_close_temp').change(function() {
	chk_close_checked();
});

function new_submit() {
	if(checkSubmit()){
		new_or_up = "new";
		uploadFileIframe();
	}
}

function chk_close_checked() {
	if($('#chk_close_temp').prop("checked") == true) {
		$('.group-close-temp').show();

		if(new_or_up == ""){
			$('#btn_modal_follow').show();
			$('#btn_new_submit').hide();
			// $('#btn_new_submit').prop('disabled', true);
		}
	}
	else {
		$('.group-close-temp').hide();

		$('#btn_modal_follow').hide();
		$('#btn_new_submit').show();
		// $('#btn_new_submit').prop('disabled', false);
	}
	
	if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN" ) {
		$('#btn_new_submit').show();
		// $('#btn_new_submit').prop('disabled', false);
	}
}

function checkProve(item) {
	if(item.approve_status == 0 && item.approve_delete == 0) {
		return "<div class='btn-group'>" +
					"<button type='button' class='btn btn-default btn-sm' onclick='redirectOpen(\"admin_approval.aspx\");' title='3BB Shop Approval'>" +
						"<span class='glyphicon glyphicon-retweet' aria-hidden='true'></span>" +
					"</button>" +
					"<button type='button' class='btn btn-default btn-sm' style='padding:3px 5px 1px 5px;' disabled>" +
						"รออนุมัติการแก้ไข" +
					"</button>" +
				"</div>";
	}
	if(item.approve_status == 0 && item.approve_delete == 1) {
		return "<div class='btn-group'>" +
					"<button type='button' class='btn btn-default btn-sm' onclick='redirectOpen(\"admin_approval.aspx\");' title='3BB Shop Approval'>" +
						"<span class='glyphicon glyphicon-retweet' aria-hidden='true'></span>" +
					"</button>" +
					"<button type='button' class='btn btn-default btn-sm' style='padding:3px 5px 1px 5px;' disabled>" +
						"รออนุมัติการลบ" +
					"</button>" +
				"</div>";
	}
	else
		return "";
}

function loadAllNotes() {
	var url = "updateStockShopJson.aspx?qrs=loadAllNotes&shop_code=" + _GET('shop_code');
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 

			if(data.length > 0){
				// $('#head_title').html(data[0].shop_code + " " + data[0].shop_name);
				if(data[0].shop_notes.length > 0){

					var tbody = "";
					$.each(data[0].shop_notes,function( i,item ) {
						var close_x = "";

						if(item.close_temp == 1){
							close_x = "<span class='glyphicon glyphicon-remove-circle' aria-hidden='true'>";
						}

						tbody += "<tr>"
						tbody += "<td>" + item.start_display + " - " + item.end_display + "</td>"
						tbody += "<td class='txt-red'>" + close_x + "</span></td>"
						tbody += "<td class='txt-red'>" + item.start_close + " - " + item.end_close + "</td>"
						tbody += "<td>" + item.note_desc + "</td>"
						tbody += "<td>" + checkProve(item) + "</td>"
						tbody += "<td style='text-align: right;'>"
						tbody += "	<div class='btn-group'>"

						if (checkFollowID(item.follow_id) && $('#hide_upermiss').val() == "BACKOFFICE_ADMIN") {
							tbody += "		<a href='" + follow_link + "/update_backof10.aspx?request_id=" + item.follow_id + "' target='_blank' class='btn btn-default btn-sm' title='รายะเอียดคำขอ Follow Request'>"
							tbody += "			<span class='glyphicon glyphicon-new-window' aria-hidden='true' style='color: #FF5722;'></span>"
							tbody += "		</a>"
							tbody += "		<button type='button' class='btn btn-default btn-sm' onclick='loadStockShopNote(" + item.No + ");' title='แก้ไข'>"
							tbody += "			<span class='glyphicon glyphicon-edit' aria-hidden='true'></span>"
							tbody += "		</button>"
						}
						else if (checkFollowID(item.follow_id)) {
							tbody += "		<a href='" + follow_link + "/update_backof10.aspx?request_id=" + item.follow_id + "' target='_blank' class='btn btn-default btn-sm' title='รายะเอียดคำขอ Follow Request'>"
							tbody += "			<span class='glyphicon glyphicon-new-window' aria-hidden='true' style='color: #FF5722;'></span>"
							tbody += "		</a>"
						}
						else {
							tbody += "		<button type='button' class='btn btn-default btn-sm' onclick='loadStockShopNote(" + item.No + ");' title='แก้ไข'>"
							tbody += "			<span class='glyphicon glyphicon-edit' aria-hidden='true'></span>"
							tbody += "		</button>"
						}

						tbody += "		<button type='button' class='btn btn-default btn-sm' onclick='removeConfirm(" + item.No + ");' title='ลบ'>"
						tbody += "			<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>"
						tbody += "		</button>"
						tbody += "	</div>"
						tbody += "</td>"
						tbody += "</tr>"
					});

					$('#table_result tbody').html(tbody);
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
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

function loadStockShopNote(no_note) {
	var url = "updateStockShopJson.aspx?qrs=loadStockShopNote&no_note=" + no_note;
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) {
			console.log(data[0].close_temp);
			$('#chk_close_temp').prop('checked', true);

			if(data.length > 0){

				if(data[0].approve_status == 0){
					loadStockShopNoteProve(no_note);
				}
				else{
					resetForm();

					if(data[0].close_temp == 1){
						$('#txt_start_close').val(data[0].start_close);
						$('#txt_end_close').val(data[0].end_close);
						$('#chk_close_temp').prop('checked', true);

						$("#txt_end_close").datepicker( "option", "minDate", $('#txt_start_close').val());
						$("#txt_start_close").datepicker( "option", "maxDate", $('#txt_end_close').val());
					}
					$('#hide_no_note').val(data[0].no_note);
					$('#txt_start_display').val(data[0].start_display);
					$('#txt_end_display').val(data[0].end_display);

					$('#txtar_note_desc').val(data[0].note_desc);
					$('#txtar_explain_desc').val(data[0].explain_desc);
					$('#sel_note_ex').val(data[0].note_ex_id);

					$("#txt_end_display").datepicker( "option", "minDate", $('#txt_start_display').val());
					$("#txt_start_display").datepicker( "option", "maxDate", $('#txt_end_display').val());

					var txt_file = "<button type='button' class='btn' disabled>ไม่มีไฟล์แนบ</button>";
					if(data[0].upload_file != "") {
						txt_file = "<a class='btn btn-info' target='_blank' title='คลืกดูไฟล์แนบ' href='openfile.aspx?path=" + data[0].upload_file_path + "&file=" + data[0].upload_file + "'>เปิดไฟล์แนบ</a> "
					}
					$('#present_file_attach').html(txt_file);

					chk_close_checked();
					editForm();
					$('html, body').animate({scrollTop:$('#note_box2').position().top}, 'slow');
				}
			}
			else{
				modalAlert("การทำงานผิดพลาด <br>ไม่มี no_note = " + no_note);
			}
		},
		error: function(x, t, m) {
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

function loadStockShopNoteProve(no_note,no_approve = 0) {
	var url = "updateStockShopJson.aspx?qrs=loadStockShopNoteProve&no_note=" + no_note;

	if(no_approve != 0)
		 url = "updateStockShopJson.aspx?qrs=loadStockShopNoteProve&no_approve=" + no_approve;

	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) {
			console.log(data);

			if(data.length > 0){
				resetForm();

				$('#hide_approve_status').val(data[0].approve_status);
				$('#prove_pending').show();

				if(data[0].close_temp == 1){
					$('#txt_start_close').val(data[0].start_close);
					$('#txt_end_close').val(data[0].end_close);
					$('#chk_close_temp').prop('checked', true);

					$("#txt_end_close").datepicker( "option", "minDate", $('#txt_start_close').val());
					$("#txt_start_close").datepicker( "option", "maxDate", $('#txt_end_close').val());
				}
				$('#hide_no_note').val(data[0].no_note);
				$('#hide_no_approve').val(data[0].no_approve);

				$('#txt_start_display').val(data[0].start_display);
				$('#txt_end_display').val(data[0].end_display);

				$('#txtar_note_desc').val(data[0].note_desc);
				$('#txtar_explain_desc').val(data[0].explain_desc);
				$('#sel_note_ex').val(data[0].note_ex_id);

				$("#txt_end_display").datepicker( "option", "minDate", $('#txt_start_display').val());
				$("#txt_start_display").datepicker( "option", "maxDate", $('#txt_end_display').val());

				var txt_file = "<button type='button' class='btn' disabled>ไม่มีไฟล์แนบ</button>";
				if(data[0].upload_file != "") {
					txt_file = "<a class='btn btn-info' target='_blank' title='คลืกดูไฟล์แนบ' href='openfile.aspx?path=" + data[0].upload_file_path + "&file=" + data[0].upload_file + "'>เปิดไฟล์แนบ</a> "
				}
				$('#present_file_attach').html(txt_file);

				chk_close_checked();
				editForm();
				$('html, body').animate({scrollTop:$('#note_box2').position().top}, 'slow');
			}
			else{
				var mmalert = "การทำงานผิดพลาด <br>ไม่มี no_note = " + no_note;

				if(no_approve != 0)
					mmalert = "การทำงานผิดพลาด <br>ไม่มี no_approve = " + no_approve;

				modalAlert(mmalert);
			}
		},
		error: function(x, t, m) {
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

function newStockShopNote(upload_file){
	var close_temp = 0;
	var start_close = "";
	var end_close = "";

	if($('#chk_close_temp').prop("checked") == true) {
		close_temp  = 1;
		start_close = $("#txt_start_close").val();
		end_close = $("#txt_end_close").val();
	}

	$.ajax({
		url: "updateStockShopJson.aspx?qrs=newStockShopNote",
		cache: false,
		type: "post",
		timeout: 60000,
		data: { 
			shop_code: _GET('shop_code'), 
			uemail: $("#hide_uemail").val(),
			upermiss: $('#hide_upermiss').val(),

			note_desc: $("#txtar_note_desc").val(), 
			explain_desc: $("#txtar_explain_desc").val(), 
			note_ex_id: $("#sel_note_ex").val(), 

			start_display: $("#txt_start_display").val(), 
			end_display: $("#txt_end_display").val(), 
			close_temp: close_temp, 
			start_close: start_close, 
			end_close: end_close,
			upload_file: upload_file,

			follow_id: $('#hide_follow_id').val()
		},
		success: function( res ) {
			// console.log(res);
			if(res != 0) {
				redirectOpen("admin_approval.aspx");
			}
		},
		error: function(x, t, m) {
			modalAlert("ไม่สำเร็จ (insert error) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
		}
	});
}

function updateStockShopNote(upload_file){
	var close_temp = 0;
	var start_close = "";
	var end_close = "";
	if($('#chk_close_temp').prop("checked") == true) {
		close_temp  = 1;
		start_close = $("#txt_start_close").val();
		end_close = $("#txt_end_close").val();
	}

	$.ajax({
		url: "updateStockShopJson.aspx?qrs=updateStockShopNote",
		cache: false,
		type: "post",
		timeout: 60000,
		data: { 
			uemail: $("#hide_uemail").val(),
			upermiss: $('#hide_upermiss').val(),
			no_note: $("#hide_no_note").val(),
			no_approve: $("#hide_no_approve").val(),
			shop_code: _GET('shop_code'), 

			note_desc: $("#txtar_note_desc").val(), 
			explain_desc: $("#txtar_explain_desc").val(), 
			note_ex_id: $("#sel_note_ex").val(), 

			start_display: $("#txt_start_display").val(), 
			end_display: $("#txt_end_display").val(), 
			close_temp: close_temp, 
			start_close: start_close, 
			end_close: end_close,
			upload_file: upload_file
		},
		success: function( res ) {
			// console.log(res);
			if(res != 0) {
				if($('#hide_approve_status').val() == 0 && $('#hide_upermiss').val() == "BACKOFFICE_ADMIN"){
					modalAlert('บันทึกและอนุมัติแล้ว');

					loadAllNotes();
					resetForm();
					chk_close_checked();
					$('html, body').animate({scrollTop:$('#note_box1').position().top}, 'slow');
				}
				else {
					redirectOpen("admin_approval.aspx");
				}
			}
		},
		error: function(x, t, m) {
			modalAlert("ไม่สำเร็จ (update error) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
		}
	});
}

function removeStockShopNote(no){
	$.ajax({
		url: "updateStockShopJson.aspx?qrs=removeStockShopNote",
		cache: false,
		type: "post",
		timeout: 60000,
		data: { 
			shop_code: _GET('shop_code'), 
			uemail: $("#hide_uemail").val(),
			upermiss: $('#hide_upermiss').val(),
			no_note: no
		},
		success: function( res ) {
			if(res != 0) {
				// loadAllNotes();
				// resetForm();
				// $('html, body').animate({scrollTop:$('#note_box1').position().top}, 'slow');
				
				redirectOpen("admin_approval.aspx");
			}
		},
		error: function(x, t, m) {
			modalAlert('ไม่สำเร็จ');
		}
	});
}

function removeConfirm(no){
	$('#modal_confirm').modal("show");
	$('#btn_remove').replaceWith("<button type='button' data-dismiss='modal' class='btn btn-danger' id='btn_remove' onclick='removeStockShopNote(" + no + ");'>ใช่</button>");
}

function checkSubmit() {
	checkNoteHaveURL();

	var $el1 = $("#txt_start_display");
	var $el2 = $("#txt_end_display");

	var $el31 = $("#txtar_note_desc");
	var $el32 = $("#txtar_explain_desc");
	var $el33 = $("#sel_note_ex");

	var $el4 = $("#txt_start_close");
	var $el5 = $("#txt_end_close");

	if( $el33.val() == "" ){
		modalAlert("กรุณาเลือก กรณีที่ต้องการปิดทำการ");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el33.focus();
		})
		return false;
	}
	if( $el31.val() == "" ){
		modalAlert("กรุณากรอก หมายเหตุแสดงบนเว็บ 3BB");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el31.focus();
		})
		return false;
	}
	if( $el32.val() == "" ){
		modalAlert("กรุณากรอก คำอธิบายชี้แจงผู้อนุมัติ");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el32.focus();
		})
		return false;
	}
	if( $el1.val() == "" || !validateDate($el1.val()) ){
		modalAlert("กรุณาระบุวันที่ให้ถูกต้อง");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el1.focus();
		})
		return false;
	}
	if( $el2.val() == "" || !validateDate($el2.val()) ){
		modalAlert("กรุณาระบุวันที่ให้ถูกต้อง");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el2.focus();
		})
		return false;
	}
	if($('#chk_close_temp').prop("checked") == true) {
		if( $el4.val() == "" || !validateDate($el4.val()) ){
			modalAlert("กรุณาระบุวันที่ให้ถูกต้อง");
			$('#modal_alert').on('hidden.bs.modal', function (e) {
				$el4.focus();
			})
			return false;
		}
		if( $el5.val() == "" || !validateDate($el5.val()) ){
			modalAlert("กรุณาระบุวันที่ให้ถูกต้อง");
			$('#modal_alert').on('hidden.bs.modal', function (e) {
				$el5.focus();
			})
			return false;
		}
	}

	return true;
}

function resetForm() {
	new_or_up = "";

	// $("#txt_end_close").datepicker( "option", "minDate", null);
	// $("#txt_start_close").datepicker( "option", "maxDate", null);
	// $("#txt_end_display").datepicker( "option", "minDate", null);
	// $("#txt_start_display").datepicker( "option", "maxDate", null);

	var start_date = setThDate(0);
	$("#txt_end_close").datepicker( "option", "minDate", start_date);
	$("#txt_start_close").datepicker( "option", "minDate", start_date);
	$("#txt_end_display").datepicker( "option", "minDate", start_date);
	$("#txt_start_display").datepicker( "option", "minDate", start_date);

	$('#prove_pending').hide();
	$('#chk_close_temp').prop('checked', false);

	$('#hide_no_note').val("");
	$('#hide_no_approve').val("");
	$('#hide_approve_status').val("999");

	$('#txt_start_display').val("");
	$('#txt_end_display').val("");

	$('#txtar_note_desc').val("");
	$('#txtar_explain_desc').val("");
	$('#sel_note_ex').val("");

	$('#txt_start_close').val("");
	$('#txt_end_close').val("");

	$('#file_attach').val("");
	$('#present_file_attach').html("");

	$('#span_ex').html("");
	$('.group-ex-note').hide();
	$('.group-close-temp').hide();

	$('#head_title2').html("<span class='glyphicon glyphicon-plus' aria-hidden='true'></span> เพิ่มหมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB");
	$('#btn_new_submit').show();
	$('#btn_edit_submit').hide();

	$('#btn_modal_follow').hide();
	$('#hide_follow_id').val("");
	$('#hide_uemail_verify1').val("");
	$('#hide_uemail_verify2').val("");
	$('#hide_uemail_approve').val("");

	$('#btn_new_submit').prop('disabled', false);
	$('#chk_close_temp').prop('disabled', false);
	$('#txt_start_close').prop('disabled', false);
	$('#txt_end_close').prop('disabled', false);
}

function editForm() {
	new_or_up = "up";

	$('#head_title2').html("<span class='glyphicon glyphicon-edit' aria-hidden='true'></span> แก้ไขหมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB");
	$('#btn_edit_submit').show();
	$('#btn_new_submit').hide();

	$('#btn_modal_follow').hide();
	$('#chk_close_temp').prop('disabled', true);
	$('#txt_start_close').prop('disabled', true);
	$('#txt_end_close').prop('disabled', true);
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


$('#txt_start_display').datepicker({
	onClose: function(selectedDate, inst) {
		console.log('display minDate = ' + selectedDate);

		if(selectedDate != "")
			$("#txt_end_display").datepicker( "option", "minDate", selectedDate);
	}
});

$('#txt_end_display').datepicker({
	onClose: function(selectedDate, inst) {
		console.log('display maxDate = ' + selectedDate);

		if(selectedDate != "")
			$("#txt_start_display").datepicker( "option", "maxDate", selectedDate);
	}
});

$('#txt_start_close').datepicker({
	onClose: function(selectedDate, inst) {
		console.log('close minDate = ' + selectedDate);

		if(selectedDate != "")
			$("#txt_end_close").datepicker( "option", "minDate", selectedDate);
	}
});

$('#txt_end_close').datepicker({
	onClose: function(selectedDate, inst) {
		console.log('close maxDate = ' + selectedDate);

		if(selectedDate != "")
			$("#txt_start_close").datepicker( "option", "maxDate", selectedDate);
	}
});

function redirectOpen(url){
	window.location.href = url;
}


//********************************* uploadfile ด้วย iframe ส่งไป uploadStockShopNote.aspx *********************************

function uploadFileIframe() {
	$('#file_shop_code').val(_GET('shop_code'));
	$('#file_no_note').val($('#hide_no_note').val());
	$('#btn_upload').click();

	//เมื่ออัพโหลดเสร็จ uploadStockShopNote.aspx จะเส่งค่ากลับมาที่ uploadResult()
}

function uploadSubmit() {
	$('#page_loading').fadeIn();
	console.log('upload start..');
}

function uploadResult(result, filename, error){
	console.log('upload end..');
	console.log("uploadResult = " + result + " filename = " + filename + " error = " + error);

	$('#file_shop_code').val("");
	$('#file_no_note').val("");

	if(error == 0){
		if(new_or_up == "new"){
			newStockShopNote(filename);
		}
		else if(new_or_up == "up"){
			updateStockShopNote(filename);
		}
	}
	else {
		modalAlert("ไม่สำเร็จ (upload error) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
	}
}

$('.up-file').change(function() {
	var ext = this.value.split('.').pop().toLowerCase();
	console.log("ext="+ext);

	if (ext != "pdf" && ext != "png" && ext != "jpg" && ext != "jpeg" && ext != "jpg" && ext != "zip" && ext != "rar") {
		modalAlert("กรุณาตรวจสอบประเภทไฟล์ <br>อนุญาติไฟล์ pdf, jpg, png, zip, rar เท่านั้น");
		this.value = '';
	} 
	else {
		var maxsize = 1024*5;
		var filesize = this.files[0].size/1024;
		
		if(filesize > maxsize){
			modalAlert("ขนาดไฟล์สูงสุดต้องไม่เกิน 5MB");
			this.value = '';
		}
		else {
			$('#present_file_attach').html("");
		}
	}
});

//********************************* uploadfile ด้วย iframe uploadStockShopNote.aspx *********************************

function loadStockShopNoteEx() {
	var $el = $('#sel_note_ex');
	$el.empty();
	$el.append($("<option></option>")
		.attr("value", "").text("กำลังโหลด"));

	$.getJSON('updateStockShopJson.aspx?qrs=loadStockShopNoteEx', function(data) {
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "").text("กรุณาเลือก"));

		$.each(data,function( i,item ) {
			$el.append($("<option></option>")
				.attr("value", item.note_ex_id).text(item.note_ex_title));
		});

		readyGo();
	});
}

$('#sel_note_ex').change(function() {
	selectStockShopNoteEx($('#sel_note_ex').val());
});

function selectStockShopNoteEx(id) {
	$('#chk_close_temp').prop('disabled', true);
	$('#chk_close_temp').prop('checked', false);

	if(id != ""){
		var url = "updateStockShopJson.aspx?qrs=loadStockShopNoteEx&note_ex_id=" + id;
		console.log(url);

		$.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 60000,
			success: function( data ) { 

				if(data.length > 0){
					$('#txtar_note_desc').val(data[0].note_ex_textarea);
					$('#span_ex').html(data[0].note_ex_example);
					$('.group-ex-note').show();

					if(data[0].note_close_shop == 1){
						$('#chk_close_temp').prop('checked', true);
					}
					else if(data[0].note_close_shop == 8){
						$('#chk_close_temp').prop('disabled', true);
					}
					else if(data[0].note_close_shop == 0){
						$('#chk_close_temp').prop('disabled', false);
					}
				}
				else{
					modalAlert("ไม่สำเร็จ (load ex error) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
				}

				chk_close_checked();
			},
			error: function(x, t, m) {
				console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

				ajaxError();
			}
		});
	}
	else {
		$('#txtar_note_desc').val("");
		$('#span_ex').html("");
		$('.group-ex-note').hide();

		$('#chk_close_temp').prop('disabled', false);
		$('#chk_close_temp').prop('checked', false);
		chk_close_checked();
	}
}

function readyGo(){
	var get_no_approve = $('#hide_get_no').val();
	if(get_no_approve != null && get_no_approve != "" && get_no_approve != 0) {
		loadStockShopNoteProve(0,get_no_approve);
	}
}

$('#btn_modal_follow').click(function() {
	$('#hide_uemail_verify1').val("");
	$('#hide_uemail_verify2').val("");
	$('#hide_uemail_approve').val("");

	if(checkSubmit()){
		$('#inn_select_shop').html(_GET('shop_code').toUpperCase());
		$('#inn_note_desc').html($("#txtar_note_desc").val());
		$('#inn_explain_desc').html($("#txtar_explain_desc").val());
		$('#inn_mx01').html($("#txt_start_close").val() + " - " + $("#txt_end_close").val());

		$('#modal_follow').modal("show");
		loadRoProvince();
	}
});

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
	console.log("api: " + new_backof10_api);

	// console.log("shop_code: " + _GET('shop_code').toUpperCase());
	// console.log("ro: " + $('#hide_follow_ro').val());
	// console.log("province_short: " + $('#hide_follow_province_short').val());

	// console.log("token: " + $('#hide_token').val());
	// console.log("uemail: " + $('#hide_uemail').val());
	// console.log("uemail_cc2: " + "waraporn.kaw");

	// console.log("uemail_verify1: " + $('#hide_uemail_verify1').val());
	// console.log("uemail_verify2: " + $('#hide_uemail_verify2').val());
	// console.log("uemail_approve: " + $('#hide_uemail_approve').val());

	// console.log("note_desc: " + $('#inn_note_desc').html());
	// console.log("explain_desc: " + $('#inn_explain_desc').html());
	// console.log("mx01: " + $('#inn_mx01').html());

	// console.log("dx01: " + $('#txt_start_display').val());
	// console.log("dx02: " + $('#txt_end_display').val());
	// console.log("dx03: " + $('#txt_start_close').val());
	// console.log("dx04: " + $('#txt_end_close').val());

	$.ajax({
		url: new_backof10_api,
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

			note_desc: $('#inn_note_desc').html(),
			explain_desc: $('#inn_explain_desc').html(),
			mx01: $('#inn_mx01').html(),

			dx01: $("#txt_start_display").val(), 
			dx02: $("#txt_end_display").val(), 
			dx03: $("#txt_start_close").val(), 
			dx04: $("#txt_end_close").val() 
		},
		success: function( follow_id ) {
			console.log("follow_id = " + follow_id);

			$('#hide_follow_id').val(follow_id);

			popupFollow("backof10", follow_id);
			new_submit();
		},
		error: function() {
			modalAlert("ไม่สำเร็จ (api follow fail!!) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
		}
	});
}

function checkFollowID(follow_id) {
	if(follow_id.toLowerCase() != "null") {
		return false;
	}
	else if(checkIsEmpty(follow_id)) {
		return false;
	}
	else  {
		return true;
	}
	
}

$("#txtar_note_desc").click(function(){
	if($("#sel_note_ex").val() == "") {
		modalAlert("กรุณาเลือก กรณีที่ต้องการปิดทำการ");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$("#sel_note_ex").focus();
		})
	}
});

$("#txtar_note_desc").focusout(function(){
	checkNoteHaveURL();
});

function checkNoteHaveURL() {
	var str_note_desc = $("#txtar_note_desc").val();

	if(new RegExp("((http|https)://)?([a-zA-Z0-9_]+:[a-zA-Z0-9_]+@)?([a-zA-Z0-9.-]+\\.[A-Za-z]{2,4})(:[0-9]+)?(/.*)?").test(str_note_desc)) {
	  var regxURL = new RegExp(
	  	"(^|[ \t\r\n])((http|https):(([A-Za-z0-9$_.+!*(),;/?:@&~=-])|%[A-Fa-f0-9]{2}){2,}(#([a-zA-Z0-9][a-zA-Z0-9$_.+!*(),;/?:@&~=%-]*))?([A-Za-z0-9$_+!*();/?:~-]))"
	  	,"g"
	  	);

	  var array_url = [];
	  array_url = str_note_desc.match(regxURL);

	  if(array_url != null) {
	  	urlValidate(array_url);
	  }
	}

  // if(new RegExp("([a-zA-Z0-9]+://)?([a-zA-Z0-9_]+:[a-zA-Z0-9_]+@)?([a-zA-Z0-9.-]+\\.[A-Za-z]{2,4})(:[0-9]+)?(/.*)?").test(str_note_desc)) {
  // 	alert("have url");
  // }
}


function urlValidate(array_url) {
	var url = "updateStockShopJson.aspx?qrs=loadStockShopNoteURL";
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			var url_validate = [];

			$.each(data,function( i,item ) {
				url_validate.push(item.url_validate);
			});

			console.log('url_validate');
			console.log(url_validate);

			$.each(array_url, function( index, value ) {
				var url_value = value.trim();

				if(url_validate.includes(url_value) == false) {
					var txt_alert = "<b class='txt-red'>" + url_value + "</b>";
					txt_alert += "<br> มีลิงค์ (URL) ที่ไม่ได้รับการอนุญาติอยู่ในหมายเหตุ";
					txt_alert += "<br><br> ลิงค์ที่อนุญาติมีดังนี้";

					$.each(data,function( i,item ) {
						txt_alert += "<br>" + item.tag_a_replace;
					});
					// txt_alert += "<br><a href='https://www.3bb.co.th/3bb/onlinesubscription'>https://www.3bb.co.th/3bb/onlinesubscription</a>";
					// txt_alert += "<br><a href='https://www.3bb.co.th/pay/channel'>https://www.3bb.co.th/pay/channel</a>";

					if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN" ) {
						txt_alert += "<br><br><br><span style='border: 1px solid #b6d1e9;padding: 15px;border-radius: 5px;'>";
						txt_alert += "สามารถเพิ่ม URL ได้ที่ <a class='btn btn-sm btn-primary' href='admin_tools.aspx'>Admin tools</a> << คลิก</span>";
					}

					$("#modal_alert .modal-dialog").removeClass("modal-sm");

					modalAlert(txt_alert);
					$('#modal_alert').on('hidden.bs.modal', function (e) {
						$("#txtar_note_desc").focus();
						$("#modal_alert .modal-dialog").addClass("modal-sm");
					})

        			return false; // breaks loop
        		}
        	});
		},
		error: function(x, t, m) {
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

			ajaxError();
		}
	});
}

// function checkURL2(array_url) {
// 	var url3bb = ["https://www.3bb.co.th/3bb/onlinesubscription", "https://www.3bb.co.th/pay/channel"];

// 	$.each(array_url, function( index, value ) {
// 		var url = value.trim();

// 		if(url3bb.includes(url) == false) {
// 			var txt_alert = "<b class='txt-red'>" + url + "</b>";
// 			txt_alert += "<br> มีลิงค์ (URL) ที่ไม่ได้รับการอนุญาติอยู่ในหมายเหตุ";
// 			txt_alert += "<br><br> ลิงค์ที่อนุญาติมีดังนี้";
// 			txt_alert += "<br><a href='https://www.3bb.co.th/3bb/onlinesubscription'>https://www.3bb.co.th/3bb/onlinesubscription</a>";
// 			txt_alert += "<br><a href='https://www.3bb.co.th/pay/channel'>https://www.3bb.co.th/pay/channel</a>";

// 			$("#modal_alert .modal-dialog").removeClass("modal-sm");

// 			modalAlert(txt_alert, "nm");
// 			$('#modal_alert').on('hidden.bs.modal', function (e) {
// 				$("#txtar_note_desc").val(temp_note_desc);
// 				$("#txtar_note_desc").focus();
// 				$("#modal_alert .modal-dialog").addClass("modal-sm");
// 			})

//         	return false; // breaks loop
//     	}
// 	});
// }
</script> 
</body>
</html>
