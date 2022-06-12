var mainurl = window.location.protocol + "//" + window.location.host + "/";
var pathArray = window.location.pathname.split( '/' );
mainurl = mainurl + pathArray[1] + "/";

var temp_table;
var col_area = true;

function callDataTable(table = '#table_user'){
    if (col_area == true) {
        temp_table = $(table).dataTable({
            paging: false,
            "iDisplayLength": -1,
            "bLengthChange": false,
            "order": [[ 0, "asc" ], [ 1, "asc" ], [ 2, "asc" ], [ 3, "asc" ]]
        });
    }
    else {
        temp_table = $(table).dataTable({
            paging: false,
            "iDisplayLength": -1,
            "bLengthChange": false,
            "order": [[ 0, "asc" ]]
        });
    }
}

function loadData(reload = false, authen_id = '', uemail = '', new_id = ''){
    if( $('#hide_upermiss').val() == $('#hide_this_edit_by').val() ){
         $('#btn_new').show();
    }

    var url = mainurl + "userJson.aspx?qrs=loadData&permission_id=" + $('#hide_this_edit').val();
    console.log(url);

    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        timeout: 60000,
        success: function(data) { 
            if(data.length > 0) {
                var txt_html = "<div id='display_table'>" +
                "<table id='table_user' class='table table-striped table-bordered table-report' cellspacing='0' width='100%'>" +
                "<thead>" +
                "<tr>";
                if (col_area == true) {
                    txt_html += "" +
                    "<th>RO</th> " +
                    "<th>CLUSTER</th> " +
                    "<th>PROVINCE</th> ";
                }
                txt_html += "" +
                "<th>UEMAIL</th> " +
                "<th></th> " +
                "<th></th> " +
                "<th></th> " +
                "<th></th> " +
                "<th></th> " +
                "</tr>" +
                "</thead>" +
                "<tbody>";

                $.each(data,function( i,item ) {
                    txt_html += "<tr id='" + item.authen_id + "'>"
                    if (col_area == true) {
                        txt_html += "<td>" + item.ro + "</td>"
                        txt_html += "<td>" + item.cluster + "</td>"
                        txt_html += "<td>" + item.province + "</td>"
                    }
                    txt_html += "<td>" + item.uemail + "</td>"
                    txt_html += "<td>" + item.jas_employeeId + "</td>"
                    txt_html += "<td>" + item.jas_thaiFullname + "</td>"
                    txt_html += "<td>" + item.jas_position + "</td>"
                    txt_html += "<td>" + item.jas_department + "</td>"

                    if( $('#hide_upermiss').val() == $('#hide_this_edit_by').val() ){
                        txt_html += "<td align='center' width='120'>"
                        txt_html += "<button title='อัพเดทข้อมูลพนักงาน' type='button' class='btn btn-info btn-sm' onclick='reSyncJas(\"" + item.authen_id + "\", \"" + item.uemail + "\")'><span class='glyphicon glyphicon-refresh'></span></button> "
                        txt_html += "<button title='แก้ไขสิทธิ์' type='button' class='btn btn-warning btn-sm' onclick='editUser(\"" + item.emp_id + "\", \"" + item.authen_id + "\", \"" + item.uemail + "\", \"" + item.ro + "\", \"" + item.cluster + "\", \"" + item.province + "\")'><span class='glyphicon glyphicon-edit'></span></button> "
                        txt_html += "<button title='ลบสิทธิ์' type='button' class='btn btn-danger btn-sm' onclick='removeConfirm(\"" + item.authen_id + "\", \"" + item.uemail + "\")')'><span class='glyphicon glyphicon-remove'></span></button>"
                        txt_html += "</td>"
                    }
                    else {
                        txt_html += "<td align='center' width='40'>"
                        txt_html += "<button title='อัพเดทข้อมูลพนักงาน' type='button' class='btn btn-info btn-sm' onclick='reSyncJas(\"" + item.authen_id + "\", \"" + item.uemail + "\")'><span class='glyphicon glyphicon-refresh'></span></button> "
                        txt_html += "</td>"
                    }
                    txt_html += "</tr>"
                });

                txt_html += "</tbody>" +
                "</table>" +
                "</div>";

                $('#display_table').replaceWith(txt_html);
                callDataTable('#table_user');

                if (reload == true) {
                    reSyncJas(authen_id, uemail, new_id)
                }
            }
        },
        error: function(x, t, m) {
            console.log('x>' + x + ' t>' + t + ' m>' + m);

            ajaxError();
        }
    });
}

