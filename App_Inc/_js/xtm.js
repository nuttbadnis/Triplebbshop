var template_started = 1;
var template_count_request = 1;

function loadTemplateStarted(template_id, template_item_id = "") {
	var url = "ajax_xtm.aspx?qrs=SP_XTM_TEMPLATE_MAIN_CHK_STARTED&template_id=" + template_id + "&template_item_id=" + template_item_id;
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) {
			if(data.length > 0) {
				template_started = data[0].template_started;
				template_count_request = data[0].count_request;
			}
		},
		error: function(x, t, m) {
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);
		}
	});
}

function checkTemplateModify() {
	if (template_started > 0) {
		modalAlert("ไม่สามารถแก้ไขหรือปรับปรุง Template<br><b class='txt-red'>ที่ถึง \"วันที่เริ่มให้ตรวจสอบ\" แล้ว</b>");
		return 1;
	}
	else if (template_count_request > 0) {
		modalAlert("ไม่สามารถแก้ไขหรือปรับปรุง Template<br><b class='txt-red'>ที่มีสำเนาแล้ว</b>");
		return 1;
	}

	return 0;
}

function checkTemplateStarted() {
	if (template_started > 0) {
		modalAlert("ไม่สามารถแก้ไขหรือปรับปรุง Template<br><b class='txt-red'>ที่ถึง \"วันที่เริ่มให้ตรวจสอบ\" แล้ว</b>");
		return 1;
	}

	return 0;
}

function loadKiosDD() {
	var $el = $('#sel_storekiostype_in');

	$.getJSON('ajax_xtm.aspx?qrs=SP_load_storekiostype_xtm', function(data) {
		$el.empty();

		$.each(data,function( i,item ) {
			$el.append($("<option></option>")
				.attr("value", item.storeKiosType_id).text(item.storeKiosType_id + ". " + item.storeKiosType_name));
				// .attr('selected', true).attr("value", item.storeKiosType_id).text(item.storeKiosType_id + ". " + item.storeKiosType_name));
		});

		$el.multiselect({
			nonSelectedText: 'เลือกประเภทสำนักงาน'
			, allSelectedText: 'ทุกประเภทสำนักงาน'
			, includeSelectAllOption: true
			, selectAllText: 'ทุกประเภทสำนักงาน'
			, onDropdownHide: function(event) {
				if($el.val() === null){
					modalAlert("กรุณาเลือกประเภทสำนักงาน");
				} 
			}
		});

		$('#sel_kios_fake').hide();
		$el.show();

		loadPlaceDD();
	});
}

function loadPlaceDD() {
	var $el = $('#sel_storeplacetype_in');

	$.getJSON('ajax_xtm.aspx?qrs=SP_load_storeplacetype_xtm', function(data) {
		$el.empty();

		$.each(data,function( i,item ) {
			$el.append($("<option></option>")
				.attr("value", item.storeplacetype_id).text(item.storeplacetype_id + ". " + item.storeplacetype_name));
				// .attr('selected', true).attr("value", item.storeplacetype_id).text(item.storeplacetype_id + ". " + item.storeplacetype_name));
		});

		$el.multiselect({
			nonSelectedText: 'เลือกพื้นที่สำนักงาน'
			, allSelectedText: 'ทุกพื้นที่สำนักงาน'
			, includeSelectAllOption: true
			, selectAllText: 'ทุกพื้นที่สำนักงาน'
			, onDropdownHide: function(event) {
				if($el.val() === null){
					modalAlert("กรุณาเลือกพื้นที่สำนักงาน");
				} 
			}
		});

		$('#sel_place_fake').hide();
		$el.show();
	});

	checkListAdmin();
}

function loadKiosType(template_item_id, storekiostype_in) {
	var url = "ajax_xtm.aspx?qrs=SP_load_storekiostype_in&storekiostype_in=" + storekiostype_in;
	// console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			var txt_html = "";

			$.each(data,function( i,item ) {
				txt_html += "<span class='badge badge-type'>" + item.storeKiosType_name + "</span> ";
			});

			$('#sk_'+template_item_id).html(txt_html);
		},
		error: function(x, t, m) {
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);
		}
	});
}

function loadPlaceType(template_item_id, storeplacetype_in) {
	var url = "ajax_xtm.aspx?qrs=SP_load_storeplacetype_in&storeplacetype_in=" + storeplacetype_in;
	// console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			var txt_html = "";

			$.each(data,function( i,item ) {
				txt_html += "<span class='badge badge-type'>" + item.storeplacetype_name + "</span> ";
			});

			$('#sp_'+template_item_id).html(txt_html);
		},
		error: function(x, t, m) {
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);
		}
	});
}

function pathFileEx(template_id, filename, filedesc) {
	if(checkNotEmpty(filename)){
		filename = "FILE_EX/" + template_id + "/" + filename;

		return `
			<a href='` + filename + `' data-lightbox='grouped_image_ex' data-title='รูปตัวอย่าง (` + filedesc + `)'>
				<img onerror='imgError(this);' class='img-thumbnail max-w105' src='` + filename + `' title='คลิกดูรูปใหญ่'>
			</a>
		`;
	}
	else {
		return `<p>-</p>`;
	}
}

function imgError(image) {
	image.onerror = "";
	image.src = "../App_Inc/noimage.png";
	return true;
}

//------------------------------------------------------ ajax upload

function AjaxUploadSubmit() {
  // var file_prefix = "EX_" + _GET('item_id');
  var file_prefix = "EX_" + $('#hide_template_id').val();

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
    $('#hide_file_template_item_example').val(filename);
    submitSaveItem();
  }
  else {
    modalAlert("ไม่สำเร็จ (upload error) กรุณาลองอีกครั้ง หรือติดต่อ support_pos@jasmine.com");
  }
}

$('.check-pic-file').change(function() {
  var ext = this.value.split('.').pop().toLowerCase();

  if (ext != "png" && ext != "jpg" && ext != "jpeg") {
    modalAlert("กรุณาตรวจสอบประเภทไฟล์ <br>อนุญาติไฟล์รูปภาพเท่านั้น jpg, png");
    this.value = '';
  } 
  else {
    var maxsize = 1024*5;
    var filesize = this.files[0].size/1024;

    if(filesize > maxsize){
      modalAlert("ขนาดไฟล์สูงสุด ไม่เกิน 5MB");
      this.value = '';
    }
  }
});