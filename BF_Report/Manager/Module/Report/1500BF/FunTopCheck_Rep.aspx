<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FunTopCheck_Rep.aspx.cs" Inherits="BF_Report.Manager.Module.Report._1500BF.FunTopCheck_Rep" %>

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
                    <td width="100%;" height="30px" align="center" valign="center">2#高炉炉顶检测日报表
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
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                        <dx:ASPxCallbackPanel ID="cbp_Base" runat="server" ClientIDMode="AutoID" Width="100%"
                                            OnCallback="cbp_Base_Callback" ClientInstanceName="cbp_Base">
                                            <PanelCollection>
                                                <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="14px">
                                                        <Styles>
                                                            <Header HorizontalAlign="Center" Wrap="True"/>                                                            
                                                            <AlternatingRow Enabled="true" />
                                                            <Cell HorizontalAlign="Center" Wrap="False" />
                                                            <Footer HorizontalAlign="Center"></Footer>
                                                            <GroupFooter HorizontalAlign="Center"></GroupFooter>
                                                        </Styles>                                                       
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_TIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending" FixedStyle="Left">
                                                                <PropertiesTextEdit DisplayFormatString="HH:mm"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="班别" FieldName="WORK_TEAM" Width="65px" ShowInCustomizationForm="True" UnboundType="String"
                                                                VisibleIndex="2" FixedStyle="Left">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="蓄能器压力" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1#" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A(kPa)" FieldName="PT_XNQ_1A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="B(kPa)" FieldName="PT_XNQ_1B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2#" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A(kPa)" FieldName="PT_XNQ_2A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="B(kPa)" FieldName="PT_XNQ_2B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="齿轮箱温度" VisibleIndex="4" Visible="false" >
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="A" FieldName="TE202A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="B" FieldName="TE202B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="C1" FieldName="TE202C" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="C2" FieldName="TE202D" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <%--<dx:GridViewBandColumn Caption="除尘器" VisibleIndex="5">
                                                                <Columns>--%>
                                                                    <%--<dx:GridViewBandColumn Caption="出口煤气" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量" FieldName="FT1752" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度" FieldName="TE1752" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>--%>
                                                                    <%--<dx:GridViewBandColumn Caption="进口煤气" VisibleIndex="1">
                                                                        <Columns>--%>
                                                                            <dx:GridViewDataTextColumn Caption="除尘器进口煤气流量" FieldName="FT1751" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="75px" VisibleIndex="5">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <%--<dx:GridViewDataTextColumn Caption="温度" FieldName="TE1751" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>--%>
                                                                        <%--</Columns>
                                                                    </dx:GridViewBandColumn>--%>
                                                                    <%--<dx:GridViewBandColumn Caption="管道压力" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="进口" FieldName="PT1752" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="出口" FieldName="PT1753" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>--%>
                                                                <%--</Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <%--<dx:GridViewDataTextColumn Caption="氮气罐压力" FieldName="PT1752" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="氮气总管流量" FieldName="PT1752" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="二次均压氮气管道压力" FieldName="PT1752" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="8">
                                                            </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewBandColumn Caption="阀箱温度" VisibleIndex="9" Visible="false">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1" FieldName="TE201A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2" FieldName="TE201B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <%--<dx:GridViewBandColumn Caption="高炉旋风除尘动力配电箱温度" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1" FieldName="TIAS1902" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2" FieldName="TIAS1903" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="3" FieldName="TIAS1904" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="4" FieldName="TIAS1905" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewDataTextColumn Caption="进氮气罐前氮气管道压力" FieldName="PT1701" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                           <%-- <dx:GridViewBandColumn Caption="进气密箱氮气管道" VisibleIndex="12">
                                                                <Columns>--%>
                                                                    <dx:GridViewDataTextColumn Caption="进气密箱氮气管道压力" FieldName="PT1704" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="12">
                                                                    </dx:GridViewDataTextColumn>
                                                                   <%-- <dx:GridViewDataTextColumn Caption="流量" FieldName="FT1704" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                <%--</Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="均压管道" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE1707" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度B" FieldName="TE1705B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="压力A" FieldName="PT1705A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <%--<dx:GridViewDataTextColumn Caption="新增料罐压力" FieldName="PT1705B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="14">
                                                            </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewBandColumn Caption="均压用" VisibleIndex="15">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="氮气总管" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量" FieldName="FT1703" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="煤气管" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="流量" FieldName="FT1707" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="75px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="温度" FieldName="PT1707" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="冷却水进水管道压力" FieldName="PT1711" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="16">
                                                            </dx:GridViewDataTextColumn>
                                                            <%--<dx:GridViewBandColumn Caption="料罐" VisibleIndex="17">
                                                                <Columns>--%>
                                                                    <dx:GridViewDataTextColumn Caption="料罐称重" FieldName="WIT1701" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="17">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <%--<dx:GridViewDataTextColumn Caption="料位" FieldName="LT1703" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                <%--</Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="溜槽倾动电机温度" VisibleIndex="18" Visible="false">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1" FieldName="TE_LCQD_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2" FieldName="TE_LCQD_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="3" FieldName="TE_LCQD_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="溜槽旋转电机温度" VisibleIndex="19" Visible="false">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1" FieldName="TE_LCXZ_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2" FieldName="TE_LCXZ_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="3" FieldName="TE_LCXZ_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="炉顶蒸汽管道温度" FieldName="TE1706" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="20">
                                                            </dx:GridViewDataTextColumn>
                                                            <%--<dx:GridViewDataTextColumn Caption="煤气下降管温度" FieldName="TE1901" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="21">
                                                            </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewBandColumn Caption="气密箱冷却水" VisibleIndex="22">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="回水管温度" FieldName="TE1712" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="进水管流量" FieldName="FT1711" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="进水管温度" FieldName="TE1711" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="前氮气管道阀位反馈" FieldName="PV1704" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="受料罐料位" FieldName="LT1702" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="70px" VisibleIndex="23">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="上密阀温度" VisibleIndex="24" Visible="false">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1" FieldName="TE108A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2" FieldName="TE108B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                           <%-- <dx:GridViewBandColumn Caption="下密阀" VisibleIndex="25">
                                                                <Columns>--%>
                                                                    <dx:GridViewDataTextColumn Caption="下密阀温度" FieldName="TE110A" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="25">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <%--<dx:GridViewDataTextColumn Caption="2" FieldName="TE110B" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2" Visible="false">
                                                                    </dx:GridViewDataTextColumn>--%>
                                                                <%--</Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="液压站" VisibleIndex="26">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="油位" FieldName="LT_YYZ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度" FieldName="TE_YYZ_OIL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="油站压力" VisibleIndex="27">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="P1口" FieldName="PT_YZ_P1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="P2口" FieldName="PT_YZ_P2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <%--<dx:GridViewDataTextColumn Caption="蒸汽管道压力" FieldName="PT1706" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                Width="65px" VisibleIndex="28">
                                                            </dx:GridViewDataTextColumn>--%>
                                                            <%--<dx:GridViewBandColumn Caption="中间灰罐" VisibleIndex="29">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="A" FieldName="WIT1906" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="B" FieldName="WIT1907" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="65px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>--%>
                                                            <dx:GridViewBandColumn Caption="炉顶煤气" VisibleIndex="30">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="H2" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_H2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="N2" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_N2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="CO" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_CO" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="CO2" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_CO2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <%--<dx:GridViewBandColumn Caption="CH4" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PER_CH4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>--%>
                                                                    <dx:GridViewBandColumn Caption="煤气利用率" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="GAS_UE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="" VisibleIndex="1"><%-- 界面显示需要，绑定空字段--%>
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="1">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="PT_XNQ_1A" ShowInGroupFooterColumn="PT_XNQ_1A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_XNQ_1B" ShowInGroupFooterColumn="PT_XNQ_1B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_XNQ_2A" ShowInGroupFooterColumn="PT_XNQ_2A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_XNQ_2B" ShowInGroupFooterColumn="PT_XNQ_2B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE202A" ShowInGroupFooterColumn="TE202A" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE202B" ShowInGroupFooterColumn="TE202B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE202C" ShowInGroupFooterColumn="TE202C" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE202D" ShowInGroupFooterColumn="TE202D" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1752" ShowInGroupFooterColumn="FT1752" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1751" ShowInGroupFooterColumn="FT1751" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1751" ShowInGroupFooterColumn="TE1751" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1752" ShowInGroupFooterColumn="TE1752" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1751" ShowInGroupFooterColumn="PT1751" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1752" ShowInGroupFooterColumn="PT1752" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1702" ShowInGroupFooterColumn="PT1702" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1701" ShowInGroupFooterColumn="FT1701" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1703" ShowInGroupFooterColumn="PT1703" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE201A" ShowInGroupFooterColumn="TE201A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE201B" ShowInGroupFooterColumn="TE201B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TIAS1902" ShowInGroupFooterColumn="TIAS1902" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TIAS1903" ShowInGroupFooterColumn="TIAS1903" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TIAS1904" ShowInGroupFooterColumn="TIAS1904" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TIAS1905" ShowInGroupFooterColumn="TIAS1905" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1701" ShowInGroupFooterColumn="PT1701" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1704" ShowInGroupFooterColumn="PT1704" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1704" ShowInGroupFooterColumn="FT1704" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PV1703" ShowInGroupFooterColumn="PV1703" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1707" ShowInGroupFooterColumn="TE1707" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1705B" ShowInGroupFooterColumn="TE1705B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1705A" ShowInGroupFooterColumn="PT1705A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1705B" ShowInGroupFooterColumn="PT1705B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1703" ShowInGroupFooterColumn="FT1703" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1707" ShowInGroupFooterColumn="FT1707" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1707" ShowInGroupFooterColumn="PT1707" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1711" ShowInGroupFooterColumn="PT1711" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="WIT1701" ShowInGroupFooterColumn="WIT1701" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT1703" ShowInGroupFooterColumn="LT1703" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1753" ShowInGroupFooterColumn="PT1753" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCQD_1" ShowInGroupFooterColumn="TE_LCQD_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCQD_2" ShowInGroupFooterColumn="TE_LCQD_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCQD_3" ShowInGroupFooterColumn="TE_LCQD_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCXZ_1" ShowInGroupFooterColumn="TE_LCXZ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCXZ_2" ShowInGroupFooterColumn="TE_LCXZ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCXZ_3" ShowInGroupFooterColumn="TE_LCXZ_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1706" ShowInGroupFooterColumn="TE1706" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1901" ShowInGroupFooterColumn="TE1901" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1712" ShowInGroupFooterColumn="TE1712" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1711" ShowInGroupFooterColumn="FT1711" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1711" ShowInGroupFooterColumn="TE1711" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PV1704" ShowInGroupFooterColumn="PV1704" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE108A" ShowInGroupFooterColumn="TE108A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE108B" ShowInGroupFooterColumn="TE108B" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT1702" ShowInGroupFooterColumn="LT1702" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE110A" ShowInGroupFooterColumn="TE110A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE110B" ShowInGroupFooterColumn="TE110B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_YYZ" ShowInGroupFooterColumn="LT_YYZ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_YYZ_OIL" ShowInGroupFooterColumn="TE_YYZ_OIL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_YZ_P1" ShowInGroupFooterColumn="PT_YZ_P1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_YZ_P2" ShowInGroupFooterColumn="PT_YZ_P2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1706" ShowInGroupFooterColumn="PT1706" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WIT1906" ShowInGroupFooterColumn="WIT1906" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WIT1907" ShowInGroupFooterColumn="WIT1907" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_H2" ShowInGroupFooterColumn="PER_H2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_N2" ShowInGroupFooterColumn="PER_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO" ShowInGroupFooterColumn="PER_CO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO2" ShowInGroupFooterColumn="PER_CO2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CH4" ShowInGroupFooterColumn="PER_CH4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GAS_UE" ShowInGroupFooterColumn="GAS_UE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_TIME" ShowInGroupFooterColumn="RECORD_TIME" SummaryType="Count" DisplayFormat="合计{0:0}条" />
                                                            <dx:ASPxSummaryItem FieldName="PT_XNQ_1A" ShowInGroupFooterColumn="PT_XNQ_1A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_XNQ_1B" ShowInGroupFooterColumn="PT_XNQ_1B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_XNQ_2A" ShowInGroupFooterColumn="PT_XNQ_2A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_XNQ_2B" ShowInGroupFooterColumn="PT_XNQ_2B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE202A" ShowInGroupFooterColumn="TE202A" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE202B" ShowInGroupFooterColumn="TE202B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE202C" ShowInGroupFooterColumn="TE202C" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE202D" ShowInGroupFooterColumn="TE202D" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1752" ShowInGroupFooterColumn="FT1752" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1751" ShowInGroupFooterColumn="FT1751" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1751" ShowInGroupFooterColumn="TE1751" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1752" ShowInGroupFooterColumn="TE1752" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1751" ShowInGroupFooterColumn="PT1751" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1752" ShowInGroupFooterColumn="PT1752" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1702" ShowInGroupFooterColumn="PT1702" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1701" ShowInGroupFooterColumn="FT1701" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1703" ShowInGroupFooterColumn="PT1703" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE201A" ShowInGroupFooterColumn="TE201A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE201B" ShowInGroupFooterColumn="TE201B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TIAS1902" ShowInGroupFooterColumn="TIAS1902" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TIAS1903" ShowInGroupFooterColumn="TIAS1903" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TIAS1904" ShowInGroupFooterColumn="TIAS1904" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TIAS1905" ShowInGroupFooterColumn="TIAS1905" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1701" ShowInGroupFooterColumn="PT1701" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1704" ShowInGroupFooterColumn="PT1704" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1704" ShowInGroupFooterColumn="FT1704" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PV1703" ShowInGroupFooterColumn="PV1703" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1707" ShowInGroupFooterColumn="TE1707" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1705B" ShowInGroupFooterColumn="TE1705B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1705A" ShowInGroupFooterColumn="PT1705A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1705B" ShowInGroupFooterColumn="PT1705B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1703" ShowInGroupFooterColumn="FT1703" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1707" ShowInGroupFooterColumn="FT1707" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1707" ShowInGroupFooterColumn="PT1707" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1711" ShowInGroupFooterColumn="PT1711" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="WIT1701" ShowInGroupFooterColumn="WIT1701" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT1703" ShowInGroupFooterColumn="LT1703" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1753" ShowInGroupFooterColumn="PT1753" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCQD_1" ShowInGroupFooterColumn="TE_LCQD_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCQD_2" ShowInGroupFooterColumn="TE_LCQD_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCQD_3" ShowInGroupFooterColumn="TE_LCQD_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCXZ_1" ShowInGroupFooterColumn="TE_LCXZ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCXZ_2" ShowInGroupFooterColumn="TE_LCXZ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_LCXZ_3" ShowInGroupFooterColumn="TE_LCXZ_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1706" ShowInGroupFooterColumn="TE1706" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1901" ShowInGroupFooterColumn="TE1901" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1712" ShowInGroupFooterColumn="TE1712" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="FT1711" ShowInGroupFooterColumn="FT1711" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE1711" ShowInGroupFooterColumn="TE1711" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PV1704" ShowInGroupFooterColumn="PV1704" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE108A" ShowInGroupFooterColumn="TE108A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE108B" ShowInGroupFooterColumn="TE108B" SummaryType="Average" DisplayFormat="{0:00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT1702" ShowInGroupFooterColumn="LT1702" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE110A" ShowInGroupFooterColumn="TE110A" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE110B" ShowInGroupFooterColumn="TE110B" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="LT_YYZ" ShowInGroupFooterColumn="LT_YYZ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="TE_YYZ_OIL" ShowInGroupFooterColumn="TE_YYZ_OIL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_YZ_P1" ShowInGroupFooterColumn="PT_YZ_P1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT_YZ_P2" ShowInGroupFooterColumn="PT_YZ_P2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PT1706" ShowInGroupFooterColumn="PT1706" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WIT1906" ShowInGroupFooterColumn="WIT1906" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="WIT1907" ShowInGroupFooterColumn="WIT1907" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_H2" ShowInGroupFooterColumn="PER_H2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_N2" ShowInGroupFooterColumn="PER_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO" ShowInGroupFooterColumn="PER_CO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CO2" ShowInGroupFooterColumn="PER_CO2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PER_CH4" ShowInGroupFooterColumn="PER_CH4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="GAS_UE" ShowInGroupFooterColumn="GAS_UE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords"/>
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
