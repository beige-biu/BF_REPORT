<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoolTemp_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1500BF.CoolTemp_Rep_3" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉冷却壁热面水温记录
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
                                            <td width="200px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="200px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="冷却壁1层" Value="1" />
                                                        <dx:ListEditItem Text="冷却壁2层" Value="2" />
                                                        <dx:ListEditItem Text="冷却壁3层" Value="3" />
                                                        <dx:ListEditItem Text="冷却壁6层" Value="4" />
                                                        <dx:ListEditItem Text="冷却壁7层" Value="5" />
                                                        <dx:ListEditItem Text="冷却壁8层" Value="6" />
                                                        <dx:ListEditItem Text="冷却壁9层" Value="7" />
                                                        <dx:ListEditItem Text="冷却壁10层" Value="8" />
                                                        <dx:ListEditItem Text="冷却壁11层" Value="9" />
                                                        <dx:ListEditItem Text="冷却壁12层" Value="10" />
                                                        <dx:ListEditItem Text="冷却壁13层" Value="11" />
                                                        <dx:ListEditItem Text="冷却壁15层" Value="12" />
                                                        <dx:ListEditItem Text="冷却壁16层" Value="13" />

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
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="R67-110/0-16-E" Width="100px">
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
                                                            <dx:GridViewDataTextColumn Caption="层位" FieldName="COOLING_LAYERNO" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="1" FieldName="COOLING_P1" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="5" FieldName="COOLING_P5" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="6" FieldName="COOLING_P6" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="10" FieldName="COOLING_P10" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="11" FieldName="COOLING_P11" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="12" FieldName="COOLING_P12" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="15" FieldName="COOLING_P15" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="16" FieldName="COOLING_P16" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="17" FieldName="COOLING_P17" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="20" FieldName="COOLING_P20" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="21" FieldName="COOLING_P21" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="23" FieldName="COOLING_P23" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="24" FieldName="COOLING_P24" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="26" FieldName="COOLING_P26" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="28" FieldName="COOLING_P28" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="31" FieldName="COOLING_P31" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="33" FieldName="COOLING_P33" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="34" FieldName="COOLING_P34" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="36" FieldName="COOLING_P36" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="38" FieldName="COOLING_P38" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="39" FieldName="COOLING_P39" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="41" FieldName="COOLING_P41" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="43" FieldName="COOLING_P43" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="44" FieldName="COOLING_P44" Width="65px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>

                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P1" ShowInGroupFooterColumn="COOLING_P1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P5" ShowInGroupFooterColumn="COOLING_P5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P6" ShowInGroupFooterColumn="COOLING_P6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P10" ShowInGroupFooterColumn="COOLING_P10" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P11" ShowInGroupFooterColumn="COOLING_P11" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P12" ShowInGroupFooterColumn="COOLING_P12" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P15" ShowInGroupFooterColumn="COOLING_P15" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P16" ShowInGroupFooterColumn="COOLING_P16" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P17" ShowInGroupFooterColumn="COOLING_P17" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P20" ShowInGroupFooterColumn="COOLING_P20" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P21" ShowInGroupFooterColumn="COOLING_P21" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P23" ShowInGroupFooterColumn="COOLING_P23" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P24" ShowInGroupFooterColumn="COOLING_P24" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P26" ShowInGroupFooterColumn="COOLING_P26" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P28" ShowInGroupFooterColumn="COOLING_P28" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P31" ShowInGroupFooterColumn="COOLING_P31" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P33" ShowInGroupFooterColumn="COOLING_P33" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P34" ShowInGroupFooterColumn="COOLING_P34" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P36" ShowInGroupFooterColumn="COOLING_P36" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P38" ShowInGroupFooterColumn="COOLING_P38" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P39" ShowInGroupFooterColumn="COOLING_P39" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P41" ShowInGroupFooterColumn="COOLING_P41" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P43" ShowInGroupFooterColumn="COOLING_P43" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P44" ShowInGroupFooterColumn="COOLING_P44" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P1" ShowInGroupFooterColumn="COOLING_P1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P5" ShowInGroupFooterColumn="COOLING_P5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P6" ShowInGroupFooterColumn="COOLING_P6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P10" ShowInGroupFooterColumn="COOLING_P10" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P11" ShowInGroupFooterColumn="COOLING_P11" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P12" ShowInGroupFooterColumn="COOLING_P12" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P15" ShowInGroupFooterColumn="COOLING_P15" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P16" ShowInGroupFooterColumn="COOLING_P16" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P17" ShowInGroupFooterColumn="COOLING_P17" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P20" ShowInGroupFooterColumn="COOLING_P20" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P21" ShowInGroupFooterColumn="COOLING_P21" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P23" ShowInGroupFooterColumn="COOLING_P23" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P24" ShowInGroupFooterColumn="COOLING_P24" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P26" ShowInGroupFooterColumn="COOLING_P26" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P28" ShowInGroupFooterColumn="COOLING_P28" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P31" ShowInGroupFooterColumn="COOLING_P31" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P33" ShowInGroupFooterColumn="COOLING_P33" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P34" ShowInGroupFooterColumn="COOLING_P34" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P36" ShowInGroupFooterColumn="COOLING_P36" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P38" ShowInGroupFooterColumn="COOLING_P38" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P39" ShowInGroupFooterColumn="COOLING_P39" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P41" ShowInGroupFooterColumn="COOLING_P41" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P43" ShowInGroupFooterColumn="COOLING_P43" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COOLING_P44" ShowInGroupFooterColumn="COOLING_P44" SummaryType="Average" DisplayFormat="{0:0.00}" />
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
