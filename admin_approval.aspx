<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_approval.aspx.vb" Inherits="admin_approval" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>Approval [3BB Shop Back Office]</title>

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

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=12222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=122" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<script src="App_Inc/panu.js?vs=12"></script>
	<script src="App_Inc/var.js?vs=122"></script>
	<script src="App_Inc/external_followreq.js?vs=122222"></script>

	<style type="text/css">
	.pic_ex {
		margin-bottom: 15px;
		width: 380px;
		height: 280px;
	}
	#txt_ok_comment, #txt_admin_comment {
		min-width: 45%;
		margin-right: 10px;
	}
	.filter-bar {
		padding: 0px 0px 20px 0px;
	}
	#display_table {
		font-size: 13px;
	}
	.pop-link {
		font-size: 13px;
	}
	.follow-link {
		font-size: 11px;
		margin-left: 5px;
		color: #999;
	}
	.pop-link:hover, .follow-link:hover {
		text-decoration: none;
		color: #FF9800;
	}
	.topic-1 {
		color: #696969;
	}
	.topic-2 {
		color: #0058c5;
	}
	.topic-3 {
		color: #8b4fff;
	}
	.topic-4 {
		color: #ff5e00;
	}
	.topic-5 {
		color: #e20000;
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
    			<li class="active"><a href="admin_approval.aspx">สถานะการอนุมัติ</a></li>
    			<li class="only-admin" style="display:none;"><a href="admin_report.aspx">รายงานขออนุมัติปิดศูนย์ชั่วคราว</a></li>
    			<li class="only-admin" style="display:none;"><a href="admin_shop.aspx">สำนักงานทั้งหมด</a></li>
    			<li class="only-admin" style="display:none;"><a href="admin_tools.aspx">Admin tools</a></li>
    		</ul>

    		<div class="navbar-form navbar-right" role="search">
    			<div class="input-group">
    				<div class="input-group-addon" id="loading_icon" style="display:none;">
    					<span class="glyphicon glyphicon-refresh gly-spin" aria-hidden="true"></span>
    				</div>
    				<input type="text" class="form-control input-sm" id="smart_search" placeholder="รหัสสาขา ชื่อสาขา จังหวัด เขต/อำเภอ">
    				<div class="input-group-addon" id="search_icon">
    					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    				</div>
    			</div>
    		</div>
    	</nav>

	<!-- <ol class="breadcrumb">
		<li>Shop</li>
		<li class="active"><span class="glyphicon glyphicon-ok-circle"></span> สถานะการอนุมัติ Back Office</li>
	</ol> -->

	<div class="container">
		<!-- <div class="filter-bar form-inline text-right" id="btn_backoffice" runat="server">
			<a class="btn btn-default" href="admin_shop.aspx" role="button" style="float: left;"><span class="glyphicon glyphicon-eye-close"></span> จัดการระบบ Back Office</a>

		</div> -->

		<div id="display_table"></div>
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

	<div id="modal_approve" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="modal_approve_title">ขออนุมัติ การเปลี่ยนแปลงข้อมูล</h4>
					<span style="font-size:10px; color:#888;" id="modal_no_approve"></span>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon txt-bold ">Code</span>
								<input id="modal_approve_code" type="text" class="form-control" style="width:100px;" readonly>
							</div>
						</div>
						<div class="col-xs-6">
							<div id="prove_0" class="input-group">
								<span class="input-group-addon edt"><span class="glyphicon glyphicon-retweet" aria-hidden="true"></span></span>
								<input type="text" class="form-control txt-bold edt" value="รอ MKT" style="width:100px;" readonly>
							</div>
							<div id="prove_3" class="input-group">
								<span class="input-group-addon edt-follow"><span class="glyphicon glyphicon-retweet" aria-hidden="true"></span></span>
								<input type="text" class="form-control txt-bold edt-follow" value="รออนุมัติ" style="width:100px;" readonly>
							</div>
							<div id="prove_9" class="input-group">
								<span class="input-group-addon edt-approve"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></span>
								<input type="text" class="form-control txt-bold edt-approve" value="อนุมัติแล้ว" style="width:100px;" readonly>
							</div>
							<div id="prove_8" class="input-group">
								<span class="input-group-addon edt-cancle"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></span>
								<input type="text" class="form-control txt-bold edt-cancle" value="ไม่อนุมัติ" style="width:100px;" readonly>
							</div>
							<div id="prove_remark" class="input-group" style="display:none; margin-top:10px;">
								<span class="input-group-addon edt-cancle"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></span>
								<input type="text" class="form-control edt-cancle input-sm txt-remark" value="แก้ไขข้อมูลล่าสุดโดยผู้ดูแล" readonly>
							</div>
						</div>
					</div>
					<div id="modal_approve_txt"></div>
				</div>
				<div id="prove_btn" class="modal-footer">
					<button id="btn_edit" type="button" class="btn btn-warning" data-dismiss="modal" style="display:none;">
						<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> แก้ไข
					</button>
					<button id="btn_ok_prove" type="button" class="btn btn-success" style="display:none;">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> อนุมัติ
					</button>
					<button id="btn_cancle_prove" type="button" class="btn btn-danger" style="display:none;">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> ไม่อนุมัติ
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
				</div>
				<div id="prove_ok" class="modal-footer form-inline" style="display:none;">
					<input id="txt_ok_comment" type="text" class="form-control" placeholder="ฝากข้อความถึง Editor หากไม่มีให้เว้นว่าง" data-toggle="tooltip" data-placement="left" title="หากไม่มีให้เว้นว่างไว้">
					<button id="btn_ok_confirm" type="button" class="btn btn-success" data-dismiss="modal">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> อนุมัติ
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
				</div>
				<div id="prove_cancle" class="modal-footer form-inline" style="display:none;">
					<input id="txt_admin_comment" type="text" class="form-control" placeholder="เหตุผลที่ไม่อนุมัติ" data-toggle="tooltip" data-placement="left" title="กรุณากรอกเหตุผล">
					<button id="btn_cancle_confirm" type="button" class="btn btn-danger">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> ไม่อนุมัติ
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
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
	
		$('[data-toggle="tooltip"]').tooltip();

		if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN"){
			$('.navbar-nav li.only-admin').show();
		}

		loadPendingProve();
		// checkReload();
	})

	// document.onmousemove = function(){
	// 	clearTimeout(thistimeout)
	// 	checkReload();
	// }

	// function checkReload() {
	// 	thistimeout = setTimeout(function() {
	// 		checkReload();

	// 		if(sessionout == 0){
	// 			console.log("reloadData");
	// 			loadPendingProve();
	// 		}

	// 	}, 60000);
	// }

	function loadPendingProve(){
		var shop_code = $('#smart_search').val();

		if (typeof shop_code == 'undefined') {
			shop_code = "";
		}


		var url = "adminJson.aspx?qrs=pendingProve&uemail=" + $('#hide_uemail').val() + "&shop_code=" + shop_code + "&limit=" + _GET('limit');
		console.log(url);
		$.ajax({
			url: url,
			dataType: "json",
			timeout: 60000,
			cache:false,
			success: function( data ) { 
				// if(data.length > 0){
					var txt_html = "<div id='display_table'>" +
					"<table id='onthetable' class='table table-striped table-bordered dt-responsive nowrap' cellspacing='0' width='100%'>" +
						"<thead>" +
							"<tr>" +
								"<th>เลขที่</th>" +
								"<th>รหัสสาขา</th>" +
								"<th>สถานะ</th>" +
								"<th>การแก้ไข</th>" +
								"<th>ผู้แก้ไข</th>" +
								"<th>แก้ไขล่าสุดเมื่อ</th>" +
								"<th>ผู้อนุมัติ</th>" +
								"<th>อนุมัติเมื่อ</th>" +
							"</tr>" +
						"</thead>" +
						"<tbody>";

					$.each(data,function( i,item ) {
						var follow_go = "";

						if(checkNotEmpty(item.follow_id)){
							if(item.prove_topic == 1) {
								follow_go = "<a href='#' class='follow-link' onclick='popupFollow(\"backof30\",\"" + item.follow_id + "\");' title='Follow Request เลขที่คำขอ " + item.follow_id + "'><span class='glyphicon glyphicon-new-window' aria-hidden='true'></span></a>" ;
							}
							else if(item.prove_topic == 2) {
								follow_go = "<a href='#' class='follow-link' onclick='popupFollow(\"backof20\",\"" + item.follow_id + "\");' title='Follow Request เลขที่คำขอ " + item.follow_id + "'><span class='glyphicon glyphicon-new-window' aria-hidden='true'></span></a>" ;
							}
							else if(item.prove_topic == 4) {
								follow_go = "<a href='#' class='follow-link' onclick='popupFollow(\"backof10\",\"" + item.follow_id + "\");' title='Follow Request เลขที่คำขอ " + item.follow_id + "'><span class='glyphicon glyphicon-new-window' aria-hidden='true'></span></a>" ;
							}
						}

						var prove_topic = item.prove_topic;

						if(checkNotEmpty(item.close_temp)){
							if(item.close_temp == 1) {
								prove_topic = 5;
							}
						}

						txt_html += "<tr>"
						txt_html += "<td>" + item.no_approve + "</td>"
						txt_html += "<td><a target='_blank' href='default.aspx?shop_code=" + item.shop_code + "' >" + item.shop_code.toUpperCase() + "</a></td>"
						txt_html += "<td>" + statusProve(data[i]) + "</td>"
						txt_html += "<td>" + arrTopicProve[prove_topic] + follow_go + "</td>"
						txt_html += "<td>" + item.update_by + "</td>"
						txt_html += "<td>" + item.update_date + "</td>"
						txt_html += "<td>" + itemNull(item.approve_by) + "</td>"
						txt_html += "<td>" + itemNull(item.approve_date) + "</td>"
						txt_html += "</tr>"
					});

					txt_html += "</tbody>" +
					"</table>" +
					"</div>";

					$('#display_table').replaceWith(txt_html);
					callDataTable();
				// }
			},
			error: function(x, t, m) {
				console.log('x>' + x + ' t>' + t + ' m>' + m);
				modalAlert('ajax fail!');
			}
		});
}

