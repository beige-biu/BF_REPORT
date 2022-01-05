<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shy_equipment_Rep.aspx.cs" Inherits="BF_Report.Manager.Module.Report._SHY.Shy_equipment_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">
                        石灰窑设备报表
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="D_DT" Width="145px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>                                                           
                                                            <dx:GridViewBandColumn Caption="高温风机" VisibleIndex="1">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="风机前轴振动" FieldName="SHY_GWFJ_FJQZD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="风机后轴振动" FieldName="SHY_GWFJ_FJHZD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="风机后轴温度℃" FieldName="SHY_GWFJ_FJHWD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="风机前轴温度℃" FieldName="SHY_GWFJ_FJQWD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电机后轴温度℃" FieldName="SHY_GWFJ_DJHWD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电机前轴温度℃" FieldName="SHY_GWFJ_DJQWD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电机定子温度A" FieldName="SHY_GWFJ_DJDZWD1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电机定子温度B" FieldName="SHY_GWFJ_DJDZWD2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电机定子温度C" FieldName="SHY_GWFJ_DJDZWD3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电机电流反馈" FieldName="SHY_GWFJ_DJDLFK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="变频给定" FieldName="SHY_GWFJ_BPGD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="10">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="风门给定" FieldName="SHY_GWFJ_FMGD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="11">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="转速反馈" FieldName="SHY_GWFJ_ZSFK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="二次风机" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="电机电流A" FieldName="SHY_ECFJ_DJDL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="转速给定Hz" FieldName="SHY_ECFJ_ZSGD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电机转速r/m" FieldName="SHY_ECKQ_ZS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="二次风压力Kp" FieldName="SHY_ECKQ_YL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewDataTextColumn Caption="1#冷却下料红外测温℃" FieldName="SHY_LQXLHWCW1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="2#冷却下料红外测温℃" FieldName="SHY_LQXLHWCW2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewBandColumn Caption="回转窑" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="窑速给定r/m" FieldName="SHY_HZY_YSGD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="转速r/m" FieldName="SHY_HZY_ZS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电流A" FieldName="SHY_YZDL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="预热器液压站油箱温度℃" FieldName="SHY_HZY_YRQWD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="煤气入口压力Kp" FieldName="SHY_HZY_MQRKYL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="煤粉给定量t/h" FieldName="SHY_HZY_MFGDL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="1#托轮" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油温℃" FieldName="SHY_HZYTL_YW1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度℃" FieldName="SHY_HZYTL_WD1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2#托轮" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油温℃" FieldName="SHY_HZYTL_YW2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度℃" FieldName="SHY_HZYTL_WD2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="3#托轮" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油温℃" FieldName="SHY_HZYTL_YW3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度℃" FieldName="SHY_HZYTL_WD3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="4#托轮" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油温℃" FieldName="SHY_HZYTL_YW4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度℃" FieldName="SHY_HZYTL_WD4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="5#托轮" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油温℃" FieldName="SHY_HZYTL_YW5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度℃" FieldName="SHY_HZYTL_WD5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="6#托轮" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油温℃" FieldName="SHY_HZYTL_YW6" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度℃" FieldName="SHY_HZYTL_WD6" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="7#托轮" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油温℃" FieldName="SHY_HZYTL_YW7" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度℃" FieldName="SHY_HZYTL_WD7" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="8#托轮" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油温℃" FieldName="SHY_HZYTL_YW8" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度℃" FieldName="SHY_HZYTL_WD8" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption=""  ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="14">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="D_DT" ShowInGroupFooterColumn="D_DT" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_FJQZD" ShowInGroupFooterColumn="SHY_GWFJ_FJQZD" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_FJHZD" ShowInGroupFooterColumn="SHY_GWFJ_FJHZD" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_FJHWD" ShowInGroupFooterColumn="SHY_GWFJ_FJHWD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_FJQWD" ShowInGroupFooterColumn="SHY_GWFJ_FJQWD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_DJHWD" ShowInGroupFooterColumn="SHY_GWFJ_DJHWD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_DJQWD" ShowInGroupFooterColumn="SHY_GWFJ_DJQWD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_DJDZWD1" ShowInGroupFooterColumn="SHY_GWFJ_DJDZWD1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_DJDZWD2" ShowInGroupFooterColumn="SHY_GWFJ_DJDZWD2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_DJDZWD3" ShowInGroupFooterColumn="SHY_GWFJ_DJDZWD3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_DJDLFK" ShowInGroupFooterColumn="SHY_GWFJ_DJDLFK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_BPGD" ShowInGroupFooterColumn="SHY_GWFJ_BPGD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_FMGD" ShowInGroupFooterColumn="SHY_GWFJ_FMGD" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_GWFJ_ZSFK" ShowInGroupFooterColumn="SHY_GWFJ_ZSFK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_ECFJ_DJDL" ShowInGroupFooterColumn="SHY_ECFJ_DJDL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_ECFJ_ZSGD" ShowInGroupFooterColumn="SHY_ECFJ_ZSGD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_ECKQ_ZS" ShowInGroupFooterColumn="SHY_ECKQ_ZS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_ECKQ_YL" ShowInGroupFooterColumn="SHY_ECKQ_YL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_LQXLHWCW1" ShowInGroupFooterColumn="SHY_LQXLHWCW1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_LQXLHWCW2" ShowInGroupFooterColumn="SHY_LQXLHWCW2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZY_YSGD" ShowInGroupFooterColumn="SHY_HZY_YSGD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZY_ZS" ShowInGroupFooterColumn="SHY_HZY_ZS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_YZDL" ShowInGroupFooterColumn="SHY_YZDL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZY_YRQWD" ShowInGroupFooterColumn="SHY_HZY_YRQWD" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZY_MQRKYL" ShowInGroupFooterColumn="SHY_HZY_MQRKYL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZY_MFGDL" ShowInGroupFooterColumn="SHY_HZY_MFGDL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_YW1" ShowInGroupFooterColumn="SHY_HZYTL_YW1" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_WD1" ShowInGroupFooterColumn="SHY_HZYTL_WD1" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_YW2" ShowInGroupFooterColumn="SHY_HZYTL_YW2" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_WD2" ShowInGroupFooterColumn="SHY_HZYTL_WD2" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_WD3" ShowInGroupFooterColumn="SHY_HZYTL_WD3" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_YW3" ShowInGroupFooterColumn="SHY_HZYTL_YW3" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_YW4" ShowInGroupFooterColumn="SHY_HZYTL_YW4" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_WD4" ShowInGroupFooterColumn="SHY_HZYTL_WD4" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_YW5" ShowInGroupFooterColumn="SHY_HZYTL_YW5" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_WD5" ShowInGroupFooterColumn="SHY_HZYTL_WD5" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_YW6" ShowInGroupFooterColumn="SHY_HZYTL_YW6" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_WD6" ShowInGroupFooterColumn="SHY_HZYTL_WD6" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_YW7" ShowInGroupFooterColumn="SHY_HZYTL_YW7" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_WD7" ShowInGroupFooterColumn="SHY_HZYTL_WD7" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_WD8" ShowInGroupFooterColumn="SHY_HZYTL_WD8" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_HZYTL_YW8" ShowInGroupFooterColumn="SHY_HZYTL_YW8" SummaryType="Average" DisplayFormat="{0:0}" />
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
