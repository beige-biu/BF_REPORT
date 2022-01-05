<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaterSystem_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.WaterSystem_Rep_3" %>

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
        #cbp_Base_gridBase1_col19 >table,#cbp_Base_gridBase1_col41 >table,#cbp_Base_gridBase1_col54 >table,#cbp_Base_gridBase1_col55 >table {
            width:48px !important;
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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉水系统日报
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
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R67-122/0-16-E" Width="100px">
                                                </dx:ASPxLabel>
                                            </td>
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="工业水" VisibleIndex="1">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="空冷器喷淋泵组" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="实时流量" FieldName="WATER_FLUX1_KLPL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="实时压力" FieldName="WATER_PRESS_KLPL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="实时温度" FieldName="" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="流量平均" FieldName="WATER_FLUX1AVG_KLPL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="压力平均" FieldName="WATER_PRESSAVG_KLPL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度平均" FieldName="" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="旁滤泵组" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="实时流量" FieldName="WATER_FLUX1_PLB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="实时压力" FieldName="WATER_PRESS_PLB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量平均" FieldName="WATER_FLUX1AVG_PLB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力平均" FieldName="WATER_PRESSAVG_PLB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="热水提升泵组" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="实时流量" FieldName="WATER_FLUX1_RSTS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="实时压力" FieldName="WATER_PRESS_RSTS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度" FieldName="WATER_TEMP_RSTS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量平均值" FieldName="WATER_FLUX1AVG_RSTS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力平均值" FieldName="WATER_PRESSAVG_RSTS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度平均值" FieldName="WATER_TEMPAVG_RSTS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="高炉净环高压泵组" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量1" FieldName="WATER_FLUX1_GJGY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量2" FieldName="WATER_FLUX2_GJGY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力" FieldName="WATER_PRESS_GJGY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度" FieldName="WATER_TEMP_GJGY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量1平均值" FieldName="WATER_FLUX1AVG_GJGY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量2平均值" FieldName="WATER_FLUX2AVG_GJGY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力平均值" FieldName="WATER_PRESSAVG_GJGY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度平均值" FieldName="WATER_TEMPAVG_GJGY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="高炉净环低压泵组" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力" FieldName="WATER_PRESS_GJDY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度" FieldName="WATER_TEMP_GJDY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力平均值" FieldName="WATER_PRESSAVG_GJDY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度平均值" FieldName="WATER_TEMPAVG_GJDY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                   
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="软水" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="紧急补水泵组" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量" FieldName="WATER_FLUX1_JJBS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力" FieldName="WATER_PRESS_JJBS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度" FieldName="WATER_TEMP_JJBS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量平均值" FieldName="WATER_FLUX1AVG_JJBS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力平均值" FieldName="WATER_PRESSAVG_JJBS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>                                                                        
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度平均值" FieldName="WATER_TEMPAVG_JJBS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>                                                                        
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="高炉软水闭路回水总管" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力" FieldName="WATER_PRESS_GRBH" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度" FieldName="WATER_TEMP_GRBH" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力平均值" FieldName="WATER_PRESSAVG_GRBH" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度平均值" FieldName="WATER_TEMPAVG_GRBH" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="高炉软水闭路供水总管" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量1" FieldName="PCI_OS_QT_GLFQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量2" FieldName="PCI_OS_QT_GLFQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力" FieldName="WATER_PRESS_GRGS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度" FieldName="WATER_TEMP_GRGS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量1平均值" FieldName="PCI_OS_QT_GLFQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量2平均值" FieldName="PCI_OS_QT_GLFQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="压力平均值" FieldName="WATER_PRESSAVG_GRGS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="温度平均值" FieldName="WATER_TEMPAVG_GRGS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="累计值" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="喷淋水池" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="生产水累计" FieldName="WATER_PLC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="软水累计" FieldName="WATER_PLCS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>                                                                   
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="净环水池" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="生产水累计" FieldName="WATER_JHS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="软水累计" FieldName="WATER_JHSC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>                                                             
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="软水总管" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="软水累计" FieldName="WATER_RSZG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>                                                                        
                                                                    </dx:GridViewBandColumn>                                                                
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_KLPL" ShowInGroupFooterColumn="WATER_FLUX1_KLPL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_KLPL" ShowInGroupFooterColumn="WATER_PRESS_KLPL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_KLPL" ShowInGroupFooterColumn="WATER_FLUX1AVG_KLPL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_KLPL" ShowInGroupFooterColumn="WATER_PRESSAVG_KLPL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_PLB" ShowInGroupFooterColumn="WATER_FLUX1_PLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_PLB" ShowInGroupFooterColumn="WATER_PRESS_PLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_PLB" ShowInGroupFooterColumn="WATER_FLUX1AVG_PLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_PLB" ShowInGroupFooterColumn="WATER_PRESSAVG_PLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_RSTS" ShowInGroupFooterColumn="WATER_FLUX1_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_RSTS" ShowInGroupFooterColumn="WATER_PRESS_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_RSTS" ShowInGroupFooterColumn="WATER_TEMP_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_RSTS" ShowInGroupFooterColumn="WATER_FLUX1AVG_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_RSTS" ShowInGroupFooterColumn="WATER_PRESSAVG_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_RSTS" ShowInGroupFooterColumn="WATER_TEMPAVG_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_GJGY" ShowInGroupFooterColumn="WATER_FLUX1_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX2_GJGY" ShowInGroupFooterColumn="WATER_FLUX2_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_GJGY" ShowInGroupFooterColumn="WATER_PRESS_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_GJGY" ShowInGroupFooterColumn="WATER_TEMP_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_GJGY" ShowInGroupFooterColumn="WATER_FLUX1AVG_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX2AVG_GJGY" ShowInGroupFooterColumn="WATER_FLUX2AVG_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_GJGY" ShowInGroupFooterColumn="WATER_PRESSAVG_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_GJGY" ShowInGroupFooterColumn="WATER_TEMPAVG_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_GJDY" ShowInGroupFooterColumn="WATER_PRESS_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_GJDY" ShowInGroupFooterColumn="WATER_TEMP_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_GJDY" ShowInGroupFooterColumn="WATER_FLUX1AVG_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX2AVG_GJDY" ShowInGroupFooterColumn="WATER_FLUX2AVG_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_GJDY" ShowInGroupFooterColumn="WATER_PRESSAVG_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_GJDY" ShowInGroupFooterColumn="WATER_TEMPAVG_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_JJBS" ShowInGroupFooterColumn="WATER_FLUX1_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_JJBS" ShowInGroupFooterColumn="WATER_PRESS_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_JJBS" ShowInGroupFooterColumn="WATER_TEMP_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_JJBS" ShowInGroupFooterColumn="WATER_FLUX1AVG_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_JJBS" ShowInGroupFooterColumn="WATER_PRESSAVG_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_JJBS" ShowInGroupFooterColumn="WATER_TEMPAVG_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_GRBH" ShowInGroupFooterColumn="WATER_PRESS_GRBH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_GRBH" ShowInGroupFooterColumn="WATER_TEMP_GRBH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_GRBH" ShowInGroupFooterColumn="WATER_PRESSAVG_GRBH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_GRBH" ShowInGroupFooterColumn="WATER_TEMPAVG_GRBH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_GRGS" ShowInGroupFooterColumn="WATER_PRESS_GRGS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_GRGS" ShowInGroupFooterColumn="WATER_TEMP_GRGS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_GRGS" ShowInGroupFooterColumn="WATER_PRESSAVG_GRGS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_GRGS" ShowInGroupFooterColumn="WATER_TEMPAVG_GRGS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PLC" ShowInGroupFooterColumn="WATER_PLC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PLCS" ShowInGroupFooterColumn="WATER_PLCS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_JHS" ShowInGroupFooterColumn="WATER_JHS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_JHSC" ShowInGroupFooterColumn="WATER_JHSC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_RSZG" ShowInGroupFooterColumn="WATER_RSZG" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                                                                                       
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_KLPL" ShowInGroupFooterColumn="WATER_FLUX1_KLPL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_KLPL" ShowInGroupFooterColumn="WATER_PRESS_KLPL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_KLPL" ShowInGroupFooterColumn="WATER_FLUX1AVG_KLPL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_KLPL" ShowInGroupFooterColumn="WATER_PRESSAVG_KLPL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_PLB" ShowInGroupFooterColumn="WATER_FLUX1_PLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_PLB" ShowInGroupFooterColumn="WATER_PRESS_PLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_PLB" ShowInGroupFooterColumn="WATER_FLUX1AVG_PLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_PLB" ShowInGroupFooterColumn="WATER_PRESSAVG_PLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_RSTS" ShowInGroupFooterColumn="WATER_FLUX1_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_RSTS" ShowInGroupFooterColumn="WATER_PRESS_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_RSTS" ShowInGroupFooterColumn="WATER_TEMP_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_RSTS" ShowInGroupFooterColumn="WATER_FLUX1AVG_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_RSTS" ShowInGroupFooterColumn="WATER_PRESSAVG_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_RSTS" ShowInGroupFooterColumn="WATER_TEMPAVG_RSTS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_GJGY" ShowInGroupFooterColumn="WATER_FLUX1_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX2_GJGY" ShowInGroupFooterColumn="WATER_FLUX2_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_GJGY" ShowInGroupFooterColumn="WATER_PRESS_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_GJGY" ShowInGroupFooterColumn="WATER_TEMP_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_GJGY" ShowInGroupFooterColumn="WATER_FLUX1AVG_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX2AVG_GJGY" ShowInGroupFooterColumn="WATER_FLUX2AVG_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_GJGY" ShowInGroupFooterColumn="WATER_PRESSAVG_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_GJGY" ShowInGroupFooterColumn="WATER_TEMPAVG_GJGY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_GJDY" ShowInGroupFooterColumn="WATER_PRESS_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_GJDY" ShowInGroupFooterColumn="WATER_TEMP_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_GJDY" ShowInGroupFooterColumn="WATER_FLUX1AVG_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX2AVG_GJDY" ShowInGroupFooterColumn="WATER_FLUX2AVG_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_GJDY" ShowInGroupFooterColumn="WATER_PRESSAVG_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_GJDY" ShowInGroupFooterColumn="WATER_TEMPAVG_GJDY" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1_JJBS" ShowInGroupFooterColumn="WATER_FLUX1_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_JJBS" ShowInGroupFooterColumn="WATER_PRESS_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_JJBS" ShowInGroupFooterColumn="WATER_TEMP_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_FLUX1AVG_JJBS" ShowInGroupFooterColumn="WATER_FLUX1AVG_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_JJBS" ShowInGroupFooterColumn="WATER_PRESSAVG_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_JJBS" ShowInGroupFooterColumn="WATER_TEMPAVG_JJBS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_GRBH" ShowInGroupFooterColumn="WATER_PRESS_GRBH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_GRBH" ShowInGroupFooterColumn="WATER_TEMP_GRBH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_GRBH" ShowInGroupFooterColumn="WATER_PRESSAVG_GRBH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_GRBH" ShowInGroupFooterColumn="WATER_TEMPAVG_GRBH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESS_GRGS" ShowInGroupFooterColumn="WATER_PRESS_GRGS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMP_GRGS" ShowInGroupFooterColumn="WATER_TEMP_GRGS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PRESSAVG_GRGS" ShowInGroupFooterColumn="WATER_PRESSAVG_GRGS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_TEMPAVG_GRGS" ShowInGroupFooterColumn="WATER_TEMPAVG_GRGS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PLC" ShowInGroupFooterColumn="WATER_PLC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_PLCS" ShowInGroupFooterColumn="WATER_PLCS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_JHS" ShowInGroupFooterColumn="WATER_JHS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_JHSC" ShowInGroupFooterColumn="WATER_JHSC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WATER_RSZG" ShowInGroupFooterColumn="WATER_RSZG" SummaryType="Average" DisplayFormat="{0:0.00}" />   
                                                        </GroupSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <%-- <SettingsResizing ColumnResizeMode="Control" />--%>
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
