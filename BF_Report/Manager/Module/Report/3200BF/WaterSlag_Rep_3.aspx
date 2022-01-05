<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaterSlag_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.WaterSlag_Rep_3" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <style>
        #cbp_Base_gridBase1_col5 > table {
            width:35px !important;
        }
        #cbp_Base_gridBase1_col6 >table {
            width:145px !important;
        }

        #cbp_Base_gridBase1_col18 >table {
            width: 88px !important;
        }

        #cbp_Base_gridBase1_col19 >table {
            width: 88px !important;
        }
        #cbp_Base_gridBase1_col20 >table {
            width: 88px !important;
        }
        #cbp_Base_gridBase1_col21 >table {
            width: 88px !important;
        }
        #cbp_Base_gridBase1_col22 >table {
            width: 88px !important;
        }
        
    </style>
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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉水冲渣日报表
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
                                            <td width="60px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel6" Font-Size="14px" runat="server" Text="水冲渣号:" Width="70px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="80px" ClientInstanceName="cbbType" >
                                                    <Items>
                                                        <dx:ListEditItem Text="2#水冲渣" Value="1" />
                                                        <dx:ListEditItem Text="1#水冲渣" Value="0" />
                                                    </Items>
                                                </dx:ASPxComboBox>
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
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>                                                           
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="水冲渣号" FieldName="WW_NO" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="喷淋水管" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="WW_AI_CASW_FLUX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量累计" FieldName="WW_CASW_FLUX_NEW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="冷水池生产新水补水管" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="WW_AI_CWS_FLUX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量累计" FieldName="WW_SUPV_FLUX_NEW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="冲渣泵组" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="出口流量" FieldName="WW_AI_FLU_FLUX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口压力" FieldName="WW_AI_FLU_PRE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口温度" FieldName="WW_RTD_FLU" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="热水泵组" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="出口流量" FieldName="WW_AI_HOTW_FLUX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口压力" FieldName="WW_AI_HOTW_PRE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口温度" FieldName="WW_RTD_FILW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="相电流变送" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1号冲渣泵+W3M021 A相电流变送" FieldName="WW_AI_FLUM1_CURA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2号冲渣泵+W3M022 A相电流变送" FieldName="WW_AI_FLUM2_CURA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="1号热水泵+W3M011 A相电流变送" FieldName="WW_AI_HOTM1_CURA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2号热水泵+W3M012 A相电流变送" FieldName="WW_AI_HOTM2_CURA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="3号热水泵+W3M013 A相电流变送" FieldName="WW_AI_HOTM3_CURA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="1号冲渣泵" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M021定子温度U" FieldName="WW_FLUM1_T1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M021定子温度V" FieldName="WW_FLUM1_T2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M021定子温度W" FieldName="WW_FLUM1_T3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M021轴承温度" FieldName="WW_FLUM1_T4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M021推力瓦温度" FieldName="WW_FLUM1_T5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M021导瓦温度" FieldName="WW_FLUM1_T6" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2号冲渣泵" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M022定子温度U" FieldName="WW_FLUM2_T1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M022定子温度V" FieldName="WW_FLUM2_T2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M022定子温度W" FieldName="WW_FLUM2_T3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M022轴承温度" FieldName="WW_FLUM2_T4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M022推力瓦温度" FieldName="WW_FLUM2_T5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M022导瓦温度" FieldName="WW_FLUM2_T6" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="1号热水泵" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度U" FieldName="WW_HOTM1_T1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度V" FieldName="WW_HOTM1_T2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度W" FieldName="WW_HOTM1_T3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011前轴温度" FieldName="WW_HOTM1_T4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011后轴温度" FieldName="WW_HOTM1_T5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2号热水泵" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度U" FieldName="WW_HOTM2_T1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度V" FieldName="WW_HOTM2_T2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度W" FieldName="WW_HOTM2_T3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011前轴温度" FieldName="WW_HOTM2_T4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011后轴温度" FieldName="WW_HOTM2_T5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="3号热水泵" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度U" FieldName="WW_HOTM3_T1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度V" FieldName="WW_HOTM3_T2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011定子温度W" FieldName="WW_HOTM3_T3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011前轴温度" FieldName="WW_HOTM3_T4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="+W3M011后轴温度" FieldName="WW_HOTM3_T5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_CASW_FLUX" ShowInGroupFooterColumn="WW_AI_CASW_FLUX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_CASW_FLUX_NEW" ShowInGroupFooterColumn="WW_CASW_FLUX_NEW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_CWS_FLUX" ShowInGroupFooterColumn="WW_AI_CWS_FLUX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_SUPV_FLUX_NEW" ShowInGroupFooterColumn="WW_SUPV_FLUX_NEW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_FLU_FLUX" ShowInGroupFooterColumn="WW_AI_FLU_FLUX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_FLU_PRE" ShowInGroupFooterColumn="WW_AI_FLU_PRE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_RTD_FLU" ShowInGroupFooterColumn="WW_RTD_FLU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTW_FLUX" ShowInGroupFooterColumn="WW_AI_HOTW_FLUX" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTW_PRE" ShowInGroupFooterColumn="WW_AI_HOTW_PRE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_RTD_FILW" ShowInGroupFooterColumn="WW_RTD_FILW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_FLUM1_CURA" ShowInGroupFooterColumn="WW_AI_FLUM1_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_FLUM2_CURA" ShowInGroupFooterColumn="WW_AI_FLUM2_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTM1_CURA" ShowInGroupFooterColumn="WW_AI_HOTM1_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTM2_CURA" ShowInGroupFooterColumn="WW_AI_HOTM2_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTM3_CURA" ShowInGroupFooterColumn="WW_AI_HOTM3_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T1" ShowInGroupFooterColumn="WW_FLUM1_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T2" ShowInGroupFooterColumn="WW_FLUM1_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T3" ShowInGroupFooterColumn="WW_FLUM1_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T4" ShowInGroupFooterColumn="WW_FLUM1_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T5" ShowInGroupFooterColumn="WW_FLUM1_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T6" ShowInGroupFooterColumn="WW_FLUM1_T6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T1" ShowInGroupFooterColumn="WW_FLUM2_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T2" ShowInGroupFooterColumn="WW_FLUM2_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T3" ShowInGroupFooterColumn="WW_FLUM2_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T4" ShowInGroupFooterColumn="WW_FLUM2_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T5" ShowInGroupFooterColumn="WW_FLUM2_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T6" ShowInGroupFooterColumn="WW_FLUM2_T6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T1" ShowInGroupFooterColumn="WW_HOTM1_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T2" ShowInGroupFooterColumn="WW_HOTM1_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T3" ShowInGroupFooterColumn="WW_HOTM1_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T4" ShowInGroupFooterColumn="WW_HOTM1_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T5" ShowInGroupFooterColumn="WW_HOTM1_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T1" ShowInGroupFooterColumn="WW_HOTM2_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T2" ShowInGroupFooterColumn="WW_HOTM2_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T3" ShowInGroupFooterColumn="WW_HOTM2_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T4" ShowInGroupFooterColumn="WW_HOTM2_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T5" ShowInGroupFooterColumn="WW_HOTM2_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T1" ShowInGroupFooterColumn="WW_HOTM3_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T2" ShowInGroupFooterColumn="WW_HOTM3_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T3" ShowInGroupFooterColumn="WW_HOTM3_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T4" ShowInGroupFooterColumn="WW_HOTM3_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T5" ShowInGroupFooterColumn="WW_HOTM3_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_CASW_FLUX" ShowInGroupFooterColumn="WW_AI_CASW_FLUX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_CASW_FLUX_NEW" ShowInGroupFooterColumn="WW_CASW_FLUX_NEW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_CWS_FLUX" ShowInGroupFooterColumn="WW_AI_CWS_FLUX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_SUPV_FLUX_NEW" ShowInGroupFooterColumn="WW_SUPV_FLUX_NEW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_FLU_FLUX" ShowInGroupFooterColumn="WW_AI_FLU_FLUX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_FLU_PRE" ShowInGroupFooterColumn="WW_AI_FLU_PRE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_RTD_FLU" ShowInGroupFooterColumn="WW_RTD_FLU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTW_FLUX" ShowInGroupFooterColumn="WW_AI_HOTW_FLUX" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTW_PRE" ShowInGroupFooterColumn="WW_AI_HOTW_PRE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_RTD_FILW" ShowInGroupFooterColumn="WW_RTD_FILW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_FLUM1_CURA" ShowInGroupFooterColumn="WW_AI_FLUM1_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_FLUM2_CURA" ShowInGroupFooterColumn="WW_AI_FLUM2_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTM1_CURA" ShowInGroupFooterColumn="WW_AI_HOTM1_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTM2_CURA" ShowInGroupFooterColumn="WW_AI_HOTM2_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_AI_HOTM3_CURA" ShowInGroupFooterColumn="WW_AI_HOTM3_CURA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T1" ShowInGroupFooterColumn="WW_FLUM1_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T2" ShowInGroupFooterColumn="WW_FLUM1_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T3" ShowInGroupFooterColumn="WW_FLUM1_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T4" ShowInGroupFooterColumn="WW_FLUM1_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T5" ShowInGroupFooterColumn="WW_FLUM1_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM1_T6" ShowInGroupFooterColumn="WW_FLUM1_T6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T1" ShowInGroupFooterColumn="WW_FLUM2_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T2" ShowInGroupFooterColumn="WW_FLUM2_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T3" ShowInGroupFooterColumn="WW_FLUM2_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T4" ShowInGroupFooterColumn="WW_FLUM2_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T5" ShowInGroupFooterColumn="WW_FLUM2_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_FLUM2_T6" ShowInGroupFooterColumn="WW_FLUM2_T6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T1" ShowInGroupFooterColumn="WW_HOTM1_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T2" ShowInGroupFooterColumn="WW_HOTM1_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T3" ShowInGroupFooterColumn="WW_HOTM1_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T4" ShowInGroupFooterColumn="WW_HOTM1_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM1_T5" ShowInGroupFooterColumn="WW_HOTM1_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T1" ShowInGroupFooterColumn="WW_HOTM2_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T2" ShowInGroupFooterColumn="WW_HOTM2_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T3" ShowInGroupFooterColumn="WW_HOTM2_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T4" ShowInGroupFooterColumn="WW_HOTM2_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM2_T5" ShowInGroupFooterColumn="WW_HOTM2_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T1" ShowInGroupFooterColumn="WW_HOTM3_T1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T2" ShowInGroupFooterColumn="WW_HOTM3_T2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T3" ShowInGroupFooterColumn="WW_HOTM3_T3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T4" ShowInGroupFooterColumn="WW_HOTM3_T4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WW_HOTM3_T5" ShowInGroupFooterColumn="WW_HOTM3_T5" SummaryType="Average" DisplayFormat="{0:0.00}" />

                                                        </TotalSummary>
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