function statusProve(item){
	var sts = arrStatusProve[item.approve_status];

	if(item.prove_topic == 1){
		sts = "<div class='adm' onclick='viewApproveDesc(" + item.no_shopStock + "," + item.no_approve + "," + item.prove_topic + ")'>" + sts + "</div>";
	}
	else if(item.prove_topic == 3){
		sts = "<div class='adm' onclick='viewApproveImg(" + item.no_shopStock + "," + item.no_approve + "," + item.prove_topic + ")'>" + sts + "</div>";
	}
	else if(item.prove_topic == 2){
		sts = "<div class='adm' onclick='viewApproveTime(\"" + item.shop_code + "\"," + item.no_approve + "," + item.prove_topic + ")'>" + sts + "</div>";
	}
	else if(item.prove_topic == 4){
		// no_shopStock is no_note
		sts = "<div class='adm' onclick='viewApproveNote(" + item.no_shopStock + "," + item.no_approve + "," + item.prove_topic + ")'>" + sts + "</div>";
	}

	return sts;
}

function clearModalProve(){
	$('#modal_approve_title').html("ขออนุมัติ การเปลี่ยนแปลงข้อมูล");
	$('#modal_approve_code').val("");
	$('#prove_3').hide();
	$('#prove_0').hide();
	$('#prove_8').hide();
	$('#prove_9').hide();
	$("#btn_edit").attr("onclick","");
	// $("#btn_ok_prove").attr("onclick","");
	$("#btn_edit").hide();
	$("#btn_ok_prove").hide();
	$("#btn_cancle_prove").hide();
	$("#prove_remark .txt-remark").val("");
	$("#prove_remark").hide();

	$("#btn_ok_confirm").attr("onclick","");
	$("#txt_ok_comment").val("");
	$("#prove_ok").hide();
	$("#btn_cancle_confirm").attr("onclick","");
	$("#txt_admin_comment").val("");
	$("#prove_cancle").hide();
	$("#prove_btn").show();
}

