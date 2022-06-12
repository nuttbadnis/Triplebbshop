<%@ Page Language="VB" AutoEventWireup="false" CodeFile="e10_meter.aspx.vb" Inherits="e10_meter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>METERRPT E10</title>

    <!-- <link rel="shortcut icon" href="App_Inc/faviempq.png" type="image/x-icon"> -->
    <!-- <link rel="icon" href="App_Inc/faviempq.png" type="image/x-icon"> -->

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-146935196-1"></script>
    <script type="text/javascript" src="App_Inc/_js/gtag_memberrpt.js?id=UA-146935196-1&vs=18"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
    <script src="App_Inc/jquery-1.11.3.min.js"></script>

    <link rel="stylesheet" type="text/css" href="App_Inc/jquery-ui-1.11.4/jquery-ui.css"/>
    <script type="text/javascript" src="App_Inc/jquery-ui-1.11.4/jquery-ui.js"></script>

    <script type="text/javascript" src="App_Inc/jquery-cookie/jquery.cookie.js"></script>

    <link rel="stylesheet" type="text/css" href="App_Inc/DataTables/datatables.css"/>
    <script type="text/javascript" src="App_Inc/DataTables/datatables.js"></script>
    <script type="text/javascript" src="App_Inc/DataTables/date-uk.js"></script>

    <link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
    <script src="App_Inc/bootstrap/js/bootstrap.js"></script>

    <script src="../App_Inc/bootstrap-multiselect/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" type="text/css" href="../App_Inc/bootstrap-multiselect/bootstrap-multiselect.css" />

    <script type="text/javascript" src="App_Inc/jquery.inview/jquery.inview.min.js"></script>
    <script type="text/javascript" src="App_Inc/filterDropDown/js/filterDropDown.js"></script>
    <script  type="text/javascript" src="../App_Inc/twbs-pagination/jquery.twbsPagination.js"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />
    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon-feather/font-icon.css" />

    <link type="text/css" rel="stylesheet" href="App_Inc/_css/main.css?vs=18" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/stockShop.css?vs=18" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/mapReport.css?vs=18" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartShop.css?vs=18" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartApp.css?vs=18" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/meterrpt.css?vs=188" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script src="App_Inc/_js/panu.js?vs=18"></script>

    <style type="text/css">
      body .container {
        width: 98%
      }
    
      .box-w55 {
        width: 57%;
      }

      .box-w80 {
        width: 80%;
      }

      .tr-loadbill:hover {
        cursor: pointer;
        background-color: #B9DCFF !important;
      }

      span.control-label {
         display:inline-block;
      }

      ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
        color: #ccc !important;
      }
      ::-moz-placeholder { /* Firefox 19+ */
        color: #ccc !important;
      }
      :-ms-input-placeholder { /* IE 10+ */
        color: #ccc !important;
      }
      :-moz-placeholder { /* Firefox 18- */
        color: #ccc !important;
      }
    </style>
</head>
<body>
    <form id="form1" runat="server"></form>
    <input runat="server" id="hide_uemail" type="hidden">

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="default.aspx">
                    <span class="glyphicon icon-feather-activity"></span> METERRPT
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="full-bar active"><a href="e10.aspx">E10* รายงานมิเตอร์ไฟฟ้า</a></li>

                    <li class="mini-bar active"><a href="e10.aspx" title="E10* รายงานมิเตอร์ไฟฟ้า">E10* รายงานมิเตอร์ไฟฟ้า</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown use_loged">
                        <a href="#" id="user_logon" runat="server" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="../memberrpt/app_a10.aspx">A10 กราฟเข้าใช้ App</a></li>
                            <li><a href="../memberrpt/app_g10.aspx">G10 กราฟลง App ใหม่</a></li>
                            <li><a href="../empquest/sms_m40.aspx">M40 สำรวจโครงการ</a></li>
                            <li><a href="../meterrpt/e10.aspx">E10 มิเตอร์ไฟฟ้า</a></li>
                            <li role="separator" class="divider"></li> 
                            <li><a href="../logoutOauth.aspx">ออกจากระบบ</a></li> 
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container container-table">
       <br>

        <div id='display_table'></div>

    </div>
</div>

<footer class="footer">
    <div class="container">
        <div class="pull-left">
            <p>Copyright &copy; 2020 by support_pos</p>
            <p>เพื่อการใช้งานเต็มประสิทธิภาพ กรุณาใช้เบราว์เซอร์ Chrome หรือ Firefox</p>
            <img id="imgsrc" onerror="linkinError(this);" src="http://posbcs.triplet.co.th/pos.ico" style="left: -100px; position: absolute;">
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

