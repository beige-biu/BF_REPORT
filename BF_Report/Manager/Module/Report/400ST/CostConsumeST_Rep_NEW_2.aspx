<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostConsumeST_Rep_NEW_2.aspx.cs" Inherits="BF_Report.Manager.Module.Report._400ST.CostConsumeST_Rep_NEW_2" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <script language="JavaScript" type="text/javascript">
        window.onload = function () {
            cbp_Base.PerformCallback(document.documentElement.clientHeight);
        }
        //操作
        function OnQueryClick(s, e) {
            try {
                cbp_Base.PerformCallback(document.documentElement.clientHeight);
            }
            finally {

                CollectGarbage();
            }
        }
    </script>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr style="background-color: cornflowerblue; font-size: 15pt;">
                    <td width="100%;" height="30px" align="center" valign="center">400烧结成本报表
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table style="width: 100%;" align="center" valign="top">
                            <tr style="background-color: lightblue;">
                                <td>
                                    <table style="width: 100%; height: 35px;" valign="center">
                                        <tr>
                                            <td width="60px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="日期:" Width="60px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="130px">
                                                <dx:ASPxDateEdit ID="dateStartTime" Font-Size="14px" runat="server" ClientInstanceName="dateStartTime"
                                                    EditFormatString="yyyy-MM-dd" Width="100px" CalendarProperties-ClearButtonText="清除"
                                                    CalendarProperties-TodayButtonText="当日">
                                                    <CalendarProperties ClearButtonText="清除" TodayButtonText="当日">
                                                    </CalendarProperties>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px" align="right">
                                                <dx:ASPxButton ID="btnQuery" Font-Size="14px" runat="server" Text="查询" AutoPostBack="false" Width="80px">
                                                    <ClientSideEvents Click="function(s,e){OnQueryClick();}" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px" align="right">
                                                <dx:ASPxButton ID="btnExp_Excel" Font-Size="14px" runat="server" Text="导出Excel" AutoPostBack="false" Width="80px" OnClick="btnExp_Excel_Click">
                                                </dx:ASPxButton>
                                            </td>
                                            <td width="100%">&nbsp;</td>
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R61-047/1-03" Width="100px">
                                                </dx:ASPxLabel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                        <dx:ASPxCallbackPanel ID="cbp_Base" runat="server" ClientIDMode="AutoID" Width="100%"
                                            OnCallback="cbp_Base_Callback" ClientInstanceName="cbp_Base">
                                            <PanelCollection>
                                                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="10px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewBandColumn Caption="日期" Name="gbc3" VisibleIndex="0">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="成本科目" FieldName="STATISTICS_DES" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="110px" VisibleIndex="0">
                                                                        <CellStyle HorizontalAlign="Left"></CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单位" FieldName="UNIT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="35px" VisibleIndex="1">
                                                                        <CellStyle HorizontalAlign="Center"></CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="实际单价" FieldName="STATISTICS_PCE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="40px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}" >
                                                                        <CellStyle HorizontalAlign="Center"></CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="水分" FieldName="WATER" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="40px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                        <CellStyle HorizontalAlign="Center"></CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="本日产量(t):" Name="gbc1" VisibleIndex="1">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="本日实耗" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="湿吨(kg)" FieldName="DAY_WET" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="干吨(kg)" FieldName="DAY_TOTAL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="金额(元)" FieldName="DAY_PCE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="70px" VisibleIndex="1"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="单耗(kg/t)" FieldName="DAY_COST" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="50px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="金额(元/t)" FieldName="DAY_COST_PCE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="50px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="本月产量(t):" Name="gbc2" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="本月实耗" VisibleIndex="1">
                                                                        <Columns>
                                                                             <dx:GridViewDataTextColumn Caption="湿吨(kg)" FieldName="MONTH_WET" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="干吨(kg)" FieldName="MONTH_TOTAL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="金额(元)" FieldName="MONTH_PCE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="70px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="单耗(kg/t)" FieldName="MONTH_COST" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="50px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="金额（元/t）" FieldName="MONTH_COST_PCE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="50px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                <CellStyle HorizontalAlign="Right"></CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                    </dx:ASPxGridView>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>
                                    </dx:ContentControl>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <dx:ASPxGridViewExporter ID="ExpGrid" runat="server" GridViewID="gridBase1">
        </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
