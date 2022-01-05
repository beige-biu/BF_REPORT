<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IronOutput_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.IronOutput_Rep_3" %>

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
        #cbp_Base_gridBase1_col7 > table {
        width:89px !important;
        }
    </style>
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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉出铁及铁口工作情况
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
                                            <%--<td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>--%>
                                            <%--<td width="100px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="100px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="全部出铁口" Value="1" />
                                                        <dx:ListEditItem Text="1#" Value="2" />
                                                        <dx:ListEditItem Text="2#" Value="3" />
                                                        <dx:ListEditItem Text="3#" Value="3" />
                                                        <dx:ListEditItem Text="4#" Value="4" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>--%>
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
                                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="R67-108/0-16-E" Width="100px">
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
                                                            <dx:GridViewDataTextColumn Caption="日期" FieldName="CURDAY" Width="100px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd"></PropertiesTextEdit>
                                                                <CellStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉次" FieldName="SEQ"  ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" >
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="铁口" FieldName="TAP_HOLE" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="兑罐时间" FieldName="ARRIVED_TIME" Width="140px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="出铁时间" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="开始" FieldName="START_TIME" Width="140px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="0">
                                                                        <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm"></PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="结束" FieldName="END_TIME" Width="140px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                        <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm"></PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="出铁时间间隔" FieldName="TAP_TIME" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="产量t" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="理论" FieldName="THEORY_YIELD" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="估产" FieldName="EST_YIELD" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="过磅" FieldName="POUND_YIELD" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="成分估计" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[Si]" FieldName="EST_SI" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[S]" FieldName="EST_S" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="R2" FieldName="EST_R2" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="生铁化学成分" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[Si]" FieldName="ACT_SI" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[S]" FieldName="ACT_S" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[Mn]" FieldName="ACT_MN" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[P]" FieldName="ACT_P" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[Ti]" FieldName="ACT_TI" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[As]" FieldName="ACT_AS" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="[Cu]" FieldName="ACT_CU" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="6">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="牌号" FieldName="ACT_PH" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="7">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣色" FieldName="OUTDREG_COLOR" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="深度" FieldName="DEEPTH" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="8">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="角度" FieldName="ANGLE" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="9">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="打泥量" FieldName="MUD" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>                                                           
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="CURDAY" ShowInGroupFooterColumn="CURDAY" SummaryType="Count" DisplayFormat="合计" />
                                                            <dx:ASPxSummaryItem FieldName="THEORY_YIELD" ShowInGroupFooterColumn="THEORY_YIELD" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="EST_YIELD" ShowInGroupFooterColumn="EST_YIELD" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="POUND_YIELD" ShowInGroupFooterColumn="POUND_YIELD" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="EST_SI" ShowInGroupFooterColumn="EST_SI" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="EST_S" ShowInGroupFooterColumn="EST_S" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="EST_R2" ShowInGroupFooterColumn="EST_R2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ACT_SI" ShowInGroupFooterColumn="ACT_SI" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ACT_S" ShowInGroupFooterColumn="ACT_S" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ACT_MN" ShowInGroupFooterColumn="ACT_MN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ACT_P" ShowInGroupFooterColumn="ACT_P" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ACT_TI" ShowInGroupFooterColumn="ACT_TI" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ACT_AS" ShowInGroupFooterColumn="ACT_AS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ACT_CU" ShowInGroupFooterColumn="ACT_CU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                        </GroupSummary>
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
