<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IronOutput_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.IronOutput_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">高炉出铁作业日报表
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table style="width: 100%;" align="center" valign="top">
                            <tr style="background-color: lightblue;">
                                <td>
                                    <table style="width: 100%; height: 35px;" valign="center">
                                        <tr>
                                            <td width="90px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="开始日期:" Width="90px">
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
                                            <td width="90px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel2" Font-Size="14px" runat="server" Text="结束日期:" Width="90px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="130px">
                                                <dx:ASPxDateEdit ID="dateEndTime" Font-Size="14px" runat="server" ClientInstanceName="dateStartTime"
                                                    EditFormatString="yyyy-MM-dd" Width="100px" CalendarProperties-ClearButtonText="清除"
                                                    CalendarProperties-TodayButtonText="当日">
                                                    <CalendarProperties ClearButtonText="清除" TodayButtonText="当日">
                                                    </CalendarProperties>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="100px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="100px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="全部出铁口" Value="1" />
                                                        <dx:ListEditItem Text="东出铁口" Value="2" />
                                                        <dx:ListEditItem Text="西出铁口" Value="3" />
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="100px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd"></PropertiesTextEdit>
                                                                <CellStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="SHIFT" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="TEAM" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉次" FieldName="HEAT_NO" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="铁次" FieldName="IRON_NO" Width="100px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="铁口" FieldName="IRON_MOUTH_NO" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="兑罐时间" FieldName="TIN_TIME" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="5">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="开始时间" FieldName="OUT_START_TIME" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="6">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="来渣时间" FieldName="OUT_TIME" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="7">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="结束时间" FieldName="OUT_END_TIME" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="8">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="理论产量" FieldName="YIEL_THEO" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="9">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="估计产量" FieldName="YIEL_AMOU" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="过磅重量" FieldName="YIEL_POUD" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="理论渣量" FieldName="YIEL_SLAG" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="12">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣色" FieldName="DREG_COLO" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="13">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="深度" FieldName="IRON_MOUTH_DEPTH" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="14">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="角度" FieldName="IRON_MOUTH_ANGEL" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="15">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="打泥量" FieldName="HIT_MUD" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="16">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="带流" FieldName="DAI_LIU" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="17">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="晚点" FieldName="LATE" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="18">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="估计成分" VisibleIndex="19">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="SI" FieldName="YIEL_SI" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="50px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="S" FieldName="YIEL_S" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="50px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="R2" FieldName="YIEL_R2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="50px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="铁水测温" VisibleIndex="20">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="东铁口测温" FieldName="IRON_TEMP1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="50px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="西铁口测温" FieldName="IRON_TEMP2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="50px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="出铁时间" FieldName="OUT_IRON_SPAN" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="21">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="出渣时间" FieldName="OUT_SLAG_SPAN" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="22">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="出渣率" FieldName="OUT_SALG_PER" Width="50px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="23">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="填写人" FieldName="RECORDER" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="24">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="备注" FieldName="REMARK" Width="250px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="25">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="合计" />
                                                            <dx:ASPxSummaryItem FieldName="YIEL_THEO" ShowInGroupFooterColumn="YIEL_THEO" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YIEL_AMOU" ShowInGroupFooterColumn="YIEL_AMOU" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YIEL_POUD" ShowInGroupFooterColumn="YIEL_POUD" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YIEL_SLAG" ShowInGroupFooterColumn="YIEL_SLAG" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YIEL_SI" ShowInGroupFooterColumn="YIEL_SI" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YIEL_S" ShowInGroupFooterColumn="YIEL_S" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YIEL_R2" ShowInGroupFooterColumn="YIEL_R2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="IRON_TEMP1" ShowInGroupFooterColumn="IRON_TEMP1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="IRON_TEMP2" ShowInGroupFooterColumn="IRON_TEMP2" SummaryType="Average" DisplayFormat="{0:0.00}" />
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
