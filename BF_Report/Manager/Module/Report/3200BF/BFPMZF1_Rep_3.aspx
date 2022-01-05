<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BFPMZF1_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.BFPMZF1_Rep_3" %>

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
        #cbp_Base_gridBase1_col125 >table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col123 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col127 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col52 >table {
            width:48px !important
        }
        #cbp_Base_gridBase1_col53 >table {
            width:48px !important
        }
        #cbp_Base_gridBase1_col54 >table {
            width:48px !important
        }
        #cbp_Base_gridBase1_col56 > table {
            width:48px !important
        }
        #cbp_Base_gridBase1_col60 > table {
            width:48px !important
        }
        #cbp_Base_gridBase1_col62 >table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col78 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col80 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col82 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col97 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col99 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col101 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col109 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col166 > table {
            width:48px !important;
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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉喷煤1号制粉机日报表
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
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R67-078/0-15-E" Width="100px">
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
                                                            <dx:GridViewBandColumn Caption="设备名称工艺参数" VisibleIndex="0">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="0" SortOrder="Ascending">
                                                                        <PropertiesTextEdit DisplayFormatString="MM-dd HH:mm"></PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>                                                            
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="引风机前轴温" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_GWFJ_ZC1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="引风机后轴温" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_GWFJ_ZC2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="高炉废气温度" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_GWFJ_RK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="高炉废气流量" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m3/h" FieldName="PCI_OS_QT_GLFQ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="循环废气温度" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_YQ1_ZXH" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="循环废气流量" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m3/h" FieldName="PCI_OS_QT_ZXH1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="烟气炉" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="高炉煤气压力" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="KPa" FieldName="PCI_IF_PT_MQ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="高炉煤气流量" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m3/h" FieldName="PCI_OS_QT_MQ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="炉膛温度" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_YQL1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="炉膛负压力" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="Pa" FieldName="PCI_IF_PT_YQL1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="出口温度" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_YQL1_CK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="磨煤机系统" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="密封风压力" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="KPa" FieldName="PCI_OS_PT_MM1_MFF" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="润滑油温A" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_JSJ_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="润滑油温B" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_JSJ_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="润滑油温C" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_JSJ_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="液压油温A" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_YYZ_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="液压油温B" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_YYZ_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="液压压力" VisibleIndex="6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_YYZ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机入口温度" VisibleIndex="7">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_RK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机入口压力" VisibleIndex="8">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="PCI_IF_PT_MM1_RK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机出口温度" VisibleIndex="9">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_CK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机出口压力" VisibleIndex="10">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="PCI_IF_PT_MM1_CK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机压差" VisibleIndex="11">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="Pa" FieldName="PCI_IF_PT_MM1_SUB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器A" VisibleIndex="12">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_FLQ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器B" VisibleIndex="13">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_FLQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器C" VisibleIndex="14">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_FLQ3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器D" VisibleIndex="15">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_FLQ4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器E" VisibleIndex="16">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_FLQ5" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器F" VisibleIndex="17">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_FLQ6" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="减速箱瓦温A" VisibleIndex="18">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_TLW_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="减速箱瓦温B" VisibleIndex="19">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_TLW_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="减速箱瓦温C" VisibleIndex="20">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_TLW_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="减速箱瓦温D" VisibleIndex="21">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_TLW_4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机电流" VisibleIndex="22">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="PCI_IF_IT_MM1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机前轴温" VisibleIndex="23">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_ZC1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机前轴温" VisibleIndex="24">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_ZC2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度U" VisibleIndex="25">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_U" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度V" VisibleIndex="26">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_V" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度W" VisibleIndex="27">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM1_W" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="主排风机" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="排粉分机流量" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m3/h" FieldName="PCI_OS_QT_PFFJ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机电流" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="PCI_IF_IT_PFFJ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="风机前轴温" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ1_LZQ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="风机后轴温" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ1_LZQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机前轴温" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ1_ZC1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机后轴温" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ1_ZC2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度U" VisibleIndex="6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_TT_PFFJ1_U" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度V" VisibleIndex="7">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ1_V" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度W" VisibleIndex="8">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="PCI_IF_TT_PFFJ1_W" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="原煤仓" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="1#仓位" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m" FieldName="PCI_IF_Q_GMJ_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="2#仓位" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m" FieldName="PCI_IF_Q_GMJ_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                                                                                       
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="收粉器" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="收粉器出口温度" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_CCQ1_CK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="脉冲压力" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_CCQ1_PUASE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>  
                                                                    <dx:GridViewBandColumn Caption="除尘器压差" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="Pa" FieldName="PCI_IF_PT_CCQ1_SUB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="大粉仓" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="箱体温度MAX" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_DX_TT_DMFC_MAX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="箱体温度MIN" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_DX_TT_DMFC_MIN" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>  
                                                                    <dx:GridViewBandColumn Caption="大粉仓重量" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="PCI_IF_WT_DMFC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="O2,CO含量" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="磨机进口氧含量" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PCI_IF_AN_MM1_RK_O2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="收粉机出口氧含量" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PCI_IF_AN_SC1_CK_O2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>  
                                                                    <dx:GridViewBandColumn Caption="大粉仓氧含量" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PCI_IF_AN_MFC_O2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="大粉仓CO含量" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="ppm" FieldName="PCI_IF_AN_MFC_CO" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="气源状况" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="压缩空气" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_YSKQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="低压氮气" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_LOW_N2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>  
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="1#喷吹罐" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="温度MAX" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_DX_TT_PCG_1_MAX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}"> 
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="罐压" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_PCG_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="喷吹罐重量" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_W_PCG_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2#喷吹罐" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="温度MAX" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_DX_TT_PCG_2_MAX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="罐压" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_PCG_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="喷吹罐重量" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_W_PCG_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="3#喷吹罐" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="温度MAX" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_DX_TT_PCG_3_MAX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="罐压" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_PCG_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="喷吹罐重量" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_W_PCG_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="喷吹压力" VisibleIndex="14">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="混合器前压力" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_HHQ_Q" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="补气器前压力" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_BQQ_Q" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="补气器后压力" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_BQQ_H_YSKQ" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="分压器前压力" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_GLPM_IF_FPQ_Q_P" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="分压器与高炉压差" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_GLPM_DX_FPQ_GLRF_PT_SUB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="小时喷煤量" VisibleIndex="15">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="大高炉" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="PCI_DX_QT_123G_PCF_LJL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="石灰窑" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="PCI_OS_QT_4G_QSF_LJL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="球团" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="PCI_OS_QT_4G_SMF_LJL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="小时进煤量" VisibleIndex="16">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="烟煤" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="STANDBY1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="无烟煤" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="STANDBY2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="1#比例" VisibleIndex="17">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="无烟煤比例" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="STANDBY4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                                                                                      
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="2#比例" VisibleIndex="18">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="无烟煤比例" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="STANDBY4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>                                                                                                                                      
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_RK" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_GLFQ1" ShowInGroupFooterColumn="PCI_OS_QT_GLFQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQ1_ZXH" ShowInGroupFooterColumn="PCI_IF_TT_YQ1_ZXH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_ZXH1" ShowInGroupFooterColumn="PCI_OS_QT_ZXH1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MQ1" ShowInGroupFooterColumn="PCI_IF_PT_MQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_MQ1" ShowInGroupFooterColumn="PCI_OS_QT_MQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQL1" ShowInGroupFooterColumn="PCI_IF_TT_YQL1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YQL1" ShowInGroupFooterColumn="PCI_IF_PT_YQL1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQL1_CK" ShowInGroupFooterColumn="PCI_IF_TT_YQL1_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_PT_MM1_MFF" ShowInGroupFooterColumn="PCI_OS_PT_MM1_MFF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_JSJ_1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_JSJ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_JSJ_2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_JSJ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_JSJ_3" ShowInGroupFooterColumn="PCI_IF_TT_MM1_JSJ_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_YYZ_1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_YYZ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_YYZ_2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_YYZ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YYZ1" ShowInGroupFooterColumn="PCI_IF_PT_YYZ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_RK" ShowInGroupFooterColumn="PCI_IF_TT_MM1_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM1_RK" ShowInGroupFooterColumn="PCI_IF_PT_MM1_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_CK" ShowInGroupFooterColumn="PCI_IF_TT_MM1_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM1_CK" ShowInGroupFooterColumn="PCI_IF_PT_MM1_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM1_SUB" ShowInGroupFooterColumn="PCI_IF_PT_MM1_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ3" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ4" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ5" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ6" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_TLW_1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_TLW_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_TLW_2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_TLW_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_TLW_3" ShowInGroupFooterColumn="PCI_IF_TT_MM1_TLW_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_TLW_4" ShowInGroupFooterColumn="PCI_IF_TT_MM1_TLW_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_IT_MM1" ShowInGroupFooterColumn="PCI_IF_IT_MM1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_U" ShowInGroupFooterColumn="PCI_IF_TT_MM1_U" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_V" ShowInGroupFooterColumn="PCI_IF_TT_MM1_V" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_W" ShowInGroupFooterColumn="PCI_IF_TT_MM1_W" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_PFFJ1" ShowInGroupFooterColumn="PCI_OS_QT_PFFJ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_IT_PFFJ1" ShowInGroupFooterColumn="PCI_IF_IT_PFFJ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_LZQ1" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_LZQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_LZQ2" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_LZQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_U" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_U" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_V" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_V" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_W" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_W" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_Q_GMJ_1" ShowInGroupFooterColumn="PCI_IF_Q_GMJ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_Q_GMJ_2" ShowInGroupFooterColumn="PCI_IF_Q_GMJ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_CCQ1_CK" ShowInGroupFooterColumn="PCI_IF_TT_CCQ1_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_CCQ1_PUASE" ShowInGroupFooterColumn="PCI_IF_PT_CCQ1_PUASE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_CCQ1_SUB" ShowInGroupFooterColumn="PCI_IF_PT_CCQ1_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_DMFC_MAX" ShowInGroupFooterColumn="PCI_DX_TT_DMFC_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_DMFC_MIN" ShowInGroupFooterColumn="PCI_DX_TT_DMFC_MIN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_WT_DMFC" ShowInGroupFooterColumn="PCI_IF_WT_DMFC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_MM1_RK_O2" ShowInGroupFooterColumn="PCI_IF_AN_MM1_RK_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_SC1_CK_O2" ShowInGroupFooterColumn="PCI_IF_AN_SC1_CK_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_MFC_O2" ShowInGroupFooterColumn="PCI_IF_AN_MFC_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_MFC_CO" ShowInGroupFooterColumn="PCI_IF_AN_MFC_CO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YSKQ" ShowInGroupFooterColumn="PCI_IF_PT_YSKQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_LOW_N2" ShowInGroupFooterColumn="PCI_IF_PT_LOW_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_PCG_1_MAX" ShowInGroupFooterColumn="PCI_DX_TT_PCG_1_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_1" ShowInGroupFooterColumn="PCI_IF_PT_PCG_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_W_PCG_1" ShowInGroupFooterColumn="PCI_IF_W_PCG_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_PCG_2_MAX" ShowInGroupFooterColumn="PCI_DX_TT_PCG_2_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_2" ShowInGroupFooterColumn="PCI_IF_PT_PCG_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_W_PCG_2" ShowInGroupFooterColumn="PCI_IF_W_PCG_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_PCG_3_MAX" ShowInGroupFooterColumn="PCI_DX_TT_PCG_3_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_3" ShowInGroupFooterColumn="PCI_IF_PT_PCG_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_W_PCG_3" ShowInGroupFooterColumn="PCI_IF_W_PCG_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_HHQ_Q" ShowInGroupFooterColumn="PCI_IF_PT_HHQ_Q" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_BQQ_Q" ShowInGroupFooterColumn="PCI_IF_PT_BQQ_Q" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_BQQ_H_YSKQ" ShowInGroupFooterColumn="PCI_IF_PT_BQQ_H_YSKQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_GLPM_IF_FPQ_Q_P" ShowInGroupFooterColumn="PCI_GLPM_IF_FPQ_Q_P" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_GLPM_DX_FPQ_GLRF_PT_SUB" ShowInGroupFooterColumn="PCI_GLPM_DX_FPQ_GLRF_PT_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_QT_123G_PCF_LJL" ShowInGroupFooterColumn="PCI_DX_QT_123G_PCF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_4G_QSF_LJL" ShowInGroupFooterColumn="PCI_OS_QT_4G_QSF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_4G_SMF_LJL" ShowInGroupFooterColumn="PCI_OS_QT_4G_SMF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="STANDBY1" ShowInGroupFooterColumn="STANDBY1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="STANDBY2" ShowInGroupFooterColumn="STANDBY2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="STANDBY3" ShowInGroupFooterColumn="STANDBY3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="STANDBY4" ShowInGroupFooterColumn="STANDBY4" SummaryType="Average" DisplayFormat="{0:0.00}" />


                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_RK" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_GLFQ1" ShowInGroupFooterColumn="PCI_OS_QT_GLFQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQ1_ZXH" ShowInGroupFooterColumn="PCI_IF_TT_YQ1_ZXH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_ZXH1" ShowInGroupFooterColumn="PCI_OS_QT_ZXH1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MQ1" ShowInGroupFooterColumn="PCI_IF_PT_MQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_MQ1" ShowInGroupFooterColumn="PCI_OS_QT_MQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQL1" ShowInGroupFooterColumn="PCI_IF_TT_YQL1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YQL1" ShowInGroupFooterColumn="PCI_IF_PT_YQL1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQL1_CK" ShowInGroupFooterColumn="PCI_IF_TT_YQL1_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_PT_MM1_MFF" ShowInGroupFooterColumn="PCI_OS_PT_MM1_MFF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_JSJ_1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_JSJ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_JSJ_2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_JSJ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_JSJ_3" ShowInGroupFooterColumn="PCI_IF_TT_MM1_JSJ_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_YYZ_1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_YYZ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_YYZ_2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_YYZ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YYZ1" ShowInGroupFooterColumn="PCI_IF_PT_YYZ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_RK" ShowInGroupFooterColumn="PCI_IF_TT_MM1_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM1_RK" ShowInGroupFooterColumn="PCI_IF_PT_MM1_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_CK" ShowInGroupFooterColumn="PCI_IF_TT_MM1_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM1_CK" ShowInGroupFooterColumn="PCI_IF_PT_MM1_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM1_SUB" ShowInGroupFooterColumn="PCI_IF_PT_MM1_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ3" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ4" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ5" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ5" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_FLQ6" ShowInGroupFooterColumn="PCI_IF_TT_MM1_FLQ6" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_TLW_1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_TLW_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_TLW_2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_TLW_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_TLW_3" ShowInGroupFooterColumn="PCI_IF_TT_MM1_TLW_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_TLW_4" ShowInGroupFooterColumn="PCI_IF_TT_MM1_TLW_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_IT_MM1" ShowInGroupFooterColumn="PCI_IF_IT_MM1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_MM1_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_MM1_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_U" ShowInGroupFooterColumn="PCI_IF_TT_MM1_U" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_V" ShowInGroupFooterColumn="PCI_IF_TT_MM1_V" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM1_W" ShowInGroupFooterColumn="PCI_IF_TT_MM1_W" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_PFFJ1" ShowInGroupFooterColumn="PCI_OS_QT_PFFJ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_IT_PFFJ1" ShowInGroupFooterColumn="PCI_IF_IT_PFFJ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_LZQ1" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_LZQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_LZQ2" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_LZQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_U" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_U" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_V" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_V" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ1_W" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ1_W" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_Q_GMJ_1" ShowInGroupFooterColumn="PCI_IF_Q_GMJ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_Q_GMJ_2" ShowInGroupFooterColumn="PCI_IF_Q_GMJ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_CCQ1_CK" ShowInGroupFooterColumn="PCI_IF_TT_CCQ1_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_CCQ1_PUASE" ShowInGroupFooterColumn="PCI_IF_PT_CCQ1_PUASE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_CCQ1_SUB" ShowInGroupFooterColumn="PCI_IF_PT_CCQ1_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_DMFC_MAX" ShowInGroupFooterColumn="PCI_DX_TT_DMFC_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_DMFC_MIN" ShowInGroupFooterColumn="PCI_DX_TT_DMFC_MIN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_WT_DMFC" ShowInGroupFooterColumn="PCI_IF_WT_DMFC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_MM1_RK_O2" ShowInGroupFooterColumn="PCI_IF_AN_MM1_RK_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_SC1_CK_O2" ShowInGroupFooterColumn="PCI_IF_AN_SC1_CK_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_MFC_O2" ShowInGroupFooterColumn="PCI_IF_AN_MFC_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_MFC_CO" ShowInGroupFooterColumn="PCI_IF_AN_MFC_CO" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YSKQ" ShowInGroupFooterColumn="PCI_IF_PT_YSKQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_LOW_N2" ShowInGroupFooterColumn="PCI_IF_PT_LOW_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_PCG_1_MAX" ShowInGroupFooterColumn="PCI_DX_TT_PCG_1_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_1" ShowInGroupFooterColumn="PCI_IF_PT_PCG_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_W_PCG_1" ShowInGroupFooterColumn="PCI_IF_W_PCG_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_PCG_2_MAX" ShowInGroupFooterColumn="PCI_DX_TT_PCG_2_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_2" ShowInGroupFooterColumn="PCI_IF_PT_PCG_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_W_PCG_2" ShowInGroupFooterColumn="PCI_IF_W_PCG_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_TT_PCG_3_MAX" ShowInGroupFooterColumn="PCI_DX_TT_PCG_3_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_3" ShowInGroupFooterColumn="PCI_IF_PT_PCG_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_W_PCG_3" ShowInGroupFooterColumn="PCI_IF_W_PCG_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_HHQ_Q" ShowInGroupFooterColumn="PCI_IF_PT_HHQ_Q" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_BQQ_Q" ShowInGroupFooterColumn="PCI_IF_PT_BQQ_Q" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_BQQ_H_YSKQ" ShowInGroupFooterColumn="PCI_IF_PT_BQQ_H_YSKQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_GLPM_IF_FPQ_Q_P" ShowInGroupFooterColumn="PCI_GLPM_IF_FPQ_Q_P" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_GLPM_DX_FPQ_GLRF_PT_SUB" ShowInGroupFooterColumn="PCI_GLPM_DX_FPQ_GLRF_PT_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_QT_123G_PCF_LJL" ShowInGroupFooterColumn="PCI_DX_QT_123G_PCF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_4G_QSF_LJL" ShowInGroupFooterColumn="PCI_OS_QT_4G_QSF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_4G_SMF_LJL" ShowInGroupFooterColumn="PCI_OS_QT_4G_SMF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="STANDBY1" ShowInGroupFooterColumn="STANDBY1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="STANDBY2" ShowInGroupFooterColumn="STANDBY2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="STANDBY3" ShowInGroupFooterColumn="STANDBY3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="STANDBY4" ShowInGroupFooterColumn="STANDBY4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                        </GroupSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" />
                                                        <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <%-- <SettingsResizing ColumnResizeMode="Control" />--%>
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
