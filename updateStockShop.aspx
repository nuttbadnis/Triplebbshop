<%@ Page Language="VB" AutoEventWireup="false" CodeFile="updateStockShop.aspx.vb" Inherits="updateStockShop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>ข้อมูลทั่วไป [3BB Shop Back Office]</title>

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
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<script src="App_Inc/var.js?vs=12"></script>
	<script src="App_Inc/panu.js?vs=12"></script>

  	<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyCyyKlfSYYOjD6F36Nmf3F_q68kmrBfhtA&libraries=places&sensor=false"></script> 
	<script src="App_Inc/gettinglatlng.js"></script>

	<style type="text/css">
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
</head>
<body>
	<form method="post" runat="server">
		<input runat="server" id="hide_uemail" type="hidden">
		<input runat="server" id="hide_upermiss" type="hidden">
		<input runat="server" id="hide_no_shopStock" type="hidden">
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
						<div id="link_none" class="outer-arrow-box">
							<div class="arrow-box arrow-first">
								<span class="glyphicon glyphicon-file" aria-hidden="true"></span> ข้อมูลทั่วไป
							</div>
							<div class="arrow-box arrow-none">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span> ข้อมูลเวลาเปิด-ปิด
							</div>
							<div class="arrow-box arrow-none">
									<span class="glyphicon glyphicon-picture" aria-hidden="true"></span> อัพโหลดรูปภาพ
							</div>
							<div class="arrow-box arrow-none">
									<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> หมายเหตุแสดงบนเว็บ 3BB
							</div>
						</div>
						<div id="link_out" class="outer-arrow-box" style="display:none;">
							<div class="arrow-box-active">
								<span class="glyphicon glyphicon-file" aria-hidden="true"></span> ข้อมูลทั่วไป
							</div>
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
				<div class="row">
					<div class="col-xs-3">
						<div class="input-group">
							<span class="input-group-addon txt-bold">รหัสสำนักงาน<b class="valid">*</b></span>
							<input runat="server" id="txt_shop_code" type="text" class="form-control" placeholder="รหัสสาขา" maxlength="5" style="text-transform:uppercase">
							<span id="code_success" class="glyphicon glyphicon-ok form-control-feedback feedback-success" aria-hidden="true"></span>
							<span id="code_error" class="glyphicon glyphicon-remove form-control-feedback feedback-error" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="input-group">
							<span class="input-group-addon txt-bold">ชื่อสำนักงาน<b class="valid">*</b></span>
							<input runat="server" id="txt_shop_name" type="text" class="form-control" placeholder="ชื่อสาขา">
						</div>
					</div>
					<div class="col-xs-3">
						<div class="input-group">
							<span class="input-group-addon txt-bold">ประเภท<b class="valid">*</b>
								<a tabindex="0" role="button" data-container="body" data-toggle="popover" data-placement="bottom" data-content="หากเลือกประเภทที่มี *** <br>จะไม่เช็คเวลาเปิดปิด และจะไม่แสดงผลที่หน้าเว็บ 3BB โดยอัตโนมัติ">
									<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
								</a>
							</span>
							<select runat="server" id="sel_type" class="form-control">
								<option value="">เลือกประเภท</option>
							</select>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-4">
						<div class="input-group">
							<span class="input-group-addon txt-bold">จังหวัด<b class="valid">*</b></span>
							<select runat="server" id="sel_province" class="form-control">
								<option value="">เลือกจังหวัด</option>
							</select>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="input-group">
							<span class="input-group-addon txt-bold">เขต/อำเภอ<!-- <b class="valid">*</b> -->
								<a tabindex="0" role="button" data-container="body" data-toggle="popover" data-placement="bottom" data-content="เลือกได้เฉพาะกรุงเทพฯ และปริมณฑล">
									<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
								</a>
							</span>
							<select runat="server" id="sel_district" class="form-control" disabled>
								<option value="">เลือกเขต/อำเภอ</option>
							</select>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="input-group">
							<span class="input-group-addon txt-bold">พื้นที่<b class="valid">*</b></span>
							<select runat="server" id="sel_place" class="form-control">
								<option value="0">เลือกพื้นที่</option>
							</select>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-8">
						<div class="input-group">
							<span class="input-group-addon txt-bold">เบอร์ติดต่อ</span>
							<input runat="server" id="txt_tel" type="text" class="form-control" placeholder="โทรศัพท์">
						</div>
					</div>
					<div class="col-xs-4">
						<div class="input-group">
							<span class="input-group-addon txt-bold">Fax.</span>
							<input runat="server" id="txt_fax" type="text" class="form-control" placeholder="โทรสาร">
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-5">
						<div class="input-group" style="width: 100%;">
							<label>สถานที่ตั้ง</label>
							<textarea runat="server" id="txtar_location" class="form-control" rows="2" placeholder="ตัวอย่าง: ชั้น 1 ตรงข้ามกับธนาคารกรุงไทย ใกล้ประตูทางออกด้านหลัง"></textarea>
						</div>
					</div>
					<div class="col-xs-7">
						<div class="input-group" style="width: 100%;">
							<label>ที่อยู่</label>
							<textarea runat="server" id="txtar_address" class="form-control" rows="2" placeholder="ตัวอย่าง: 208 ม.3 ดอนจั่น ถ.ซุปเปอร์ไฮเวย์ ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50100"></textarea>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-5">
						<div class="input-group" style="width: 100%;">
							<label>คำค้น</label>
							<textarea runat="server" id="txtar_keyword" class="form-control" rows="2" placeholder="ตัวอย่าง: big c,bigc,บิ๊กซี,phuket,ภูเก็ต"></textarea>
						</div>
					</div>
					<div class="col-xs-7">
						<div class="input-group" style="width: 100%;">
							<label>ข้อความแจ้งภายใน</label>
							<textarea runat="server" id="txtar_comment" class="form-control" rows="2" placeholder="ตัวอย่าง: set router ได้ หลัง 20.00 น. (มีเครื่องเดียว เพราะไว้รับชำระเงิน)"></textarea>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-4">
						<div class="input-group">
							<span class="input-group-addon txt-bold">Latitude<b class="valid">*</b></span>
							<input runat="server" id="txt_lat" type="text" class="form-control" placeholder="latitude">
						</div>
					</div>
					<div class="col-xs-4">
						<div class="input-group">
							<span class="input-group-addon txt-bold">Longitude<b class="valid">*</b></span>
							<input runat="server" id="txt_lng" type="text" class="form-control" placeholder="longitude">
						</div>
					</div>
					<div class="col-xs-4">
						<a class="btn btn-default btn-info" href="#" data-toggle="modal" data-target="#modal_map">
							<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> ระบุพิกัดด้วยแผนที่
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<span class="text-remark" style="margin: 5px 0px 0px 0px;"><b class="valid">*** Service Center, Moblie Unit, Event และ Shop อื่นๆ ไม่ต้องระบุ Latitude Longitude</b></span>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-3">
						<div class="input-group">
							<span class="input-group-addon txt-bold txt-lineapp">Line ID</span>
							<input runat="server" id="txt_line_id" type="text" class="form-control" placeholder="@104bbkxa">
						</div>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-lineapp" id="btn_lineqr">
							<span class="glyphicon glyphicon-qrcode" aria-hidden="true"></span> ทดสอบ QR
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<span class="text-remark" style="margin: 5px 0px 0px 0px;"><b style="color: #00B900;">เมื่อคลิก "ทดสอบ QR" แล้ว ให้ลองทดสอบแสกน QR ด้วยแอพ Line บนมือถือ (Add friend: เพิ่มเพื่อนใหม่)</b></span>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-3">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="radio" name="chk_temp" id="chk_temp1"> 
							</span>
							<span class="input-group-addon txt-bold">ไม่แสดงผลที่หน้าเว็บ 3BB
								<a tabindex="0" role="button" data-container="body" data-toggle="popover" data-placement="right" data-content="เลือกสำหรับสาขา ที่ไม่ต้องการให้แสดงผลบนหน้าเว็บ <a target='_blank' href='http://www.3bb.co.th/3bb/shop/shop'>www.3bb.co.th</a> (ไม่เช็คเวลาเปิดปิด และไม่แสดงผลบน vas)">
									<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
								</a>
							</span>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="radio" name="chk_temp" id="chk_temp2"> 
							</span>
							<span class="input-group-addon txt-bold">ไม่มีการรับชำระ 
								<a tabindex="0" role="button" data-container="body" data-toggle="popover" data-placement="right" data-content="เลือกสำหรับสาขา ที่ไม่มีการรับชำระเงิน (ไม่มีเครื่อง POS) <br>โดยระบบจะไม่เช็คเวลาเปิดปิด">
									<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
								</a>
							</span>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-2" >
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_promote"> 
							</span>
							<span class="input-group-addon txt-bold">คลิกเพื่อให้แสดงผลบนหน้าแรกเว็บ 3BB (Flag Default)
								<a tabindex="0" role="button" data-container="body" data-toggle="popover" data-placement="right" data-content="เลือกสำหรับสาขา ที่ต้องการให้แสดงผลที่หน้าแรกเว็บ 3BB เท่านั้น!!">
									<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
								</a>
							</span>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-2" >
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input runat="server" type="checkbox" id="chk_premium_receive_shop"> 
							</span>
							<span class="input-group-addon txt-bold">คลิกเพื่อเป็น Shop รับของพรีเมี่ยม
							</span>
						</div>
					</div>
				</div>
				<hr class="line">
				<div class="form-inline">
					<span class="text-remark"><b class="valid">หมายเหตุ: ช่องที่ไม่มีเครื่องหมาย * หากยังไม่มีข้อมูล สามารถเว้นว่างไว้ได้</b></span>
					<span class="text-remark"><b class="valid">หมายเหตุ: เมื่อข้อมูลครบถ้วนพร้อมแสดงผล ให้ยกเลิกการเลือก "ไม่แสดงผลที่หน้าเว็บ 3BB" ออก</b></span>
					<span class="text-remark"><b class="valid">หมายเหตุ: หากข้อมูลอยู่ระหว่างรออนุมัติ จะไม่สามารถบันทึกข้อมูลอีกได้ (ต้องรอให้เสร็จสิ้น หรือยกเลิกคำขอเดิม)</b></span>
					<input runat="server" id="hide_follow_id" type="hidden">
					<button type="button" class="btn btn-default btn-success" id="btn_submit" style="display: none;">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> บันทึกข้อมูล
					</button>
					<!-- <button type="button" class="btn btn-default btn-success" id="btn_new_shop">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> บันทึกข้อมูล
					</button> -->
					<button type="button" class="btn btn-default btn-warning" id="btn_modal_follow">
						<span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> สร้างคำขออนุมัติ
					</button>
					<input runat="server" id="hide_newshop" type="hidden">
					<input runat="server" id="hide_type" type="hidden">
					<input runat="server" id="hide_province" type="hidden">
					<input runat="server" id="hide_district" type="hidden">
					<input runat="server" id="hide_place" type="hidden">
					<input id="btn_submit_hidden" OnServerClick="Submit_ShopStock" runat="server" type="submit" style="display:none;">
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

