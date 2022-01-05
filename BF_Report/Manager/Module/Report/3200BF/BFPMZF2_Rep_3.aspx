<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BFPMZF2_Rep_3.aspx.cs" Inherits="BF_Report.Manager.Module.Report._3200BF.BFPMZF2_Rep_3" %>

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
        #cbp_Base_gridBase1_col1 >table {
            width:118px !important;
        }
        #cbp_Base_gridBase1_col78 >table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col28 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col58 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col54 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col56 > table {
            width:48px !important;
        }
         #cbp_Base_gridBase1_col160 > table {
            width:48px !important;
        }
         #cbp_Base_gridBase1_col74 > table {
            width:48px !important;
        }
          #cbp_Base_gridBase1_col76 > table {
            width:48px !important;
        }
            #cbp_Base_gridBase1_col93 > table {
            width:48px !important;
        }
            #cbp_Base_gridBase1_col95 > table {
            width:48px !important;
        }
        #cbp_Base_gridBase1_col97 > table {
            width:48px !important;
        }
            #cbp_Base_gridBase1_col105 > table {
            width:48px !important;
        }
            #cbp_Base_gridBase1_col119 > table {
            width:48px !important;
        }
             #cbp_Base_gridBase1_col121 > table {
            width:48px !important;
        }
             #cbp_Base_gridBase1_col141 > table {
            width:48px !important;
        }
             #cbp_Base_gridBase1_col143 > table {
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
                    <td width="100%;" height="30px" align="center" valign="center">3#高炉喷煤2号制粉机日报表
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
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="R67-077/0-15-E" Width="100px">
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
                                                            <dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" Width="45px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="设备名称工艺参数" VisibleIndex="1">
                                                                <Columns>
                                                                   <dx:GridViewDataTextColumn Caption="时间" FieldName="GETTIME" Width="65px" ShowInCustomizationForm="false" UnboundType="String"
                                                                        VisibleIndex="0" SortOrder="Ascending">
                                                                        <PropertiesTextEdit DisplayFormatString="MM-dd HH:mm"></PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn> 
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
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
                                                                            <dx:GridViewDataTextColumn Caption="m3/h" FieldName="PCI_OS_QT_GLFQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="循环废气温度" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_YQ2_ZXH" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="循环废气流量" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m3/h" FieldName="PCI_IF_QT_ZXH2" ShowInCustomizationForm="True" UnboundType="Decimal"
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
                                                                            <dx:GridViewDataTextColumn Caption="KPa" FieldName="PCI_IF_PT_MQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="高炉煤气流量" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m3/h" FieldName="PCI_IF_QT_MQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="炉膛温度" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_YQL2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="炉膛负压力" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="Pa" FieldName="PCI_IF_PT_YQL2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="出口温度" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_YQL2_CK" ShowInCustomizationForm="True" UnboundType="Decimal"
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
                                                                            <dx:GridViewDataTextColumn Caption="KPa" FieldName="PCI_OS_PT_MM2_MFF" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="润滑油温A" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_MOGUN1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="润滑油温B" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_MOGUN2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="润滑油温C" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_MOGUN3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="润滑压力" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_PT_RHZ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="液压油温A" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_YYZ_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="液压油温B" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_YYZ_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="液压压力" VisibleIndex="6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_YYZ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机入口温度" VisibleIndex="7">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_RK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机入口压力" VisibleIndex="8">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="PCI_IF_PT_MM2_RK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机出口温度" VisibleIndex="9">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_CK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机出口压力" VisibleIndex="10">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="PCI_IF_PT_MM2_CK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="磨机压差" VisibleIndex="11">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="Pa" FieldName="PCI_OS_PT_MM2_SUB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器A" VisibleIndex="12">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_FLQ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器B" VisibleIndex="13">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_FLQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="中速磨分离器C" VisibleIndex="14">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_FLQ3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="减速箱瓦温A" VisibleIndex="18">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_TLW_1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="减速箱瓦温B" VisibleIndex="19">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_TLW_2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="减速箱瓦温C" VisibleIndex="20">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_TLW_3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="减速箱瓦温D" VisibleIndex="21">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_TLW_4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机电流" VisibleIndex="22">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="PCI_IF_IT_MM2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机前轴温" VisibleIndex="23">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_ZC1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机前轴温" VisibleIndex="24">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_ZC2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度U" VisibleIndex="25">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_U" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度V" VisibleIndex="26">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_V" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度W" VisibleIndex="27">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_MM2_W" ShowInCustomizationForm="True" UnboundType="Decimal"
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
                                                                            <dx:GridViewDataTextColumn Caption="m3/h" FieldName="PCI_IF_QT_PFFJ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机电流" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="A" FieldName="PCI_IF_IT_PFFJ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="风机前轴温" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ2_LZQ1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="风机后轴温" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ2_LZQ2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机前轴温" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ2_ZC1" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机后轴温" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ2_ZC2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度U" VisibleIndex="6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_TT_PFFJ2_U" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度V" VisibleIndex="7">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PFFJ2_V" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="电机绕阻温度W" VisibleIndex="8">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="kPa" FieldName="PCI_IF_TT_PFFJ2_W" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="原煤仓" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="3#仓位" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m" FieldName="PCI_IF_LT_YMC3" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="4#仓位" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="m" FieldName="PCI_IF_LT_YMC4" ShowInCustomizationForm="True" UnboundType="Decimal"
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
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_CCQ2_CK" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="脉冲压力" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_CCQ2_PUASE" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>  
                                                                    <dx:GridViewBandColumn Caption="除尘器压差" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="Pa" FieldName="PCI_DX_SC2_P_SUB" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="小粉仓" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="箱体温度MAX" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_XMFC_MAX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="箱体温度MIN" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_XMFC_MIN" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>  
                                                                    <dx:GridViewBandColumn Caption="小粉仓重量" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="PCI_IF_WT_XMFC" ShowInCustomizationForm="True" UnboundType="Decimal"
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
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PCI_IF_AN_MM2_RK_O2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="收粉机出口氧含量" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PCI_IF_AN_SC2_CK_O2" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>  
                                                                    <dx:GridViewBandColumn Caption="小粉仓氧含量" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="PCI_OS_AN_O2_XMFC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="小粉仓CO含量" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="ppm" FieldName="PCI_OS_AN_CO_XMFC" ShowInCustomizationForm="True" UnboundType="Decimal"
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
                                                            <dx:GridViewBandColumn Caption="喷吹罐" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewBandColumn Caption="温度MAX" VisibleIndex="0">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="℃" FieldName="PCI_IF_TT_PCG_MAX" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}"> 
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="罐压" VisibleIndex="1">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_PCG_4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="喷吹压力" VisibleIndex="2">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="MPa" FieldName="PCI_IF_PT_PCG_4_PC" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="重量" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="PCI_IF_W_PCG_4" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="石灰小时输送量" VisibleIndex="4">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="PCI_OS_QT_4G_QSF_LJL" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                                Width="65px" VisibleIndex="0" PropertiesTextEdit-DisplayFormatString="{0:0.00}">
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="球团小时输送量" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="t" FieldName="PCI_OS_QT_4G_SMF_LJL" ShowInCustomizationForm="True" UnboundType="Decimal"
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
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_GLFQ2" ShowInGroupFooterColumn="PCI_OS_QT_GLFQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQ2_ZXH" ShowInGroupFooterColumn="PCI_IF_TT_YQ2_ZXH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_ZXH2" ShowInGroupFooterColumn="PCI_OS_QT_ZXH2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_QT_ZXH2" ShowInGroupFooterColumn="PCI_IF_QT_ZXH2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MQ2" ShowInGroupFooterColumn="PCI_IF_PT_MQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_QT_MQ2" ShowInGroupFooterColumn="PCI_IF_QT_MQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_MQ2" ShowInGroupFooterColumn="PCI_OS_QT_MQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQL2" ShowInGroupFooterColumn="PCI_IF_TT_YQL2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YQL2" ShowInGroupFooterColumn="PCI_IF_PT_YQL2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQL2_CK" ShowInGroupFooterColumn="PCI_IF_TT_YQL2_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_PT_MM2_MFF" ShowInGroupFooterColumn="PCI_OS_PT_MM2_MFF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_MOGUN1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_MOGUN1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_MOGUN2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_MOGUN2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_MOGUN3" ShowInGroupFooterColumn="PCI_IF_TT_MM2_MOGUN3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_RHZ2" ShowInGroupFooterColumn="PCI_IF_PT_RHZ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_YYZ_1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_YYZ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_YYZ_2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_YYZ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YYZ2" ShowInGroupFooterColumn="PCI_IF_PT_YYZ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_RK" ShowInGroupFooterColumn="PCI_IF_TT_MM2_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM2_RK" ShowInGroupFooterColumn="PCI_IF_PT_MM2_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_CK" ShowInGroupFooterColumn="PCI_IF_TT_MM2_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM2_CK" ShowInGroupFooterColumn="PCI_IF_PT_MM2_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM2_SUB" ShowInGroupFooterColumn="PCI_IF_PT_MM2_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_FLQ1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_FLQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_FLQ2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_FLQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_FLQ3" ShowInGroupFooterColumn="PCI_IF_TT_MM2_FLQ3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_TLW_1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_TLW_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_TLW_2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_TLW_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_TLW_3" ShowInGroupFooterColumn="PCI_IF_TT_MM2_TLW_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_TLW_4" ShowInGroupFooterColumn="PCI_IF_TT_MM2_TLW_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_IT_MM2" ShowInGroupFooterColumn="PCI_IF_IT_MM2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_U" ShowInGroupFooterColumn="PCI_IF_TT_MM2_U" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_V" ShowInGroupFooterColumn="PCI_IF_TT_MM2_V" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_W" ShowInGroupFooterColumn="PCI_IF_TT_MM2_W" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_PFFJ2" ShowInGroupFooterColumn="PCI_OS_QT_PFFJ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_IT_PFFJ2" ShowInGroupFooterColumn="PCI_IF_IT_PFFJ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_LZQ1" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_LZQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_LZQ2" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_LZQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_U" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_U" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_V" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_V" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_W" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_W" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_LT_YMC3" ShowInGroupFooterColumn="PCI_IF_LT_YMC3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_LT_YMC4" ShowInGroupFooterColumn="PCI_IF_LT_YMC4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_CCQ2_CK" ShowInGroupFooterColumn="PCI_IF_TT_CCQ2_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_CCQ2_PUASE" ShowInGroupFooterColumn="PCI_IF_PT_CCQ2_PUASE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_SC2_P_SUB" ShowInGroupFooterColumn="PCI_DX_SC2_P_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_XMFC_MAX" ShowInGroupFooterColumn="PCI_IF_TT_XMFC_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_XMFC_MIN" ShowInGroupFooterColumn="PCI_IF_TT_XMFC_MIN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_WT_XMFC" ShowInGroupFooterColumn="PCI_IF_WT_XMFC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_MM2_RK_O2" ShowInGroupFooterColumn="PCI_IF_AN_MM2_RK_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_SC2_CK_O2" ShowInGroupFooterColumn="PCI_IF_AN_SC2_CK_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_AN_O2_XMFC" ShowInGroupFooterColumn="PCI_OS_AN_O2_XMFC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_AN_CO_XMFC" ShowInGroupFooterColumn="PCI_OS_AN_CO_XMFC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YSKQ" ShowInGroupFooterColumn="PCI_IF_PT_YSKQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_LOW_N2" ShowInGroupFooterColumn="PCI_IF_PT_LOW_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PCG_MAX" ShowInGroupFooterColumn="PCI_IF_TT_PCG_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_4" ShowInGroupFooterColumn="PCI_IF_PT_PCG_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_4_PC" ShowInGroupFooterColumn="PCI_IF_PT_PCG_4_PC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_W_PCG_4" ShowInGroupFooterColumn="PCI_IF_W_PCG_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_4G_QSF_LJL" ShowInGroupFooterColumn="PCI_OS_QT_4G_QSF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_4G_SMF_LJL" ShowInGroupFooterColumn="PCI_OS_QT_4G_SMF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_PT_MM2_SUB" ShowInGroupFooterColumn="PCI_OS_PT_MM2_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_QT_PFFJ2" ShowInGroupFooterColumn="PCI_IF_QT_PFFJ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            
                                                        </TotalSummary>
                                                        <GroupSummary>
                                                            <dx:ASPxSummaryItem FieldName="GETTIME" ShowInGroupFooterColumn="GETTIME" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_GWFJ_RK" ShowInGroupFooterColumn="PCI_IF_TT_GWFJ_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_GLFQ2" ShowInGroupFooterColumn="PCI_OS_QT_GLFQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQ2_ZXH" ShowInGroupFooterColumn="PCI_IF_TT_YQ2_ZXH" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_ZXH2" ShowInGroupFooterColumn="PCI_OS_QT_ZXH2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_QT_ZXH2" ShowInGroupFooterColumn="PCI_IF_QT_ZXH2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MQ2" ShowInGroupFooterColumn="PCI_IF_PT_MQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_QT_MQ2" ShowInGroupFooterColumn="PCI_IF_QT_MQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_MQ2" ShowInGroupFooterColumn="PCI_OS_QT_MQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQL2" ShowInGroupFooterColumn="PCI_IF_TT_YQL2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YQL2" ShowInGroupFooterColumn="PCI_IF_PT_YQL2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_YQL2_CK" ShowInGroupFooterColumn="PCI_IF_TT_YQL2_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_PT_MM2_MFF" ShowInGroupFooterColumn="PCI_OS_PT_MM2_MFF" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_MOGUN1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_MOGUN1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_MOGUN2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_MOGUN2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_MOGUN3" ShowInGroupFooterColumn="PCI_IF_TT_MM2_MOGUN3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_RHZ2" ShowInGroupFooterColumn="PCI_IF_PT_RHZ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_YYZ_1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_YYZ_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_YYZ_2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_YYZ_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YYZ2" ShowInGroupFooterColumn="PCI_IF_PT_YYZ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_RK" ShowInGroupFooterColumn="PCI_IF_TT_MM2_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM2_RK" ShowInGroupFooterColumn="PCI_IF_PT_MM2_RK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_CK" ShowInGroupFooterColumn="PCI_IF_TT_MM2_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM2_CK" ShowInGroupFooterColumn="PCI_IF_PT_MM2_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_MM2_SUB" ShowInGroupFooterColumn="PCI_IF_PT_MM2_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_FLQ1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_FLQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_FLQ2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_FLQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_FLQ3" ShowInGroupFooterColumn="PCI_IF_TT_MM2_FLQ3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_TLW_1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_TLW_1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_TLW_2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_TLW_2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_TLW_3" ShowInGroupFooterColumn="PCI_IF_TT_MM2_TLW_3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_TLW_4" ShowInGroupFooterColumn="PCI_IF_TT_MM2_TLW_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_IT_MM2" ShowInGroupFooterColumn="PCI_IF_IT_MM2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_MM2_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_MM2_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_U" ShowInGroupFooterColumn="PCI_IF_TT_MM2_U" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_V" ShowInGroupFooterColumn="PCI_IF_TT_MM2_V" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_MM2_W" ShowInGroupFooterColumn="PCI_IF_TT_MM2_W" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_PFFJ2" ShowInGroupFooterColumn="PCI_OS_QT_PFFJ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_IT_PFFJ2" ShowInGroupFooterColumn="PCI_IF_IT_PFFJ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_LZQ1" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_LZQ1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_LZQ2" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_LZQ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_ZC1" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_ZC1" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_ZC2" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_ZC2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_U" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_U" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_V" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_V" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PFFJ2_W" ShowInGroupFooterColumn="PCI_IF_TT_PFFJ2_W" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_LT_YMC3" ShowInGroupFooterColumn="PCI_IF_LT_YMC3" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_LT_YMC4" ShowInGroupFooterColumn="PCI_IF_LT_YMC4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_CCQ2_CK" ShowInGroupFooterColumn="PCI_IF_TT_CCQ2_CK" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_CCQ2_PUASE" ShowInGroupFooterColumn="PCI_IF_PT_CCQ2_PUASE" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_DX_SC2_P_SUB" ShowInGroupFooterColumn="PCI_DX_SC2_P_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_XMFC_MAX" ShowInGroupFooterColumn="PCI_IF_TT_XMFC_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_XMFC_MIN" ShowInGroupFooterColumn="PCI_IF_TT_XMFC_MIN" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_WT_XMFC" ShowInGroupFooterColumn="PCI_IF_WT_XMFC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_MM2_RK_O2" ShowInGroupFooterColumn="PCI_IF_AN_MM2_RK_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_AN_SC2_CK_O2" ShowInGroupFooterColumn="PCI_IF_AN_SC2_CK_O2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_AN_O2_XMFC" ShowInGroupFooterColumn="PCI_OS_AN_O2_XMFC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_AN_CO_XMFC" ShowInGroupFooterColumn="PCI_OS_AN_CO_XMFC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_YSKQ" ShowInGroupFooterColumn="PCI_IF_PT_YSKQ" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_LOW_N2" ShowInGroupFooterColumn="PCI_IF_PT_LOW_N2" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_TT_PCG_MAX" ShowInGroupFooterColumn="PCI_IF_TT_PCG_MAX" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_4" ShowInGroupFooterColumn="PCI_IF_PT_PCG_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_PT_PCG_4_PC" ShowInGroupFooterColumn="PCI_IF_PT_PCG_4_PC" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_W_PCG_4" ShowInGroupFooterColumn="PCI_IF_W_PCG_4" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_4G_QSF_LJL" ShowInGroupFooterColumn="PCI_OS_QT_4G_QSF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_QT_4G_SMF_LJL" ShowInGroupFooterColumn="PCI_OS_QT_4G_SMF_LJL" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_OS_PT_MM2_SUB" ShowInGroupFooterColumn="PCI_OS_PT_MM2_SUB" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            <dx:ASPxSummaryItem FieldName="PCI_IF_QT_PFFJ2" ShowInGroupFooterColumn="PCI_IF_QT_PFFJ2" SummaryType="Average" DisplayFormat="{0:0.00}" />
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
