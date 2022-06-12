<%@ Page Language="VB" AutoEventWireup="false" CodeFile="updateNotation.aspx.vb" Inherits="updateNotation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>โน๊ตประจำวัน [3BB Shop Back Office]</title>

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

    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/updateStockShop.css?vs=12" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

	<script src="App_Inc/panu.js?vs=12"></script>
	
	<style type="text/css">
		.txt-blue {
			color: #004181;
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
			<li id="li_shopcode">Shop</li>
			<li>แก้ไขโน๊ตประจำวัน</li>
			<li id="li_date" class="active">xx/xx/xxxx</li>
		</ol>

		<div class="container">
			<p class="lead" id="lead_page">SHOP โน๊ตประจำวันที่ xx/xx/xxxx</p>

			<div class="form-center" id="note_box1">
				<div class="row">
					<div class="col-xs-12">
						<div class="input-group" style="width: 100%;">
							<span class="txt-bold txt-red">หมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB</span> 
							<a title="หมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB" target="_blank" href="updateStockShopNote.aspx" id="goto_shopnote" style="margin-left:10px;"><span class="glyphicon icon-new-tab"></span></a>
							<ul id="ul_note_list" class="ul-note">
								<li>ไม่มีหมายเหตุ</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="form-center" id="note_box2" style="margin-top:20px; display:none;">
				<div class="row">
					<div class="col-xs-6">
						<div class="input-group" style="width: 100%;">
							<label>โน๊ตประจำวัน</label>
							<textarea id="txtar_note" class="form-control" rows="3" placeholder="ตัวอย่าง: เนื่องจากเกิดเหตุการณ์ไม่ปกติ จึงต้องปิดทำการก่อนเวลา"></textarea>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-6">
						<div class="input-group">
							<span class="input-group-addon txt-bold">ประเภท</span>
							<asp:DropDownList runat="server" id="sel_notiation_type" class="form-control"></asp:DropDownList>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="row">
					<div class="col-xs-3">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input type="checkbox" id="chk_open_accident" title='**สามารถเลือก "เปิดระบบช้า เนื่องจากเหตุสุดวิสัย" ได้ภายในวันก่อนเวลา 15.00 น.' disabled> 
							</span>
							<span class="input-group-addon txt-bold txt-blue">เปิดระบบช้า เนื่องจากเหตุสุดวิสัย</span>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="input-group chk-group">
							<span class="input-group-addon">
								<input type="checkbox" id="chk_close_accident"> 
							</span>
							<span class="input-group-addon txt-bold txt-blue">ปิดระบบก่อน เนื่องจากเหตุสุดวิสัย</span>
						</div>
					</div>
				</div>
				<hr class="end-row">
				<div class="form-inline">
					<button type="button" class="btn btn-default btn-primary" id="btn_submit" onclick="confirmNotation()">
						<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> บันทึกข้อมูล
					</button>
				</div>
				<h6 class="txt-red">**สามารถเลือก "เปิดระบบช้า เนื่องจากเหตุสุดวิสัย" ได้ภายในวันก่อนเวลา 15.00 น. เท่านั้น</h6>

			</div>

			<div class="form-center" id="note_box3" style="margin-top:20px;">
				<div class="row">
					<div class="col-xs-8">
						<div class="input-group" style="width: 100%;">
							<label>โน๊ตประจำวัน</label>
							<p id="inn_notation" class="ul-note">ไม่มีโน๊ตเพิ่มเติม</p>
						</div>
					</div>
				</div>
				<hr class="end-row have-notation" style="display:none;">
				<div class="row have-notation" style="display:none;">
					<div class="col-xs-8">
						<div class="input-group" style="width: 100%;">
							<p><label>ประเภท:</label> <span id="inn_notation_type"></span></p>
						</div>
					</div>
				</div>
				<hr class="end-row have-notation" style="display:none;">
				<div class="row have-notation" style="display:none;">
					<div class="col-xs-4" id="div_open_accident" style="display:none;">
						<span class="txt-blue"><span class="glyphicon glyphicon-ok"></span> เปิดระบบช้า เนื่องจากเหตุสุดวิสัย</span>
					</div>
					<div class="col-xs-4" id="div_close_accident" style="display:none;">
						<span class="txt-blue"><span class="glyphicon glyphicon-ok"></span> ปิดระบบก่อน เนื่องจากเหตุสุดวิสัย</span>
					</div>
				</div>
				<hr class="end-row have-notation" style="display:none;">
				<div class="row have-notation" style="display:none;">
					<div class="col-xs-4">
						<div class="input-group" style="width: 100%;">
							<p><label>เพิ่มเมื่อ:</label> <span id="inn_create_date"></span> โดย <span id="inn_create_by"></span></p>
						</div>
					</div>
					<div class="col-xs-4 update-notation" style="display:none;">
						<div class="input-group" style="width: 100%;">
							<p><label>แก้ไขล่าสุด:</label> <span id="inn_update_date"></span> โดย <span id="inn_update_by"></span></p>
						</div>
					</div>
				</div>
				<hr class="can-edit" style="display:none;">
				<div class="form-inline">
					<button type="button" class="btn btn-default btn-warning can-edit" onclick="editNotation()" style="display:none;">
						<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> เพิ่มหรือแก้ไข
					</button>
				</div>
				<br>
				<h6 class="txt-red">*สามารถ "เพิ่มหรือแก้ไข" โน๊ตประจำวันได้ ภายในวันหรือย้อนหลังไม่เกิน 1 วัน เท่านั้น</h6>
				<h6 class="txt-red">**สามารถเลือก "เปิดระบบช้า เนื่องจากเหตุสุดวิสัย" ได้ภายในวันก่อนเวลา 15.00 น.</h6>
			</div>
		</div> 
	</div>
</form>


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
				<label>ประเภท:</label> <span id="ul_notation_type"></span>
				<br>
				<br>
				<label id="ul_open_accident" class="txt-blue" style="display:none;"><span class="glyphicon glyphicon-ok"></span> เปิดระบบช้า เนื่องจากเหตุสุดวิสัย</label>
				<label id="ul_close_accident" class="txt-blue" style="display:none;"><span class="glyphicon glyphicon-ok"></span> ปิดระบบก่อน เนื่องจากเหตุสุดวิสัย</label>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal" onclick="saveNotation()">ยืนยันเพื่อบันทึก</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
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
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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

<script type="text/javascript">
var ul_note = "<li>ไม่มีหมายเหตุ</li>";

var g_code = _GET('shop_code');
var g_date = _GET('date').replace(/-/g,"/");
var diff_date = 0;

$(document).ready(function() {
	checkLoadpage();
	checkShopCode();
});

function checkLoadpage(){
	var url = 'reportJson.aspx?qrs=serverDatetime&date=' + _GET('date');
		console.log(url);

		$.ajax({
			url: url,
			dataType: "json",
			timeout: 60000,
			cache:false,
			success: function( data ) { 
				diff_date = data[0].diff_date;

				if( diff_date >= 0 ){
					$('#li_shopcode').html(g_code);
					$('#li_date').html(g_date);
					$('#lead_page').html(g_code + " โน๊ตประจำวันที่ " + g_date);

					loadAllNotes();

					if( diff_date == 0 && data[0].get_hh < 15 ){
						$("#chk_open_accident").removeAttr("disabled");
					}

					if( diff_date >= 0 && diff_date <= 1 || _GET('edit') == 1){
						$('.can-edit').show();
					}

				}
				else{
					modalAlert("วันที่ไม่ถูกต้อง!!");
					$('#modal_alert').on('hidden.bs.modal', function (e) {
						// location.reload();
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

function checkShopCode() {
	var url = 'updateStockShopJson.aspx?qrs=checkShopCode&shop_code=' + _GET('shop_code');

	$.ajax({
		url: url,
		cache: false,
		timeout: 60000,
		success: function( res ) { 
			if(res == 0){
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

	$('#goto_shopnote').attr("href", $('#goto_shopnote').attr('href') + "?shop_code=" + _GET('shop_code'));
}

function loadAllNotes() {
    var url1 = "updateStockShopJson.aspx?qrs=loadAllNoteByDate&shop_code=" + _GET('shop_code') + "&date=" + _GET('date');
    var url2 = "updateStockShopJson.aspx?qrs=loadNotationByDate&shop_code=" + _GET('shop_code') + "&date=" + _GET('date');

    if( diff_date == 0 ) {
        url1 = "updateStockShopJson.aspx?qrs=loadAllNoteByCurentDate&shop_code=" + _GET('shop_code') + "&date=" + _GET('date');
    }

    console.log("when " + url1 + " " + url2);
    $.when( 
        $.ajax({url:url1, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }), 
        $.ajax({url:url2, cache:false, dataType:"json", timeout:60000, error:function(x, t, m){ajaxError();} }) 
        ).done(function( data1, data2 ) {

            if(data1[0].length > 0){
                ul_note = data1[0][0].all_note;
            }

            if(data2[0].length > 0){
                $('#txtar_note').val(data2[0][0].notation_desc);
                $('#sel_notiation_type').val(data2[0][0].notation_type_id);

				$('#inn_notation').html(data2[0][0].notation_desc);

				$('.have-notation').show();
				$('#inn_notation_type').html(data2[0][0].notation_type_name);
				$('#inn_create_date').html(data2[0][0].create_date);
				$('#inn_create_by').html(data2[0][0].create_by);

				if(data2[0][0].create_date != data2[0][0].update_date) {
					$('.update-notation').show();
					$('#inn_update_date').html(data2[0][0].update_date);
					$('#inn_update_by').html(data2[0][0].update_by);
				}

				if(data2[0][0].open_accident == 1){
					$('#chk_open_accident').prop('checked', true);
					$('#div_open_accident').show();
				}

				if(data2[0][0].close_accident == 1){
					$('#chk_close_accident').prop('checked', true);
					$('#div_close_accident').show();
				}
            }

            $('#ul_note_list').html(ul_note);
    });

}

function editNotation(){
	$('#note_box3').hide();
	$('#note_box2').show();
}

function saveNotation(){
	var txtar_note = $('#txtar_note').val();
	var notiation_type = $("#sel_notiation_type").val();
	var open_accident = 0;
	var close_accident = 0;

	if($('#chk_open_accident').prop('checked') == true) {
		open_accident = 1;
	}

	if($('#chk_close_accident').prop('checked') == true) {
		close_accident = 1;
	}

	$.ajax({
		url: "updateStockShopJson.aspx?qrs=saveNotation",
		cache: false,
		type: "post",
		timeout: 60000,
		data: { 
			shop_code: _GET('shop_code'), 
			notation_date: _GET('date'),
			notation_desc: txtar_note,
			notation_type: notiation_type,
			open_accident: open_accident,
			close_accident: close_accident,
			uemail: $('#hide_uemail').val()
		},
		success: function( res ) {
			if(res != 0) {
				location.reload();
				// $('#inn_notation').html(txtar_note);
				// $('#note_box2').hide();
				// $('#note_box3').show();
			}
		},
		error: function(x, t, m) {
			modalAlert('ไม่สำเร็จ');
		}
	});
}

function confirmNotation(){
	var $el1 = $("#txtar_note");
	var $el2 = $("#sel_notiation_type");

	if($el1.val().trim() == "" || $el1.val().length < 10){
		modalAlert("กรุณาระบุหมายเหตุ");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el1.focus();
		})
	}
	else if($el2.val().trim() == ""){
		modalAlert("กรุณาเลือกประเภท");
		$('#modal_alert').on('hidden.bs.modal', function (e) {
			$el2.focus();
		})
	}
	else{
		$('#ul_note').html(ul_note);
		$('#title_notation').html(g_code + " โน๊ตประจำวันที่ " + g_date);
		$('#ul_notation').html( $el1.val() );
		$('#ul_notation_type').html( $("#sel_notiation_type option:selected").text() );

		if($('#chk_open_accident').prop('checked') == true) {
			$('#ul_open_accident').show();
		}
		else {
			$('#ul_open_accident').hide();
		}

		if($('#chk_close_accident').prop('checked') == true) {
			$('#ul_close_accident').show();
		}
		else {
			$('#ul_close_accident').hide();
		}

		$('#modal_notation').modal("show");
	}
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