<div id="modal_map" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title txt-bold txt-blue" style="font-size:12px;">สามารถค้นหาที่ตั้งสำนักงาน และคลิกลากหมุดเพื่อระบุตำแหน่งที่ต้องการ จากนั้นคลิกปุ่ม "ยืนยัน"</h4>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<div class="input-group">
							<input id="pac-input" class="form-control" type="text" placeholder="ค้นหาที่ตั้ง">
						</div>
					</div>
					<div class="row" style="margin-top:10px;">
						<div id="map_canvas"></div>
					</div>
				</div>

				<hr class="end-row">
				<div class="row">
					<div class="col-xs-6">
						<div class="input-group">
							<span class="input-group-addon txt-bold">Latitude</span>
							<input id="get_lat" type="text" class="form-control" placeholder="latitude" readonly>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="input-group">
							<span class="input-group-addon txt-bold">Longitude</span>
							<input id="get_lng" type="text" class="form-control" placeholder="longitude" readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btn_get_latlng" disabled>ยืนยัน</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
			</div>
		</div>
	</div>
</div>


<div id="modal_follow" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">สร้างคำขออนุมัติ เปลี่ยนเข้อมูลสำนักงาน ผ่านระบบ Follow Request</h4>
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
								<label class="col-sm-3 control-label">ข้อมูลสำนักงานที่แก้ไข:</label>
								<span runat="server" id="inn_tx01" class="col-sm-9 control-label left-label"></span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">ข้อมูลสำนักงานเดิม:</label>
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

						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<input id="hide_cur_data" type="hidden">
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
<script type="text/javascript" src="App_Inc/external_followreq.js?vs=12_20210301"></script>

