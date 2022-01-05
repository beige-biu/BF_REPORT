<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STRun_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._360ST.STRun_Rep_1" %>

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
        #cbp_Base_gridBase1_DXHeadersRow0 {
            height:30px !important;
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
                    <td width="100%;" height="30px" align="center" valign="center">
                        360烧结操作日志
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
                                            OnCallback="cbp_Base_Callback" ClientInstanceName="cbp_Base" HideContentOnCallback="False" EnableViewState="True">
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
                                                           
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_DATE" Width="110px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="MM-dd HH:00"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewBandColumn Caption="烧结机速度" VisibleIndex="1">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m/min" FieldName="SJ_SI_302" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="环冷机速度" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m/min" FieldName="SJ_SI_305" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="二次混合机电机频率" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Hz" FieldName="HH2_PCIOUT2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用煤气压力" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="SJ_PR_301" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用空气压力" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="SJ_PR_302" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用煤气流量" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="SJ_FRQ_301" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用空气流量" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="SJ_FRQ_302" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="预热炉煤气温流量" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="SJ_FRQ_381" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="80px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="预热炉空气温流量" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="SJ_FRQ_382" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="80px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="预热炉煤气压力" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="SJ_PR_381" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="预热炉空气压力" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="SJ_PR_382" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用煤气热值" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Kcal/m3" FieldName="SJ_AR_301" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="一混后混合料含水量" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="ROUND(HH_MI_202,2)" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="二混后混合料含水量" VisibleIndex="14">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="HH_MI_211" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="铺地料矿槽位" VisibleIndex="15">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="t" FieldName="SJ_LISA_301" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="混合料矿槽位" VisibleIndex="16">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="t" FieldName="ROUND(SJ_LISA_302,2)" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="冷返矿仓料位" VisibleIndex="17">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="t" FieldName="ROUND(PL_LISA_113,2)" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="高炉返矿仓料位" VisibleIndex="18">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="t" FieldName="ROUND(PL_LISA_114,2)" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="北侧主抽风机风门阀位" VisibleIndex="19">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="ZC_HISC_601_FBACK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="南侧主抽风机风门阀位" VisibleIndex="20">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="ZC_HISC_621_FBACK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="北侧主抽风机进口烟气粉尘浓度" VisibleIndex="21">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="ZC_AT_601" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="北侧主抽风机进口烟气含硫量" VisibleIndex="22">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="ZC_AT_602" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="南侧主抽风机进口烟气粉尘浓度" VisibleIndex="23">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="ZC_AT_621" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="南侧主抽风机进口烟气含硫量" VisibleIndex="24">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="ZC_AT_622" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="北侧主抽风机入口烟气流量" VisibleIndex="25">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="ZC_FI_609" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="南侧主抽风机入口烟气流量" VisibleIndex="26">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="ZC_FI_629" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="南侧大烟道废气压力" VisibleIndex="27">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="ROUND(ZC_PI_304,2)" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="北侧大烟道废气压力" VisibleIndex="28">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="ROUND(ZC_PI_305,2)" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="北侧大烟道废气流量" VisibleIndex="29">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="SJ_FI_303" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="南侧大烟道废气流量" VisibleIndex="30">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="SJ_FI_304" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="保温炉温度" VisibleIndex="31">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TR_303A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火炉温（北）" VisibleIndex="32">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TR_303B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                           <%-- <dx:GridViewBandColumn Caption="预热炉炉膛温度" VisibleIndex="33">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_385" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="混合料温度" VisibleIndex="45">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_356" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="烧结矿冷却前温度" VisibleIndex="35">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_357" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="烧结矿冷却后温度" VisibleIndex="36">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_358" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="北侧大烟道废气温度" VisibleIndex="37">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_304" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="南侧大烟道废气温度" VisibleIndex="38">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_305" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用煤气温度" VisibleIndex="39">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TR_301" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用空气温度" VisibleIndex="40">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TR_302" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="预热炉煤气温度" VisibleIndex="41">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TR_381" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="预热炉空气温度" VisibleIndex="42">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TR_382" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="烧结厂区压缩空气总管温度" VisibleIndex="43">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_337" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="烧结厂区氮气总管温度" VisibleIndex="44">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_338" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火炉温（南）" VisibleIndex="34">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TI_385_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="空气预热后温度" VisibleIndex="46">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="SJ_TR_384" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                           
                                                            
                                                            <dx:GridViewBandColumn Caption="" VisibleIndex="47">
                                                               <%-- <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m3/h" FieldName="ZC_FI_609" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="120px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>--%>
                                                            </dx:GridViewBandColumn>


                                                            


                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_DATE" ShowInGroupFooterColumn="RECORD_DATE" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_SI_302" ShowInGroupFooterColumn="SJ_SI_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_SI_305" ShowInGroupFooterColumn="SJ_SI_305" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HH2_PCIOUT2" ShowInGroupFooterColumn="HH2_PCIOUT2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_PR_301" ShowInGroupFooterColumn="SJ_PR_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_PR_302" ShowInGroupFooterColumn="SJ_PR_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_301" ShowInGroupFooterColumn="SJ_FRQ_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_302" ShowInGroupFooterColumn="SJ_FRQ_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_381" ShowInGroupFooterColumn="SJ_FRQ_381" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_382" ShowInGroupFooterColumn="SJ_FRQ_382" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_PR_381" ShowInGroupFooterColumn="SJ_PR_381" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_PR_382" ShowInGroupFooterColumn="SJ_PR_382" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_AR_301" ShowInGroupFooterColumn="SJ_AR_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(HH_MI_202,2)" ShowInGroupFooterColumn="ROUND(HH_MI_202,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HH_MI_211" ShowInGroupFooterColumn="HH_MI_211" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_LISA_301" ShowInGroupFooterColumn="SJ_LISA_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(SJ_LISA_302,2)" ShowInGroupFooterColumn="ROUND(SJ_LISA_302,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(PL_LISA_113,2)" ShowInGroupFooterColumn="ROUND(PL_LISA_113,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(PL_LISA_114,2)" ShowInGroupFooterColumn="ROUND(PL_LISA_114,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_HISC_601_FBACK" ShowInGroupFooterColumn="ZC_HISC_601_FBACK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_HISC_621_FBACK" ShowInGroupFooterColumn="ZC_HISC_621_FBACK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_AT_601" ShowInGroupFooterColumn="ZC_AT_601" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_AT_602" ShowInGroupFooterColumn="ZC_AT_602" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_AT_621" ShowInGroupFooterColumn="ZC_AT_621" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_AT_622" ShowInGroupFooterColumn="ZC_AT_622" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_FI_609" ShowInGroupFooterColumn="ZC_FI_609" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_FI_629" ShowInGroupFooterColumn="ZC_FI_629" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(ZC_PI_304,2)" ShowInGroupFooterColumn="ROUND(ZC_PI_304,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(ZC_PI_305,2)" ShowInGroupFooterColumn="ROUND(ZC_PI_305,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FI_303" ShowInGroupFooterColumn="SJ_FI_303" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FI_304" ShowInGroupFooterColumn="SJ_FI_304" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_303A" ShowInGroupFooterColumn="SJ_TR_303A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_303B" ShowInGroupFooterColumn="SJ_TR_303B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_356" ShowInGroupFooterColumn="SJ_TI_356" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_357" ShowInGroupFooterColumn="SJ_TI_357" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_358" ShowInGroupFooterColumn="SJ_TI_358" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_304" ShowInGroupFooterColumn="SJ_TI_304" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_305" ShowInGroupFooterColumn="SJ_TI_305" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_301" ShowInGroupFooterColumn="SJ_TR_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_381" ShowInGroupFooterColumn="SJ_TR_381" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_382" ShowInGroupFooterColumn="SJ_TR_382" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_337" ShowInGroupFooterColumn="SJ_TI_337" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_338" ShowInGroupFooterColumn="SJ_TI_338" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_385_1" ShowInGroupFooterColumn="SJ_TI_385_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_384" ShowInGroupFooterColumn="SJ_TR_384" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_302" ShowInGroupFooterColumn="SJ_TR_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_DATE" ShowInGroupFooterColumn="RECORD_DATE" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_SI_302" ShowInGroupFooterColumn="SJ_SI_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_SI_305" ShowInGroupFooterColumn="SJ_SI_305" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HH2_PCIOUT2" ShowInGroupFooterColumn="HH2_PCIOUT2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_PR_301" ShowInGroupFooterColumn="SJ_PR_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_PR_302" ShowInGroupFooterColumn="SJ_PR_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_301" ShowInGroupFooterColumn="SJ_FRQ_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_302" ShowInGroupFooterColumn="SJ_FRQ_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_381" ShowInGroupFooterColumn="SJ_FRQ_381" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_382" ShowInGroupFooterColumn="SJ_FRQ_382" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_PR_381" ShowInGroupFooterColumn="SJ_PR_381" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_PR_382" ShowInGroupFooterColumn="SJ_PR_382" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_AR_301" ShowInGroupFooterColumn="SJ_AR_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(HH_MI_202,2)" ShowInGroupFooterColumn="ROUND(HH_MI_202,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HH_MI_211" ShowInGroupFooterColumn="HH_MI_211" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_LISA_301" ShowInGroupFooterColumn="SJ_LISA_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(SJ_LISA_302,2)" ShowInGroupFooterColumn="ROUND(SJ_LISA_302,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(PL_LISA_113,2)" ShowInGroupFooterColumn="ROUND(PL_LISA_113,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(PL_LISA_114,2)" ShowInGroupFooterColumn="ROUND(PL_LISA_114,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_HISC_601_FBACK" ShowInGroupFooterColumn="ZC_HISC_601_FBACK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_HISC_621_FBACK" ShowInGroupFooterColumn="ZC_HISC_621_FBACK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_AT_601" ShowInGroupFooterColumn="ZC_AT_601" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_AT_602" ShowInGroupFooterColumn="ZC_AT_602" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_AT_621" ShowInGroupFooterColumn="ZC_AT_621" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_AT_622" ShowInGroupFooterColumn="ZC_AT_622" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_FI_609" ShowInGroupFooterColumn="ZC_FI_609" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZC_FI_629" ShowInGroupFooterColumn="ZC_FI_629" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(ZC_PI_304,2)" ShowInGroupFooterColumn="ROUND(ZC_PI_304,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ROUND(ZC_PI_305,2)" ShowInGroupFooterColumn="ROUND(ZC_PI_305,2)" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FI_303" ShowInGroupFooterColumn="SJ_FI_303" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FI_304" ShowInGroupFooterColumn="SJ_FI_304" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_303A" ShowInGroupFooterColumn="SJ_TR_303A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_303B" ShowInGroupFooterColumn="SJ_TR_303B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_356" ShowInGroupFooterColumn="SJ_TI_356" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_357" ShowInGroupFooterColumn="SJ_TI_357" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_358" ShowInGroupFooterColumn="SJ_TI_358" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_304" ShowInGroupFooterColumn="SJ_TI_304" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_305" ShowInGroupFooterColumn="SJ_TI_305" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_301" ShowInGroupFooterColumn="SJ_TR_301" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_381" ShowInGroupFooterColumn="SJ_TR_381" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_382" ShowInGroupFooterColumn="SJ_TR_382" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_337" ShowInGroupFooterColumn="SJ_TI_337" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_338" ShowInGroupFooterColumn="SJ_TI_338" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TI_385_1" ShowInGroupFooterColumn="SJ_TI_385_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_384" ShowInGroupFooterColumn="SJ_TR_384" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TR_302" ShowInGroupFooterColumn="SJ_TR_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
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
