<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProdIndex_Rep_1.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1280BF.ProdIndex_Rep_1" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉生产技经指标日报表
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
                                                            <Header HorizontalAlign="Center" Wrap="False" />
                                                            <AlternatingRow Enabled="False" />
                                                            <Cell HorizontalAlign="Center" Wrap="False"/>
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="产量<br>(t)" FieldName="IRON_CL" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="3" >
                                                                <PropertiesTextEdit DisplayFormatString="{0:F2}"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="一级品<br>(t)" FieldName="IRON_YJ" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="一级品率<br>(％)" FieldName="IRON_YJPL" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="系数<br>(t/m³.d)" FieldName="LYZS" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="冶炼强度<br>(t/m³.d)" FieldName="YLQD" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="干焦比<br>(kg/t)" FieldName="GJB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤比<br>(kg/t)" FieldName="PMB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦丁比<br>(kg/t)" FieldName="JDB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="燃料比<br>(kg/t)" FieldName="RLB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="综合焦比<br>(kg/t)" FieldName="ZHJB" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="矿耗<br>(t/t)" FieldName="KH" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="13" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="富氧率<br>(％)" FieldName="FYL" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="14" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="风温<br>(℃)" FieldName="FW" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="15" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤气利用率<br>(％)" FieldName="MQLYL" Width="70px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="16" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="入炉品位<br>(％)" FieldName="RLPW" Width="60px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="17" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣铁比<br>(kg/t)" FieldName="ZTB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="18" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="灰铁比<br>(kg/t)" FieldName="HTB" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="19" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
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