<div id="modal_edit_master" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">
                  <span class="glyphicon icon-feather-edit3"></span> แก้ไขข้อมูล 
                  <span id="title_edit_master"></span>
                </h4>
            </div>
            <div class="modal-body form-horizontal">
              <div class="form-group">
                <label class="col-sm-2 control-label">LOCATION</label>
                <div class="col-sm-10 form-inline">
                  <input type="text" class="form-control box-search input-nm" id="txt_seach_location" placeholder="2707-85">
                  <button type="button" class="btn btn-primary" id="btn_search_location"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> ตรวจสอบ LOCATION CODE</button>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                  <span class="txt-pea">**กรุณากรอก LOCATION CODE เพื่อค้นหา และกรอกข้อมูลอัตโนมัติ</span>
                </div>
              </div>
              <hr>
              <div class="form-group">
                <label class="col-sm-2 control-label">LOCATION CODE</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control box-w55 input-nm" id="txt_LOCATION_CODE" readonly>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">LOCATION NAME</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control box-w55 input-nm" id="txt_LOCATION_NAME" readonly>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">LOCATION PROVINCE</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control box-w55 input-nm" id="txt_LOCATION_PROVINCE" readonly>
                </div>
              </div>
              <div class="form-group" id="div_stat" style="display: none;">
                <label class="col-sm-2 control-label">LOCATION STATUS</label>
                <div class="col-sm-10">
                  <span class='txt-mea' id="span_stat">-</span>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <input type="hidden" id="hide_CONTRACT_ID">
              <button type="button" class="btn btn-success" id="btn_save_fake" disabled>บันทึกแก้ไข</button>
              <button type="button" class="btn btn-success" id="btn_save_master" style="display: none;">บันทึกแก้ไข</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
            </div>
        </div>
    </div>
</div>

<div id="modal_edit_bill" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

          <form action="ajax_upload.aspx" method="post" enctype="multipart/form-data" target="iframe_target" onSubmit="return AjaxUploadStart();">
            <iframe id="iframe_target" name="iframe_target" src="#" style="width:0;height:0;border:0px solid #fff;"></iframe>

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">
                  <span class="glyphicon icon-feather-edit3"></span> บันทึกหมายเหตุ 
                  <span id="title_edit_bill"></span>
                </h4>
            </div>
            <div class="modal-body form-horizontal">
              <div id="table_edit_bill"></div>
              <hr>
              <div class="form-group" id="div_alertcase" style="display: none;">
                <label class="col-sm-2 control-label">ALERT CASE</label>
                <div class="col-sm-10">
                  <label class='control-label txt-red' id="span_alertcas">-</label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">หมายเหตุ</label>
                <div class="col-sm-10">
                  <textarea type="text" id="txt_REMARK" class="form-control box-w55" rows="2" placeholder="หมายเหตุ.."></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">ไฟล์ประกอบ</label>
                <div class="col-sm-10">
                  <input type="file" class="form-control box-w55 check-doc-file" name="EBILL_FILE" id="EBILL_FILE">
                  <span id="span_EBILL_FILE">-</span>

                  <input type="hidden" name="file_prefix" id="file_prefix">
                  <input type="submit" name="submit" id="btn_upload" value="submit" style="display:none;">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">บันทึกล่าสุด</label>
                <div class="col-sm-10">
                  <span class='control-label' id="span_REMARK_UPDATE">-</span>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <input type="hidden" id="hide_EBILL_FILE">
              <input type="hidden" id="hide_ELECTRIC_BILL_ID">
              <input type="hidden" id="hide_ELECTRIC_MASTER_ID">
              <input type="hidden" id="hide_BILL_YYMM">
              <button type="button" class="btn btn-success" id="btn_save_bill">บันทึกหมายเหตุ</button>
              <button type="button" class="btn btn-primary" id="btn_cf_save_bill" style="display: none;">ยืนยัน</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
            </div>
          </form>
        </div>
    </div>
</div>

<div id="modal_location_node" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-nm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">แสดงข้อมูล Node [LOCATION: <span id="node_location"></span>]</h4>
            </div>
            <div class="modal-body" id="list_node"></div>
            <div class="modal-footer">
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
        </div>
    </div>
</div>

</body>
</html>

<!-- <script src="App_Inc/_js/linkin.js?vs=1888"></script> -->
<script type="text/javascript">

$(document).ready(function() { 
    loadMeter();
});

function autoModalBill() {
  if(_GET('ELECTRIC_BILL_ID') != null) {
    modalEditBill(_GET('ELECTRIC_BILL_ID'));
  }
}