<script type="text/javascript">
$(document).ready(function() {
	// $.when( loadShopType(), loadProvince() ).done( checkNewShop() );
	loadShopType();
	
	checkedTemp();

	var g_code = '?shop_code=' + _GET('shop_code');
	$('#link_out a').each(function(){
		this.href += g_code;
	})

	$("#li_shopcode").html(_GET('shop_code'));
	
	$('[data-toggle="popover"]').popover({html:true}); 

	if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN" ) {
		$("#btn_submit").show();
	}
});

$('body').on('click', function (e) {
    $('[data-toggle="popover"]').each(function () {
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
        }
    });
});

$('#btn_submit').click(function() {
	// $('#hide_type').val($('#sel_type').val());
	// $('#hide_province').val($('#sel_province').val());
	// $('#hide_district').val($('#sel_district').val());
	// $('#hide_place').val($('#sel_place').val());
	
	// // if(checkSubmit() != 0){
	// 	$('#btn_submit_hidden').click();
	// // }

	if(checkSubmit() != 0){
		goSubmit();
	}
});

$('#btn_new_shop').click(function() {
	modalAlert("รหัสสาขาไม่ถูกต้อง หรือมีข้อมูลอยู่แล้ว");
	$('#modal_alert').on('hidden.bs.modal', function (e) {
		$('#txt_shop_code').focus();
	})
});

