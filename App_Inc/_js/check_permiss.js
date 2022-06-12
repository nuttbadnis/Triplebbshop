

function checkListAdmin() {
	console.log('checkListAdmin');
	var url = "json_default.aspx?qrs=checkListAdmin&uemail=" + $('#hide_uemail').val();
	console.log(url);

	$.ajax({
		url: url,
		cache: false,
		dataType: "json",
		timeout: 60000,
		success: function( data ) { 
			if (data.length > 0) {
				// $('#hide_upermiss').val(data[0].permission_id);
				startLoadPage();
			}
			else{
				modalAlert("คุณไม่สิทธิ์ใช้งาน<br>กรุณาติดต่อ support_pos@jasmine.com");
				$('#modal_alert').on('hidden.bs.modal', function (e) {
					window.location = "default.aspx";
				})
			}
		},
		error: function(x, t, m) {
			console.log('ajax error /n x>' + x + ' t>' + t + ' m>' + m);
		}
	});
}

function getCheckListPermissUser(request_id) {
	var url = "json_default.aspx?qrs=getCheckListPermissUser&shop_code=" + request_id;
	console.log(url);

	$.ajax({
		url: url,
		dataType: "json",
		timeout: 60000,
		cache:false,
		success: function( data ) { 
			$('.td-reset').html("");
			$('#txt_req_id').html(request_id);
			$('#modal_checklist_user').modal("show");

			$.each(data,function( i,item ) {
				$('#td_' + item.permission).append('<span class="badge badge-user">' + item.uemail + '</span> ')
			});
		},
		error: function(x, t, m) {
			console.log('x>' + x + ' t>' + t + ' m>' + m);
			modalAlert('ajax fail!');
		}
	});

}