$('#btn_ok_prove').click(function() {
	$("#prove_btn").hide();
	$("#prove_ok").show();
	$("#txt_ok_comment").focus();
});

$('#btn_cancle_prove').click(function() {
	$("#prove_btn").hide();
	$("#prove_cancle").show();
	$("#txt_admin_comment").focus();
});

function viewApproveDesc(no_shopStock,no_approve,prove_topic){
	clearModalProve();

	var url1 = "adminJson.aspx?qrs=getShopDescProveLog&no_approve=" + no_approve;
	var url2 = "adminJson.aspx?qrs=getShopDescProve&no_approve=" + no_approve;

	console.log("when " + url1 + " " + url2);
	$.when( 
		$.ajax({url:url1, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }), 
		$.ajax({url:url2, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }) 
		).done(function( data1, data2 ) {

			var item1 = data1[0][0];
			var item2 = data2[0][0];
			var txt = "";
			var tmp_edt;

			var style1 = "";
			var style2 = "";

			$('#modal_approve_code').val(item2.shop_code);
			$('#prove_' + item2.approve_status).show();

			if(checkNotEmpty(item2.follow_id)){
				tmp1 = "<div class='col-xs-6' style='margin-top:10px'></div>";
				tmp2 = "<div class='col-xs-6' style='margin-top:10px'>" +
				"<a style='" + style2 + "'' href='#' class='pop-link' onclick='popupFollow(\"backof30\",\"" + item2.follow_id + "\");' ><span class='glyphicon glyphicon-new-window' aria-hidden='true'></span> Follow Request เลขที่คำขอ " + item2.follow_id + "</a>" +
				"</div>";
				txt += divRow(tmp1+tmp2);
			}

			tmp_edt = "";
			if(item1.premium_receive_shop != item2.premium_receive_shop)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colRadiobox(style1,premium_receive_shop,item1.premium_receive_shop) + colRadiobox(style2,premium_receive_shop,item2.premium_receive_shop,tmp_edt) );

			tmp_edt = "";
			if(item1.flag_promote != item2.flag_promote)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colRadiobox(style1,flag_promote,item1.flag_promote) + colRadiobox(style2,flag_promote,item2.flag_promote,tmp_edt) );

			tmp_edt = "";
			if(item1.shop_temp != item2.shop_temp)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colRadiobox(style1,arrShopTemp[item1.shop_temp]) + colRadiobox(style2,arrShopTemp[item2.shop_temp],1,tmp_edt) );

			tmp_edt = "";
			if(item1.shop_name != item2.shop_name)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextbox(style1,6,"ชื่อสาขา",item1.shop_name) + colTextbox(style2,6,"ชื่อสาขา",item2.shop_name,tmp_edt) );

			tmp_edt = "";
			if(item1.province_name != item2.province_name)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextbox(style1,6,"จังหวัด",item1.province_name) + colTextbox(style2,6,"จังหวัด",item2.province_name,tmp_edt) );

			tmp_edt = "";
			if(item1.amphur_name != item2.amphur_name)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextbox(style1,6,"เขต/อำเภอ",itemBlank(item1.amphur_name)) + colTextbox(style2,6,"เขต/อำเภอ",itemBlank(item2.amphur_name),tmp_edt) );

			tmp_edt = "";
			if(item1.storeplacetype_name != item2.storeplacetype_name)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextbox(style1,6,"พื้นที่",item1.storeplacetype_name) + colTextbox(style2,6,"พื้นที่",item2.storeplacetype_name,tmp_edt) );

			tmp_edt = "";
			if(item1.storeKiosType_name != item2.storeKiosType_name)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextbox(style1,6,"ประเภท",item1.storeKiosType_name) + colTextbox(style2,6,"ประเภท",item2.storeKiosType_name,tmp_edt) );

			tmp_edt = "";
			if(item1.telephone != item2.telephone)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextbox(style1,6,"เบอร์ติดต่อ",item1.telephone) + colTextbox(style2,6,"เบอร์ติดต่อ",item2.telephone,tmp_edt) );

			tmp_edt = "";
			if(item1.fax != item2.fax)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextbox(style1,6,"Fax.",item1.fax) + colTextbox(style2,6,"Fax.",item2.fax,tmp_edt) );

			tmp1 = "";
			tmp_edt = "";
			if(item1.latitude != item2.latitude || item1.longitude != item2.longitude)
				tmp_edt = "edt";
			tmp1 = "<div class='col-xs-6' style='margin-top:10px'>" +
			"<a style='" + style1 + "'' href='#' class='pop-link' onclick='popupCenter(\"http://10.11.5.104/3bbShop/exmap.html?lat=" + item1.latitude + "&lng=" + item1.longitude + "\", \"exmap\",750,500);' ><span class='glyphicon glyphicon-map-marker' aria-hidden='true'></span> google map</a>" +
			"</div>" +
			"<div class='col-xs-6' style='margin-top:10px'>" +
			"<a href='#' class='pop-link' onclick='popupCenter(\"http://10.11.5.104/3bbShop/exmap.html?lat=" + item2.latitude + "&lng=" + item2.longitude + "\", \"exmap\",750,500);' ><span class='glyphicon glyphicon-map-marker' aria-hidden='true'></span> google map</a>" +
			"</div>";
			txt += hr_endrow + divRow( colTextbox(style1,6,"Lat/Lng",item1.latitude + ', ' + item1.longitude) + colTextbox(style2,6,"Lat/Lng",item2.latitude + ', ' + item2.longitude,tmp_edt) );
			txt += divRow(tmp1);

			tmp_edt = "";
			if(item1.shop_location != item2.shop_location)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextarea(style1, 6,"ตำแหน่งที่ตั้ง",item1.shop_location) + colTextarea(style2, 6,"ตำแหน่งที่ตั้ง",item2.shop_location,tmp_edt) );

			tmp_edt = "";
			if(item1.shop_address != item2.shop_address)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextarea(style1, 6,"ที่อยู่",item1.shop_address) + colTextarea(style2, 6,"ที่อยู่",item2.shop_address,tmp_edt) );

			tmp_edt = "";
			if(item1.shop_keyword != item2.shop_keyword)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextarea(style1, 6,"คำค้น",item1.shop_keyword) + colTextarea(style2, 6,"คำค้น",item2.shop_keyword,tmp_edt) );

			tmp_edt = "";
			if(item1.shop_comment != item2.shop_comment)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colTextarea(style1, 6,"ข้อความแจ้งภายใน",item1.shop_comment) + colTextarea(style2, 6,"ข้อความแจ้งภายใน",item2.shop_comment,tmp_edt) );

			tmp1 = "";
			tmp_edt = "";
			if(item1.line_id != item2.line_id)
				tmp_edt = "edt";
			tmp1 = "<div class='col-xs-6' style='margin-top:10px'>" +
			"<a style='" + style1 + "'' href='#' class='pop-link txt-lineapp' onclick='popupCenter(\"https://line.me/ti/p/~" + item1.line_id + "\", \"exmap\",750,500);' ><span class='glyphicon glyphicon-qrcode' aria-hidden='true'></span> ทดสอบ Line QR</a>" +
			"</div>" +
			"<div class='col-xs-6' style='margin-top:10px'>" +
			"<a href='#' class='pop-link txt-lineapp' onclick='popupCenter(\"https://line.me/ti/p/~" + item2.line_id + "\", \"exmap\",750,500);' ><span class='glyphicon glyphicon-qrcode' aria-hidden='true'></span> ทดสอบ Line QR</a>" +
			"</div>";
			txt += hr_endrow + divRow( colTextbox(style1, 6,"Line ID",item1.line_id) + colTextbox(style2, 6,"Line ID",item2.line_id,tmp_edt) );
			txt += divRow(tmp1);

			if(item2.approve_status == 0) {
				if (checkIsEmpty(item2.follow_id) == true || $('#hide_upermiss').val() == "BACKOFFICE_ADMIN"){
					$("#btn_edit").attr("onclick","gotoUrl('updateStockShop.aspx?shop_code=" + item2.shop_code + "')");
					$("#btn_edit").show();
				}

				if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN" ) {
					$("#btn_ok_confirm").attr("onclick","okProve(" + prove_topic + "," + item2.no_approve + ")");
					$("#btn_ok_prove").show();
					$("#btn_cancle_confirm").attr("onclick","cancleProve(" + prove_topic + "," + item2.no_approve + ")");
					$("#btn_cancle_prove").show();
				}
			}

			if(item2.approve_status == 9 && item2.admin_override == 1) {
				$("#prove_remark .txt-remark").val("แก้ไขข้อมูลล่าสุดโดยผู้ดูแล");
				$("#prove_remark").show();
			}

			if(item2.approve_status == 8 || item2.admin_comment.trim() != "") {
				$("#prove_remark .txt-remark").val(item2.admin_comment);
				$("#prove_remark").show();
			}

			if(item2.approve_status == 3) {
				$("#prove_remark .txt-remark").val("รออนุมัติจากระบบ Follow Request");
				$("#prove_remark").show();
			}

			if(item2.approve_status == 8 && checkNotEmpty(item2.follow_id)) {
				$("#prove_remark .txt-remark").val("ยกเลิกคำขอจากระบบ Follow Request");
				$("#prove_remark").show();
			}

			$('#modal_no_approve').html(no_approve);
			$('#modal_approve_txt').html(txt);
			$('#modal_approve').modal("show");
		});
}