$('#btn_logout').click(function() {
	$('#modal_oauth').modal("show");
});

$("#txt_shop_code").keypress(function(event){
    var ew = event.which;
    if(ew == 32)
        return true;
    if(48 <= ew && ew <= 57)
        return true;
    if(65 <= ew && ew <= 90)
        return true;
    if(97 <= ew && ew <= 122)
        return true;
    return false;
});

$('#txt_shop_code').blur(function() {
	if(tmp_shop_code != $('#txt_shop_code').val() || tmp_shop_code == "") {
		tmp_shop_code = $('#txt_shop_code').val();
		checkShopCode(tmp_shop_code);
	}
});

$('#sel_province').change(function (){
	loadDistrict($('#sel_province').val());
});

$('input[name="chk_temp"]').click(function(){
	if(tmp_shop_temp == $(this).val() && tmp_chk_temp == true)
		$(this).prop('checked', false);

	tmp_shop_temp = $(this).val();
	tmp_chk_temp = $('#'+tmp_shop_temp).prop("checked");


	if (tmp_chk_temp != true) {
		modalAlert("หากเป็นสำนักงานพึ่งเปิดใหม่ <br><br>ข้อมูลจะเริ่มแสดงผลที่หน้าเว็บ 3BB <br>เมื่อมีการบันทึกเปิด Shop อย่างน้อย1ครั้ง");
	}
});

function goSubmit() {
	$('#hide_type').val($('#sel_type').val());
	$('#hide_province').val($('#sel_province').val());
	$('#hide_district').val($('#sel_district').val());
	$('#hide_place').val($('#sel_place').val());

	$('#btn_submit_hidden').click();
}

function checkedTemp() {
	tmp_shop_temp = $('input[name="chk_temp"]').val();
	tmp_chk_temp = $('#'+tmp_shop_temp).prop("checked");
}

function loadShopType() {
	var $el = $('#sel_type');
	$el.empty();
	$el.append($("<option></option>")
		.attr("value", "").text("กำลังโหลด"));

	$.getJSON('updateStockShopJson.aspx?qrs=shoptype', function(data) {
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "0").text("เลือกประเภท"));

		$.each(data,function( i,item ) {
			$el.append($("<option></option>")
				.attr("value", item.storeKiosType_id).text(item.storeKiosType_name));
		});

		loadShopPlace();
	});
}

