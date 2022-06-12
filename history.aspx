<%@ Page Language="VB" AutoEventWireup="false" CodeFile="history.aspx.vb" Inherits="history" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>ประวัติการเปิดปิด [3BB Shop Back Office]</title>

	<link rel="shortcut icon" href="App_Inc/3bfav.ico" type="image/x-icon">
	<link rel="icon" href="App_Inc/3bfav.ico" type="image/x-icon">

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-147236441-1"></script>
    <script type="text/javascript" src="App_Inc/gtag_3bbback.js?id=UA-147236441-1&vs=12"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
	<script src="App_Inc/jquery-1.11.3.min.js"></script>

	<link rel="stylesheet" type="text/css" href="App_Inc/jquery-ui-1.11.4/jquery-ui.css"/>
	<script type="text/javascript" src="App_Inc/jquery-ui-1.11.4/jquery-ui.js"></script>

	<link rel="stylesheet" href="App_Inc/MonthPicker/MonthPicker.css" />
	<script type="text/javascript" src="App_Inc/MonthPicker/MonthPicker.js"></script>

	<link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
	<script src="App_Inc/bootstrap/js/bootstrap.js"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/stockShop.css?vs=12" />
	<link type="text/css" rel="stylesheet" href="App_Inc/mapReport.css?vs=12" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<link rel="stylesheet" type="text/css" href="App_Inc/DataTables/datatables.css"/>
	<script type="text/javascript" src="App_Inc/DataTables/datatables.js"></script>
    <script type="text/javascript" src="App_Inc/DataTables/date-uk.js"></script>

	<link rel="stylesheet" type="text/css" href="App_Inc/DataTables/buttons_datatable/buttons.dataTables.min.css"/>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/buttons.flash.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/jszip.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/pdfmake.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/vfs_fonts.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/buttons.html5.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/buttons.print.min.js"></script>

	<script src="App_Inc/panu.js?vs=1222"></script>
	<script src="App_Inc/var.js?vs=12"></script>
    <script src="App_Inc/notation.js?vs=12"></script>

	<style type="text/css">
	body {
		overflow-y: scroll;
	}
	#txt_date, #txt_month, #txt_start_date, #txt_end_date, #txt_start_date2, #txt_end_date2 {
		color: blue;
		width: 120px;
	}
	#smart_lable {
		width: 500px;
	}
	.td-notation {
		font-size: 12px;
	}
	.td-notation:hover {
		cursor: pointer;
		color: red;
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
    						<li class="active"><a href="history.aspx">ประวัติ เปิดปิดสำนักงาน</a></li>
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

	<nav class="navbar navbar-default">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active" id="nav_bydate"><a data-toggle="tab" href="#tab_bydate">โดยวันที่</a></li>
				<li id="nav_bymonth"><a data-toggle="tab" href="#tab_bymonth">โดยรายเดือน</a></li>
				<li id="nav_byshop"><a data-toggle="tab" href="#tab_byshop">โดยสำนักงาน</a></li>
				<li id="nav_state"><a data-toggle="tab" href="#tab_state">สถิติ</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="tab-content">

			<div class="alert alert-info alert-dismissible" role="alert" style="line-height:24px;">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong><u>รายการอัพเดท ประวัติการเปิดปิดสำนักงาน</u></strong><br>
				<ul style="list-style-type:disc; padding: 15px 0 15px 15px;">
					<li>[2020-01-12] เพิ่มการแสดงเวลา "บันทึกนำส่งเงิน"</li>
					<li>[2016-11-16] เพิ่มสถานะ "ปิดชั่วคราว" แยกออกมาจากสถานะ "วันหยุด"</li>
					<li>[2016-11-16] เพิ่มระบบเก็บประวัติ "โน๊ตประจำวัน" โดยระบบจะบันทึก "หมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB" ทุกวันอัตโนมัติ<br>
						และสามารถเพิ่มหรือแก้ไข "โน๊ตประจำวัน" ได้ (เพื่อเก็บประวัติการชี้แจง เปิดสาย ปิดก่อน หรืออื่นๆ)
					</li>
					<li>[2016-11-10] เริ่มเก็บประวัติ "หมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB" อัตโนมัติ</li>
				</ul>
			</div>

			<div id="tab_bydate" class="tab-pane active">
				<div class="form-inline" style="margin-bottom:25px;">
					<div class="input-group">
						<span class="input-group-addon txt-bold">เลือกวันที่</span>
						<input type="text" class="form-control input-sm datepicker" maxlength="10" placeholder="30/12/2016" id="txt_date">
					</div>

					<div class="input-group">
						<span class="input-group-addon txt-bold">เขตพื้นที่</span>
						<select id="sel_ro" class="form-control input-sm" style="width:auto;"></select>
					</div>

					<div class="input-group">
						<button type="button" class="btn btn-danger btn-sm" id="btn_bydate">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span> ดูประวัติ
						</button>
					</div>

					<div class="input-group">
						<button type="button" class="btn btn-default btn-sm" id="btn_export_date">Download Excel</button>
					</div>
				</div>

				<div id="display_bydate"></div>

				<!-- <div class="panel panel-default panel-detail-icon" style="display:none;" id="foot_bydate">
					<div class="panel-heading">
						<h3 class="panel-title">คำอธิบายสัญลักษณ์ต่างๆ</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-6">
								<span class="detail-icon"><span class='glyphicon icon-notification'></span> โน๊ตประจำวัน</span><br>
								<span class="detail-icon"><span class='glyphicon icon-history iconbold'></span> ประวัติเปิดปิดย้อนหลัง 7 วันล่าสุด</span><br>
							</div>
							<div class="col-xs-6">
								<span class="detail-icon" style="padding:5px; background-color:#ffb0b0">*มีข้อมูลเข้าส่วนกลาง "ก่อน" เวลาบันทึกเปิด/ปิด</span><br>
								<span class="detail-icon" style="padding:5px; background-color:#ffb588">*มีข้อมูลเข้าส่วนกลาง "ช้ากว่า" เวลาบันทึกเปิด/ปิด 15 นาที</span><br>
							</div>
						</div>
					</div>
				</div> -->
			</div><!-- tab_bydate -->

			<div id="tab_bymonth" class="tab-pane">
				<div class="form-inline" style="margin-bottom:25px;">
					<div class="input-group">
						<span class="input-group-addon txt-bold">เลือกเดือน</span>
						<input type="text" class="form-control input-sm monthpicker" maxlength="7" placeholder="12/2016" id="txt_month">
					</div>

					<div class="input-group">
						<span class="input-group-addon txt-bold">เขตพื้นที่</span>
						<select id="sel_ro2" class="form-control input-sm" style="width:auto;"></select>
					</div>

					<div class="input-group">
						<button type="button" class="btn btn-danger btn-sm" id="btn_bymonth">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span> ดูประวัติ
						</button>
					</div>

					<div class="input-group">
						<button type="button" class="btn btn-default btn-sm" id="btn_export_month">Download Excel</button>
					</div>
				</div>

				<div id="display_bymonth"></div>

				<!-- <div class="panel panel-default panel-detail-icon" style="display:none;" id="foot_bymonth">
					<div class="panel-heading">
						<h3 class="panel-title">คำอธิบายสัญลักษณ์ต่างๆ</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-6">
								<span class="detail-icon"><span class='glyphicon icon-notification'></span> โน๊ตประจำวัน</span><br>
								<span class="detail-icon"><span class='glyphicon icon-history iconbold'></span> ประวัติเปิดปิดย้อนหลัง 7 วันล่าสุด</span><br>
							</div>
							<div class="col-xs-6">
								<span class="detail-icon" style="padding:5px; background-color:#ffb0b0">*มีข้อมูลเข้าส่วนกลาง "ก่อน" เวลาบันทึกเปิด/ปิด</span><br>
								<span class="detail-icon" style="padding:5px; background-color:#ffb588">*มีข้อมูลเข้าส่วนกลาง "ช้ากว่า" เวลาบันทึกเปิด/ปิด 15 นาที</span><br>
							</div>
						</div>
					</div>
				</div> -->
			</div><!-- tab_bymonth -->

			<div id="tab_byshop" class="tab-pane">
				<div class="form-inline" style="margin-bottom:25px;">
					<div class="input-group">
						<span class="input-group-addon txt-bold">ค้นหาสำนักงาน</span>
						<input type="text" class="form-control input-sm" id="smart_shop_code" placeholder="รหัสสาขา,ชื่อสาขา,คำค้น">
						<input type="hidden" id="hide_shop_code">
					</div>

					<div class="input-group">
						<input type="text" class="form-control input-sm" id="smart_lable" readonly>
					</div>

				</div>
				<div class="form-inline" style="margin-bottom:25px;">
					<div class="input-group">
						<span class="input-group-addon txt-bold">เลือกช่วงวันที่</span>
						<input type="text" class="form-control input-sm datepicker" maxlength="10" placeholder="01/12/2016" id="txt_start_date">
					</div>

					<div class="input-group">
						<span class="input-group-addon txt-bold">ถึง</span>
						<input type="text" class="form-control input-sm datepicker" maxlength="10" placeholder="30/12/2016" id="txt_end_date">
					</div>

					<div class="input-group">
						<button type="button" class="btn btn-danger btn-sm" id="btn_byshop">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span> ดูประวัติ
						</button>
					</div>

					<div class="input-group">
						<button type="button" class="btn btn-default btn-sm" id="btn_export_shop">Download Excel</button>
					</div>
				</div>

				<div id="display_byshop"></div>

				<!-- <div class="panel panel-default panel-detail-icon" style="display:none;" id="foot_byshop">
					<div class="panel-heading">
						<h3 class="panel-title">คำอธิบายสัญลักษณ์ต่างๆ</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-6">
								<span class="detail-icon"><span class='glyphicon icon-notification'></span> โน๊ตประจำวัน</span><br>
							</div>
							<div class="col-xs-6">
								<span class="detail-icon" style="padding:5px; background-color:#ffb0b0">*มีข้อมูลเข้าส่วนกลาง "ก่อน" เวลาบันทึกเปิด/ปิด</span><br>
								<span class="detail-icon" style="padding:5px; background-color:#ffb588">*มีข้อมูลเข้าส่วนกลาง "ช้ากว่า" เวลาบันทึกเปิด/ปิด 15 นาที</span><br>
							</div>
						</div>
					</div>
				</div> -->

			</div><!-- tab_byshop -->

			<div id="tab_state" class="tab-pane">
				<div class="form-inline" style="margin-bottom:25px;">
					<div class="input-group">
						<span class="input-group-addon txt-bold">เลือกช่วงวันที่</span>
						<input type="text" class="form-control input-sm datepicker" maxlength="10" placeholder="01/12/2016" id="txt_start_date2">
					</div>

					<div class="input-group">
						<span class="input-group-addon txt-bold">ถึง</span>
						<input type="text" class="form-control input-sm datepicker" maxlength="10" placeholder="30/12/2016" id="txt_end_date2">
					</div>
				</div>

				<div class="form-inline" style="margin-bottom:25px;">
					<div class="input-group">
						<span class="input-group-addon txt-bold">เขตพื้นที่</span>
						<select id="sel_ro3" class="form-control input-sm" style="width:auto;"></select>
					</div>
					
					<div class="input-group">
						<span class="input-group-addon txt-bold">Cluster</span>
						<select id="sel_cluster" class="form-control input-sm" style="width:auto;" disabled>
							<option value="">ALL</option>
						</select>
					</div>

					<div class="input-group">
						<button type="button" class="btn btn-danger btn-sm" id="btn_state">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span> ดูประวัติ
						</button>
					</div>
				</div>

				<div id="display_state"></div>
			</div><!-- tab_state -->

			<div class="panel panel-default panel-detail-icon">
				<div class="panel-heading">
					<span class="panel-title">คำอธิบายสัญลักษณ์ต่างๆ</span>

					<button type="button" class="btn btn-sm" id="btn_memo" style="float: right; line-height: 10px;">
						<span class="glyphicon icon-database" aria-hidden="true"></span> memo..
					</button>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-6">
							<span class="detail-icon"><span class='glyphicon icon-notification'></span> โน๊ตประจำวัน</span><br>
							<span class="detail-icon"><span class='glyphicon icon-history iconbold'></span> ประวัติเปิดปิดย้อนหลัง 7 วันล่าสุด</span><br>
						</div>
						<div class="col-xs-6">
							<span class="detail-icon" style="padding:5px; background-color:#ffb0b0">*มีข้อมูลเข้าส่วนกลาง "ก่อน" เวลาบันทึกเปิด/ปิด 2 นาที</span><br>
							<span class="detail-icon" style="padding:5px; background-color:#ffb588">*มีข้อมูลเข้าส่วนกลาง "ช้ากว่า" เวลาบันทึกเปิด/ปิด 15 นาที</span><br>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default panel-detail-icon" id="box_memo" style="display:none;">
				<div class="panel-heading">
					<h3 class="panel-title"><span class='glyphicon icon-database'></span> ที่มาข้อมูล (dev memo)</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-6">
							<span class="detail-icon"><b>เวลาบันทึก เปิด:</b> R16010.f07</span><br>
							<span class="detail-icon"><b>เวลาเข้าส่วนกลาง ตอนเปิด:</b> R16010.y01</span><br>
						</div>
						<div class="col-xs-6">
							<span class="detail-icon"><b>เวลาบันทึก ปิด:</b> R16010.f10</span><br>
							<span class="detail-icon"><b>เวลาเข้าส่วนกลาง ตอนปิด:</b> R16010.y02</span><br>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<span class="detail-icon"><b>เวลาบันทึก นำส่งเงิน:</b> R16020.f41</span><br>
							<span class="detail-icon"><b>เวลาการเชื่อมต่อ ครั้งแรก และครั้งสุดท้าย:</b> ข้อมูลจาก Log Connect DTS</span><br>
							<span class="detail-icon"><b>สรุปข้อมูลประวัติทุกวัน ก่อนเที่ยงคืน (23:55 น.)</span><br>
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

<div id="modal_notation" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="title_notation"></h4>
			</div>
			<div class="modal-body">
				<span class="txt-bold txt-red">หมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB</span>
				<ul class="ul-note" id="ul_note">
					<div id="list_note"></div>
				</ul>
				<hr>
				<label>โน๊ตประจำวัน</label>
				<p class="ul-note" id="ul_notation">ไม่มีโน๊ตเพิ่มเติม</p>
				<br>
                <div class="have-notation" style="display:none;">
                    <label>ประเภท:</label> <span id="ul_notation_type"></span>
                    <br>
                    <br>
                    <label id="ul_open_accident" class="txt-blue" style="display:none;"><span class="glyphicon glyphicon-ok"></span> เปิดระบบช้าเนื่องจากเหตุสุดวิสัย</label>
                    <label id="ul_close_accident" class="txt-blue" style="display:none;"><span class="glyphicon glyphicon-ok"></span> ปิดระบบก่อน เนื่องจากเหตุสุดวิสัย</label>
                </div>
			</div>
			<div class="modal-footer">
                <button type="button" class="btn btn-warning" onclick="updateNotation()"><span class='glyphicon glyphicon-edit'></span> รายละเอียด</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>

<script type="text/javascript">
var startTime,loadTime;

$(document).ready(function() { 
	checkLogin();

	// historyByDate();
	loadArea('#sel_ro');
	loadArea('#sel_ro2');
	loadArea('#sel_ro3');
	checkURI();

	$('.datepicker').datepicker({
		minDate: new Date(2016, 8 - 1, 1),
		maxDate: '-1',
		dateFormat: 'dd/mm/yy',  
		dayNamesMin: ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'],   
		monthNames: ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม']
	});

	$('.monthpicker').MonthPicker({
		Button: false,
		StartYear: 2020
	});

     $(window).scroll(function(){  
         if($(document).scrollTop()>100){
             $("#gotoTop").show();
         }else{  
             $("#gotoTop").hide(); 
         }  
     });  
});

$('body').on('click', function (e) {
    $('[data-toggle="popover"]').each(function () {
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
        }
    });
});

