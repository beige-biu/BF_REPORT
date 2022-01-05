<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FunTopCheck_Rep_1.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1280BF.FunTopCheck_Rep_1" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉炉顶检测日报表
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
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                        <dx:ASPxCallbackPanel ID="cbp_Base" runat="server" ClientIDMode="AutoID" Width="100%"
                                            OnCallback="cbp_Base_Callback" ClientInstanceName="cbp_Base">
                                            <PanelCollection>
                                                <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True"/>                                                            
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>                                                       
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending" FixedStyle="Left">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="BC" GroupIndex="0" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="BB" Width="65px" ShowInCustomizationForm="True" UnboundType="String"
                                                                VisibleIndex="2" FixedStyle="Left">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="称量罐" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="压力(kPa)" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="P_HOPPER" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="压差" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="P_HOPPERDIFF" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="氮气总管" VisibleIndex="4" >
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="压力" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="P_N2PIPE" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="流量"  VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m³/min" FieldName="F_N2PIPE" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="二次均压氮气管"  VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="压力" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="P_SEC_N2PIPE" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="流量"  VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m³/min" FieldName="F_SEC_N2PIPE" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                             <dx:GridViewBandColumn Caption="蒸汽管"  VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="压力" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="T_STEAMPIPE" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="流量"  VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m³/min" FieldName="P_STEAMPIPE" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="水冷系统"  VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="进水管流量" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m³/min" FieldName="F_COOLSYS_IN" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="出水管流量"  VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m³/min" FieldName="F_COOLSYS_OUT" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="密封阀"  VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="上阀座温度" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="T_SFZ" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="阀箱温度"  VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="T_FX" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="气密箱"  VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1#" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="T_QMX1" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2#"  VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="T_QMX2" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="3#"  VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="T_QMX3" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>  
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            
                                                            <dx:GridViewBandColumn Caption="炉顶煤气" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="H2" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_H2" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="N2" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_N2" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="CO" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_CO" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="CO2" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_CO2" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="CH4" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_CH4" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="煤气利用率" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_CO_USE" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>

                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="0px" VisibleIndex="11">
                                                                    </dx:GridViewDataTextColumn>

                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="P_HOPPER" ShowInGroupFooterColumn="P_HOPPER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_HOPPERDIFF" ShowInGroupFooterColumn="P_HOPPERDIFF" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                          
                                                            <dx:ASPxSummaryItem FieldName="P_N2PIPE" ShowInGroupFooterColumn="P_N2PIPE" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_N2PIPE" ShowInGroupFooterColumn="F_N2PIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_SEC_N2PIPE" ShowInGroupFooterColumn="P_SEC_N2PIPE" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_SEC_N2PIPE" ShowInGroupFooterColumn="F_SEC_N2PIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_STEAMPIPE" ShowInGroupFooterColumn="T_STEAMPIPE" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_STEAMPIPE" ShowInGroupFooterColumn="P_STEAMPIPE" SummaryType="Average" DisplayFormat="{0:0.00}" /> 
                                                            <dx:ASPxSummaryItem FieldName="F_COOLSYS_IN" ShowInGroupFooterColumn="F_COOLSYS_IN" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_COOLSYS_OUT" ShowInGroupFooterColumn="F_COOLSYS_OUT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_SFZ" ShowInGroupFooterColumn="T_SFZ" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_FX" ShowInGroupFooterColumn="T_FX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_QMX1" ShowInGroupFooterColumn="T_QMX1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_QMX2" ShowInGroupFooterColumn="T_QMX2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_QMX3" ShowInGroupFooterColumn="T_QMX3" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                     
                                                            <dx:ASPxSummaryItem FieldName="PER_H2" ShowInGroupFooterColumn="PER_H2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_N2" ShowInGroupFooterColumn="PER_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO" ShowInGroupFooterColumn="PER_CO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO2" ShowInGroupFooterColumn="PER_CO2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CH4" ShowInGroupFooterColumn="PER_CH4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO_USE" ShowInGroupFooterColumn="PER_CO_USE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="合计{0:0}条" />
                                                            <dx:ASPxSummaryItem FieldName="P_HOPPER" ShowInGroupFooterColumn="P_HOPPER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_HOPPERDIFF" ShowInGroupFooterColumn="P_HOPPERDIFF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_N2PIPE" ShowInGroupFooterColumn="P_N2PIPE" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_N2PIPE" ShowInGroupFooterColumn="F_N2PIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_SEC_N2PIPE" ShowInGroupFooterColumn="P_SEC_N2PIPE" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_SEC_N2PIPE" ShowInGroupFooterColumn="F_SEC_N2PIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_STEAMPIPE" ShowInGroupFooterColumn="T_STEAMPIPE" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_STEAMPIPE" ShowInGroupFooterColumn="P_STEAMPIPE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_COOLSYS_IN" ShowInGroupFooterColumn="F_COOLSYS_IN" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="F_COOLSYS_OUT" ShowInGroupFooterColumn="F_COOLSYS_OUT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_SFZ" ShowInGroupFooterColumn="T_SFZ" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_FX" ShowInGroupFooterColumn="T_FX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_QMX1" ShowInGroupFooterColumn="T_QMX1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_QMX2" ShowInGroupFooterColumn="T_QMX2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_QMX3" ShowInGroupFooterColumn="T_QMX3" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                            <dx:ASPxSummaryItem FieldName="PER_H2" ShowInGroupFooterColumn="PER_H2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_N2" ShowInGroupFooterColumn="PER_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO" ShowInGroupFooterColumn="PER_CO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO2" ShowInGroupFooterColumn="PER_CO2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CH4" ShowInGroupFooterColumn="PER_CH4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO_USE" ShowInGroupFooterColumn="PER_CO_USE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords"/>
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