function reSyncJas(authen_id, uemail, new_id = ''){
    var url = mainurl + "userJson.aspx?qrs=reSyncJas";

    if($('#hide_token').val().length > 0) {
        $.ajax({
            url: url,
            type: "post",
            timeout: 60000,
            cache: false,
            data: { 
                token: $('#hide_token').val(),
                uemail: uemail
            },
            success: function( res ) {
                if(res > 0){
                    reLoadUser(authen_id, new_id);
                }
                else
                    modalAlert('ไม่สำเร็จ');
            },
            error: function(x, t, m) {
                ajaxError()
            }
        });
    }
    else {
        modalAlert('กรุณา Log in เข้าสู่ระบบ');
    }
}

function reLoadUser(authen_id, new_id = ''){
    var url = mainurl + "userJson.aspx?qrs=loadUserByID&authen_id=" + authen_id + "&new_id=" + new_id + "&permission_id=" + $('#hide_this_edit').val();
        console.log(url);

        $.ajax({
            url: url,
            dataType: "json",
            timeout: 60000,
            cache:false,
            success: function( data ) { 
                if(data.length > 0){
                    var vTr = "";
                    vTr += "<tr id='" + data[0].authen_id + "' class='just-update'>"
                    if (col_area == true) {
                        vTr += "<td>" + data[0].ro + "</td>"
                        vTr += "<td>" + data[0].cluster + "</td>"
                        vTr += "<td>" + data[0].province + "</td>"
                    }
                    vTr += "<td>" + data[0].uemail + "</td>"
                    vTr += "<td>" + data[0].jas_employeeId + "</td>"
                    vTr += "<td>" + data[0].jas_thaiFullname + "</td>"
                    vTr += "<td>" + data[0].jas_position + "</td>"
                    vTr += "<td>" + data[0].jas_department + "</td>"

                    if( $('#hide_upermiss').val() == $('#hide_this_edit_by').val() ){
                        vTr += "<td align='center' width='120'>"
                        vTr += "<button title='อัพเดทข้อมูลพนักงาน' type='button' class='btn btn-sm' disabled><span class='glyphicon glyphicon-refresh'></span></button> "
                        vTr += "<button title='แก้ไขสิทธิ์' type='button' class='btn btn-warning btn-sm' onclick='editUser(\"" + data[0].emp_id + "\", \"" + data[0].authen_id + "\", \"" + data[0].uemail + "\", \"" + data[0].ro + "\", \"" + data[0].cluster + "\", \"" + data[0].province + "\")'><span class='glyphicon glyphicon-edit'></span></button> "
                        vTr += "<button title='ลบสิทธิ์' type='button' class='btn btn-danger btn-sm' onclick='removeConfirm(\"" + data[0].authen_id + "\", \"" + data[0].uemail + "\")')'><span class='glyphicon glyphicon-remove'></span></button>"
                        vTr += "</td>"
                    }
                    else {
                        vTr += "<td align='center' width='40'>"
                        vTr += "<button title='อัพเดทข้อมูลพนักงาน' type='button' class='btn btn-sm' disabled><span class='glyphicon glyphicon-refresh'></span></button> "
                        vTr += "</td>"
                    }
                    vTr += "</tr>"

                    $('#' + data[0].authen_id).replaceWith(vTr);
                    $('html, body').animate({scrollTop:$('#' + data[0].authen_id).position().top}, 'slow');
                }
            },
            error: function(x, t, m) {
                console.log('x>' + x + ' t>' + t + ' m>' + m);
                ajaxError();
            }
        });
}