function loadShopPlace() {
	var $el = $('#sel_place');
	$el.empty();
	$el.append($("<option></option>")
		.attr("value", "").text("กำลังโหลด"));

	$.getJSON('updateStockShopJson.aspx?qrs=shopplace', function(data) {
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "0").text("เลือกพื้นที่"));

		$.each(data,function( i,item ) {
			$el.append($("<option></option>")
				.attr("value", item.storeplacetype_id).text(item.storeplacetype_name));
		});

		loadProvince();
	});
}

function loadProvince() {
	var $el = $('#sel_province');
	$el.empty();
	$el.append($("<option></option>")
		.attr("value", "").text("กำลังโหลด"));

	$.getJSON('updateStockShopJson.aspx?qrs=province', function(data) {
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "0").text("เลือกจังหวัด"));

		$.each(data,function( i,item ) {
			$el.append($("<option></option>")
				.attr("value", item.province_code).text($.trim(item.province_name)));
		});

		checkNewShop();
	});
}

function checkNewShop() {
	var gCode = _GET('shop_code');
	if(gCode != null) {
		if(gCode != "") {
			$('#link_none').hide();
			$('#link_out').show();

			$("#txt_shop_code").attr("disabled", "disabled"); 
			$('#btn_new_shop').hide();
			// $('#btn_submit').show();
			
			loadStockShopDesc();
		}
		// else{
		// 	$('#hide_newshop').val("new");
		// 	$('.navbar-brand').text('CREATE NEW 3BB SHOP');
		// }
	}
	// else if(getHash() == "new") {
	// 	$('#hide_newshop').val("new");
	// 	$('.navbar-brand').text('CREATE NEW 3BB SHOP');
	// }
	else{
		// $('#hide_newshop').val("new");
		// $('.navbar-brand').text('CREATE NEW 3BB SHOP');

		// modalAlert("ไม่อนุญาต CREATE NEW SHOP<br><br>ต้องผ่านระบบ Reqeust Shop เท่านั้น!!");
		modalAlert("ไม่มีรหัสสาขา " + _GET('shop_code'));
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			window.location = "default.aspx";
		})
	}
}

function loadDistrict(province_code,setVal = 0,first_load = 0) {
	var $el = $('#sel_district');
	$el.empty();

	if(province_code == "73" || province_code == "74" || province_code == "75" || province_code == "76") {
		$el.append($("<option></option>")
			.attr("value", "").text("กำลังโหลด"));

		$.getJSON('updateStockShopJson.aspx?qrs=district&province_code=' + province_code, function(data) {
			$el.empty();
			$el.prop('disabled', false);
			$el.append($("<option></option>")
				.attr("value", "").text("เลือกเขต/อำเภอ"));

			$.each(data,function( i,item ) {
				if($.trim(item.amphur_code) == setVal) {
					$el.append($("<option></option>")
						.attr({value:$.trim(item.amphur_code), selected:"selected"}).text($.trim(item.amphur_name)));
				}
				else {
					$el.append($("<option></option>")
						.attr("value", $.trim(item.amphur_code)).text($.trim(item.amphur_name)));
				}

				if(first_load == 1){
					$('#hide_cur_data').val(getStockShopData());
				}
			});
		});
	}
	else {
		$el.prop('disabled', true);
		$el.append($("<option></option>")
			.attr("value", "0").text("เลือกเขต/อำเภอ"));
	}
}

