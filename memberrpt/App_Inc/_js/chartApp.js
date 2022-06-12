var monthsShort = ["ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค."];

$(document).ready(function() { 
     $(window).scroll(function(){  
         if($(document).scrollTop()>100){
             $("#gotoTop").show();
         }else{  
             $("#gotoTop").hide(); 
         }  
     });  

    if(navigator.userAgent.indexOf('MSIE')>0){  
        $('#txt_loading').html(" คุณกำลังใช้โปรแกรมที่ไม่สนับสนุน กรุณาใช้ Chrome หรือ Firefox");
        $('#page_loading').fadeIn();
    }  
    else {
        $('#page_loading').fadeOut();
    }

    setTimeout(function() {
        $('.inonly').addClass('inok');

        devmode();
    }, 1000);
});

function devmode() {
    var thissite = window.location.protocol + "//" + window.location.host + window.location.pathname;
    thissite = thissite.toLowerCase();
    console.log("thissite = " + thissite);

    var devsitein = "http://posbcs.triplet.co.th/ma_intranet";
    var devsiteout = "http://posbcs.triplet.co.th/mg_online";

    if(thissite.includes(devsitein) == true || thissite.includes(devsiteout) == true){
        setInterval(blinker_devmode, 1000);
    }
}

function blinker_devmode() {
    $(".navbar-brand").css("color","#f15723");
    $(".navbar-brand").css("font-weight", "bold");
    $('.navbar-brand').html("<span class='glyphicon icon-stats-bars'></span> TEST.MBRPT");
    $('.navbar-brand').fadeOut(500);
    $('.navbar-brand').fadeIn(500);
}

function imgError(img) {
    $('.inonly').hide();
}

function notifyLoadSession() {
    var noti_msg = "";
    if(temp_e_ro == ""){
        noti_msg += "<b>RO:</b> Null";
    }
    else {
        noti_msg += "<b>RO:</b> " + temp_e_ro;
    }
    if(temp_e_cluster == ""){
        noti_msg += "<br><b>CLUSTER:</b> Null";
    }
    else {
        noti_msg += "<br><b>CLUSTER:</b> " + temp_e_cluster;
    }
    if(temp_e_province != ""){
        noti_msg += "<br><b>จังหวัด:</b> " + temp_e_province;
    }
    noti_msg = "Session Parameter<br>" + noti_msg + "";

    $.notify({
        icon: 'glyphicon glyphicon-exclamation-sign',
        message: noti_msg,
    },
    {
        delay: 500,
        offset: {
            x: 20,
            y: 40
        }
    });
}


