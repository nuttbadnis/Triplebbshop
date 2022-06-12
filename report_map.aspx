<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/master_report.Master" CodeFile="report_map.aspx.vb" Inherits="report_map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="firstPlace" runat="server">
<script src="https://maps.google.com/maps/api/js?key=AIzaSyCyyKlfSYYOjD6F36Nmf3F_q68kmrBfhtA&sensor=false" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="containerPlace" runat="server">
<nav class="navbar navbar-default">
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a id="href_report_table" href="report_table.aspx">แบบตาราง</a></li>
			<li class="active"><a id="href_report_map" href="report_map.aspx">แบบแผนที่</a></li>
		</ul>

		<div class="navbar-form navbar-right" role="search">
			<div class="input-group">
				<span class="input-group-addon txt-bold">เลือกเขตพื้นที่</span>
				<select id="sel_ro" class="form-control input-sm" style="width:auto;"><option value="">ALL</option></select>
			</div>

			<div class="input-group">
				<div class="input-group-addon" id="loading_icon" style="display:none;">
					<span class="glyphicon glyphicon-refresh gly-spin" aria-hidden="true">
					</div>
					<input type="text" class="form-control input-sm" id="smart_search" placeholder="รหัสสาขา ชื่อสาขา จังหวัด เขต/อำเภอ">
					<div class="input-group-addon" id="search_icon">
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					</div>
				</div>
			</div>
		</div>
	</nav>


	<div class="container">
		<div id="color_popup" class="box-popup" style="display:none;"></div>

		<div id="desc_popup" class="box-popup" style="display:none;">
			<b>สำนักงานใหญ่ (BKK01)</b><br>
			Status: open<br>
			Shop Open: 10:00<br>
			Shop Close: 21:00<br>
			Open Time: 09:56<br>
			Close Time: -
		</div>

		<div id="onhand_popup" class="box-popup" style="display:none;">
			<div id="showDataOnhand"></div>
		</div>
	</div>

	<div id="map_report"></div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlace" runat="server">
<script type="text/javascript">
var get_lat = _GET('lat');
var get_lng = _GET('lng');
var currentMarker = null;
var fademove = 0;

$(document).ready(function() { 
	var color_html = "" + 
	"<img src='App_Inc/map/logo0.png'> " + arrSts[0] + "<br>" +
	"<img src='App_Inc/map/logo1.png'> " + arrSts[1] + "<br>" +
	"<img src='App_Inc/map/logo2.png'> " + arrSts[2] + "<br>" +
	"<img src='App_Inc/map/logo3.png'> " + arrSts[3] + "<br>" +
	"<img src='App_Inc/map/logo4.png'> " + arrSts[4] + "<br>" +
	"<img src='App_Inc/map/logo5.png'> " + arrSts[5] + "<br>";
	$('#color_popup').html(color_html);
});

$(document).mouseup(function (e){
	// setTimeout(function() {

		if(fademove == 1){
			var container = $('#desc_popup');

			if (!container.is(e.target) && container.has(e.target).length === 0){
				container.fadeOut();
			}
			var container = $('#onhand_popup');

			if (!container.is(e.target) && container.has(e.target).length === 0){
				container.fadeOut();
			}

			fademove = 0;
		}
		else {
			fademove = 1;
		}

	// }, 1000);
});

$('#smart_search').on('autocompleteselect', function (e, ui) {
    // $('#sel_ro').val("");
    getLatLng(ui.item.value);
});

