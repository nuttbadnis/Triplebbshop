<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<!--[if IE ]> <body class="ie"> <![endif]-->
	<title>3BB Shop Back Office</title>

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

	<link type="text/css" rel="stylesheet" href="App_Inc/main.css?vs=12222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/stockShop.css?vs=1222" />
	<link type="text/css" rel="stylesheet" href="App_Inc/gly-spin.css" />

    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />
    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon-camera/font-icon.css" />

	<link href="App_Inc/lightbox2/css/lightbox.css" rel="stylesheet">

	<script src="App_Inc/panu.js?vs=12"></script>

	<style type="text/css">
	#gotoTop {
		right: auto;
		margin-left: -50px;
	}

	.badge-blue {
		background-color: #0088F5 !important;
		padding: 5px 10px !important;
	}

	.popover{
		max-width: 100%;
		font-family: 'kanit', sans-serif;
	}
	</style>
	
	<script type="text/javascript">
	var startTime,loadTime;
	var search_loading = "<div class='row-count'><span class='glyphicon glyphicon-refresh gly-spin txt-blue'></span><span class='txt-blue'> กำลังค้นหา...</div>";
	var not_responding = "<div class='row-count'><span class='glyphicon glyphicon-exclamation-sign txt-red'></span><span class='txt-red'> ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com</div>";
	
	function adminAlert(n){
		var txt = "<a class='btn btn-lg btn-default' role='button' href='admin_approval.aspx' >มีข้อมูล รออนุมัติ <b class='badge badge-blue'>" + n + "</b> </a>"
		modalAlert(txt);
	}

	function closeAlert(){
		$('#modal_alert').modal("hide");
	}
	</script>
