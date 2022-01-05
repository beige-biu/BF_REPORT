<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STEnergy_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._360ST.STEnergy_Rep_1" %>

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
                        360烧结区域能源介质
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="170px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                            </dx:GridViewDataTextColumn>
                                                            <%--<dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>--%>                                                       
                                                            <dx:GridViewBandColumn Caption="软水" VisibleIndex="1">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="余热回收水箱补水" FieldName="SUM_RS_FLOW" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}" Visible="true">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="生产水" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="脱硫补水总管" FieldName="TL_FS_FE3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}" Visible="true">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="烧结水泵房补水" FieldName="FE_902_03" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}" Visible="true">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="高炉至烧结补水总管" FieldName="PL_FIQ_102ACC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}" Visible="true">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="压缩空气" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="配料方向压缩空气" FieldName="ST_PL_YSKQ_ACCMU" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="主电除尘方向压缩空气" FieldName="ST_SHK_YSKQ_ACCMU" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="脱硫压缩空气" FieldName="YSKQ_FT3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="烧结总管压缩空气" FieldName="SJ_FIQ_305_ACCMU" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="煤气" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="点火炉煤气" FieldName="SJ_FRQ_301_ACCMU" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="预热炉煤气" FieldName="SJ_FRQ_381_ACCMU" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="煤气总管" FieldName="SJ_MQZG_ACCMU" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="蒸汽" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="预热回收产蒸汽" FieldName="ZQLJ01" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="烧结自耗蒸汽" FieldName="SJ_TRQ_ACCMU" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="95px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                       Width ="95px" VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                            
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_RS_FLOW" ShowInGroupFooterColumn="SUM_RS_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TL_FS_FE3" ShowInGroupFooterColumn="TL_FS_FE3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FE_902_03" ShowInGroupFooterColumn="FE_902_03" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PL_FIQ_102ACC" ShowInGroupFooterColumn="PL_FIQ_102ACC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ST_PL_YSKQ_ACCMU" ShowInGroupFooterColumn="ST_PL_YSKQ_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ST_SHK_YSKQ_ACCMU" ShowInGroupFooterColumn="ST_SHK_YSKQ_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YSKQ_FT3" ShowInGroupFooterColumn="YSKQ_FT3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FIQ_305_ACCMU" ShowInGroupFooterColumn="SJ_FIQ_305_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_301_ACCMU" ShowInGroupFooterColumn="SJ_FRQ_301_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_381_ACCMU" ShowInGroupFooterColumn="SJ_FRQ_381_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_MQZG_ACCMU" ShowInGroupFooterColumn="SJ_MQZG_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZQLJ01" ShowInGroupFooterColumn="ZQLJ01" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TRQ_ACCMU" ShowInGroupFooterColumn="SJ_TRQ_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                          
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_RS_FLOW" ShowInGroupFooterColumn="SUM_RS_FLOW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TL_FS_FE3" ShowInGroupFooterColumn="TL_FS_FE3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FE_902_03" ShowInGroupFooterColumn="FE_902_03" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PL_FIQ_102ACC" ShowInGroupFooterColumn="PL_FIQ_102ACC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ST_PL_YSKQ_ACCMU" ShowInGroupFooterColumn="ST_PL_YSKQ_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ST_SHK_YSKQ_ACCMU" ShowInGroupFooterColumn="ST_SHK_YSKQ_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YSKQ_FT3" ShowInGroupFooterColumn="YSKQ_FT3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FIQ_305_ACCMU" ShowInGroupFooterColumn="SJ_FIQ_305_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_301_ACCMU" ShowInGroupFooterColumn="SJ_FRQ_301_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_FRQ_381_ACCMU" ShowInGroupFooterColumn="SJ_FRQ_381_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_MQZG_ACCMU" ShowInGroupFooterColumn="SJ_MQZG_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZQLJ01" ShowInGroupFooterColumn="ZQLJ01" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_TRQ_ACCMU" ShowInGroupFooterColumn="SJ_TRQ_ACCMU" SummaryType="Average" DisplayFormat="{0:0.00}" />  
                                                            
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
