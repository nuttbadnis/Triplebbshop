<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_shop.aspx.vb" Inherits="admin_shop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>Management [3BB Shop Back Office]</title>

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

	<style type="text/css">
	.txt-blue {
		color: #004181;
	}
	.txt-orange {
		color: #f7941d;
	}
	a.short-menu {
		padding: 3px;
		cursor: pointer;
		font-size: 12px;
	}
	.filter-bar {
		padding: 0px 0px 20px 0px;
	}
	.table-bordered > thead > tr > th.dtb_left2, .table-bordered > tbody > tr > td.dtb_left2 {
		border-left: solid 2px #9e9e9e !important;
	}
	.table-bordered > thead > tr > th.dtb_right1, .table-bordered > tbody > tr > td.dtb_right1 {
		border-right: solid 1px #9e9e9e !important;
	}
	.table-bordered > thead > tr > th.dtb_left1, .table-bordered > tbody > tr > td.dtb_left1 {
		border-left: solid 1px #9e9e9e !important;
	}
	.table-bordered > thead > tr > th.dtb_right2, .table-bordered > tbody > tr > td.dtb_right2 {
		border-right: solid 2px #9e9e9e !important;
	}
	#btn_filter_search {
		padding: 7px 9px 9px 9px;
	}
	a.glyph-txt-link:hover {
		text-decoration: none;
	}
	#display_table {
		font-size: 13px;
	}
	</style>
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
    			<li class="active only-admin" style="display:none;"><a href="admin_shop.aspx">สำนักงานทั้งหมด</a></li>
    			<li class="only-admin" style="display:none;"><a href="admin_tools.aspx">Admin tools</a></li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="filter-bar form-inline">
			<!-- <a class="btn btn-default" href="admin_approval.aspx" role="button" style="float: left;"><span class="glyphicon glyphicon-ok-circle"></span> สถานะการอนุมัติ Back Office</a> -->

			<div class="input-group">
				<span class="input-group-addon txt-bold">เขตพื้นที่</span>
				<select id="sel_ro" class="form-control input-sm" style="width:135px;">
					<option value="">ALL</option>
				</select>
			</div>

			<div class="input-group">
				<span class="input-group-addon txt-bold">ประเภท</span>
				<select id="sel_type" class="form-control input-sm" style="width:135px;">
					<option value="">ALL</option>
				</select>
			</div>

			<div class="input-group">
				<span class="input-group-addon txt-bold">สถานะ</span>
				<select id="sel_status" class="form-control input-sm" style="width:135px;">
					<option value="">ALL</option>
					<option value="just_open = 1" class="txt-red">รอเพิ่มเติมข้อมูล</option>
					<option value="shop_temp = 1" class="txt-orange">ไม่แสดงผลที่หน้าเว็บ 3BB</option>
					<option value="shop_temp = 2" class="txt-orange">ไม่มีการรับชำระ</option>
					<option value="pos_active = 1 and hide_vas = 0" class="txt-blue">shop active: พร้อม</option>
					<option value="pos_active = 0 and hide_vas = 0 and shop_temp = 0" class="txt-red">shop active: ไม่พร้อม</option>
					<option value="(just_open is null or delete_date is not null)" class="txt-gray">ปิดถาวร/ไม่มีใน Back Office</option>
				</select>
			</div>

			<div class="input-group">
				<span class="input-group-addon txt-bold"><span class="glyphicon glyphicon-eye-close"></span></span>
				<select id="sel_dis" class="form-control input-sm" style="width:135px;">
					<option value="">ALL</option>
					<option value="dis_3bb_shop" class="txt-red">ไม่แสดงในระบบ 3BB Shop Back Office</option>
					<option value="dis_contract" class="txt-red">ไม่แสดงในระบบ 3BB Shop Contract File</option>
				</select>
			</div>

			<button title="ค้นหา" class="btn btn-danger btn-sm" type="button" id="btn_filter_search"><span class="glyphicon glyphicon-search"></span></button>
		</div>

		<div id="display_table">
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

		loadArea();
	})

	$('#btn_filter_search').click(function() {
		loadAllShop();
	});

	function loadArea() {
		var $el = $('#sel_ro');
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "").text("Loading.."));

		$.getJSON('adminJson.aspx?qrs=loadArea', function(data) {
			$el.empty();
			$el.append($("<option></option>")
				.attr("value", "").text("ALL"));

			$.each(data,function( i,item ) {
				$el.append($("<option></option>")
					.attr("value", item.area_code).text(item.area_name));
			});

			loadShopType();
		});
	}

	function loadShopType() {
		var $el = $('#sel_type');
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "").text("Loading.."));

		$.getJSON('adminJson.aspx?qrs=loadShopType', function(data) {
			$el.empty();
			$el.append($("<option></option>")
				.attr("value", "").text("ALL"));

			$.each(data,function( i,item ) {
				$el.append($("<option></option>")
					.attr("value", item.storeKiosType_id).text(item.storeKiosType_name));
			});

			loadAllShop();
		});
	}

	function loadAllShop(){
		var url = "adminJson.aspx?qrs=loadAllShop&ro=" + $('#sel_ro').val() + "&type=" + $('#sel_type').val() + "&status=" + $('#sel_status').val() + "&dis=" + $('#sel_dis').val();
		console.log(url);

		$.ajax({
			url: url,
			dataType: "json",
			timeout: 60000,
			cache:false,
			success: function( data ) { 
				var txt_html = "<div id='display_table'>" +
				"<table id='onthetable' class='table table-striped table-bordered dt-responsive nowrap' cellspacing='0' width='100%'>" +
				"<thead>" +
				"<tr>" +
				"<th></th>" +
				"<th></th>" +
				"<th>RO</th>" +
				"<th>Cluster</th>" +
				"<th>Prov</th>" +
				"<th>รหัสสาขา</th>" +
				"<th>ชื่อสาขา</th>" +
				"<th>ประเภท</th>" +
				"<th>สถานะ</th>" +
				"<th>ไม่แสดงในระบบ<br>3BB Shop Back Office</th>" +
				"<th>ไม่แสดงในระบบ<br>3BB Shop Contract File</th>" +
				"</tr>" +
				"</thead>" +
				"<tbody>";

				$.each(data,function( i,item ) {
					var tmp_shop_temp = "-";
					var tmp_dis_3bb_shop = "<a class='glyph-txt-link' title='คลิกดูข้อมูลสำนักงาน " + item.shop_code + "' target='_blank' href='default.aspx?shop_code=" + item.shop_code + "'><span class='glyphicon icon-file-text2'></span> ข้อมูลสำนักงาน</a>"
					var tmp_dis_contract = "<a class='glyph-txt-link' title='คลิกดูข้อมูลสำนักงาน " + item.shop_code + "' target='_blank' href='contract/updateContract.aspx?shop_code=" + item.shop_code + "'><span class='glyphicon icon-clipboard'></span> ข้อมูลสัญญา</a>"

					if(item.just_open == 1)
						tmp_shop_temp = "<span class='txt-red'>รอเพิ่มเติมข้อมูล</span>";
					else if(item.shop_temp == 1)
						tmp_shop_temp = "<span class='txt-orange'>ไม่แสดงผลที่หน้าเว็บ 3BB</span>";
					else if(item.shop_temp == 2)
						tmp_shop_temp = "<span class='txt-orange'>ไม่มีการรับชำระ</span>";
					else if(item.pos_active == 1 && item.hide_vas == 0)
						tmp_shop_temp = "<span class='txt-blue'>shop active: พร้อม</span>";
					else if(item.pos_active == 0 && item.hide_vas == 0)
						tmp_shop_temp = "<span class='txt-red'>shop active: ไม่พร้อม</span>";

					if(item.dis_3bb_shop == 1)
						tmp_dis_3bb_shop = "<span class='txt-red'><span class='glyphicon glyphicon-eye-close'></span> ไม่แสดง</span>";

					if(item.dis_contract == 1)
						tmp_dis_contract = "<span class='txt-red'><span class='glyphicon glyphicon-eye-close'></span> ไม่แสดง</span>";

					txt_html += "<tr>"

					txt_html += "<td class='block'>" + item.or_der + "</td>"

					if(item.or_der == '-1') {
						txt_html += "<td class='block'>"
						txt_html += "<a class='short-menu' title='คลิกแสดงข้อมูลสำนักงาน " + item.shop_code + "' target='_blank' href='default.aspx?shop_code=" + item.shop_code + "'><span class='glyphicon icon-file-text2'></span></a>"
						txt_html += "</td>"
						tmp_dis_3bb_shop = "-"
						tmp_dis_contract = "-"
						tmp_shop_temp = "<span class='txt-gray'>ปิดถาวร/ไม่มีใน Back Office</span>";
					}
					else {
						txt_html += "<td class='block'>"
						txt_html += "<a class='short-menu' title='คลิกแก้ไขข้อมูลสำนักงาน " + item.shop_code + "' target='_blank' href='updateStockShop.aspx?shop_code=" + item.shop_code + "'><span class='glyphicon glyphicon-edit'></span></a>"
						txt_html += "<a class='short-menu' title='คลิกแก้ไขไม่แสดงผลในระบบ " + item.shop_code + "' target='_blank' href='updateDisbleShop.aspx?shop_code=" + item.shop_code + "'><span class='glyphicon glyphicon-eye-close'></span></a>"
						txt_html += "</td>"
					}

					txt_html += "<td>" + itemNull(item.ro) + "</td>"
					txt_html += "<td>" + itemNull(item.cluster) + "</td>"
					txt_html += "<td><span title='" + item.province_name + "'>" + itemNull(item.province_short) + "</span></td>"
					txt_html += "<td>" + item.shop_code + "</td>"
					txt_html += "<td><span title='" + item.shop_name + "'>" + limitStr(item.shop_name,30) + "</span></td>"
					txt_html += "<td><span title='" + item.storeKiosType_name + "'>" + limitStr(itemNull(item.storeKiosType_name),7) + "</span></td>"
					txt_html += "<td>" + tmp_shop_temp + "</td>"
					txt_html += "<td>" + tmp_dis_3bb_shop + "</td>"
					txt_html += "<td>" + tmp_dis_contract + "</td>"
					txt_html += "</tr>"
				});

				txt_html += "</tbody>" +
				"</table>" +
				"</div>";

				$('#display_table').replaceWith(txt_html);
				$('#onthetable').dataTable({
					"iDisplayLength": -1,
					paging: false,
					"columnDefs": [
					{ "visible": false,"searchable": false, "targets": [ 0 ]},
					{ "orderable": false, "targets": 0 },
					{ "orderable": false, "targets": 1 },
					{ className: "dtb_left2",  "targets": [6] },
					],
					"order": [[ 0, "desc" ]]
				});
			},
			error: function(x, t, m) {
				console.log('x>' + x + ' t>' + t + ' m>' + m);
				modalAlert('ajax fail!');
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
