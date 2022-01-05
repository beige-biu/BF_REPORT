<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HSChange_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1280BF.HSChange_Rep_1" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉热风炉交换作业日报表
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="140px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                                <HeaderStyle Wrap="False" />
                                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="BC" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="BB" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="1#热风炉" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="状态" FieldName="HS1_STATUS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="描述" FieldName="HS1_STATUSDESC" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧时间" FieldName="HS1_C_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="焖炉时间" FieldName="HS1_S_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="送风时间" FieldName="HS1_W_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2#热风炉" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="状态" FieldName="HS2_STATUS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="描述" FieldName="HS2_STATUSDESC" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧时间" FieldName="HS2_C_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="焖炉时间" FieldName="HS2_S_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="送风时间" FieldName="HS2_W_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="3#热风炉" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="状态" FieldName="HS3_STATUS" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="描述" FieldName="HS3_STATUSDESC" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="燃烧时间" FieldName="HS3_C_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="焖炉时间" FieldName="HS3_S_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="送风时间" FieldName="HS3_W_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="200px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
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