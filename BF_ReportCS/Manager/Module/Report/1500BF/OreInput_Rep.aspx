<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OreInput_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.OreInput_Rep" %>

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
        function OnQueryClick() {
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
                    <td width="100%;" height="30px" align="center" valign="center">矿石投料
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
                                            <td width="100px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel3" Font-Size="14px" runat="server" Text="选择数据方式:" Width="100px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="80px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="全部" Value="1" />
                                                        <dx:ListEditItem Text="实际值" Value="2" />
                                                        <dx:ListEditItem Text="理论值" Value="3" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px" align="right">
                                                <dx:ASPxButton ID="btnQuery" Font-Size="14px" runat="server" Text="查询" AutoPostBack="false" Width="80px">
                                                    <ClientSideEvents Click="function(s,e){OnQueryClick();}" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td width="20px">
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="" Width="20px">
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
                                        <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" OnCustomCellMerge="gridBase1_CustomCellMerge" Font-Size="14px">
                                            <Styles>
                                                <Header HorizontalAlign="Center" Wrap="True" />
                                                <AlternatingRow Enabled="true" />
                                                <Cell HorizontalAlign="Center" Wrap="False" />
                                                <Footer HorizontalAlign="Center"></Footer>
                                                <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                            </Styles>
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="80px" ShowInCustomizationForm="false" UnboundType="String"
                                                    VisibleIndex="0" SortOrder="Ascending">
                                                    <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                    <Settings AllowCellMerge="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                    VisibleIndex="1" SortOrder="Descending">
                                                    <HeaderStyle Wrap="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="班别" FieldName="WORK_TEAM" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                    VisibleIndex="2">
                                                    <Settings AllowCellMerge="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="料种" FieldName="ORE_NAME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                    VisibleIndex="3">
                                                    <Settings AllowCellMerge="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="批号" FieldName="BATCH_NO" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                    VisibleIndex="4">
                                                    <Settings AllowCellMerge="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="数据模式" FieldName="DATA_TYPE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                    VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="矿批总重(t)" FieldName="MAT_SUM" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                    VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="烧结矿(t)" VisibleIndex="7">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="SF1" FieldName="SF1_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF2" FieldName="SF2_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF3" FieldName="SF3_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF4" FieldName="SF4_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF5" FieldName="SF5_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF6" FieldName="SF6_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF7" FieldName="SF7_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF8" FieldName="SF8_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF9" FieldName="SF9_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="SF10" FieldName="SF10_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="总计" FieldName="SF_SUM" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="球团矿(t)" VisibleIndex="8">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="AF1" FieldName="AF1_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="AF2" FieldName="AF2_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="总计" FieldName="AF_SUM" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="块矿(t)" VisibleIndex="9">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="OF1" FieldName="OF1_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="OF2" FieldName="OF2_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="总计" FieldName="OF_SUM" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="辅料(t)" VisibleIndex="10">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="ZF1" FieldName="ZF1_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="ZF2" FieldName="ZF2_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="总计" FieldName="ZF_SUM" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="焦丁(t)" VisibleIndex="10">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="CFD1" FieldName="CFD1_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="CFD2" FieldName="CFD2_SET_WEIGHT" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="总计" FieldName="CFD_SUM" ShowInCustomizationForm="True" UnboundType="String"
                                                            Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataTextColumn Caption="排料标志" FieldName="CHARGE_ORE_FLAG" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                    VisibleIndex="11">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Visible="false">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="MAT_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="MAT_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF1_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF1_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF2_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF2_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF3_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF3_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF4_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF4_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF5_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF5_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF6_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF6_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF7_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF7_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF8_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF8_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF9_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF9_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF10_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF10_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="SF_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="AF1_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="AF1_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="AF2_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="AF2_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="AF_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="AF_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="OF1_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="OF1_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="OF2_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="OF2_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="OF_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="OF_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="ZF1_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="ZF1_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="ZF2_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="ZF2_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="ZF_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="ZF_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="CFD1_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="CFD1_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="CFD2_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="CFD2_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="CFD_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="" FieldName="CFD_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                            VisibleIndex="2" Visible="false">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                            </Columns>
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="合计{0}条" />
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="DATA_TYPE" ShowInGroupFooterColumn="DATA_TYPE" SummaryType="Max" DisplayFormat="{0}" />
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="DATA_TYPE" ShowInGroupFooterColumn="DATA_TYPE" SummaryType="Min" DisplayFormat="{0}" />
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="MAT_SUM1" ShowInColumn="MAT_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="MAT_SUM2" ShowInColumn="MAT_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF1_SUM1" ShowInColumn="SF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF1_SUM2" ShowInColumn="SF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF2_SUM1" ShowInColumn="SF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF2_SUM2" ShowInColumn="SF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF3_SUM1" ShowInColumn="SF3" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF3_SUM2" ShowInColumn="SF3" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF4_SUM1" ShowInColumn="SF4" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF4_SUM2" ShowInColumn="SF4" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF5_SUM1" ShowInColumn="SF5" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF5_SUM2" ShowInColumn="SF5" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF6_SUM1" ShowInColumn="SF6" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF6_SUM2" ShowInColumn="SF6" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF7_SUM1" ShowInColumn="SF7" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF7_SUM2" ShowInColumn="SF7" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF8_SUM1" ShowInColumn="SF8" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF8_SUM2" ShowInColumn="SF8" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF9_SUM1" ShowInColumn="SF9" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF9_SUM2" ShowInColumn="SF9" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF10_SUM1" ShowInColumn="SF10" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF10_SUM2" ShowInColumn="SF10" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF_SUM1" ShowInColumn="SF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF_SUM2" ShowInColumn="SF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>

                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="AF1_SUM1" ShowInColumn="AF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="AF1_SUM2" ShowInColumn="AF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="AF2_SUM1" ShowInColumn="AF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="AF2_SUM2" ShowInColumn="AF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="AF_SUM1" ShowInColumn="AF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="AF_SUM2" ShowInColumn="AF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>

                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="OF1_SUM1" ShowInColumn="OF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="OF1_SUM2" ShowInColumn="OF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="OF2_SUM1" ShowInColumn="OF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="OF2_SUM2" ShowInColumn="OF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="OF_SUM1" ShowInColumn="OF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="OF_SUM2" ShowInColumn="OF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>

                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="ZF1_SUM1" ShowInColumn="ZF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="ZF1_SUM2" ShowInColumn="ZF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="ZF2_SUM1" ShowInColumn="ZF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="ZF2_SUM2" ShowInColumn="ZF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="ZF_SUM1" ShowInColumn="ZF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="ZF_SUM2" ShowInColumn="ZF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>

                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="CFD1_SUM1" ShowInColumn="CFD1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="CFD1_SUM2" ShowInColumn="CFD1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="CFD2_SUM1" ShowInColumn="CFD2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="CFD2_SUM2" ShowInColumn="CFD2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="CFD_SUM1" ShowInColumn="CFD_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="CFD_SUM2" ShowInColumn="CFD_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                            </TotalSummary>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="合计{0}条" />
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="DATA_TYPE" ShowInGroupFooterColumn="DATA_TYPE" SummaryType="Max" DisplayFormat="{0}" />
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="DATA_TYPE" ShowInGroupFooterColumn="DATA_TYPE" SummaryType="Min" DisplayFormat="{0}" />
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="MAT_SUM1" ShowInGroupFooterColumn="MAT_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="MAT_SUM2" ShowInGroupFooterColumn="MAT_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF1_SUM1" ShowInGroupFooterColumn="SF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF1_SUM2" ShowInGroupFooterColumn="SF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF2_SUM1" ShowInGroupFooterColumn="SF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF2_SUM2" ShowInGroupFooterColumn="SF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF3_SUM1" ShowInGroupFooterColumn="SF3" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF3_SUM2" ShowInGroupFooterColumn="SF3" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF4_SUM1" ShowInGroupFooterColumn="SF4" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF4_SUM2" ShowInGroupFooterColumn="SF4" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF5_SUM1" ShowInGroupFooterColumn="SF5" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF5_SUM2" ShowInGroupFooterColumn="SF5" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF6_SUM1" ShowInGroupFooterColumn="SF6" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF6_SUM2" ShowInGroupFooterColumn="SF6" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF7_SUM1" ShowInGroupFooterColumn="SF7" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF7_SUM2" ShowInGroupFooterColumn="SF7" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF8_SUM1" ShowInGroupFooterColumn="SF8" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF8_SUM2" ShowInGroupFooterColumn="SF8" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF9_SUM1" ShowInGroupFooterColumn="SF9" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF9_SUM2" ShowInGroupFooterColumn="SF9" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF10_SUM1" ShowInGroupFooterColumn="SF10" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF10_SUM2" ShowInGroupFooterColumn="SF10" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="SF_SUM1" ShowInGroupFooterColumn="SF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="SF_SUM2" ShowInGroupFooterColumn="SF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>

                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="AF1_SUM1" ShowInGroupFooterColumn="AF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="AF1_SUM2" ShowInGroupFooterColumn="AF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="AF2_SUM1" ShowInGroupFooterColumn="AF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="AF2_SUM2" ShowInGroupFooterColumn="AF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="AF_SUM1" ShowInGroupFooterColumn="AF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="AF_SUM2" ShowInGroupFooterColumn="AF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>

                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="OF1_SUM1" ShowInGroupFooterColumn="OF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="OF1_SUM2" ShowInGroupFooterColumn="OF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="OF2_SUM1" ShowInGroupFooterColumn="OF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="OF2_SUM2" ShowInGroupFooterColumn="OF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="OF_SUM1" ShowInGroupFooterColumn="OF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="OF_SUM2" ShowInGroupFooterColumn="OF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>

                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="ZF1_SUM1" ShowInGroupFooterColumn="ZF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="ZF1_SUM2" ShowInGroupFooterColumn="ZF1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="ZF2_SUM1" ShowInGroupFooterColumn="ZF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="ZF2_SUM2" ShowInGroupFooterColumn="ZF2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="ZF_SUM1" ShowInGroupFooterColumn="ZF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="ZF_SUM2" ShowInGroupFooterColumn="ZF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>

                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="CFD1_SUM1" ShowInGroupFooterColumn="CFD1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="CFD1_SUM2" ShowInGroupFooterColumn="CFD1" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="CFD2_SUM1" ShowInGroupFooterColumn="CFD2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="CFD2_SUM2" ShowInGroupFooterColumn="CFD2" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag1" FieldName="CFD_SUM1" ShowInGroupFooterColumn="CFD_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                <dx:ASPxSummaryItem Tag="tag2" FieldName="CFD_SUM2" ShowInGroupFooterColumn="CFD_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                            </GroupSummary>
                                            <%--<TotalSummary>
                                                <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="累计" />
                                                <dx:ASPxSummaryItem FieldName="MAT_SUM" ShowInGroupFooterColumn="MAT_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="CFD_SUM" ShowInGroupFooterColumn="CFD_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="CFD2_SET_WEIGHT" ShowInGroupFooterColumn="CFD2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="CFD1_SET_WEIGHT" ShowInGroupFooterColumn="CFD1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="ZF_SUM" ShowInGroupFooterColumn="ZF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="ZF2_SET_WEIGHT" ShowInGroupFooterColumn="ZF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="ZF1_SET_WEIGHT" ShowInGroupFooterColumn="ZF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="OF_SUM" ShowInGroupFooterColumn="OF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="OF2_SET_WEIGHT" ShowInGroupFooterColumn="OF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="OF1_SET_WEIGHT" ShowInGroupFooterColumn="OF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="AF_SUM" ShowInGroupFooterColumn="AF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="AF2_SET_WEIGHT" ShowInGroupFooterColumn="AF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="AF1_SET_WEIGHT" ShowInGroupFooterColumn="AF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF_SUM" ShowInGroupFooterColumn="SF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF1_SET_WEIGHT" ShowInGroupFooterColumn="SF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF2_SET_WEIGHT" ShowInGroupFooterColumn="SF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF3_SET_WEIGHT" ShowInGroupFooterColumn="SF3_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF4_SET_WEIGHT" ShowInGroupFooterColumn="SF4_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF5_SET_WEIGHT" ShowInGroupFooterColumn="SF5_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF6_SET_WEIGHT" ShowInGroupFooterColumn="SF6_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF7_SET_WEIGHT" ShowInGroupFooterColumn="SF7_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF8_SET_WEIGHT" ShowInGroupFooterColumn="SF8_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF9_SET_WEIGHT" ShowInGroupFooterColumn="SF9_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF10_SET_WEIGHT" ShowInGroupFooterColumn="SF10_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                            </TotalSummary>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="累计" />
                                                <dx:ASPxSummaryItem FieldName="MAT_SUM" ShowInGroupFooterColumn="MAT_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="CFD_SUM" ShowInGroupFooterColumn="CFD_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="CFD2_SET_WEIGHT" ShowInGroupFooterColumn="CFD2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="CFD1_SET_WEIGHT" ShowInGroupFooterColumn="CFD1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="ZF_SUM" ShowInGroupFooterColumn="ZF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="ZF2_SET_WEIGHT" ShowInGroupFooterColumn="ZF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="ZF1_SET_WEIGHT" ShowInGroupFooterColumn="ZF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="OF_SUM" ShowInGroupFooterColumn="OF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="OF2_SET_WEIGHT" ShowInGroupFooterColumn="OF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="OF1_SET_WEIGHT" ShowInGroupFooterColumn="OF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="AF_SUM" ShowInGroupFooterColumn="AF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="AF2_SET_WEIGHT" ShowInGroupFooterColumn="AF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="AF1_SET_WEIGHT" ShowInGroupFooterColumn="AF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF_SUM" ShowInGroupFooterColumn="SF_SUM" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF1_SET_WEIGHT" ShowInGroupFooterColumn="SF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF2_SET_WEIGHT" ShowInGroupFooterColumn="SF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF3_SET_WEIGHT" ShowInGroupFooterColumn="SF3_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF4_SET_WEIGHT" ShowInGroupFooterColumn="SF4_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF5_SET_WEIGHT" ShowInGroupFooterColumn="SF5_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF6_SET_WEIGHT" ShowInGroupFooterColumn="SF6_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF7_SET_WEIGHT" ShowInGroupFooterColumn="SF7_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF8_SET_WEIGHT" ShowInGroupFooterColumn="SF8_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF9_SET_WEIGHT" ShowInGroupFooterColumn="SF9_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                <dx:ASPxSummaryItem FieldName="SF10_SET_WEIGHT" ShowInGroupFooterColumn="SF10_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                            </GroupSummary>--%>
                                            <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
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
        </div>
        <dx:ASPxGridViewExporter ID="ExpGrid" runat="server" GridViewID="gridBase1">
        </dx:ASPxGridViewExporter>
    </form>
</body>
</html>