function loadMeter(){
  var url = "ajax_data.aspx?qrs=SP_E10022";
  var txt_head = "";
  var txt_html = "";
  var txt_html2 = "";

  if(_GET('LOCATION') != null) {
    txt_head = "<h4>LOCATION CODE: " + _GET('LOCATION') +"</h4>";
    url += "&LOCATION=" + _GET('LOCATION');
  }
  else if(_GET('CONTRACT_ID') != null) {
    txt_head = "<h4>เลขที่สัญญา: " + _GET('CONTRACT_ID') +"</h4>";
    url += "&CONTRACT_ID=" + _GET('CONTRACT_ID');
  }
  else if(_GET('METER_ID') != null) {
    txt_head = "<h4>METER_ID: " + _GET('METER_ID') +"</h4>";
    url += "&METER_ID=" + _GET('METER_ID');
  }

  if(url != "") {
    console.log(url);

    $.ajax({
        url: url,
        dataType: "json",
        timeout: 180000,
        success: function( data ) { 
          if (data.length > 0) {
            autoModalBill();

          	txt_html += txt_head +
            "<table class='table table-striped table-bordered nowrap' cellspacing='0' width='100%'>" +
            "<thead>" +
            "  <tr>    " +
            "    <th rowspan='2'>#</th> " +
            "    <th rowspan='2'>เลขที่สัญญา</th> " +
            "    <th colspan='7' style='text-align:center;'>ข้อมูล LOCATION</th> " +
            "    <th colspan='11' style='text-align:center;'>ข้อมูลมิเตอร์</th> " +
            "    <th colspan='2' style='text-align:center;' class='txt-blue'>บันทึกแก้ไข</th> " +
            "  </tr>" +
            "  <tr>    " +
            "    <th>LOCATION CODE</th> " +
            "    <th>LOCATION NAME</th> " +
            "    <th>LOCATION PROVINCE</th> " +
            "    <th>LOCATION STATUS</th> " +
            "    <th>TERMINATE DATE</th> " +
            "    <th>RO</th> " +
            "    <th>CLUSTER</th> " +
            "    <th>PROVINCE</th> " +
            "    <th>ประเภทใบเสร็จ</th> " +
            "    <th>ประเภทมิเตอร์</th> " +
            "    <th>ชื่อ</th> " +
            "    <th>ที่อยู่</th> " +
            "    <th>DEVICE NO</th> " +
            "    <th>MRU<br>(สายจดหน่วย)</th> " +
            "    <th>PEACODE<br>(รหัสการไฟฟ้า)</th> " +
            "    <th>PEANAME<br>(ชื่อการไฟฟ้า)</th> " +
            "    <th>CA<br>(PEA ID)</th> " +
            "    <th>INSTALLATION<br>(MEA ID)</th> " +
            "    <th>CONTRACT_NO<br>(CPC ID)</th> " +
            "    <th class='txt-blue'>วันที่แก้ไข</th> " +
            "    <th class='txt-blue'>โดย</th> " +
            "  </tr>" +
            "</thead>" +
            "<tbody>";

            var NUM = 1;
            $.each(data,function( i,item ) {
              var CONTRACT_ID = '<a title="แก้ไข Location" href="#" role="button" onclick="modalEditMaster(\'' + item.CONTRACT_ID + '\')"><span class="glyphicon icon-feather-edit3"></span></a> ' + item.CONTRACT_ID + "";
              var LOCATION = '-';

              if(checkNotEmpty(item.LOCATION) == true) {
                LOCATION = '<a title="แสดงข้อมูล Node" href="#" role="button" onclick="modalLocationNode(\'' + item.LOCATION + '\')"><span class="glyphicon icon-feather-server2"></span></a> ' + item.LOCATION + "";
              }

              txt_html += "" +
              "<tr>" + 
              "<td>" + NUM + "</td>" + 
              "<td>" + CONTRACT_ID + "</td>" + 
              "<td>" + LOCATION + "</td>" + 
              "<td>" + itemNull(item.LOCATION_NAME) + "</td>" + 
              "<td>" + itemNull(item.LOCATION_PROVINCE) + "</td>" + 
              "<td><span class='txt-mea locode-stat'>กำลังโหลด..</span></td>" + 
              "<td><span class='txt-mea terminate-date'>-</span></td>" + 
              "<td>" + itemNull(item.RO) + "</td>" + 
              "<td>" + itemNull(item.CLUSTER) + "</td>" + 
              "<td>" + itemNull(item.PROVINCE) + "</td>" + 
              "<td>" + itemNull(item.ELECTRIC_GROUP_ACROYM) + "</td>" + 
              "<td>" + itemNull(item.SOURCE_GROUP_NAME) + "</td>" + 
              "<td>" + itemNull(item.NAME) + "</td>" + 
              "<td>" + itemNull(item.ADDRESS) + "</td>" + 
              "<td>" + itemNull(item.DEVICE) + "</td>" + 
              "<td>" + itemNull(item.MRU) + "</td>" + 
              "<td>" + itemNull(item.PEACODE) + "</td>" + 
              "<td>" + itemNull(item.PEANAME) + "</td>" + 
              "<td>" + itemNull(item.CA) + "</td>" + 
              "<td>" + itemNull(item.INSTALLATION) + "</td>" + 
              "<td>" + itemNull(item.CONTRACT_NO) + "</td>" + 
              "<td>" + itemNull(item.UPDATE_DTM) + "</td>" + 
              "<td>" + itemNull(item.UPDATE_BY) + "</td>" + 
              "</tr>";

              txt_html2 += "<div id='display_" + item.CONTRACT_ID + "'></div>";
              loadBill(item.ELECTRIC_ID, item.CONTRACT_ID, NUM);
              loadLocodeStatus(data[0].LOCATION);
              
              NUM += 1;
            });

            txt_html += "</tbody></table>";

            $('#display_table').html(txt_html);
          	$('#display_table').append(txt_html2);
            // $('.locode-stat').html('error');
          }
          else {
            modalAlert("ไม่พบข้อมูล " + txt_head);
            $('#modal_alert').on('hidden.bs.modal', function (e) {
              window.location = "default.aspx";
            })
          }
        },
        error: function(x, t, m) {
          console.log('ajax error \n x>' + x + ' t>' + t + ' m>' + m);
        }
      });
  }
}