function viewApproveImg(no_shopStock,no_approve,prove_topic){
	clearModalProve();

	var url1 = "adminJson.aspx?qrs=getShopImgProveLog&no_approve=" + no_approve;
	var url2 = "adminJson.aspx?qrs=getShopImgProve&no_approve=" + no_approve;

	console.log("when " + url1 + " " + url2);
	$.when( 
		$.ajax({url:url1, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }), 
		$.ajax({url:url2, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }) 
		).done(function( data1, data2 ) {

			var item1 = data1[0][0];
			var item2 = data2[0][0];
			var txt = "";
			var tmp_edt;

			var style1 = "";
			var style2 = "";

			$('#modal_approve_code').val(item2.shop_code);
			$('#prove_' + item2.approve_status).show();

			tmp_edt = "";
			if(item1.picture1 != item2.picture1)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colImgbox(style1,6,"Image 1",item1.picture1) + colImgbox(style2,6,"Image 1",item2.picture1,tmp_edt) );

			tmp_edt = "";
			if(item1.picture2 != item2.picture2)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colImgbox(style1,6,"Image 2",item1.picture2) + colImgbox(style2,6,"Image 2",item2.picture2,tmp_edt) );

			tmp_edt = "";
			if(item1.picture3 != item2.picture3)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colImgbox(style1,6,"Image 3",item1.picture3) + colImgbox(style2,6,"Image 3",item2.picture3,tmp_edt) );

			tmp_edt = "";
			if(item1.img_map != item2.img_map)
				tmp = "edt";
			txt += hr_endrow + divRow( colImgbox(style1,6,"Image Map",item1.img_map) + colImgbox(style2,6,"Image Map",item2.img_map,tmp_edt) );

			if(item2.approve_status == 0) {
				$("#btn_edit").attr("onclick","gotoUrl('uploadStockShopPicture.aspx?shop_code=" + item2.shop_code + "')");
				$("#btn_edit").show();

				if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN" ) {
					$("#btn_ok_confirm").attr("onclick","okProve(" + prove_topic + "," + item2.no_approve + ")");
					$("#btn_ok_prove").show();
					$("#btn_cancle_confirm").attr("onclick","cancleProve(" + prove_topic + "," + item2.no_approve + ")");
					$("#btn_cancle_prove").show();
				}
			}

			if(item2.approve_status == 9 && item2.admin_override == 1) {
				$("#prove_remark .txt-remark").val("แก้ไขข้อมูลล่าสุดโดยผู้ดูแล");
				$("#prove_remark").show();
			}

			if(item2.approve_status == 8 || item2.admin_comment.trim() != "") {
				$("#prove_remark .txt-remark").val(item2.admin_comment);
				$("#prove_remark").show();
			}

			$('#modal_no_approve').html(no_approve);
			$('#modal_approve_txt').html(txt);
			$('#modal_approve').modal("show");
		});
}

