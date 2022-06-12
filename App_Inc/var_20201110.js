var strOff = "วันหยุด"
var strOffTemp = "ปิดชั่วคราว"
var arrSts = ['ยังไม่ถึงเวลาเปิด', 'ปิดแล้ว/' + strOff, 'เปิดแล้ว', 'เปิดสาย', 'ไม่เปิด(ยังไม่มีข้อมูลเปิด)', 'ปิดก่อนเวลาปิด'];
// var arrSts = ['ยังไม่ถึงเวลาเปิด', 'ปิดแล้ว/' + strOff, 'เปิดแล้ว', 'เปิดสาย', 'ไม่เปิด', 'ปิดก่อนเวลาปิด'];
var arrHistorySts = ['เปิดปกติ', 'ไม่เปิด/' + strOff, '',  'เปิดสาย', 'ไม่เปิด', 'ปิดก่อนเวลา'];
var arrOpenSts = ['เปิดปกติ', 'เปิดสาย', 'ไม่เปิด', strOff];
var arrCloseSts = ['ปิดปกติ', 'ปิดก่อน', 'ไม่เปิด', strOff, 'ไม่บันทึกปิด', 'ปิดข้ามวัน'];

var arrTopicProve = ['', 
	'<span class="topic-1">เปลี่ยนแปลงข้อมูลสำนักงาน</span>', 
	'<span class="topic-2">เปลี่ยนแปลงเวลาทำการ</span>',  
	'<span class="topic-3">เปลี่ยนแปลงรูปภาพ</span>', 
	'<span class="topic-4">หมายเหตุแสดงบนเว็บ 3BB</span>', 
	'<span class="topic-5">แจ้งปิดทำการชั่วคราว</span>'
];
var arrStatusProve = [
	'<b class="pending"><span class="glyphicon glyphicon-retweet" aria-hidden="true"></span> รอ MKT</b>', 
	'', '', 
	'<b class="follow"><span class="glyphicon glyphicon-retweet" aria-hidden="true"></span> รออนุมัติ</b>',
	'', '', '', '',
	'<b class="cancle"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> ไม่อนุมัติ</b>',
	'<b class="approve"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> อนุมัติแล้ว</b>',
];
var arrStatusProveReport = [
	'<b class="pending">รอ MKT</b>', 
	'', '', 
	'<b class="follow">รออนุมัติ</b>',
	'', '', '', '',
	'<b class="cancle">ไม่อนุมัติ</b>',
	'<b class="approve">อนุมัติแล้ว</b>',
];
var arrShopTemp = ["ปกติ", "ไม่แสดงผลที่หน้าเว็บ 3BB", "ไม่มีการรับชำระ"];
var flag_promote = "คลิกเพื่อให้แสดงผลบนหน้าแรกเว็บ 3BB (Flag Default)";
var hr_endrow = "<hr class='end-row'>";

var itemEmpty = {
	no_approve: "", 
	no_shopStock: "", 
	shop_code: "", 
	shop_name: "",
	shop_location: "",
	shop_address: "",
	shop_comment: "",
	province_name: "",
	amphur_name: "",
	storeplacetype_name: "",
	storeKiosType_name: "",
	telephone: "",
	fax: "",
	latitude: "",
	longitude: "",
	shop_temp: "",
	flag_promote: "",
	picture1: "",
	picture2: "",
	picture3: "",
	img_map: "",
	dayoff_sat: "",
	dayoff_sun: "",
	day_7: "",
	wd_shop_open: "",
	wd_shop_close: "",
	wd_cash_open: "",
	wd_cash_close: "",
	wd_credit_open: "",
	wd_credit_close: "",
	we_shop_open: "",
	we_shop_close: "",
	we_cash_open: "",
	we_cash_close: "",
	we_credit_open: "",
	we_credit_close: ""
};

var htm_br = "<br>";
var htm_tab = "&nbsp;&nbsp;&nbsp;&nbsp;";
var htm_und_1 = "<u>";
var htm_und_2 = "</u>";


var Y_item10 = "ถูกต้อง";
var N_item10 = "ไม่ถูกต้อง";
var Y_item10_Answ = "<b class='txt-green'><span class='glyphicon glyphicon-ok'></span> " + Y_item10 + "</b>";
var N_item10_Answ = "<b class='txt-red'><span class='glyphicon glyphicon-remove'></span> " + N_item10 + "</b>";

var Y_item20 = Y_item10;
var N_item20 = N_item10;
var Y_item20_Answ = Y_item10_Answ;
var N_item20_Answ = N_item10_Answ;

var Y_item30 = Y_item10;
var N_item30 = N_item10;
var Y_item30_Answ = Y_item10_Answ;
var N_item30_Answ = N_item10_Answ;

var Y_item40 = Y_item10;
var N_item40 = N_item10;
var Y_item40_Answ = Y_item10_Answ;
var N_item40_Answ = N_item10_Answ;

var Y_item110 = "มี";
var N_item110 = "ไม่มี";
var Y_item110_Answ = "<b class='txt-green'><span class='glyphicon glyphicon-ok'></span> " + Y_item110 + "</b>";
var N_item110_Answ = "<b class='txt-red'><span class='glyphicon glyphicon-remove'></span> " + N_item110 + "</b>";

var preview_upload = "../App_Inc/preview_upload.png"