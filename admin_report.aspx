<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_report.aspx.vb" Inherits="admin_report" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>Flash Report [3BB Shop Back Office]</title>

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

	<link rel="stylesheet" type="text/css" href="App_Inc/MonthPicker/MonthPicker.css" />
	<script type="text/javascript" src="App_Inc/MonthPicker/MonthPicker.js"></script>

	<link rel="stylesheet" type="text/css" href="App_Inc/DataTables/datatables.css"/>
	<script type="text/javascript" src="App_Inc/DataTables/datatables.js"></script>

	<link rel="stylesheet" type="text/css" href="App_Inc/DataTables/buttons_datatable/buttons.dataTables.min.css"/>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/buttons.flash.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/jszip.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/pdfmake.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/vfs_fonts.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/buttons.html5.min.js"></script>
	<script type="text/javascript" src="App_Inc/DataTables/buttons_datatable/buttons.print.min.js"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=12" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<script src="App_Inc/panu.js?vs=12"></script>
	<script src="App_Inc/var.js?vs=12"></script>
	<script src="App_Inc/external_followreq.js?vs=12222"></script>

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

	<nav class="navbar navbar-default">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
    			<li><a href="admin_approval.aspx">สถานะการอนุมัติ</a></li>
    			<li class="active only-admin" style="display:none;"><a href="admin_report.aspx">รายงานขออนุมัติปิดศูนย์ชั่วคราว</a></li>
    			<li class="only-admin" style="display:none;"><a href="admin_shop.aspx">สำนักงานทั้งหมด</a></li>
    			<li class="only-admin" style="display:none;"><a href="admin_tools.aspx">Admin tools</a></li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="tab-content">

			<div class="alert alert-danger alert-dismissible" role="alert" style="line-height:24px;">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong>** เลือกแสดงข้อมูล <u>รายงานขออนุมัติปิดศูนย์ชั่วคราว</u> ได้ตั้งแต่ เดือน 04/2019 เป็นต้นไป</strong><br>
				<ul style="list-style-type:disc; padding: 15px 0 0 15px;">
					<li>สถานะ "อนุมัติแล้ว" จะเป็นข้อมูลจากฐานข้อมูล "หมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB"</li>
					<li>สถานะอื่นๆ จะเป็นข้อมูลจากฐานข้อมูล "สถานะการอนุมัติ"</li>
				</ul>
			</div>

			<div class="filter-bar form-inline">
				<div class="input-group">
					<span class="input-group-addon txt-bold">เดือนที่ขอปิด</span>
					<input type="text" class="form-control input-sm month-year-input" style="width:115px;" maxlength="7" placeholder="__/____" id="monthpicker" readonly>
				</div>

				<div class="input-group">
					<span class="input-group-addon txt-bold">สถานะ</span>
					<select id="sel_status" class="form-control input-sm" style="width:115px;">
						<option value="">ALL</option>
					</select>
				</div>

				<button title="ค้นหา" class="btn btn-danger btn-sm" type="button" id="btn_filter_search"><span class="glyphicon glyphicon-search"></span></button>

				<button type="button" class="btn btn-primary btn-sm" id="btn_export" style="float: right;">Download Excel</button>
				</div>
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

		getThisDate();
	})

	$('#btn_filter_search').click(function() {
		loadAllShopStockNote();
	});

	function getThisDate() {
		var url = "adminJson.aspx?qrs=getThisDate";
		console.log(url);

		$.ajax({
			url: url,
			dataType: "json",
			timeout: 60000,
			cache:false,
			success: function( data ) { 
				var var_dtm = data[0].dtm;
				var_dtm = var_dtm.substring(var_dtm.length - 7)

				$('#monthpicker').val(var_dtm);

				var_dtm = var_dtm.substring(var_dtm.length - 4)

				$('#monthpicker').MonthPicker({
					Button: false,
					StartYear: parseInt(var_dtm)
				});

				loadApproveStatus();
			},
			error: function(x, t, m) {
				console.log('x>' + x + ' t>' + t + ' m>' + m);
				modalAlert('ajax fail!');
			}
		});
	}

	function loadApproveStatus() {
		var $el = $('#sel_status');
		$el.empty();
		$el.append($("<option></option>")
			.attr("value", "").text("Loading.."));

		$.getJSON('adminJson.aspx?qrs=loadApproveStatus', function(data) {
			$el.empty();
			$el.append($("<option></option>")
				.attr("value", "").text("ALL"));

			$.each(data,function( i,item ) {
				$el.append($("<option></option>")
					.attr("value", item.status_id).text(item.status_name));
			});

			loadAllShopStockNote();
		});
	}

	function loadAllShopStockNote(){
		var url = "adminJson.aspx?qrs=loadAllShopStockNote&status=" + $('#sel_status').val() + "&pig_month=" + $('#monthpicker').val();
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
				"<th>Follow Requset</th>" +
				"<th>RO</th>" +
				"<th>Cluster</th>" +
				"<th>รหัสสาขา</th>" +
				"<th>ชื่อสาขา</th>" +
				"<th>สถานะ</th>" +
				"<th>เริ่มปิดวันที่</th>" +
				"<th>ปิดถึงวันที่</th>" +
				"<th>จำนวนวัน</th>" +
				"<th>วันที่สร้าง</th>" +
				"<th>ผู้สร้าง</th>" +
				"<th>หมายเหตุแสดงบนเว็บ 3BB</th>" +
				"<th>คำอธิบายชี้แจงผู้อนุมัติ</th>" +
				"</tr>" +
				"</thead>" +
				"<tbody>";

				$.each(data,function( i,item ) {
					var follow_id = "-";

					if(checkNotEmpty(item.follow_id)){
						follow_id = "<a href='#' class='short-menu follow-link' onclick='popupFollow(\"backof10\",\"" + item.follow_id + "\");' title='เลขที่คำขอ " + item.follow_id + "'>" + item.follow_id + "</a>";
					}

					txt_html += "<tr>"
					txt_html += "<td>" + follow_id + "</td>"
					txt_html += "<td>" + itemNull(item.RO) + "</td>"
					txt_html += "<td>" + itemNull(item.CLUSTER) + "</td>"
					txt_html += "<td><a class='short-menu' title='คลิกดูข้อมูลสำนักงาน " + item.shop_code + "' target='_blank' href='default.aspx?shop_code=" + item.shop_code + "'>" + item.shop_code + "</a></td>"
					txt_html += "<td><span title='" + item.shop_name + "'>" + limitStr(item.shop_name,30) + "</span></td>"
					txt_html += "<td>" + arrStatusProveReport[item.approve_status] + "</td>"
					txt_html += "<td>" + itemNull(item.start_close_date) + "</td>"
					txt_html += "<td>" + itemNull(item.end_close_date) + "</td>"
					txt_html += "<td>" + itemNull(item.diff_date) + " วัน</td>"
					txt_html += "<td>" + itemNull(item.create_date) + "</td>"
					txt_html += "<td>" + itemNull(item.create_by) + "</td>"
					txt_html += "<td><span title='" + item.note_desc + "'>" + limitStr(item.note_desc,200) + "</span></td>"
					txt_html += "<td><span title='" + item.explain_desc + "'>" + limitStr(item.explain_desc,200) + "</span></td>"
					txt_html += "</tr>"
				});

				txt_html += "</tbody>" +
				"</table>" +
				"</div>";

				$('#display_table').replaceWith(txt_html);
				$('#onthetable').dataTable({
					"iDisplayLength": -1,
					paging: false,
					// dom: 'Bfrtip',
					// buttons: [
					// 'excel', 'print'
					// ],
					"columnDefs": [
					{ 
						"orderable": false, "targets": 0 
					},
					],
					"order": [[ 1, "asc" ]]
				});
			},
			error: function(x, t, m) {
				console.log('x>' + x + ' t>' + t + ' m>' + m);
				modalAlert('ajax fail!');
			}
		});
}

$('#btn_export').click(function() {
	var url = "xportAdmin.aspx?qrs=loadAllShopStockNote&status=" + $('#sel_status').val() + "&pig_month=" + $('#monthpicker').val();
	console.log("export execl " + url);
	window.open(url);
});

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
