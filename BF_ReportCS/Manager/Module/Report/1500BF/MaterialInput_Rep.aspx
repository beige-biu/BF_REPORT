<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialInput_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.MaterialInput_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">高炉入炉原燃料日报表
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
                                                <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="开始日期:" Width="80px">
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
                                            <td width="120px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="14px" Text="请选择物料类别:" Width="120px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="80px" ClientInstanceName="cbbType">
                                                    <Items>
                                                        <dx:ListEditItem Text="矿石" Value="1" />
                                                        <dx:ListEditItem Text="燃料" Value="2" />
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
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False"/>
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="日期" FieldName="DATETIME" GroupIndex="0" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="150px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending" FixedStyle="Left">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm"></PropertiesTextEdit>
                                                                <CellStyle Wrap="False"/>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" FixedStyle="Left">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="WORK_TEAM" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="2" FixedStyle="Left">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="烧结矿" VisibleIndex="3" Name="gbc1">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="重量" FieldName="SUM_SF" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="70px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="球团矿" VisibleIndex="4" Name="gbc2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="总湿重" FieldName="SUM_WET_AF" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="总干重" FieldName="SUM_AF" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球1品名" FieldName="AF_NAME1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="100px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="AF_WET_WEIGHT1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="AF_WEIGHT1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球2品名" FieldName="AF_NAME2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="100px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="AF_WET_WEIGHT2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="AF_WEIGHT2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="球3品名" FieldName="AF_NAME3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="8">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="AF_WET_WEIGHT3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="AF_WEIGHT3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="块矿" VisibleIndex="5" Name="gbc3">
                                                                <Columns>
                                                                     <dx:GridViewDataTextColumn Caption="总湿重" FieldName="SUM_WET_OF" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="总干重" FieldName="SUM_OF" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="矿1品名" FieldName="OF_NAME1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="100px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="OF_WET_WEIGHT1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="OF_WEIGHT1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="矿2品名" FieldName="OF_NAME2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="100px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="OF_WET_WEIGHT2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="OF_WEIGHT2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="矿3品名" FieldName="OF_NAME3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="8">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="OF_WET_WEIGHT3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="OF_WEIGHT3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="白云石" FieldName="ZF_WEIGHT1" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="硅石" FieldName="ZF_WEIGHT2" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="石灰石" FieldName="ZF_WEIGHT3" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="萤石" FieldName="ZF_WEIGHT4" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="锰矿" FieldName="ZF_WEIGHT5" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="蛇纹石" FieldName="ZF_WEIGHT6" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="65px" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="矿总量" FieldName="SUM_ORE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="湿焦" FieldName="SUM_COKE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="干焦" FieldName="SUM_DRY_COKE" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="焦炭1" VisibleIndex="10" Name="gbc5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="品名" FieldName="COKE_NAME1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="110px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="COKE_WET_WEIGHT1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="COKE_WEIGHT1" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="焦炭2" VisibleIndex="11" Name="gbc6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="品名" FieldName="COKE_NAME2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="110px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="COKE_WET_WEIGHT2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="COKE_WEIGHT2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="焦炭3" VisibleIndex="12" Name="gbc7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="品名" FieldName="COKE_NAME3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="COKE_WET_WEIGHT3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="COKE_WEIGHT3" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="焦丁总量" VisibleIndex="13" Name="gbc10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="COKE_WEIGHT6" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="COKE_WEIGHT7" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="回收焦丁" VisibleIndex="13" Name="gbc8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="SUM_WET_CFD" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="SUM_CFD" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="外购焦丁" VisibleIndex="14" Name="gbc9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="湿重" FieldName="SUM_WET_CFD2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="干重" FieldName="SUM_CFD2" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="煤粉" FieldName="SUM_COKEJET" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="15" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="累计" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_SF" ShowInGroupFooterColumn="SUM_SF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_SF2" ShowInGroupFooterColumn="SUM_SF2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_AF" ShowInGroupFooterColumn="SUM_AF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_AF" ShowInGroupFooterColumn="SUM_WET_AF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WEIGHT1" ShowInGroupFooterColumn="AF_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WEIGHT2" ShowInGroupFooterColumn="AF_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WEIGHT3" ShowInGroupFooterColumn="AF_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WET_WEIGHT1" ShowInGroupFooterColumn="AF_WET_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WET_WEIGHT2" ShowInGroupFooterColumn="AF_WET_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WET_WEIGHT3" ShowInGroupFooterColumn="AF_WET_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_OF" ShowInGroupFooterColumn="SUM_OF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_OF" ShowInGroupFooterColumn="SUM_WET_OF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WEIGHT1" ShowInGroupFooterColumn="OF_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WEIGHT2" ShowInGroupFooterColumn="OF_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WEIGHT3" ShowInGroupFooterColumn="OF_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WET_WEIGHT1" ShowInGroupFooterColumn="OF_WET_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WET_WEIGHT2" ShowInGroupFooterColumn="OF_WET_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WET_WEIGHT3" ShowInGroupFooterColumn="OF_WET_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT1" ShowInGroupFooterColumn="ZF_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT2" ShowInGroupFooterColumn="ZF_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT3" ShowInGroupFooterColumn="ZF_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT4" ShowInGroupFooterColumn="ZF_WEIGHT4" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT5" ShowInGroupFooterColumn="ZF_WEIGHT5" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT6" ShowInGroupFooterColumn="ZF_WEIGHT6" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_ORE" ShowInGroupFooterColumn="SUM_ORE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_COKE" ShowInGroupFooterColumn="SUM_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_DRY_COKE" ShowInGroupFooterColumn="SUM_DRY_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT1" ShowInGroupFooterColumn="COKE_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT2" ShowInGroupFooterColumn="COKE_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT3" ShowInGroupFooterColumn="COKE_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WET_WEIGHT1" ShowInGroupFooterColumn="COKE_WET_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WET_WEIGHT2" ShowInGroupFooterColumn="COKE_WET_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WET_WEIGHT3" ShowInGroupFooterColumn="COKE_WET_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_CFD" ShowInGroupFooterColumn="SUM_CFD" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_CFD" ShowInGroupFooterColumn="SUM_WET_CFD" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_CFD2" ShowInGroupFooterColumn="SUM_CFD2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_CFD2" ShowInGroupFooterColumn="SUM_WET_CFD2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_COKEJET" ShowInGroupFooterColumn="SUM_COKEJET" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT6" ShowInGroupFooterColumn="COKE_WEIGHT6" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT7" ShowInGroupFooterColumn="COKE_WEIGHT7" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="累计" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_SF" ShowInGroupFooterColumn="SUM_SF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_SF2" ShowInGroupFooterColumn="SUM_SF2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_AF" ShowInGroupFooterColumn="SUM_AF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_AF" ShowInGroupFooterColumn="SUM_WET_AF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WEIGHT1" ShowInGroupFooterColumn="AF_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WEIGHT2" ShowInGroupFooterColumn="AF_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WEIGHT3" ShowInGroupFooterColumn="AF_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WET_WEIGHT1" ShowInGroupFooterColumn="AF_WET_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WET_WEIGHT2" ShowInGroupFooterColumn="AF_WET_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="AF_WET_WEIGHT3" ShowInGroupFooterColumn="AF_WET_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_OF" ShowInGroupFooterColumn="SUM_OF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_OF" ShowInGroupFooterColumn="SUM_WET_OF" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WEIGHT1" ShowInGroupFooterColumn="OF_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WEIGHT2" ShowInGroupFooterColumn="OF_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WEIGHT3" ShowInGroupFooterColumn="OF_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WET_WEIGHT1" ShowInGroupFooterColumn="OF_WET_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WET_WEIGHT2" ShowInGroupFooterColumn="OF_WET_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="OF_WET_WEIGHT3" ShowInGroupFooterColumn="OF_WET_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT1" ShowInGroupFooterColumn="ZF_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT2" ShowInGroupFooterColumn="ZF_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT3" ShowInGroupFooterColumn="ZF_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT4" ShowInGroupFooterColumn="ZF_WEIGHT4" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT5" ShowInGroupFooterColumn="ZF_WEIGHT5" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="ZF_WEIGHT6" ShowInGroupFooterColumn="ZF_WEIGHT6" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_ORE" ShowInGroupFooterColumn="SUM_ORE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_COKE" ShowInGroupFooterColumn="SUM_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_DRY_COKE" ShowInGroupFooterColumn="SUM_DRY_COKE" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT1" ShowInGroupFooterColumn="COKE_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT2" ShowInGroupFooterColumn="COKE_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT3" ShowInGroupFooterColumn="COKE_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WET_WEIGHT1" ShowInGroupFooterColumn="COKE_WET_WEIGHT1" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WET_WEIGHT2" ShowInGroupFooterColumn="COKE_WET_WEIGHT2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WET_WEIGHT3" ShowInGroupFooterColumn="COKE_WET_WEIGHT3" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_CFD" ShowInGroupFooterColumn="SUM_CFD" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_CFD" ShowInGroupFooterColumn="SUM_WET_CFD" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_CFD2" ShowInGroupFooterColumn="SUM_CFD2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_WET_CFD2" ShowInGroupFooterColumn="SUM_WET_CFD2" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="SUM_COKEJET" ShowInGroupFooterColumn="SUM_COKEJET" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT6" ShowInGroupFooterColumn="COKE_WEIGHT6" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="COKE_WEIGHT7" ShowInGroupFooterColumn="COKE_WEIGHT7" SummaryType="Sum" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true"  ShowGroupFooter="VisibleIfExpanded"/>
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
