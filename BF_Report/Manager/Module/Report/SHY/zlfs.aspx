<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zlfs.aspx.cs" Inherits="BF_Report.Manager.Module.Report.SHY.zlfs" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Label ID="Label1" runat="server" Text="单元号"></asp:Label>
        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.String"  OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged" >
            <Items>
                <dx:ListEditItem Text=" " Value=" " />
                <dx:ListEditItem Text="1#石灰窑" Value="SH" />
                <dx:ListEditItem Text="2#石灰窑" Value="SN" />
            </Items>
        </dx:ASPxComboBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="指令号"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br /><br />
        
        <asp:Label ID="Label3" runat="server" Text="喷煤量"></asp:Label>
        
        <asp:TextBox ID="TextBox2" runat="server" Width="79px"></asp:TextBox><br /><br />
        
        <asp:Label ID="Label4" runat="server" Text="班  别     "></asp:Label>     
        
        <asp:TextBox ID="TextBox3" runat="server" Width="80px"></asp:TextBox><br /><br />
        
        <asp:Label ID="Label5" runat="server" Text="发送时间"></asp:Label>
        
        <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server">
        </dx:ASPxDateEdit><br /> 
        <asp:Label ID="Label6" runat="server" Text="发送人"></asp:Label>
       
        
        <asp:TextBox ID="TextBox4" runat="server" Width="123px"></asp:TextBox><br /> <br />
       
        
        <asp:Button ID="Button1" runat="server" Text="发送" OnClick="Button1_Click" />
       
        
    </form>
</body>
</html>

