<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialInput_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.MaterialInput_Rep_3" %>

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
        //操作
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
                    <td width="100%;" height="30px" align="center" valign="center">
                        3#高炉入炉原燃料重量（吨）
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table style="width: 100%;" align="center" valign="top">
                            <tr style="background-color: lightblue;">
                                <td>
                                    <table style="width: 100%; height: 35px;" valign="center">
                                        <tr>
                                            <td width="70px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="开始日期:" Width="70px">
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
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="结束日期:"  Font-Size="14px" Width="80px">
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
                                            <td width="80px">
                                                <dx:ASPxButton ID="btnQuery" Font-Size="14px" runat="server" Text="查询" AutoPostBack="false" Width="80px">
                                                    <ClientSideEvents Click="function(s,e){OnQueryClick();}" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxButton ID="btnExp_Excel" Font-Size="14px" runat="server" Text="导出Excel" AutoPostBack="false" Width="80px" OnClick="btnExp_Excel_Click">
                                                </dx:ASPxButton>
                                            </td>
                                            <td width="100%">&nbsp;</td>
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="R67-103/0-16-E" Width="100px">
                                                </dx:ASPxLabel>
                                            </td>
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="105px"  GroupIndex="0" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Descending">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="SHIFT_ID" Width="70px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭" FieldName="COKEWEIGHT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="干焦量" FieldName="DRYCOKEWEIGHT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦丁" FieldName="COKEDOTWEIGHT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤粉" FieldName="COAL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="自产烧结矿" FieldName="SINTERWEIGHT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="球团" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="球团1名称" FieldName="BALL_MINE1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="105px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球团1重量" FieldName="BALL_MINE1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球团2名称" FieldName="BALL_MINE2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="105px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球团2重量" FieldName="BALL_MINE2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球团3名称" FieldName="BALL_MINE3_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="105px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球团3重量" FieldName="BALL_MINE3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球团矿总量" FieldName="BALL_MINE_ZC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="6">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="块矿" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="块矿1名称" FieldName="BLOC_MINE1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="105px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿1重量" FieldName="BLOC_MINE1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿2名称" FieldName="BLOC_MINE2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="105px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿2重量" FieldName="BLOC_MINE2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿3名称" FieldName="BLOC_MINE3_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="105px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿3重量" FieldName="BLOC_MINE3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿4名称" FieldName="BLOC_MINE4_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="105px" VisibleIndex="6">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿4重量" FieldName="BLOC_MINE4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="7">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿5名称" FieldName="BLOC_MINE5_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="105px" VisibleIndex="8">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="块矿5重量" FieldName="BLOC_MINE5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="9">
                                                                    </dx:GridViewDataTextColumn>               
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="辅料" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="白云石" FieldName="DOLO" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="硅石" FieldName="SILEX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="石灰石" FieldName="SHS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="萤石" FieldName="YS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="锰矿" FieldName="MK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="蛇纹石" FieldName="SWS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="矿总量" FieldName="TOTAL_WEIG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption=""  ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="SHIFT_ID" ShowInGroupFooterColumn="SHIFT_ID" SummaryType="Count" DisplayFormat="合计" />
                                                            <dx:ASPxSummaryItem FieldName="COKEWEIGHT" ShowInGroupFooterColumn="COKEWEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DRYCOKEWEIGHT" ShowInGroupFooterColumn="DRYCOKEWEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKEDOTWEIGHT" ShowInGroupFooterColumn="COKEDOTWEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL" ShowInGroupFooterColumn="COAL" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SINTERWEIGHT" ShowInGroupFooterColumn="SINTERWEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BALL_MINE1" ShowInGroupFooterColumn="BALL_MINE1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BALL_MINE2" ShowInGroupFooterColumn="BALL_MINE2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BALL_MINE3" ShowInGroupFooterColumn="BALL_MINE3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BALL_MINE_ZC" ShowInGroupFooterColumn="BALL_MINE_ZC" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE1" ShowInGroupFooterColumn="BLOC_MINE1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE2" ShowInGroupFooterColumn="BLOC_MINE2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE3" ShowInGroupFooterColumn="BLOC_MINE3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE4" ShowInGroupFooterColumn="BLOC_MINE4" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE5" ShowInGroupFooterColumn="BLOC_MINE5" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DOLO" ShowInGroupFooterColumn="DOLO" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SILEX" ShowInGroupFooterColumn="SILEX" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHS" ShowInGroupFooterColumn="SHS" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YS" ShowInGroupFooterColumn="YS" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MK" ShowInGroupFooterColumn="MK" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SWS" ShowInGroupFooterColumn="SWS" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TOTAL_WEIG" ShowInGroupFooterColumn="TOTAL_WEIG" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="SHIFT_ID" ShowInGroupFooterColumn="SHIFT_ID" SummaryType="Count" DisplayFormat="合计" />
                                                            <dx:ASPxSummaryItem FieldName="COKEWEIGHT" ShowInGroupFooterColumn="COKEWEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DRYCOKEWEIGHT" ShowInGroupFooterColumn="DRYCOKEWEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKEDOTWEIGHT" ShowInGroupFooterColumn="COKEDOTWEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL" ShowInGroupFooterColumn="COAL" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SINTERWEIGHT" ShowInGroupFooterColumn="SINTERWEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BALL_MINE1" ShowInGroupFooterColumn="BALL_MINE1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BALL_MINE2" ShowInGroupFooterColumn="BALL_MINE2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BALL_MINE3" ShowInGroupFooterColumn="BALL_MINE3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BALL_MINE_ZC" ShowInGroupFooterColumn="BALL_MINE_ZC" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE1" ShowInGroupFooterColumn="BLOC_MINE1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE2" ShowInGroupFooterColumn="BLOC_MINE2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE3" ShowInGroupFooterColumn="BLOC_MINE3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE4" ShowInGroupFooterColumn="BLOC_MINE4" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLOC_MINE5" ShowInGroupFooterColumn="BLOC_MINE5" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DOLO" ShowInGroupFooterColumn="DOLO" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SILEX" ShowInGroupFooterColumn="SILEX" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHS" ShowInGroupFooterColumn="SHS" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YS" ShowInGroupFooterColumn="YS" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MK" ShowInGroupFooterColumn="MK" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SWS" ShowInGroupFooterColumn="SWS" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TOTAL_WEIG" ShowInGroupFooterColumn="TOTAL_WEIG" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" VerticalScrollableHeight="650" VerticalScrollBarMode="Hidden" />
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <SettingsResizing ColumnResizeMode="Control" />
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
