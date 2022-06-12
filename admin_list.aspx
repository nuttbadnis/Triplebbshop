<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_list.aspx.vb" Inherits="admin_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
	<title>Admin List [3BB Shop Back Office]</title>

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

	<link rel="stylesheet" type="text/css" href="App_Inc/DataTables/datatables.css"/>
	<script type="text/javascript" src="App_Inc/DataTables/datatables.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/fnFilterClear.js"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=12" />

    <script src="App_Inc/panu.js?vs=12"></script>

    <style type="text/css">
    .ui-autocomplete {
    	z-index: 99999; 
    }
    #modal_alert {
    	z-index: 99999; 
    }
    tr.just-update {
    	color: #004181;
    	background-color: #e5f2fd !important;
    }
    tr.txt-red {
    	color: #BD0000;
    	background-color: #fde5ed !important;
    }
    </style>
</head>
<body>	
	<form id="form1" runat="server"></form>
    <input runat="server" id="hide_uemail" type="hidden">
    <input runat="server" id="hide_upermiss" type="hidden">
    <input runat="server" id="hide_token" type="hidden">
    <input runat="server" id="hide_this_edit" type="hidden">
    <input runat="server" id="hide_this_edit_by" type="hidden">

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="default.aspx">3BB SHOP <span class="bn2line">BACK<br>OFFICE</span></a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="default.aspx">ข้อมูลสำนักงาน</a></li>
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
                    <li class="dropdown active">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">รายชื่อตามสิทธิ์ <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="ro_province.aspx">รายชื่อผู้อำนวยการ/ผู้จัดการ</a></li>
                            <li class="active"><a href="user_list.aspx">รายชื่อผู้มีสิทธิ์ แก้ไขข้อมูล 3BB Shop</a></li> 
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
                <li><a href="user_list.aspx">Back Office Editor</a></li>
                <li class="active"><a href="admin_list.aspx">Back Office Admin</a></li>
            </ul>
        </div>
    </nav>

	<div class="container">
		<p class="lead" style="color: #004181;">รายชื่อผู้อนุมัติการแก้ไขข้อมูล 3BB Shop</p>

		<button runat="server" id="btn_new" type="button" class="btn btn-default" onclick="newUser()" style="display: none;">
			<span class="glyphicon glyphicon-plus"></span> เพิ่ม Admin ใหม่
		</button>

		<div id="display_table">
			<table id="table_user" class='table table-striped table-bordered table-report' cellspacing='0' width='100%' style="display:none;">
				<thead>
					<tr style="font-weight: 600;">
						<th>UEMAIL</th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody id="table_editor" runat="server"></tbody>
			</table>
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

	<div id="modal_edit" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-nm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="modal_title">แก้ไขข้อมูล User</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12">
							<div class="input-group">
								<span class="input-group-addon txt-bold ">UEMAIL</span>
								<input id="auto_uemail" type="text" class="form-control" placeholder="ค้นหาอัตโนมัติโดย ชื่อ หรืออีเมล์">
								<input id="hide_new_uemail" type="hidden">
								<input id="hide_id" type="hidden">
								<input id="hide_new_id" type="hidden">
							</div>
						</div>
					</div>
					<div style="display:none;">
						<hr class="end-row">
						<div class="row">
							<div class="col-xs-12">
								<div class="input-group">
									<span class="input-group-addon txt-bold ">RO</span>
									<select id="sel_ro" class="form-control">
										<option value="ALL">ALL</option>
									</select>
								</div>
							</div>
						</div>
						<hr class="end-row">
						<div class="row">
							<div class="col-xs-12">
								<div class="input-group">
									<span class="input-group-addon txt-bold ">CLUSTER</span>
									<select id="sel_cluster" class="form-control" disabled>
										<option value="ALL">ALL</option>
									</select>
								</div>
							</div>
						</div>
						<hr class="end-row">
						<div class="row">
							<div class="col-xs-12">
								<div class="input-group">
									<span class="input-group-addon txt-bold ">PROVINCE</span>
									<select id="sel_province" class="form-control" disabled>
										<option value="ALL">ALL</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btn_save_edit" type="button" class="btn btn-success" onclick="saveEditUPermiss()">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> บันทึกการแก้ไข
					</button>
					<button id="btn_save_new" type="button" class="btn btn-success" onclick="saveNewUPermiss()" style="display:none;">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> บันทึก
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
				</div>
			</div>
		</div>
	</div>

	<div id="modal_confirm" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">คุณต้องการลบสิทธิ์ของ <span id="user_remove" class="txt-red"></span> ใช่ไหม?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-danger" id="btn_remove">ใช่</button>
					<button type="button" data-dismiss="modal" class="btn">ยกเลิก</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script src="App_Inc/user_list.js?vs=12222"></script>
<script type="text/javascript">
$(document).ready(function() { 
    checkLogin();

    if(navigator.userAgent.indexOf('MSIE')>0){  
        $('#txt_loading').html(" คุณกำลังใช้โปรแกรมที่ไม่สนับสนุน กรุณาใช้ Chrome หรือ Firefox");
        $('#page_loading').fadeIn();
    }  
    else {
    	col_area = false;
    	loadRO('#sel_ro');
    	loadData();
    }
} );

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