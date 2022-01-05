<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BFlclw_Rep_2.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1500BF.BFlclw_Rep_2" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">2#高炉料仓料位日报
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="120px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm:ss"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结1#" FieldName="烧结1#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="1" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结2#" FieldName="烧结2#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="2" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结3#" FieldName="烧结3#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="3" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结4#" FieldName="烧结4#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="4" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结5#" FieldName="烧结5#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="5" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结6#" FieldName="烧结6#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="6" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结7#" FieldName="烧结7#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="7" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结8#" FieldName="烧结8#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="8" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结9#" FieldName="烧结9#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="9" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结10#" FieldName="烧结10#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="10" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭1#" FieldName="焦炭1#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="11" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭2#" FieldName="焦炭2#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="12" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭3#" FieldName="焦炭3#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="13" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭4#" FieldName="焦炭4#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="14" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭5#" FieldName="焦炭5#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="15" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭6#" FieldName="焦炭6#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="16" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭7#" FieldName="焦炭7#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="17" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团1#" FieldName="球团1#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="18" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团2#" FieldName="球团2#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="19" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿1#" FieldName="块矿1#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="20" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿2#" FieldName="块矿2#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="21" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿1#" FieldName="杂矿1#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="22" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿2#" FieldName="杂矿2#" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="23" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="外采焦" FieldName="外采焦" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="24" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="回收焦" FieldName="回收焦" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="25" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="返矿仓" FieldName="返矿仓" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="26" >                                                
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="返焦仓" FieldName="返焦仓" Width="45px" ShowInCustomizationForm="false" UnboundType="Decimal"
                                                                VisibleIndex="27" >                                                
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
