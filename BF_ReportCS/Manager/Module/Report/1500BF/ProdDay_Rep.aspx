<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProdDay_Rep.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1500BF.ProdDay_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">高炉生产作业日报表
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
                                                        <dx:ListEditItem Text="全部" Value="0" />
                                                        <dx:ListEditItem Text="白班" Value="1" />
                                                        <dx:ListEditItem Text="夜班" Value="2" />
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
                                            <td width="80px">
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
                                                <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewBandColumn Caption="项目">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="时间" FieldName="field0" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="50px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="下料情况" VisibleIndex="1">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn FieldName="field1" UnboundType="String" ShowInCustomizationForm="True" Caption="料批" Width="50px" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString="{0:0.0}" Visible="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field2" UnboundType="String" ShowInCustomizationForm="True" Caption="累计" Width="50px" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="{0:0.0}" Visible="true"></dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="送风制度" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="风量" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field3" UnboundType="String" ShowInCustomizationForm="True" Caption="m³/min" Width="70px"
                                                                                VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="{0:0}" />
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="热风压" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field4" UnboundType="String" ShowInCustomizationForm="True" Caption="kPa" Width="65px" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="炉顶压" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field5" UnboundType="String" ShowInCustomizationForm="True" Caption="kPa" Width="65px" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="全压差" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field7" UnboundType="String" ShowInCustomizationForm="True" Caption="kPa" Width="65px" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field6" UnboundType="String" ShowInCustomizationForm="True" Caption="透气性指数" Width="65px" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="喷煤量" VisibleIndex="6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field8" UnboundType="String" ShowInCustomizationForm="True" Caption="t/h" Width="65px" VisibleIndex="9"></dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="风温" VisibleIndex="7">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field9" UnboundType="String" ShowInCustomizationForm="True" Caption="℃" Width="70px"
                                                                                VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="{0:0}" />
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="富氧量" VisibleIndex="8">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field10" UnboundType="String" ShowInCustomizationForm="True" Caption="m³" Width="75px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0}" />
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="高压富氧" VisibleIndex="9">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="OXY_AMOUNT" UnboundType="String" ShowInCustomizationForm="True" Caption="m³" Width="75px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0}" />
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="机前富氧" VisibleIndex="10">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="R_LG_ACTIVE" UnboundType="String" ShowInCustomizationForm="True" Caption="m³" Width="75px" VisibleIndex="11" PropertiesTextEdit-DisplayFormatString="{0:0}" />
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn FieldName="field11" UnboundType="String" ShowInCustomizationForm="True" Caption="煤气利用率" Width="65px" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="field12" UnboundType="String" ShowInCustomizationForm="True" Caption="炉基温度<br>℃" Width="65px" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="渣铁情况" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn FieldName="field13" UnboundType="String" ShowInCustomizationForm="True" Caption="铁次" Width="80px" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field14" UnboundType="String" ShowInCustomizationForm="True" Caption="铁口" Width="65px" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="出铁时间" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field15" UnboundType="String" ShowInCustomizationForm="True" Caption="开始" Width="60px" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field16" UnboundType="String" ShowInCustomizationForm="True" Caption="来渣" Width="55px" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field17" UnboundType="String" ShowInCustomizationForm="True" Caption="结束" Width="55px" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="产量" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field18" UnboundType="String" ShowInCustomizationForm="True" Caption="估产" Width="70px" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field19" UnboundType="String" ShowInCustomizationForm="True" Caption="实产" Width="70px" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="渣铁物化性能" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field20" UnboundType="String" ShowInCustomizationForm="True" Caption="Si" Width="55px" VisibleIndex="8"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field21" UnboundType="String" ShowInCustomizationForm="True" Caption="S" Width="55px" VisibleIndex="9"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field22" UnboundType="String" ShowInCustomizationForm="True" Caption="P" Width="55px" VisibleIndex="10"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field23" UnboundType="String" ShowInCustomizationForm="True" Caption="等级" Width="55px" VisibleIndex="11"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field24" UnboundType="String" ShowInCustomizationForm="True" Caption="温度" Width="55px" VisibleIndex="12"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field25" UnboundType="String" ShowInCustomizationForm="True" Caption="Ktp" Width="55px" VisibleIndex="13"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field26" UnboundType="String" ShowInCustomizationForm="True" Caption="渣色" Width="55px" VisibleIndex="14"></dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="炉渣成分" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="field27" UnboundType="String" ShowInCustomizationForm="True" Caption="CaO" Width="55px" VisibleIndex="8"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field28" UnboundType="String" ShowInCustomizationForm="True" Caption="SiO2" Width="55px" VisibleIndex="9"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field29" UnboundType="String" ShowInCustomizationForm="True" Caption="MgO" Width="55px" VisibleIndex="10"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field30" UnboundType="String" ShowInCustomizationForm="True" Caption="Al2O3" Width="55px" VisibleIndex="11"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field31" UnboundType="String" ShowInCustomizationForm="True" Caption="FeO" Width="55px" VisibleIndex="12"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field32" UnboundType="String" ShowInCustomizationForm="True" Caption="R2" Width="55px" VisibleIndex="13"></dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="field33" UnboundType="String" ShowInCustomizationForm="True" Caption="镁铝比" Width="65px" VisibleIndex="14"></dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field34" UnboundType="String" ShowInCustomizationForm="True" Caption="深度" Width="55px" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field35" UnboundType="String" ShowInCustomizationForm="True" Caption="角度" Width="55px" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field36" UnboundType="String" ShowInCustomizationForm="True" Caption="泥量" Width="55px" VisibleIndex="8"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="field37" UnboundType="String" ShowInCustomizationForm="True" Caption="带流" Width="55px" VisibleIndex="9"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="" UnboundType="String" ShowInCustomizationForm="True" Caption="" Width="55px" VisibleIndex="9"></dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowDragDrop="false" AllowSort="False" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <SettingsResizing ColumnResizeMode="Control" />
                                                        <%--<Settings ShowHorizontalScrollBar="True" />--%>
                                                    </dx:ASPxGridView>
                                                    <dx:ASPxGridView ID="gridBase2" runat="server" ClientInstanceName="gridBase2" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase2_HtmlRowPrepared" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewBandColumn Caption="变料情况">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="日期" FieldName="field21" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="100px" VisibleIndex="0">
                                                                        <PropertiesTextEdit DisplayFormatString="MM-dd HH:mm"></PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="批次" FieldName="field0" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="50px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn Caption="矿批" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="field1" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="50px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="焦批" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="field2" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="焦丁" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="field3" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="品位" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="field4" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="烧结矿" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="field5" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="field6" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="球团矿" VisibleIndex="6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="field7" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="field8" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="70px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="块矿" VisibleIndex="7">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="field9" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="75px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="field10" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="熔剂" VisibleIndex="8">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t/ch" FieldName="field11" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="批铁" VisibleIndex="9">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="field12" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="80px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="干焦比" VisibleIndex="10">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kg/t" FieldName="field13" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="燃料比" VisibleIndex="11">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kg/t" FieldName="field14" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="60px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="负荷" VisibleIndex="12">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="干焦" FieldName="field15" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="55px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="全焦" FieldName="field16" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="55px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="装料制度及变更原因" FieldName="field17" ShowInCustomizationForm="True" UnboundType="String"
                                                                        Width="415px" VisibleIndex="13">
                                                                        <CellStyle Wrap="True"></CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="炉况失常处理记录">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="悬料、滑料、崩料，慢、休风">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="事件" FieldName="field18" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="55px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="持续时间" FieldName="field19" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="55px" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="原因和处理" FieldName="field20" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="615px" VisibleIndex="3">
                                                                                <GroupFooterCellStyle Wrap="True">
                                                                                </GroupFooterCellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="" FieldName="" ShowInCustomizationForm="True" UnboundType="String"
                                                                                Width="55px" VisibleIndex="4">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowDragDrop="false" AllowSort="False" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <SettingsResizing ColumnResizeMode="Control" />
                                                    </dx:ASPxGridView>
                                                    <dx:ASPxGridView ID="gridBase3" runat="server" ClientInstanceName="gridBase3" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase3_HtmlRowPrepared" OnHtmlRowCreated="gridBase3_HtmlRowCreated" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True" />
                                                            <AlternatingRow Enabled="true" />
                                                            <Row HorizontalAlign="Center" />
                                                        </Styles>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="field0" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="50px" VisibleIndex="1">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="field1" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="850px" VisibleIndex="2">
                                                                <GroupFooterCellStyle Wrap="True">
                                                                </GroupFooterCellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="field2" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="235px" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="field3" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="1135px" VisibleIndex="4">
                                                                <GroupFooterCellStyle Wrap="True">
                                                                </GroupFooterCellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="" FieldName="" ShowInCustomizationForm="True" UnboundType="String"
                                                                Width="55px" VisibleIndex="4">
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
