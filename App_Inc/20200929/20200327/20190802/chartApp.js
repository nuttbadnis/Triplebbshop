
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

            $.notify({
                icon: 'glyphicon glyphicon-floppy-save',
                message: "Session Push: " + temp_e_ro,
            },
            {
                delay: 500,
            });
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

function scrollDiv(div) {
    if(dont_scroll == 0){
        $('html, body').animate({scrollTop:  $(div).offset().top -100}, 500);
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