function keepSessionRO() {
    var url = "ajax_chart.aspx?qrs=keepSessionRO&ro=" + temp_e_ro;
    console.log(url);

    $.ajax({
        url: url,
        success: function(data) { 
            console.log("keepSessionRO complete.")

            if(temp_e_ro != ""){
                $.notify({
                    icon: 'glyphicon glyphicon-floppy-save',
                    message: "Session Push: " + temp_e_ro,
                },
                {
                    delay: 500,
                });
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    });
}

function keepSessionCluster() {
    var url = "ajax_chart.aspx?qrs=keepSessionCluster&cluster=" + temp_e_cluster;
    console.log(url);

    $.ajax({
        url: url,
        success: function(data) { 
            console.log("keepSessionCluster complete.")

            if(temp_e_cluster != ""){
                $.notify({
                    icon: 'glyphicon glyphicon-floppy-save',
                    message: "Session Push: " + temp_e_cluster,
                },
                {
                    delay: 500,
                });
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    });
}

function keepSessionProvince() {
    var url = "ajax_chart.aspx?qrs=keepSessionProvince&province=" + temp_e_province;
    console.log(url);

    $.ajax({
        url: url,
        success: function(data) { 
            console.log("keepSessionProvince complete.")

            if(temp_e_province != ""){
                $.notify({
                    icon: 'glyphicon glyphicon-floppy-save',
                    message: "Session Push: " + temp_e_province,
                },
                {
                    delay: 500,
                });
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);
        }
    });
}

function fn_ceil_int(num1, num2) {
    num1 = parseFloat(num1/num2);
    num1 = Math.ceil(num1);
    num1 = parseInt(num1*num2);

    return num1;
}

function arrDataCrieLinePercent(data, label_str) {
    var temp_label = data[0].label;
    var r1 = 0, r2 = 0;

    var arr2 = [];
    arr2[r1] = [];

    $.each(data,function( i,item ) {
        if (temp_label != item.label) {
            temp_label = item.label;

            r1++;
            r2 = 0;

            arr2[r1] = [];
        }

        arr2[r1][r2++] = data[i];
    });

    // console.log(arr2);

    var data_c_rie = [];

    $.each(arr2,function( i,item ) {
        data_c_rie.push(
        {
            label: arr2[i][0].label,
            name: label_str + arr2[i][0].label,
            type: "line",
            markerSize: 6,
            showInLegend: "true",
            yValueFormatString: "#,##0.0\"%\"",
            dataPoints: covertDataJsonXY(arr2[i])
        }
        );
    });

    function covertDataJsonXY(data) {
        $.each(data,function( i,item ) {
            item.x = new Date(item.x);
            item.y = parseFloat(item.y);
        });

        return data;
    }

    return data_c_rie
}

$("#btn_export_sum_cluster").click(function() {
    window.open("app_xport_data.aspx?xport=SUMMARY&level=ROarea10&type=" + temp_type + "&area=" + temp_e_ro);
});

$("#btn_export_sum_province").click(function() {
    window.open("app_xport_data.aspx?xport=SUMMARY&level=CLUSTER&type=" + temp_type + "&area=" + temp_e_cluster);
});
$("#btn_export_sum_shop").click(function() {
    window.open("app_xport_data.aspx?xport=SUMMARY&level=PROVINCE&type=" + temp_type + "&area=" + temp_e_province);
});

$("#btn_export_accam_cluster").click(function() {
    window.open("app_xport_data.aspx?xport=ACCUMULATE&level=ROarea10&type=" + temp_type + "&area=" + temp_e_ro);
});

$("#btn_export_accam_province").click(function() {
    window.open("app_xport_data.aspx?xport=ACCUMULATE&level=CLUSTER&type=" + temp_type + "&area=" + temp_e_cluster);
});
$("#btn_export_accam_shop").click(function() {
    window.open("app_xport_data.aspx?xport=ACCUMULATE&level=PROVINCE&type=" + temp_type + "&area=" + temp_e_province);
});

function clearChartCluster() {
    temp_e_ro = '';
    var div_clear = "<div class='load_center'>กรุณาคลิก กราฟราย RO</div>";
    $('#chart_left_cluster').html(div_clear);
    $('#chart_line_useApp_cluster').html(div_clear);
}

function clearChartProvince() {
    temp_e_cluster = '';
    var div_clear = "<div class='load_center'>กรุณาคลิก กราฟราย Cluster</div>";
    $('#chart_right_province').html(div_clear);
    $('#chart_left_province').html(div_clear);
    $('#btn_export_sum_province').hide();
    $('#btn_export_accam_province').hide();
}

function clearChartShop() {
    temp_e_province = '';
    var div_clear = "<div class='load_center'>กรุณาคลิก กราฟรายจังหวัด</div>";
    $('#container_chart_shop').hide();
    $('#chart_right_shop').html(div_clear);
    $('#chart_left_shop').html(div_clear);
    $('#btn_export_sum_shop').hide();
    $('#btn_export_accam_shop').hide();
}

function chartLoading(div) {
    $('#'+div).html("<div class='load_center'><span class='glyphicon glyphicon-refresh gly-spin'></span></div>");
}

function scrollDiv(div) {
    if(dont_scroll == 0){
        $('html, body').animate({scrollTop: $('#'+div).offset().top -100}, 500);
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

function zoomIn()
{
    var Page = document.getElementById('swipezone');
    var zoom = parseInt(Page.style.zoom) + 10 +'%'
    Page.style.zoom = zoom;
    return false;
}
 
function zoomOut()
{
    var Page = document.getElementById('swipezone');
    var zoom = parseInt(Page.style.zoom) - 10 +'%'
    Page.style.zoom = zoom;
    return false;
}


function setDaysInterval(days) {
    var OneDay = 24 * 3600 * 1000;
    return OneDay*days;
}

function setPointStart(dtm) {
    var data_start_y = parseInt(Highcharts.dateFormat('%Y', dtm));
    var data_start_m = parseInt(Highcharts.dateFormat('%m', dtm)) - 1;
    var data_start_d = parseInt(Highcharts.dateFormat('%d', dtm));

    return Date.UTC(data_start_y, data_start_m, data_start_d);
}

function fixDecimal(num_fix, num_in){
    if(num_fix == 1) {
        return parseFloat(Math.round(num_in * 10) / 10).toFixed(num_fix);  
    }
    else if(num_fix == 2) {
        return parseFloat(Math.round(num_in * 100) / 100).toFixed(num_fix);  
    }
    else if(num_fix == 3) {
        return parseFloat(Math.round(num_in * 1000) / 1000).toFixed(num_fix);  
    }
    else if(num_fix == 4) {
        return parseFloat(Math.round(num_in * 10000) / 10000).toFixed(num_fix);  
    }
    else {
        return num_in;
    }
}

function getStrYYMM(yymm, def) {
    if(yymm == ""){
        return def;
    }
    else {
        return monthsShort[parseInt(yymm.substring(2,4)) - 1] + ' 20' + yymm.substring(0,2);
    }
}

function getStrMMYYYY(mm, yyyy, def) {
    if(mm == "" || yyyy == ""){
        return def;
    }
    else {
        return monthsShort[parseInt(mm) - 1] + ' ' + yyyy;
    }
}

function findMax(max, num) {
    if (max < num) {
        max = num;
    }
    
    return max;
}

function findMin(min, num) {
    if (min > num) {
        min = num;
    }
    
    return min;
}

function calPercent(num1, num2) {
    return (num1 * 100)/num2;
}

function full_table(cls) {
    $('.full-tr-'+cls).hide();
    $('.hide-tr-'+cls).show();
}

function hide_table(cls) {
    $('.hide-tr-'+cls).hide();
    $('.full-tr-'+cls).show();
}

function simple_moving_averager(period) {
    var nums = [];
    return function(num) {
        nums.push(num);

        if (nums.length > period)
            nums.splice(0,1);  // remove the first element of the array
        
        var sum = 0;
        for (var i in nums)
            sum += nums[i];

        var n = period;
        if (nums.length < period)
            n = nums.length;

        return(sum/n);
    }
}

function addDays(date, days) {
  const copy = new Date(Number(date))
  copy.setDate(date.getDate() + days)
  return copy
}

function ddmmyyyyDate(dtd){
    var x_dtd = new Date(dtd);

    var dd = x_dtd.getDate();
    var mm = x_dtd.getMonth() + 1;
    var yyyy = x_dtd.getFullYear();

    if(dd<10){
        dd='0'+dd
    } 

    if(mm<10){
        mm='0'+mm
    } 

    return dd+'/'+mm+'/'+yyyy;
}

function mmyyyyStr(dtd){
    var x_dtd = new Date(dtd);

    var mm = x_dtd.getMonth();
    var yyyy = x_dtd.getFullYear();

    return monthsShort[mm]+' '+yyyy;
}
 

// ********************* example *********************

// var sma3 = simple_moving_averager(3);
// var sma5 = simple_moving_averager(5);
// var data = [1,2,3,4,5,5,4,3,2,1];

// for (var i in data) {
//     var n = data[i];
//     console.log("Next number = " + n + ", SMA_3 = " + sma3(n) + ", SMA_5 = " + sma5(n));
// }
