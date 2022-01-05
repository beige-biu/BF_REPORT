<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BLSJ_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.BLSJ_Rep_3" %>

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
                        3#高炉变料记录
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
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="R67-116/0-16-E" Width="100px">
                                                </dx:ASPxLabel>
                                            </td>
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
                                                            <dx:GridViewDataTextColumn Caption="批次" FieldName="BATCH" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="CLASS_KIND" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="变料人" FieldName="RECORDER" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="焦批重kg" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="干焦" FieldName="DRY_COKE_WEIG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿焦" FieldName="WET_COKE_WEIG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名1" FieldName="COKE1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭1重量kg" FieldName="COKE1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名2" FieldName="COKE2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭2重量kg" FieldName="COKE2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="8">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名3" FieldName="COKE3_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="9">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭3重量kg" FieldName="COKE3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名4" FieldName="COKE4_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭4重量kg" FieldName="COKE4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="12">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦丁重量" FieldName="JD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="13">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="矿批重" FieldName="MINE_BATC_WEIG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="14">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="自产烧结矿" FieldName="SINT_MINE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="15">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿1名称" FieldName="BALL_MINE1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="16">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿1kg" FieldName="BALL_MINE1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="17">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿2名称" FieldName="BALL_MINE2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="18">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿2kg" FieldName="BALL_MINE2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="19">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿3名称" FieldName="BALL_MINE3_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="20">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿3kg" FieldName="BALL_MINE3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="21">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="自产球团矿" FieldName="BALL_MINE_ZC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="22">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿1名称" FieldName="BLOC_MINE1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="23">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿1kg" FieldName="BLOC_MINE1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="24">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿2名称" FieldName="BLOC_MINE2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="25">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿2kg" FieldName="BLOC_MINE2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="26">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿3名称" FieldName="BLOC_MINE3_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="27">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿3kg" FieldName="BLOC_MINE3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="28">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="白云石kg" FieldName="DOLO" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="29">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="硅石kg" FieldName="SILEX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="30">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="萤石kg" FieldName="YS" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="31">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="锰矿kg" FieldName="MK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="32">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤量kg" FieldName="COAL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="33">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣中Al2O3" FieldName="ZZAL2O3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="34">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣中CaO" FieldName="ZZCAO" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="35">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣中SiO2" FieldName="ZZSIO2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="36">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣中MgO" FieldName="ZZMGO" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="37">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="R2" FieldName="R2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="38">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="H干" FieldName="H_DRY" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="39">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="批铁量" FieldName="BATC_IRON" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="40">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="批体积m3" FieldName="BATC_VOL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="41">
                                                            </dx:GridViewDataTextColumn>

                                                        </Columns>
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