function newUser(){
    $('#hide_id').val("");
    $('#hide_new_id').val("");
    $('#hide_new_uemail').val("");
    $('#auto_uemail').val("");
    $('#sel_ro').val("ALL");
    $('#sel_cluster').val("ALL");
    $('#sel_province').val("ALL");
    $('#sel_cluster').prop('disabled', true);
    $('#sel_province').prop('disabled', true);

    $('#modal_title').html("เพิ่ม User ใหม่");
    $('#auto_uemail').attr('disabled', false);
    $('#btn_save_edit').hide();
    $('#btn_save_new').show();
    $('#modal_edit').modal("show");
}

function editUser(emp_id, authen_id, uemail, ro, cluster, province){
    $('#sel_cluster').prop('disabled', true);
    $('#sel_province').prop('disabled', true);

    $('#hide_id').val(authen_id);
    $('#hide_new_id').val(emp_id);
    $('#hide_new_uemail').val(uemail);
    $('#auto_uemail').val(uemail);
    $('#sel_ro').val(ro);
    loadCluster('#sel_cluster', ro, cluster);
    loadProvince('#sel_province', cluster, province);

    $('#modal_title').html("แก้ไขข้อมูล  User");
    $('#auto_uemail').attr('disabled', true);
    $('#btn_save_new').hide();
    $('#btn_save_edit').show();
    $('#modal_edit').modal("show");
}

function loadRO(id, ro = "ALL") {
    var $el = $(id);
    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("กำลังโหลด"));

    $.getJSON(mainurl + 'userJson.aspx?qrs=loadRO', function(data) {
        $el.empty();
        $el.append($("<option></option>")
            .attr("value", "ALL").text("ALL"));

        $.each(data,function( i,item ) {
            $el.append($("<option></option>")
                .attr("value", item.ro).text(item.ro_name));
        });

        $el.val(ro);
    });
}

function loadCluster(id, ro, cluster = "ALL") {
    var $el = $(id);
    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("กำลังโหลด"));

    $.getJSON(mainurl + 'userJson.aspx?qrs=loadCluster&ro=' + ro, function(data) {
        $el.empty();
        $el.append($("<option></option>")
            .attr("value", "ALL").text("ALL"));
            // .attr("value", "ALL").text("ALL RO" + ro));

        $.each(data,function( i,item ) {
            $el.append($("<option></option>")
                .attr("value", item.cluster).text(item.cluster));
        });

        if(ro != "ALL"){
            $el.val(cluster);
            $el.prop('disabled', false);
        }
    });
}

function loadProvince(id, cluster, province = "ALL") {
    var $el = $(id);
    $el.empty();
    $el.append($("<option></option>")
        .attr("value", "").text("กำลังโหลด"));

    $.getJSON(mainurl + 'userJson.aspx?qrs=loadProvince&cluster=' + cluster, function(data) {
        $el.empty();
        $el.append($("<option></option>")
            .attr("value", "ALL").text("ALL"));

        $.each(data,function( i,item ) {
            $el.append($("<option></option>")
                .attr("value", item.province_short).text(item.province_name));
        });

        if(cluster != "ALL"){
            $el.val(province);
            $el.prop('disabled', false);
        }
    });
}

$('#sel_ro').change(function() {
    var sel_ro = $(this).val();
    var sel_cluster = '#sel_cluster';
    var sel_province = '#sel_province';

    if(sel_ro != "ALL") {
        loadCluster(sel_cluster, sel_ro);
    }
    else {
        $(sel_cluster).val("ALL");
        $(sel_cluster).prop('disabled', true);
        $(sel_province).val("ALL");
        $(sel_province).prop('disabled', true);
    }
});

$('#sel_cluster').change(function() {
    var sel_cluster = $(this).val();
    var sel_province = '#sel_province';

    if(sel_cluster != "ALL") {
        loadProvince('#sel_province', sel_cluster);
    }
    else {
        $(sel_province).val("ALL");
        $(sel_province).prop('disabled', true);
    }
});


////////////////////////// autocomplete /////////////////////////////////

// $('#auto_uemail').on('autocompleteselect', function (e, ui) {
//     ajaxcheckEmpPermiss(ui.item.value, function(res){
//         if(res == 0 || $('#hide_new_uemail').val() == ui.item.value){
//             $('#hide_new_uemail').val(ui.item.value);
//             $('#hide_new_id').val(ui.item.newid);
//         }
//         else{
//             modalAlert("ไม่สามารถเลือกได้ เนื่องจากมี " + ui.item.value + " ในระบบแล้ว");
//         }
//     });