function loadBill(METER_ID, CONTRACT_ID, NUM){
  var url = "ajax_data.aspx?qrs=SP_E10031&METER_ID=" + METER_ID;

  if(url != "") {
    console.log(url);

    $.ajax({
        url: url,
        dataType: "json",
        timeout: 180000,
        success: function( data ) { 
          var txt_html = "<hr><h4><b class='txt-mea'>ประวัติค่าไฟฟ้า</b> #" + NUM + " เลขที่สัญญา: " + CONTRACT_ID +"</h4>" +
          "<table class='table table-striped table-bordered nowrap' cellspacing='0' width='100%'>" +
          "<thead>" +
          "  <tr>    " +
          "    <th rowspan='2'>เดือนที่จด</th> " +
          "    <th rowspan='2'>INVOICE NO</th> " +
          "    <th rowspan='2'>MRU<br>(สายจดหน่วย)</th> " +
          "    <th rowspan='2'>P_DATE<br>(วันที่จดครั้งก่อน)</th> " +
          "    <th rowspan='2'>L_DATE<br>(วันที่จดครั้งหลัง)</th> " +
          "    <th rowspan='2'>P_READ<br>(เลขครั้งก่อน)</th> " +
          "    <th rowspan='2'>L_READ<br>(เลขครั้งหลัง)</th> " +
          "    <th rowspan='2'>UNIT<br>(จำนวนหน่วยที่ใช้)</th> " +
          "    <th rowspan='2'>AMOUNT<br>(ค่าไฟฟ้า)</th> " +
          "    <th rowspan='2'>VAT<br>(ภาษี)</th> " +
          "    <th colspan='5' style='text-align:center;' class='txt-blue'>บันทึกหมายเหตุ</th> " +
          "  </tr>" +
          "  <tr>    " +
          "    <th class='txt-red'>ALERT CASE</th> " +
          "    <th class='txt-blue'>หมายเหตุ</th> " +
          "    <th class='txt-blue'>ไฟล์ประกอบ</th> " +
          "    <th class='txt-blue'>วันที่บันทึก</th> " +
          "    <th class='txt-blue'>โดย</th> " +
          "  </tr>" +
          "</thead>" +
          "<tbody>";

          if (data.length > 0) {
            var num = 1;
            $.each(data,function( i,item ) {
              var INVOICE_NO = '<a title="แก้ไข" href="#" role="button" onclick="modalEditBill(\'' + item.ELECTRIC_BILL_ID + '\')"><span class="glyphicon icon-feather-edit3"></span></a> ' + item.INVOICE_NO + "";
              var EBILL_FILE = "-";

              if (checkNotEmpty(item.EBILL_FILE)) {
                EBILL_FILE = "<a href='" + item.EBILL_FILE + "' target='_blank'>เปิดไฟล์..</a>";
              }

              txt_html += "" +
              "<tr>" + 
              "<td>" + itemNull(item.BILLL_YYMM) + "</td>" + 
              "<td>" + INVOICE_NO + "</td>" + 
              "<td>" + itemNull(item.MRU) + "</td>" + 
              "<td>" + itemNull(item.P_DATE) + "</td>" + 
              "<td>" + itemNull(item.L_DATE) + "</td>" + 
              "<td>" + itemNull(item.P_READ) + "</td>" + 
              "<td>" + itemNull(item.L_READ) + "</td>" + 
              "<td align='right'>" + parseInt(item.UNIT).toLocaleString() + "</td>" + 
              "<td align='right'>" + parseFloat(item.AMOUNT_REAL).toFixed(2).toLocaleString() + "</td>" + 
              "<td align='right'>" + parseFloat(item.VAT_REAL).toFixed(2).toLocaleString() + "</td>" + 
              "<td class='txt-red'>" + itemNull(item.ALERT_CASE_TITLE) + "</td>" + 
              "<td>" + itemNull(item.REMARK) + "</td>" + 
              "<td>" + EBILL_FILE + "</td>" + 
              "<td>" + itemNull(item.UPDATE_DTM) + "</td>" + 
              "<td>" + itemNull(item.UPDATE_BY) + "</td>" + 
              "</tr>";
            });
          }

          txt_html += "</tbody></table>";

          $('#display_' + CONTRACT_ID).html(txt_html);

        },
        error: function(x, t, m) {
          console.log('ajax error \n x>' + x + ' t>' + t + ' m>' + m);
        }
      });
  }
}

