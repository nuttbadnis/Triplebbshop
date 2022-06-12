<%@ Page Language="VB" AutoEventWireup="false" CodeFile="app_a20.aspx.vb" Inherits="app_a20" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <!--[if IE ]> <body class="ie"> <![endif]-->
    <title>MEMBERRPT A20</title>

    <link rel="shortcut icon" href="App_Inc/favicon.ico" type="image/x-icon">
    <link rel="icon" href="App_Inc/favicon.ico" type="image/x-icon">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-146935196-1"></script>
    <script type="text/javascript" src="App_Inc/_js/gtag_memberrpt.js?id=UA-146935196-1&vs=18"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
    <script src="App_Inc/jquery-1.11.3.min.js"></script>

    <link rel="stylesheet" type="text/css" href="App_Inc/jquery-ui-1.11.4/jquery-ui.css"/>
    <script type="text/javascript" src="App_Inc/jquery-ui-1.11.4/jquery-ui.js"></script>

    <script type="text/javascript" src="App_Inc/jquery-cookie/jquery.cookie.js"></script>

    <link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
    <script src="App_Inc/bootstrap/js/bootstrap.js"></script>

    <link rel="stylesheet" href="App_Inc/bootstrap-notify/animate.css" />
    <script src="App_Inc/bootstrap-notify/bootstrap-notify.js"></script>

    <link type="text/css" rel="stylesheet" href="App_Inc/icomoon/font-icon.css" />

    <link type="text/css" rel="stylesheet" href="App_Inc/_css/main.css?vs=19" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/stockShop.css?vs=19" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/mapReport.css?vs=19" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartShop.css?vs=19" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartApp.css?vs=199" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/chartDark.css?vs=199" />
    <link type="text/css" rel="stylesheet" href="App_Inc/_css/gly-spin.css" />

    <script type="text/javascript" src="App_Inc/canvasjs-2.3.2/canvasjs.min.js"></script>
    <script type="text/javascript" src="App_Inc/jquery.inview/jquery.inview.min.js"></script>
    <script type="text/javascript" src="App_Inc/Highcharts-7.1.3/code/highcharts.js"></script>

    <script type="text/javascript" src="App_Inc/_js/panu.js?vs=19"></script>