//     function ajaxcheckEmpPermiss(uemail, handleData) {
//         var url = mainurl + "userJson.aspx?qrs=checkEmpPermiss&uemail=" + uemail + "&permission=" + $('#hide_this_edit').val();
//         console.log(url)
//         $.ajax({
//             url: url,
//             cache: false,
//             success: function( res ) {
//                 handleData(res); 
//             }
//         });
//     }
// });

$('#auto_uemail').on('autocompleteselect', function (e, ui) {
    ajaxcheckEmpPermiss(ui.item.value, function(data){
        if(data.length == 0 || $('#hide_new_uemail').val() == ui.item.value){
            $('#hide_new_uemail').val(ui.item.value);
            $('#hide_new_id').val(ui.item.newid);
        }
        else{
            if (typeof $('#hide_confirm_new_uemail').val() != 'undefined') {
                $('#hide_confirm_new_uemail').val(ui.item.value);
                $('#hide_confirm_new_id').val(ui.item.newid);
                confirmPermiss(data);
            }
            else{
                modalAlert("ไม่สามารถเลือกได้ เนื่องจากมี " + ui.item.value + " ในระบบแล้ว");
            }
        }
    });

    function ajaxcheckEmpPermiss(uemail, handleData) {
        var url = mainurl + "userJson.aspx?qrs=checkEmpPermissJson&uemail=" + uemail + "&permission=" + $('#hide_this_edit').val();
        console.log(url)
        $.ajax({
            url: url,
            cache: false,
            dataType: "json",
            success: function( data ) {
                handleData(data); 
            }
        });
    }

    function confirmPermiss(data) {
        var txt_permiss;
        txt_permiss = "<b class='txt-red'>กรุณาตรวจสอบ และยืนยันหากต้องการเพิ่มสิทธิ์</b>";
        txt_permiss += "<br>"
        txt_permiss += "<br>"
        txt_permiss += "<b class='txt-blue'>สิทธิ์ปัจจุบันของ: " + data[0].uemail + " (" + data[0].jas_thaiFullname + ")</b>";
        txt_permiss += "<br>"

        txt_permiss += "<table class='table'>"
        txt_permiss += "<thead>"
        txt_permiss += "<tr>"
        txt_permiss += "<th>RO</th>"
        txt_permiss += "<th>CLUSTER</th>"
        txt_permiss += "<th>PROVINCE</th>"
        txt_permiss += "</tr>"
        txt_permiss += "</thead>"

        txt_permiss += "<tbody>"
        $.each(data,function( i,item ) {
            txt_permiss += "<tr>"
            txt_permiss += "<td>" + item.ro + "</td>"
            txt_permiss += "<td>" + item.cluster + "</td>"
            txt_permiss += "<td>" + item.province + "</td>"
            txt_permiss += "</tr>"
        });
        txt_permiss += "</tbody>"
        txt_permiss += "</table>"


        $('#txt_permiss').html(txt_permiss);
        $('#modal_permiss_confirm').modal("show");
    }
});

$('#btn_permiss_confirm').click(function(){
    $('#hide_new_uemail').val($('#hide_confirm_new_uemail').val());
    $('#hide_new_id').val($('#hide_confirm_new_id').val());
    $('#auto_uemail').val($('#hide_new_uemail').val());
    $('#modal_permiss_confirm').modal("hide");
});

$('#auto_uemail').click(function(){
    $('#auto_uemail').val("");
});

$('#auto_uemail').focusout(function() {
    $('#auto_uemail').val("");

    if($('#hide_new_uemail').val().trim().length > 0){
        $('#auto_uemail').val($('#hide_new_uemail').val());
    }
});

$('#auto_uemail').autocomplete({
    minLength: 3,
    focus: function(event, ui) {
        event.preventDefault();
        $("#auto_uemail-search").val(ui.item.label);
    },
    source: function( request, response ) {
        source_auto_emp(request, response);
    }
});

