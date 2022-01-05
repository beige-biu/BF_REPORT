<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STMaterial_Consumption_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._360ST.STMaterial_Consumption_Rep_1" %>

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
                        360烧结物料消耗(t)查询
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
                                                <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="开始时间:" Width="80px">
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
                                            <td width="60px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel4" Font-Size="14px" runat="server" Text="结束时间:" Width="80px">
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
                                                            <dx:GridViewDataTextColumn Caption="班开始时间" FieldName="CLASS_START_TIME" Width="170px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm:ss"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班结束时间" FieldName="CLASS_STOP_TIME" Width="170px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm:ss"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="CLASS" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>                                                               
                                                            <dx:GridViewBandColumn Caption="混匀矿" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="消耗(t)" FieldName="HY" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单耗(kg/t)" FieldName="HY_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="燃料" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="消耗(t)" FieldName="RL" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单耗(kg/t)" FieldName="RL_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="灰尘料" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="消耗(t)" FieldName="HC" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单耗(kg/t)" FieldName="HC_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="白云石" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="消耗(t)" FieldName="BYS" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单耗(kg/t)" FieldName="BYS_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="生石灰" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="消耗(t)" FieldName="SH" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单耗(kg/t)" FieldName="SH_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>                                                            
                                                            <dx:GridViewBandColumn Caption="冷返矿" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="冷返矿(出)(t)" FieldName="LF" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="冷返矿(出)单耗(kg/t)" FieldName="LF_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="冷返矿(进)(t)" FieldName="LF_JIN" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="冷返矿(进)单耗(kg/t)" FieldName="LF_JIN_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="高炉返矿" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="高炉返矿(出)(t)" FieldName="GL" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉返矿(出)单耗(kg/t)" FieldName="GL_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉返矿(进)(t)" FieldName="GL_JIN" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉返矿(进)单耗(kg/t)" FieldName="GL_JIN_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="煤气" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="消耗(m³)" FieldName="MQ" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单耗(m³/t)" FieldName="MQ_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn> 
                                                            <dx:GridViewBandColumn Caption="电量" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="消耗(kw*h)" FieldName="DL" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单耗(kw*h/t)" FieldName="DL_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn> 
                                                            <dx:GridViewDataTextColumn Caption="产量(t)" FieldName="CL" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                VisibleIndex="12" >                                                                 
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="高炉返焦量(t)" FieldName="GLFJ" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                VisibleIndex="13" >                                                                 
                                                            </dx:GridViewDataTextColumn> 
                                                            <dx:GridViewBandColumn Caption="瓦斯灰" VisibleIndex="14">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="消耗(t)" FieldName="WSH" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="单耗(kg/t)" FieldName="WSH_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn> 
                                                            <dx:GridViewBandColumn Caption="生石灰" VisibleIndex="15">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="生石灰10A仓用量(t)" FieldName="SH_10A" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="生石灰10B仓用量(t)" FieldName="SH_10B" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="生石灰11仓用量(t)" FieldName="SH_11" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="生石灰12仓用量(t)" FieldName="SH_12" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                        VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>                                                                                               
                                                            <dx:GridViewDataTextColumn Caption="P4皮带燃料量(t)" FieldName="PL_P4" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                VisibleIndex="24" >                                                                 
                                                            </dx:GridViewDataTextColumn>                                      
                                                            <dx:GridViewDataTextColumn Caption="P4皮带秤燃料量单耗(kg/t)" FieldName="PL_P4_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                VisibleIndex="25" >                                                                 
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="进仓前混匀矿量(t)" FieldName="PL_P1" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                VisibleIndex="26" >                                                                 
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="进仓前混匀矿单耗(kg/t)" FieldName="PL_P1_CM" Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                VisibleIndex="27" >                                                                 
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption=""  Width="95px" ShowInCustomizationForm="true" UnboundType="Decimal"
                                                                VisibleIndex="28" >                                                                 
                                                            </dx:GridViewDataTextColumn>
                                                                                              
                                                        </Columns> 
                                                        
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="CLASS_START_TIME" ShowInGroupFooterColumn="CLASS_START_TIME" SummaryType="Count" DisplayFormat="合计" />
                                                            <dx:ASPxSummaryItem FieldName="HY" ShowInGroupFooterColumn="HY" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HY_CM" ShowInGroupFooterColumn="HY_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="RL" ShowInGroupFooterColumn="RL" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="RL_CM" ShowInGroupFooterColumn="RL_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HC" ShowInGroupFooterColumn="HC" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="HC_CM" ShowInGroupFooterColumn="HC_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BYS" ShowInGroupFooterColumn="BYS" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="BYS_CM" ShowInGroupFooterColumn="BYS_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SH" ShowInGroupFooterColumn="SH" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SH_CM" ShowInGroupFooterColumn="SH_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LF" ShowInGroupFooterColumn="LF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LF_CM" ShowInGroupFooterColumn="LF_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LF_JIN" ShowInGroupFooterColumn="LF_JIN" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LF_JIN_CM" ShowInGroupFooterColumn="LF_JIN_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GL" ShowInGroupFooterColumn="GL" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GL_CM" ShowInGroupFooterColumn="GL_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GL_JIN" ShowInGroupFooterColumn="GL_JIN" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GL_JIN_CM" ShowInGroupFooterColumn="GL_JIN_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MQ" ShowInGroupFooterColumn="MQ" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="MQ_CM" ShowInGroupFooterColumn="MQ_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DL" ShowInGroupFooterColumn="DL" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DL_CM" ShowInGroupFooterColumn="DL_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CL" ShowInGroupFooterColumn="CL" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GLFJ" ShowInGroupFooterColumn="GLFJ" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WSH" ShowInGroupFooterColumn="WSH" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WSH_CM" ShowInGroupFooterColumn="WSH_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SH_10A" ShowInGroupFooterColumn="SH_10A" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SH_10B" ShowInGroupFooterColumn="SH_10B" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SH_11" ShowInGroupFooterColumn="SH_11" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SH_12" ShowInGroupFooterColumn="SH_12" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PL_P4" ShowInGroupFooterColumn="PL_P4" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PL_P4_CM" ShowInGroupFooterColumn="PL_P4_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PL_P1" ShowInGroupFooterColumn="PL_P1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PL_P1_CM" ShowInGroupFooterColumn="PL_P1_CM" SummaryType="Sum" DisplayFormat="{0:0.00}" />

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
