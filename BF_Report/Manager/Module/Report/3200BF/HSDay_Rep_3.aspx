<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HSDay_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.HSDay_Rep_3" %>

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
                        3#高炉热风炉作业日志
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
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="R67-114/0-16-E" Width="100px">
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="CODE_GETDATATIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>                                         
                                                            <dx:GridViewDataTextColumn Caption="送风炉号" FieldName="SENDNO" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="1#热风炉" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="拱顶温度_电偶" FieldName="HS_ROOF_TEMP1_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="拱顶温度_红外" FieldName="HS_ROOF_TEMP2_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧器温度" FieldName="HS_BURNT_TEMP_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧器压力" FieldName="HS_BURNT_PRESS_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="烟道温度" FieldName="HS_BRANCH_TEMP_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="残氧量" FieldName="HS_REMO2_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="硅制格砖界面温度" FieldName="HS_SI_BRICK_TEMP_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="硅砖界面温度" FieldName="HS_BRICK_TEMP_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度1" FieldName="HS_LUPI_TEMP1_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度2" FieldName="HS_LUPI_TEMP2_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度3" FieldName="HS_LUPI_TEMP3_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉箅子温度" FieldName="HS_LUBIZI_TEMP_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉煤气支管流量" FieldName="HS_GAS_BRANCH_FLOW_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="助燃空气支管流量" FieldName="HS_AIR_BRANCH_FLOW_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="13" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉内压力" FieldName="HS_INSIDE_PRESS_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="14" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="热风阀进水流量" FieldName="HS_INWATER_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="15" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="热风阀排水流量" FieldName="HS_OUTWATER_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="16" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2#热风炉" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧时间" FieldName="" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="送风时间" FieldName="" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="拱顶温度_电偶" FieldName="HS_ROOF_TEMP1_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="拱顶温度_红外" FieldName="HS_ROOF_TEMP2_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧器温度" FieldName="HS_BURNT_TEMP_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧器压力" FieldName="HS_BURNT_PRESS_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="烟道温度" FieldName="HS_BRANCH_TEMP_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="残氧量" FieldName="HS_REMO2_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="硅制格砖界面温度" FieldName="HS_SI_BRICK_TEMP_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="硅砖界面温度" FieldName="HS_BRICK_TEMP_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度1" FieldName="HS_LUPI_TEMP1_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度2" FieldName="HS_LUPI_TEMP2_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度3" FieldName="HS_LUPI_TEMP2_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉箅子温度" FieldName="HS_LUBIZI_TEMP_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="13" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉煤气支管流量" FieldName="HS_GAS_BRANCH_FLOW_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="14" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="助燃空气支管流量" FieldName="HS_AIR_BRANCH_FLOW_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="15" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉内压力" FieldName="HS_INSIDE_PRESS_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="16" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="热风阀进水流量" FieldName="HS_INWATER_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="17" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="热风阀排水流量" FieldName="HS_OUTWATER_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="18" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="3#热风炉" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧时间" FieldName="" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="送风时间" FieldName="" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="拱顶温度_电偶" FieldName="HS_ROOF_TEMP1_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="拱顶温度_红外" FieldName="HS_ROOF_TEMP2_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧器温度" FieldName="HS_BURNT_TEMP_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧器压力" FieldName="HS_BURNT_PRESS_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="烟道温度" FieldName="HS_BRANCH_TEMP_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="残氧量" FieldName="HS_REMO2_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="硅制格砖界面温度" FieldName="HS_SI_BRICK_TEMP_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="硅砖界面温度" FieldName="HS_BRICK_TEMP_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度1" FieldName="HS_LUPI_TEMP1_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度2" FieldName="HS_LUPI_TEMP2_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉皮温度3" FieldName="HS_LUPI_TEMP3_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉箅子温度" FieldName="HS_LUBIZI_TEMP_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="13" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉煤气支管流量" FieldName="HS_GAS_BRANCH_FLOW_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="14" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="助燃空气支管流量" FieldName="HS_AIR_BRANCH_FLOW_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="15" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="炉内压力" FieldName="HS_INSIDE_PRESS_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="16" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="热风阀进水流量" FieldName="HS_INWATER_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="17" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="热风阀排水流量" FieldName="HS_OUTWATER_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="18" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="混风阀前热风温度" FieldName="VALVA_TEMP_SF" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="混风调节阀开度%" FieldName="VALVAOPEN_SF" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="冷却水" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="进水流量m3/h" FieldName="COOLINGWATERINFLUX_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="进水温度" FieldName="COOLINGWATERINTEMP_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="进水压力" FieldName="COOLINGWATERINPRESS_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>                                                        
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="排水总管温度" FieldName="OUT_WATER_TEMP_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="冷风总管" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="COLD_WIND_TEMP_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量" FieldName="COLD_WIND_FLOW_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿度" FieldName="COLD_WIND_HUMIDITY_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>                                                        
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤气热值" FieldName="GASHOTVALUE_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="膨胀罐压力" FieldName="CAN_PRESS_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="氮气流量" FieldName="N2_FLOW_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="13" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="氮气压力" FieldName="N2_PRESS_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="14" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="富氧流量" FieldName="AIR_FLOW_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="15" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="一级减压阀后压力" FieldName="JYF1_PRESS_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="16" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="一级减压阀后压力" FieldName="JYF2_PRESS_SEND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="17" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="预热器（煤气）" VisibleIndex="18">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="入口温度" FieldName="PRETEMP_GAS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口温度" FieldName="AFTTEMP_GAS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="入口压力" FieldName="PREPRESS_GAS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口压力" FieldName="AFTPRESS_GAS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力差" FieldName="PRESSDIFF_GAS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="预热器（空气）" VisibleIndex="19">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="入口温度" FieldName="PRETEMP_AIR" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口温度" FieldName="AFTTEMP_AIR" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="入口压力" FieldName="PREPRESS_AIR" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="出口压力" FieldName="AFTPRESS_AIR" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力差" FieldName="PRESSDIFF_AIR" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="CODE_GETDATATIME" ShowInGroupFooterColumn="CODE_GETDATATIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP1_1" ShowInGroupFooterColumn="HS_ROOF_TEMP1_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP2_1" ShowInGroupFooterColumn="HS_ROOF_TEMP2_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_TEMP_1" ShowInGroupFooterColumn="HS_BURNT_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_PRESS_1" ShowInGroupFooterColumn="HS_BURNT_PRESS_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRANCH_TEMP_1" ShowInGroupFooterColumn="HS_BRANCH_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_REMO2_1" ShowInGroupFooterColumn="HS_REMO2_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_SI_BRICK_TEMP_1" ShowInGroupFooterColumn="HS_SI_BRICK_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRICK_TEMP_1" ShowInGroupFooterColumn="HS_BRICK_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP1_1" ShowInGroupFooterColumn="HS_LUPI_TEMP1_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP2_1" ShowInGroupFooterColumn="HS_LUPI_TEMP2_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP3_1" ShowInGroupFooterColumn="HS_LUPI_TEMP3_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUBIZI_TEMP_1" ShowInGroupFooterColumn="HS_LUBIZI_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_GAS_BRANCH_FLOW_1" ShowInGroupFooterColumn="HS_GAS_BRANCH_FLOW_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_AIR_BRANCH_FLOW_1" ShowInGroupFooterColumn="HS_AIR_BRANCH_FLOW_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INSIDE_PRESS_1" ShowInGroupFooterColumn="HS_INSIDE_PRESS_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INWATER_1" ShowInGroupFooterColumn="HS_INWATER_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_OUTWATER_1" ShowInGroupFooterColumn="HS_OUTWATER_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP1_2" ShowInGroupFooterColumn="HS_ROOF_TEMP1_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP2_2" ShowInGroupFooterColumn="HS_ROOF_TEMP2_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_TEMP_2" ShowInGroupFooterColumn="HS_BURNT_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_PRESS_2" ShowInGroupFooterColumn="HS_BURNT_PRESS_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRANCH_TEMP_2" ShowInGroupFooterColumn="HS_BRANCH_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_REMO2_2" ShowInGroupFooterColumn="HS_REMO2_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_SI_BRICK_TEMP_2" ShowInGroupFooterColumn="HS_SI_BRICK_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRICK_TEMP_2" ShowInGroupFooterColumn="HS_BRICK_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP1_2" ShowInGroupFooterColumn="HS_LUPI_TEMP1_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP2_2" ShowInGroupFooterColumn="HS_LUPI_TEMP2_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP3_2" ShowInGroupFooterColumn="HS_LUPI_TEMP3_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUBIZI_TEMP_2" ShowInGroupFooterColumn="HS_LUBIZI_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_GAS_BRANCH_FLOW_2" ShowInGroupFooterColumn="HS_GAS_BRANCH_FLOW_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_AIR_BRANCH_FLOW_2" ShowInGroupFooterColumn="HS_AIR_BRANCH_FLOW_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INSIDE_PRESS_2" ShowInGroupFooterColumn="HS_INSIDE_PRESS_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INWATER_2" ShowInGroupFooterColumn="HS_INWATER_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_OUTWATER_2" ShowInGroupFooterColumn="HS_OUTWATER_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP1_3" ShowInGroupFooterColumn="HS_ROOF_TEMP1_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP2_3" ShowInGroupFooterColumn="HS_ROOF_TEMP2_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_TEMP_3" ShowInGroupFooterColumn="HS_BURNT_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_PRESS_3" ShowInGroupFooterColumn="HS_BURNT_PRESS_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRANCH_TEMP_3" ShowInGroupFooterColumn="HS_BRANCH_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_REMO2_3" ShowInGroupFooterColumn="HS_REMO2_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_SI_BRICK_TEMP_3" ShowInGroupFooterColumn="HS_SI_BRICK_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRICK_TEMP_3" ShowInGroupFooterColumn="HS_BRICK_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP1_3" ShowInGroupFooterColumn="HS_LUPI_TEMP1_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP2_3" ShowInGroupFooterColumn="HS_LUPI_TEMP2_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP3_3" ShowInGroupFooterColumn="HS_LUPI_TEMP3_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUBIZI_TEMP_3" ShowInGroupFooterColumn="HS_LUBIZI_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_GAS_BRANCH_FLOW_3" ShowInGroupFooterColumn="HS_GAS_BRANCH_FLOW_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_AIR_BRANCH_FLOW_3" ShowInGroupFooterColumn="HS_AIR_BRANCH_FLOW_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INSIDE_PRESS_3" ShowInGroupFooterColumn="HS_INSIDE_PRESS_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INWATER_3" ShowInGroupFooterColumn="HS_INWATER_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_OUTWATER_3" ShowInGroupFooterColumn="HS_OUTWATER_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="VALVA_TEMP_SF" ShowInGroupFooterColumn="VALVA_TEMP_SF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="VALVAOPEN_SF" ShowInGroupFooterColumn="VALVAOPEN_SF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLINGWATERINFLUX_SEND" ShowInGroupFooterColumn="COOLINGWATERINFLUX_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLINGWATERINTEMP_SEND" ShowInGroupFooterColumn="COOLINGWATERINTEMP_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLINGWATERINPRESS_SEND" ShowInGroupFooterColumn="COOLINGWATERINPRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OUT_WATER_TEMP_SEND" ShowInGroupFooterColumn="OUT_WATER_TEMP_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COLD_WIND_TEMP_SEND" ShowInGroupFooterColumn="COLD_WIND_TEMP_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COLD_WIND_FLOW_SEND" ShowInGroupFooterColumn="COLD_WIND_FLOW_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COLD_WIND_HUMIDITY_SEND" ShowInGroupFooterColumn="COLD_WIND_HUMIDITY_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GASHOTVALUE_SEND" ShowInGroupFooterColumn="GASHOTVALUE_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CAN_PRESS_SEND" ShowInGroupFooterColumn="CAN_PRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="N2_FLOW_SEND" ShowInGroupFooterColumn="N2_FLOW_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="N2_PRESS_SEND" ShowInGroupFooterColumn="N2_PRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AIR_FLOW_SEND" ShowInGroupFooterColumn="AIR_FLOW_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JYF1_PRESS_SEND" ShowInGroupFooterColumn="JYF1_PRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JYF2_PRESS_SEND" ShowInGroupFooterColumn="JYF2_PRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PRETEMP_GAS" ShowInGroupFooterColumn="PRETEMP_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AFTTEMP_GAS" ShowInGroupFooterColumn="AFTTEMP_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PREPRESS_GAS" ShowInGroupFooterColumn="PREPRESS_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AFTPRESS_GAS" ShowInGroupFooterColumn="AFTPRESS_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PRESSDIFF_GAS" ShowInGroupFooterColumn="PRESSDIFF_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PRETEMP_AIR" ShowInGroupFooterColumn="PRETEMP_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AFTTEMP_AIR" ShowInGroupFooterColumn="AFTTEMP_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PREPRESS_AIR" ShowInGroupFooterColumn="PREPRESS_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AFTPRESS_AIR" ShowInGroupFooterColumn="AFTPRESS_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PRESSDIFF_AIR" ShowInGroupFooterColumn="PRESSDIFF_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="CODE_GETDATATIME" ShowInGroupFooterColumn="CODE_GETDATATIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP1_1" ShowInGroupFooterColumn="HS_ROOF_TEMP1_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP2_1" ShowInGroupFooterColumn="HS_ROOF_TEMP2_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_TEMP_1" ShowInGroupFooterColumn="HS_BURNT_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_PRESS_1" ShowInGroupFooterColumn="HS_BURNT_PRESS_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRANCH_TEMP_1" ShowInGroupFooterColumn="HS_BRANCH_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_REMO2_1" ShowInGroupFooterColumn="HS_REMO2_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_SI_BRICK_TEMP_1" ShowInGroupFooterColumn="HS_SI_BRICK_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRICK_TEMP_1" ShowInGroupFooterColumn="HS_BRICK_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP1_1" ShowInGroupFooterColumn="HS_LUPI_TEMP1_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP2_1" ShowInGroupFooterColumn="HS_LUPI_TEMP2_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP3_1" ShowInGroupFooterColumn="HS_LUPI_TEMP3_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUBIZI_TEMP_1" ShowInGroupFooterColumn="HS_LUBIZI_TEMP_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_GAS_BRANCH_FLOW_1" ShowInGroupFooterColumn="HS_GAS_BRANCH_FLOW_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_AIR_BRANCH_FLOW_1" ShowInGroupFooterColumn="HS_AIR_BRANCH_FLOW_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INSIDE_PRESS_1" ShowInGroupFooterColumn="HS_INSIDE_PRESS_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INWATER_1" ShowInGroupFooterColumn="HS_INWATER_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_OUTWATER_1" ShowInGroupFooterColumn="HS_OUTWATER_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP1_2" ShowInGroupFooterColumn="HS_ROOF_TEMP1_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP2_2" ShowInGroupFooterColumn="HS_ROOF_TEMP2_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_TEMP_2" ShowInGroupFooterColumn="HS_BURNT_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_PRESS_2" ShowInGroupFooterColumn="HS_BURNT_PRESS_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRANCH_TEMP_2" ShowInGroupFooterColumn="HS_BRANCH_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_REMO2_2" ShowInGroupFooterColumn="HS_REMO2_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_SI_BRICK_TEMP_2" ShowInGroupFooterColumn="HS_SI_BRICK_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRICK_TEMP_2" ShowInGroupFooterColumn="HS_BRICK_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP1_2" ShowInGroupFooterColumn="HS_LUPI_TEMP1_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP2_2" ShowInGroupFooterColumn="HS_LUPI_TEMP2_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP3_2" ShowInGroupFooterColumn="HS_LUPI_TEMP3_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUBIZI_TEMP_2" ShowInGroupFooterColumn="HS_LUBIZI_TEMP_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_GAS_BRANCH_FLOW_2" ShowInGroupFooterColumn="HS_GAS_BRANCH_FLOW_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_AIR_BRANCH_FLOW_2" ShowInGroupFooterColumn="HS_AIR_BRANCH_FLOW_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INSIDE_PRESS_2" ShowInGroupFooterColumn="HS_INSIDE_PRESS_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INWATER_2" ShowInGroupFooterColumn="HS_INWATER_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_OUTWATER_2" ShowInGroupFooterColumn="HS_OUTWATER_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP1_3" ShowInGroupFooterColumn="HS_ROOF_TEMP1_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_ROOF_TEMP2_3" ShowInGroupFooterColumn="HS_ROOF_TEMP2_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_TEMP_3" ShowInGroupFooterColumn="HS_BURNT_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BURNT_PRESS_3" ShowInGroupFooterColumn="HS_BURNT_PRESS_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRANCH_TEMP_3" ShowInGroupFooterColumn="HS_BRANCH_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_REMO2_3" ShowInGroupFooterColumn="HS_REMO2_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_SI_BRICK_TEMP_3" ShowInGroupFooterColumn="HS_SI_BRICK_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_BRICK_TEMP_3" ShowInGroupFooterColumn="HS_BRICK_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP1_3" ShowInGroupFooterColumn="HS_LUPI_TEMP1_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP2_3" ShowInGroupFooterColumn="HS_LUPI_TEMP2_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUPI_TEMP3_3" ShowInGroupFooterColumn="HS_LUPI_TEMP3_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_LUBIZI_TEMP_3" ShowInGroupFooterColumn="HS_LUBIZI_TEMP_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_GAS_BRANCH_FLOW_3" ShowInGroupFooterColumn="HS_GAS_BRANCH_FLOW_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_AIR_BRANCH_FLOW_3" ShowInGroupFooterColumn="HS_AIR_BRANCH_FLOW_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INSIDE_PRESS_3" ShowInGroupFooterColumn="HS_INSIDE_PRESS_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_INWATER_3" ShowInGroupFooterColumn="HS_INWATER_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HS_OUTWATER_3" ShowInGroupFooterColumn="HS_OUTWATER_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="VALVA_TEMP_SF" ShowInGroupFooterColumn="VALVA_TEMP_SF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="VALVAOPEN_SF" ShowInGroupFooterColumn="VALVAOPEN_SF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLINGWATERINFLUX_SEND" ShowInGroupFooterColumn="COOLINGWATERINFLUX_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLINGWATERINTEMP_SEND" ShowInGroupFooterColumn="COOLINGWATERINTEMP_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLINGWATERINPRESS_SEND" ShowInGroupFooterColumn="COOLINGWATERINPRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OUT_WATER_TEMP_SEND" ShowInGroupFooterColumn="OUT_WATER_TEMP_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COLD_WIND_TEMP_SEND" ShowInGroupFooterColumn="COLD_WIND_TEMP_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COLD_WIND_FLOW_SEND" ShowInGroupFooterColumn="COLD_WIND_FLOW_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COLD_WIND_HUMIDITY_SEND" ShowInGroupFooterColumn="COLD_WIND_HUMIDITY_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GASHOTVALUE_SEND" ShowInGroupFooterColumn="GASHOTVALUE_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CAN_PRESS_SEND" ShowInGroupFooterColumn="CAN_PRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="N2_FLOW_SEND" ShowInGroupFooterColumn="N2_FLOW_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="N2_PRESS_SEND" ShowInGroupFooterColumn="N2_PRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AIR_FLOW_SEND" ShowInGroupFooterColumn="AIR_FLOW_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JYF1_PRESS_SEND" ShowInGroupFooterColumn="JYF1_PRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JYF2_PRESS_SEND" ShowInGroupFooterColumn="JYF2_PRESS_SEND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PRETEMP_GAS" ShowInGroupFooterColumn="PRETEMP_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AFTTEMP_GAS" ShowInGroupFooterColumn="AFTTEMP_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PREPRESS_GAS" ShowInGroupFooterColumn="PREPRESS_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AFTPRESS_GAS" ShowInGroupFooterColumn="AFTPRESS_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PRESSDIFF_GAS" ShowInGroupFooterColumn="PRESSDIFF_GAS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PRETEMP_AIR" ShowInGroupFooterColumn="PRETEMP_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AFTTEMP_AIR" ShowInGroupFooterColumn="AFTTEMP_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PREPRESS_AIR" ShowInGroupFooterColumn="PREPRESS_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AFTPRESS_AIR" ShowInGroupFooterColumn="AFTPRESS_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PRESSDIFF_AIR" ShowInGroupFooterColumn="PRESSDIFF_AIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
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
