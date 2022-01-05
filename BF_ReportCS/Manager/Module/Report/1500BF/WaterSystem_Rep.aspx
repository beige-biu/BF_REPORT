<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaterSystem_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.WaterSystem_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">高炉水系统日报表
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="55px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="WORK_TEAM" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="高炉本体软水供水泵组出水总管" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="FT6102" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量_1" FieldName="FT6101" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE6101" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="PT6101" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="高炉净环低压泵组出水总管" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="FT6002" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE6002" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="PT6002" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="高炉炉体热风阀软水回水总管" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE6103" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="PT6103" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="高炉小套高压泵组出水总管" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="FT6001" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE6001" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="PT6001" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="净环旁滤泵组出水总管" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="FT6003" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE6003" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="PT6003" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <%--<dx:GridViewDataTextColumn Caption="净环强制排污水管流量" FieldName="FT6005" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="60px" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewBandColumn Caption="热水上塔泵组出水总管" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="FT6004" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE6004" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="PT6004" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="软水事故供水泵组出水总管" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="FT6106" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE6106" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="PT6106" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="软水箱补厂区软水管道流量" FieldName="FT6113" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="60px" VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="软水补水供水泵组出水总管" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="FT6107" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE6107" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="PT6107" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="高炉低压净循环供水泵电流" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1#" FieldName="AMP_GSB_M1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2#" FieldName="AMP_GSB_M2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="净环冷却塔电流" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1#" FieldName="AMP_LQT_M1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2#" FieldName="AMP_LQT_M2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="软水箱液位" VisibleIndex="14">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1#" FieldName="LT6111" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2#" FieldName="LT6112" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <%--<dx:GridViewBandColumn Caption="1#冷却塔" VisibleIndex="15">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="湿度" FieldName="AT_LQT_1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="油位" FieldName="LT_LQT_M1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="振动" FieldName="VT_LQT_M1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <%--<dx:GridViewBandColumn Caption="2#冷却塔" VisibleIndex="16">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="湿度" FieldName="AT_LQT_2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="油位" FieldName="LT_LQT_M2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="振动" FieldName="VT_LQT_M2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="厂区生产水补水管流量" VisibleIndex="17">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="S1" FieldName="FT6006" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="S8" FieldName="FT6007" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="膨胀管液位" VisibleIndex="18">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="高炉" FieldName="LT_BF_PZG" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="热风炉" FieldName="LT_HS_PZG" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="净环冷水池液位" FieldName="LT6011" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="60px" VisibleIndex="19">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="净环热水池液位" FieldName="LT6012" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="60px" VisibleIndex="20">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="空冷器出水管" VisibleIndex="21">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度1" FieldName="TE6104" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度2" FieldName="TE6105" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力1" FieldName="PT6104" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力2" FieldName="PT6105" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="60px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="生产新水流量" FieldName="FT_SCS" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="60px" VisibleIndex="22">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="10px" VisibleIndex="23">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="FT6102" ShowInGroupFooterColumn="FT6102" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6101" ShowInGroupFooterColumn="FT6101" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6101" ShowInGroupFooterColumn="TE6101" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6101" ShowInGroupFooterColumn="PT6101" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6002" ShowInGroupFooterColumn="FT6002" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6002" ShowInGroupFooterColumn="TE6002" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6002" ShowInGroupFooterColumn="PT6002" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6103" ShowInGroupFooterColumn="TE6103" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6103" ShowInGroupFooterColumn="PT6103" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6001" ShowInGroupFooterColumn="FT6001" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6001" ShowInGroupFooterColumn="TE6001" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6001" ShowInGroupFooterColumn="PT6001" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6003" ShowInGroupFooterColumn="FT6003" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6003" ShowInGroupFooterColumn="TE6003" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6003" ShowInGroupFooterColumn="PT6003" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6005" ShowInGroupFooterColumn="FT6005" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6004" ShowInGroupFooterColumn="FT6004" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6004" ShowInGroupFooterColumn="TE6004" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6004" ShowInGroupFooterColumn="PT6004" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6106" ShowInGroupFooterColumn="FT6106" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6106" ShowInGroupFooterColumn="PT6106" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6106" ShowInGroupFooterColumn="TE6106" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6113" ShowInGroupFooterColumn="FT6113" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6107" ShowInGroupFooterColumn="FT6107" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6107" ShowInGroupFooterColumn="TE6107" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6107" ShowInGroupFooterColumn="PT6107" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AMP_GSB_M1" ShowInGroupFooterColumn="AMP_GSB_M1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AMP_GSB_M2" ShowInGroupFooterColumn="AMP_GSB_M2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AMP_LQT_M1" ShowInGroupFooterColumn="AMP_LQT_M1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AT_LQT_1" ShowInGroupFooterColumn="AT_LQT_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_LQT_M1" ShowInGroupFooterColumn="LT_LQT_M1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="VT_LQT_M1" ShowInGroupFooterColumn="VT_LQT_M1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT6111" ShowInGroupFooterColumn="LT6111" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AMP_LQT_M2" ShowInGroupFooterColumn="AMP_LQT_M2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AT_LQT_2" ShowInGroupFooterColumn="AT_LQT_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_LQT_M2" ShowInGroupFooterColumn="LT_LQT_M2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="VT_LQT_M2" ShowInGroupFooterColumn="VT_LQT_M2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT6112" ShowInGroupFooterColumn="LT6112" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6006" ShowInGroupFooterColumn="FT6006" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6007" ShowInGroupFooterColumn="FT6007" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_BF_PZG" ShowInGroupFooterColumn="LT_BF_PZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_HS_PZG" ShowInGroupFooterColumn="LT_HS_PZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT6011" ShowInGroupFooterColumn="LT6011" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT6012" ShowInGroupFooterColumn="LT6012" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6104" ShowInGroupFooterColumn="TE6104" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6105" ShowInGroupFooterColumn="TE6105" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6104" ShowInGroupFooterColumn="PT6104" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6105" ShowInGroupFooterColumn="PT6105" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT_SCS" ShowInGroupFooterColumn="FT_SCS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="FT6102" ShowInGroupFooterColumn="FT6102" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6101" ShowInGroupFooterColumn="FT6101" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6101" ShowInGroupFooterColumn="TE6101" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6101" ShowInGroupFooterColumn="PT6101" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6002" ShowInGroupFooterColumn="FT6002" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6002" ShowInGroupFooterColumn="TE6002" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6002" ShowInGroupFooterColumn="PT6002" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6103" ShowInGroupFooterColumn="TE6103" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6103" ShowInGroupFooterColumn="PT6103" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6001" ShowInGroupFooterColumn="FT6001" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6001" ShowInGroupFooterColumn="TE6001" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6001" ShowInGroupFooterColumn="PT6001" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6003" ShowInGroupFooterColumn="FT6003" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6003" ShowInGroupFooterColumn="TE6003" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6003" ShowInGroupFooterColumn="PT6003" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6005" ShowInGroupFooterColumn="FT6005" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6004" ShowInGroupFooterColumn="FT6004" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6004" ShowInGroupFooterColumn="TE6004" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6004" ShowInGroupFooterColumn="PT6004" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6106" ShowInGroupFooterColumn="FT6106" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6106" ShowInGroupFooterColumn="PT6106" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6106" ShowInGroupFooterColumn="TE6106" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6113" ShowInGroupFooterColumn="FT6113" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6107" ShowInGroupFooterColumn="FT6107" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6107" ShowInGroupFooterColumn="TE6107" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6107" ShowInGroupFooterColumn="PT6107" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AMP_GSB_M1" ShowInGroupFooterColumn="AMP_GSB_M1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AMP_GSB_M2" ShowInGroupFooterColumn="AMP_GSB_M2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AMP_LQT_M1" ShowInGroupFooterColumn="AMP_LQT_M1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AT_LQT_1" ShowInGroupFooterColumn="AT_LQT_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_LQT_M1" ShowInGroupFooterColumn="LT_LQT_M1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="VT_LQT_M1" ShowInGroupFooterColumn="VT_LQT_M1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT6111" ShowInGroupFooterColumn="LT6111" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AMP_LQT_M2" ShowInGroupFooterColumn="AMP_LQT_M2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AT_LQT_2" ShowInGroupFooterColumn="AT_LQT_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_LQT_M2" ShowInGroupFooterColumn="LT_LQT_M2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="VT_LQT_M2" ShowInGroupFooterColumn="VT_LQT_M2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT6112" ShowInGroupFooterColumn="LT6112" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6006" ShowInGroupFooterColumn="FT6006" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT6007" ShowInGroupFooterColumn="FT6007" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_BF_PZG" ShowInGroupFooterColumn="LT_BF_PZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_HS_PZG" ShowInGroupFooterColumn="LT_HS_PZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT6011" ShowInGroupFooterColumn="LT6011" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT6012" ShowInGroupFooterColumn="LT6012" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6104" ShowInGroupFooterColumn="TE6104" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE6105" ShowInGroupFooterColumn="TE6105" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6104" ShowInGroupFooterColumn="PT6104" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT6105" ShowInGroupFooterColumn="PT6105" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT_SCS" ShowInGroupFooterColumn="FT_SCS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
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
