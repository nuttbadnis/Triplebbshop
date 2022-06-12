<%@ Page Language="VB" AutoEventWireup="false" CodeFile="e10.aspx.vb" Inherits="e10" %>

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
        body {
            background-color: #fff;
        }

        .head-title {
            text-align: left;
            font-weight: bold;
            font-size: 24px;
        }
/*
        [data-toggle="buttons"] > .btn input[type="radio"], [data-toggle="buttons"] > .btn-group > .btn input[type="radio"], [data-toggle="buttons"] > .btn input[type="checkbox"], [data-toggle="buttons"] > .btn-group > .btn input[type="checkbox"] {
            position: relative;
        }*/

        .btn-radtype {
            min-width: 175px;
        }

        .multiselect-container {
          min-width: 145px;
      }
      .multiselect-container>li>a>label {
          padding: 5px 20px 5px 30px;
      }
      .multiselect-container > .active > a, .multiselect-container > .active > a:hover, .multiselect-container > .active > a:focus {
          color: #555;
          background-color: #ededed !important;
      }
      .onthetable_filterSelect {
          margin-right: 3px;
      }

      .txt-input-per {
        /*width: 86px;*/
        text-align: center;
        /*text-align: right;*/
      }

      /*#btn_search {
        height: 34px;
        width: 40px;
    }*/

    .chk-style {
        float: left;
        margin-right: 2px
    }

    table.nowrap th, table.nowrap td {
    	white-space: nowrap;
    }

    .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
    	z-index: 3;
    	color: #ffffff;
    	background-color: #0c86e6;
    	border-color: #0c86e6;
    	cursor: default;
    }

    .chk-group .input-group-addon:last-child {
      border: 1px solid #ccc;
      height: 34px;
    }

    hr.end-row {
        margin-top: 5px;
        margin-bottom: 10px;
    }

    body .container {
      width: 98%
    }


    .asc-sort, .desc-sort{
      cursor: pointer;
      color: #9f0fd6;
    }

      .asc-sort:hover, .desc-sort:hover {
          color: #f24923;
          text-decoration: none;
      }

      .active-sort {
          color: #f26d23;
      }

      .desc-sort {
        display: none;
      }

      .container-table label {
        font-size:13px; 
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

                    <li class="mini-bar active"><a href="e10.aspx" title="E10* รายงานมิเตอร์ไฟฟ้า">E10*</a></li>
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
        <label id="last_import" class="txt-bold txt-blue" style="float: right;"></label>
        <br>
        <br>
        <!-- <div class="row"> -->
            <!-- <div class="col-sm-12"> -->
            <!-- <div class="col-sm-9 col-sm-offset-1"> -->
                <!-- <div class="panel panel-default">
                    <div class="panel-heading"><b>FILTER</b></div>
                    <div class="panel-body"> -->
                        <div class="row">
                            <div class="col-sm-2"> 
                                <div class="form-group">
                                    <label class="txt-blue">เดือนที่จด</label>
                                    <select id="SEL_YYMM" class="form-control">
                                        <option value="" selected>เลือก เดือนที่จด</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-2"> 
                                <div class="form-group">
                                    <label class="txt-blue">RO</label>
                                    <select id="SEL_RO" class="form-control">
                                        <option value="" selected>ALL RO</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-2"> 
                                <div class="form-group">
                                    <label class="txt-blue">CLUSTER</label>
                                    <select id="SEL_CLUSTER" class="form-control">
                                        <option value="" selected>ALL CLUSTER</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-2"> 
                                <div class="form-group">
                                    <label class="txt-blue">PROVINCE</label>
                                    <select id="SEL_PROVINCE" class="form-control">
                                        <option value="" selected>ALL PROVINCE</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4"> 
                                <div class="form-group">
                                    <label class="txt-blue">ค้นหา</label>
                                    <input type="text" class="form-control enter-key" id="txt_search" placeholder="ค้นหาโดย LOCATION CODE หรือ เลขที่สัญญา">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-2"> 
                                <div class="form-group">
                                    <label class="txt-blue">UNIT LAST-AVG3</label>
                                    <div class="input-group">
                                        <div class="input-group-addon txt-bold">></div>
                                        <input type="number" class="form-control txt-input-per enter-key" id="txt_lastavg3" placeholder="20" min="-100" max="100" value="">
                                        <div class="input-group-addon txt-bold">%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-2"> 
                                <div class="form-group">
                                    <label class="txt-blue">หมายเหตุ</label>
                                    <select id="SEL_REMARK" class="form-control">
                                        <option value="">ทั้งหมด</option>
                                        <option value="1">ที่มีหมายเหตุแล้ว</option>
                                        <option value="2" selected>ยังไม่มีหมายเหตุ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-2"> 
                                <div class="form-group">
                                    <label style="color: #fff;">-</label>
                                  <div class="input-group chk-group chk-style">
                                    <span class="input-group-addon">
                                      <input type="checkbox" id="CHK_ALERT_CASE" checked>
                                      </span>
                                      <span class="input-group-addon input-nm txt-bold txt-red">ALERT CASE</span>
                                  </div> 
                                </div>
                            </div>
                            <div class="col-xs-2"> 
                                <div class="form-group" id="div_ALERT_CASE">
                                    <label style="color: #fff;">-</label>
                                    <select id="SEL_ALERT_CASE" class="form-control txt-bold txt-red">
                                        <option value="" selected>ALL ALERT CASE</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-4"> 
                                <div class="form-group" style="float: right;">
                                    <button class="btn btn-default" type="button" id="btn_download" style="margin-top: 22px;">
                                        Download Excel
                                    </button>

                                    <button class="btn btn-primary" type="button" id="btn_search" style="margin-top: 22px;">
                                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                        แสดงข้อมูล
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- <div class="row">
                            <div class="col-xs-12 form-inline" style="text-align: right;"> 
                              <div class="input-group chk-group chk-style">
                                    <span class="input-group-addon">
                                      <input type="checkbox" id="CHK_ALERT_CASE" checked>
                                  </span>
                                  <span class="input-group-addon input-nm txt-bold txt-red">ALERT CASE</span>
                              </div> 
                              <div class="input-group chk-group chk-style">
                                    <span class="input-group-addon">
                                      <input type="checkbox" id="CHK_REMARK" checked>
                                  </span>
                                  <span class="input-group-addon input-nm txt-bold">*กรองที่มีหมายเหตุออก</span>
                              </div>
                                <button class="btn btn-default" type="button" id="btn_download">
                                    Download Excel
                                </button>

                                <button class="btn btn-primary" type="button" id="btn_search">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    แสดงข้อมูล
                                </button>
                            </div>
                        </div> -->
                        <!-- <div class="row" id="div_ALERT_CASE">
                            <div class="col-xs-12 form-inline" style="text-align: right; margin-top: 10px;"> 
                              <select id="SEL_ALERT_CASE" class="form-control txt-bold txt-red" style="float: left; margin-right: 5px; max-width: 220px;">
                                <option value="" selected>ALL ALERT CASE</option>
                            </select>
                          </div>
                        </div> -->
                    <!-- </div>
                </div>
            </div> -->
        <!-- </div> -->

        <hr class="end-row">
        <div class="row">
            <div class="col-sm-12">
            <h5 class="txt-blue" style="line-height: 20px;">
                <!-- <b>คำอธิบาย</b> -->
                <!-- <br> -->
                <!-- <b>*AVG3-AVG6</b> หมายถึง ค่าไฟเฉลี่ย 3 เดือนล่าสุด มีการใช้งานสูงขึ้นกว่าค่าไฟเฉลี่ย 6 เดือน ทำให้เห็นว่า แนวโน้มมีการใช้ไฟสูงขึ้นมากไหม -->
                <!-- <br> -->
                <b>*UNIT  LAST-AVG3</b> หมายถึง จำนวนการใช้ไฟเดือนล่าสุด สูงกว่า จำนวนหน่วยใช้ไฟฟ้าเฉลี่ย 3 เดือนล่าสุด หากเป็นเปอร์เซ็นต์ที่มาก ควรพิจารณา ตรวจสอบว่า มีการใช้ไฟมากผิดปกติ จากสาเหตุใด
            </h5>
            </div>
        </div>

        <hr class="end-row">
        <p><span class="count_data"></span></p>

        <div id='display_table'>
        	<table id='onthetable' class='table table-striped table-bordered nowrap' cellspacing='0' width='100%'>
        		<thead>
        			<tr>    
                <th rowspan='2'>#</th> 
                <th rowspan='2'>
                    <a class="asc-sort" onclick="columnSort('RO','desc')" id="RO_asc">RO <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('RO','asc')" id="RO_desc">RO <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th rowspan='2'>
                    <a class="asc-sort" onclick="columnSort('CLUSTER','desc')" id="CLUSTER_asc">CLUSTER <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('CLUSTER','asc')" id="CLUSTER_desc">CLUSTER <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th rowspan='2'>
                    <a class="asc-sort" onclick="columnSort('PROVINCE','desc')" id="PROVINCE_asc">PROVINCE <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('PROVINCE','asc')" id="PROVINCE_desc">PROVINCE <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th rowspan='2'>
                    <a class="asc-sort" onclick="columnSort('LOCATION','desc')" id="LOCATION_asc">LOCATION <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('LOCATION','asc')" id="LOCATION_desc">LOCATION <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th rowspan='2'>
                    <a class="asc-sort" onclick="columnSort('CONTRACT_ID','desc')" id="CONTRACT_ID_asc">เลขที่สัญญา <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('CONTRACT_ID','asc')" id="CONTRACT_ID_desc">เลขที่สัญญา <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <!-- <th rowspan='2'>
                    <a class="asc-sort" onclick="columnSort('CA','desc')" id="CA_asc">PEA ID (CA) <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('CA','asc')" id="CA_desc">PEA ID (CA) <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th>  -->
                <th rowspan='2'>
                    <a class="asc-sort" onclick="columnSort('DEVICE','desc')" id="DEVICE_asc">DEVICE NO <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('DEVICE','asc')" id="DEVICE_desc">DEVICE NO <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th rowspan='2'>
                    <a class="asc-sort" onclick="columnSort('ELECTRIC_GROUP_ACROYM','desc')" id="ELECTRIC_GROUP_ACROYM_asc">ประเภทใบเสร็จ <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('ELECTRIC_GROUP_ACROYM','asc')" id="ELECTRIC_GROUP_ACROYM_desc">ประเภทใบเสร็จ <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th colspan='6'>UNIT</th> 
                <th colspan='3' style='text-align:center;' class='txt-blue'>ผลการตรวจสอบ</th>
                <th colspan='6'>AMOUNT</th> 
              </tr>
              <tr>
                <th>
                    <a class="asc-sort" onclick="columnSort('MAX_UNIT','desc')" id="MAX_UNIT_asc">MAX <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('MAX_UNIT','asc')" id="MAX_UNIT_desc">MAX <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('MIN_UNIT','desc')" id="MIN_UNIT_asc">MIN <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('MIN_UNIT','asc')" id="MIN_UNIT_desc">MIN <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('AVG3_UNIT','desc')" id="AVG3_UNIT_asc">AVG3 <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('AVG3_UNIT','asc')" id="AVG3_UNIT_desc">AVG3 <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('AVG6_UNIT','desc')" id="AVG6_UNIT_asc">AVG6 <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('AVG6_UNIT','asc')" id="AVG6_UNIT_desc">AVG6 <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('LAST_UNIT','desc')" id="LAST_UNIT_asc">LAST <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('LAST_UNIT','asc')" id="LAST_UNIT_desc">LAST <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('DIFF_LASTAVG3_UNIT','desc')" id="DIFF_LASTAVG3_UNIT_asc">LAST-AVG3 % <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('DIFF_LASTAVG3_UNIT','asc')" id="DIFF_LASTAVG3_UNIT_desc">LAST-AVG3 % <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 

                <th>
                    <a class="asc-sort" onclick="columnSort('ALERT_CASE_ID','desc')" id="ALERT_CASE_ID_asc">ALERT CASE <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('ALERT_CASE_ID','asc')" id="ALERT_CASE_ID_desc">ALERT CASE <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('BILL_YYMM','desc')" id="BILL_YYMM_asc">เดือนที่จด <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('BILL_YYMM','asc')" id="BILL_YYMM_desc">เดือนที่จด <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>หมายเหตุ</th> 

                <th>
                    <a class="asc-sort" onclick="columnSort('MAX_AMOUNT','desc')" id="MAX_AMOUNT_asc">MAX <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('MAX_AMOUNT','asc')" id="MAX_AMOUNT_desc">MAX <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('MIN_AMOUNT','desc')" id="MIN_AMOUNT_asc">MIN <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('MIN_AMOUNT','asc')" id="MIN_AMOUNT_desc">MIN <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('AVG3_AMOUNT','desc')" id="AVG3_AMOUNT_asc">AVG3 <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('AVG3_AMOUNT','asc')" id="AVG3_AMOUNT_desc">AVG3 <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('AVG6_AMOUNT','desc')" id="AVG6_AMOUNT_asc">AVG6 <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('AVG6_AMOUNT','asc')" id="AVG6_AMOUNT_desc">AVG6 <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('LAST_AMOUNT','desc')" id="LAST_AMOUNT_asc">LAST <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('LAST_AMOUNT','asc')" id="LAST_AMOUNT_desc">LAST <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
                <th>
                    <a class="asc-sort" onclick="columnSort('DIFF_LASTAVG3_AMOUNT','desc')" id="DIFF_LASTAVG3_AMOUNT_asc">LAST-AVG3 % <span class="glyphicon glyphicon-triangle-bottom"></span></a>
                    <a class="desc-sort" onclick="columnSort('DIFF_LASTAVG3_AMOUNT','asc')" id="DIFF_LASTAVG3_AMOUNT_desc">LAST-AVG3 % <span class="glyphicon glyphicon-triangle-top"></span></a>
                </th> 
              </tr>
            </thead>
            <tbody></tbody>
        	</table>
        </div>
        <div id="under_table" class="inview"></div>

        <p class="count_data"></p>
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

<div id="modal_cf_all" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-nm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">แจ้งเตือน</h4>
            </div>
            <div class="modal-body">
                <p>
                	หากแสดงข้อมูลทั้งหมดในทีเดียว <b class="txt-red">อาจใช้เวลาในการโหลดมาก</b>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="btn_search_cf">แสดงบางส่วน</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="loadE10FilterALL()">ยืนยันแสดงทั้งหมด</button>
                <!-- <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button> -->
            </div>
        </div>
    </div>
</div>

<div id="modal_cf_download" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-nm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">แจ้งเตือน</h4>
            </div>
            <div class="modal-body">
                <p>
                	หากผลลัพธ์ข้อมูลมีจำนวนมาก <b class="txt-red">อาจใช้เวลาในการโหลดมาก</b>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="loadExcel()">ยืนยัน Download</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
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

<script src="App_Inc/_js/linkin.js?vs=1888"></script>
<script type="text/javascript">
var page_size = 999;
var page_num = 1;
var page_row_start = 1;
var page_row_end = 0;

var count_max = 0;
var in_load = 0;

var main_url = "";
var temp_column = "";
var temp_sort = "";
var report_id = "e10";

$(document).ready(function() { 
    // $('#page_loading').fadeOut();
    // startLoad();
    loadYYMM();

    loadRO();
    loadCLUSTER();
    loadPROV();
});

$(window).scroll(function() {
    if($(window).scrollTop()>=($(document).height()-window.innerHeight-10)){
      page_row_end = page_row_start + page_size;
      if (in_load == 0 && count_max >= page_row_start) {
        loadE10Filter();
      }
    }
});

function columnSort(column, sort) {
    console.log(column, sort);

    temp_column = column;
    temp_sort = sort;

    // reset sort
    $('.desc-sort').removeClass('active-sort');
    $('.asc-sort').removeClass('active-sort');

    $('.desc-sort').hide();
    $('.asc-sort').show();
    // reset sort

    if(sort == 'asc') {
        $('#' + column + '_desc').hide();
        $('#' + column + '_asc').show();
        $('#' + column + '_asc').addClass('active-sort');
    }
    else {
        $('#' + column + '_asc').hide();
        $('#' + column + '_desc').show();
        $('#' + column + '_desc').addClass('active-sort');
    }

    startLoad();
}

function startLoad() {
    // if ($('#SEL_YYMM').val() == "") {
    //     modalAlert("กรุณาเลือกเดือนที่จด");
    //     $('#modal_alert').on('hidden.bs.modal', function (e) {
    //         $('#SEL_YYMM').focus();
    //     })
    // }
    // else {
      page_num = 1;
      page_row_start = 1;
      get_last_import();
      countE10Filter();
  // }
}

function get_last_import(){
    var curl = "ajax_data.aspx?qrs=get_last_import&ELECTRIC_ID="+report_id;
    console.log(curl);

    $.ajax({
        url: curl,
        dataType: "json",
        cache: false,
        timeout: 120000,
        success: function( data ) { 
            if(data.length > 0) {
                var last_import = "วันที่นำเข้าข้อมูลล่าสุด: " + data[0].last_import;
                $('#last_import').html(last_import);
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

function countE10Filter(){
    urlM30();
    var count_url = "ajax_data.aspx?qrs=count_FILTER&ELECTRIC_ID="+report_id + main_url;
    console.log(count_url);

	$.ajax({
		url: count_url,
		cache: false,
		timeout: 120000,
		success: function( count_data ) { 
			count_max = count_data;
			$('.count_data').html("จำนวนข้อมูล  " + parseInt(count_data).toLocaleString() + " ผลลัพธ์");

            page_row_end = page_row_start + 99;
			loadE10Filter();
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

function loadE10Filter(){
	in_load = 1;

    var url = "ajax_data.aspx?qrs=load_FILTER" + main_url;
    url += "&row_start=" + page_row_start;
    url += "&row_end=" + page_row_end;
    url += "&column=" + temp_column;
    url += "&sort=" + temp_sort;
    url += "&ELECTRIC_ID=" + report_id;

    console.log(url);

    $.ajax({
        url: url,
        dataType: "json",
        timeout: 180000,
        success: function( data ) { 
        	if (page_num == 1) {
        		$('#onthetable tbody').html("");
        	}
        	var txt_html = "";

        	$.each(data,function( i,item ) {
                var AD_REMARK = ""
                var CONTRACT_ID = itemNull(item.CONTRACT_ID);
                var LOCATION = itemNull(item.LOCATION);

                if(checkNotEmpty(item.LOCATION) ) {
                    AD_REMARK = "<a class='short-menu' title='เพิ่ม/แก้ไข หมายเหตุ' target='_blank' href='e10_meter.aspx?LOCATION=" + LOCATION + "&ELECTRIC_BILL_ID=" + item.ELECTRIC_BILL_ID + "'><span class='glyphicon icon-feather-edit3'></span></a>";
                    LOCATION = "<a class='short-menu' title='คลิกเพื่อแสดงรายละเอียด' target='_blank' href='e10_meter.aspx?LOCATION=" + LOCATION + "'>" + LOCATION + "</a>";
                }

                if(checkNotEmpty(item.CONTRACT_ID) ) {
                    AD_REMARK = "<a class='short-menu' title='เพิ่ม/แก้ไข หมายเหตุ' target='_blank' href='e10_meter.aspx?CONTRACT_ID=" + CONTRACT_ID + "&ELECTRIC_BILL_ID=" + item.ELECTRIC_BILL_ID + "'><span class='glyphicon icon-feather-edit3'></span></a>";
                    CONTRACT_ID = "<a class='short-menu' title='คลิกเพื่อแสดงรายละเอียด' target='_blank' href='e10_meter.aspx?CONTRACT_ID=" + CONTRACT_ID + "'>" + CONTRACT_ID + "</a>";
                }

        		txt_html += "" +
        		"<tr>" + 
        		"<td>" + parseInt(item.row_no).toLocaleString() + "</td>" + 
                "<td>" + itemNull(item.RO) + "</td>" + 
                "<td>" + itemNull(item.CLUSTER) + "</td>" + 
                "<td>" + itemNull(item.PROVINCE) + "</td>" + 
                "<td>" + LOCATION + "</td>" + 
                "<td>" + CONTRACT_ID + "</td>" + 
                "<td>" + itemNull(item.DEVICE) + "</td>" + 
                // "<td>" + itemNull(item.CA) + "</td>" + 
                "<td>" + itemNull(item.ELECTRIC_GROUP_ACROYM) + "</td>" + 

                "<td align='right'>" + parseInt(item.MAX_UNIT).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.MIN_UNIT).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.AVG3_UNIT).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.AVG6_UNIT).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseInt(item.LAST_UNIT).toLocaleString() + "</td>" + 
                "<td align='right' class='txt-bold'>" + parseFloat(item.DIFF_LASTAVG3_UNIT).toFixed(1) + "%</td>" + 

                "<td class='txt-red'>" + itemNull(item.ALERT_CASE_ID) + ". " + itemNull(item.ALERT_CASE_TITLE) + "</td>" + 
                "<td>" + itemNull(item.BILL_YYMM) + "</td>" + 
                "<td>" + AD_REMARK + itemNull(item.REMARK) + "</td>" + 

                "<td align='right'>" + parseFloat(item.MAX_AMOUNT).toFixed(2).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseFloat(item.MIN_AMOUNT).toFixed(2).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseFloat(item.AVG3_AMOUNT).toFixed(2).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseFloat(item.AVG6_AMOUNT).toFixed(2).toLocaleString() + "</td>" + 
                "<td align='right'>" + parseFloat(item.LAST_AMOUNT).toFixed(2).toLocaleString() + "</td>" + 
                "<td align='right' class='txt-bold'>" + parseFloat(item.DIFF_LASTAVG3_AMOUNT).toFixed(1) + "%</td>" + 
                "</tr>";
        	});

        	$('#onthetable tbody').append(txt_html);
        	$('#page_loading').fadeOut();

            page_row_start = page_row_end+1;
        	page_num += 1;
        	in_load = 0;
        },
        error: function(x, t, m) {
          console.log('ajax error \n x>' + x + ' t>' + t + ' m>' + m);
          modalAlertXL("ajax error :loadMap <br><br>" + url);
        }
    });
}

function urlM30() {
    main_url = "";

    if($('#CHK_ALERT_CASE').prop("checked") == true) {
      if($('#SEL_ALERT_CASE').val() == "") {
          main_url += "&ALL_ALERT_CASE=1";
      }
      else {
        main_url += "&ALERT_CASE_ID=" + $("#SEL_ALERT_CASE").val();
    }
}

    // if($('#CHK_REMARK').prop("checked") == true) {
    //   main_url += "&CHK_REMARK=1";
    // }
    main_url += "&CHK_REMARK=" + $("#SEL_REMARK").val();

    main_url += "&BILL_YYMM=" + $("#SEL_YYMM").val();

    main_url += "&RO=" + $("#SEL_RO").val();
    main_url += "&CLUSTER=" + $("#SEL_CLUSTER").val();
    main_url += "&PROVINCE=" + $("#SEL_PROVINCE").val();

    // main_url += "&avg63=" + $('#txt_avg63').val();
    main_url += "&lastavg3=" + $('#txt_lastavg3').val();
    main_url += "&kw=" + $('#txt_search').val();
}

$('.enter-key').bind("enterKey",function(e){
});

$('.enter-key').keyup(function(e){
  if(e.keyCode == 13){
    startLoad();
  }
});

$('#btn_search').click(function() {
  startLoad();
});

$('#btn_download').click(function() {
    $('#modal_cf_download').modal("show");
});

function loadExcel() {
    urlM30();
    window.open("ajax_data.aspx?qrs=xport_E10_FILTER" + main_url);
}

function loadRO() {
    var $el = $("#SEL_RO");
    var url = "ajax_data.aspx?qrs=SP_METER_AREA_RO";
    console.log(url);

    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("กำลังโหลด.."));

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {

            $el.empty();
            $el.append($("<option></option>")
                .attr("value", "").text("ALL RO"));

            $.each(data,function( i,item ) {
                $el.append($("<option></option>")
                    .attr("value", item.RO).text(item.RO));
            });
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    });
}

function loadCLUSTER() {
    var $el = $("#SEL_CLUSTER");
    var url = "ajax_data.aspx?qrs=SP_METER_AREA_CLUSTER";
    url += "&RO=" + $("#SEL_RO").val();
    console.log(url);

    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("กำลังโหลด.."));

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {
            $el.empty();
            $el.append($("<option></option>")
                .attr("value", "").text("ALL CLUSTER"));

            $.each(data,function( i,item ) {
                $el.append($("<option></option>")
                    .attr("value", item.CLUSTER).text(item.CLUSTER));
            });
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    });
}

function loadPROV() {
    var $el = $("#SEL_PROVINCE");
    var url = "ajax_data.aspx?qrs=SP_METER_AREA_PROVINCE";
    url += "&RO=" + $("#SEL_RO").val();
    url += "&CLUSTER=" + $("#SEL_CLUSTER").val();
    console.log(url);

    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("กำลังโหลด.."));

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {
            $el.empty();
            $el.append($("<option></option>")
                .attr("value", "").text("ALL PROVINCE"));

            $.each(data,function( i,item ) {
                $el.append($("<option></option>")
                    .attr("value", item.PROVINCE).text(item.PROVINCE));
            });
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    });
}

function loadYYMM() {
    var $el = $("#SEL_YYMM");
    var url = "ajax_data.aspx?qrs=SP_E10010_YYMM";
    console.log(url);

    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("กำลังโหลด.."));

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {
            $el.empty();
            $el.append($("<option></option>")
                .attr("value", "").text("ทุกเดือน"));

            if (data.length > 0) {
                $.each(data,function( i,item ) {
                    if (item.DD_DEFAULT == 1) {
                        $el.append($("<option></option>")
                            .attr("value", item.BILL_YYMM).text(item.BILL_YYMM)
                            .attr("selected", "selected"));
                    }
                    else {
                        $el.append($("<option></option>")
                            .attr("value", item.BILL_YYMM).text(item.BILL_YYMM));
                    }
                });

                // set default เดือนล่าสุด
                // $el.val(data[0].BILL_YYMM);
                loadALERTCASE();
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    });
}

function loadALERTCASE() {
    var $el = $("#SEL_ALERT_CASE");
    var url = "ajax_data.aspx?qrs=SP_METER_ALERT_CASE";
    console.log(url);

    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("กำลังโหลด.."));

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) {
            $el.empty();
            $el.append($("<option></option>")
                .attr("value", "").text("ALL ALERT CASE"));

            $.each(data,function( i,item ) {
                $el.append($("<option></option>")
                    .attr("value", item.ALERT_CASE_ID).text(item.ALERT_CASE_ID + ". " + item.ALERT_CASE_TITLE + " (" + item.ALERT_CASE_DESC + ")"));
            });

            startLoad();
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    });
}
$('#SEL_RO').change(function() {
    loadCLUSTER();
    loadPROV();
});

$('#SEL_CLUSTER').change(function() {
    loadPROV();
});

$('#CHK_ALERT_CASE').change(function () {
  if($('#CHK_ALERT_CASE').prop("checked") == true) {
    $('#SEL_ALERT_CASE').prop('disabled', false);
    $('#div_ALERT_CASE').show();
  }
  else {
    $('#SEL_ALERT_CASE').prop('disabled', 'disabled');
    $('#div_ALERT_CASE').hide();
  }
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