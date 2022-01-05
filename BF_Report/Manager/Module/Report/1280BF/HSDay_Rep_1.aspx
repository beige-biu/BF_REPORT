<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HSDay_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1280BF.HSDay_Rep_1" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉热风炉生产日报表
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
                                            <td width="100px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="100px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="1#热风炉" Value="1" />
                                                        <dx:ListEditItem Text="2#热风炉" Value="2" />
                                                        <dx:ListEditItem Text="3#热风炉" Value="3" />
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
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="R61-052/1-04-E" Width="100px">
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
                                                            <Header HorizontalAlign="Center" Wrap="True"/>                                                            
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="BC" Width="65px" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="BB" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="冷风流量(m³/min)" FieldName="F_COLDWIND" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="冷风压力" FieldName="P_COLDWIND" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="冷风温度(℃)" FieldName="T_COLDWIND" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="混风前温度(℃)" FieldName="S_COLDWIND" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="5" Visible="false">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="热风总管温度1(℃)" FieldName="T_HOTWIND1" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="热风总管温度2(℃)" FieldName="T_HOTWIND2" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="理论空燃比" FieldName="R_THEORY_KRB" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="8">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="空燃比" FieldName="R_KRB" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="9">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="拱顶压力" FieldName="HS_P_VAULT" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉内压力" FieldName="HS_P_IN" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="11" >
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="助燃空气流量(m³/min)" FieldName="HS_F_AIR" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="12">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤气流量(m³/min)" FieldName="HS_F_GAS" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="13">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="火焰监测" FieldName="HS_R_FIRE" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="14">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烟气含氧量" FieldName="HS_O2_INSOMKE" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="15">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="燃烧器内温度(℃)" FieldName="HS_T_INRSQ" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="16">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="燃烧室红外温度(℃)" FieldName="HS_T_HWBURNROOM" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="17">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="拱顶温度(℃)" FieldName="HS_T_BRUNROOM" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="18">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="硅质格砖界面温度(℃)" FieldName="HS_T_SIGRID" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="19">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="硅砖界面温度(℃)" FieldName="HS_T_SI" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="20">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烟气支管废气温度(℃)" FieldName="HS_T_SMOKE" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="21">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉皮温度1(℃)" FieldName="HS_T_LP1" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="22">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉皮温度2(℃)" FieldName="HS_T_LP2" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="23">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉皮温度3(℃)" FieldName="HS_T_LP3" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="24">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉箅子温度(℃)" FieldName="HS_T_LBZ" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="25">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="空燃比" FieldName="HS_R_KRB" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="26">
                                                            </dx:GridViewDataTextColumn>
                                                            
                                                            <dx:GridViewDataTextColumn Caption="状态" FieldName="HS_STATUS_DES" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="27">
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption=""  Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="28">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="F_COLDWIND" ShowInGroupFooterColumn="F_COLDWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_COLDWIND" ShowInGroupFooterColumn="P_COLDWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_COLDWIND" ShowInGroupFooterColumn="T_COLDWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="S_COLDWIND" ShowInGroupFooterColumn="S_COLDWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_HOTWIND1" ShowInGroupFooterColumn="T_HOTWIND1" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_HOTWIND2" ShowInGroupFooterColumn="T_HOTWIND2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="R_THEORY_KRB" ShowInGroupFooterColumn="R_THEORY_KRB" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="R_KRB" ShowInGroupFooterColumn="R_KRB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_P_VAULT" ShowInGroupFooterColumn="HS_P_VAULT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_P_IN" ShowInGroupFooterColumn="HS_P_IN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_F_AIR" ShowInGroupFooterColumn="HS_F_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_F_GAS" ShowInGroupFooterColumn="HS_F_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_R_FIRE" ShowInGroupFooterColumn="HS_R_FIRE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_O2_INSOMKE" ShowInGroupFooterColumn="HS_O2_INSOMKE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_INRSQ" ShowInGroupFooterColumn="HS_T_INRSQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_HWBURNROOM" ShowInGroupFooterColumn="HS_T_HWBURNROOM" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_BRUNROOM" ShowInGroupFooterColumn="HS_T_BRUNROOM" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SIGRID" ShowInGroupFooterColumn="HS_T_SIGRID" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SI" ShowInGroupFooterColumn="HS_T_SI" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE" ShowInGroupFooterColumn="HS_T_SMOKE" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_LP1" ShowInGroupFooterColumn="HS_T_LP1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_LP2" ShowInGroupFooterColumn="HS_T_LP2" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_LP3" ShowInGroupFooterColumn="HS_T_LP3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_LBZ" ShowInGroupFooterColumn="HS_T_LBZ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_R_KRB" ShowInGroupFooterColumn="HS_R_KRB" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                            <dx:ASPxSummaryItem FieldName="HS_STATUS_DES" ShowInGroupFooterColumn="HS_STATUS_DES" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="F_COLDWIND" ShowInGroupFooterColumn="F_COLDWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_COLDWIND" ShowInGroupFooterColumn="P_COLDWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_COLDWIND" ShowInGroupFooterColumn="T_COLDWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="S_COLDWIND" ShowInGroupFooterColumn="S_COLDWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_HOTWIND1" ShowInGroupFooterColumn="T_HOTWIND1" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_HOTWIND2" ShowInGroupFooterColumn="T_HOTWIND2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="R_THEORY_KRB" ShowInGroupFooterColumn="R_THEORY_KRB" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="R_KRB" ShowInGroupFooterColumn="R_KRB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_P_VAULT" ShowInGroupFooterColumn="HS_P_VAULT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_P_IN" ShowInGroupFooterColumn="HS_P_IN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_F_AIR" ShowInGroupFooterColumn="HS_F_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_F_GAS" ShowInGroupFooterColumn="HS_F_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_R_FIRE" ShowInGroupFooterColumn="HS_R_FIRE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_O2_INSOMKE" ShowInGroupFooterColumn="HS_O2_INSOMKE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_INRSQ" ShowInGroupFooterColumn="HS_T_INRSQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_HWBURNROOM" ShowInGroupFooterColumn="HS_T_HWBURNROOM" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_BRUNROOM" ShowInGroupFooterColumn="HS_T_BRUNROOM" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SIGRID" ShowInGroupFooterColumn="HS_T_SIGRID" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SI" ShowInGroupFooterColumn="HS_T_SI" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_SMOKE" ShowInGroupFooterColumn="HS_T_SMOKE" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_LP1" ShowInGroupFooterColumn="HS_T_LP1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_LP2" ShowInGroupFooterColumn="HS_T_LP2" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_LP3" ShowInGroupFooterColumn="HS_T_LP3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_T_LBZ" ShowInGroupFooterColumn="HS_T_LBZ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_R_KRB" ShowInGroupFooterColumn="HS_R_KRB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_STATUS_DES" ShowInGroupFooterColumn="HS_STATUS_DES" SummaryType="Average" DisplayFormat="{0:0.00}" />  
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
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