//------------------------------------------------------ edit master

$('#btn_search_location').click(function() {
  var LOCATION_CODE = $('#txt_seach_location').val();

  if(checkNotEmpty(LOCATION_CODE)) {
    searchLocation(LOCATION_CODE);
  }
  else {
    modalAlert('กรุณากรอก LOCATION CODE');
  }
});

$('body').click(function() {
  $('.box-recommend').removeClass("box-recommend");
});

function searchLocation(LOCATION_CODE) {
  var url = "https://webnoc.triplet.co.th/web_service/get_location_detail.php?location_code=" + LOCATION_CODE;
  console.log(url);
  
  $.ajax({
    // url: "../file_get_content.aspx",
    // url: "http://posbcs.triplet.co.th/POSAPI/call_out.aspx",
    url: "../../POSAPI/call_out.aspx",
    cache: false,
    data: {link: url},
    dataType: "json",
    timeout: 60000,
    success: function( data ) { 
      // console.log(data);
      if (data.length > 0) {
        $('#txt_LOCATION_CODE').val(data[0].location_code);
        $('#txt_LOCATION_NAME').val(data[0].name_thai);
        $('#txt_LOCATION_PROVINCE').val(data[0].province);

        $('#txt_LOCATION_CODE').addClass('box-recommend');
        $('#txt_LOCATION_NAME').addClass('box-recommend');
        $('#txt_LOCATION_PROVINCE').addClass('box-recommend');

        $('#div_stat').show();
        $('#span_stat').html(data[0].status);

        $('#btn_save_fake').hide();
        $('#btn_save_master').show();
      }
      else {
        modalAlert('ไม่พบ LOCATION CODE: "' + LOCATION_CODE + '"');
        clearEditMaster();
      }
    },
    error: function(x, t, m) {
      console.log('x>' + x + ' t>' + t + ' m>' + m);

      // ajaxError();
      modalAlert('get_location_detail: ไม่สามารถทำงานได้');
    }
  });
}

function clearEditMaster() {
  $('#title_edit_master').html("");
  $('#btn_save_fake').show();
  $('#btn_save_master').hide();

  $('#hide_CONTRACT_ID').val("");
  $('#txt_LOCATION_CODE').val("");
  $('#txt_LOCATION_NAME').val("");
  $('#txt_LOCATION_PROVINCE').val("");

  $('#div_stat').hide();
  $('#span_stat').html("-");
}

function modalEditMaster(CONTRACT_ID) {
  clearEditMaster();

  var url = "ajax_data.aspx?qrs=SP_E10022&CONTRACT_ID=" + CONTRACT_ID;
  console.log(url);

  $.ajax({
    url: url,
    dataType: "json",
    timeout: 180000,
    success: function( data ) { 
      if (data.length > 0) {
        $('#txt_LOCATION_CODE').val(itemNullByText(data[0].LOCATION, ""));
        $('#txt_LOCATION_NAME').val(itemNullByText(data[0].LOCATION_NAME, ""));
        $('#txt_LOCATION_PROVINCE').val(itemNullByText(data[0].LOCATION_PROVINCE, ""));

        $('#hide_CONTRACT_ID').val(CONTRACT_ID);
        $('#title_edit_master').html("เลขที่สัญญา: " + CONTRACT_ID);

        $('#modal_edit_master').modal("show");
      }
    },
    error: function(x, t, m) {
      console.log('ajax error \n x>' + x + ' t>' + t + ' m>' + m);
    }
  });
}

