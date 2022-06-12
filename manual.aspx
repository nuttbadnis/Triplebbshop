<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manual.aspx.vb" Inherits="manual" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>คู่มือ How To [3BB Shop Back Office]</title>

	<link rel="shortcut icon" href="App_Inc/3bfav.ico" type="image/x-icon">
	<link rel="icon" href="App_Inc/3bfav.ico" type="image/x-icon">

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-147236441-1"></script>
    <script type="text/javascript" src="App_Inc/gtag_3bbback.js?id=UA-147236441-1&vs=12"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
	<script src="App_Inc/jquery-1.11.3.min.js"></script>

	<link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
	<script src="App_Inc/bootstrap/js/bootstrap.js"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/stockShop.css?vs=12" />
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
	</style>
</head>
<body>
	<form method="post" runat="server">
		<input runat="server" id="hide_uemail" type="hidden">
		<input runat="server" id="hide_upermiss" type="hidden">
		<nav class="navbar navbar-inverse navbar-fixed-top">
    	<div class="container-fluid">
    		<div class="navbar-header">
    			<a class="navbar-brand" href="default.aspx">3BB SHOP <span class="bn2line">BACK<br>OFFICE</span></a>
    		</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="default.aspx">ข้อมูลสำนักงาน</a></li>
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
    				<li class="use_loged" style="display:none;">
    					<a href="manual.aspx" target="_blank" style="font-size:13px; font-weight:600;">
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

	<div class="container" style="margin-top: 35px;">
		<div class="panel panel-default">
			<div class="panel-heading panel-fonting">คู่มือ How To</div>
			<div class="panel-body">
				<div class="form-horizontal">
					<blockquote>
						<p><a href="manual_3bbshop.aspx" target="_blank">- ขั้นตอนการใช้งานระบบ 3BB Back Office</a></p>
					</blockquote>
					<blockquote>
						<p><a href="manual_shop.aspx" target="_blank">- คู่มือการแก้ไขข้อมูล 3BB Shop</a></p>
					</blockquote>
					<blockquote>
						<p><a href="manual_lineid_shop.aspx" target="_blank">- คู่มือการเพิ่มข้อมูล LINE ID บนหน้า 3BB Shop</a></p>
					</blockquote>
					<blockquote>
						<p><a href="manual_note.aspx" target="_blank">- คู่มือการแจ้งปิดสํานักงานชั่วคราว และแจ้งหมายเหตุหน้าเว็บ 3BB Shop</p>
					</blockquote>
					<blockquote>
						<p><a href="manual_notation_open.aspx" target="_blank">- คู่มือการบันทึกโน๊ตประจําวัน หรือโน๊ตชี้แจ้งเมื่อไม่สามารถ "เปิด" สํานักงานได้ตามเวลา</p>
					</blockquote>
					<blockquote>
						<p><a href="manual_notation_close.aspx" target="_blank">- คู่มือการบันทึกโน๊ตประจําวัน หรือโน๊ตชี้แจ้งเมื่อไม่สามารถ "ปิด" สํานักงานได้ตามเวลา</p>
					</blockquote>
					<blockquote>
						<p><a href="holidays.aspx" target="_blank">- รายการวันหยุดนักขัตฤกษ์</p>
					</blockquote>
					<blockquote>
						<p><a href="user_list.aspx" target="_blank">- รายชื่อผู้มีสิทธิ์แก้ไขข้อมูล 3BB Shop</a></p>
						<p class="txt-red" style="font-size:14px;">*แจ้งขอเพิ่มสิทธิ์แก้ไขข้อมูล 3BB Shop ได้ที่ <a href="mailto:waraporn.kaw@jasmine.com">waraporn.kaw@jasmine.com</a> คุณ วราภรณ์ แก้วคำหาญ (Marketing)</p>
					</blockquote>
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

<script type="text/javascript">

$(document).ready(function() { 
	checkLogin();

	$('#page_loading').fadeOut();
});
</script>

</body>
</html>