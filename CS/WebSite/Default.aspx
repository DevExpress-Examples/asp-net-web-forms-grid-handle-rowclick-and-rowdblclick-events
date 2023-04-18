<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ClickTrick._Default" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
        var doProcessClick;
        var index;
        function ProcessClick() {
            if (doProcessClick) {
                alert(`Here is the RowClick action in the ${index.toString()} row.`);
            }
        }
        function OnRowClick(s, e) {
            doProcessClick = true;
            index = e.visibleIndex + 1;
            window.setTimeout(ProcessClick, 500);
        }

        function OnRowDblClick(s, e) {
            doProcessClick = false;
            var key = s.GetRowKey(e.visibleIndex);
            alert(`Here is the RowDoubleClick action in the row with the key = ${key}.`);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="CategoryID">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1" />
                    <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2" />
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <Styles>
                    <FocusedRow BackColor="#C0FFC0" ForeColor="Black" />
                </Styles>
                <ClientSideEvents RowClick="OnRowClick" RowDblClick="OnRowDblClick" />
            </dx:ASPxGridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>
        </div>
    </form>
</body>
</html>