$('#btn_memo').click(function() {
	$('#btn_memo').hide();
	$('#box_memo').slideDown();
});

$('#btn_bydate').click(function() {
	historyByDate();
});

$('#btn_bymonth').click(function() {
	historyByMonth();
});

$('#btn_byshop').click(function() {
	historyByShop();
});

$('#btn_state').click(function() {
	stateResult();
});

$('#btn_export_date').click(function() {
	var txt_date = $('#txt_date').val();
	var sel_ro = $('#sel_ro').val();

	if(txt_date == ""){
		modalAlert("กรุณาเลือกวันที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_date').focus();
		})
	}
	else {
		var url = "xportExcel.aspx?start=" + txt_date + "&end=" + txt_date + "&ro=" + sel_ro;
		console.log("export execl " + url);
		window.open(url);
	}
});

$('#btn_export_month').click(function() {
	var txt_month = $('#txt_month').val();
	var sel_ro2 = $('#sel_ro2').val();

	if(txt_month == ""){
		modalAlert("กรุณาเลือกเดือน");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_month').focus();
		})
	}
	else {
		var url = "xportExcel.aspx?month=" + txt_month + "&ro=" + sel_ro2;
		console.log("export execl " + url);
		window.open(url);
	}
});

$('#btn_export_shop').click(function() {
	var hide_shop_code = $('#hide_shop_code').val();
	var txt_start_date = $('#txt_start_date').val();
	var txt_end_date = $('#txt_end_date').val();

	if(hide_shop_code == ""){
		modalAlert("กรุณาระบุสำนักงาน");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#smart_shop_code').focus();
		})
	}
	else if(txt_start_date == ""){
		modalAlert("กรุณาเลือกช่วงวันที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_start_date').focus();
		})
	}
	else if(txt_end_date == ""){
		modalAlert("กรุณาเลือกช่วงวันที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_end_date').focus();
		})
	}
	else {
		var url = "xportExcel.aspx?start=" + txt_start_date + "&end=" + txt_end_date + "&shop_code=" + hide_shop_code;
		console.log("export execl " + url);
		window.open(url);
	}
});

