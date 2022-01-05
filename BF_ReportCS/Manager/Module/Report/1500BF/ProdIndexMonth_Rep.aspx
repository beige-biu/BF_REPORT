<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProdIndexMonth_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.ProdIndexMonth_Rep" %>

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
                <tr>
                    <td with="100%;" height="30px" align="center" valign="center" style="background-color: cornflowerblue; font-size: 15pt;">高炉生产技经指标月报表</td>
                </tr>
            </table>
            <table style="width: 100%;background-color: lightblue;">
                <tr>
                    <td valign="top">
                        <table style="width: 100%;" align="center" valign="top">
                            <tr style="background-color: lightblue;">
                                <td>
                                    <table style="width: 100%; height: 35px;" valign="center">
                                        <tr>
                                            <td width="80px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="开始月份:" Width="80px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="130px">
                                                <dx:ASPxDateEdit ID="dateStartTime" Font-Size="14px" runat="server" ClientInstanceName="dateStartTime"
                                                    EditFormatString="yyyy-MM" Width="100px" CalendarProperties-ClearButtonText="清除"
                                                    CalendarProperties-TodayButtonText="当日">
                                                    <CalendarProperties ClearButtonText="清除" TodayButtonText="当日">
                                                    </CalendarProperties>
                                                </dx:ASPxDateEdit>
                                            </td>
                                            <td width="80px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel2" Font-Size="14px" runat="server" Text="结束月份:" Width="80px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="130px">
                                                <dx:ASPxDateEdit ID="dateEndTime" Font-Size="14px" runat="server" ClientInstanceName="dateEndTime"
                                                    EditFormatString="yyyy-MM" Width="100px" CalendarProperties-ClearButtonText="清除"
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
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="9">
                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                        <dx:ASPxCallbackPanel ID="cbp_Base" runat="server" ClientIDMode="AutoID" Width="100%"
                                            OnCallback="cbp_Base_Callback" ClientInstanceName="cbp_Base">
                                            <PanelCollection>
                                                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="False" />
                                                            <AlternatingRow Enabled="True" />            
                                                            <Cell HorizontalAlign="Center" Wrap="False"/>
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles> 
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="产量<br>(t)" FieldName="IRON_CL" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="系数<br>(t/m³.d)" FieldName="LYZS" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="冶强<br>(t/m³.d)" FieldName="YLQD" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="综合冶强<br>(t/m³.d)" FieldName="ZHQD" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="干焦比<br>(kg/t)" FieldName="GJB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤比<br>(kg/t)" FieldName="PMB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦丁比<br>(kg/t)" FieldName="JDB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="燃料比<br>(kg/t)" FieldName="RLB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="8">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="综合焦比<br>(kg/t)" FieldName="ZHJB" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="9">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="矿耗<br>(t/t)" FieldName="KH" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="熔剂消耗<br>(t/t)" FieldName="RJXH" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="负荷<br>(t/t)" FieldName="FH" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="12">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="综合负荷<br>(t/t)" FieldName="ZHFH" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="13">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="富氧率<br>(％)" FieldName="FYL" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="14">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="入炉品位<br>(％)" FieldName="RLPW" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="15">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣铁比<br>(kg/t)" FieldName="ZTB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="16">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="统计:{0:0}条" />
                                                            <dx:ASPxSummaryItem FieldName="IRON_CL" ShowInGroupFooterColumn="IRON_CL" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LYZS" ShowInGroupFooterColumn="LYZS" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="YLQD" ShowInGroupFooterColumn="YLQD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZHQD" ShowInGroupFooterColumn="ZHQD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GJB" ShowInGroupFooterColumn="GJB" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="PMB" ShowInGroupFooterColumn="PMB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="JDB" ShowInGroupFooterColumn="JDB" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="RLB" ShowInGroupFooterColumn="RLB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZHJB" ShowInGroupFooterColumn="ZHJB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="KH" ShowInGroupFooterColumn="KH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="RJXH" ShowInGroupFooterColumn="RJXH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FH" ShowInGroupFooterColumn="FH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZHFH" ShowInGroupFooterColumn="ZHFH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FYL" ShowInGroupFooterColumn="FYL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="RLPW" ShowInGroupFooterColumn="RLPW" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZTB" ShowInGroupFooterColumn="ZTB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded"/>
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true"/> 
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


   