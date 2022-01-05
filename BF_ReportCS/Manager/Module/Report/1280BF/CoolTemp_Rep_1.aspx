<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoolTemp_Rep_1.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1280BF.CoolTemp_Rep_1" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉冷却壁测温日报表
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
                                            <td width="120px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="14px" Text="请选择冷却壁:" Width="120px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="200px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="200px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="炉基、炉底、炉壳温度 TE1101-TE1110" Value="1" />
                                                        <dx:ListEditItem Text="炉缸温度 TE1201-TE1220" Value="2" />
                                                        <dx:ListEditItem Text="炉腹、炉腰温度 TE1221-TE1236" Value="3" />
                                                        <dx:ListEditItem Text="炉身下部温度 TE1237-TE1252" Value="4" />
                                                        <dx:ListEditItem Text="炉身中部、上部温度 TE1253-TE1276" Value="5" />                                                       
                                                    </Items>
                                                </dx:ASPxComboBox>
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
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="BC" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="BB" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="炉基温度" VisibleIndex="3" Name="gbc1">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1101" VisibleIndex="0" Name="gbc2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1101" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="炉底温度" VisibleIndex="4" Name="gbc3">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1102" VisibleIndex="0" Name="gbc4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="TE1102" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="XX温度" VisibleIndex="5" Name="bt10">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1" VisibleIndex="0" Name="bt11">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA11" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2" VisibleIndex="0" Name="bt12">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA12" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="3" VisibleIndex="0" Name="bt13">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA13" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="4" VisibleIndex="0" Name="bt14">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA14" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="5" VisibleIndex="0" Name="bt15">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA15" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="6" VisibleIndex="0" Name="bt16">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA16" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="7" VisibleIndex="0" Name="bt17">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA17" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="8" VisibleIndex="0" Name="bt18">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA18" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                  
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="XX温度" VisibleIndex="6" Name="bt20">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1" VisibleIndex="0" Name="bt21">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA21" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2" VisibleIndex="0" Name="bt22">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA22" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="3" VisibleIndex="0" Name="bt23">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA23" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="4" VisibleIndex="0" Name="bt24">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA24" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="5" VisibleIndex="0" Name="bt25">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA25" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="6" VisibleIndex="0" Name="bt26">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA26" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="7" VisibleIndex="0" Name="bt27">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA27" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="8" VisibleIndex="0" Name="bt28">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA28" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="XX温度" VisibleIndex="7" Name="bt30">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1" VisibleIndex="0" Name="bt31">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA31" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2" VisibleIndex="0" Name="bt32">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA32" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="3" VisibleIndex="0" Name="bt33">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA33" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="4" VisibleIndex="0" Name="bt34">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA34" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="5" VisibleIndex="0" Name="bt35">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA35" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="6" VisibleIndex="0" Name="bt36">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA36" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="7" VisibleIndex="0" Name="bt37">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA37" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="8" VisibleIndex="0" Name="bt38">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA38" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                            <dx:GridViewBandColumn Caption="XX温度" VisibleIndex="7" Name="bt40">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1" VisibleIndex="0" Name="bt41">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA41" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2" VisibleIndex="0" Name="bt42">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA42" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="3" VisibleIndex="0" Name="bt43">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA43" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="4" VisibleIndex="0" Name="bt44">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="DATA44" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                                                                                 
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                        </Columns>

                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_SF" ShowInGroupFooterColumn="SUM_SF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1101" ShowInGroupFooterColumn="TE1101" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1102" ShowInGroupFooterColumn="TE1102" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA11" ShowInGroupFooterColumn="DATA11" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA12" ShowInGroupFooterColumn="DATA12" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA13" ShowInGroupFooterColumn="DATA13" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA14" ShowInGroupFooterColumn="DATA14" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA15" ShowInGroupFooterColumn="DATA15" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA16" ShowInGroupFooterColumn="DATA16" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA17" ShowInGroupFooterColumn="DATA17" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA18" ShowInGroupFooterColumn="DATA18" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA21" ShowInGroupFooterColumn="DATA21" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA22" ShowInGroupFooterColumn="DATA22" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA23" ShowInGroupFooterColumn="DATA23" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA24" ShowInGroupFooterColumn="DATA24" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA25" ShowInGroupFooterColumn="DATA25" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA26" ShowInGroupFooterColumn="DATA26" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA27" ShowInGroupFooterColumn="DATA27" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA28" ShowInGroupFooterColumn="DATA28" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA31" ShowInGroupFooterColumn="DATA31" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA32" ShowInGroupFooterColumn="DATA32" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA33" ShowInGroupFooterColumn="DATA33" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA34" ShowInGroupFooterColumn="DATA34" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA35" ShowInGroupFooterColumn="DATA35" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA36" ShowInGroupFooterColumn="DATA36" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA37" ShowInGroupFooterColumn="DATA37" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA38" ShowInGroupFooterColumn="DATA38" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA41" ShowInGroupFooterColumn="DATA41" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA42" ShowInGroupFooterColumn="DATA42" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA43" ShowInGroupFooterColumn="DATA43" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA44" ShowInGroupFooterColumn="DATA44" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="TE1101" ShowInGroupFooterColumn="TE1101" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1102" ShowInGroupFooterColumn="TE1102" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA11" ShowInGroupFooterColumn="DATA11" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA12" ShowInGroupFooterColumn="DATA12" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA13" ShowInGroupFooterColumn="DATA13" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA14" ShowInGroupFooterColumn="DATA14" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA15" ShowInGroupFooterColumn="DATA15" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA16" ShowInGroupFooterColumn="DATA16" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA17" ShowInGroupFooterColumn="DATA17" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA18" ShowInGroupFooterColumn="DATA18" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA21" ShowInGroupFooterColumn="DATA21" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA22" ShowInGroupFooterColumn="DATA22" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA23" ShowInGroupFooterColumn="DATA23" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA24" ShowInGroupFooterColumn="DATA24" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA25" ShowInGroupFooterColumn="DATA25" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA26" ShowInGroupFooterColumn="DATA26" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA27" ShowInGroupFooterColumn="DATA27" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA28" ShowInGroupFooterColumn="DATA28" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA31" ShowInGroupFooterColumn="DATA31" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA32" ShowInGroupFooterColumn="DATA32" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA33" ShowInGroupFooterColumn="DATA33" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA34" ShowInGroupFooterColumn="DATA34" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA35" ShowInGroupFooterColumn="DATA35" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA36" ShowInGroupFooterColumn="DATA36" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA37" ShowInGroupFooterColumn="DATA37" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA38" ShowInGroupFooterColumn="DATA38" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA41" ShowInGroupFooterColumn="DATA41" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA42" ShowInGroupFooterColumn="DATA42" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA43" ShowInGroupFooterColumn="DATA43" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="DATA44" ShowInGroupFooterColumn="DATA44" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded"/>
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <%--<SettingsResizing ColumnResizeMode="Control" />--%>
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