$('#btn_save_master').click(function() {
  if ($('#txt_LOCATION_CODE').val().length == 0) {
    modalAlert("กรุณากรอกค้นหา LOCATION เพื่อกรอกข้อมูลอัตโนมัติ");
    $('#modal_alert').on('hidden.bs.modal', function (e) {
      $('#txt_seach_location').focus();
    })
  }
  else {
    $('#modal_edit_master').modal("hide");
    submitUpdateMaster();
  }
});


function submitUpdateMaster() {
  var url = "ajax_data.aspx?qrs=SP_UPDATE_ELECTRIC_MASTER";

  $.ajax({
    url: url,
    type: "post",
    timeout: 60000,
    cache: false,
    data: { 
      LOCATION_CODE: $('#txt_LOCATION_CODE').val(),
      LOCATION_NAME: $('#txt_LOCATION_NAME').val(),
      LOCATION_PROVINCE: $('#txt_LOCATION_PROVINCE').val(),
      CONTRACT_ID: $('#hide_CONTRACT_ID').val(),
      uemail: $('#hide_uemail').val(),
    },
    success: function( res ) {
      if(res > 0){
        modalAlert("ดำเนินการเรียบร้อย");
        $('#modal_alert').on('hidden.bs.modal', function (e) {
          window.location.replace("e10_meter.aspx?CONTRACT_ID=" + $('#hide_CONTRACT_ID').val());
        })
      }
      else{
        modalAlert('ไม่สำเร็จ');
      }
    },
    error: function(x, t, m) {
      modalAlert('ajax fail!');
    }
  });
}

//------------------------------------------------------ edit bill

function clearEditBill() {
  $('#title_edit_bill').html("");
  $('#btn_save_bill').show();
  $('#btn_cf_save_bill').hide();

  $('#hide_EBILL_FILE').val("");
  $('#hide_ELECTRIC_BILL_ID').val("");
  $('#hide_ELECTRIC_MASTER_ID').val("");
  $('#hide_BILL_YYMM').val("");
  $('#txt_REMARK').val("");
  $('#EBILL_FILE').val("");
  $('#file_prefix').val("");

  $('#div_alertcase').hide();
  $('#span_alertcas').html("-");
  $('#span_EBILL_FILE').html("-");
  $('#span_REMARK_UPDATE').html("-");

  $('#table_edit_bill').html("");
}

