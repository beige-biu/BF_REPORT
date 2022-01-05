<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IronTo_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1280BF.IronTo_Rep_1" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉铁水热装日报表
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table style="width: 100%;" align="center" valign="top">
                            <tr style="background-color: lightblue;">
                                <td>
                                    <table style="width: 100%; height: 35px;" valign="center">
                                            <tr>
                                                <td width="80px" align="right">
                                                    <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="开始日期:" Width="80px">
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
                                                <td width="80px" align="right">
                                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="结束日期:"  Font-Size="14px" Width="80px">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td width="130px">
                                                    <dx:ASPxDateEdit ID="dateEndTime" Font-Size="14px" runat="server" ClientInstanceName="dateEndTime"
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
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" OnCustomCellMerge="gridBase1_CustomCellMerge" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False"/>
                                                        </Styles>
                                                        <Columns>                                                            
                                                            <dx:GridViewDataTextColumn Caption="日期" FieldName="field0" Width="120px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm"></PropertiesTextEdit>
                                                                <Settings AllowCellMerge="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="field1" Width="80px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                                <Settings AllowCellMerge="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="field2" Width="80px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                                <Settings AllowCellMerge="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉号" FieldName="field3" Width="80px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="3" SortOrder="Ascending">
                                                                <Settings AllowCellMerge="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="出铁重量" FieldName="field12" Width="80px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="3">
                                                                <Settings AllowCellMerge="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="一炼钢" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="车号" FieldName="field13" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="80px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="罐号" FieldName="field4" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="80px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field5" UnboundType="Decimal" ShowInCustomizationForm="True" Width="80px" Caption="过磅t" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="二炼钢" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="车号" FieldName="field14" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="80px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="罐号" FieldName="field6" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="80px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field7" UnboundType="Decimal" ShowInCustomizationForm="True" Width="80px" Caption="过磅t" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="三期炼钢" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="车号" FieldName="field15" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="80px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="罐号" FieldName="field8" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="80px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field9" UnboundType="Decimal" ShowInCustomizationForm="True" Width="80px" Caption="过磅t" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="混铸" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="车号" FieldName="field16" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="80px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="罐号" FieldName="field10" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="80px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field11" UnboundType="Decimal" ShowInCustomizationForm="True" Width="80px" Caption="过磅t" VisibleIndex="1"></dx:GridViewDataTextColumn>
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
