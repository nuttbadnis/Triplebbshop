<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/master_report.Master" CodeFile="report_table.aspx.vb" Inherits="report_table" %>

<asp:Content ID="Content1" ContentPlaceHolderID="firstPlace" runat="server">
<style type="text/css">
#sidebar {
    z-index: 999;
    left: -400px;
    width: 400px;
    height: auto;
    border-top: 1px solid #c8302c ;
    border-right: 1px solid #c8302c ;
    border-bottom: 1px solid #c8302c ;
    border-radius: 0 0 4px 0;
    background-color: #f8f8f8;
    position: absolute;
}
#toggle {
    z-index: 999;
    position: absolute;
}
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="containerPlace" runat="server">
<nav class="navbar navbar-default">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active"><a id="href_report_table" href="report_table.aspx">แบบตาราง</a></li>
            <li><a id="href_report_map" href="report_map.aspx">แบบแผนที่</a></li>
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
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </div>
                </div>
            </div>
    </div>

</nav>

<!-- <button type="button" class="btn btn-danger btn-lg" id="toggle" style="border-radius: 0px 4px 4px 0px;">
  <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
</button>
<div id="sidebar">
    <div style="padding:10px;">
        <span style="line-height:40px;"><span class='glyphicon glyphicon-map-marker'></span> ดูพิกัดแผนที่</span><br>
        <span style="line-height:40px;"><span class='glyphicon icon-notification'></span> โน๊ตประจำวัน</span><br>
        <span style="line-height:40px;"><span class='glyphicon icon-history iconbold'></span> ประวัติเปิดปิดย้อนหลัง 7 วัน</span><br>
        <span style="line-height:40px;"><span class='glyphicon icon-file-text2'></span> รายละเอียดสำนักงาน</span><br>
        <span style="line-height:40px;"><span class='glyphicon icon-video'></span> ดูกล้องวงจรปิด</span><br>
        <hr class="gg">
        <span style="padding:5px; line-height:40px; background-color:#ffb0b0">*มีข้อมูลเข้าส่วนกลาง "ก่อน" เวลาบันทึกเปิด\ปิด</span><br>
        <span style="padding:5px; line-height:40px; background-color:#ffb588">*มีข้อมูลเข้าส่วนกลาง "ช้ากว่า" เวลาบันทึกเปิด\ปิด 15 นาที</span><br>
        <span style="padding:5px; line-height:40px; background-color:#ff3c19; color:#fff;">*ยังไม่มีการเชื่อมต่อ หรือขาดการเชื่อมต่อนานเกิน 10 นาที</span> <img src='App_Inc/map/w.png'>
    </div>
</div> -->

<div class="container">
    <select id="sel_ro" style="display:none;"><option value=""></option></select>
    <!-- <div style="margin-bottom:25px;">

        <div class="alert alert-info alert-dismissible" role="alert" style="line-height:24px;">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><u>รายงานการเปิดปิดสำนักงาน ณ วันปัจจุบัน</u> อัพเดทระบบล่าสุดเมื่อวันที่ 16/11/2016</strong><br>
            <ul style="list-style-type:disc; padding: 15px 0 15px 15px;">
                <li>เพิ่มสถานะ "ปิดชั่วคราว" แยกออกมากจากสถานะ "วันหยุด"</li>
                <li>เพิ่มระบบเก็บประวัติ "โน๊ตประจำวัน" โดยระบบจะบันทึก "หมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB" ทุกวันอัตโนมัติ<br>
                    และสามารถเพิ่มหรือแก้ไข "โน๊ตประจำวัน" ได้ (เพื่อเก็บประวัติการชี้แจง เปิดสาย ปิดก่อน หรืออื่นๆ)
                </li>
            </ul>
            <b>** เริ่มเก็บประวัติ "หมายเหตุเฉพาะกรณี แสดงบนเว็บ 3BB" อัตโนมัติ ตั้งแต่วันที่ 10/11/2016</b>
        </div>
    </div> -->

    <div id="display_table">
        <table id="table_report" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        </table>
    </div>

    <div class="panel panel-default panel-detail-icon">
        <div class="panel-heading">
            <span class="panel-title">คำอธิบายสัญลักษณ์ต่างๆ</span>

            <button type="button" class="btn btn-sm" id="btn_memo" style="float: right; line-height: 10px;">
                <span class="glyphicon icon-database" aria-hidden="true"></span> memo..
            </button>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-6">
                    <span class="detail-icon"><span class='glyphicon glyphicon-map-marker'></span> ดูพิกัดแผนที่</span><br>
                    <span class="detail-icon"><span class='glyphicon icon-notification'></span> โน๊ตประจำวัน</span><br>
                    <span class="detail-icon"><span class='glyphicon icon-history iconbold'></span> ประวัติเปิดปิดย้อนหลัง 7 วันล่าสุด</span><br>
                    <span class="detail-icon"><span class='glyphicon icon-file-text2'></span> รายละเอียดสำนักงาน</span><br>
                    <span class="detail-icon"><span class='glyphicon icon-video'></span> ดูกล้องวงจรปิด</span><br>
                </div>
                <div class="col-xs-6">
                    <span class="detail-icon" style="padding:5px; background-color:#ffb0b0">*มีข้อมูลเข้าส่วนกลาง "ก่อน" เวลาบันทึกเปิด/ปิด 2 นาที</span><br>
                    <span class="detail-icon" style="padding:5px; background-color:#ffb588">*มีข้อมูลเข้าส่วนกลาง "ช้ากว่า" เวลาบันทึกเปิด/ปิด 15 นาที</span><br>
                    <span class="detail-icon" style="padding:5px; background-color:#ff3c19; color:#fff;">*ยังไม่มีการเชื่อมต่อ หรือขาดการเชื่อมต่อนานเกิน 10 นาที</span> <img src='App_Inc/map/w.png'>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default panel-detail-icon" id="box_memo" style="display:none;">
        <div class="panel-heading">
            <h3 class="panel-title"><span class='glyphicon icon-database'></span> ที่มาข้อมูล (dev memo)</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-6">
                    <span class="detail-icon"><b>เวลาบันทึก เปิด:</b> R16010.f07</span><br>
                    <span class="detail-icon"><b>เวลาเข้าส่วนกลาง ตอนเปิด:</b> R16010.y01</span><br>
                </div>
                <div class="col-xs-6">
                    <span class="detail-icon"><b>เวลาบันทึก ปิด:</b> R16010.f10</span><br>
                    <span class="detail-icon"><b>เวลาเข้าส่วนกลาง ตอนปิด:</b> R16010.y02</span><br>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    <span class="detail-icon"><b>เวลาบันทึก นำส่งเงิน:</b> R16020.f41</span><br>
                    <span class="detail-icon"><b>เวลาการเชื่อมต่อ ครั้งแรก และครั้งสุดท้าย:</b> ข้อมูลจาก Log Connect DTS</span><br>
                    <span class="detail-icon"><b>สรุปข้อมูลประวัติทุกวัน ก่อนเที่ยงคืน (23:55 น.)</span><br>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlace" runat="server">