$('#nav_bydate').click(function() {
	refineUrl();
	hashTab('bydate');
});

$('#nav_bymonth').click(function() {
	refineUrl();
	hashTab('bymonth');
});

$('#nav_byshop').click(function() {
	refineUrl();
	hashTab('byshop');
});

$('#nav_state').click(function() {
	refineUrl();
	hashTab('state');
});

function checkURI(){
	var hash = location.hash.replace('#','');

	if(hash != ''){
		hashTab(hash);
	}

	var gCode = _GET('shop_code');
	if(gCode != null) {
		if(hash == "byshop" && gCode != "") {
			var url = "reportJson.aspx?qrs=getShopComplete&shop_code=" + gCode;
			console.log(url);

            $.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 60000,
			success: function( data ) { 
				if(data.length > 0){
					$('#smart_shop_code').css('color', 'blue');
					$('#smart_shop_code').val(data[0].shop_code);
					$('#hide_shop_code').val(data[0].shop_code);
					$('#smart_lable').val(data[0].shop_label);

					$('#txt_start_date').val(calCuDate(-7));
					$('#txt_end_date').val(calCuDate(-1));

					historyByShop();
				}
				else{
					modalAlert("ไม่มีสำนักงานนี้");
				}
			},
			error: function(x, t, m) {
				console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

				modalAlert("ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					location.reload();
				})
			}
			});
		}
	}
}

