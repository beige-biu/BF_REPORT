<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FunTopInput_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.FunTopInput_Rep" %>

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
                        高炉炉顶布料日报表
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
                                            <td width="100px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel2" Font-Size="14px" runat="server" Text="选择数据方式:" Width="100px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="80px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="实际值" Value="1" />
                                                        <dx:ListEditItem Text="设定值" Value="2" />
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
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="WORK_TEAM" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="批号" FieldName="CHARGE_NO" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="料种" FieldName="ORE_NAME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="料罐重(t)" FieldName="DUMP_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"  
                                                                VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="启始角" FieldName="RING_B_INI" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="β总圈数" FieldName="RING_B_TOTAL" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="开度r" FieldName="RING_R" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="下尺料线" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="东" FieldName="SD1_DOWN_LINE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="西" FieldName="SD2_DOWN_LINE" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="查表值：α角度/β布料圈数" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="α1" FieldName="SET_A1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A1_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A1_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α2" FieldName="SET_A2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A2_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A2_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α3" FieldName="SET_A3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A3_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A3_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α4" FieldName="SET_A4" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A4_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A4_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α5" FieldName="SET_A5" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A5_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="13" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A5_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="14" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α6" FieldName="SET_A6" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="15" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A6_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="16" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A6_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="17" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α7" FieldName="SET_A7" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="18" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A7_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="19" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A7_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="20" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α8" FieldName="SET_A8" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="21" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A8_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="22" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A8_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="23" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α9" FieldName="SET_A9" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="24" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A9_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="25" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A9_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="26" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α10" FieldName="SET_A10" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="27" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A10_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="28" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A10_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="29" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="α11" FieldName="SET_A11" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="30" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="圈" FieldName="A11_RINGS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="31" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="重" FieldName="A11_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="32" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="布料标志" FieldName="DUMP_WAY" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="12">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="累计" />
                                                            <dx:ASPxSummaryItem FieldName="DUMP_WEIGHT" ShowInGroupFooterColumn="DUMP_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A1_WEIGHT" ShowInGroupFooterColumn="A1_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A2_WEIGHT" ShowInGroupFooterColumn="A2_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A3_WEIGHT" ShowInGroupFooterColumn="A3_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A4_WEIGHT" ShowInGroupFooterColumn="A4_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A5_WEIGHT" ShowInGroupFooterColumn="A5_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A6_WEIGHT" ShowInGroupFooterColumn="A6_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A7_WEIGHT" ShowInGroupFooterColumn="A7_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A8_WEIGHT" ShowInGroupFooterColumn="A8_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A9_WEIGHT" ShowInGroupFooterColumn="A9_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A10_WEIGHT" ShowInGroupFooterColumn="A10_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A11_WEIGHT" ShowInGroupFooterColumn="A11_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />                                                            
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="累计" />
                                                            <dx:ASPxSummaryItem FieldName="DUMP_WEIGHT" ShowInGroupFooterColumn="DUMP_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A1_WEIGHT" ShowInGroupFooterColumn="A1_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A2_WEIGHT" ShowInGroupFooterColumn="A2_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A3_WEIGHT" ShowInGroupFooterColumn="A3_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A4_WEIGHT" ShowInGroupFooterColumn="A4_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A5_WEIGHT" ShowInGroupFooterColumn="A5_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A6_WEIGHT" ShowInGroupFooterColumn="A6_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A7_WEIGHT" ShowInGroupFooterColumn="A7_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A8_WEIGHT" ShowInGroupFooterColumn="A8_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A9_WEIGHT" ShowInGroupFooterColumn="A9_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A10_WEIGHT" ShowInGroupFooterColumn="A10_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="A11_WEIGHT" ShowInGroupFooterColumn="A11_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />    
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true"  ShowGroupFooter="VisibleIfExpanded"/>
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