<script type="text/javascript">
$(document).ready(function() {
    $('body').css( "overflow-y", "scroll" );

    // $("#toggle").click(function () {
    //     if($(this).hasClass('active')){
    //         $(this).removeClass('active');
    //         $("#sidebar").animate({
    //             left: - $("#sidebar").width() - 2
    //         });
    //         $("#toggle").animate({
    //             left: 0
    //         });
    //     } else {
    //         $(this).addClass('active');
    //         $("#sidebar").animate({
    //             left: 0
    //         });
    //         $("#toggle").animate({
    //             left: $("#sidebar").width()
    //         });
    //     }
    // });
});

$('#btn_memo').click(function() {
    $('#btn_memo').hide();
    $('#box_memo').slideDown();
});

$('#tab_table').mouseover(function() {
  $('tr.tr-hover').removeClass('tr-focus');
});

$('#smart_search').on('autocompleteselect', function (e, ui) {
    // $('#sel_ro').val("");
    gotoTable(ui.item.value);
});

function loadTable(){
    if(data_result.length > 0){
        var txt_html = "<div id='display_table'>" +
        "<table id='table_report' class='table table-striped table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
        "<thead>" +
        "<tr>" +
        "<th rowspan='2'></th>" +   
        "<th rowspan='2'>RO</th>" +   
        "<th rowspan='2'>รหัสสาขา</th>" +   
        "<th rowspan='2'>ชื่อสาขา</th>" +   
        "<th colspan='2'>เวลาทำการ</th>" +   
        "<th colspan='2'>เวลาทำการจริง</th>" +   
        "<th colspan='2'>เวลาเข้าส่วนกลาง</th>" +   
        "<th colspan='2'>การเชื่อมต่อ</th>" +  
        "<th rowspan='2'>สถานะ</th>" + 
        // "<th rowspan='2'>หมายเหตุเฉพาะกรณี</th>" +  
        "<th rowspan='2'>โน๊ตประจำวัน</th>" +   
        "</tr>" +
        "<tr>" +
        "<th>เปิด</th>" +
        "<th>ปิด</th>" +
        "<th>เปิด</th>" +
        "<th>ปิด</th>" +
        "<th>เปิด</th>" +
        "<th>ปิด</th>" +
        "<th>ครั้งแรก</th>" +
        "<th>ล่าสุด</th>" +
        "</tr>" +
        "</thead>" +
        "<tbody>";

        $.each(data_result,function( i,item ) {
            if(item.shop_temp == 0) {
                txt_html += "<tr id='tr_" + item.shop_code + "' class='tr-hover'>"

                txt_html += "<td class='block'>"

                var tmp_onclick = "modalAlert('ยังไม่มีข้อมูล latitude, longitude');";
                if(item.latitude != "" && item.longitude != "" )
                    tmp_onclick = "gotoMap('" + item.shop_code + "');"

                txt_html += "<a class='short-menu' title='คลิกดูพิกัด " + item.shop_code + "' onclick=\"" + tmp_onclick + "\"><span class='glyphicon glyphicon-map-marker'></span></a>"
                txt_html += "<a class='short-menu' title='โน๊ตประจำวัน' onclick=\"modalNotation('" + item.shop_code + "','" + getFullDate_EN() + "',1)\"><span class='glyphicon icon-notification'></span></a>"
                txt_html += "<a class='short-menu' title='คลิกดูประวัติเปิดปิดย้อนหลัง 7 วัน " + item.shop_code + "' target='_blank' href='history.aspx?shop_code=" + item.shop_code + "#byshop'><span class='glyphicon icon-history iconbold'></span></a>"
                txt_html += "<a class='short-menu' title='คลิกดูรายละเอียดสำนักงาน " + item.shop_code + "' target='_blank' href='default.aspx?shop_code=" + item.shop_code + "'><span class='glyphicon icon-file-text2'></span></a>"
                txt_html += iconCamera(item);
                txt_html += "</td>"

                txt_html += "<td>" + item.ro + "</td>"
                txt_html += "<td>" + item.shop_code + "</td>"
                txt_html += "<td><span title='" + item.shop_name + "'>" + limitStr(item.shop_name,25) + "</span></td>"
                txt_html += "<td>" + item.shop_open + "</td>"
                txt_html += "<td>" + item.shop_close + "</td>"
                txt_html += "<td>" + item.open_time + "</td>"
                txt_html += "<td>" + item.close_time + "</td>"
                txt_html += checkRepIn(item,"open")
                txt_html += "<td>" + item.close_in_serv + "</td>"
                txt_html += "<td>" + item.first_up + "</td>"
                txt_html += checkDiffConnect(item)

                if(item.shop_dayoff == 0)
                    txt_html += "<td class='sts-" + item.shop_status + "'>" + arrSts[item.shop_status] + "</td>"
                else if(item.close_temp == 1)
                    txt_html += "<td class='sts-off'>" + strOffTemp + "</td>"
                else
                    txt_html += "<td class='sts-off'>" + strOff + "</td>"

                txt_html += "<td><span onclick=\"modalNotation('" + item.shop_code + "','" + getFullDate_EN() + "',1)\" title='" + item.notation_desc + "' class='td-notation'>" + limitStr(item.notation_desc,33,"....") + "</span></td>"
                txt_html += "</tr>";
            }
        });

        txt_html += "</tbody>" +
        "</table>" +
        "</div>";

        $('#display_table').replaceWith(txt_html);

        $('#table_report').dataTable({
            paging: false,
            "iDisplayLength": -1,
            "bLengthChange": false,
            "columnDefs": [
            { "orderable": false, "targets": 0 },
            { className: "dtb_left2", "targets": [ 4 ] },
            { className: "dtb_right1", "targets": [ 5 ] },
            { className: "dtb_left1", "targets": [ 6 ] },
            { className: "dtb_right1", "targets": [ 7 ] },
            { className: "dtb_left1", "targets": [ 8 ] },
            { className: "dtb_right1", "targets": [ 9 ] },
            { className: "dtb_left1", "targets": [ 10 ] },
            { className: "dtb_right2", "targets": [ 11 ] }
            ],
            "order": [[ 1, "asc" ]]
        });

        $('#table_report').fadeIn();
        $('[data-toggle="popover"]').popover({html:true}); 

        var gCode = checkGetShop();
        if(gCode != "") {
            gotoTable(gCode)
        }
    }
}

    function iconCamera(item) {
        var shop_code = item.shop_code.toUpperCase();
        var camera_icon = item.camera_icon.toLowerCase();

        var html_txt = "";

        if(checkNotEmpty(camera_icon)) {
            if(camera_icon == "n")  {
                html_txt += "<a class='short-menu' title='ดูกล้องวงจรปิด " + shop_code + "' target='_blank' href='itcamera.aspx?shop_code=" + shop_code + "'><span class='glyphicon icon-video'></span></a>"
            }
            else {
                html_txt += "<a class='short-menu' title='ดูกล้องวงจรปิด " + shop_code + "' target='_blank' href='itcamera.aspx?shop_code=" + shop_code + "'><span class='glyphicon icon-video-camera'></span></a>"
            }
        };

        return html_txt;
    }

function gotoMap(shop_code) {
    var url = location.pathname;
    url = url.replace("report_table", "report_map");
    url += "?shop_code=" + shop_code;
    url += strHashRO();

    window.location.href = url;
}

function gotoTable(id){
    $('.tr-hover').removeClass("tr-focus");

    var el = $('#tr_' + id);
    var elOffset = el.offset().top;
    var elHeight = el.height();
    var windowHeight = $(window).height();
    var offset;

    if (elHeight < windowHeight) {
        offset = elOffset - ((windowHeight / 2) - (elHeight / 2));
    }
    else {
        offset = elOffset;
    }

    el.addClass("tr-focus");

    $('html, body').animate({scrollTop:offset}, 700)
}

</script>

</asp:Content>