$("#sel_ro3").change(function() {
	var $el = $('#sel_cluster');

	if($('#sel_ro3').val() == ""){
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "").text("ALL"));

		$el.prop('disabled', true);
	}
	else{
		loadCluster($('#sel_ro3').val());
	}
});

function loadArea(id) {
	var $el = $(id);
	$el.empty();
	$el.append($("<option></option>")
		.attr("value", "").text("กำลังโหลด"));

	$.getJSON('reportJson.aspx?qrs=loadArea', function(data) {
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "").text("ALL"));

		$.each(data,function( i,item ) {
			$el.append($("<option></option>")
				.attr("value", item.area_code).text(item.area_name));
		});
	});
}

function loadCluster(ro) {
	var $el = $('#sel_cluster');
	$el.empty();
	$el.append($("<option></option>")
		.attr("value", "").text("กำลังโหลด"));

	$.getJSON('reportJson.aspx?qrs=loadCluster&ro=' + ro, function(data) {
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "").text("ALL RO" + ro));

		$.each(data,function( i,item ) {
			$el.append($("<option></option>")
				.attr("value", item.cluster_code).text(item.cluster_name));
		});

		$el.prop('disabled', false);
	});
}

function historyByDate(){
    startTime = new Date().getTime();

	var txt_date = $('#txt_date').val();
	var sel_ro = $('#sel_ro').val();

	if(txt_date == ""){
		modalAlert("กรุณาเลือกวันที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_date').focus();
		})
	}
	else {
		var url = "reportJson.aspx?qrs=historyResult&start=" + txt_date + "&end=" + txt_date + "&ro=" + sel_ro;
		console.log(url);

		$.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 120000,
			success: function( data ) { 
				var txt_html = "<div id='display_bydate'>" +
				"<table id='table_bydate' class='table table-striped table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
				"<thead>" +
				"<tr>" +
				"<th rowspan='2'></th>" +   
				"<th rowspan='2'>RO</th>" +   
				"<th rowspan='2'>รหัสสาขา</th>" +   
				"<th rowspan='2'>ชื่อสาขา</th>" +  
				"<th colspan='3'>เวลาเปิด</th>" +   
				"<th colspan='4'>เวลาปิด</th>" +   
				// "<th rowspan='2' width='5'></th>" +   
				"<th colspan='2'>เวลาเข้าส่วนกลาง</th>" +   
				"<th colspan='2'>การเชื่อมต่อ</th>" +   
				"<th rowspan='2'>หมายเหตุเฉพาะกรณี</th>" +  
				"<th rowspan='2'>โน๊ตประจำวัน</th>" +  
				"</tr>" +
				"<tr>" +
				"<th>เปิดทำการ</th>" +
				"<th>บันทึกเปิด</th>" +
				"<th>สถานะ</th>" +
				"<th>ปิดทำการ</th>" +
				"<th>บันทึกนำส่งเงิน</th>" +
				"<th>บันทึกปิด</th>" +
				"<th>สถานะ</th>" +
				"<th>ตอนเปิด</th>" +
				"<th>ตอนปิด</th>" +
				"<th>ครั้งแรก</th>" +
				"<th>สุดท้าย</th>" +
				"</tr>" +
				"</thead>" +
				"<tbody>";

				$.each(data,function( i,item ) {
					txt_html += "<tr class='tr-hover'>"
					txt_html += "<td class='block'>"
					txt_html += "<a class='short-menu' title='โน๊ตประจำวัน' onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\"><span class='glyphicon icon-notification'></span></a>"
					txt_html += "<a class='short-menu' title='คลิกดูประวัติเปิดปิดย้อนหลัง 7 วัน " + item.shop_code + "' href='history.aspx?shop_code=" + item.shop_code + "#byshop'><span class='glyphicon icon-history iconbold'></span></a>"
					txt_html += "</td>"

					txt_html += "<td>" + item.ro + "</td>"
					txt_html += "<td>" + item.shop_code + "</td>"
					txt_html += "<td><span title='" + item.shop_name + "'>" + limitStr(item.shop_name,25,"...") + "</span></td>"
					txt_html += "<td>" + item.shop_open + "</td>"
					txt_html += "<td>" + item.open_time + "</td>"
					txt_html += "<td class='open-sts-" + item.open_status + "'>" + strOpenStatus(item) + "</td>"
					txt_html += "<td>" + item.shop_close + "</td>"
					txt_html += "<td>" + itemNull(item.pmt_time) + "</td>"
					txt_html += "<td>" + item.close_time + "</td>"
					txt_html += "<td class='close-sts-" + item.close_status + "'>" + strCloseStatus(item) + "</td>"
					// txt_html += "<td></td>";
					txt_html += checkRepIn(item,"open")
					txt_html += checkRepIn(item,"close")
					txt_html += "<td>" + item.first_up + "</td>"
					txt_html += "<td>" + item.last_up + "</td>"
					txt_html += "<td><span onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\" title='" + item.all_note + "' class='td-notation'>" + limitStr(item.all_note,33,"....") + "</span></td>"
					txt_html += "<td><span onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\" title='" + item.notation_desc + "' class='td-notation'>" + limitStr(item.notation_desc,33,"....") + "</span></td>"
					txt_html += "</tr>";
				});

				txt_html += "</tbody>" +
				"</table>" +
				"</div>";

				$('#display_bydate').replaceWith(txt_html);

				$('#table_bydate').dataTable({
					"order": [[ 1, "asc" ]],
					"columnDefs": [
						{ "orderable": false, "targets": 0 },
						{ "bSortable": false, "targets": [ 10 ] },
						{ className: "dtb_left2", "targets": [ 4 ] },
						{ className: "dtb_right1", "targets": [ 6 ] },
						{ className: "dtb_left1", "targets": [ 7 ] },
						{ className: "dtb_right2", "targets": [ 10 ] },
						// { className: "dtb_left2", "targets": [ 11 ] },
						{ className: "dtb_right1", "targets": [ 12 ] },
						{ className: "dtb_left1", "targets": [ 13 ] },
						{ className: "dtb_right2", "targets": [ 14 ] }
					],
					"iDisplayLength": -1,
					"bLengthChange": false,
					paging: false,
					dom: 'Bfrtip',
					buttons: [
					// 'excel', 'print'
					// // 'cocpy', 'csv', 'excel', 'pdf', 'print'
					]
        		});

				$('#table_bydate').fadeIn();
				// $('#foot_bydate').show();

				loadTime = (new Date().getTime() - startTime)/1000;
				console.log("historyByDate load time " + loadTime + " sec")
			},
			error: function(x, t, m) {
				console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

				modalAlert("ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					location.reload();
				})
			}
		});
	}
}