function modalEditBill(ELECTRIC_BILL_ID) {
  clearEditBill();

  var url = "ajax_data.aspx?qrs=SP_E10031&ELECTRIC_BILL_ID=" + ELECTRIC_BILL_ID;
  console.log(url);

  $.ajax({
    url: url,
    dataType: "json",
    timeout: 180000,
    success: function( data ) { 
      if (data.length > 0) {
        var EBILL_FILE = "-";

        $('#hide_ELECTRIC_BILL_ID').val(ELECTRIC_BILL_ID);
        $('#hide_ELECTRIC_MASTER_ID').val(data[0].ELECTRIC_MASTER_ID);
        $('#hide_BILL_YYMM').val(data[0].BILLL_YYMM);

        $('#txt_REMARK').val(itemNullByText(data[0].REMARK, ""));

        if (checkNotEmpty(data[0].ALERT_CASE_TITLE)) {
          $('#span_alertcas').html(data[0].ALERT_CASE_TITLE);
          $('#div_alertcase').show();
        }

        if (checkNotEmpty(data[0].UPDATE_BY)) {
          $('#span_REMARK_UPDATE').html(data[0].UPDATE_DTM + ' <b>โดย</b> ' + data[0].UPDATE_BY);
        }

        if (checkNotEmpty(data[0].EBILL_FILE)) {
          EBILL_FILE = "<a href='" + data[0].EBILL_FILE + "' target='_blank'>เปิดไฟล์..</a>";
          $('#span_EBILL_FILE').html(EBILL_FILE);
        }

        $('#title_edit_bill').html("INVOICE NO: " + data[0].INVOICE_NO);
        $('#modal_edit_bill').modal("show");

        var txt_html = "<table class='table table-striped table-bordered' cellspacing='0' width='100%' style='font-size:12px;'>" +
          "<thead>" +
          "  <tr>    " +
          "    <th rowspan='2'>เดือนที่จด</th> " +
          "    <th rowspan='2'>P_DATE<br>(วันที่จดครั้งก่อน)</th> " +
          "    <th rowspan='2'>L_DATE<br>(วันที่จดครั้งหลัง)</th> " +
          "    <th rowspan='2'>P_READ<br>(เลขครั้งก่อน)</th> " +
          "    <th rowspan='2'>L_READ<br>(เลขครั้งหลัง)</th> " +
          "    <th rowspan='2'>UNIT<br>(จำนวนหน่วยที่ใช้)</th> " +
          "    <th rowspan='2'>AMOUNT<br>(ค่าไฟฟ้า)</th> " +
          "    <th rowspan='2'>VAT<br>(ภาษี)</th> " +
          // "    <th colspan='4' style='text-align:center;' class='txt-blue'>บันทึกหมายเหตุ</th> " +
          "  </tr>" +
          "  <tr>    " +
          // "    <th class='txt-blue'>หมายเหตุ</th> " +
          // "    <th class='txt-blue'>ไฟล์ประกอบ</th> " +
          // "    <th class='txt-blue'>วันที่บันทึก</th> " +
          // "    <th class='txt-blue'>โดย</th> " +
          "  </tr>" +
          "</thead>" +
          "<tbody>";

          txt_html += "" +
          "<tr>" + 
          "<td>" + itemNull(data[0].BILLL_YYMM) + "</td>" + 
          "<td>" + itemNull(data[0].P_DATE) + "</td>" + 
          "<td>" + itemNull(data[0].L_DATE) + "</td>" + 
          "<td>" + itemNull(data[0].P_READ) + "</td>" + 
          "<td>" + itemNull(data[0].L_READ) + "</td>" + 
          "<td align='right'>" + parseInt(data[0].UNIT).toLocaleString() + "</td>" + 
          "<td align='right'>" + parseFloat(data[0].AMOUNT_REAL).toFixed(2).toLocaleString() + "</td>" + 
          "<td align='right'>" + parseFloat(data[0].VAT).toFixed(2).toLocaleString() + "</td>" + 
          // "<td>" + itemNull(data[0].REMARK) + "</td>" + 
          // "<td>" + EBILL_FILE + "</td>" + 
          // "<td>" + itemNull(data[0].UPDATE_DTM) + "</td>" + 
          // "<td>" + itemNull(data[0].UPDATE_BY) + "</td>" + 
          "</tr>";

          txt_html += "</tbody></table>";

          $('#table_edit_bill').html(txt_html);
      }
    },
    error: function(x, t, m) {
      console.log('ajax error \n x>' + x + ' t>' + t + ' m>' + m);
    }
  });
}

$('#btn_save_bill').click(function() {
  $('#btn_save_bill').hide();
  $('#btn_cf_save_bill').show();
});

$('#btn_cf_save_bill').click(function() {
  if ($('#txt_REMARK').val().length == 0) {
    modalAlert("กรุณากรอกหมายเหตุ");
    $('#modal_alert').on('hidden.bs.modal', function (e) {
      $('#txt_REMARK').focus();
    })
  }
  else {
    $('#modal_edit_bill').modal("hide");
    AjaxUploadSubmit();
    // submitRemarkBill();
  }
});

function submitRemarkBill() {
  var url = "ajax_data.aspx?qrs=SP_UPDATE_E10010_REMARK";

  $.ajax({
    url: url,
    type: "post",
    timeout: 60000,
    cache: false,
    data: { 
      REMARK: $('#txt_REMARK').val(),
      EBILL_FILE: $('#hide_EBILL_FILE').val(),
      ELECTRIC_BILL_ID: $('#hide_ELECTRIC_BILL_ID').val(),
      ELECTRIC_MASTER_ID: $('#hide_ELECTRIC_MASTER_ID').val(),
      BILL_YYMM: $('#hide_BILL_YYMM').val(),
      uemail: $('#hide_uemail').val(),
    },
    success: function( res ) {
      if(res > 0){
        location.reload();
      }
      else{
        modalAlert('ไม่สำเร็จ');
      }
    },
    error: function(x, t, m) {
      modalAlert('ajax fail!');
    }
  });
}

//------------------------------------------------------ ajax upload

function AjaxUploadSubmit() {
  var file_prefix = "EBILL" + $('#hide_ELECTRIC_BILL_ID').val();

  $('#file_prefix').val(file_prefix);
  $('#page_loading').fadeIn();
  $('#btn_upload').click();
}

