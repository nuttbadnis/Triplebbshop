<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_tools.aspx.vb" Inherits="admin_tools" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>Admin tools [3BB Shop Back Office]</title>

	<link rel="shortcut icon" href="App_Inc/3bfav.ico" type="image/x-icon">
	<link rel="icon" href="App_Inc/3bfav.ico" type="image/x-icon">

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-147236441-1"></script>
    <script type="text/javascript" src="App_Inc/gtag_3bbback.js?id=UA-147236441-1&vs=12"></script>

	<link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
	<script src="App_Inc/jquery-1.11.3.min.js"></script>

	<link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
	<script src="App_Inc/bootstrap/js/bootstrap.js"></script>

	<link rel="stylesheet" type="text/css" href="App_Inc/DataTables/datatables.css"/>
	<script type="text/javascript" src="App_Inc/DataTables/datatables.js"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=12222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=12" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<script src="App_Inc/panu.js?vs=12"></script>
	<script src="App_Inc/var.js?vs=12"></script>
</head>
<body>	
	<form method="post" runat="server"></form>
    <input runat="server" id="hide_uemail" type="hidden">
    <input runat="server" id="hide_upermiss" type="hidden">

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

	<!-- <ol class="breadcrumb">
		<li>Shop</li>
		<li class="active"><span class="glyphicon glyphicon-eye-close"></span> จัดการระบบ Back Office</li>
	</ol> -->

	<nav class="navbar navbar-default">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
    			<li><a href="admin_approval.aspx">สถานะการอนุมัติ</a></li>
    			<li class="only-admin" style="display:none;"><a href="admin_report.aspx">รายงานขออนุมัติปิดศูนย์ชั่วคราว</a></li>
    			<li class="only-admin" style="display:none;"><a href="admin_shop.aspx">สำนักงานทั้งหมด</a></li>
    			<li class="active only-admin" style="display:none;"><a href="admin_tools.aspx">Admin tools</a></li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				จัดการลิงค์ (URL) ที่อนุญาตให้กรอกในหมายเหตุ
			</div>
			<div class="panel-body">
				<button runat="server" id="btn_new" type="button" class="btn btn-default btm-sm" onclick="modalEditURL('new', 0, '')">
					<span class="glyphicon glyphicon-plus"></span> เพิ่ม URL ใหม่
				</button>

				<table class="table table-striped" id="table_url"> 
					<thead> 
						<tr> 
							<th width="30%">URL</th>
							<th width="20%">เพิ่มโดย</th>
							<th width="10%">วันที่เพิ่ม</th>
							<th width="20%">แก้ไขล่าสุด</th>
							<th width="10%">วันที่แก้ไข</th>
							<th width="120"></th> 
						</tr> 
					</thead> 
					<tbody> 
						<tr> 
							<td colspan="6">-</td>
						</tr> 
					</tbody> 
				</table>
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
				<span id="top-link-block">
					<a class='btn btn-default' onclick="$('html,body').animate({scrollTop:0},'slow');return false;">
						<i class="glyphicon glyphicon-chevron-up"></i>
					</a>
				</span>
			</div>
		</div>
	</footer>

	<div id="page_loading" class="modal-backdrop">
		<div class="in-loading not-nm">
			<span class="glyphicon glyphicon-refresh gly-spin"></span><span id="txt_loading"> กรุณารอสักครู่...</span>
		</div>
		<div class="in-loading not-ie">
			<h3><strong>ระบบไม่รองรับการใช้งานด้วยโปรแกรม Internet Explorer กรุณาใช้ Chrome หรือ Firefox</strong></h3>
		</div>
	</div>

	<div id="modal_edit_url" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">บันทึกการแก้ไข</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12">
							<div class="input-group" style="width: 100%;">
								<label>URL</label>
								<textarea id="txtar_url" class="form-control" rows="1" placeholder="https://www.3bb.co.th/pay/channel/"></textarea>
							</div>
						</div>
					</div>
					<hr class="end-row">
					<div class="row">
						<div class="col-xs-12">
							<div class="input-group" style="width: 100%;">
								<label>ตัวอย่างลิงค์</label>
								<br>
								<a href="" id="ex_url" target='_blank'></a>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="hide_no_url">
					<button type="button" data-dismiss="modal" class="btn btn-success" id="btn_url_insert" style="display: none;">บันทึก</button>
					<button type="button" data-dismiss="modal" class="btn btn-success" id="btn_url_update" style="display: none;">ยืนยันบันทึก</button>
					<button type="button" data-dismiss="modal" class="btn btn-danger" id="btn_url_disable" style="display: none;">ยืนยันการลบ</button>
					<button type="button" data-dismiss="modal" class="btn">ยกเลิก</button>
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
					<button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	var thistimeout;

	$(document).ready(function() {
		var isIE11 = !!navigator.userAgent.match(/Trident.*rv\:11\./);

		if(navigator.userAgent.indexOf('MSIE')>0){  
			$('#page_loading').show();
			return;
		}
		else if(isIE11 == true || /Edge/.test(navigator.userAgent)) {
			var not_nm = document.getElementsByClassName("not-nm"); 
			for(var i = 0; i < not_nm.length; i++){ 
				not_nm[i].style.display = "none"; 
			}

			var not_ie = document.getElementsByClassName("not-ie"); 
			for(var i = 0; i < not_ie.length; i++){ 
				not_ie[i].style.display = "table"; 
			}

			forerror();
		}

		if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN"){
			$('.navbar-nav li.only-admin').show();
		}

		loadAllshopStockNoteURL();
	})

	function loadAllshopStockNoteURL(){
		var url = "adminJson.aspx?qrs=loadAllshopStockNoteURL";
		console.log(url);

		$.ajax({
			url: url,
			dataType: "json",
			timeout: 60000,
			cache:false,
			success: function( data ) { 
				if(data.length > 0){
					var tbody = "";
					$.each(data,function( i,item ) {
						tbody += "<tr>"
						tbody += "<td>" + tbURL(item.url_validate) + "</td>"
						tbody += "<td>" + itemNull(item.create_date) + "</td>"
						tbody += "<td>" + itemNull(item.create_by) + "</td>"
						tbody += "<td>" + itemNull(item.update_date) + "</td>"
						tbody += "<td>" + itemNull(item.update_by) + "</td>"

						tbody += "<td>"
						tbody += "	<div class='btn-group'>"
						tbody += "		<button type='button' class='btn btn-default btn-sm' onclick='modalEditURL(\"edit\", " + item.no + ",\"" + itemNull(item.url_validate) + "\");' title='แก้ไข'>"
						tbody += "			<span class='glyphicon glyphicon-edit' aria-hidden='true'></span>"
						tbody += "		</button>"
						tbody += "		<button type='button' class='btn btn-default btn-sm' onclick='modalEditURL(\"remove\", " + item.no + ",\"" + itemNull(item.url_validate) + "\");' title='ลบ'>"
						tbody += "			<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>"
						tbody += "		</button>"
						tbody += "	</div>"
						tbody += "</td>"

						tbody += "</tr>"
					});

					$('#table_url tbody').html(tbody);
				}
			},
			error: function(x, t, m) {
				console.log('x>' + x + ' t>' + t + ' m>' + m);
				modalAlert('ajax fail!');
			}
		});
}