function viewApproveTime(shop_code,no_approve,prove_topic){
	clearModalProve();

	var url1 = "adminJson.aspx?qrs=getShopDayTimeProveLog&no_approve=" + no_approve;
	var url2 = "adminJson.aspx?qrs=getShopDayTimeProve&no_approve=" + no_approve;

	console.log("when " + url1 + " " + url2);
	$.when( 
		$.ajax({url:url1, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }), 
		$.ajax({url:url2, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }) 
		).done(function( data1, data2 ) {

			var item1 = data1[0][0];
			var item2 = data2[0][0];
			var txt = "";
			var tmp1,tmp2,tmp_day,tmp_day1,tmp_day2,tmp_edt;

			var style1 = "";
			var style2 = "";

			$('#modal_approve_code').val(item2.shop_code);
			$('#prove_' + item2.approve_status).show();

			if(checkNotEmpty(item2.follow_id)){
				tmp1 = "<div class='col-xs-6' style='margin-top:10px'></div>";
				tmp2 = "<div class='col-xs-6' style='margin-top:10px'>" +
				"<a style='" + style2 + "'' href='#' class='pop-link' onclick='popupFollow(\"backof20\",\"" + item2.follow_id + "\");' ><span class='glyphicon glyphicon-new-window' aria-hidden='true'></span> Follow Request เลขที่คำขอ " + item2.follow_id + "</a>" +
				"</div>";
				txt += divRow(tmp1+tmp2);
			}

			tmp_edt = "";
			if(item1.dayoff_sat != item2.dayoff_sat)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colRadiobox(style1,"หยุด วันเสาร์",item1.dayoff_sat) + colRadiobox(style2,"หยุด วันเสาร์",item2.dayoff_sat,tmp_edt) );
			
			tmp_edt = "";
			if(item1.dayoff_sun != item2.dayoff_sun)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colRadiobox(style1,"หยุด วันอาทิตย์",item1.dayoff_sun) + colRadiobox(style2,"หยุด วันอาทิตย์",item2.dayoff_sun,tmp_edt) );

			tmp_edt = "";
			if(item1.holiday_chk != item2.holiday_chk)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colRadiobox(style1,"หยุด วันนักขัตฤกษ์",item1.holiday_chk) + colRadiobox(style2,"หยุด วันนักขัตฤกษ์",item2.holiday_chk,tmp_edt) );
			
			txt += "<br>";

			tmp_edt = "";
			if(item1.day_7 != item2.day_7)
				tmp_edt = "edt";
			txt += hr_endrow + divRow( colRadiobox(style1,"เปิด-ปิด เวลาเดียวกันทุกวัน",item1.day_7) + colRadiobox(style2,"เปิด-ปิด เวลาเดียวกันทุกวัน",item2.day_7,tmp_edt) );

			tmp_day = "จันทร์-ศุกร์";
			// if(item2.day_7 == 1)
			// 	tmp_day = "ทุกวัน";

			tmp_edt = "";
			if(item1.wd_shop_open != item2.wd_shop_open || item1.wd_shop_close != item2.wd_shop_close)
				tmp_edt = "edt";
			tmp1 = "เปิด-ปิด สำนักงาน เวลา " + item1.wd_shop_open + "-" + item1.wd_shop_close + " น.";
			tmp2 = "เปิด-ปิด สำนักงาน เวลา " + item2.wd_shop_open + "-" + item2.wd_shop_close + " น.";
			txt += hr_endrow + divRow( colTextbox(style1,6,tmp_day,tmp1) + colTextbox(style2,6,tmp_day,tmp2,tmp_edt) );

			// if(item1.dayoff_sat == 0 && item1.dayoff_sun == 0)
				tmp_day1 = "เสาร์-อาทิตย์";
			// else if(item1.dayoff_sat == 0)
			// 	tmp_day1 = "เสาร์";
			// else if(item1.dayoff_sun == 0)
			// 	tmp_day1 = "อาทิตย์";

			// if(item2.dayoff_sat == 0 && item2.dayoff_sun == 0)
				tmp_day2 = "เสาร์-อาทิตย์";
			// else if(item2.dayoff_sat == 0)
			// 	tmp_day2 = "เสาร์";
			// else if(item2.dayoff_sun == 0)
			// 	tmp_day2 = "อาทิตย์";

			tmp_edt = "";
			if(item1.we_shop_open != item2.we_shop_open || item1.we_shop_close != item2.we_shop_close)
				tmp_edt = "edt";
			tmp1 = "เปิด-ปิด สำนักงาน เวลา " + item1.we_shop_open + "-" + item1.we_shop_close + " น.";
			tmp2 = "เปิด-ปิด สำนักงาน เวลา " + item2.we_shop_open + "-" + item2.we_shop_close + " น.";
			txt += hr_endrow + divRow( colTextbox(style1,6,tmp_day1,tmp1) + colTextbox(style2,6,tmp_day2,tmp2,tmp_edt) );

			//**************************************************** วันศุกร์
			tmp1 = "ใช้เวลาทำการเดียวกับ วันจันทร์-ศุกร์";
			tmp2 = "ใช้เวลาทำการเดียวกับ วันจันทร์-ศุกร์";
			
			if(item1.friday_time == 2)
				tmp1 = "ใช้เวลาทำการเดียวกับ วันเสาร์-อาทิตย์";

			if(item2.friday_time == 2)
				tmp2 = "ใช้เวลาทำการเดียวกับ วันเสาร์-อาทิตย์";

			tmp_edt = "";
			if(tmp1 != tmp2)
				tmp_edt = "edt";

			txt += hr_endrow + divRow( colTextbox(style1,6,"วันศุกร์",tmp1) + colTextbox(style2,6,"วันศุกร์",tmp2,tmp_edt) );
			//**************************************************** วันศุกร์

			//**************************************************** นักขัตฤกษ์
			tmp1 = "";
			tmp2 = "";
			
			if(item1.holiday_time == 5)
				tmp1 = "ใช้เวลาทำการเดียวกับ วันจันทร์-ศุกร์";
			else if(item1.holiday_time == 2)
				tmp1 = "ใช้เวลาทำการเดียวกับ วัน" + tmp_day1;

			if(item2.holiday_time == 5)
				tmp2 = "ใช้เวลาทำการเดียวกับ วันจันทร์-ศุกร์";
			else if(item2.holiday_time == 2)
				tmp2 = "ใช้เวลาทำการเดียวกับ วัน" + tmp_day2;

			tmp_edt = "";
			if(tmp1 != tmp2)
				tmp_edt = "edt";

			txt += hr_endrow + divRow( colTextbox(style1,6,"นักขัตฤกษ์",tmp1) + colTextbox(style2,6,"นักขัตฤกษ์",tmp2,tmp_edt) );
			//**************************************************** นักขัตฤกษ์

			if(item2.approve_status == 0) {
				if (checkIsEmpty(item2.follow_id) == true || $('#hide_upermiss').val() == "BACKOFFICE_ADMIN"){
					$("#btn_edit").attr("onclick","gotoUrl('updateStockShopTime.aspx?shop_code=" + item2.shop_code + "')");
					$("#btn_edit").show();
				}

				if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN" ) {
					$("#btn_ok_confirm").attr("onclick","okProve(" + prove_topic + "," + item2.no_approve + ")");
					$("#btn_ok_prove").show();
					$("#btn_cancle_confirm").attr("onclick","cancleProve(" + prove_topic + "," + item2.no_approve + ")");
					$("#btn_cancle_prove").show();
				}
			}

			if(item2.approve_status == 9 && item2.admin_override == 1) {
				$("#prove_remark .txt-remark").val("แก้ไขข้อมูลล่าสุดโดยผู้ดูแล");
				$("#prove_remark").show();
			}

			if(item2.approve_status == 8 || item2.admin_comment.trim() != "") {
				$("#prove_remark .txt-remark").val(item2.admin_comment);
				$("#prove_remark").show();
			}

			if(item2.approve_status == 3) {
				$("#prove_remark .txt-remark").val("รออนุมัติจากระบบ Follow Request");
				$("#prove_remark").show();
			}

			if(item2.approve_status == 8 && checkNotEmpty(item2.follow_id)) {
				$("#prove_remark .txt-remark").val("ยกเลิกคำขอจากระบบ Follow Request");
				$("#prove_remark").show();
			}

			$('#modal_no_approve').html(no_approve);
			$('#modal_approve_txt').html(txt);
			$('#modal_approve').modal("show");
		});
}


