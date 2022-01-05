<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CokeInput_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.CokeInput_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">焦炭投料
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
                                                <dx:ASPxLabel ID="ASPxLabel3" Font-Size="14px" Text="选择数据方式:" runat="server" Width="100px">
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
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="" Width="20px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px" align="right">
                                                <dx:ASPxButton ID="btnQuery" Font-Size="14px" runat="server" Text="查询" AutoPostBack="false" Width="80px">
                                                    <ClientSideEvents Click="function(s,e){OnQueryClick();}" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td width="20px">
                                                <input name="hdf1" type="hidden" id="hdf1" value=""/>
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
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared"
                                                        OnCustomSummaryCalculate="gridBase1_CustomSummaryCalculate" OnCustomCellMerge="gridBase1_CustomCellMerge" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True"/>
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
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
                                                            <dx:GridViewDataTextColumn Caption="批号" FieldName="BATCH_NO" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                                <Settings AllowCellMerge="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="料种" FieldName="ORE_NAME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                                <Settings AllowCellMerge="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="排焦方式" FieldName="V_CHARGE_WAY" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                                <Settings AllowCellMerge="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="数据模式" FieldName="DATA_TYPE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦仓1(t)" FieldName="COKE1_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦仓2(t)" FieldName="COKE2_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦仓3(t)" FieldName="COKE3_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦仓4(t)" FieldName="COKE4_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦仓5(t)" FieldName="COKE5_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦仓6(t)" FieldName="COKE6_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="焦仓7(t)" FieldName="COKE7_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="湿焦总重(t)" FieldName="SUM_WET_COKE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="干焦总重(t)" FieldName="SUM_DRY_COKE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿1(t)" FieldName="ZF1_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}" Visible="false">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿2(t)" FieldName="ZF2_SET_WEIGHT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}" Visible="false">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="杂矿总重(t)" FieldName="SUM_ZF" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}" Visible="false">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Visible="false">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE1_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE1_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE2_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE2_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE3_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE3_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE4_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE4_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE5_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE5_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE6_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE6_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE7_SUM1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="COKE7_SUM2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="SUM_WET1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="SUM_WET2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="SUM_DRY1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="SUM_DRY2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="ZF1_SET1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="ZF1_SET2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="ZF2_SET1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="ZF2_SET2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="SUM_ZF1" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="" FieldName="SUM_ZF2" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="合计{0}条" />
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="DATA_TYPE" ShowInGroupFooterColumn="DATA_TYPE" SummaryType="Max" DisplayFormat="{0}" />
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="DATA_TYPE" ShowInGroupFooterColumn="DATA_TYPE" SummaryType="Min" DisplayFormat="{0}" />
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE1_SUM1" ShowInColumn="COKE1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE1_SUM2" ShowInColumn="COKE1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE2_SUM1" ShowInColumn="COKE2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE2_SUM2" ShowInColumn="COKE2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE3_SUM1" ShowInColumn="COKE3_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE3_SUM2" ShowInColumn="COKE3_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE4_SUM1" ShowInColumn="COKE4_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE4_SUM2" ShowInColumn="COKE4_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE5_SUM1" ShowInColumn="COKE5_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE5_SUM2" ShowInColumn="COKE5_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE6_SUM1" ShowInColumn="COKE6_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE6_SUM2" ShowInColumn="COKE6_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE7_SUM1" ShowInColumn="COKE7_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE7_SUM2" ShowInColumn="COKE7_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="SUM_WET1" ShowInColumn="SUM_WET_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="SUM_WET2" ShowInColumn="SUM_WET_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="SUM_DRY1" ShowInColumn="SUM_DRY_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="SUM_DRY2" ShowInColumn="SUM_DRY_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="合计{0}条" />
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="DATA_TYPE" ShowInGroupFooterColumn="DATA_TYPE" SummaryType="Max" DisplayFormat="{0}" />
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="DATA_TYPE" ShowInGroupFooterColumn="DATA_TYPE" SummaryType="Min" DisplayFormat="{0}" />
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE1_SUM1" ShowInGroupFooterColumn="COKE1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE1_SUM2" ShowInGroupFooterColumn="COKE1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE2_SUM1" ShowInGroupFooterColumn="COKE2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE2_SUM2" ShowInGroupFooterColumn="COKE2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE3_SUM1" ShowInGroupFooterColumn="COKE3_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE3_SUM2" ShowInGroupFooterColumn="COKE3_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE4_SUM1" ShowInGroupFooterColumn="COKE4_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE4_SUM2" ShowInGroupFooterColumn="COKE4_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE5_SUM1" ShowInGroupFooterColumn="COKE5_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE5_SUM2" ShowInGroupFooterColumn="COKE5_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE6_SUM1" ShowInGroupFooterColumn="COKE6_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE6_SUM2" ShowInGroupFooterColumn="COKE6_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="COKE7_SUM1" ShowInGroupFooterColumn="COKE7_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="COKE7_SUM2" ShowInGroupFooterColumn="COKE7_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="SUM_WET1" ShowInGroupFooterColumn="SUM_WET_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="SUM_WET2" ShowInGroupFooterColumn="SUM_WET_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag1" FieldName="SUM_DRY1" ShowInGroupFooterColumn="SUM_DRY_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                            <dx:ASPxSummaryItem Tag="tag2" FieldName="SUM_DRY2" ShowInGroupFooterColumn="SUM_DRY_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}"/>
                                                        </GroupSummary>
                                                        <%--<TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="累计" />
                                                            <dx:ASPxSummaryItem FieldName="COKE1_SET_WEIGHT" ShowInGroupFooterColumn="COKE1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE2_SET_WEIGHT" ShowInGroupFooterColumn="COKE2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE3_SET_WEIGHT" ShowInGroupFooterColumn="COKE3_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE4_SET_WEIGHT" ShowInGroupFooterColumn="COKE4_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE5_SET_WEIGHT" ShowInGroupFooterColumn="COKE5_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE6_SET_WEIGHT" ShowInGroupFooterColumn="COKE6_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE7_SET_WEIGHT" ShowInGroupFooterColumn="COKE7_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_COKE" ShowInGroupFooterColumn="SUM_WET_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_DRY_COKE" ShowInGroupFooterColumn="SUM_DRY_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF1_SET_WEIGHT" ShowInGroupFooterColumn="ZF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF2_SET_WEIGHT" ShowInGroupFooterColumn="ZF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_ZF" ShowInGroupFooterColumn="SUM_ZF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>--%>
                                                        <%--<GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="累计" />
                                                            <dx:ASPxSummaryItem FieldName="COKE1_SET_WEIGHT" ShowInGroupFooterColumn="COKE1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE2_SET_WEIGHT" ShowInGroupFooterColumn="COKE2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE3_SET_WEIGHT" ShowInGroupFooterColumn="COKE3_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE4_SET_WEIGHT" ShowInGroupFooterColumn="COKE4_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE5_SET_WEIGHT" ShowInGroupFooterColumn="COKE5_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE6_SET_WEIGHT" ShowInGroupFooterColumn="COKE6_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE7_SET_WEIGHT" ShowInGroupFooterColumn="COKE7_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_COKE" ShowInGroupFooterColumn="SUM_WET_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_DRY_COKE" ShowInGroupFooterColumn="SUM_DRY_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF1_SET_WEIGHT" ShowInGroupFooterColumn="ZF1_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF2_SET_WEIGHT" ShowInGroupFooterColumn="ZF2_SET_WEIGHT" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_ZF" ShowInGroupFooterColumn="SUM_ZF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>--%>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded"/>
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
