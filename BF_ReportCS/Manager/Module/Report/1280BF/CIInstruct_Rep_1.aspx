<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CIInstruct_Rep_1.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1280BF.CIInstruct_Rep_1" %>

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
        function OnQueryClick(s, e) {
            try {
                cbp_Base.PerformCallback();
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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉喷煤日报表
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
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R61-145/0-15-E" Width="100px">
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
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="BC" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="BB" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="喷煤量<br>(t/h)" FieldName="COKE_AMOUNT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="热风压力<br>kPa" FieldName="HOTWIND_PRESS" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="喷煤速度<br>t/h" FieldName="F_COAL_REAL" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="氮气" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量<br>m³/h" FieldName="F_N2_REAL" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力<br>MPa" FieldName="P_N2_PIPE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度<br>℃" FieldName="T_N2_PIPE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="分配器前" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力1<br>MPa" FieldName="P_SEC_ADAPTOR1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力2<br>MPa" FieldName="P_SEC_ADAPTOR2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="1#喷吹罐" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力<br>MPa" FieldName="P_JET1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="上温<br>℃" FieldName="T_JET1_UP" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="下温<br>℃" FieldName="T_JET1_LOW" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重量<br>t" FieldName="W_JET1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2#喷吹罐" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力<br>MPa" FieldName="P_JET2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="上温<br>℃" FieldName="T_JET2_UP" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="下温<br>℃" FieldName="T_JET2_LOW" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重量<br>t" FieldName="W_JET2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="3#喷吹罐" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力<br>MPa" FieldName="P_JET3" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="上温<br>℃" FieldName="T_JET3_UP" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="下温<br>℃" FieldName="T_JET3_LOW" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重量<br>t" FieldName="W_JET3" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_AMOUNT" ShowInGroupFooterColumn="COKE_AMOUNT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HOTWIND_PRESS" ShowInGroupFooterColumn="HOTWIND_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_COAL_REAL" ShowInGroupFooterColumn="F_COAL_REAL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_N2_REAL" ShowInGroupFooterColumn="F_N2_REAL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_N2_PIPE" ShowInGroupFooterColumn="P_N2_PIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_N2_PIPE" ShowInGroupFooterColumn="T_N2_PIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_SEC_ADAPTOR1" ShowInGroupFooterColumn="P_SEC_ADAPTOR1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_SEC_ADAPTOR2" ShowInGroupFooterColumn="P_SEC_ADAPTOR2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_JET1" ShowInGroupFooterColumn="P_JET1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_JET2" ShowInGroupFooterColumn="P_JET2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_JET3" ShowInGroupFooterColumn="P_JET3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET1_UP" ShowInGroupFooterColumn="T_JET1_UP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET2_UP" ShowInGroupFooterColumn="T_JET2_UP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET3_UP" ShowInGroupFooterColumn="T_JET3_UP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET1_LOW" ShowInGroupFooterColumn="T_JET1_LOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET2_LOW" ShowInGroupFooterColumn="T_JET2_LOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET3_LOW" ShowInGroupFooterColumn="T_JET3_LOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="W_JET1" ShowInGroupFooterColumn="W_JET1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="W_JET2" ShowInGroupFooterColumn="W_JET2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="W_JET3" ShowInGroupFooterColumn="W_JET3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_AMOUNT" ShowInGroupFooterColumn="COKE_AMOUNT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HOTWIND_PRESS" ShowInGroupFooterColumn="HOTWIND_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_COAL_REAL" ShowInGroupFooterColumn="F_COAL_REAL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_N2_REAL" ShowInGroupFooterColumn="F_N2_REAL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_N2_PIPE" ShowInGroupFooterColumn="P_N2_PIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_N2_PIPE" ShowInGroupFooterColumn="T_N2_PIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_SEC_ADAPTOR1" ShowInGroupFooterColumn="P_SEC_ADAPTOR1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_SEC_ADAPTOR2" ShowInGroupFooterColumn="P_SEC_ADAPTOR2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_JET1" ShowInGroupFooterColumn="P_JET1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_JET2" ShowInGroupFooterColumn="P_JET2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_JET3" ShowInGroupFooterColumn="P_JET3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET1_UP" ShowInGroupFooterColumn="T_JET1_UP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET2_UP" ShowInGroupFooterColumn="T_JET2_UP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET3_UP" ShowInGroupFooterColumn="T_JET3_UP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET1_LOW" ShowInGroupFooterColumn="T_JET1_LOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET2_LOW" ShowInGroupFooterColumn="T_JET2_LOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_JET3_LOW" ShowInGroupFooterColumn="T_JET3_LOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="W_JET1" ShowInGroupFooterColumn="W_JET1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="W_JET2" ShowInGroupFooterColumn="W_JET2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="W_JET3" ShowInGroupFooterColumn="W_JET3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true"  ShowGroupFooter="VisibleIfExpanded"/>
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