function historyByMonth(){
    startTime = new Date().getTime();

	var txt_month = $('#txt_month').val();
	var sel_ro2 = $('#sel_ro2').val();

	if(txt_month == ""){
		modalAlert("กรุณาเลือกเดือน");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_month').focus();
		})
	}
	else if(sel_ro2 == ""){
		modalAlert("กรุณาเลือกเขตพื้นที่<br><br>หากต้องการ ประวัติการเปิดปิดรายเดือน<br><b><u>ทุกเขตพื้นที่ (ALL)</u></b> ให้คลิก Download Excel");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#sel_ro2').focus();
		})
	}
	else {
		var url = "reportJson.aspx?qrs=historyResult&month=" + txt_month + "&ro=" + sel_ro2;
		console.log(url);

		$.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 120000,
			success: function( data ) { 
				var txt_html = "<div id='display_bymonth'>" +
				"<table id='table_bymonth' class='table table-striped table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
				"<thead>" +
				"<tr>" +
				"<th rowspan='2'></th>" +   
				"<th rowspan='2'>RO</th>" +   
				"<th rowspan='2'>รหัสสาขา</th>" +   
				"<th rowspan='2'>ชื่อสาขา</th>" +  
				"<th rowspan='2'>วันที่</th>" +  
				"<th colspan='3'>เวลาเปิด</th>" +   
				"<th colspan='4'>เวลาปิด</th>" +   
				// "<th rowspan='2' width='5'></th>" +   
				"<th colspan='2'>เวลาเข้าส่วนกลาง</th>" +   
				"<th colspan='2'>การเชื่อมต่อ</th>" +   
				"<th rowspan='2'>หมายเหตุเฉพาะกรณี</th>" +  
				"<th rowspan='2'>โน๊ตประจำวัน</th>" +  
				"</tr>" +
				"<tr>" +
				"<th>เปิดทำการ</th>" +
				"<th>บันทึกเปิด</th>" +
				"<th>สถานะ</th>" +
				"<th>ปิดทำการ</th>" +
				"<th>บันทึกนำส่งเงิน</th>" +
				"<th>บันทึกปิด</th>" +
				"<th>สถานะ</th>" +
				"<th>ตอนเปิด</th>" +
				"<th>ตอนปิด</th>" +
				"<th>ครั้งแรก</th>" +
				"<th>สุดท้าย</th>" +
				"</tr>" +
				"</thead>" +
				"<tbody>";

				$.each(data,function( i,item ) {
					txt_html += "<tr class='tr-hover'>"
					txt_html += "<td class='block'>"
					txt_html += "<a class='short-menu' title='โน๊ตประจำวัน' onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\"><span class='glyphicon icon-notification'></span></a>"
					txt_html += "<a class='short-menu' title='คลิกดูประวัติเปิดปิดย้อนหลัง 7 วัน " + item.shop_code + "' href='history.aspx?shop_code=" + item.shop_code + "#byshop'><span class='glyphicon icon-history iconbold'></span></a>"
					txt_html += "</td>"

					txt_html += "<td>" + item.ro + "</td>"
					txt_html += "<td>" + item.shop_code + "</td>"
					txt_html += "<td><span title='" + item.shop_name + "'>" + limitStr(item.shop_name,25,"...") + "</span></td>"
					txt_html += "<td>" + item.history_date + "</td>"
					txt_html += "<td>" + item.shop_open + "</td>"
					txt_html += "<td>" + item.open_time + "</td>"
					txt_html += "<td class='open-sts-" + item.open_status + "'>" + strOpenStatus(item) + "</td>"
					txt_html += "<td>" + item.shop_close + "</td>"
					txt_html += "<td>" + itemNull(item.pmt_time) + "</td>"
					txt_html += "<td>" + item.close_time + "</td>"
					txt_html += "<td class='close-sts-" + item.close_status + "'>" + strCloseStatus(item) + "</td>"
					// txt_html += "<td></td>";
					txt_html += checkRepIn(item,"open")
					txt_html += checkRepIn(item,"close")
					txt_html += "<td>" + item.first_up + "</td>"
					txt_html += "<td>" + item.last_up + "</td>"
					txt_html += "<td><span onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\" title='" + item.all_note + "' class='td-notation'>" + limitStr(item.all_note,33,"....") + "</span></td>"
					txt_html += "<td><span onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\" title='" + item.notation_desc + "' class='td-notation'>" + limitStr(item.notation_desc,33,"....") + "</span></td>"
					txt_html += "</tr>";
				});

				txt_html += "</tbody>" +
				"</table>" +
				"</div>";

				$('#display_bymonth').replaceWith(txt_html);

				$('#table_bymonth').dataTable({
					"order": [[ 1, "asc" ]],
					"columnDefs": [
						{ "orderable": false, "targets": 0 },
						{ "bSortable": false, "targets": [ 11 ] },
						{ className: "dtb_left2", "targets": [ 5 ] },
						{ className: "dtb_right1", "targets": [ 7 ] },
						{ className: "dtb_left1", "targets": [ 8 ] },
						{ className: "dtb_right2", "targets": [ 11 ] },
						// { className: "dtb_left2", "targets": [ 12 ] },
						{ className: "dtb_right1", "targets": [ 13 ] },
						{ className: "dtb_left1", "targets": [ 14 ] },
						{ className: "dtb_right2", "targets": [ 15 ] }
					],
					"iDisplayLength": -1,
					"bLengthChange": false,
					paging: false,
					dom: 'Bfrtip',
					buttons: [
					// 'excel', 'print'
					]
        		});

				$('#table_bymonth').fadeIn();
				// $('#foot_bymonth').show();

				loadTime = (new Date().getTime() - startTime)/1000;
				console.log("historyByMonth load time " + loadTime + " sec")
			},
			error: function(x, t, m) {
				console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

				modalAlert("ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					location.reload();
				})
			}
		});
	}
}

