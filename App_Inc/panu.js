// ############################# auto Session expired #############################
var sessionout = 0;
var sstimeout = null;
var ssStart,ssEnd;

$(document).ready(function() {
	checkSession();
	
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
});

function checkSession() {

	if($('#hide_uemail').val() != null) {
		if($('#hide_uemail').val().length > 0){
			ssStart = new Date().getTime();
			console.log("checkSession start");

			sstimeout = setTimeout(function() {

				getSession(function(uemail){
					checkSession();

					ssEnd = (new Date().getTime() - ssStart)/1000;
					console.log(ssEnd + " > " + uemail);

					if(uemail.length == 0)
						sessionExpired();
				});
			}, 1210000);
		}
    }
}

function getSession(handleData){
	var path_url = window.location.pathname.split( '/' );
	var url = window.location.protocol + "//" + window.location.host + "/" + path_url[1] + "/defaultJson.aspx?qrs=getSession";
	console.log(url);

	$.ajax({
		url: url,
		success: function( res ) {
			handleData(res); 
		}
	});
}

function sessionExpired() {
	sessionout = 1;
	modalAlert("Session expired!!");

	$('#modal_alert').on('hidden.bs.modal', function (e) {
		window.location.replace("default.aspx");
	})
}
// ############################# auto Session expired #############################

function checkLogin() {
	if($('#hide_uemail').val() == ""){
		$('#li_login').show();
	}
	else{
		$('.use_loged').show();
	}
}

function modalAlert(e){
	$('#txt_alert').html(e)
	$('#modal_alert').modal("show");
}

function _GET(v) {
	var $_GET = {};

	document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
		function decode(s) {
			return decodeURIComponent(s.split("+").join(" "));
		}

		$_GET[decode(arguments[1])] = decode(arguments[2]);
	});

	return $_GET[v];
}

function getHash() {
	if(window.location.hash) {
		return window.location.hash.substring(1);
	} else {
		return ""
	}
}

function getFullDate_EN() {
	var d = new Date();

	var month = d.getMonth()+1;
	var day = d.getDate();

	return (day<10 ? '0' : '') + day + '/' +
	(month<10 ? '0' : '') + month + '/' +
	(d.getFullYear());
}

function getFullDate_TH() {
	var d = new Date();

	var month = d.getMonth()+1;
	var day = d.getDate();

	return (day<10 ? '0' : '') + day + '/' +
	(month<10 ? '0' : '') + month + '/' +
	(d.getFullYear() + 543);
}

function validateDate(dtValue) {
	var dtRegex = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
	return dtRegex.test(dtValue);
}

function popupCenter(url, title, w, h) {
	var left = (screen.width/2)-(w/2);
	var top = (screen.height/2)-(h/2);
	top = top/2;
	// var top = 75;
	return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}

function itemNull(v) {
	if (v == null)
		return "-";
	else if(v.toLowerCase() == "null")
		return "-";
	else if(v.length == 0)
		return "-";
	else if(v.trim() == "")
		return "-";
	else
		return v;
}

function itemNullByText(v, t) {
	if (v == null)
		return t;
	else if(v.toLowerCase() == "null")
		return t;
	else if(v.length == 0)
		return t;
	else if(v.trim() == "")
		return t;
	else
		return v;
}

function itemBlank(v) {
	if (v == null)
		return "";
	else if(v.toLowerCase() == "null")
		return "";
	else if(v.length == 0)
		return "";
	else if(v.trim() == "")
		return "";
	else
		return v;
}

function checkIsEmpty(v) {
	if (v == null)
		return true;
	else if(v.toLowerCase() == "null")
		return true;
	else if(v.length == 0)
		return true;
	else if(v.trim() == "")
		return true;
	else
		return false;
}

function checkNotEmpty(v) {
	if (v == null)
		return false;
	else if(v.toLowerCase() == "null")
		return false;
	else if(v.length == 0)
		return false;
	else if(v.trim() == "")
		return false;
	else
		return true;
}

function limitStr(str, length) {
	if(str.length > length){
		str = str.substring(0, length) + "...";
	}

	return itemNull(str);
}

function limitLink(url, length) {
	var str = itemNull(url);

	if(str != "-") {
		if(str.length > length){
			str = str.substring(0, length) + "...";
		}

		str = "<a href='" + url + "' title='" + url + "' target='_blank'>" + str + "</a>";
	}
	
	return str;
}

function openNewTab(url) {
	var win = window.open(url, '_blank');
	win.focus();
}

function gotoUrl(url) {
	window.location = url;
}

function refineUrl() {
    var reUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
    window.history.pushState({path:reUrl},'',reUrl);
}

function hashTab(hash){
	$('.navbar-nav a[href="#tab_' + hash + '"]').tab('show');
	window.location.hash=hash;
}

