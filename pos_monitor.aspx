<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pos_monitor.aspx.vb" Inherits="pos_monitor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>POS monitor</title>

	<link type="text/css" rel="stylesheet" href="App_Inc/reset.css" />
	<script src="App_Inc/jquery-1.11.3.min.js"></script>

	<link rel="stylesheet" href="App_Inc/bootstrap/css/bootstrap.css" />
	<script src="App_Inc/bootstrap/js/bootstrap.js"></script>

	<style type="text/css">
		.button-a {
			color: red;
			font-size: 18px;
			margin-left: 5px;
			cursor: pointer;
		}

		.button-a:hover {
			color: rgb(171, 0, 0);
		}
	</style>
</head>
<body>	
	<div class="container" style="width: 500px;">
		<div class="table" id="table_pos_monitor" runat="server"></div>
		<hr>

		<form method="post" runat="server" class="form-inline">
			<div class="form-group">
				<input runat="server" id="txt_shop_code" type="text" class="form-control" placeholder="SHOP CODE" style="text-transform:uppercase">
			</div>
			<div class="form-group">
				<input runat="server" id="txt_remark" type="text" class="form-control" placeholder="REMARK">
			</div>
			<button runat="server" OnServerClick="Submit_Save" type="submit" class="btn btn-default btn-warning">ADD</button>
			
			<input runat="server" id="hide_shop_code" type="hidden">
			<button runat="server" id="delclick" OnServerClick="Submit_Del" type="submit" style="display:none;">DEL</button>
		</form>
		<hr>
	</div>

<script type="text/javascript">
function fnDel(shop_code) {
	if(confirm('ต้องการลบ?')) {
		document.getElementById("hide_shop_code").value = shop_code;
		document.getElementById("delclick").click();
	}
}
</script>
</body>
</html>