function loadStockShopDesc() {
	var url = 'updateStockShopJson.aspx?qrs=loadStockShopDesc&shop_code=' + _GET('shop_code');
	console.log(url);
	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			if(data.length > 0){
				if(data[0].approve_status == 0 || data[0].approve_status == 3){
					loadStockShopDescProve(data[0].approve_status);
				}
				else {
					loadDistrict(data[0].province_code,data[0].amphur_code,1);

					$('#hide_no_shopStock').val(data[0].no);
					$('#txt_shop_code').val(data[0].shop_code);
					$('#txt_shop_name').val(data[0].shop_name);
					$('#sel_type').val(data[0].storeKiosType_id);
					$('#sel_province').val(data[0].province_code);
					$('#sel_place').val(data[0].storeplacetype_id);
					$('#txt_tel').val(data[0].telephone);
					$('#txt_fax').val(data[0].fax);
					$('#txtar_location').val(data[0].shop_location);
					$('#txtar_address').val(data[0].shop_address);
					$('#txtar_keyword').val(data[0].shop_keyword);
					$('#txtar_comment').val(data[0].shop_comment);
					$('#txt_lat').val(data[0].latitude);
					$('#txt_lng').val(data[0].longitude);
					$('#txt_line_id').val(data[0].line_id);

					if(data[0].shop_temp == 1){
						$('#chk_temp1').prop('checked', true);
						checkedTemp();
					}
					else if(data[0].shop_temp == 2){
						$('#chk_temp2').prop('checked', true);
						checkedTemp();
					}

					if(data[0].flag_promote == 1){
						$('#chk_promote').prop('checked', true);
					}

					if(data[0].premium_receive_shop == 1){
						$('#chk_premium_receive_shop').prop('checked', true);
					}

					$('#hide_cur_data').val(getStockShopData());
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

function loadStockShopDescProve(approve_status) {
	var url = "updateStockShopJson.aspx?qrs=loadStockShopDescProve&shop_code=" + _GET('shop_code') + "&approve_status=" + approve_status;
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

				loadDistrict(data[0].province_code,data[0].amphur_code);

				$('#hide_no_approve').val(data[0].no_approve);
				$('#hide_no_shopStock').val(data[0].no_shopStock);
				$('#txt_shop_code').val(data[0].shop_code);
				$('#txt_shop_name').val(data[0].shop_name);
				$('#sel_type').val(data[0].storeKiosType_id);
				$('#sel_province').val(data[0].province_code);
				$('#sel_place').val(data[0].storeplacetype_id);
				$('#txt_tel').val(data[0].telephone);
				$('#txt_fax').val(data[0].fax);
				$('#txtar_location').val(data[0].shop_location);
				$('#txtar_address').val(data[0].shop_address);
				$('#txtar_keyword').val(data[0].shop_keyword);
				$('#txtar_comment').val(data[0].shop_comment);
				$('#txt_lat').val(data[0].latitude);
				$('#txt_lng').val(data[0].longitude);
				$('#txt_line_id').val(data[0].line_id);

				if(data[0].shop_temp == 1){
					$('#chk_temp1').prop('checked', true);
					checkedTemp();
				}
				else if(data[0].shop_temp == 2){
					$('#chk_temp2').prop('checked', true);
					checkedTemp();
				}

				if(data[0].flag_promote == 1){
					$('#chk_promote').prop('checked', true);
				}

				if(data[0].premium_receive_shop == 1){
					$('#chk_premium_receive_shop').prop('checked', true);
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

function checkSubmit() {
	var $el1 = $("#txt_shop_code");
	var $el2 = $("#txt_shop_name");
	var $el3 = $("#sel_type");
	var $el4 = $("#sel_province");
	var $el5 = $("#sel_district");
	var $el6 = $("#sel_place");
	var $el7 = $("#txt_lat");
	var $el8 = $("#txt_lng");

	var el3text = $("#sel_type option:selected").text();

	if( $el2.val() == "" ){
		modalAlert("กรุณากรอกชื่อสาขา");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el2.focus();
		})
		return 0;
	}
	else if( $.trim($el3.val()) == "" || $el3.val() == 0 ){
		modalAlert("กรุณาเลือกประเภท");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el3.focus();
		})
		return 0;
	}
	else if( $.trim($el4.val()) == "" || $el4.val() == 0 ){
		modalAlert("กรุณาเลือกจังหวัด");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el4.focus();
		})
		return 0;
	}
	else if( $.trim($el6.val()) == "" || $el6.val() == 0 ){
		modalAlert("กรุณาเลือกพื้นที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el6.focus();
		})
		return 0;
	}
	else {
		if( el3text.indexOf("***") < 0 ){
			var reg_latlng = new RegExp(/^(\-?\d+(\.\d+)?)$/);

			if( $el7.val() == "" ){
				modalAlert("กรุณากรอก Latitude");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					$el7.focus();
				})
				return 0;
			}
			else if( reg_latlng.test($el7.val()) == false ){
				modalAlert("Latitude ไม่ถูกต้อง");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					$el7.focus();
				})
				return 0;
			}
			else if( $el8.val() == "" ){
				modalAlert("กรุณากรอก Longitude");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					$el8.focus();
				})
				return 0;
			}
			else if( reg_latlng.test($el8.val()) == false ){
				modalAlert("Longitude ไม่ถูกต้อง");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					$el8.focus();
				})
				return 0;
			}
		}
	}

	return 1;
}

