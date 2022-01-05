<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GasDust_Rep.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1500BF.GasDust_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">2#高炉煤气干法除尘日报表
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
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R61-057/0-04-E" Width="100px">
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
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="WORK_TEAM" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="荒煤气总管" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="HMQ_ZG_YL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="HMQ_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="净煤气总管" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="JMQ_ZG_YL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="JMQ_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="含尘量" FieldName="JMQ_ZG_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="1#箱体" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT1_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT1_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT1_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2#箱体" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT2_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT2_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT2_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="3#箱体" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT3_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT3_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT3_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="4#箱体" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT4_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT4_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT4_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="5#箱体" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT5_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT5_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT5_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="6#箱体" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT6_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT6_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT6_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="7#箱体" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT7_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT7_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT7_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="8#箱体" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT8_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT8_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT8_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="9#箱体" VisibleIndex="14">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT9_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT9_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT9_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="10#箱体" VisibleIndex="15">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT10_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT10_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT10_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="11#箱体" VisibleIndex="16">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="XT11_WD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="XT11_HCL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压差" FieldName="XT11_CY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="蒸汽压力" FieldName="ZQ_ZG_YL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="17">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="N2压力" FieldName="DQ_ZG_YL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="18">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="HMQ_ZG_YL" ShowInGroupFooterColumn="HMQ_ZG_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HMQ_WD" ShowInGroupFooterColumn="HMQ_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JMQ_ZG_YL" ShowInGroupFooterColumn="JMQ_ZG_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JMQ_WD" ShowInGroupFooterColumn="JMQ_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JMQ_ZG_HCL" ShowInGroupFooterColumn="JMQ_ZG_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT1_WD" ShowInGroupFooterColumn="XT1_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT2_WD" ShowInGroupFooterColumn="XT2_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT3_WD" ShowInGroupFooterColumn="XT3_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT4_WD" ShowInGroupFooterColumn="XT4_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT5_WD" ShowInGroupFooterColumn="XT5_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT6_WD" ShowInGroupFooterColumn="XT6_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT7_WD" ShowInGroupFooterColumn="XT7_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT8_WD" ShowInGroupFooterColumn="XT8_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT9_WD" ShowInGroupFooterColumn="XT9_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT10_WD" ShowInGroupFooterColumn="XT10_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT11_WD" ShowInGroupFooterColumn="XT11_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT1_HCL" ShowInGroupFooterColumn="XT1_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT2_HCL" ShowInGroupFooterColumn="XT2_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT3_HCL" ShowInGroupFooterColumn="XT3_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT4_HCL" ShowInGroupFooterColumn="XT4_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT5_HCL" ShowInGroupFooterColumn="XT5_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT6_HCL" ShowInGroupFooterColumn="XT6_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT7_HCL" ShowInGroupFooterColumn="XT7_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT8_HCL" ShowInGroupFooterColumn="XT8_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT9_HCL" ShowInGroupFooterColumn="XT9_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT10_HCL" ShowInGroupFooterColumn="XT10_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT11_HCL" ShowInGroupFooterColumn="XT11_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT1_CY" ShowInGroupFooterColumn="XT1_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT2_CY" ShowInGroupFooterColumn="XT2_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT3_CY" ShowInGroupFooterColumn="XT3_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT4_CY" ShowInGroupFooterColumn="XT4_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT5_CY" ShowInGroupFooterColumn="XT5_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT6_CY" ShowInGroupFooterColumn="XT6_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT7_CY" ShowInGroupFooterColumn="XT7_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT8_CY" ShowInGroupFooterColumn="XT8_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT9_CY" ShowInGroupFooterColumn="XT9_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT10_CY" ShowInGroupFooterColumn="XT10_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT11_CY" ShowInGroupFooterColumn="XT11_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZQ_ZG_YL" ShowInGroupFooterColumn="ZQ_ZG_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DQ_ZG_YL" ShowInGroupFooterColumn="DQ_ZG_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="HMQ_ZG_YL" ShowInGroupFooterColumn="HMQ_ZG_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HMQ_WD" ShowInGroupFooterColumn="HMQ_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JMQ_ZG_YL" ShowInGroupFooterColumn="JMQ_ZG_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JMQ_WD" ShowInGroupFooterColumn="JMQ_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JMQ_ZG_HCL" ShowInGroupFooterColumn="JMQ_ZG_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT1_WD" ShowInGroupFooterColumn="XT1_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT2_WD" ShowInGroupFooterColumn="XT2_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT3_WD" ShowInGroupFooterColumn="XT3_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT4_WD" ShowInGroupFooterColumn="XT4_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT5_WD" ShowInGroupFooterColumn="XT5_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT6_WD" ShowInGroupFooterColumn="XT6_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT7_WD" ShowInGroupFooterColumn="XT7_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT8_WD" ShowInGroupFooterColumn="XT8_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT9_WD" ShowInGroupFooterColumn="XT9_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT10_WD" ShowInGroupFooterColumn="XT10_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT11_WD" ShowInGroupFooterColumn="XT11_WD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT1_HCL" ShowInGroupFooterColumn="XT1_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT2_HCL" ShowInGroupFooterColumn="XT2_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT3_HCL" ShowInGroupFooterColumn="XT3_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT4_HCL" ShowInGroupFooterColumn="XT4_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT5_HCL" ShowInGroupFooterColumn="XT5_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT6_HCL" ShowInGroupFooterColumn="XT6_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT7_HCL" ShowInGroupFooterColumn="XT7_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT8_HCL" ShowInGroupFooterColumn="XT8_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT9_HCL" ShowInGroupFooterColumn="XT9_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT10_HCL" ShowInGroupFooterColumn="XT10_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT11_HCL" ShowInGroupFooterColumn="XT11_HCL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT1_CY" ShowInGroupFooterColumn="XT1_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT2_CY" ShowInGroupFooterColumn="XT2_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT3_CY" ShowInGroupFooterColumn="XT3_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT4_CY" ShowInGroupFooterColumn="XT4_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT5_CY" ShowInGroupFooterColumn="XT5_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT6_CY" ShowInGroupFooterColumn="XT6_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT7_CY" ShowInGroupFooterColumn="XT7_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT8_CY" ShowInGroupFooterColumn="XT8_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT9_CY" ShowInGroupFooterColumn="XT9_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT10_CY" ShowInGroupFooterColumn="XT10_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XT11_CY" ShowInGroupFooterColumn="XT11_CY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZQ_ZG_YL" ShowInGroupFooterColumn="ZQ_ZG_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DQ_ZG_YL" ShowInGroupFooterColumn="DQ_ZG_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
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
