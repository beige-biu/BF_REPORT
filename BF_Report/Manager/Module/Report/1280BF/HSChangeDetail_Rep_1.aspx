<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HSChangeDetail_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1280BF.HSChangeDetail_Rep_1" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉热风炉交换作业明细日报表
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
                                            <td width="80px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel2" Font-Size="14px" runat="server" Text="热风炉号:" Width="80px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="150px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="150px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="1#热风炉交换作业" Value="1" />
                                                        <dx:ListEditItem Text="2#热风炉交换作业" Value="2" />
                                                        <dx:ListEditItem Text="3#热风炉交换作业" Value="3" />
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
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="BC" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="BB" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="状态" FieldName="HS_STATUS" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="状态描述" FieldName="HS_STATUSDESC" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="燃烧时间" FieldName="HS_C_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="5">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm:ss"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焖炉时间" FieldName="HS_W_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="6">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm:ss"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="送风时间" FieldName="HS_S_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="7">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm:ss"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="燃烧器炉内温度" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧开始" FieldName="HS_T_INRSQ_BS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧结束" FieldName="HS_T_INRSQ_BE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧最大值" FieldName="HS_T_INRSQ_BB" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="燃烧室温度" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧开始" FieldName="HS_T_BURNROOM_BS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="送风开始" FieldName="HS_T_BURNROOM_WS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn> 
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="硅质格砖界面温度" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧开始" FieldName="HS_T_SIGRID_S" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧结束" FieldName="HS_T_SIGRID_E" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="硅砖界面温度" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧开始" FieldName="HS_T_SI_S" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧结束" FieldName="HS_T_SI_E" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="废气温度" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧开始" FieldName="HS_T_SMOKE_BS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="最大值" FieldName="HS_T_SMOKE_BSMAX" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="平均值" FieldName="HS_T_SMOKE_BSAVG" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧结束" FieldName="HS_T_SMOKE_BE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="最大值" FieldName="HS_T_SMOKE_BEMAX" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="平均值" FieldName="HS_T_SMOKE_BEAVG" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_INRSQ_BS" ShowInGroupFooterColumn="HS_T_INRSQ_BS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_INRSQ_BE" ShowInGroupFooterColumn="HS_T_INRSQ_BE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_INRSQ_BB" ShowInGroupFooterColumn="HS_T_INRSQ_BB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_BURNROOM_BS" ShowInGroupFooterColumn="HS_T_BURNROOM_BS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_BURNROOM_WS" ShowInGroupFooterColumn="HS_T_BURNROOM_WS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SIGRID_S" ShowInGroupFooterColumn="HS_T_SIGRID_S" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SIGRID_E" ShowInGroupFooterColumn="HS_T_SIGRID_E" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SI_S" ShowInGroupFooterColumn="HS_T_SI_S" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SI_E" ShowInGroupFooterColumn="HS_T_SI_E" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BS" ShowInGroupFooterColumn="HS_T_SMOKE_BS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BSMAX" ShowInGroupFooterColumn="HS_T_SMOKE_BSMAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BSAVG" ShowInGroupFooterColumn="HS_T_SMOKE_BSAVG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BE" ShowInGroupFooterColumn="HS_T_SMOKE_BE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BEMAX" ShowInGroupFooterColumn="HS_T_SMOKE_BEMAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BEAVG" ShowInGroupFooterColumn="HS_T_SMOKE_BEAVG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_INRSQ_BS" ShowInGroupFooterColumn="HS_T_INRSQ_BS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_INRSQ_BE" ShowInGroupFooterColumn="HS_T_INRSQ_BE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_INRSQ_BB" ShowInGroupFooterColumn="HS_T_INRSQ_BB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_BURNROOM_BS" ShowInGroupFooterColumn="HS_T_BURNROOM_BS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_BURNROOM_WS" ShowInGroupFooterColumn="HS_T_BURNROOM_WS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SIGRID_S" ShowInGroupFooterColumn="HS_T_SIGRID_S" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SIGRID_E" ShowInGroupFooterColumn="HS_T_SIGRID_E" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SI_S" ShowInGroupFooterColumn="HS_T_SI_S" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SI_E" ShowInGroupFooterColumn="HS_T_SI_E" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BS" ShowInGroupFooterColumn="HS_T_SMOKE_BS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BSMAX" ShowInGroupFooterColumn="HS_T_SMOKE_BSMAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BSAVG" ShowInGroupFooterColumn="HS_T_SMOKE_BSAVG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BE" ShowInGroupFooterColumn="HS_T_SMOKE_BE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BEMAX" ShowInGroupFooterColumn="HS_T_SMOKE_BEMAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE_BEAVG" ShowInGroupFooterColumn="HS_T_SMOKE_BEAVG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
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
