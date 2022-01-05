<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BFNOTE_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.BFNOTE_Rep_3" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉白夜班记事
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table style="width: 100%;" align="center" valign="top">
                            <tr style="background-color: lightblue;">
                                <td>
                                    <table style="width: 100%; height: 35px;" valign="center">
                                        <tr>
                                            <td width="80px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="开始日期:" Width="80px" >
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
                                            <td width="80px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="80px" ClientInstanceName="cbbType" >
                                                    <Items>
                                                        <dx:ListEditItem Text="夜班" Value="1" />
                                                        <dx:ListEditItem Text="白班" Value="0" />
                                                    </Items>
                                                </dx:ASPxComboBox>
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
<%--                                            <td width="80px">
                                                <dx:ASPxButton ID="btnExp_Excel" Font-Size="14px" runat="server" Text="导出Excel" AutoPostBack="false" Width="80px" OnClick="btnExp_Excel_Click">
                                                </dx:ASPxButton>
                                            </td>--%>
                                            <td width="100%">&nbsp;</td>
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="R67-106/0-16-E" Width="100px">
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
                                                <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
                                                        </Styles>
                                                        <Columns>                                                          
                                                            <dx:GridViewDataTextColumn Caption="产量" FieldName="SHIFTLOG_YIELD" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="1" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦比" FieldName="SHIFTLOG_CARBONRATIO" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="2" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="HK" FieldName="SHIFTLOG_HK" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="3" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名1" FieldName="SHIFTLOG_COKE1" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="4" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭2比例" FieldName="SHIFTLOG_COKE1RATIO" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="5" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名2" FieldName="SHIFTLOG_COKE2" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="6" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭2比例" FieldName="SHIFTLOG_COKE2RATIO" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="7" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名3" FieldName="SHIFTLOG_COKE3" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="8" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭3比例" FieldName="SHIFTLOG_COKE3RATIO" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="9" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名4" FieldName="SHIFTLOG_COKE4" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="10" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭4比例" FieldName="SHIFTLOG_COKE4RATIO" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="11" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="11" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowDragDrop="false" AllowSort="False" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <SettingsResizing ColumnResizeMode="Control" />
                                                        <%--<Settings ShowHorizontalScrollBar="True" />--%>
                                                    </dx:ASPxGridView>
                                                    
                                                    <dx:ASPxGridView ID="gridBase3" runat="server" ClientInstanceName="gridBase3" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase3_HtmlRowPrepared"  Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                            <Row HorizontalAlign="Center" />
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="field1" Width="105px" ShowInCustomizationForm="true" UnboundType="String"
                                                                VisibleIndex="0" >                                                           
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="field0" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="235px" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>


                                                        </Columns>
                                                        <Settings ShowColumnHeaders="False" />
                                                        <SettingsBehavior AllowDragDrop="false" AllowSort="False" />
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
    </form>
</body>
</html>