function viewApproveNote(no_note,no_approve,prove_topic){
	clearModalProve();

	var url1 = "adminJson.aspx?qrs=getShopNoteProveLog&no_approve=" + no_approve;
	var url2 = "adminJson.aspx?qrs=getShopNoteProve&no_approve=" + no_approve;

	console.log("when " + url1 + " " + url2);
	$.when( 
		$.ajax({url:url1, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }), 
		$.ajax({url:url2, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }) 
		).done(function( data1, data2 ) {

			var item1 = data1[0][0];
			var item2 = data2[0][0];
			var txt = "";
			var tmp1,tmp2,tmp_edt;

			$('#modal_approve_code').val(item2.shop_code);
			$('#prove_' + item2.approve_status).show();

			var style1 = "";
			var style2 = "";

			if(item2.row_delete == 1) {
				$('#modal_approve_title').html("ขออนุมัติ การลบข้อมูลหมายเหตุแสดงบนเว็บ 3BB");
				// style2 = "display:none;";

				if(checkNotEmpty(item1.note_desc))
					txt += hr_endrow + divRow( colTextarea(style1,6,"หมายเหตุแสดงบนเว็บ 3BB",item1.note_desc) + colTextarea(style2,6,"ลบ","","del") );

				if(checkNotEmpty(item1.explain_desc))
					txt += hr_endrow + divRow( colTextarea(style1,6,"คำอธิบายชี้แจง",item1.explain_desc) + colTextarea(style2,6,"ลบ","","del") );

				if(checkNotEmpty(item1.upload_file)){
					txt += hr_endrow + divRow( colTextarea(style1,6,"ไฟล์แนบ",item1.upload_file) + colTextarea(style2,6,"ลบ","","del") );

					if(item1.upload_file != "") {
						tmp1 = "<div class='col-xs-6' style='margin-top:10px'>" +
						"<a href='#' class='pop-link' onclick='popupCenter(\"openfile.aspx?path=" + item1.upload_file_path + "&file=" + item1.upload_file + "\", \"exmap\",750,500);' ><span class='glyphicon glyphicon-paperclip' aria-hidden='true'></span> เปิดไฟล์แนบ</a>" +
						"</div>";
						txt += divRow(tmp1);
					}
				}

				if(checkNotEmpty(item1.start_display) && checkNotEmpty(item1.end_display)){
					tmp1 = "วันที่ " + item1.start_display + " - " + item1.end_display;
					tmp2 = "";
					txt += hr_endrow + divRow( colTextbox(style1,6,"แสดงผลวันที่",tmp1) + colTextbox(style2,6,"ลบ",tmp2,"del") );
				}

				if(checkNotEmpty(item1.start_close) && checkNotEmpty(item1.end_close)){
					tmp1 = "วันที่ " + item1.start_close + " - " + item1.end_close;
					tmp2 = "";
					txt += hr_endrow + divRow( colTextbox(style1,6,"ปิดทำการชั่วคราว",tmp1) + colTextbox(style2,6,"ลบ",tmp2,"del") );
				}
			}
			else {
				$('#modal_approve_title').html("ขออนุมัติ การเปลี่ยนแปลงข้อมูลหมายเหตุแสดงบนเว็บ 3BB");

				if(item1.no_note == 0){
					$('#modal_approve_title').html("ขออนุมัติ การเพิ่มข้อมูลหมายเหตุแสดงบนเว็บ 3BB");
					style1 = "display:none;";
				}

				if(checkNotEmpty(item2.follow_id)){
					tmp1 = "<div class='col-xs-6' style='margin-top:10px'></div>";
					tmp2 = "<div class='col-xs-6' style='margin-top:10px'>" +
					"<a style='" + style2 + "'' href='#' class='pop-link' onclick='popupFollow(\"backof10\",\"" + item2.follow_id + "\");' ><span class='glyphicon glyphicon-new-window' aria-hidden='true'></span> Follow Request เลขที่คำขอ " + item2.follow_id + "</a>" +
					"</div>";
					txt += divRow(tmp1+tmp2);
				}

				tmp_edt = "";
				if(item1.note_desc != item2.note_desc)
					tmp_edt = "edt";
				txt += hr_endrow + divRow( colTextarea(style1,6,"หมายเหตุแสดงบนเว็บ 3BB",item1.note_desc) + colTextarea(style2,6,"หมายเหตุแสดงบนเว็บ 3BB",item2.note_desc,tmp_edt) );

				tmp_edt = "";
				if(item1.explain_desc != item2.explain_desc)
					tmp_edt = "edt";
				txt += hr_endrow + divRow( colTextarea(style1,6,"คำอธิบายชี้แจง",item1.explain_desc) + colTextarea(style2,6,"คำอธิบายชี้แจง",item2.explain_desc,tmp_edt) );

				tmp_edt = "";
				if(item1.upload_file != item2.upload_file || item1.upload_file_path != item2.upload_file_path)
					tmp_edt = "edt";
				txt += hr_endrow + divRow( colTextbox(style1,6,"ไฟล์แนบ",item1.upload_file) + colTextbox(style2,6,"ไฟล์แนบ",item2.upload_file,tmp_edt) );

				tmp1 = "<div class='col-xs-6' style='margin-top:10px'></div>";
				tmp2 = "<div class='col-xs-6' style='margin-top:10px'></div>";
				if(item1.upload_file != "") {
					tmp1 = "<div class='col-xs-6' style='margin-top:10px'>" +
					"<a style='" + style1 + "'' href='#' class='pop-link' onclick='popupCenter(\"openfile.aspx?path=" + item1.upload_file_path + "&file=" + item1.upload_file + "\", \"exmap\",750,500);' ><span class='glyphicon glyphicon-paperclip' aria-hidden='true'></span> เปิดไฟล์แนบ</a>" +
					"</div>";
				}
				if(item2.upload_file != "") {
					tmp2 = "<div class='col-xs-6' style='margin-top:10px'>" +
					"<a style='" + style2 + "'' href='#' class='pop-link' onclick='popupCenter(\"openfile.aspx?path=" + item2.upload_file_path + "&file=" + item2.upload_file + "\", \"exmap\",750,500);' ><span class='glyphicon glyphicon-paperclip' aria-hidden='true'></span> เปิดไฟล์แนบ</a>" +
					"</div>";
				}
				txt += divRow(tmp1+tmp2);

				tmp_edt = "";
				if(item1.start_display != item2.start_display || item1.end_display != item2.end_display){
					tmp_edt = "edt";
				}
				tmp1 = "วันที่ " + item1.start_display + " - " + item1.end_display;
				tmp2 = "วันที่ " + item2.start_display + " - " + item2.end_display;
				txt += hr_endrow + divRow( colTextbox(style1,6,"แสดงผลวันที่",tmp1) + colTextbox(style2,6,"แสดงผลวันที่",tmp2,tmp_edt) );

				tmp_edt = "";
				if(item1.close_temp != item2.close_temp)
					tmp_edt = "edt";
				txt += hr_endrow + divRow( colRadiobox(style1,"ปิดทำการชั่วคราว",item1.close_temp) + colRadiobox(style2,"ปิดทำการชั่วคราว",item2.close_temp,tmp_edt) );

				tmp_edt = "";
				if(item1.start_close != item2.start_close || item1.end_close != item2.end_close)
					tmp_edt = "edt";
				tmp1 = "วันที่ " + item1.start_close + " - " + item1.end_close;
				tmp2 = "วันที่ " + item2.start_close + " - " + item2.end_close;
				txt += hr_endrow + divRow( colTextbox(style1,6,"ปิดทำการชั่วคราว",tmp1) + colTextbox(style2,6,"ปิดทำการชั่วคราว",tmp2,tmp_edt) );
			}

			if(item2.approve_status == 0) {
				if(item2.row_delete == 0){ 
					if (checkIsEmpty(item2.follow_id) == true || $('#hide_upermiss').val() == "BACKOFFICE_ADMIN"){
						$("#btn_edit").attr("onclick","gotoUrl('updateStockShopNote.aspx?shop_code=" + item2.shop_code + "&no_approve=" + item2.no_approve + "')");
						$("#btn_edit").show();
					}
				}

				if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN" ) {
					$("#btn_ok_confirm").attr("onclick","okProve(" + prove_topic + "," + item2.no_approve + ")");
					$("#btn_ok_prove").show();
					$("#btn_cancle_confirm").attr("onclick","cancleProve(" + prove_topic + "," + item2.no_approve + ")");
					$("#btn_cancle_prove").show();
				}
			}

			if(item2.approve_status == 9 && item2.admin_override == 1) {
				$("#prove_remark .txt-remark").val("แก้ไขข้อมูลล่าสุดโดยผู้ดูแล");
				$("#prove_remark").show();
			}

			if(item2.approve_status == 8 || item2.admin_comment.trim() != "") {
				$("#prove_remark .txt-remark").val(item2.admin_comment);
				$("#prove_remark").show();
			}

			if(item2.approve_status == 3) {
				$("#prove_remark .txt-remark").val("รออนุมัติจากระบบ Follow Request");
				$("#prove_remark").show();
			}

			if(item2.approve_status == 8 && checkNotEmpty(item2.follow_id)) {
				$("#prove_remark .txt-remark").val("ยกเลิกคำขอจากระบบ Follow Request");
				$("#prove_remark").show();
			}

			$('#modal_no_approve').html(no_approve);
			$('#modal_approve_txt').html(txt);
			$('#modal_approve').modal("show");
		});
}

