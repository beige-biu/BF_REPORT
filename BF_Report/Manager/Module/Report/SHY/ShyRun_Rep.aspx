<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShyRun_Rep.aspx.cs" Inherits="BF_Report.Manager.Module.Report._SHY.ShyRun_Rep" %>

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
                        石灰窑运行日报表
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
                                                            <dx:GridViewDataTextColumn Caption="日期" FieldName="PRODUCT_DATE" Width="105px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>                                                            
                                                            <dx:GridViewDataTextColumn Caption="时刻" FieldName="CLOCK_TIME" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="二次空气" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="风量" FieldName="AIR_FLOW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="75px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="AIR_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口闸板开度" FieldName="AIR_ANGLE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="风温" FieldName="AIR_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="转速" FieldName="AIR_ROTATE_SPEED" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="罗茨风机" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="主电机电流" FieldName="SENDER_FLOW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="SENDER_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="入口闸板开度" FieldName="SENDER_ANGLE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="回转窑设备" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="窑尾CO" FieldName="LIMEKILN_CO" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="窑头温度" FieldName="LIMEKILN_HEAD_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="窑头压力" FieldName="LIMEKILN_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="窑速度" FieldName="LIMEKILN_SPEED" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="主电机电流" FieldName="LIMEKILN_ELECTRICITY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="预热器设备" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="料仓料位" FieldName="PREWARM_MATERIAL_LEVEL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口温度" FieldName="PREWARM_EXIT_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="窑尾压力" FieldName="PREWARM_TAIL_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="窑尾温度" FieldName="PREWARM_TAIL_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="冷风阀１开口度" FieldName="PREWARM_ANGLE1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="冷风阀２开口度" FieldName="PREWARM_ANGLE2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="顶部温度" FieldName="PREWARM_TOP_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="6">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="布袋除尘器" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="料仓料位" FieldName="DUST_MATERIAL_LEVEL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="进口压力" FieldName="DUST_ENTRANCE_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口压力" FieldName="DUST_EXIT_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="入口温度" FieldName="DUST_ENTRANCE_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口温度" FieldName="DUST_EXIT_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="冷风阀闸板3开度" FieldName="DUST_CODEWIND_ANGLE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="主抽风机" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="转速" FieldName="DUST_ROTATE_SPEED" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电流" FieldName="DUST_ELECTRICITY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="入口闸板开度" FieldName="DUST_ENTRANCE_ANGLE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤粉供应量" FieldName="COAL_QNT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="8">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="生产产品量" FieldName="PROD_OUT_QNT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="9">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="一次风机" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="风量" FieldName="ONCE_FLOW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="ONCE_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="风门开口度" FieldName="SHY_YCFJ_FMKKD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="能源介质" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="天然气压力" FieldName="NATURAL_GAS_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="天然气流量" FieldName="NATURAL_GAS_FLOW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="转炉煤气压力" FieldName="CONVERTER_GAS_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="转炉煤气流量" FieldName="CONVERTER_GAS_FLOW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤粉下料量" FieldName="COAL_BIN_QNT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="12">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤粉仓温度" FieldName="COAL_BIN_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="13">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="皮带秤反馈" FieldName="SHY_PDCFK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="14">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="推杆间隔时间" FieldName="SHY_TKJGSJ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="15">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="南风管温度" FieldName="SHY_NFGWD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="16">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="北风管温度" FieldName="SHY_BFGWD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="17">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="二次空气累计量" FieldName="SHY_ECKQLJL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="18">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="粉灰料位2#" FieldName="SHY_FHLW2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="19">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块灰料位1#" FieldName="SHY_KHLW1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="20">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块灰料位3#" FieldName="SHY_KHLW3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="21">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="窑主电流" FieldName="SHY_YZDL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="22">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="碎石库料位" FieldName="SHY_SSKLW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="23">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="原料库料位1#" FieldName="SHY_YLKLW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="24">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="原料库料位2#" FieldName="SHY_YLKLW2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="25">
                                                            </dx:GridViewDataTextColumn>                                                           
                                                            <dx:GridViewDataTextColumn Caption="" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="26">
                                                            </dx:GridViewDataTextColumn>


                                                        </Columns>
                                                        
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="PRODUCT_DATE" ShowInGroupFooterColumn="PRODUCT_DATE" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="AIR_FLOW" ShowInGroupFooterColumn="AIR_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AIR_PRESS" ShowInGroupFooterColumn="AIR_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AIR_ANGLE" ShowInGroupFooterColumn="AIR_ANGLE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AIR_TEMP" ShowInGroupFooterColumn="AIR_TEMP" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="AIR_ROTATE_SPEED" ShowInGroupFooterColumn="AIR_ROTATE_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SENDER_FLOW" ShowInGroupFooterColumn="SENDER_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SENDER_PRESS" ShowInGroupFooterColumn="SENDER_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SENDER_ANGLE" ShowInGroupFooterColumn="SENDER_ANGLE" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="LIMEKILN_CO" ShowInGroupFooterColumn="LIMEKILN_CO" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="LIMEKILN_HEAD_TEMP" ShowInGroupFooterColumn="LIMEKILN_HEAD_TEMP" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="LIMEKILN_PRESS" ShowInGroupFooterColumn="LIMEKILN_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LIMEKILN_SPEED" ShowInGroupFooterColumn="LIMEKILN_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LIMEKILN_ELECTRICITY" ShowInGroupFooterColumn="LIMEKILN_ELECTRICITY" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="PREWARM_MATERIAL_LEVEL" ShowInGroupFooterColumn="PREWARM_MATERIAL_LEVEL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PREWARM_EXIT_TEMP" ShowInGroupFooterColumn="PREWARM_EXIT_TEMP" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="PREWARM_TAIL_PRESS" ShowInGroupFooterColumn="PREWARM_TAIL_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PREWARM_TAIL_TEMP" ShowInGroupFooterColumn="PREWARM_TAIL_TEMP" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="PREWARM_ANGLE1" ShowInGroupFooterColumn="PREWARM_ANGLE1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PREWARM_ANGLE2" ShowInGroupFooterColumn="PREWARM_ANGLE2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PREWARM_TOP_TEMP" ShowInGroupFooterColumn="PREWARM_TOP_TEMP" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_MATERIAL_LEVEL" ShowInGroupFooterColumn="DUST_MATERIAL_LEVEL" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_ENTRANCE_PRESS" ShowInGroupFooterColumn="DUST_ENTRANCE_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_EXIT_PRESS" ShowInGroupFooterColumn="DUST_EXIT_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_ENTRANCE_TEMP" ShowInGroupFooterColumn="DUST_ENTRANCE_TEMP" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_EXIT_TEMP" ShowInGroupFooterColumn="DUST_EXIT_TEMP" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_CODEWIND_ANGLE" ShowInGroupFooterColumn="DUST_CODEWIND_ANGLE" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_ROTATE_SPEED" ShowInGroupFooterColumn="DUST_ROTATE_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_ELECTRICITY" ShowInGroupFooterColumn="DUST_ELECTRICITY" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="DUST_ENTRANCE_ANGLE" ShowInGroupFooterColumn="DUST_ENTRANCE_ANGLE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_QNT" ShowInGroupFooterColumn="COAL_QNT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PROD_OUT_QNT" ShowInGroupFooterColumn="PROD_OUT_QNT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ONCE_FLOW" ShowInGroupFooterColumn="ONCE_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ONCE_PRESS" ShowInGroupFooterColumn="ONCE_PRESS" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="NATURAL_GAS_PRESS" ShowInGroupFooterColumn="NATURAL_GAS_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="NATURAL_GAS_FLOW" ShowInGroupFooterColumn="NATURAL_GAS_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CONVERTER_GAS_PRESS" ShowInGroupFooterColumn="CONVERTER_GAS_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CONVERTER_GAS_FLOW" ShowInGroupFooterColumn="CONVERTER_GAS_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_BIN_QNT" ShowInGroupFooterColumn="COAL_BIN_QNT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_BIN_TEMP" ShowInGroupFooterColumn="COAL_BIN_TEMP" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_PDCFK" ShowInGroupFooterColumn="SHY_PDCFK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_TKJGSJ" ShowInGroupFooterColumn="SHY_TKJGSJ" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_NFGWD" ShowInGroupFooterColumn="SHY_NFGWD" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_BFGWD" ShowInGroupFooterColumn="SHY_BFGWD" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_YCFJ_FMKKD" ShowInGroupFooterColumn="SHY_YCFJ_FMKKD" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_ECKQLJL" ShowInGroupFooterColumn="SHY_ECKQLJL" SummaryType="Average" DisplayFormat="{0:0}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_FHLW2" ShowInGroupFooterColumn="SHY_FHLW2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_KHLW1" ShowInGroupFooterColumn="SHY_KHLW1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_KHLW3" ShowInGroupFooterColumn="SHY_KHLW3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_YZDL" ShowInGroupFooterColumn="SHY_YZDL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_SSKLW" ShowInGroupFooterColumn="SHY_SSKLW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_YLKLW" ShowInGroupFooterColumn="SHY_YLKLW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SHY_YLKLW2" ShowInGroupFooterColumn="SHY_YLKLW2" SummaryType="Average" DisplayFormat="{0:0.00}" />
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
