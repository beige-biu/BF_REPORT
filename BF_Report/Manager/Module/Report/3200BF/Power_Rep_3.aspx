<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Power_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.Power_Rep_3" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉能源日报表
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
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px" align="right">
                                                <dx:ASPxButton ID="btnQuery" Font-Size="14px" runat="server" Text="查询" AutoPostBack="false" Width="80px">
                                                    <ClientSideEvents Click="function(s,e){OnQueryClick();}" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="" Width="20px">
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
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False"/>
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="生产日期" FieldName="PROD_DATE" Width="130px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="MM-dd"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="PROD_SHIFT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            
                                                            <dx:GridViewBandColumn Caption="高炉煤气(m³)" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="产出" FieldName="BM_GLMQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="100px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                        
                                                                    <dx:GridViewDataTextColumn Caption="消耗" FieldName="HS_GLMQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="100px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="氧气(富氧)" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="BM_YQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="氮气" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="BM_DQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="天然气" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="BM_TRQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="压缩空气" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="HS_YSKQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="80px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="蒸汽" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="HS_ZQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="风量" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="HS_FL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="100px" VisibleIndex="0"  PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="软水" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="WATER_RS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="工业用水" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="WATER_SCS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="TRT发电量" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kW.h" FieldName="ELECTRIC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="氮气总管流量班累计" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="BU_DQZG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>  
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="PROD_DATE" ShowInGroupFooterColumn="PROD_DATE" SummaryType="Count" DisplayFormat="合计{0}条" />
                                                            <dx:ASPxSummaryItem FieldName="BM_GLMQ" ShowInGroupFooterColumn="BM_GLMQ" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_GLMQ" ShowInGroupFooterColumn="HS_GLMQ" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="BM_YQ" ShowInGroupFooterColumn="BM_YQ" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="BM_DQ" ShowInGroupFooterColumn="BM_DQ" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="BM_TRQ" ShowInGroupFooterColumn="BM_TRQ" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_YSKQ" ShowInGroupFooterColumn="HS_YSKQ" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ZQ" ShowInGroupFooterColumn="HS_ZQ" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_FL" ShowInGroupFooterColumn="HS_FL" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_RS" ShowInGroupFooterColumn="WATER_RS" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_SCS" ShowInGroupFooterColumn="WATER_SCS" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="ELECTRIC" ShowInGroupFooterColumn="ELECTRIC" SummaryType="Sum" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="BU_DQZG" ShowInGroupFooterColumn="BU_DQZG" SummaryType="Sum" DisplayFormat="{0:0}" />                      
                                                        </TotalSummary>
                                                         <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" VerticalScrollableHeight="650" VerticalScrollBarMode="Hidden" />
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