</head>
<body>
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

    <form id="form1" runat="server"></form>
    <input runat="server" id="hide_uemail" type="hidden">
    <input runat="server" id="hide_upermiss" type="hidden">
    <input runat="server" id="hide_shoplist" type="hidden">
    <input runat="server" id="hide_camera_permit" type="hidden">

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
					<li>
						<a href="checklist/default.aspx" id="popover_promote" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<span class='txt-red'><b>ระบบรายการที่ต้องตรวจสอบ เริ่มใช้งานแล้ว</b><br>เข้าไปตรวจสอบข้อมูลสำนักงานกันนะครับ</span>">รายการตรวจสอบ</a>
					</li>
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

    <nav class="navbar navbar-default">
    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    		<ul class="nav navbar-nav">
    			<li class="active"><a data-toggle="tab" href="#tab_default">สำนักงานใหม่</a></li>
    			<!-- <li><a data-toggle="tab" href="#tab_premium">Shop รับของพรีเมี่ยม</a></li> -->
    			<li><a data-toggle="tab" href="#tab_novas" style="display:none;">ไม่แสดงผลที่หน้าเว็บ 3BB</a></li>
    			<li><a data-toggle="tab" href="#tab_vasdefaultpage" style="display:none;">หน้าแรกเว็บ 3BB Shop</a></li>
    			<li><a data-toggle="tab" href="#tab_main1">กรุงเทพฯ ปริมณฑล</a></li>
    			<li><a data-toggle="tab" href="#tab_main2">ต่างจังหวัด</a></li>
    			<li><a data-toggle="tab" href="#tab_search" style="display:none;">Search</a></li>
    		</ul>
    		<form class="navbar-form navbar-right" role="search">
    			<div class="input-group">
    				<div class="input-group-addon" id="loading_icon" style="display:none;">
    					<span class="glyphicon glyphicon-refresh gly-spin" aria-hidden="true">
    					</div>
    					<input type="text" class="form-control input-sm" id="smart_search" placeholder="รหัสสาขา ชื่อสาขา จังหวัด เขต/อำเภอ">
    					<div class="input-group-addon" id="search_icon">
    						<span class="glyphicon glyphicon-search" aria-hidden="true">
    						</div>
    					</div>
    				</form>
    			</div>
    		</nav>

	<div class="container">

		<div class="tab-content">
			<!-- <div class="alert alert-danger alert-dismissible" role="alert" style="padding-top: 25px;padding-bottom: 25px;font-size: 18px;text-align: center;">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong>ประกาศ:</strong> สามารถดูรายงาน สำนักงานที่ปิดทำการชั่วคราว ทั้งหมดได้ที่ >> <a href="covid_report.aspx">COVID REPORT</a> 
				<strong>ประกาศ!!!</strong> แจ้งปิดปรับปรุงระบบ Back Office 3BB Shop ตั้งแต่เวลา 17.00-24.00น. (ประมาณ5โมงเย็น-เที่ยงคืน) <u>โดยจะไม่สามารถ Login เข้าสู่ระบบเพื่อแก้ไข หรืออนุมัติการเปลี่ยนแปลงข้อมูลได้</u> แต่ในส่วนอื่นๆ ที่ไม่ต้อง Login ระบบยังใช้งานได้ปกติ
			 </div> -->

			<div id="tab_default" class="tab-pane in active">
				<p class="lead" style="color: #A94442;">สำนักงานใหม่ ที่ยังไม่เคยผ่านการปรับปรุงข้อมูล <span style="color:red;">(รอเพิ่มเติมข้อมูล)</span></p>
				<p class="txt-red" style="font-size:14px;">*แจ้งขอเพิ่มสิทธิ์แก้ไขข้อมูล 3BB Shop ได้ที่ <a href="mailto:waraporn.kaw@jasmine.com">waraporn.kaw@jasmine.com</a> คุณ วราภรณ์ แก้วคำหาญ (Marketing)</p>
				<div id="result_default" class="tab-result tab-result-main2"></div>
			</div><!-- tab_default -->

			<div id="tab_premium" class="tab-pane">
				<p class="lead" style="color: #A94442;">สำนักงานที่เป็น Shop รับของพรีเมี่ยม</p>
				<div id="result_premium" class="tab-result tab-result-main2"></div>
			</div><!-- tab_premium -->

			<div id="tab_novas" class="tab-pane">
				<p class="lead" style="color: #A94442;">สำนักงานที่ถูกเลือกไม่แสดงผลที่หน้าเว็บ 3BB <span style="color:red;">(ไม่รวมสำนักงานใหม่ ที่รอเพิ่มเติมข้อมูล)</span></p>
				<div id="result_novas" class="tab-result tab-result-main2"></div>
			</div><!-- tab_novas -->

			<div id="tab_vasdefaultpage" class="tab-pane">
				<p class="lead" style="color: #A94442;">สำนักงานที่แสดงผลหน้าแรกเว็บ <a target="_blank" href="http://www.3bb.co.th/3bb/shop">3BB Shop</a> <span style="color:red;">(เห็นแท็บนี้ เฉพาะสิทธิ์ <a target="_blank" href="admin_list.aspx">Admin</a>)</span></p>
				<div id="result_vasdefaultpage" class="tab-result tab-result-main2"></div>
			</div><!-- tab_vasdefaultpage -->

			<div id="tab_main1" class="tab-pane">
				<div class="input-group">
					<span class="input-group-addon txt-bold">กรุณาเลือก</span>
					<select id="sel_province_main1" class="form-control" style="width:auto;">
						<option value="">จังหวัด</option>
						<option value="73">กรุงเทพมหานคร</option>
						<option value="74">นนทบุรี</option>
						<option value="76">ปทุมธานี</option>
						<option value="75">สมุทรปราการ</option>
					</select>
					<!-- <select id="sel_district_main1" class="form-control" style="width:auto;">
						<option value="">เขต/อำเภอ</option>
					</select> -->
				</div>
				<hr>

				<ul class="nav nav-tabs" style="display:none;">
					<li class="active"><a data-toggle="tab" href="#tab0_all">ทั้งหมด</a></li>
					<li><a data-toggle="tab" href="#tab1_central">เซ็นทรัล</a></li>
					<li><a data-toggle="tab" href="#tab2_themall">เดอะมอลล์</a></li>
					<li><a data-toggle="tab" href="#tab3_major">เมเจอร์</a></li>
					<li><a data-toggle="tab" href="#tab4_lotus">โลตัส</a></li>
					<li><a data-toggle="tab" href="#tab5_bigc">บิ๊กซี</a></li>
					<li><a data-toggle="tab" href="#tab6_robinson">โรบินสัน</a></li>
					<li><a data-toggle="tab" href="#tab7_outstore">ศูนย์บริการนอกห้าง</a></li>
					<li><a data-toggle="tab" href="#tab8_other">ห้างสรรพสินค้าอื่น</a></li>
				</ul>

				<div class="tab-content">
					<div id="tab0_all" class="tab-pane in active">
						<div id="result_main1" class="tab-result"></div>
					</div>
					<div id="tab1_central" class="tab-pane">
						<div id="result_central" class="tab-result"></div>
					</div>
					<div id="tab2_themall" class="tab-pane">
						<div id="result_themall" class="tab-result"></div>
					</div>
					<div id="tab3_major" class="tab-pane">
						<div id="result_major" class="tab-result"></div>
					</div>
					<div id="tab4_lotus" class="tab-pane">
						<div id="result_lotus" class="tab-result"></div>
					</div>
					<div id="tab5_bigc" class="tab-pane">
						<div id="result_bigc" class="tab-result"></div>
					</div>
					<div id="tab6_robinson" class="tab-pane">
						<div id="result_robinson" class="tab-result"></div>
					</div>
					<div id="tab7_outstore" class="tab-pane">
						<div id="result_outstore" class="tab-result"></div>
					</div>
					<div id="tab8_other" class="tab-pane">
						<div id="result_others" class="tab-result"></div>
					</div>
				</div>
			</div><!-- tab_main1 -->

			<div id="tab_main2" class="tab-pane">
				<div class="input-group">
					<span class="input-group-addon txt-bold">กรุณาเลือก</span>
					<select id="sel_province_main2" class="form-control" style="width:auto;"></select>
				</div>
				<hr>
				<div id="result_main2" class="tab-result tab-result-main2"></div>
			</div><!-- tab_main2 -->

			<div id="tab_search" class="tab-pane">
				<div id="result_search" class="tab-result tab-result-main2"></div>
			</div><!-- tab_search -->

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

	<script type="text/javascript">
	var click_justopen = 0;
	var click_novas = 0;
	var click_vasdefaultpage = 0;
	var click_premium = 0;

	$(document).ready(function() {
		checkLogin();
		autoSearch();
		loadProvinceMain2();

		if($('#hide_uemail').val() != ""){
			$('.navbar-nav a[href="#tab_novas"]').show();
		}
		if($('#hide_upermiss').val() == "BACKOFFICE_ADMIN"){
			$('.navbar-nav a[href="#tab_vasdefaultpage"]').show();
		}

		$(window).scroll(function(){  
			if($(document).scrollTop()>100){
				$("#gotoTop").show();
			}else{  
				$("#gotoTop").hide(); 
			}  
		});  
		
		$('#page_loading').fadeOut();


		// $('[data-toggle="popover"]').popover({html:true}); 

		// setTimeout( function() {
		// 	$('#popover_promote').click();
		// }, 1000); 
	});

	$('body').on('click', function (e) {
		$('[data-toggle="popover"]').each(function () {
			if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
				$(this).popover('hide');
			}
		});
	});

	$('#sel_province_main1').change(function() {
		var sel_province = $('#sel_province_main1').val();

		if(sel_province != '') {
			$('.nav-tabs a[href="#tab0_all"]').tab('show');
			searchResult("#result_main1", "province", sel_province)
		}
	});

	$('#sel_province_main2').change(function() {
		var sel_province = $('#sel_province_main2').val();
		if(sel_province != '') {
			searchResult("#result_main2", "province", sel_province)
		}
	});

    $('#smart_search').autocomplete({
    	minLength: 3,
    	position: { my : "right top", at: "right bottom" },
    	focus: function(event, ui) {
    		event.preventDefault();
    		$("#smart_search-search").val(ui.item.label);
    	},
        source: function( request, response ) {
        	$("#loading_icon").show();
        	console.log('defaultJson.aspx?qrs=autoComplete&term='+request.term)
            $.ajax({
                url: 'defaultJson.aspx?qrs=autoComplete',
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

    $("#smart_search").keydown(function(event){
    	if(event.keyCode == 13) {
    		event.preventDefault();
    		return false;
    	}
    });

    $('#smart_search').focusout(function() {
		$('#smart_search').val("");
    });

    function smartSearch(term){
    	$('.navbar-nav a[href="#tab_search"]').tab('show');
		searchResult("#result_search", "shop_code", term)
    }

    function autoSearch(){
    	var gCode = _GET('shop_code');
		if(gCode != null) {
			if(gCode != "") {
				// $('#smart_search').val(gCode);
				smartSearch(gCode);
			}
			else
				loadShopJustOpen();
		}
		else
			loadShopJustOpen();
    }

	$('.navbar-nav a[href="#tab_default"]').click(function() {
		loadShopJustOpen();
	});

	$('.navbar-nav a[href="#tab_vasdefaultpage"]').click(function() {
		loadShopVasDefaultPage();
	});

	$('.navbar-nav a[href="#tab_novas"]').click(function() {
		loadShopNoVas();
	});

	$('.navbar-nav a[href="#tab_premium"]').click(function() {
		loadShopPremiumReceive();
	});

    function loadShopJustOpen() {
    	$('.navbar-nav a[href="#tab_default"]').tab('show');
    	if(click_justopen != 1){
    		click_justopen = 1
    		searchResult("#result_default", "justopen", "");
    	}
    }

    function loadShopVasDefaultPage() {
    	$('.navbar-nav a[href="#tab_vasdefaultpage"]').tab('show');
    	if(click_vasdefaultpage != 1){
    		click_vasdefaultpage = 1
    		searchResult("#result_vasdefaultpage", "vasdefaultpage", "");
    	}
    }

    function loadShopNoVas() {
    	$('.navbar-nav a[href="#tab_novas"]').tab('show');
    	if(click_novas != 1){
    		click_novas = 1
    		searchResult("#result_novas", "novas", "");
    	}
    }

    function loadShopPremiumReceive() {
    	$('.navbar-nav a[href="#tab_premium"]').tab('show');
    	if(click_premium != 1){
    		click_premium = 1
    		searchResult("#result_premium", "premium", "");
    	}
    }

    function loadProvinceMain2() {
        var $el = $('#sel_province_main2');
        $el.empty();
        $el.append($("<option></option>")
            .attr("value", "").text("กำลังโหลด"));

        $.getJSON('defaultJson.aspx?qrs=province', function(data) {
            $el.empty();
            $el.append($("<option></option>")
                .attr("value", "").text("จังหวัด"));

            $.each(data.province,function( i,item ) {
                $el.append($("<option></option>")
                    .attr("value", item.province_code).text(item.province_name));
            });
        });
    }

	function searchResult(div_id, by, term){
		$(div_id).show();
		$(div_id).html(search_loading);
		startTime = new Date().getTime();

		var search_url = "defaultJson.aspx?qrs=searchResult&province_code=" + term;
		if(by == "province")
			search_url = "defaultJson.aspx?qrs=searchResult&province_code=" + term;
		else if(by == "shop_code")
			search_url = "defaultJson.aspx?qrs=searchResult&shop_code=" + term;
		// else if(by == "justopen")
		// 	search_url = "defaultJson.aspx?qrs=searchResult&mode=justopen";
		// else if(by == "novas")
		// 	search_url = "defaultJson.aspx?qrs=searchResult&mode=novas";
		else
			search_url = "defaultJson.aspx?qrs=searchResult&mode=" + by;

		search_url += "&camera_permit=" + $('#hide_camera_permit').val();

		console.log(search_url);
		$.ajax({
			url: search_url,
			cache: false,
			dataType: "json",
			timeout: 60000, //1 min
			success: function( data ) { 
				$(div_id).hide();

				var html_txt = "";
				loadTime = (new Date().getTime() - startTime)/1000;

				html_txt = "<div class='row-count'>" +
							"<span class='glyphicon glyphicon-search txt-blue'></span>" +
							"<span class='txt-blue'> ผลการค้นหา:</span> (จำนวนที่พบ <span class='txt-red'>" + 
							data.search.length + "</span> แห่ง) " +
							loadTime + "sec" +
						"</div>";
				$(div_id).html(html_txt);

				$.each(data.search,function( i,item ) {
					$(div_id).append(appendShop(item));
				});

				$(div_id).show();

				if(div_id == "#result_main1") {
					$('.nav-tabs').show();
					writeAllTabMain1(data);
				}

				checkLogin();
			},
			error: function(x, t, m) {
				console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);
				$(div_id).html(not_responding);
			}
		});
	}

	function writeAllTabMain1(data){
		var count_central = 0;
		var count_themall = 0;
		var count_major = 0;
		var count_lotus = 0;
		var count_bigc = 0;
		var count_robinson = 0;
		var count_outstore = 0;
		var count_others = 0;
		
		var html_central = "";
		var html_themall = "";
		var html_major = "";
		var html_lotus = "";
		var html_bigc = "";
		var html_robinson = "";
		var html_outstore = "";
		var html_others = "";

		var div_central = "#result_central";
		var div_themall = "#result_themall";
		var div_major = "#result_major";
		var div_lotus = "#result_lotus";
		var div_bigc = "#result_bigc";
		var div_robinson = "#result_robinson";
		var div_outstore = "#result_outstore";
		var div_others = "#result_others";

		$(div_central).empty();
		$(div_themall).empty();
		$(div_major).empty();
		$(div_lotus).empty();
		$(div_bigc).empty();
		$(div_robinson).empty();
		$(div_outstore).empty();
		$(div_others).empty();

		$.each(data.search,function( i,item ) {
			if(item.storeplacetype_id == "1") {
				count_central++;
				$(div_central).append(appendShop(item));
			}
			else if(item.storeplacetype_id == "2") {
				count_themall++;
				$(div_themall).append(appendShop(item));
			}
			else if(item.storeplacetype_id == "3") {
				count_major++;
				$(div_major).append(appendShop(item));
			}
			else if(item.storeplacetype_id == "4") {
				count_lotus++;
				$(div_lotus).append(appendShop(item));
			}
			else if(item.storeplacetype_id == "5") {
				count_bigc++;
				$(div_bigc).append(appendShop(item));
			}
			else if(item.storeplacetype_id == "6") {
				count_robinson++;
				$(div_robinson).append(appendShop(item));
			}
			else if(item.storeplacetype_id == "7") {
				count_outstore++;
				$(div_outstore).append(appendShop(item));
			}
			else {
				count_others++;
				$(div_others).append(appendShop(item));
			}
		});

		writeAllTabEnd(div_central, html_central, count_central);
		writeAllTabEnd(div_themall, html_themall, count_themall);
		writeAllTabEnd(div_major, html_major, count_major);
		writeAllTabEnd(div_lotus, html_lotus, count_lotus);
		writeAllTabEnd(div_bigc, html_bigc, count_bigc);
		writeAllTabEnd(div_robinson, html_robinson, count_robinson);
		writeAllTabEnd(div_outstore, html_outstore, count_outstore);
		writeAllTabEnd(div_others, html_others, count_others);
	}

	function writeAllTabEnd(div_id, html_txt, count_txt){
		html_txt = "<div class='row-count'>" +
			"<span class='glyphicon glyphicon-search txt-blue'></span>" +
			"<span class='txt-blue'> ผลการค้นหา:</span> (จำนวนที่พบ <span class='txt-red'>" + 
			count_txt + "</span> แห่ง)" +
		"</div>";
		$(div_id).prepend(html_txt);
		$(div_id).show();
	}

	function appendShop(item){

		var tmp_shop_code = "(" + item.shop_code + ")";

		var tmp_shop_temp = "";
		var tmp_flag_promote = "";

		if(item.shop_temp == 1)
			tmp_shop_temp = " ***ไม่แสดงผลที่หน้าเว็บ 3BB";
		else if(item.shop_temp == 2)
			tmp_shop_temp = " **ไม่มีการรับชำระ";
		else if(item.pos_active == 1 && item.hide_vas == 0)
			tmp_shop_temp = " (shop active: พร้อม)";
		else if(item.pos_active == 0 && item.hide_vas == 0)
			tmp_shop_temp = " (shop active: ไม่พร้อม)";

		if(checkNotEmpty(item.delete_date)) {
			tmp_shop_temp = " ***ปิดศูนย์บริการถาวร เมื่อ: " + item.delete_date;
		}

		if(item.shop_location == "")
			item.shop_location = "-";

		if(item.flag_promote == 1)
			tmp_flag_promote = " *Flag Default";

		if(item.premium_receive_shop == 1)
			tmp_flag_promote = " **รับของพรีเมี่ยม";

		var html_txt = "<div class='row-shop'>" +
						"<div class='col-one'>" +
							"<div class='img-shop'>" +"<a href='" + item.picture1 + "' data-lightbox='grouped_image_" + item.shop_code + "' data-title='" + item.shop_name + " " + tmp_shop_code + "'>" +
								"<img onerror='imgError(this);' class='img-thumbnail' src='" + item.picture1 + "'>" +
								"</a>" +
							"</div>" +
							"<div class='img-shop'>" +
								"<div class='img-shop-in'>" +"<a href='" + item.picture2 + "' data-lightbox='grouped_image_" + item.shop_code + "' data-title='" + item.shop_name + " " + tmp_shop_code + "'>" +
								"<img onerror='imgError(this);' src='" + item.picture2 + "'>" +
								"</a>" +
								"<a href='" + item.picture3 + "' data-lightbox='grouped_image_" + item.shop_code + "' data-title='" + item.shop_name + " " + tmp_shop_code + "'>" +
								"<img onerror='imgError(this);' src='" + item.picture3 + "'>" +
								"</a>" +
								"</div>" +
							"</div>" +
							"<div class='img-txt'>";								
								if(item.img_map != "") {
									html_txt += "<a href='" + item.img_map + "' data-lightbox='map_" + item.shop_code + "' data-title='ภาพแผนที่ " + item.shop_name + " " + tmp_shop_code + "' id='map_" + item.shop_code + "' style='margin-right:14px;margin-left:14px;'>" +
										"<span class='glyphicon glyphicon-picture' aria-hidden='true'></span> ภาพแผนที่" +
										"<img onerror='imgError(this);' src='" + item.img_map + "' onerror='hideImgMap(\"" + item.shop_code + "\")'' style='display:none;'>" + 
									"</a>";
								}
								html_txt += getGoogleMap(item.latitude,item.longitude) +
							"</div>" +
						"</div>" +
						"<div class='col-two'>" +
							"<div class='shop-name'>" +
								"<span class='txt-blue'>3bb Shop </span>" +
								"<span class='txt-orange'>" + item.shop_name + " " + tmp_shop_code + "</span>" + showIconTools(item) +
							"</div>" +
							"<div class='shop-type txt-bold'>" +
								"<span class='txt-blue-light'>Type: " + item.storeKiosType_name + "</span>" +
								"<span class='txt-red' style='margin-left: 5px;'>" + tmp_shop_temp + "</span>" +
								"<span class='txt-orange' style='margin-left: 5px;'>" + tmp_flag_promote + "</span>" +
							"</div>" +
							"<div class='shop-locat'>" +
								"<span class='txt-bold'>สถานที่ตั้ง: </span>" + item.shop_location +
							"</div>" +
							"<div class='shop-locat'>" +
								"<span class='txt-bold'>ที่อยู่: </span>" + item.shop_address +
							"</div>" + appendTime(item);

							if(item.telephone.trim() != "" || item.fax.trim() != "") {
								html_txt += "<div class='shop-tel'>";
								if(item.telephone.trim() != "") {
									html_txt += "<div class='shop-tel-call'>" +
									"เบอร์ติดต่อ: " + item.telephone +
									"</div>";
								}
								if(item.fax.trim() != "") {
									html_txt += "<div class='shop-tel-call'>" +
									"fax: " + item.fax +
									"</div>";
								}
								html_txt += "</div>";
							}

							html_txt += appendRemark(item);

							if(item.line_id.trim() != "") {
								html_txt += "<div class='shop-lineid'>" +
								"	<button type='button' class='btn btn-nm btn-lineapp' onclick='popupCenter(\"https://line.me/ti/p/~" + item.line_id + "\", \"exmap\",750,500)'>" +
								"	Line ID: " + item.line_id +
								"	</button>" +
								"</div>";
							}

							html_txt += "<div class='shop-description'>";
							if(item.shop_comment.trim() != "") {
								html_txt += "<div class='shop-desc-comment'>" +
									"หมายเหตุภายใน: " + item.shop_comment +
								"</div>";
							}

					if(item.shop_temp != 2)
							html_txt += "<button type='button' class='btn btn-sm' id='showDataOnhand_" + item.shop_code + "' onClick=\"showDataOnhand('" + item.shop_code + "')\">ดูเพิ่มเติม..</button>";

						html_txt += "</div></div></div>";

		return html_txt;
	}

	function appendTime(item){
		var html_txt = "";

		if(item.time_open_weekday != "" || item.time_open_weekend != ""){
			html_txt += "<div class='shop-time'>";

			html_txt += "<div class='shop-time-open'>" +
			"<span class='txt-bold txt-blue'>เปิดบริการ: </span>" +
			"<span class='txt-orange'>" + item.time_open_weekday + "</span>" +
			"</div>";

			if(item.time_open_weekend != ""){
				html_txt += "<div class='shop-time-open'>" +
				"<span class='txt-bold' style='color:#fff'>เปิดบริการ: </span>" +
				"<span class='txt-orange'>" + item.time_open_weekend + "</span>" +
				"</div>";
			}

			html_txt += "</div>";

			if(item.day_off != ""){
				html_txt += "<div class='shop-time'>";

				html_txt += "<div class='shop-time-open'>" +
				"<span class='txt-bold txt-red'>ปิดทำการ: </span>" +
				"<span class='txt-bold txt-red'>" + item.day_off + "</span>" +
				"</div>";

				html_txt += "</div>";
			}
		}

		return html_txt;
	}

	function appendRemark(item){
		var html_txt = "";

		if(item.remark != ""){
			html_txt += "<div class='shop-time'><div class='shop-time-open'>";

			var arr_remark = item.remark.split("[*NL]");

			if(arr_remark.length == 1){
				html_txt += "<span class='txt-bold txt-red'>หมายเหตุ: </span>" + item.remark;
			}
			else {
				html_txt += "<span class='txt-bold txt-red'>หมายเหตุ: </span>" +
				"<ul style='list-style-type:disc; margin-left:50px;'>";

				for(var i = 0; i < arr_remark.length; i++) {
					html_txt += "<li style='margin-bottom:10px;'>" + arr_remark[i] + "</li>";
				}
				html_txt += "</ul>";
			}

			html_txt += "</div></div>";
		}

		if(item.remark_future != ""){
			html_txt += "<div class='shop-time'><div class='shop-time-open'>";

			var arr_remark = item.remark_future.split("[*NL]");

			if(arr_remark.length == 1){
				html_txt += "<span class='txt-bold txt-red'>หมายเหตุอื่นๆ (ที่จะแสดงในวันถัดไป): </span>" + item.remark_future;
			}
			else {
				html_txt += "<span class='txt-bold txt-red'>หมายเหตุอื่นๆ (ที่จะแสดงในวันถัดไป): </span>" +
				"<ul style='list-style-type:disc; margin-left:50px;'>";

				for(var i = 0; i < arr_remark.length; i++) {
					html_txt += "<li style='margin-bottom:10px;'>" + arr_remark[i] + "</li>";
				}
				html_txt += "</ul>";
			}

			html_txt += "</div></div>";
		}

		return html_txt;
	}

	function showDataOnhand(shop_code) {
		var loading = "<div id='showDataOnhand_" + shop_code + "''><span class='glyphicon glyphicon-refresh gly-spin'></span> กำลังโหลด...</div>";
		$("#showDataOnhand_" + shop_code).replaceWith(loading);

		var url = "reportJson.aspx?qrs=loadOnhand&shop_code=" + shop_code;
		console.log(url);
		$.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 60000,
			success: function( data ) { 
				var	html_txt = "ไม่มีข้อมูล";

				if(data.length > 0){
					html_txt = "<div class='shop-desc-checkdate'>" +
									"ตรวจนับ ณ วันที่ : " + data[0].PHYSICALDATE +
								"</div>" +
								"<div class='shop-desc-stock'>";

					$.each(data,function( i,item ) {
						html_txt += "<div class='shop-desc-item'>" +
										item.ITEM + " <span class='txt-red'>จำนวน " + item.ONHAND_QUANTITY + " ชิ้น</span><br>" +
									"</div>";
					});

					html_txt +=	"</div>";
					// html_txt += "<a target='_blank' href='http://10.11.153.169/onhand/alert1_bkk.php?ro=" + data[0].RO + "&shopcode=" + shop_code + "'>รายละเอียด..</a>"
				}

				$("#showDataOnhand_" + shop_code).replaceWith(html_txt);
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

	function showIconTools(item) {
		var shop_code = item.shop_code.toUpperCase();
		var camera_icon = item.camera_icon.toUpperCase();

		var res = $('#hide_shoplist').val().search(shop_code);
		var html_txt = "";

		if(checkIsEmpty(item.delete_date)) {
			if(res != -1 || $('#hide_shoplist').val() == "ALL" || $('#hide_upermiss').val() == "BACKOFFICE_ADMIN") {
				html_txt = "<a class='use_loged btn-sm' href='updateStockShop.aspx?shop_code=" + shop_code + "' target='_blank' title='แก้ไข'>" +
								"<span class='glyphicon glyphicon-edit' aria-hidden='true'></span>" +
							"</a>";			
			}

			if(checkNotEmpty(camera_icon)) {
				if(camera_icon == "N")	{
					html_txt += "<a class='txt-blue-light btn-sm' href='itcamera.aspx?shop_code=" + shop_code + "' target='_blank' title='ดูกล้องวงจรปิด'>" +
								"<span style='top:2px; font-size:14px;' class='glyphicon icon-video' aria-hidden='true'></span>" +
							"</a>";	
				}
				else {
					html_txt += "<a class='txt-blue-light btn-sm' href='itcamera.aspx?shop_code=" + shop_code + "' target='_blank' title='ดูกล้องวงจรปิด'>" +
								"<span style='top:2px; font-size:14px;' class='glyphicon icon-video-camera' aria-hidden='true'></span>" +
							"</a>";		
				}
			};
		};

		return html_txt;
	}

	function getGoogleMap(lat,lng){
		if(lat.trim().length >= 5 && lng.trim().length >= 5) {
			var url = "posmap.html?lat=" + lat + "&lng=" + lng;
			return "<a onclick=\"popupCenter('" + url + "', 'myPop1',750,500);\" href='javascript:void(0);'>" +
						"<span class='glyphicon glyphicon-map-marker' aria-hidden='true'></span> Google Map" +
					"</a>";
		}
		else {
			return "";
		}
	}

	function imgError(image) {
		image.onerror = "";
		image.src = "App_Inc/noimage.png";
		return true;
	}

	function hideImgMap(code) {
		$('#map_' + code).hide();
	}
	</script>
	<script src="App_Inc/lightbox2/js/lightbox.js"></script>
	<script>
	lightbox.option({
		'albumLabel': "3BB Shop",
		'resizeDuration' : 200,
		'wrapAround': true
	})
	</script>
</body>
</html>