function AjaxUploadStart() {
  $('#page_loading').fadeIn();
  console.log('upload start..');
}

function AjaxUploadResult(filename, error){
  console.log('upload end..');
  console.log("AjaxUploadResult = " + filename + " error = " + error);

  if(error == 0){
    $('#hide_EBILL_FILE').val(filename);
    submitRemarkBill();
  }
  else {
    modalAlert("ไม่สำเร็จ (upload error) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
  }
}

$('.check-doc-file').change(function() {
  var ext = this.value.split('.').pop().toLowerCase();

  if (ext != "pdf" && ext != "png" && ext != "jpg" && ext != "jpeg" && ext != "jpg" && ext != "zip") {
    modalAlert("กรุณาตรวจสอบประเภทไฟล์ <br>อนุญาติไฟล์ pdf, jpg, png, zip เท่านั้น");
    this.value = '';
  } 
  else {
    var maxsize = 1024*10;
    var filesize = this.files[0].size/1024;

    if(filesize > maxsize){
      modalAlert("ขนาดไฟล์สูงสุด ไม่เกิน 10MB");
      this.value = '';
    }
  }
});

//------------------------------------------------------ location status

function loadLocodeStatus(LOCATION_CODE) {
  // var url = "http://webnoc.triplet.co.th/web_service/get_location_detail.php?location_code=" + LOCATION_CODE;
  var url = "https://webnoc.triplet.co.th/web_service/get_location_detail.php?location_code=" + LOCATION_CODE;
  console.log(url);
  
  $.ajax({
    // url: "../file_get_content.aspx",
    // url: "http://posbcs.triplet.co.th/POSAPI/call_out.aspx",
    url: "../../POSAPI/call_out.aspx",
    cache: false,
    data: {link: url},
    dataType: "json",
    timeout: 60000,
    success: function( data ) { 
      console.log(data);

      if (data.length > 0) {
        var terminate_date = "-";

        if(data[0].terminate_date == "0000-00-00") {
          terminate_date = "-";
        }
        else {
          terminate_date = data[0].terminate_date;
        }

        $('.terminate-date').html(terminate_date);
        $('.locode-stat').html(data[0].status);
      }
      else {
        $('.locode-stat').html('-');
      }
    },
    error: function(x, t, m) {
      $('.locode-stat').html('error');

      console.log('x>' + x + ' t>' + t + ' m>' + m);
      // ajaxError();
      modalAlert('get_location_detail: ไม่สามารถทำงานได้');
    }
  });
}

function modalLocationNode(LOCATION_CODE) {
  var url = "https://webnoc.triplet.co.th/web_service/get_node_detail.php?location_code=" + LOCATION_CODE;
  console.log(url);
  
  $.ajax({
    url: "../../POSAPI/call_out.aspx",
    cache: false,
    data: {link: url},
    dataType: "json",
    timeout: 60000,
    success: function( data ) { 
      console.log(data);

      var txt_html = "";

      if (data.length > 0) {
        $.each(data,function( i,item ) {
          txt_html += "<div class='space-br'></div>" +
          "<div class='row'>" +
          "<div class='col-xs-12'>" +
          "<div class='input-group' style='width: 100%;'>" +
          "<textarea class='form-control' rows='18' readonly>" +
          "node_name: " + item.node_name +
          "\nip_address: " + item.ip_address +
          "\nstatus: " + item.status +
          "\ntype: " + item.type +
          "\nnode_main: " + item.node_main +
          "\nmodel: " + item.model +
          "\noperate_date: " + item.operate_date +
          "\nterminate_date: " + item.terminate_date +
          "\nlocation_code: " + item.location_code +
          "\nlatitude: " + item.latitude +
          "\nlongitude: " + item.longitude +
          "\nsite_name: " + item.site_name +
          "\narea: " + item.area +
          "\narea_code: " + item.area_code +
          "\ncluster: " + item.cluster +
          "\nRO: " + item.RO +
          "\nowner_province: " + item.owner_province +
          "</textarea>" +
          "</div>" +
          "</div>" +
          "</div>" +
          "</div>";
        });

        txt_html += "</tbody></table>";

      }
      else {
        txt_html = "ไม่มีข้อมูล Node";
      }

      $('#node_location').html(LOCATION_CODE);
      $('#list_node').html(txt_html);
      $('#modal_location_node').modal("show");
    },
    error: function(x, t, m) {
      console.log('x>' + x + ' t>' + t + ' m>' + m);
      // ajaxError();
      modalAlert('get_location_detail: ไม่สามารถทำงานได้');
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