</head>
<body>
    <input runat="server" id="hide_uemail" type="hidden">
    <input runat="server" id="hide_upermiss" type="hidden">
    <form id="form1" runat="server"></form>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="default.aspx">
                    <span class="glyphicon icon-stats-bars"></span> MEMBERRPT
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="full-bar"><a href="app_a10.aspx">A10 สถิติการใช้งาน App</a></li>
                    <li class="full-bar"><a href="app_a15.aspx">A15 สถิติ ก.พ. 2020</a></li>
                    <li class="active full-bar"><a href="app_a20.aspx">A20 ความถี่การใช้งาน App</a></li>
                    <li class="full-bar"><a href="app_a30.aspx">A30 ข้อมูลการใช้ Point</a></li>
                    <li class="full-bar"><a href="app_a35.aspx">A35 ข้อมูลการใช้ Coin</a></li>
                    <li class="full-bar"><a href="app_a40.aspx">A40 ข้อมูลการชำระเงิน</a></li>

                    <li class="mini-bar"><a href="app_a10.aspx" title="A10 สถิติการใช้งาน App">A10</a></li>
                    <li class="mini-bar"><a href="app_a15.aspx" title="A15 สถิติ ก.พ. 2020">A15</a></li>
                    <li class="active mini-bar"><a href="app_a20.aspx">A20 ความถี่การใช้งาน App</a></li>
                    <li class="mini-bar"><a href="app_a30.aspx" title="A30 ข้อมูลการใช้ Point">A30</a></li>
                    <li class="mini-bar"><a href="app_a35.aspx" title="A35 ข้อมูลการใช้ Coin">A35</a></li>
                    <li class="mini-bar"><a href="app_a40.aspx" title="A40 ข้อมูลการชำระเงิน">A40</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="app_download.aspx"><span class="glyphicon glyphicon-save-file"></span> Download</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">รายงานอื่นๆ <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="app_a10.aspx">A10 กราฟเข้าใช้ App</a></li>
                            <li><a href="app_g10.aspx">G10 กราฟลง App ใหม่</a></li>
                            <li><a href="../empquest/sms_m40.aspx">M40 สำรวจโครงการ</a></li>
                            <li><a href="../meterrpt/e10.aspx">E10 มิเตอร์ไฟฟ้า</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <div class="inview" id="rd_r10041">
                    <div class="load_center">
                        <span class="glyphicon glyphicon-refresh gly-spin"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <div class="col-xs-9" style="padding:0">
                    <div id="pop_days_r10010" class="pop-detail">จำนวน Account: 123,456<br>ค่าเฉลี่ย: 0.35</div>
                    <div class="inview" id="rd_days_r10010_bar">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                </div>

                <div class="col-xs-3" style="padding:0">
                    <div id="rd_days_r10010_pie">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                </div>

                <div id="display_days_r10010"></div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <div class="col-xs-9" style="padding:0">
                    <div id="pop_times_r10010" class="pop-detail">จำนวน Account: 123,456<br>ค่าเฉลี่ย: 0.35</div>
                    <div class="inview" id="rd_times_r10010_bar">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                </div>

                <div class="col-xs-3" style="padding:0">
                    <div id="rd_times_r10010_pie">
                        <div class="load_center">
                            <span class="glyphicon glyphicon-refresh gly-spin"></span>
                        </div>
                    </div>
                </div>

                <div id="display_times_r10010"></div>
            </div>
        </div>
    </div>

    <div class="container container-description">
        <div class="row row-container">
            <div class="col-xs-12 box-container">
                <p>
                    **เงื่อนไข <br>
                    - Account ที่เข้าใช้งานมากกว่า 30 ครั้ง ระบบจะนับเป็น 30 ครั้ง<br>
                    - หากใน 1 นาที Account ที่เข้าใช้งานมากกว่า 1 ครั้ง ระบบจะนับเป็น 1 ครั้ง<br>
                    - มีข้อมูลการใช้งาน APP ตั้งแต่วันที่ 10 กรกฏาคม 2562 เป็นต้นไป<br>
                    - ข้อมูลอัพเดททุกสิ้นวัน Data ต้นทางจาก TMP_3BBAPP_MACUUID และ TMP_3BBAPP ของ BCS
                </p>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <div class="pull-left">
            <p>Copyright &copy; 2019 by support_pos</p>
            <p>เพื่อการใช้งานเต็มประสิทธิภาพ กรุณาใช้เบราว์เซอร์ Chrome หรือ Firefox</p>
            <img onerror="imgError(this);" src="http://posbcs.triplet.co.th/pos.ico" style="left: -100px; position: absolute;">
        </div>

        <div class="pull-right">
            <span id="gotoTop">
                <a class='btn btn-default btn-lg' onclick="$('html,body').animate({scrollTop:0},'slow');return false;" title="กลับขึ้นด้านบน">
                    <i class="glyphicon glyphicon-chevron-up"></i> TOP
                </a>
            </span>
        </div>
    </div>
</footer>

<div id="page_loading" class="modal-backdrop">
    <div class="in-loading not-nm">
        <span class="glyphicon icon-spinner7 gly-spin"></span><span id="txt_loading"> กรุณารอสักครู่...</span>
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
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>

<script type="text/javascript">
var colorSet_4bar = ['#0fc44e', '#1995b7','#009666', '#789ca3'];
var colorSet_2bar = ['#DF5353', '#ffdb5b'];
var colorSet_6pie = ['#f15723', '#FF9628', '#ffd11c', '#2BFE75', '#60AFFF', '#006EC5'];

</script>

<script type="text/javascript" src="App_Inc/_js/chartApp.js?vs=1999"></script>
<script type="text/javascript" src="App_Inc/_js/chartDark.js?vs=199"></script>

<script type="text/javascript">
$(document).ready(function() { 
    $('.pop-detail').hide();
    load_r10041();
    load_r10010();
});

