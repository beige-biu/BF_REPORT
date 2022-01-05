<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GasDust_Rep_1.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1280BF.GasDust_Rep_1" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <style>
        #cbp_Base_gridBase1_col28>table {
         width:75px !important;
        }
    </style>
    
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
                    <td width="100%;" height="30px" align="center" valign="center">1#高炉除尘系统日报表
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
                                            <td width="100px">
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R61-057/0-04-E" Width="100px">
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
                                                            <dx:GridViewBandColumn Caption="干法除尘" VisibleIndex="3">
                                                            <Columns>
                                                            <dx:GridViewDataTextColumn Caption="荒煤气总管压力" FieldName="P_HMQZG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="净煤气总管压力" FieldName="P_JMQZG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="荒煤气总管温度" FieldName="T_HMQZG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="1#箱体" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="T_XT1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="FC_XT1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2#箱体" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="T_XT2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="FC_XT2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="3#箱体" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="T_XT3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="FC_XT3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="4#箱体" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="T_XT4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="FC_XT4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="5#箱体" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="T_XT5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="FC_XT5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="6#箱体" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="T_XT6" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="FC_XT6" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="7#箱体" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="T_XT7" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="FC_XT7" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="净煤气总管含尘量" FieldName="FC_JMQZG" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="蒸汽压力" FieldName="P_ZQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="12" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="N2进气口压力" FieldName="P_N2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="13" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                            </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="出铁场除尘" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="风机电流" FieldName="CTCC_FJDL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="风门开度" FieldName="CTCC_FMKD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="CTCC_TSP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="矿槽除尘" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="风机电流" FieldName="KCCC_FJDL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="风门开度" FieldName="KCCC_FMKD" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="粉尘浓度" FieldName="KCCC_TSP" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>

                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="P_HMQZG" ShowInGroupFooterColumn="P_HMQZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_JMQZG" ShowInGroupFooterColumn="P_JMQZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_HMQZG" ShowInGroupFooterColumn="T_HMQZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT1" ShowInGroupFooterColumn="T_XT1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT1" ShowInGroupFooterColumn="FC_XT1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT2" ShowInGroupFooterColumn="T_XT2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT2" ShowInGroupFooterColumn="FC_XT2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT3" ShowInGroupFooterColumn="T_XT3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT3" ShowInGroupFooterColumn="FC_XT3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT4" ShowInGroupFooterColumn="T_XT4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT4" ShowInGroupFooterColumn="FC_XT4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT5" ShowInGroupFooterColumn="T_XT5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT5" ShowInGroupFooterColumn="FC_XT5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT6" ShowInGroupFooterColumn="T_XT6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT6" ShowInGroupFooterColumn="FC_XT6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT7" ShowInGroupFooterColumn="T_XT7" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT7" ShowInGroupFooterColumn="FC_XT7" SummaryType="Average" DisplayFormat="{0:0.00}" />                                                         
                                                            <dx:ASPxSummaryItem FieldName="CTCC_FJDL" ShowInGroupFooterColumn="CTCC_FJDL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CTCC_FMKD" ShowInGroupFooterColumn="CTCC_FMKD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="KCCC_FJDL" ShowInGroupFooterColumn="KCCC_FJDL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="KCCC_FMKD" ShowInGroupFooterColumn="KCCC_FMKD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_JMQZG" ShowInGroupFooterColumn="FC_JMQZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_ZQ" ShowInGroupFooterColumn="P_ZQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_N2" ShowInGroupFooterColumn="P_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="KCCC_TSP" ShowInGroupFooterColumn="KCCC_TSP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CTCC_TSP" ShowInGroupFooterColumn="CTCC_TSP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="P_HMQZG" ShowInGroupFooterColumn="P_HMQZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_JMQZG" ShowInGroupFooterColumn="P_JMQZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_HMQZG" ShowInGroupFooterColumn="T_HMQZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT1" ShowInGroupFooterColumn="T_XT1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT1" ShowInGroupFooterColumn="FC_XT1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT2" ShowInGroupFooterColumn="T_XT2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT2" ShowInGroupFooterColumn="FC_XT2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT3" ShowInGroupFooterColumn="T_XT3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT3" ShowInGroupFooterColumn="FC_XT3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT4" ShowInGroupFooterColumn="T_XT4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT4" ShowInGroupFooterColumn="FC_XT4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT5" ShowInGroupFooterColumn="T_XT5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT5" ShowInGroupFooterColumn="FC_XT5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT6" ShowInGroupFooterColumn="T_XT6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT6" ShowInGroupFooterColumn="FC_XT6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="T_XT7" ShowInGroupFooterColumn="T_XT7" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_XT7" ShowInGroupFooterColumn="FC_XT7" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CTCC_FJDL" ShowInGroupFooterColumn="CTCC_FJDL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CTCC_FMKD" ShowInGroupFooterColumn="CTCC_FMKD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="KCCC_FJDL" ShowInGroupFooterColumn="KCCC_FJDL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="KCCC_FMKD" ShowInGroupFooterColumn="KCCC_FMKD" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FC_JMQZG" ShowInGroupFooterColumn="FC_JMQZG" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_ZQ" ShowInGroupFooterColumn="P_ZQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="P_N2" ShowInGroupFooterColumn="P_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="KCCC_TSP" ShowInGroupFooterColumn="KCCC_TSP" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="CTCC_TSP" ShowInGroupFooterColumn="CTCC_TSP" SummaryType="Average" DisplayFormat="{0:0.00}" />    
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
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