function tbURL(a) {
	return "<a target='_blank' href='" + a + "'>" + a + "</a>";
}

function exURL(a) {
	a = "<a id='ex_url' target='_blank' href='" + a + "'>" + a + "</a>";
	$("#ex_url").replaceWith(a);
}

$( "#txtar_url" ).keypress(function() {
	var a = $(this).val();
    exURL(a);
});

$("#txtar_url").bind("paste", function(e){
    var a = e.originalEvent.clipboardData.getData('text');
    exURL(a);
} );

function modalEditURL(action, no, txt){
	exURL("");
	$('#txtar_url').val("");
	$('#hide_no_url').val(0);
	$('#btn_url_insert').hide();
	$('#btn_url_update').hide();
	$('#btn_url_disable').hide();
	$('#modal_edit_url').modal("show");

	if(action == "edit"){
		$("#modal_edit_url h4").html("บันทึกการแก้ไข URL");
		$('#btn_url_update').show();
		$('#hide_no_url').val(no);
		$('#txtar_url').val(txt);
		exURL(txt);
	}
	else if(action == "remove"){
		$("#modal_edit_url h4").html("ต้องการลบ URL นี้?");
		$('#btn_url_disable').show();
		$('#hide_no_url').val(no);
		$('#txtar_url').val(txt);
		exURL(txt);
	}
	else {
		$("#modal_edit_url h4").html("เพิ่ม URL ที่อนุญาตให้กรอกในหมายเหตุ");
		$('#btn_url_insert').show();
	}
}

function checkSubmitURL() {
	var $el1 = $("#txtar_url");

	if( $el1.val() == "" ){
		modalAlert("กรุณากรอก URL ที่อนุญาตให้กรอกในหมายเหตุ");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el1.focus();
		})
		return 0;
	}

	return 1;
}

$( "#btn_url_insert" ).click(function() {
	if(checkSubmitURL() == 1){
		goSubmitURL("insert");
	}
});

$( "#btn_url_update" ).click(function() {
	if(checkSubmitURL() == 1){
		goSubmitURL("update");
	}
});

$( "#btn_url_disable" ).click(function() {
	goSubmitURL("disable");
});

function goSubmitURL(action) {
	var url = "";
	if(action == "insert") url = "adminJson.aspx?qrs=newShopStockNoteURL";
	else if(action == "update") url = "adminJson.aspx?qrs=saveShopStockNoteURL";
	else if(action == "disable") url = "adminJson.aspx?qrs=removeShopStockNoteURL";

	if(url != ""){
		$.ajax({
			url: url,
			cache: false,
			type: "post",
			timeout: 60000,
			data: { 
				uemail: $('#hide_uemail').val(),
				no_url: $('#hide_no_url').val(),
				url_validate: $('#txtar_url').val().trim(),
			},
			success: function( res ) {
				console.log("res = " + res);
				if(res == 1) {
					modalAlert('บันทึกเรียบร้อยแล้ว');
					loadAllshopStockNoteURL();
				}
				else if(res == 9) {
					modalAlert("<b class='txt-red'>" + $('#txtar_url').val() + '</b><br><br>ไม่สำเร็จ เนื่องจากมี URL นี้ในระบบแล้ว');
				}
				else {
					modalAlert('ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com [#10]');
				}

			},
			error: function(x, t, m) {
				modalAlert('ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com [#20]');
			}
		});
	}
	else {
		modalAlert('ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com [#30]');
	}
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