function serverTime(){
	var xmlHttp;
	
    try {
        //FF, Opera, Safari, Chrome
        xmlHttp = new XMLHttpRequest();
    }
    catch (err1) {
        //IE
        try {
            xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
        }
        catch (err2) {
            try {
                xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
            }
            catch (eerr3) {
                //AJAX not supported, use CPU time.
                alert("AJAX not supported");
            }
        }
    }
    // var url = window.location.href.toString();
	var url = window.location.protocol + "//" + window.location.host + window.location.pathname;
	url = url.replace("report.aspx", "blank.html");

    xmlHttp.open('HEAD',url,false);
    xmlHttp.setRequestHeader("Content-Type", "text/html");
    xmlHttp.send('');
    return xmlHttp.getResponseHeader("Date");
}

function checkRepIn(item,otct,txt = '') {
	var keep_time;
	var in_serv;

	if(otct == 'open'){
		keep_time = item.open_time;
		in_serv = item.open_in_serv;
	}
	else{
		keep_time = item.close_time;
		in_serv = item.close_in_serv;
	}

	if(txt == "txt"){
		if(timeDiff(keep_time,in_serv) < -2)
			return "<span title='มีข้อมูลเข้าส่วนกลาง \"ก่อน\" เวลาบันทึกเปิด/ปิด 2 นาที' style='color:#ffb0b0; font-weight:bold;'>" + in_serv + "</span>";
		else if(timeDiff(keep_time,in_serv) > 15)
			return "<span title='มีข้อมูลเข้าส่วนกลาง \"ช้ากว่า\" เวลาบันทึกเปิด/ปิด 15 นาที' style='color:#ffb588; font-weight:bold;'>" + in_serv + " </span>";
		else
			return "<span>" + in_serv + "</span>";
	}
	else{
		if(item.in_serv_diff > 0 && otct == 'close')
			return "<td title='มีข้อมูลเข้าส่วนกลาง \"ช้ากว่า\" เวลาบันทึกเปิด/ปิด 15 นาที' style='background-color:#ffb588; font-weight:bold;'>" + in_serv + " <b style='color:#b00000'>+" + item.in_serv_diff + "</b></td>";
		else if(timeDiff(keep_time,in_serv) < -2)
			return "<td title='มีข้อมูลเข้าส่วนกลาง \"ก่อน\" เวลาบันทึกเปิด/ปิด 2 นาที' style='background-color:#ffb0b0; font-weight:bold;'>" + in_serv + " </td>";
		else if(timeDiff(keep_time,in_serv) > 15)
			return "<td title='มีข้อมูลเข้าส่วนกลาง \"ช้ากว่า\" เวลาบันทึกเปิด/ปิด 15 นาที' style='background-color:#ffb588; font-weight:bold;'>" + in_serv + " </td>";
		else
			return "<td>" + in_serv + "</td>";
	}

	function timeDiff(t1,t2){
		var timeStart = new Date (new Date().toDateString() + ' ' + t1);
		var timeEnd = new Date (new Date().toDateString() + ' ' + t2);

		var hourDiff = timeEnd - timeStart;
		var diffHrs = Math.round((hourDiff % 86400000) / 3600000);
		var diffMins = Math.round(((hourDiff % 86400000) % 3600000) / 60000);
		diffMins = diffMins + (diffHrs * 60);

		return diffMins;
	}
}

function checkDiffConnect(item, txt=''){
	if(txt == 'txt'){
		var style = "";

		if(item.diff_minute >= 10 && item.shop_status >= 2)
			style = "title='ยังไม่มีการเชื่อมต่อ หรือขาดการเชื่อมต่อนานเกิน 10 นาที' style='color:#ff3c19;; font-weight:bold;'";
		// else if(item.diff_minute >= 5)
		// 	style = "style='color:#FFFF00;; font-weight:bold;'";

		return "<span " + style + ">" + item.last_up + "</span>";
	}
	else{
		if(item.diff_minute >= 10 && item.shop_status >= 2)
			return "<td title='ยังไม่มีการเชื่อมต่อ หรือขาดการเชื่อมต่อนานเกิน 10 นาที' style='background-color:#ff3c19; color:#fff; font-weight:bold;'>" + item.last_up + "</td>";
		// else if(item.diff_minute >= 5)
		// 	return "<td style='background-color:#FFFF00; font-weight:bold;'>" + item.last_up + " </td>";
		else
			return "<td>" + item.last_up + "</td>";
	}
}

function randomNum(min, max){
	return Math.floor(Math.random() * max) + min;
}

function modalAlertXL(e){
	$('#txt_alert_xl').html(e)
	$('#modal_alert_xl').modal("show");
}

function goBack() {
	window.history.back();
}