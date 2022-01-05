<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoolTemp_Rep.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1500BF.CoolTemp_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">2#高炉冷却壁测温日报表
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
                                            <td width="120px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="14px" Text="请选择冷却壁:" Width="120px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="200px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="200px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="炉基、炉底、冷却壁1段" Value="1" />
                                                        <dx:ListEditItem Text="冷却壁2、3段" Value="2" />
                                                        <dx:ListEditItem Text="冷却壁6、7段" Value="3" />
                                                        <dx:ListEditItem Text="冷却壁8、9段" Value="4" />
                                                        <dx:ListEditItem Text="冷却壁10、11段" Value="5" />
                                                        <dx:ListEditItem Text="冷却壁12、13段" Value="6" />
                                                        <dx:ListEditItem Text="冷却壁14段、炉壳" Value="7" />
                                                    </Items>
                                                </dx:ASPxComboBox>
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
                                                            <dx:GridViewBandColumn Caption="炉基温度" VisibleIndex="3" Name="gbc1">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="+4140" VisibleIndex="0" Name="gbc2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_0" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="XX温度" VisibleIndex="3" Name="gbc3">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1" VisibleIndex="0" Name="gbc4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2" VisibleIndex="0" Name="gbc5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="3" VisibleIndex="0" Name="gbc6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="4" VisibleIndex="0" Name="gbc7">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="5" VisibleIndex="0" Name="gbc8">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="6" VisibleIndex="0" Name="gbc9">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_6" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="7" VisibleIndex="0" Name="gbc10">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_7" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="8" VisibleIndex="0" Name="gbc11">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_8" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="9" VisibleIndex="0" Name="gbc12">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_9" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="XX温度" VisibleIndex="3" Name="gbc13">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1" VisibleIndex="0" Name="gbc14">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_10" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2" VisibleIndex="0" Name="gbc15">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_11" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="3" VisibleIndex="0" Name="gbc16">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_12" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="4" VisibleIndex="0" Name="gbc17">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_13" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="5" VisibleIndex="0" Name="gbc18">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_14" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="6" VisibleIndex="0" Name="gbc19">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_15" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="7" VisibleIndex="0" Name="gbc20">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_16" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="8" VisibleIndex="0" Name="gbc21">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_17" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="9" VisibleIndex="0" Name="gbc22">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_18" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="10" VisibleIndex="0" Name="gbc23">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_19" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="11" VisibleIndex="0" Name="gbc24">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_20" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="12" VisibleIndex="0" Name="gbc25">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="FIELD_21" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_SF" ShowInGroupFooterColumn="SUM_SF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_0" ShowInGroupFooterColumn="FIELD_0" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_1" ShowInGroupFooterColumn="FIELD_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_2" ShowInGroupFooterColumn="FIELD_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_3" ShowInGroupFooterColumn="FIELD_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_4" ShowInGroupFooterColumn="FIELD_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_5" ShowInGroupFooterColumn="FIELD_5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_6" ShowInGroupFooterColumn="FIELD_6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_7" ShowInGroupFooterColumn="FIELD_7" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_8" ShowInGroupFooterColumn="FIELD_8" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_9" ShowInGroupFooterColumn="FIELD_9" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_10" ShowInGroupFooterColumn="FIELD_10" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_11" ShowInGroupFooterColumn="FIELD_11" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_12" ShowInGroupFooterColumn="FIELD_12" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_13" ShowInGroupFooterColumn="FIELD_13" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_14" ShowInGroupFooterColumn="FIELD_14" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_15" ShowInGroupFooterColumn="FIELD_15" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_16" ShowInGroupFooterColumn="FIELD_16" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_17" ShowInGroupFooterColumn="FIELD_17" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_18" ShowInGroupFooterColumn="FIELD_18" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_19" ShowInGroupFooterColumn="FIELD_19" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_20" ShowInGroupFooterColumn="FIELD_20" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_21" ShowInGroupFooterColumn="FIELD_21" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_0" ShowInGroupFooterColumn="FIELD_0" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_1" ShowInGroupFooterColumn="FIELD_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_2" ShowInGroupFooterColumn="FIELD_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_3" ShowInGroupFooterColumn="FIELD_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_4" ShowInGroupFooterColumn="FIELD_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_5" ShowInGroupFooterColumn="FIELD_5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_6" ShowInGroupFooterColumn="FIELD_6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_7" ShowInGroupFooterColumn="FIELD_7" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_8" ShowInGroupFooterColumn="FIELD_8" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_9" ShowInGroupFooterColumn="FIELD_9" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_10" ShowInGroupFooterColumn="FIELD_10" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_11" ShowInGroupFooterColumn="FIELD_11" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_12" ShowInGroupFooterColumn="FIELD_12" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_13" ShowInGroupFooterColumn="FIELD_13" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_14" ShowInGroupFooterColumn="FIELD_14" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_15" ShowInGroupFooterColumn="FIELD_15" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_16" ShowInGroupFooterColumn="FIELD_16" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_17" ShowInGroupFooterColumn="FIELD_17" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_18" ShowInGroupFooterColumn="FIELD_18" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_19" ShowInGroupFooterColumn="FIELD_19" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_20" ShowInGroupFooterColumn="FIELD_20" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FIELD_21" ShowInGroupFooterColumn="FIELD_21" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded"/>
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <%--<SettingsResizing ColumnResizeMode="Control" />--%>
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