function load_r10041() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10041";
    console.log("load_r10041 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            var temp_arr_label = "";
            var temp_arr_mm = data[0].mm;
            var i_mm = 0;

            // var arr_categories = ['overall', ];
            var arr_categories = [];
            var data_days30 = [];
            var data_times30 = [];

            $.each(data,function( i,item ) {
                if(parseInt(item.YYMM) >= parseInt(data[data.length-4].YYMM)){
                    if(temp_arr_label != item.YYMM) {
                        temp_arr_label = item.YYMM;
                        arr_categories.push(monthsShort[parseInt(item.YYMM.substring(2, 4))-1] + ' 20' + item.YYMM.substring(0, 2));
                    }

                    if(item.TYPE_GROUP == 'days30'){
                        data_days30.push(parseFloat(item.avg_used));
                    }

                    if(item.TYPE_GROUP == 'times30'){
                        data_times30.push(parseFloat(item.avg_used));
                    }
                }
            });

            console.log(arr_categories);

            Highcharts.chart('rd_r10041', {
                colors: colorSet_2bar, 
                chart: {
                    height: 365,
                    type: 'column',
                    style: {
                        fontFamily: 'Kanit'
                    }
                },
                title: {
                    text: 'ค่าเฉลี่ย จำนวนวัน, จำนวนครั้ง ที่ลูกค้าใช้งาน App',
                    style: {
                        fontSize: '14px',
                    }
                },
                xAxis: {
                    categories: arr_categories,
                    crosshair: true
                },
                yAxis: {
                    title: {
                        text: '',
                    },
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<p style="font-size: 14px; font-weight: bold;">{point.key}</p><br><hr>',
                    style: {
                        "fontSize": "14px",
                    },
                },
                legend: {
                    symbolRadius: 0,
                    padding: 0,
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                        }
                    },
                    series: {
                        events: {
                            legendItemClick: function () {
                                return false; 
                            }
                        }
                    },
                },
                series: [{
                    stack: 'จำนวนวันเฉลี่ย',
                    name: 'จำนวนวันเฉลี่ย',
                    data: data_days30,
                    maxPointWidth: 75,
                }, {
                    stack: 'จำนวนครั้งเฉลี่ย',
                    name: 'จำนวนครั้งเฉลี่ย',
                    data: data_times30,
                    maxPointWidth: 75,
                }]
            });

            var pfoot = "เงื่อนไขข้อมูล <b>ไม่นับวันที่ Login ครั้งแรก</b> "
            pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
            $('#rd_r10041').append(pfoot);
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function load_r10010() {
    var url = "ajax_chart.aspx?qrs=SP_R_NUM&spnum=10010";
    console.log("load_r10010 = " + url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0){
                var data_days30 = [];
                var data_times30 = [];

                $.each(data,function( i,item ) {
                    if(item.TYPE_GROUP == 'days30'){
                        data_days30.push(data[i]);
                    }

                    if(item.TYPE_GROUP == 'times30'){
                        data_times30.push(data[i]);
                    }
                });

                days_r10010(data_days30);
                times_r10010(data_times30);
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function days_r10010(data) {
    var thisid = "rd_days_r10010";

    var str_value = "วัน";
    var arr_categories = [];

    var last_group = 6;
    var total_last_group = 0;
    var total_acc = 0;
    var total_point = 0;

    var temp_arr_label = "";
    var temp_arr_yymm = data[0].YYMM;

    var i_mm = 0;

    var data_bar = [];
    data_bar[i_mm] = [];

    var data_pie = [];
    data_pie[i_mm] = [];

    $.each(data,function( i,item ) {
        if(temp_arr_label != item.COUNT_GROUP && i < last_group-1) {
            temp_arr_label = item.COUNT_GROUP;
            arr_categories.push(item.COUNT_GROUP);
        }

        if(temp_arr_yymm != item.YYMM) {
            temp_arr_yymm = item.YYMM;

            i_mm++;
            data_bar[i_mm] = [];
            data_pie[i_mm] = {};
            total_last_group = 0;
            total_acc = 0;
            total_point = 0;
        }

        if(item.COUNT_GROUP < last_group) {
            data_bar[i_mm].push(parseInt(item.COUNT_VALUE));
        }
        else {
            total_last_group += parseInt(item.COUNT_VALUE);
            data_bar[i_mm][last_group-1] = total_last_group;
        }


        total_acc += parseInt(item.COUNT_VALUE);
        total_point += parseInt(item.COUNT_VALUE) * parseInt(item.COUNT_GROUP);

        data_pie[i_mm]['legend_name'] = getStrYYMM(item.YYMM, "");
        data_pie[i_mm]['total_acc'] = total_acc;
        data_pie[i_mm]['total_point'] = total_point;
        data_pie[i_mm]['avg'] = fixDecimal(1, total_point/total_acc);
    });

    arr_categories.push(">= " + last_group);

    var data_bar_percent = [];

    $.each(data_bar,function( i,item ) {
        data_bar_percent[i] = [];

        $.each(data_bar[i],function( i2,item2 ) {
            data_bar_percent[i].push({
                y: calPercent(data_bar[i][i2], data_pie[i]['total_acc']),
                vayue: data_bar[i][i2],
                total: data_pie[i]['total_acc'],
            });
        });
    });

    var data_c_rie = [];
    var data_c_pie = [];

    var pie_px_x = [25, 80, 25, 80]
    var pie_px_y = [25, 25, 80, 80]

    $.each(data_bar_percent,function( i,item ) {
        var lg = false;
        if(i == 0) lg = true;

        data_c_pie.push({
            pie_index: i,
            type: 'pie',
            name: data_pie[i]['legend_name'],
            center: [pie_px_x[i] + "%", pie_px_y[i] + "%"],
            size: 75,
            showInLegend: lg,
            dataLabels: {
                enabled: false
            },
            data: [{
                name: '1 ' + str_value,
                y: data_bar_percent[i][0].y,
            }, {
                name: '2 ' + str_value,
                y: data_bar_percent[i][1].y,
            }, {
                name: '3 ' + str_value,
                y: data_bar_percent[i][2].y,
            }, {
                name: '4 ' + str_value,
                y: data_bar_percent[i][3].y,
            }, {
                name: '5 ' + str_value,
                y: data_bar_percent[i][4].y,
            }, {
                name: '>= 6 ' + str_value,
                y: data_bar_percent[i][5].y,
            }],
        });

        data_c_rie.push({
            bar_index: i,
            stack: data_pie[i]['legend_name'],
            name: data_pie[i]['legend_name'],
            data: data_bar_percent[i],
        });
    });

    Highcharts.chart(thisid + '_pie', {
        colors: colorSet_6pie,
        chart: {
            type: 'pie',
        },
        title: {
            text: ''
        },
        tooltip: {
            shared: true,
            useHTML: true,
            borderColor: "#fc8b16",
            formatter: function() {
                var content = "";

                var data_this = this.series.userOptions;
                popDetail(data_this.pie_index);

                content = data_this.name;
                content = "<b>" + content + "</b>";

                for (var i = 0; i < data_this.data.length; i++) {
                    content += "<br>"      
                    content += "<span style='font-size:10px; color: " + colorSet_6pie[i] + ";' class='glyphicon icon-pie-chart'></span> "
                    content += "<span ";

                    if(this.key == data_this.data[i].name) {
                        content += "style='color: " + colorSet_6pie[i] + ";'";
                    }

                    content += ">" + data_this.data[i].name + ": <b>" + Highcharts.numberFormat(data_this.data[i].y,1) + " %</b>";
                    content += "</span>"      
                };
                
                return content;
            }
        },
        labels: {
            items: [
            {
                html: data_pie[0]['legend_name'],
                style: {
                    left: '20%',
                    top: '15%'
                }
            },
            {
                html: data_pie[1]['legend_name'],
                style: {
                    left: '150%',
                    top: '15%'
                }
            },
            {
                html: data_pie[2]['legend_name'],
                style: {
                    left: '20%',
                    top: '150%'
                }
            },
            {
                html: data_pie[3]['legend_name'],
                style: {
                    left: '150%',
                    top: '150%'
                }
            }]
        },
        series: data_c_pie
    });

    var fnchart = new Highcharts.chart(thisid + '_bar', {
        colors: colorSet_4bar, 
        chart: {
            type: 'column',
            style: {
                fontFamily: 'Kanit',
            }
        },
        title: {
            text: "สัดส่วน \"จำนวน" + str_value + "\" ที่เคยเข้าใช้งาน เปรียบเทียบแต่ละเดือน",
            style: {
                fontSize: '14px',
            }
        },
        xAxis: {
            categories: arr_categories,
            labels: {
                format: '{value} ' + str_value
            }
        },
        yAxis: {
            title: {
                text: '',
            },
            labels: {
                format: '{value} %'
            },
            stackLabels: {
                enabled: true,
                allowOverlap: true,
                rotation: -90,
                x: 8,
                y: 15,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'white'
                },
                formatter: function () {
                    return Highcharts.numberFormat(this.total,1) + ' %';
                }
            }
        },
        legend: {
            symbolRadius: 0,
            padding: 0,
        },
        tooltip: {
            shared: true,
            style: {
                "fontSize": "14px",
            },
            useHTML: true,
            borderColor: "#fc8b16",
            formatter: function() {
                var content = "";

                content = "เข้าใช้งาน " + this.x + " " + str_value;
                content = "<b>" + content + "</b>";

                for (var i = 0; i < this.points.length; i++) {
                    content += "<br>"      
                    content += "<span style='color: " + this.points[i].series.color + ";' class='glyphicon icon-stop2'></span> " + this.points[i].series.name + ": ";
                    content += "<b>" + Highcharts.numberFormat(this.points[i].y,1) + "%</b> ";
                    content += "<span style='color:#d6ffe4;'>(" + this.points[i].point.vayue.toLocaleString() + ")</span>";
                };

                return content;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
            },
            series: {
                events: {
                    mouseOver: function () {
                        if(this.columnIndex == null) {
                        }
                        else {
                            popDetail(this.columnIndex);
                        }
                    },
                    legendItemClick: function () {
                        popDetail(this.columnIndex);
                        return false; 
                    }
                }
            }
        },
        series: data_c_rie,

    },
    function(fnchart){
        $(fnchart.series).each(function(i, serie) {
            if (typeof serie.legendItem === 'undefined') {
            } else {
                $(serie.legendItem.element).hover(function() {
                    // console.log('over');
                    // console.log(serie);
                    popDetail(serie.index);
                }, function() {
                    // console.log('mouseout');
                });
            }
        });
    });
    

    var pfoot = "เงื่อนไขข้อมูล <b>ไม่นับวันที่ Login ครั้งแรก</b> "
    pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
    $('#rd_days_r10010_bar').append(pfoot);

    popDetail(0);

    function popDetail(idx) {
        var pop_days_r10010 = "<span style='color: " + colorSet_4bar[idx] + ";' class='glyphicon icon-stop2'></span> "
        pop_days_r10010 += "<b>" + data_pie[idx]['legend_name'] + "</b>";
        pop_days_r10010 += "<br>Total: <b style='color: " + colorSet_4bar[idx] + ";'>" + data_pie[idx]['total_acc'].toLocaleString() + "</b> Account";
        pop_days_r10010 += "<br>Average: <b style='color: " + colorSet_4bar[idx] + ";'>" + fixDecimal(1, (data_pie[idx]['total_point']/data_pie[idx]['total_acc'])).toLocaleString() + "</b> " + str_value;
        $('#pop_days_r10010').html(pop_days_r10010);
        $('#pop_days_r10010').fadeIn();
    }

    var txt_table = "<div id='display_days_r10010'>" +
    "<table id='table_days_r10010' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
    "<thead style='font-weight: normal'>" +
    "<tr>" +
    "<th rowspan='2'>เดือน</th>" +
    "<th colspan='6' style='text-align:center;'>สัดส่วน (%)</th>    " +
    "<th colspan='7' style='text-align:center;'>จำนวน Account</th>    " +
    "<th rowspan='2' style='text-align:center;'>Average</th>" +
    "</tr>" +
    "<tr>" +
    "<th width='6%' style='text-align:center;'>1 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>2 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>3 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>4 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>5 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>>= 6 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>1 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>2 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>3 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>4 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>5 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>>= 6 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>Total</th>" +
    "</tr>" +
    "</thead>" +
    "<tbody>";

    $.each(data_bar_percent,function( i,item ) {
        txt_table += "<tr><td>" + data_pie[i]['legend_name'] + "</td>";

        $.each(data_bar_percent[i],function( i2,item2 ) {
            txt_table += "<td align='right'>" + Highcharts.numberFormat(data_bar_percent[i][i2].y ,1) + "%</td>"; 
        });

        $.each(data_bar_percent[i],function( i2,item2 ) {
            txt_table += "<td align='right'>" + data_bar_percent[i][i2].vayue.toLocaleString() + "</td>"; 
        });

        txt_table += "<td align='right'>" + data_pie[i]['total_acc'].toLocaleString() + "</td>"; 
        txt_table += "<td align='right'>" + data_pie[i]['avg'] + " " + str_value + "</td>"; 
        txt_table += "</tr>";
    });

    txt_table += "</tbody>" +
    "</table>" +
    "</div>";

    $('#display_days_r10010').replaceWith(txt_table);
    $('#table_days_r10010').fadeIn();
}

function times_r10010(data) {
    var thisid = "rd_times_r10010";

    var str_value = "ครั้ง";
    var arr_categories = [];

    var last_group = 6;
    var total_last_group = 0;
    var total_acc = 0;
    var total_point = 0;

    var temp_arr_label = "";
    var temp_arr_yymm = data[0].YYMM;

    var i_mm = 0;

    var data_bar = [];
    data_bar[i_mm] = [];

    var data_pie = [];
    data_pie[i_mm] = [];

    $.each(data,function( i,item ) {
        if(temp_arr_label != item.COUNT_GROUP && i < last_group-1) {
            temp_arr_label = item.COUNT_GROUP;
            arr_categories.push(item.COUNT_GROUP);
        }

        if(temp_arr_yymm != item.YYMM) {
            temp_arr_yymm = item.YYMM;

            i_mm++;
            data_bar[i_mm] = [];
            data_pie[i_mm] = {};
            total_last_group = 0;
            total_acc = 0;
            total_point = 0;
        }

        if(item.COUNT_GROUP < last_group) {
            data_bar[i_mm].push(parseInt(item.COUNT_VALUE));
        }
        else {
            total_last_group += parseInt(item.COUNT_VALUE);
            data_bar[i_mm][last_group-1] = total_last_group;
        }


        total_acc += parseInt(item.COUNT_VALUE);
        total_point += parseInt(item.COUNT_VALUE) * parseInt(item.COUNT_GROUP);

        data_pie[i_mm]['legend_name'] = getStrYYMM(item.YYMM, "");
        data_pie[i_mm]['total_acc'] = total_acc;
        data_pie[i_mm]['total_point'] = total_point;
        data_pie[i_mm]['avg'] = fixDecimal(1, total_point/total_acc);
    });

    arr_categories.push(">= " + last_group);

    var data_bar_percent = [];

    $.each(data_bar,function( i,item ) {
        data_bar_percent[i] = [];

        $.each(data_bar[i],function( i2,item2 ) {
            data_bar_percent[i].push({
                y: calPercent(data_bar[i][i2], data_pie[i]['total_acc']),
                vayue: data_bar[i][i2],
                total: data_pie[i]['total_acc'],
            });
        });
    });

    var data_c_rie = [];
    var data_c_pie = [];

    var pie_px_x = [25, 80, 25, 80]
    var pie_px_y = [25, 25, 80, 80]

    $.each(data_bar_percent,function( i,item ) {
        var lg = false;
        if(i == 0) lg = true;

        data_c_pie.push({
            pie_index: i,
            type: 'pie',
            name: data_pie[i]['legend_name'],
            center: [pie_px_x[i] + "%", pie_px_y[i] + "%"],
            size: 75,
            showInLegend: lg,
            dataLabels: {
                enabled: false
            },
            data: [{
                name: '1 ' + str_value,
                y: data_bar_percent[i][0].y,
            }, {
                name: '2 ' + str_value,
                y: data_bar_percent[i][1].y,
            }, {
                name: '3 ' + str_value,
                y: data_bar_percent[i][2].y,
            }, {
                name: '4 ' + str_value,
                y: data_bar_percent[i][3].y,
            }, {
                name: '5 ' + str_value,
                y: data_bar_percent[i][4].y,
            }, {
                name: '>= 6 ' + str_value,
                y: data_bar_percent[i][5].y,
            }],
        });

        data_c_rie.push({
            bar_index: i,
            stack: data_pie[i]['legend_name'],
            name: data_pie[i]['legend_name'],
            data: data_bar_percent[i],
        });
    });

    Highcharts.chart(thisid + '_pie', {
        colors: colorSet_6pie,
        chart: {
            type: 'pie',
        },
        title: {
            text: ''
        },
        tooltip: {
            shared: true,
            useHTML: true,
            borderColor: "#fc8b16",
            formatter: function() {
                var content = "";

                var data_this = this.series.userOptions;
                popDetail(data_this.pie_index);

                content = data_this.name;
                content = "<b>" + content + "</b>";

                for (var i = 0; i < data_this.data.length; i++) {
                    content += "<br>"      
                    content += "<span style='font-size:10px; color: " + colorSet_6pie[i] + ";' class='glyphicon icon-pie-chart'></span> "
                    content += "<span ";

                    if(this.key == data_this.data[i].name) {
                        content += "style='color: " + colorSet_6pie[i] + ";'";
                    }

                    content += ">" + data_this.data[i].name + ": <b>" + Highcharts.numberFormat(data_this.data[i].y,1) + " %</b>";
                    content += "</span>"      
                };
                
                return content;
            }
        },
        labels: {
            items: [
            {
                html: data_pie[0]['legend_name'],
                style: {
                    left: '20%',
                    top: '15%'
                }
            },
            {
                html: data_pie[1]['legend_name'],
                style: {
                    left: '150%',
                    top: '15%'
                }
            },
            {
                html: data_pie[2]['legend_name'],
                style: {
                    left: '20%',
                    top: '150%'
                }
            },
            {
                html: data_pie[3]['legend_name'],
                style: {
                    left: '150%',
                    top: '150%'
                }
            }]
        },
        series: data_c_pie
    });

    var fnchart = new Highcharts.chart(thisid + '_bar', {
        colors: colorSet_4bar, 
        chart: {
            type: 'column',
            style: {
                fontFamily: 'Kanit',
            }
        },
        title: {
            text: "สัดส่วน \"จำนวน" + str_value + "\" ที่เคยเข้าใช้งาน เปรียบเทียบแต่ละเดือน",
            style: {
                fontSize: '14px',
            }
        },
        xAxis: {
            categories: arr_categories,
            labels: {
                format: '{value} ' + str_value
            }
        },
        yAxis: {
            title: {
                text: '',
            },
            labels: {
                format: '{value} %'
            },
            stackLabels: {
                enabled: true,
                allowOverlap: true,
                rotation: -90,
                x: 8,
                y: 15,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'white'
                },
                formatter: function () {
                    return Highcharts.numberFormat(this.total,1) + ' %';
                }
            }
        },
        legend: {
            symbolRadius: 0,
            padding: 0,
        },
        tooltip: {
            shared: true,
            style: {
                "fontSize": "14px",
            },
            useHTML: true,
            borderColor: "#fc8b16",
            formatter: function() {
                var content = "";

                content = "เข้าใช้งาน " + this.x + " " + str_value;
                content = "<b>" + content + "</b>";

                for (var i = 0; i < this.points.length; i++) {
                    content += "<br>"      
                    content += "<span style='color: " + this.points[i].series.color + ";' class='glyphicon icon-stop2'></span> " + this.points[i].series.name + ": ";
                    content += "<b>" + Highcharts.numberFormat(this.points[i].y,1) + "%</b> ";
                    content += "<span style='color:#d6ffe4;'>(" + this.points[i].point.vayue.toLocaleString() + ")</span>";
                };

                return content;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
            },
            series: {
                events: {
                    mouseOver: function () {
                        if(this.columnIndex == null) {
                        }
                        else {
                            popDetail(this.columnIndex);
                        }
                    },
                    legendItemClick: function () {
                        popDetail(this.columnIndex);
                        return false; 
                    }
                }
            }
        },
        series: data_c_rie,

    },
    function(fnchart){
        $(fnchart.series).each(function(i, serie) {
            if (typeof serie.legendItem === 'undefined') {
            } else {
                $(serie.legendItem.element).hover(function() {
                    // console.log('over');
                    // console.log(serie);
                    popDetail(serie.index);
                }, function() {
                    // console.log('mouseout');
                });
            }
        });
    });
    

    var pfoot = "เงื่อนไขข้อมูล <b>ไม่นับวันที่ Login ครั้งแรก</b> "
    pfoot = "<p class='pfoot'><span class='glyphicon icon-info'></span> " + pfoot + "</p>";
    $('#rd_times_r10010_bar').append(pfoot);

    popDetail(0);

    function popDetail(idx) {
        var pop_times_r10010 = "<span style='color: " + colorSet_4bar[idx] + ";' class='glyphicon icon-stop2'></span> "
        pop_times_r10010 += "<b>" + data_pie[idx]['legend_name'] + "</b>";
        pop_times_r10010 += "<br>Total: <b style='color: " + colorSet_4bar[idx] + ";'>" + data_pie[idx]['total_acc'].toLocaleString() + "</b> Account";
        pop_times_r10010 += "<br>Average: <b style='color: " + colorSet_4bar[idx] + ";'>" + data_pie[idx]['avg'] + "</b> " + str_value;
        $('#pop_times_r10010').html(pop_times_r10010);
        $('#pop_times_r10010').fadeIn();
    }

    var txt_table = "<div id='display_times_r10010'>" +
    "<table id='table_times_r10010' class='table table-bordered table-report' cellspacing='0' width='100%' style='display:none;'>" +
    "<thead style='font-weight: normal'>" +
    "<tr>" +
    "<th rowspan='2'>เดือน</th>" +
    "<th colspan='6' style='text-align:center;'>สัดส่วน (%)</th>    " +
    "<th colspan='7' style='text-align:center;'>จำนวน Account</th>    " +
    "<th rowspan='2' style='text-align:center;'>Average</th>" +
    "</tr>" +
    "<tr>" +
    "<th width='6%' style='text-align:center;'>1 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>2 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>3 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>4 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>5 " + str_value + "</th>" +
    "<th width='6%' style='text-align:center;'>>= 6 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>1 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>2 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>3 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>4 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>5 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>>= 6 " + str_value + "</th>" +
    "<th width='7.5%' style='text-align:center;'>Total</th>" +
    "</tr>" +
    "</thead>" +
    "<tbody>";

    $.each(data_bar_percent,function( i,item ) {
        txt_table += "<tr><td>" + data_pie[i]['legend_name'] + "</td>";

        $.each(data_bar_percent[i],function( i2,item2 ) {
            txt_table += "<td align='right'>" + Highcharts.numberFormat(data_bar_percent[i][i2].y ,1) + "%</td>"; 
        });
        
        $.each(data_bar_percent[i],function( i2,item2 ) {
            txt_table += "<td align='right'>" + data_bar_percent[i][i2].vayue.toLocaleString() + "</td>"; 
        });

        txt_table += "<td align='right'>" + data_pie[i]['total_acc'].toLocaleString() + "</td>"; 
        txt_table += "<td align='right'>" + data_pie[i]['avg'] + " " + str_value + "</td>"; 
        txt_table += "</tr>";
    });

    txt_table += "</tbody>" +
    "</table>" +
    "</div>";

    $('#display_times_r10010').replaceWith(txt_table);
    $('#table_times_r10010').fadeIn();
}

</script>

<style type="text/css">
.canvasjs-chart-credit, .highcharts-credits {
    display: none;
}
</style>