function historyByShop(){
    startTime = new Date().getTime();

	var hide_shop_code = $('#hide_shop_code').val();
	var txt_start_date = $('#txt_start_date').val();
	var txt_end_date = $('#txt_end_date').val();

	if(hide_shop_code == ""){
		modalAlert("กรุณาระบุสำนักงาน");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#smart_shop_code').focus();
		})
	}
	else if(txt_start_date == ""){
		modalAlert("กรุณาเลือกช่วงวันที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_start_date').focus();
		})
	}
	else if(txt_end_date == ""){
		modalAlert("กรุณาเลือกช่วงวันที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_end_date').focus();
		})
	}
	else {
		var url = "reportJson.aspx?qrs=historyResult&start=" + txt_start_date + "&end=" + txt_end_date + "&shop_code=" + hide_shop_code;
		console.log(url);

		$.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 120000,
			success: function( data ) { 
				var txt_html = "<div id='display_byshop'>" +
				"<table id='table_byshop' class='table table-striped table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
				"<thead>" +
				"<tr>" +
				"<th rowspan='2'></th>" +   
				"<th rowspan='2'>RO</th>" +   
				"<th rowspan='2'>รหัสสาขา</th>" +   
				"<th rowspan='2'>วันที่</th>" +  
				"<th colspan='3'>เวลาเปิด</th>" +   
				"<th colspan='4'>เวลาปิด</th>" +   
				// "<th rowspan='2' width='5'></th>" +   
				"<th colspan='2'>เวลาเข้าส่วนกลาง</th>" +   
				"<th colspan='2'>การเชื่อมต่อ</th>" +   
				"<th rowspan='2'>หมายเหตุเฉพาะกรณี</th>" +  
				"<th rowspan='2'>โน๊ตประจำวัน</th>" +  
				"</tr>" +
				"<tr>" +
				"<th>เปิดทำการ</th>" +
				"<th>บันทึกเปิด</th>" +
				"<th>สถานะ</th>" +
				"<th>ปิดทำการ</th>" +
				"<th>บันทึกนำส่งเงิน</th>" +
				"<th>บันทึกปิด</th>" +
				"<th>สถานะ</th>" +
				"<th>ตอนเปิด</th>" +
				"<th>ตอนปิด</th>" +
				"<th>ครั้งแรก</th>" +
				"<th>สุดท้าย</th>" +
				"</tr>" +
				"</thead>" +
				"<tbody>";

				$.each(data,function( i,item ) {
					txt_html += "<tr class='tr-hover'>"
					txt_html += "<td>"
					txt_html += "<a class='short-menu' title='โน๊ตประจำวัน' onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\"><span class='glyphicon icon-notification'></span></a>"
					txt_html += "</td>"
					txt_html += "<td>" + item.ro + "</td>"
					txt_html += "<td>" + item.shop_code + "</td>"
					txt_html += "<td>" + item.history_date + "</td>"
					txt_html += "<td>" + item.shop_open + "</td>"
					txt_html += "<td>" + item.open_time + "</td>"
					txt_html += "<td class='open-sts-" + item.open_status + "'>" + strOpenStatus(item) + "</td>"
					txt_html += "<td>" + item.shop_close + "</td>"
					txt_html += "<td>" + itemNull(item.pmt_time) + "</td>"
					txt_html += "<td>" + item.close_time + "</td>"
					txt_html += "<td class='close-sts-" + item.close_status + "'>" + strCloseStatus(item) + "</td>"
					// txt_html += "<td></td>";
					txt_html += checkRepIn(item,"open")
					txt_html += checkRepIn(item,"close")
					txt_html += "<td>" + item.first_up + "</td>"
					txt_html += "<td>" + item.last_up + "</td>"
					txt_html += "<td><span onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\" title='" + item.all_note + "' class='td-notation'>" + limitStr(item.all_note,33,"....") + "</span></td>"
					txt_html += "<td><span onclick=\"modalNotation('" + item.shop_code + "','" + item.history_date + "')\" title='" + item.notation_desc + "' class='td-notation'>" + limitStr(item.notation_desc,33,"....") + "</span></td>"
					txt_html += "</tr>";
				});

				txt_html += "</tbody>" +
				"</table>" +
				"</div>";

				$('#display_byshop').replaceWith(txt_html);

				$('#table_byshop').dataTable({
					"columnDefs": [
					{ type: 'date-uk', targets: 3 },
					{ "bSortable": false, "targets": [ 10 ] },
					{ className: "dtb_left2", "targets": [ 4 ] },
					{ className: "dtb_right1", "targets": [ 6 ] },
					{ className: "dtb_left1", "targets": [ 7 ] },
					// { className: "dtb_right2", "targets": [ 9 ] },
					{ className: "dtb_left2", "targets": [ 11 ] },
					{ className: "dtb_right1", "targets": [ 12 ] },
					{ className: "dtb_left1", "targets": [ 13 ] },
					{ className: "dtb_right2", "targets": [ 14 ] }
					],
					"iDisplayLength": -1,
					"bLengthChange": false,
					paging: false,
					dom: 'Bfrtip',
					buttons: [
					// 'excel', 'print'
					]
				});

				$('#table_byshop').fadeIn();
				// $('#foot_byshop').show();

				loadTime = (new Date().getTime() - startTime)/1000;
				console.log("historyByShop load time " + loadTime + " sec")
			},
			error: function(x, t, m) {
				console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

				modalAlert("ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					location.reload();
				})
			}
		});
	}
}

