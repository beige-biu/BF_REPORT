<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BFRun2_Rep_fal.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.BFRun2_Rep_fal" %>

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
                        高炉运行月报表
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
                                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxButton ID="btnQuery" Font-Size="14px" runat="server" Text="查询" AutoPostBack="false" Width="80px">
                                                    <ClientSideEvents Click="function(s,e){OnQueryClick();}" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="" Width="20px">
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="95px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="MM-dd HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="料批" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="批" FieldName="ACCUM_CHARGE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

<%--                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" >
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="WORK_TEAM" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="小时料批" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="CH/h" FieldName="HOUR_CHARGE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="煤气利用率" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="GAS_USE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="风量" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³/min" FieldName="BLAST_AMOUNT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="热风压" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="HOT_PRESS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="冷风压" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="COLD_PRESS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="炉顶压" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="TOP_PRESS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                             <dx:GridViewBandColumn Caption="中部压差" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="BOTTOM_PRESS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="压差" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="上部" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="TOP_PRESSDIFF" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="下部" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="BOTTOM_PRESSDIFF" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="压差率" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="上部" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="TOP_PRESSRATIO" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中部" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="MIDDLE_PRESSRATIO" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="下部" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="BOTTOM_PRESSRATIO" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="透气性" FieldName="TQX" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="热风温" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="BLAST_TEMP" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="炉顶温" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="最高" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TOP_TEMPMAX" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="最低" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TOP_TEMPMIN" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="平均" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TOP_TEMPAVG" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="富氧率" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="RICH_OXY_RATIO" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="富氧量" VisibleIndex="14">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="RICH_OXY_AMOUNT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="75px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="喷煤量" VisibleIndex="15">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="大(t)" FieldName="COKE_JET" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="小(t)" FieldName="COKE_JET1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="煤比" VisibleIndex="16">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kg/t" FieldName="COKE_RATIO" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <%--<dx:GridViewBandColumn Caption="标准风速" VisibleIndex="17">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m/s" FieldName="BLAST_SPEED" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="实际风速" VisibleIndex="18">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m/s" FieldName="ACT_SPEED" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="燃烧温度" VisibleIndex="19">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="TH_BURN_TEMP" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                          <%--  <dx:GridViewBandColumn Caption="鼓风动能" VisibleIndex="20">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Kg.m/s" FieldName="BLAST_ENERGY" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="75px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="全压差" VisibleIndex="21">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="P_ALL" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                           <%-- <dx:GridViewDataTextColumn Caption="上部透气性指数" FieldName="TQX_T" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="22" Visible="false">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="下部透气性指数" FieldName="TQX_B" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="23" Visible="false">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="炉腹煤气量" VisibleIndex="24">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³/min" FieldName="GAS_AMOUNT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="工业水压" VisibleIndex="25">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="P_IND_WATER" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="工业水压2" VisibleIndex="25">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="kPa" FieldName="XBG" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="软水压" VisibleIndex="26">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="软水压1(进水)" FieldName="P_SOFT1_WATER" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="软水压2(出水)" FieldName="P_SOFT2_WATER" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="十字测温中心温度" VisibleIndex="27">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="T_TEN_HEART" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="炉底中心温度" VisibleIndex="28">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1层TE1101" FieldName="T_LD_HEART" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <%--<dx:GridViewDataTextColumn Caption="2层TE1102" FieldName="T_LJ_HEART" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                           <%-- <dx:GridViewBandColumn Caption="高压富氧" VisibleIndex="29">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="GY_OXY_AMOUNT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="机前富氧" VisibleIndex="30">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m³" FieldName="R_LG_ACTIVE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="鼓风湿度" VisibleIndex="31">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="RH" FieldName="LT_RFH" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="混风前主管温度" VisibleIndex="32">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="℃" FieldName="TEMPHFQ" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="" VisibleIndex="33">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="m/min" FieldName="SPEED_LMXJ" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                      
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
<%--                                                            <dx:ASPxSummaryItem FieldName="HOUR_CHARGE" ShowInGroupFooterColumn="HOUR_CHARGE" SummaryType="Sum" DisplayFormat="{0:0}" />--%>
                                                            <dx:ASPxSummaryItem FieldName="accum_charge" ShowInGroupFooterColumn="accum_charge" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="GAS_USE" ShowInGroupFooterColumn="GAS_USE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLAST_AMOUNT" ShowInGroupFooterColumn="BLAST_AMOUNT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HOT_PRESS" ShowInGroupFooterColumn="HOT_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COLD_PRESS" ShowInGroupFooterColumn="COLD_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TOP_PRESS" ShowInGroupFooterColumn="TOP_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BOTTOM_PRESS" ShowInGroupFooterColumn="BOTTOM_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TOP_PRESSDIFF" ShowInGroupFooterColumn="TOP_PRESSDIFF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BOTTOM_PRESSDIFF" ShowInGroupFooterColumn="BOTTOM_PRESSDIFF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TOP_PRESSRATIO" ShowInGroupFooterColumn="TOP_PRESSRATIO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MIDDLE_PRESSRATIO" ShowInGroupFooterColumn="MIDDLE_PRESSRATIO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BOTTOM_PRESSRATIO" ShowInGroupFooterColumn="BOTTOM_PRESSRATIO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TQX" ShowInGroupFooterColumn="TQX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLAST_TEMP" ShowInGroupFooterColumn="BLAST_TEMP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TOP_TEMPMAX" ShowInGroupFooterColumn="TOP_TEMPMAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TOP_TEMPMIN" ShowInGroupFooterColumn="TOP_TEMPMIN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TOP_TEMPAVG" ShowInGroupFooterColumn="TOP_TEMPAVG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="RICH_OXY_RATIO" ShowInGroupFooterColumn="RICH_OXY_RATIO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="RICH_OXY_AMOUNT" ShowInGroupFooterColumn="RICH_OXY_AMOUNT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_JET" ShowInGroupFooterColumn="COKE_JET" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_JET1" ShowInGroupFooterColumn="COKE_JET1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_RATIO" ShowInGroupFooterColumn="COKE_RATIO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLAST_SPEED" ShowInGroupFooterColumn="BLAST_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ACT_SPEED" ShowInGroupFooterColumn="ACT_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TH_BURN_TEMP" ShowInGroupFooterColumn="TH_BURN_TEMP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BLAST_ENERGY" ShowInGroupFooterColumn="BLAST_ENERGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_ALL" ShowInGroupFooterColumn="P_ALL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TQX_T" ShowInGroupFooterColumn="TQX_T" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TQX_B" ShowInGroupFooterColumn="TQX_B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GAS_AMOUNT" ShowInGroupFooterColumn="GAS_AMOUNT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_IND_WATER" ShowInGroupFooterColumn="P_IND_WATER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="XBG" ShowInGroupFooterColumn="XBG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_SOFT1_WATER" ShowInGroupFooterColumn="P_SOFT1_WATER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_SOFT2_WATER" ShowInGroupFooterColumn="P_SOFT2_WATER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_TEN_HEART" ShowInGroupFooterColumn="T_TEN_HEART" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_LD_HEART" ShowInGroupFooterColumn="T_LD_HEART" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_LJ_HEART" ShowInGroupFooterColumn="T_LJ_HEART" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="R_LG_ACTIVE" ShowInGroupFooterColumn="R_LG_ACTIVE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GY_OXY_AMOUNT" ShowInGroupFooterColumn="GY_OXY_AMOUNT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_RFH" ShowInGroupFooterColumn="LT_RFH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TEMPHFQ" ShowInGroupFooterColumn="TEMPHFQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SPEED_LMXJ" ShowInGroupFooterColumn="SPEED_LMXJ" SummaryType="Average" DisplayFormat="{0:0.00}" />
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