function okProve(prove_topic,no_approve){
	var url = "adminJson.aspx?qrs=okProveDesc";

	if(prove_topic == 1){
		url = "adminJson.aspx?qrs=okProveDesc";
	}
	else if(prove_topic == 3){
		url = "adminJson.aspx?qrs=okProveImg";
	}
	else if(prove_topic == 2){
		url = "adminJson.aspx?qrs=okProveDayTime";
	}
	else if(prove_topic == 4){
		url = "adminJson.aspx?qrs=okProveNote";
	}

	$.ajax({
		url: url,
		type: "post",
		timeout: 60000,
		cache: false,
		data: { 
			no_approve: no_approve,
			uemail: $('#hide_uemail').val(),
			admin_comment: $('#txt_ok_comment').val()
		},
		success: function( res ) {
			console.log(res);
			if(res > 0){
				loadPendingProve();
			}
			else
				modalAlert('ไม่สำเร็จ');
		},
		error: function(x, t, m) {
			modalAlert('ajax fail!');
		}
	});
}

function cancleProve(prove_topic,no_approve){
	if($('#txt_admin_comment').val().trim() != "") {
		var url = "adminJson.aspx?qrs=cancleProveDesc";

		if(prove_topic == 1){
			url = "adminJson.aspx?qrs=cancleProveDesc";
		}
		else if(prove_topic == 3){
			url = "adminJson.aspx?qrs=cancleProveImg";
		}
		else if(prove_topic == 2){
			url = "adminJson.aspx?qrs=cancleProveDayTime";
		}
		else if(prove_topic == 4){
			url = "adminJson.aspx?qrs=cancleProveNote";
		}

		$.ajax({
			url: url,
			type: "post",
			timeout: 60000,
			cache: false,
			data: { 
				no_approve: no_approve,
				uemail: $('#hide_uemail').val(),
				admin_comment: $('#txt_admin_comment').val()
			},
			success: function( res ) {
				console.log(res);
				if(res > 0){
					loadPendingProve();
				}
				else
					modalAlert('ไม่สำเร็จ');
			},
			error: function(x, t, m) {
				modalAlert('ajax fail!');
			}
		});
		$('#modal_approve').modal('hide');
	}
	else {
		$("#txt_admin_comment").focus();
	}
}