function stateResult(){
    startTime = new Date().getTime();

	var sel_ro3 = $('#sel_ro3').val();
	var sel_cluster = $('#sel_cluster').val();
	var txt_start_date2 = $('#txt_start_date2').val();
	var txt_end_date2 = $('#txt_end_date2').val();

	if(txt_start_date2 == ""){
		modalAlert("กรุณาเลือกช่วงวันที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_start_date2').focus();
		})
	}
	else if(txt_end_date2 == ""){
		modalAlert("กรุณาเลือกช่วงวันที่");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$('#txt_end_date2').focus();
		})
	}
	else {
		var url = "reportJson.aspx?qrs=stateResult&start=" + txt_start_date2 + "&end=" + txt_end_date2 + "&ro=" + sel_ro3 + "&cluster=" + sel_cluster;
		console.log(url);

		$.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 180000,
			success: function( data ) { 
					var txt_html = "<div id='display_state'>" +
					"<table id='table_state' class='table table-striped table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
					"<thead>" +
					"<tr>" +
					"<th rowspan='2'></th>" +   
					"<th rowspan='2'>RO</th>" +   
					"<th rowspan='2'>Cluster</th>" +   
					"<th rowspan='2'>รหัสสาขา</th>" +   
					"<th rowspan='2'>ชื่อสาขา</th>" +  
					"<th colspan='3'>สถานะเปิด (ครั่ง)</th>" +  
					"<th rowspan='2' width='5'></th>" +   
					"<th colspan='2'>สถานะปิด (ครั่ง)</th>" +   
					// "<th colspan='2'>ปิดทำการ (ครั่ง)</th>" +   
					"</tr>" +
					"<tr>" +
					"<th>เปิดปกติ</th>" +
					"<th>เปิดสาย<br>ทั้งหมด</th>" +
					"<th>สายที่เลือก<br>เหตุสุดวิสัย</th>" +
					"<th>ปิดปกติ</th>" +
					"<th>ปิดก่อน<br>ทั้งหมด</th>" +
					"<th>ก่อนที่เลือก<br>เหตุสุดวิสัย</th>" +
					// "<th>วันหยุด</th>" +
					// "<th>ไม่เปิด</th>" +
					"</tr>" +
					"</thead>" +
					"<tbody>";

					$.each(data,function( i,item ) {
						txt_html += "<tr class='tr-hover'>"
						txt_html += "<td><a class='short-menu' title='คลิกดูประวัติเปิดปิดย้อนหลัง 7 วัน " + item.shop_code + "' href='history.aspx?shop_code=" + item.shop_code + "#byshop'><span class='glyphicon icon-history iconbold'></span></a></td>"
						txt_html += "<td>" + item.ro + "</td>"
						txt_html += "<td>" + item.cluster + "</td>"
						txt_html += "<td>" + item.shop_code + "</td>"
						txt_html += "<td><span title='" + item.shop_name + "'>" + limitStr(item.shop_name,25,"...") + "</span></td>"
						txt_html += "<td>" + item.open_normal + "</td>"
						txt_html += "<td>" + item.open_deley + "</td>"
						txt_html += "<td>" + item.open_deley_accident + "</td>"
						txt_html += "<td></td>"
						txt_html += "<td>" + item.close_normal + "</td>"
						txt_html += "<td>" + item.close_pre + "</td>"
						txt_html += "<td>" + item.close_pre_accident + "</td>"
						// txt_html += "<td>" + item.not_open + "</td>"
						// txt_html += "<td>" + item.day_off + "</td>"
						txt_html += "</tr>";
					});

					txt_html += "</tbody>" +
					"</table>" +
					"</div>";

					$('#display_state').replaceWith(txt_html);

					$('#table_state').dataTable({
						"order": [[ 1, "asc" ]],
						"columnDefs": [
						{ "orderable": false, "targets": 0 },
						{ "bSortable": false, "targets": [ 8 ] },
						{ className: "dtb_left2", "targets": [ 5 ] },
						{ className: "dtb_left1", "targets": [ 6 ] },
						{ className: "dtb_right2", "targets": [ 7 ] },
						{ className: "dtb_left2", "targets": [ 9 ] },
						{ className: "dtb_left1", "targets": [ 10 ] },
						{ className: "dtb_right2", "targets": [ 11 ] }
						],
						"iDisplayLength": -1,
						"bLengthChange": false,
						paging: false,
						dom: 'Bfrtip',
						buttons: [
						'excel'//, 'print'
						]
					});

					$('#table_state').fadeIn();

				loadTime = (new Date().getTime() - startTime)/1000;
				console.log("stateResult load time " + loadTime + " sec")
			},
			error: function(x, t, m) {
				console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

				modalAlert("ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					location.reload();
				})
			}
		});
	}
}