function getGoogleMap(lat,lng,setDefult = false){
	$('#map_report').replaceWith("<div id='map_report'></div>");

	var map = new google.maps.Map(document.getElementById('map_report'), {
		zoom: 13,
		minZoom: 5,
		center: {lat: lat, lng: lng},
		streetViewControl: false,
		zoomControl: true,
		zoomControlOptions: {
			position: google.maps.ControlPosition.RIGHT_CENTER
		},
		mapTypeControl: true,
		mapTypeControlOptions: {
			position: google.maps.ControlPosition.RIGHT_CENTER
		}
	});

	var infowindow = new google.maps.InfoWindow();
	var marker, i;

	if(data_result.length > 0){

		function searchShopWarn(shop_array){
			var res_arr = [];
			for (var i=0; i < shop_array.length; i++) {
				if (shop_array[i].diff_minute >= 10 && shop_array[i].shop_status >= 2) {
					res_arr.push(i);
				}
				else if (shop_array[i].shop_status >= 3) {
					res_arr.push(i);
				}
			}
			return res_arr;
		}

		var shop_warn = searchShopWarn(data_result);
		var center_idx = 0;

		if(shop_warn.length > 0){
			center_idx = randomNum(0, shop_warn.length-1);
			center_idx = shop_warn[center_idx];
		}
		else{
			center_idx = randomNum(0, data_result.length-1);
		}

		var set_lat = data_result[center_idx].latitude;
		var set_lng = data_result[center_idx].longitude;

		$.each(data_result,function( i,item ) {
			if(item.shop_temp == 0) {
				var img_w = ""

				if(item.diff_minute >= 10 && item.shop_status >= 2)
					img_w = "-w";

				var mud = "App_Inc/map/logo" + item.shop_status + img_w + ".png";
				var sts = "<span class='sts-" + item.shop_status + "'>" + arrSts[item.shop_status] + "</span>";

				if(item.shop_status == 4 && item.first_up == '-'){
					mud = "App_Inc/map/logo" + item.shop_status + "-w.png";
				}

				if(item.shop_dayoff == 1){
					mud = "App_Inc/map/logo1.png";
					sts = "<span class='sts-off'>" + strOff + "</span>";
				}

				if(item.close_temp == 1){
					mud = "App_Inc/map/logo1.png";
					sts = "<span class='sts-off'>" + strOffTemp + "</span>";
				}

				if(item.latitude != "" && item.longitude != "" ){

					if(setDefult == true && item.latitude == lat && item.longitude == lng) {
						marker = new google.maps.Marker({
							position: new google.maps.LatLng(item.latitude, item.longitude),
							map: map,
							icon: mud,
							title: "[" + item.shop_code + "] " + item.shop_name,
							animation: google.maps.Animation.BOUNCE
						});

						currentMarker = marker;
					}
					else {
						marker = new google.maps.Marker({
							position: new google.maps.LatLng(item.latitude, item.longitude),
							map: map,
							icon: mud,
							title: "[" + item.shop_code + "] " + item.shop_name
						});
					}

					google.maps.event.addListener(marker, 'click', (function(marker, i) {
						return function() {
							fademove = 0;
							get_lat = item.latitude;
							get_lng = item.longitude;

							var txt_content = "<b>[" + item.shop_code + "] " + item.shop_name + "</b><br>";
							infowindow.setContent(txt_content);
							infowindow.open(map, marker);

							map.setCenter(marker.getPosition());

							$('#desc_popup').hide();
							txt_content = "<a title='คลิกดูข้อมูลแบบตาราง' href='report_table.aspx?shop_code=" + item.shop_code + strHashRO() + "' class='in-page'><span class='glyphicon glyphicon-th-list'></span></a> "
							txt_content += "<b>RO" + item.ro + " [" + item.shop_code + "]</b><br>";
							txt_content += "<b>" + item.shop_name + "</b><br>";
							txt_content += "<a title='คลิกเพื่อดูข้อมูลสำนักงาน' target='_blank' href='default.aspx?shop_code=" + item.shop_code + "'><span class='glyphicon icon-file-text2'></span> คลิกดูข้อมูลสำนักงาน..</a><br>";
							txt_content += "สถานะ: <b>" + sts + "</b><br>";
							txt_content += "เวลาเปิด: " + item.shop_open + "<br>";
							txt_content += "เวลาปิด: " + item.shop_close + "<br>";
							txt_content += "บันทึกเปิดเมื่อ: " + item.open_time + "<br>";
							txt_content += "บันทึกปิดเมื่อ: " + item.close_time + "<br>";
							txt_content += "<hr style='margin:2px; border-top:1px solid #ccc;'>";
							txt_content += "ข้อมูลเปิดเข้าส่วนกลาง: " + checkRepIn(item,"open","txt") + "<br>";
							txt_content += "ข้อมูลปิดเข้าส่วนกลาง: " + item.close_in_serv + "<br>";
							txt_content += "การเชื่อมต่อครั้งแรก: " + item.first_up + "<br>";
							txt_content += "การเชื่อมต่อล่าสุด: " + checkDiffConnect(item,"txt") + "<br>";
							// txt_content += "<a title='คลิกเพื่อดูข้อมูลการเชื่อมต่อ' target='_blank' href='shopConnect.aspx?shop_code=" + item.shop_code + "'><span class='glyphicon glyphicon-transfer'></span> คลิกดูข้อมูลการเชื่อมต่อ..</a>";
							$('#desc_popup').html(txt_content);

							$('#desc_popup').fadeIn();

							$('#onhand_popup').hide();
							showDataOnhand(item.shop_code);
							$('#onhand_popup').fadeIn();


							if(currentMarker) 
								currentMarker.setAnimation(null);

							currentMarker = marker;
							marker.setAnimation(google.maps.Animation.BOUNCE);
						}
					})(marker, i));
}
}

if(lat == item.latitude && lng == item.longitude){
	set_lat = item.latitude;
	set_lng = item.longitude;
}
});

map.setCenter(new google.maps.LatLng(set_lat, set_lng));

$('#map_report').fadeIn();
$('#color_popup').fadeIn();
}
}

