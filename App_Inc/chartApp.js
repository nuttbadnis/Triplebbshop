
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
    });
}

function notifyBar() {
    var noti_msg = "";
    if(temp_e_ro == ""){
        noti_msg += "<b>RO:</b> ALL";
    }
    else {
        noti_msg += "<b>RO:</b> " + temp_e_ro;
    }
    noti_msg += " ";
    if(temp_e_cluster == ""){
        noti_msg += "<b>CLUSTER:</b> ALL";
    }
    else {
        noti_msg += "<b>CLUSTER:</b> " + temp_e_cluster;
    }
    noti_msg = "กำลังแสดงข้อมูล " + noti_msg + "";

    $('#sess_param').html(noti_msg);
    $('#sess_param').fadeIn();
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
    modalAlert("ไม่ให้ใช้ได้เพิ่ม กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
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