function modalAlert(e){
	$('#txt_alert').html(e)
	$('#modal_alert').modal("show");
}

$( document ).ajaxStart(function() {
	$('#page_loading').fadeIn();
});

$( document ).ajaxStop(function() {
	// $("html,body").animate({scrollTop: 0}, 500);
	$('#page_loading').fadeOut();
});



// smart shop_code
$('#smart_shop_code').autocomplete({
    	minLength: 3,
    	focus: function(event, ui) {
    		event.preventDefault();
    		$("#smart_shop_code-search").val(ui.item.label);
    	},
        source: function( request, response ) {
        	console.log('reportJson.aspx?qrs=autoComplete&term='+request.term)
            $.ajax({
                url: 'reportJson.aspx?qrs=autoComplete',
				cache: false,
                data: {term: request.term},
                dataType: "json",
                success: function( data ) {
                    // console.log(data);
                    response( $.map( data.autoComplete, function( item ) {
                    	return {
                    		label: item.shop_label,
                    		value: item.shop_code
                    	}
                    }));
                }
            });
        }
    });

    $("#smart_shop_code").keydown(function(event){
    	if(event.keyCode == 13) {
    		event.preventDefault();
    		return false;
    	}
    	else{
    		$('#smart_shop_code').css('color', '#555');
    		$('#hide_shop_code').val("");
    		$('#smart_lable').val("");
    	}
    });

    $('#smart_shop_code').on('autocompleteselect', function (e, ui) {
    	$('#smart_shop_code').css('color', 'blue');
    	$('#hide_shop_code').val(ui.item.value);
    	$('#smart_lable').val(ui.item.label);
    });

    $('#smart_shop_code').focusout(function() {
    	if($('#hide_shop_code').val() == ""){
    		$('#smart_shop_code').val("");
    	}
    });

function calCuDate(add_date){
	var today = new Date();
	today.setDate(today.getDate() + add_date)
	var dd = today.getDate();
	var mm = today.getMonth() + 1;
	var yyyy = today.getFullYear();

	if(dd<10){
		dd='0'+dd
	} 

	if(mm<10){
		mm='0'+mm
	} 

	return dd+'/'+mm+'/'+yyyy;
}

function strOpenStatus(item){
	if(item.open_status == 3 && item.close_temp == 1)
		return strOffTemp;
	else
		return arrOpenSts[item.open_status]
}

function strCloseStatus(item){
	if(item.close_status == 3 && item.close_temp == 1)
		return strOffTemp;
	else
		return arrCloseSts[item.close_status]
}

function limitStr(str, length, end) {
	if(str.length > length){
		str = str.substring(0, length) + end;
	}

	return itemNull(str);
}
</script>