function getLatLng(code){
	var url = "reportJson.aspx?qrs=getLatLng&shop_code=" + code;
	console.log(url);
	$.ajax({
		url: url,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 

			if(data.length > 0){
				get_lat = parseFloat(data[0].latitude);
				get_lng = parseFloat(data[0].longitude);

				gotoMap(get_lat,get_lng)
			}
			else {
				modalAlert("ยังไม่มีข้อมูล latitude, longitude");
			}

		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);

			modalAlert("ไม่สำเร็จ กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
			$('#modal_alert').on('hidden.bs.modal', function (e) {
				location.reload();
			})
		}
	});
}

function gotoMap(lat,lng){
    // mapIn();
    getGoogleMap(lat,lng,true);
}

function getShop() {
	var gCode = checkGetShop();

	if(gCode != "") {
		getLatLng(gCode)
	}
	else if((get_lat != null && get_lat != "") && (get_lng != null && get_lng != "")){
		var lat = get_lat * 1;
		var lng = get_lng * 1;

		console.log('getGoogleMap(' + lat +',' + lng +')');

		getGoogleMap(lat,lng,true);
	}
	else{
		var url = "reportJson.aspx?qrs=getShop&uemail=" + $('#hide_uemail').val();
		var lat = 13.905502;
		var lng = 100.519812;

		console.log(url);
		$.ajax({
			url: url,
			cache: false,
			dataType: "json",
			timeout: 60000,
			success: function( data ) { 

				if(data.length > 0){
					lat = parseFloat(data[0].latitude);
					lng = parseFloat(data[0].longitude);

					getGoogleMap(lat,lng,true);
				}
				else {
					getGoogleMap(lat,lng);
				}
			},
			error: function(x, t, m) {
				console.log('x>' + x + ' t>' + t + ' m>' + m);
				getGoogleMap(lat,lng);
			}
		});
	}
}

function showDataOnhand(shop_code) {
	var loading = "<div id='showDataOnhand'><span class='glyphicon glyphicon-refresh gly-spin'></span> กำลังโหลด...</div>";
	$('#showDataOnhand').replaceWith(loading);

	var url = "reportJson.aspx?qrs=loadOnhand&shop_code=" + shop_code;
	console.log(url);
	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 

			var html_txt = "<div id='showDataOnhand'>";

			if(data.length > 0){
				html_txt += "<b class='txt-blue'>ตรวจนับ ณ วันที่ : " + data[0].PHYSICALDATE + "</b><br>";
				// html_txt += "<a title='คลิกเพื่อดูข้อมูล On Hand' target='_blank' href='http://10.11.153.169/onhand/alert1_bkk.php?ro=" + data[0].RO + "&shopcode=" + shop_code + "'><span class='glyphicon icon-clipboard'></span> คลิกดูรายละเอียด..</a><br>"

				$.each(data,function( i,item ) {
					html_txt += item.ITEM + " <span class='txt-blue'> " + item.ONHAND_QUANTITY + " ชิ้น</span><br>";
				});
			}
			else {
				html_txt += "ไม่มีข้อมูล";
			}

			html_txt += "</div>";
			$('#showDataOnhand').replaceWith(html_txt);

			$("#onhand_popup").width("auto");

			if(data.length >= 6){
				$('#onhand_popup').animate({ width: '+=20px' }, 300, function() {});
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

function shopConnect(shop_code) {

	var url = "reportJson.aspx?qrs=shopConnect&shop_code=" + shop_code;
	console.log(url);
	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			var txt_first_up = "";
			var txt_last_up = "";

			if(data.length > 0){
				var style = "";
				if(data[0].diff_minute >= 10)
					style = "style='color:red; font-weight:bold;'";
				else if(data[0].diff_minute >= 5)
					style = "style='color:yellow; font-weight:bold;'";

				txt_first_up += "<span>" + data[0].first_up + "</span>";
				txt_last_up += "<span " + style + ">" + data[0].last_up + "</span>";
			}
			else {
				txt_first_up = "-";
				txt_last_up = "-";
			}

			$('#txt_first_up').replaceWith(txt_first_up);
			$('#txt_last_up').replaceWith(txt_last_up);
		},
		error: function(x, t, m) {
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);

			$('#txt_first_up').replaceWith("error");
			$('#txt_last_up').replaceWith("error");
		}
	});
}
</script>
</asp:Content>