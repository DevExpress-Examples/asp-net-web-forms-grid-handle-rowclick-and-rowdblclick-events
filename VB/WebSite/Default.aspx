<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ClickTrick._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ register Assembly="DevExpress.Web.ASPxEditors.v10.1" Namespace="DevExpress.Web.ASPxEditors"
	TagPrefix="dxe" %>

<%@ register Assembly="DevExpress.Web.ASPxGridView.v10.1" Namespace="DevExpress.Web.ASPxGridView"
	TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Untitled Page</title>
	<script type="text/javascript">
	  var doProcessClick;
	  var visibleIndex;
	  function ProcessClick()
	  {
		if (doProcessClick)
		{
		   alert("Here is the RowClick action in the "+visibleIndex.toString()+"-th row" );

		}
	  }
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dxwgv:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="CategoryID">
			<settingsbehavior AllowFocusedRow="True" />
			<clientsideevents RowClick="function(s, e) {
	doProcessClick = true;
	visibleIndex = e.visibleIndex+1;
	window.setTimeout(ProcessClick,500);
}" RowDblClick="function(s, e) {
	doProcessClick = false;
	var key = s.GetRowKey(e.visibleIndex);
	alert('Here is the RowDoubleClick action in a row with the Key = '+key);
}" />
			<styles>
				<focusedrow BackColor="#C0FFC0" ForeColor="Black">
				</focusedrow>
			</styles>
			<columns>
				<dxwgv:gridviewdatatextcolumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
					<editformsettings Visible="False" />
				</dxwgv:gridviewdatatextcolumn>
				<dxwgv:gridviewdatatextcolumn FieldName="CategoryName" VisibleIndex="1">
				</dxwgv:gridviewdatatextcolumn>
				<dxwgv:gridviewdatatextcolumn FieldName="Description" VisibleIndex="2">
				</dxwgv:gridviewdatatextcolumn>
			</columns>
		</dxwgv:aspxgridview>
		<asp:accessdatasource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Categories]"></asp:accessdatasource>
	</div>
	</form>
</body>
</html>