function checkShopCode(shop_code) {
	$('#code_success').hide();
	$('#code_error').hide();

	if(shop_code.trim() != "" && shop_code.length == 5) {
		ajaxCheckShopCode(shop_code, function(res){
			if(res == 0){
				$('#code_success').show();
				$('#btn_new_shop').hide();
				// $('#btn_submit').show();
			}
			else{
				shopCodeError();
			}
		});
	}
	else {
		shopCodeError()
	}

	function shopCodeError() {
		$('#code_error').show();
		$('#btn_submit').hide();
		$('#btn_new_shop').show();
	}

	function ajaxCheckShopCode(shop_code, handleData) {
		$.ajax({
			url: "updateStockShopJson.aspx?qrs=checkShopCode&shop_code=" + shop_code,
			cache: false,
			success: function( res ) {
				handleData(res); 
			}
		});
	}
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


$('#btn_modal_follow').click(function() {
	$('#hide_uemail_verify1').val("");

	if(checkSubmit()){
		$('#inn_select_shop').html(_GET('shop_code').toUpperCase());
		$('#inn_tx01').html("");
		$('#inn_tx02').html("");

		loadRoProvince();
		exampleStockShopData();
	}
});

function getStockShopData() {
	var get_data = "";

	get_data = "ชื่อสำนักงาน: " + $('#txt_shop_name').val();
	get_data += htm_tab + "จังหวัด: " + $('#sel_province option:selected').text();

	if($('#sel_district').val() != 0){
		get_data += htm_tab + "เขต/อำเภอ: " + $('#sel_district option:selected').text();
	}

	get_data += htm_tab + "ประเภท: " + $('#sel_type option:selected').text();
	get_data += htm_tab + "พื้นที่: " + $('#sel_place option:selected').text();

	if($('#txtar_location').val() != ""){
		get_data += htm_br + "สถานที่ตั้ง: " + $('#txtar_location').val();
	}

	if($('#txtar_address').val() != ""){
		get_data += htm_br + "ที่อยู่: " + $('#txtar_address').val();
	}

	if($('#txt_tel').val() != ""){
		get_data += htm_tab + "เบอร์ติดต่อ: " + $('#txt_tel').val();
	}

	if($('#txt_fax').val() != ""){
		get_data += htm_tab + "Fax: " + $('#txt_fax').val();
	}

	if($('#txtar_keyword').val() != ""){
		get_data += htm_br + "คำค้น: " + $('#txtar_keyword').val();
	}

	if($('#txtar_comment').val() != ""){
		get_data += htm_tab + "ข้อความแจ้งภายใน: " + $('#txtar_comment').val();
	}

	if($('#txt_lat').val() != "" && $('#txt_lng').val() != ""){
		get_data += htm_br + "latitude: " + $('#txt_lat').val();
		get_data += htm_tab + "longitude: " + $('#txt_lng').val();
	}

	if($('#txt_line_id').val() != ""){
		get_data += htm_br + "Line ID: " + $('#txt_line_id').val();
	}

	if($('#chk_temp1').prop("checked") == true) {
		get_data += htm_tab + "option1: ไม่แสดงผลที่หน้าเว็บ 3BB";
	}
	else if($('#chk_temp2').prop("checked") == true) {
		get_data += htm_tab + "option1: ไม่มีการรับชำระ";
	}

	if($('#chk_promote').prop("checked") == true) {
		get_data += htm_tab + "option2: แสดงผลบนหน้าแรกเว็บ 3BB (Flag Default)";
	}

	if($('#chk_premium_receive_shop').prop("checked") == true) {
		get_data += htm_tab + "option3: เป็น Shop รับของพรีเมี่ยม";
	}

	return get_data;
}

function exampleStockShopData() {
	var cur_data = $('#hide_cur_data').val();
	var new_data = getStockShopData();

	if(new_data == cur_data){
		var txt_alert = "ไม่สามารถสร้างคำขอได้ เพราะข้อมูลยังไม่มีการเปลี่ยนแปลง";
		modalAlert(txt_alert);
		// var txt_alert = "<span class='txt-red'>ข้อมูลสำนักงานยังไม่เปลี่ยนแปลง</span>";
		// txt_alert += "<br><br><label>ข้อมูลสำนักงานที่แก้ไข</label><br>" + new_data;
		// txt_alert += "<br><br><label>ข้อมูลสำนักงานเดิม</label><br>" + cur_data;
		// modalAlertXL(txt_alert);
	}
	else {
		$('#inn_tx01').html(new_data);
		$('#inn_tx02').html(cur_data);

		$('#modal_follow').modal("show");
	}
}

$('#btn_send_follow').click(function() {
	if( $("#hide_uemail_verify1").val() == "" ){
		modalAlert("กรุณากรอก ผู้จัดการจังหวัด");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#auto_verify1').focus();
		})
		return false;
	}
	else {
		$('#modal_follow').modal("hide");
		send_follow();
	}
});

