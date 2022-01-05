<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IronDust_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.IronDust_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">出铁场除尘日报表
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
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
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
                                                            <dx:GridViewBandColumn Caption="风机前轴" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="FAN_FRONT_BEAR_TE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="X振动" FieldName="FAN_FRONT_BEAR_X_VT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Y振动" FieldName="FAN_FRONT_BEAR_Y_VT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="风机后轴" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="FAN_REAR_BEAR_TE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="X振动" FieldName="FAN_REAR_BEAR_X_VT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Y振动" FieldName="FAN_REAR_BEAR_Y_VT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="电机前轴" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="MOTOR_FRONT_BEAR_TE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <%--<dx:GridViewDataTextColumn Caption="X振动" FieldName="MOTOR_FRONT_BEAR_X_VT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Y振动" FieldName="MOTOR_FRONT_BEAR_Y_VT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="电机后轴" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="MOTOR_REAR_BEAR_TE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <%--<dx:GridViewDataTextColumn Caption="X振动" FieldName="MOTOR_REAR_BEAR_X_VT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Y振动" FieldName="MOTOR_REAR_BEAR_Y_VT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="电机定子温度" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="U" FieldName="MOTOR_U_TE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="V" FieldName="MOTOR_V_TE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="W" FieldName="MOTOR_W_TE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="电机" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="电流" FieldName="MOTOR_CURRENT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="转速" FieldName="MOTOR_SPEED" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>  
                                                            <dx:GridViewDataTextColumn Caption="进出口差压" FieldName="OUTLET_DIFF_PT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="气源压力" FieldName="GAS_PT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="风门开度" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="设定" FieldName="DEGREE_SETTING" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="实际" FieldName="DEGREE_FEEDBACK" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>  
                                                            <dx:GridViewBandColumn Caption="输送管压力" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="一区A" FieldName="AREA1_A_SIDE_PT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="一区B" FieldName="AREA1_B_SIDE_PT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="二区A" FieldName="AREA2_A_SIDE_PT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="二区B" FieldName="AREA2_B_SIDE_PT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>  
                                                            <dx:GridViewBandColumn Caption="CEMS" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘" FieldName="CEMS_DUST" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <%--<dx:GridViewDataTextColumn Caption="温度" FieldName="CEMS_TE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                    <dx:GridViewDataTextColumn Caption="压力" FieldName="CEMS_PT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流速" FieldName="CEMS_FLOW_SPEED" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <%--<dx:GridViewDataTextColumn Caption="含水量" FieldName="CEMS_WATER" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="含氧量" FieldName="CEMS_OXYGEN" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:F2}">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>  
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_OXYGEN" ShowInGroupFooterColumn="CEMS_OXYGEN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_WATER" ShowInGroupFooterColumn="CEMS_WATER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_FLOW_SPEED" ShowInGroupFooterColumn="CEMS_FLOW_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_PT" ShowInGroupFooterColumn="CEMS_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_TE" ShowInGroupFooterColumn="CEMS_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_DUST" ShowInGroupFooterColumn="CEMS_DUST" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AREA1_A_SIDE_PT" ShowInGroupFooterColumn="AREA1_A_SIDE_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AREA1_B_SIDE_PT" ShowInGroupFooterColumn="AREA1_B_SIDE_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AREA2_A_SIDE_PT" ShowInGroupFooterColumn="AREA2_A_SIDE_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AREA2_B_SIDE_PT" ShowInGroupFooterColumn="AREA2_B_SIDE_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DEGREE_SETTING" ShowInGroupFooterColumn="DEGREE_SETTING" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DEGREE_FEEDBACK" ShowInGroupFooterColumn="DEGREE_FEEDBACK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GAS_PT" ShowInGroupFooterColumn="GAS_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OUTLET_DIFF_PT" ShowInGroupFooterColumn="OUTLET_DIFF_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_SPEED" ShowInGroupFooterColumn="MOTOR_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_CURRENT" ShowInGroupFooterColumn="MOTOR_CURRENT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_W_TE" ShowInGroupFooterColumn="MOTOR_W_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_V_TE" ShowInGroupFooterColumn="MOTOR_V_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_U_TE" ShowInGroupFooterColumn="MOTOR_U_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_REAR_BEAR_Y_VT" ShowInGroupFooterColumn="MOTOR_REAR_BEAR_Y_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_REAR_BEAR_X_VT" ShowInGroupFooterColumn="MOTOR_REAR_BEAR_X_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_REAR_BEAR_TE" ShowInGroupFooterColumn="MOTOR_REAR_BEAR_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_FRONT_BEAR_Y_VT" ShowInGroupFooterColumn="MOTOR_FRONT_BEAR_Y_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_FRONT_BEAR_X_VT" ShowInGroupFooterColumn="MOTOR_FRONT_BEAR_X_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_FRONT_BEAR_TE" ShowInGroupFooterColumn="MOTOR_FRONT_BEAR_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_REAR_BEAR_Y_VT" ShowInGroupFooterColumn="FAN_REAR_BEAR_Y_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_REAR_BEAR_X_VT" ShowInGroupFooterColumn="FAN_REAR_BEAR_X_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_REAR_BEAR_TE" ShowInGroupFooterColumn="FAN_REAR_BEAR_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_FRONT_BEAR_Y_VT" ShowInGroupFooterColumn="FAN_FRONT_BEAR_Y_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_FRONT_BEAR_X_VT" ShowInGroupFooterColumn="FAN_FRONT_BEAR_X_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_FRONT_BEAR_TE" ShowInGroupFooterColumn="FAN_FRONT_BEAR_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_OXYGEN" ShowInGroupFooterColumn="CEMS_OXYGEN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_WATER" ShowInGroupFooterColumn="CEMS_WATER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_FLOW_SPEED" ShowInGroupFooterColumn="CEMS_FLOW_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_PT" ShowInGroupFooterColumn="CEMS_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_TE" ShowInGroupFooterColumn="CEMS_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CEMS_DUST" ShowInGroupFooterColumn="CEMS_DUST" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AREA1_A_SIDE_PT" ShowInGroupFooterColumn="AREA1_A_SIDE_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AREA1_B_SIDE_PT" ShowInGroupFooterColumn="AREA1_B_SIDE_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AREA2_A_SIDE_PT" ShowInGroupFooterColumn="AREA2_A_SIDE_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AREA2_B_SIDE_PT" ShowInGroupFooterColumn="AREA2_B_SIDE_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DEGREE_SETTING" ShowInGroupFooterColumn="DEGREE_SETTING" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DEGREE_FEEDBACK" ShowInGroupFooterColumn="DEGREE_FEEDBACK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GAS_PT" ShowInGroupFooterColumn="GAS_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OUTLET_DIFF_PT" ShowInGroupFooterColumn="OUTLET_DIFF_PT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_SPEED" ShowInGroupFooterColumn="MOTOR_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_CURRENT" ShowInGroupFooterColumn="MOTOR_CURRENT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_W_TE" ShowInGroupFooterColumn="MOTOR_W_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_V_TE" ShowInGroupFooterColumn="MOTOR_V_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_U_TE" ShowInGroupFooterColumn="MOTOR_U_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_REAR_BEAR_Y_VT" ShowInGroupFooterColumn="MOTOR_REAR_BEAR_Y_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_REAR_BEAR_X_VT" ShowInGroupFooterColumn="MOTOR_REAR_BEAR_X_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_REAR_BEAR_TE" ShowInGroupFooterColumn="MOTOR_REAR_BEAR_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_FRONT_BEAR_Y_VT" ShowInGroupFooterColumn="MOTOR_FRONT_BEAR_Y_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_FRONT_BEAR_X_VT" ShowInGroupFooterColumn="MOTOR_FRONT_BEAR_X_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MOTOR_FRONT_BEAR_TE" ShowInGroupFooterColumn="MOTOR_FRONT_BEAR_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_REAR_BEAR_Y_VT" ShowInGroupFooterColumn="FAN_REAR_BEAR_Y_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_REAR_BEAR_X_VT" ShowInGroupFooterColumn="FAN_REAR_BEAR_X_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_REAR_BEAR_TE" ShowInGroupFooterColumn="FAN_REAR_BEAR_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_FRONT_BEAR_Y_VT" ShowInGroupFooterColumn="FAN_FRONT_BEAR_Y_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_FRONT_BEAR_X_VT" ShowInGroupFooterColumn="FAN_FRONT_BEAR_X_VT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FAN_FRONT_BEAR_TE" ShowInGroupFooterColumn="FAN_FRONT_BEAR_TE" SummaryType="Average" DisplayFormat="{0:0.00}" />
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