function source_auto_emp(request, response) {
    var url = mainurl + "userJson.aspx?qrs=autoEmp&kw=" + request.term + "&token=" + $('#hide_token').val();
    console.log(url)
    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        success: function( data ) {
            response( $.map( data, function( item ) {
                return {
                    newid: item.employeeId,
                    label: item.email.replace("@jasmine.com", "") + " / " + item.thaiFullname + " / " + item.position + " / " + item.department,
                    value: item.email.replace("@jasmine.com", "")
                }
            }));
        },
        error: function() {
            console.log("autocomplete fail!!");
            $('#page_loading').fadeOut();
        }
    });
}

////////////////////////// autocomplete /////////////////////////////////

function removeConfirm(id, uemail){
    $('#user_remove').html(uemail);
    $('#modal_confirm').modal("show");
    $('#btn_remove').replaceWith("<button type='button' data-dismiss='modal' class='btn btn-danger' id='btn_remove' onclick='removeUPermiss(\"" + id + "\");'>ใช่</button>");
}

function removeUPermiss(authen_id) {
    $.ajax({
        url: mainurl + "userJson.aspx?qrs=removeUPermiss",
        cache: false,
        type: "post",
        timeout: 60000,
        data: {  
            permission: $('#hide_this_edit').val(),
            update_by: $('#hide_uemail').val(),
            authen_id: authen_id
        },
        success: function( res ) {
            // alert(res);
            if(res > 0) {
                $('html, body').animate({scrollTop:$('#'+authen_id).position().top}, 'slow');
                $('#'+authen_id).addClass('txt-red');
                $('#'+authen_id).hide(1000);

                setTimeout(function() {
                    // reLoadPage();
                    loadData();
                }, 1000);
            }
            else {
                modalAlert('ไม่สำเร็จ');
            }
        },
        error: function(x, t, m) {
            ajaxError();
        }
    });
}

function saveNewUPermiss() {
    var new_id = $('#hide_new_id').val();
    var uemail = $('#hide_new_uemail').val();
    var ro = $('#sel_ro').val();
    var cluster = $('#sel_cluster').val();
    var province = $('#sel_province').val();

    if(new_id.length > 0 && uemail.length > 0 && ro.length > 0 && cluster.length > 0 && province.length > 0){
        $.ajax({
            url: mainurl + "userJson.aspx?qrs=saveNewUPermiss",
            cache: false,
            type: "post",
            timeout: 60000,
            data: {  
                permission: $('#hide_this_edit').val(),
                create_by: $('#hide_uemail').val(),
                uemail: uemail,
                new_id: new_id,
                ro: ro,
                cluster: cluster,
                province: province
            },
            success: function( res ) {
                if(res > 0) {
                    $('#modal_edit').modal("hide");
                    loadData(true, '', uemail, new_id);
                }
                else {
                    modalAlert('ไม่สำเร็จ');
                }
            },
            error: function(x, t, m) {
                ajaxError();
            }
        });
    }
    else {
        modalAlert("กรุณากรอกข้อมูลให้ครบถ้วน!!");
    }
}

function saveEditUPermiss() {
    var emp_id = $('#hide_new_id').val();
    var authen_id = $('#hide_id').val();
    var uemail = $('#hide_new_uemail').val();
    var ro = $('#sel_ro').val();
    var cluster = $('#sel_cluster').val();
    var province = $('#sel_province').val();

    if(authen_id.length > 0 && uemail.length > 0 && ro.length > 0 && cluster.length > 0 && province.length > 0){
        $.ajax({
            url: mainurl + "userJson.aspx?qrs=saveEditUPermiss",
            cache: false,
            type: "post",
            timeout: 60000,
            data: {  
                permission: $('#hide_this_edit').val(),
                update_by: $('#hide_uemail').val(),
                uemail: uemail,
                authen_id: authen_id,
                ro: ro,
                cluster: cluster,
                province: province,
                emp_id: emp_id,
            },
            success: function( res ) {
                if(res > 0) {
                    $('#modal_edit').modal("hide");
                    loadData(true, authen_id, uemail);
                }
                else {
                    modalAlert('ไม่สำเร็จ');
                }
            },
            error: function(x, t, m) {
                ajaxError();
            }
        });
    }
    else {
        modalAlert("กรุณากรอกข้อมูลให้ครบถ้วน!!");
    }
}

function reLoadPage(){
    location.reload();
}