function colTextbox(style,col,title,value,color = "") {
	return 	"<div class='col-xs-" + col + "'>" +
				"<div class='input-group' style='" + style + "'>" +
					"<span class='input-group-addon txt-bold " + color + "'>" + title + "</span>" +
					"<input type='text' class='form-control " + color + "' value='" + value + "' readonly>" +
				"</div>" +
			"</div>";
}

function colTextarea(style,col,title,value,color = "") {
	return 	"<div class='col-xs-" + col + "'>" +
				"<div style='" + style + "'>" +
					"<div class='input-group' style='width: 100%;'>" +
						"<strong class='" + color + "'>" + title + "</strong>" +
						"<textarea class='form-control " + color + "' rows='3' readonly>" + value + "</textarea>" +
					"</div>" +
				"</div>" +
			"</div>";
}

function colRadiobox(style,value,checked = 1,color = "") {
	var chk;
	if(checked == 1)
		chk = "checked";
	else
		chk = "";

	return 	"<div class='col-xs-2'>" +
				"<div class='input-group chk-group' style='" + style + "'>" +
					"<span class='input-group-addon'>" +
						"<input type='radio' onclick='return false;' onkeydown='return false;' " + chk + "/>" +
					"</span>" +
					"<span class='input-group-addon txt-bold " + color + "'>" + value + "</span>" +
				"</div>" +
			"</div>" +
			"<div class='col-xs-4'></div>";
}

function colImgbox(style,col,title,value,color = "") {
	return 	"<div class='col-xs-" + col + "'>" +
				"<div class='input-group' style='" + style + "'>" +
					"<strong class='" + color + "'>" + title + "</strong><br>" +
					"<img class='img-thumbnail pic_ex " + color + "' src=" + value + ">" +
				"</div>" +
			"</div>";
}

function divRow(txt){
	return	"<div class='row'>" + txt + "</div>";
}

function shop_code() {
	var gCode = _GET('shop_code');

	if(gCode == null) {
		gCode = ""
	}

	return gCode;
}

function callDataTable(table = '#onthetable'){
	$(table).dataTable({
		"aaSorting": [],
		"ordering": false,
		paging: false,
		"iDisplayLength": -1,
	});
}



$('#smart_search').autocomplete({
	minLength: 3,
	position: { my : "right top", at: "right bottom" },
	focus: function(event, ui) {
		event.preventDefault();
		$("#smart_search-search").val(ui.item.label);
	},
	source: function( request, response ) {
		$("#loading_icon").show();
		console.log('defaultJson.aspx?qrs=autoCompleteAllShopOpenAndClose&term='+request.term)
		$.ajax({
			url: 'defaultJson.aspx?qrs=autoCompleteAllShopOpenAndClose',
			cache: false,
			data: {term: request.term},
			dataType: "json",
			success: function( data ) {
                    // console.log(data);
                    response( $.map( data.autoCompleteAllShopOpenAndClose, function( item ) {
                    	return {
                    		label: item.shop_label,
                    		value: item.shop_code
                    	}
                    }));
                    $("#loading_icon").hide();
                },
                error: function() {
                	$("#loading_icon").hide();
                }
            });
	}
});

$('#smart_search').on('autocompleteselect', function (e, ui) {
	smartSearch(ui.item.value);
});

function smartSearch(term){
	$('#smart_search').val(term);
	loadPendingProve();
}

$("#smart_search").keydown(function(event){
	if(event.keyCode == 13) {
		event.preventDefault();
		return false;
	}
});

$('#smart_search').focusout(function() {
	$('#smart_search').val("");
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