function send_follow() {
	console.log("api: " + new_backof30_api);

	// console.log("shop_code: " + _GET('shop_code').toUpperCase());
	// console.log("ro: " + $('#hide_follow_ro').val());
	// console.log("province_short: " + $('#hide_follow_province_short').val());

	// console.log("token: " + $('#hide_token').val());
	// console.log("uemail: " + $('#hide_uemail').val());
	// console.log("uemail_cc2: " + "waraporn.kaw");

	// console.log("uemail_verify1: " + $('#hide_uemail_verify1').val());

	// console.log("tx01: " + convertHTML($('#inn_tx01').html()));
	// console.log("tx02: " + convertHTML($('#inn_tx02').html()));

	$.ajax({
		url: new_backof30_api,
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

			tx01: convertHTML($('#inn_tx01').html()),
			tx02: convertHTML($('#inn_tx02').html())
		},
		success: function( follow_id ) {
			console.log("follow_id = " + follow_id);

			$('#hide_follow_id').val(follow_id);

			popupFollow("backof30", follow_id);
			// $('#btn_submit').click();
			goSubmit();
		},
		error: function() {
			modalAlert("ไม่สำเร็จ (api follow fail!!) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
		}
	});
}
</script> 

<script type='text/javascript'>
    $('#modal_map').on('shown.bs.modal', function(e) {
    	var lat = 13.905502;
    	var lng = 100.519812;

    	if($('#txt_lat').val().length > 3 && $('#txt_lng').val().length > 3){
    		lat = $('#txt_lat').val();
    		lng = $('#txt_lng').val();

    		$('#get_lat').val($('#txt_lat').val());
    		$('#get_lng').val($('#txt_lng').val());
    	}

        initialize(new google.maps.LatLng(lat, lng));
    });

    $('#modal_map').on('hide.bs.modal', function(e) {
    	current_zoom = map_getting.getZoom();
    	$('#pac-input').val('');
    	$('#btn_get_latlng').prop('disabled', true);
    });


    $('#btn_get_latlng').click(function() {
    	$('#txt_lat').val($('#get_lat').val());
    	$('#txt_lng').val($('#get_lng').val());
    });

    // function getLatLng() {
    // 	if($('#get_lat').val().length > 3)
    // 		$('#txt_lat').val($('#get_lat').val());
    // 	if($('#get_lng').val().length > 3)
    // 		$('#txt_lng').val($('#get_lng').val());
    // }

    $('#btn_lineqr').click(function() {
    	if($('#txt_line_id').val().trim() == ""){
    		modalAlert("กรุณากรอก Line ID เพื่อตรวจสอบ");
    		$('#modal_alert').on('hidden.bs.modal', function (e) {
    			$('#txt_line_id').focus();
    		})
    	}
    	else {
    		var url = "https://line.me/ti/p/~" + $('#txt_line_id').val();
    		console.log("line url " + url);
    		popupCenter(url, 'exmap',750,500);
    		// window.open(url);
    	}
    });
</script>
</body>
</html>
