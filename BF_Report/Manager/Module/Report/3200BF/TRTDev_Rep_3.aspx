<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TRTDev_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.TRTDev_Rep_3" %>

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
        #cbp_Base_gridBase1_col5 >table {
            width:88px !important;
        }
        #cbp_Base_gridBase1_col68 >table,#cbp_Base_gridBase1_col69 >table {
            width:62px !important;
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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉TRT生产日报表
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
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R67-120/0-16-E" Width="100px">
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <%--<dx:GridViewDataTextColumn Caption="班别" FieldName="WORK_TEAM" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewBandColumn Caption="透平机" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="转速<br>(r/min)" FieldName="TURBINE_ROTATE_SPEED" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn Caption="静叶开度<br>(%)" FieldName="TURBINE_APER" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn Caption="轴位移(mm)" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="TURBINE_AXIS_A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="B" FieldName="TURBINE_AXIS_B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="轴承" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewBandColumn Caption="轴震动(μm)" VisibleIndex="0">
                                                                                <Columns>
                                                                                    <dx:GridViewBandColumn Caption="进气侧" VisibleIndex="0">
                                                                                        <Columns>
                                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="TURBINE_AXIS_INAIRA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="B" FieldName="TURBINE_AXIS_INAIRB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                        </Columns>
                                                                                    </dx:GridViewBandColumn>
                                                                                    <dx:GridViewBandColumn Caption="排气侧" VisibleIndex="1">
                                                                                        <Columns>
                                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="TURBINE_AXIS_OUTAIRA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="B" FieldName="TURBINE_AXIS_OUTAIRB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                        </Columns>
                                                                                    </dx:GridViewBandColumn>
                                                                                </Columns>
                                                                            </dx:GridViewBandColumn>
                                                                            <dx:GridViewBandColumn Caption="温度(℃)" VisibleIndex="1">
                                                                                <Columns>
                                                                                    <dx:GridViewBandColumn Caption="支承轴承" VisibleIndex="0">
                                                                                        <Columns>
                                                                                            <dx:GridViewDataTextColumn Caption="进气" FieldName="TURBINE_AXISTEMP_INAIR" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="排气" FieldName="TURBINE_AXISTEMP_OUTAIR" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                        </Columns>
                                                                                    </dx:GridViewBandColumn>
                                                                                    <dx:GridViewBandColumn Caption="止推轴承" VisibleIndex="1">
                                                                                        <Columns>
                                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="TURBINE_AXIS_TEMPA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                            <dx:GridViewDataTextColumn Caption="B" FieldName="TURBINE_AXIS_TEMPB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                            </dx:GridViewDataTextColumn>
                                                                                        </Columns>
                                                                                    </dx:GridViewBandColumn>
                                                                                </Columns>
                                                                            </dx:GridViewBandColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="动力油系统" VisibleIndex="3" >
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力<br>(kPa)	" FieldName="POWER_OIL_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="液位<br>(%)" FieldName="POWER_OIL_LEVEL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="油箱温度<br>(℃)" FieldName="POWER_OIL_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="润滑油系统" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="远端油压<br>(kPa)	" FieldName="LUBR_OIL_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="液位<br>(%)" FieldName="LUBR_OIL_LEVEL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn Caption="温度(℃)" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="油箱" FieldName="LUBR_OIL_TEMP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="冷却器后" FieldName="LUBR_OIL_TEMP_COOLER" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="总管" FieldName="LUBR_OIL_TEMP_MANA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="煤气系统" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="煤气流量<br>(Nm3/h)" FieldName="COAL_GAS_FLOW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉顶压<br>(kPa)" FieldName="COAL_GAS_FURN_PRESS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn Caption="管网压力" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="透平进气<br>(kPa)" FieldName="COAL_GAS_AIR_IN" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="透平排气<br>(kPa)" FieldName="COAL_GAS_AIR_OUT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="煤气温度" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="透平进口<br>(℃)" FieldName="COAL_GAS_TEMP_IN" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="透平出口<br>(℃)" FieldName="COAL_GAS_TEMP_OUT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="冷却风" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="进风温度<br>(℃)" FieldName="COAL_GAS_TEMP_INWIND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="出风温度<br>(℃)" FieldName="COAL_GAS_TEMP_OUTWIND" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="轴承温度" VisibleIndex="6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="1#<br>(℃)" FieldName="COAL_GAS_AXIS_TEMP1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="2#<br>(℃)" FieldName="COAL_GAS_AXIS_TEMP2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="发电机" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="定子" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewBandColumn Caption="线圈温度(℃)" VisibleIndex="0" >
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn Caption="A相" FieldName="DYNAMO_STATOR_TEMPA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="0"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="B相" FieldName="DYNAMO_STATOR_TEMPB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="1"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="C相" FieldName="DYNAMO_STATOR_TEMPC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="2"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>                                                                                    
                                                                                </Columns>
                                                                            </dx:GridViewBandColumn>
                                                                            <dx:GridViewBandColumn Caption="铁芯温度(℃)" VisibleIndex="1" >
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn Caption="A相" FieldName="DYNAMO_IRON_CETER_TEMPA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="0"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="B相" FieldName="DYNAMO_IRON_CETER_TEMPB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="1"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="C相" FieldName="DYNAMO_IRON_CETER_TEMPC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="2"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>                                                                                    
                                                                                </Columns>
                                                                            </dx:GridViewBandColumn>
                                                                            <dx:GridViewBandColumn Caption="电流(A)" VisibleIndex="2" >
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn Caption="A相" FieldName="DYNAMO_STATOR_CURRENTA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="0"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="B相" FieldName="DYNAMO_STATOR_CURRENTB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="1"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="C相" FieldName="DYNAMO_STATOR_CURRENTC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="2"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>                                                                                    
                                                                                </Columns>
                                                                            </dx:GridViewBandColumn>
                                                                            <dx:GridViewBandColumn Caption="电压(KV)" VisibleIndex="3" >
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn Caption="A相" FieldName="DYNAMO_STATOR_VOLTA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="0"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="B相" FieldName="DYNAMO_STATOR_VOLTB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="1"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="C相" FieldName="DYNAMO_STATOR_VOLTC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="2"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>                                                                                    
                                                                                </Columns>
                                                                            </dx:GridViewBandColumn>
                                                                            <dx:GridViewBandColumn Caption="功率" VisibleIndex="4" >
                                                                                <Columns>
                                                                                    <dx:GridViewDataTextColumn Caption="有功功率(KW)" FieldName="DYNAMO_POWERA" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="0"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="无功功率(Mvar)" FieldName="DYNAMO_POWERB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                        Width="65px" VisibleIndex="1"  PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                                    </dx:GridViewDataTextColumn>                                                                                                                                                                     
                                                                                </Columns>
                                                                            </dx:GridViewBandColumn>                                                                            
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="励磁机" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="电压<br>(V)" FieldName="LUCHJI_POWER" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="电流<br>(A)" FieldName="LUCHJI_CURRENT" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_ROTATE_SPEED" ShowInGroupFooterColumn="TURBINE_ROTATE_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_APER" ShowInGroupFooterColumn="TURBINE_APER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_A" ShowInGroupFooterColumn="TURBINE_AXIS_A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_B" ShowInGroupFooterColumn="TURBINE_AXIS_B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_INAIRA" ShowInGroupFooterColumn="TURBINE_AXIS_INAIRA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_INAIRB" ShowInGroupFooterColumn="TURBINE_AXIS_INAIRB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_OUTAIRA" ShowInGroupFooterColumn="TURBINE_AXIS_OUTAIRA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_OUTAIRB" ShowInGroupFooterColumn="TURBINE_AXIS_OUTAIRB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXISTEMP_INAIR" ShowInGroupFooterColumn="TURBINE_AXISTEMP_INAIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXISTEMP_OUTAIR" ShowInGroupFooterColumn="TURBINE_AXISTEMP_OUTAIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_TEMPA" ShowInGroupFooterColumn="TURBINE_AXIS_TEMPA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_TEMPB" ShowInGroupFooterColumn="TURBINE_AXIS_TEMPB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="POWER_OIL_PRESS" ShowInGroupFooterColumn="POWER_OIL_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="POWER_OIL_LEVEL" ShowInGroupFooterColumn="POWER_OIL_LEVEL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="POWER_OIL_TEMP" ShowInGroupFooterColumn="POWER_OIL_TEMP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_PRESS" ShowInGroupFooterColumn="LUBR_OIL_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_LEVEL" ShowInGroupFooterColumn="LUBR_OIL_LEVEL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_TEMP" ShowInGroupFooterColumn="LUBR_OIL_TEMP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_TEMP_COOLER" ShowInGroupFooterColumn="LUBR_OIL_TEMP_COOLER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_TEMP_MANA" ShowInGroupFooterColumn="LUBR_OIL_TEMP_MANA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_FLOW" ShowInGroupFooterColumn="COAL_GAS_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_FURN_PRESS" ShowInGroupFooterColumn="COAL_GAS_FURN_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_AIR_IN" ShowInGroupFooterColumn="COAL_GAS_AIR_IN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_AIR_OUT" ShowInGroupFooterColumn="COAL_GAS_AIR_OUT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_TEMP_IN" ShowInGroupFooterColumn="COAL_GAS_TEMP_IN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_TEMP_OUT" ShowInGroupFooterColumn="COAL_GAS_TEMP_OUT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_TEMP_INWIND" ShowInGroupFooterColumn="COAL_GAS_TEMP_INWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_AXIS_TEMP1" ShowInGroupFooterColumn="COAL_GAS_AXIS_TEMP1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_AXIS_TEMP2" ShowInGroupFooterColumn="COAL_GAS_AXIS_TEMP2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_TEMPA" ShowInGroupFooterColumn="DYNAMO_STATOR_TEMPA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_TEMPB" ShowInGroupFooterColumn="DYNAMO_STATOR_TEMPB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_TEMPC" ShowInGroupFooterColumn="DYNAMO_STATOR_TEMPC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_IRON_CETER_TEMPA" ShowInGroupFooterColumn="DYNAMO_IRON_CETER_TEMPA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_IRON_CETER_TEMPB" ShowInGroupFooterColumn="DYNAMO_IRON_CETER_TEMPB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_IRON_CETER_TEMPC" ShowInGroupFooterColumn="DYNAMO_IRON_CETER_TEMPC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_CURRENTA" ShowInGroupFooterColumn="DYNAMO_STATOR_CURRENTA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_CURRENTB" ShowInGroupFooterColumn="DYNAMO_STATOR_CURRENTB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_CURRENTC" ShowInGroupFooterColumn="DYNAMO_STATOR_CURRENTC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_VOLTA" ShowInGroupFooterColumn="DYNAMO_STATOR_VOLTA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_VOLTB" ShowInGroupFooterColumn="DYNAMO_STATOR_VOLTB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_VOLTC" ShowInGroupFooterColumn="DYNAMO_STATOR_VOLTC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_POWERA" ShowInGroupFooterColumn="DYNAMO_POWERA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_POWERB" ShowInGroupFooterColumn="DYNAMO_POWERB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUCHJI_POWER" ShowInGroupFooterColumn="LUCHJI_POWER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUCHJI_CURRENT" ShowInGroupFooterColumn="LUCHJI_CURRENT" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                            
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_ROTATE_SPEED" ShowInGroupFooterColumn="TURBINE_ROTATE_SPEED" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_APER" ShowInGroupFooterColumn="TURBINE_APER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_A" ShowInGroupFooterColumn="TURBINE_AXIS_A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_B" ShowInGroupFooterColumn="TURBINE_AXIS_B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_INAIRA" ShowInGroupFooterColumn="TURBINE_AXIS_INAIRA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_INAIRB" ShowInGroupFooterColumn="TURBINE_AXIS_INAIRB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_OUTAIRA" ShowInGroupFooterColumn="TURBINE_AXIS_OUTAIRA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_OUTAIRB" ShowInGroupFooterColumn="TURBINE_AXIS_OUTAIRB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXISTEMP_INAIR" ShowInGroupFooterColumn="TURBINE_AXISTEMP_INAIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXISTEMP_OUTAIR" ShowInGroupFooterColumn="TURBINE_AXISTEMP_OUTAIR" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_TEMPA" ShowInGroupFooterColumn="TURBINE_AXIS_TEMPA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TURBINE_AXIS_TEMPB" ShowInGroupFooterColumn="TURBINE_AXIS_TEMPB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="POWER_OIL_PRESS" ShowInGroupFooterColumn="POWER_OIL_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="POWER_OIL_LEVEL" ShowInGroupFooterColumn="POWER_OIL_LEVEL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="POWER_OIL_TEMP" ShowInGroupFooterColumn="POWER_OIL_TEMP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_PRESS" ShowInGroupFooterColumn="LUBR_OIL_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_LEVEL" ShowInGroupFooterColumn="LUBR_OIL_LEVEL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_TEMP" ShowInGroupFooterColumn="LUBR_OIL_TEMP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_TEMP_COOLER" ShowInGroupFooterColumn="LUBR_OIL_TEMP_COOLER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUBR_OIL_TEMP_MANA" ShowInGroupFooterColumn="LUBR_OIL_TEMP_MANA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_FLOW" ShowInGroupFooterColumn="COAL_GAS_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_FURN_PRESS" ShowInGroupFooterColumn="COAL_GAS_FURN_PRESS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_AIR_IN" ShowInGroupFooterColumn="COAL_GAS_AIR_IN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_AIR_OUT" ShowInGroupFooterColumn="COAL_GAS_AIR_OUT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_TEMP_IN" ShowInGroupFooterColumn="COAL_GAS_TEMP_IN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_TEMP_OUT" ShowInGroupFooterColumn="COAL_GAS_TEMP_OUT" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_TEMP_INWIND" ShowInGroupFooterColumn="COAL_GAS_TEMP_INWIND" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_AXIS_TEMP1" ShowInGroupFooterColumn="COAL_GAS_AXIS_TEMP1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COAL_GAS_AXIS_TEMP2" ShowInGroupFooterColumn="COAL_GAS_AXIS_TEMP2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_TEMPA" ShowInGroupFooterColumn="DYNAMO_STATOR_TEMPA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_TEMPB" ShowInGroupFooterColumn="DYNAMO_STATOR_TEMPB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_TEMPC" ShowInGroupFooterColumn="DYNAMO_STATOR_TEMPC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_IRON_CETER_TEMPA" ShowInGroupFooterColumn="DYNAMO_IRON_CETER_TEMPA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_IRON_CETER_TEMPB" ShowInGroupFooterColumn="DYNAMO_IRON_CETER_TEMPB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_IRON_CETER_TEMPC" ShowInGroupFooterColumn="DYNAMO_IRON_CETER_TEMPC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_CURRENTA" ShowInGroupFooterColumn="DYNAMO_STATOR_CURRENTA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_CURRENTB" ShowInGroupFooterColumn="DYNAMO_STATOR_CURRENTB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_CURRENTC" ShowInGroupFooterColumn="DYNAMO_STATOR_CURRENTC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_VOLTA" ShowInGroupFooterColumn="DYNAMO_STATOR_VOLTA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_VOLTB" ShowInGroupFooterColumn="DYNAMO_STATOR_VOLTB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_STATOR_VOLTC" ShowInGroupFooterColumn="DYNAMO_STATOR_VOLTC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_POWERA" ShowInGroupFooterColumn="DYNAMO_POWERA" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DYNAMO_POWERB" ShowInGroupFooterColumn="DYNAMO_POWERB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUCHJI_POWER" ShowInGroupFooterColumn="LUCHJI_POWER" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LUCHJI_CURRENT" ShowInGroupFooterColumn="LUCHJI_CURRENT" SummaryType="Average" DisplayFormat="{0:0.00}" /> 
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
