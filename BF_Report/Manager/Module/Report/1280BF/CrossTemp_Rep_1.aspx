<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrossTemp_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1280BF.CrossTemp_Rep_1" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉炉喉十字测温日报表
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
                                            <td width="150px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel2" Font-Size="14px" runat="server" Text="请选择测温角度:" Width="150px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="150px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="150px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="炉喉：东北与西南" Value="1" />
                                                        <dx:ListEditItem Text="炉喉：东南与西北" Value="2" />
                                                    </Items>
                                                </dx:ASPxComboBox>
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
                                <td colspan="7">
                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                        <dx:ASPxCallbackPanel ID="cbp_Base" runat="server" ClientIDMode="AutoID" Width="100%"
                                            OnCallback="cbp_Base_Callback" ClientInstanceName="cbp_Base">
                                            <PanelCollection>
                                                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False"/>
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="BC" GroupIndex="0" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="BB" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="西北十字测温" VisibleIndex="2" Name="TitleName1">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="TE1317" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1317" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="100px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1316" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1316" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1315" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1315" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1314" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1314" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="东北十字测温" VisibleIndex="3" Name="TitleName4">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="TE1305" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1305" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1304" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1304" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1303" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1303" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1302" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1302" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="中心" VisibleIndex="4" Name="TitleName2">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="TE1301" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1301" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="东南十字测温" VisibleIndex="5" Name="TitleName3">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="TE1306" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1306" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1307" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1307" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1308" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1308" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1309" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1309" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>                                        
                                                            <dx:GridViewBandColumn Caption="西南十字测温" VisibleIndex="6" Name="TitleName5">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="TE1310" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1310" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1311" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1311" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1312" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1312" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="TE1313" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1313" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="TE1317" ShowInGroupFooterColumn="TE1317" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1316" ShowInGroupFooterColumn="TE1316" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1315" ShowInGroupFooterColumn="TE1315" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1314" ShowInGroupFooterColumn="TE1314" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1301" ShowInGroupFooterColumn="TE1301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1306" ShowInGroupFooterColumn="TE1306" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1307" ShowInGroupFooterColumn="TE1307" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1308" ShowInGroupFooterColumn="TE1308" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1309" ShowInGroupFooterColumn="TE1309" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1305" ShowInGroupFooterColumn="TE1305" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1304" ShowInGroupFooterColumn="TE1304" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1303" ShowInGroupFooterColumn="TE1303" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1302" ShowInGroupFooterColumn="TE1302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1310" ShowInGroupFooterColumn="TE1310" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1311" ShowInGroupFooterColumn="TE1311" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1312" ShowInGroupFooterColumn="TE1312" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1313" ShowInGroupFooterColumn="TE1313" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="TE1317" ShowInGroupFooterColumn="TE1317" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1316" ShowInGroupFooterColumn="TE1316" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1315" ShowInGroupFooterColumn="TE1315" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1314" ShowInGroupFooterColumn="TE1314" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1301" ShowInGroupFooterColumn="TE1301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1306" ShowInGroupFooterColumn="TE1306" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1307" ShowInGroupFooterColumn="TE1307" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1308" ShowInGroupFooterColumn="TE1308" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1309" ShowInGroupFooterColumn="TE1309" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1305" ShowInGroupFooterColumn="TE1305" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1304" ShowInGroupFooterColumn="TE1304" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1303" ShowInGroupFooterColumn="TE1303" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1302" ShowInGroupFooterColumn="TE1302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1310" ShowInGroupFooterColumn="TE1310" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1311" ShowInGroupFooterColumn="TE1311" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1312" ShowInGroupFooterColumn="TE1312" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1313" ShowInGroupFooterColumn="TE1313" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <%-- <SettingsResizing ColumnResizeMode="Control" />--%>
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
