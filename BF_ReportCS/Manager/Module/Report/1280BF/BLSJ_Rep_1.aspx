<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BLSJ_Rep_1.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1280BF.BLSJ_Rep_1" %>

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
                        1#高炉变料记录
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="150px" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="批次" FieldName="CHARGENUM" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="BC" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="BB" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="焦批重kg" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="干焦" FieldName="COKE_WEIGHT1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿焦" FieldName="COKE_WEIGHT2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名1" FieldName="COKE1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭1重量kg" FieldName="COKE1_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名2" FieldName="COKE2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭2重量kg" FieldName="COKE2_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="8">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名3" FieldName="COKE3_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="9">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭3重量kg" FieldName="COKE3_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="10">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名4" FieldName="COKE4_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭4重量kg" FieldName="COKE4_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="12">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭品名5" FieldName="COKE5_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="13">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦炭5重量kg" FieldName="COKE5_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="14">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦丁重量" FieldName="CFD_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="15">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="矿批重" FieldName="ORE_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="16">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结矿品名" FieldName="SINTER_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="17">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="烧结矿重量" FieldName="SINTER_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="18">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿1名称" FieldName="AF1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="19">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿1kg" FieldName="AF1_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="20">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿2名称" FieldName="AF2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="21">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="球团矿2kg" FieldName="AF2_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="22">
                                                            </dx:GridViewDataTextColumn>                                                           
                                                            <dx:GridViewDataTextColumn Caption="块矿1名称" FieldName="OF1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="23">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿1kg" FieldName="OF1_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="24">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿2名称" FieldName="OF2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="25">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="块矿2kg" FieldName="OF2_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="26">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿1名称" FieldName="OF1_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="27">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿1kg" FieldName="OF1_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="28">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿2名称" FieldName="OF2_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="29">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿2kg" FieldName="OF2_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="30">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="设定料线" FieldName="SET_LX" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="31">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="设定焦料线" FieldName="SET_COKELX" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="32">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="喷煤量" FieldName="JETCOKE_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="33">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="计算渣比" FieldName="THERY_ZB" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="34">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣中Al2O3" FieldName="SLAG_AL2O3" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="35">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣中CAO" FieldName="SLAG_CAO" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="36">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣中SIO2" FieldName="SLAG_SIO" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="37">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="渣中MGO" FieldName="SLAG_MGO" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="38">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="R2" FieldName="R2" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="39">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="干焦负荷" FieldName="THERY_GJFH" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="40">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="批铁量" FieldName="THERY_FE" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="41">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="批体积" FieldName="THERY_TJ" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="70px" VisibleIndex="42">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="变料人" FieldName="USER_NAME" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="100px" VisibleIndex="43">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="装料制度" FieldName="USER_REMARK" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="1300px" VisibleIndex="44">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="110px" VisibleIndex="45">
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
