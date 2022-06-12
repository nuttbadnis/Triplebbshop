var tmp_notation_shop_code,tmp_notation_date;

function updateNotation(){
    $('#modal_notation').modal('hide');

    $('#modal_notation').on('hidden.bs.modal', function (e) {
        $(this).off('hidden.bs.modal');
        window.open("updateNotation.aspx?shop_code=" + tmp_notation_shop_code + "&date=" + tmp_notation_date);
    })

}

function modalNotation(shop_code, date, current = 0){
    tmp_notation_shop_code = shop_code;
    tmp_notation_date = date.replace(/\//g, "-");

    var url1 = "updateStockShopJson.aspx?qrs=loadAllNoteByDate&shop_code=" + shop_code + "&date=" + tmp_notation_date;
    var url2 = "updateStockShopJson.aspx?qrs=loadNotationByDate&shop_code=" + shop_code + "&date=" + tmp_notation_date;

    if( current == 1) {
        url1 = "updateStockShopJson.aspx?qrs=loadAllNoteByCurentDate&shop_code=" + shop_code + "&date=" + tmp_notation_date;
    }

    console.log("when " + url1 + " " + url2);
    $.when( 
        $.ajax({url:url1, cache:false, dataType:"json", timeout:60000 }), 
        $.ajax({url:url2, cache:false, dataType:"json", timeout:60000 }) 
        ).done(function( data1, data2 ) {
            var ul_note = "<li>ไม่มีหมายเหตุ</li>";
            var ul_notation = "ไม่มีโน๊ตเพิ่มเติม";
            $('.have-notation').hide();

            if(data1[0].length > 0){
                ul_note = data1[0][0].all_note;
            }

            if(data2[0].length > 0){
                ul_notation = data2[0][0].notation_desc;

                $('.have-notation').show();
                $('#ul_notation_type').html(data2[0][0].notation_type_name);

                if(data2[0][0].open_accident == 1){
                    $('#ul_open_accident').show();
                }
                else {
                    $('#ul_open_accident').hide();
                }

                if(data2[0][0].close_accident == 1){
                    $('#ul_close_accident').show();
                }
                else {
                    $('#ul_close_accident').hide();
                }
            }

            $('#ul_note').html(ul_note);
            $('#ul_notation').html(ul_notation);
            $('#title_notation').html(shop_code + " โน๊ตประจำวันที่ " + date);
            $('#modal_notation').modal("show");
    });
}