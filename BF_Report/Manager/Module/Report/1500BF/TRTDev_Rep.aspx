<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TRTDev_Rep.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1500BF.TRTDev_Rep" %>

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
        #cbp_Base_gridBase1_col25 >table {
            width:60px !important;
        }
    </style>
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
                    <td width="100%;" height="30px" align="center" valign="center">2#高炉TRT生产日报表
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
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R61-080/0-07-E" Width="100px">
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
                                                            <dx:GridViewBandColumn Caption="透平机" VisibleIndex="3" Name="gbc1">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="转速(r/min)" VisibleIndex="0" Name="gbc2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="TAG01" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="B" FieldName="TAG02" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="静叶开度" FieldName="TAG03" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn Caption="轴位移" VisibleIndex="2" Name="gbc3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="TAG04" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="B" FieldName="TAG05" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="前轴承" VisibleIndex="3" Name="gbc4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="振动(μm)A" FieldName="TAG06" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                           <%-- <dx:GridViewDataTextColumn Caption="振动(μm)B" FieldName="TAG07" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>--%>
                                                                            <dx:GridViewDataTextColumn Caption="温度(℃)A" FieldName="TAG10" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                           <%-- <dx:GridViewDataTextColumn Caption="温度(℃)B" FieldName="TAG11" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3">
                                                                            </dx:GridViewDataTextColumn>--%>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="后轴承" VisibleIndex="4" Name="gbc5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="振动(μm)A" FieldName="TAG08" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <%--<dx:GridViewDataTextColumn Caption="振动(μm)B" FieldName="TAG09" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>--%>
                                                                            <dx:GridViewDataTextColumn Caption="温度(℃)A" FieldName="TAG12" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <%--<dx:GridViewDataTextColumn Caption="温度(℃)B" FieldName="TAG13" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3">
                                                                            </dx:GridViewDataTextColumn>--%>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                   <%-- <dx:GridViewBandColumn Caption="止推轴承" VisibleIndex="5" Name="gbc6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度(℃)A" FieldName="TAG14" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度(℃)B" FieldName="TAG15" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>--%>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="动力油系统" VisibleIndex="6" Name="gbc7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="总管压力(kPa)	" FieldName="TAG16" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="液位(%)" FieldName="TAG17" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="TAG18" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="润滑油系统" VisibleIndex="7" Name="gbc8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="远端油压(kPa)	" FieldName="TAG19" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="液位(%)" FieldName="TAG20" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="TAG21" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="冷却器温度(℃)" FieldName="TAG22" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <%--<dx:GridViewDataTextColumn Caption="远端油温(℃)" FieldName="TAG23" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="煤气系统" VisibleIndex="8" Name="gbc9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="煤气流量(m³/h)" FieldName="TAG24" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉顶压(kPa)" FieldName="TAG25" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn Caption="煤气压力(kPa)" VisibleIndex="2" Name="gbc10">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="透平入口" FieldName="TAG26" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="透平出口" FieldName="TAG27" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="煤气温度(℃)" VisibleIndex="3" Name="gbc11">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="透平入口" FieldName="TAG28" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="透平出口" FieldName="TAG29" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="发电机" VisibleIndex="9" Name="gbc12">
                                                                <Columns>
                                                                    <%--<dx:GridViewBandColumn Caption="冷却温度(℃)" VisibleIndex="0" Name="gbc13">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="左进风" FieldName="TAG30" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="右进风" FieldName="TAG31" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>--%>
                                                                    <dx:GridViewBandColumn Caption="定子线圈温度(℃)" VisibleIndex="1" Name="gbc14">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度1" FieldName="TAG32" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度2" FieldName="TAG33" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度3" FieldName="TAG34" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <%--<dx:GridViewDataTextColumn Caption="温度4" FieldName="TAG35" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度5" FieldName="TAG36" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="4">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度6" FieldName="TAG37" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="5">
                                                                            </dx:GridViewDataTextColumn>--%>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="定子铁芯温度(℃)" VisibleIndex="2" Name="gbc15">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度1" FieldName="TAG38" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度2" FieldName="TAG39" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度3" FieldName="TAG40" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <%--<dx:GridViewDataTextColumn Caption="温度4" FieldName="TAG41" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度5" FieldName="TAG42" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="4">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度6" FieldName="TAG43" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="5">
                                                                            </dx:GridViewDataTextColumn>--%>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="TAG01" ShowInGroupFooterColumn="TAG01" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG02" ShowInGroupFooterColumn="TAG02" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG03" ShowInGroupFooterColumn="TAG03" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG04" ShowInGroupFooterColumn="TAG04" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG05" ShowInGroupFooterColumn="TAG05" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG06" ShowInGroupFooterColumn="TAG06" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG07" ShowInGroupFooterColumn="TAG07" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG08" ShowInGroupFooterColumn="TAG08" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                            <dx:ASPxSummaryItem FieldName="TAG09" ShowInGroupFooterColumn="TAG09" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG10" ShowInGroupFooterColumn="TAG10" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG11" ShowInGroupFooterColumn="TAG11" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG12" ShowInGroupFooterColumn="TAG12" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG13" ShowInGroupFooterColumn="TAG13" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG14" ShowInGroupFooterColumn="TAG14" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG15" ShowInGroupFooterColumn="TAG15" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG16" ShowInGroupFooterColumn="TAG16" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG17" ShowInGroupFooterColumn="TAG17" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG18" ShowInGroupFooterColumn="TAG18" SummaryType="Average" DisplayFormat="{0:0.00}" /> 
                                                            <dx:ASPxSummaryItem FieldName="TAG19" ShowInGroupFooterColumn="TAG19" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG20" ShowInGroupFooterColumn="TAG20" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG21" ShowInGroupFooterColumn="TAG21" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG22" ShowInGroupFooterColumn="TAG22" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG23" ShowInGroupFooterColumn="TAG23" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG24" ShowInGroupFooterColumn="TAG24" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG25" ShowInGroupFooterColumn="TAG25" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG26" ShowInGroupFooterColumn="TAG26" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG27" ShowInGroupFooterColumn="TAG27" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG28" ShowInGroupFooterColumn="TAG28" SummaryType="Average" DisplayFormat="{0:0.00}" /> 
                                                            <dx:ASPxSummaryItem FieldName="TAG29" ShowInGroupFooterColumn="TAG29" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG30" ShowInGroupFooterColumn="TAG30" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG31" ShowInGroupFooterColumn="TAG31" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG32" ShowInGroupFooterColumn="TAG32" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG33" ShowInGroupFooterColumn="TAG33" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG34" ShowInGroupFooterColumn="TAG34" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG35" ShowInGroupFooterColumn="TAG35" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG36" ShowInGroupFooterColumn="TAG36" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG37" ShowInGroupFooterColumn="TAG37" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG38" ShowInGroupFooterColumn="TAG38" SummaryType="Average" DisplayFormat="{0:0.00}" /> 
                                                            <dx:ASPxSummaryItem FieldName="TAG39" ShowInGroupFooterColumn="TAG39" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG40" ShowInGroupFooterColumn="TAG40" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG41" ShowInGroupFooterColumn="TAG41" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG42" ShowInGroupFooterColumn="TAG42" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG43" ShowInGroupFooterColumn="TAG43" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="TAG01" ShowInGroupFooterColumn="TAG01" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG02" ShowInGroupFooterColumn="TAG02" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG03" ShowInGroupFooterColumn="TAG03" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG04" ShowInGroupFooterColumn="TAG04" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG05" ShowInGroupFooterColumn="TAG05" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG06" ShowInGroupFooterColumn="TAG06" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG07" ShowInGroupFooterColumn="TAG07" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG08" ShowInGroupFooterColumn="TAG08" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                            <dx:ASPxSummaryItem FieldName="TAG09" ShowInGroupFooterColumn="TAG09" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG10" ShowInGroupFooterColumn="TAG10" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG11" ShowInGroupFooterColumn="TAG11" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG12" ShowInGroupFooterColumn="TAG12" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG13" ShowInGroupFooterColumn="TAG13" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG14" ShowInGroupFooterColumn="TAG14" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG15" ShowInGroupFooterColumn="TAG15" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG16" ShowInGroupFooterColumn="TAG16" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG17" ShowInGroupFooterColumn="TAG17" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG18" ShowInGroupFooterColumn="TAG18" SummaryType="Average" DisplayFormat="{0:0.00}" /> 
                                                            <dx:ASPxSummaryItem FieldName="TAG19" ShowInGroupFooterColumn="TAG19" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG20" ShowInGroupFooterColumn="TAG20" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG21" ShowInGroupFooterColumn="TAG21" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG22" ShowInGroupFooterColumn="TAG22" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG23" ShowInGroupFooterColumn="TAG23" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG24" ShowInGroupFooterColumn="TAG24" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG25" ShowInGroupFooterColumn="TAG25" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG26" ShowInGroupFooterColumn="TAG26" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG27" ShowInGroupFooterColumn="TAG27" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG28" ShowInGroupFooterColumn="TAG28" SummaryType="Average" DisplayFormat="{0:0.00}" /> 
                                                            <dx:ASPxSummaryItem FieldName="TAG29" ShowInGroupFooterColumn="TAG29" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG30" ShowInGroupFooterColumn="TAG30" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG31" ShowInGroupFooterColumn="TAG31" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG32" ShowInGroupFooterColumn="TAG32" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG33" ShowInGroupFooterColumn="TAG33" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG34" ShowInGroupFooterColumn="TAG34" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG35" ShowInGroupFooterColumn="TAG35" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG36" ShowInGroupFooterColumn="TAG36" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG37" ShowInGroupFooterColumn="TAG37" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG38" ShowInGroupFooterColumn="TAG38" SummaryType="Average" DisplayFormat="{0:0.00}" /> 
                                                            <dx:ASPxSummaryItem FieldName="TAG39" ShowInGroupFooterColumn="TAG39" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG40" ShowInGroupFooterColumn="TAG40" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG41" ShowInGroupFooterColumn="TAG41" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG42" ShowInGroupFooterColumn="TAG42" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TAG43" ShowInGroupFooterColumn="TAG43" SummaryType="Average" DisplayFormat="{0:0.00}" />
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
