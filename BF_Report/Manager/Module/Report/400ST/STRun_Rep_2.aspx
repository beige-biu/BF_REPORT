<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STRun_Rep_2.aspx.cs" Inherits="BF_Report.Manager.Module.Report._400ST.STRun_Rep_2" %>

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
        #cbp_Base_gridBase1_col67 > table {
        width:160px !important;
        }
        #cbp_Base_gridBase1_col11 > table {
        width:62px !important;
        }
        #cbp_Base_gridBase1_col64 > table {
        width:62px !important;
        }
        #cbp_Base_gridBase1_col51 >table {
            width:146px !important;
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
                    <td width="100%;" height="30px" align="center" valign="center">
                        400烧结操作日志
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
                                                            <dx:GridViewDataTextColumn Caption="时间" FieldName="RECORD_DATE" Width="175px" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="0" SortOrder="Ascending">
                                                                <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd HH:mm:ss" ></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <%--<dx:GridViewDataTextColumn Caption="班次" FieldName="WORK_SHIFT" GroupIndex="0" ShowInCustomizationForm="false" UnboundType="String"
                                                                VisibleIndex="1" SortOrder="Descending">
                                                                <HeaderStyle Wrap="False" />
                                                            </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewBandColumn Caption="烧结机台车" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="料厚A(mm)" FieldName="P3AI_401071F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="料厚B(mm)" FieldName="P3AI_401081F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="料厚C(mm)" FieldName="P3AI_401091F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="料厚D(mm)" FieldName="P3AI_401101F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="3">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="料厚E(mm)" FieldName="P3AI_401111F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="4">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="料厚F(mm)" FieldName="P3AI_401121F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="5">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="料厚G(mm)" FieldName="P3AI_401131F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="6">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="速度A(m/min)" FieldName="P3AI_401761F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="7">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="速度B(m/min)" FieldName="P3AI_401771F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="8">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="烧结机频率(Hz)" FieldName="P3AI_401331F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="9">
                                                                    </dx:GridViewDataTextColumn>
                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="环冷机电机转速" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1#转速(r/min)" FieldName="P3AI_402331F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2#转速(r/min)" FieldName="P3AI_402341F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="烧结点火炉" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="炉膛压力(pa)" FieldName="P3AI_401361F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="煤气热值(kcal/m³)" FieldName="P3AI_401301F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用煤气" VisibleIndex="5">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力(kpa)" FieldName="P3AI_401011F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量(m³/h)" FieldName="P3AI_401041F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用空气" VisibleIndex="6">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力(kpa)" FieldName="P3AI_401021F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量(m³/h)" FieldName="P3AI_401051F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="高炉煤气" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力(kpa)" FieldName="PLCNYAI_406002F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量(m³/h)" FieldName="PLCNYAI_406004F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="PLCNYAI_406000F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="净化压缩空气" VisibleIndex="8">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力(kpa)" FieldName="PLCNYAI_406042F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量(m³/h)" FieldName="PLCNYAI_406044F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="PLCNYAI_406040F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="普通压缩空气" VisibleIndex="9">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力(kpa)" FieldName="PLCNYAI_406032F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量(m³/h)" FieldName="PLCNYAI_406034F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="PLCNYAI_406030F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="氮气" VisibleIndex="10">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力(kpa)" FieldName="PLCNYAI_406012F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量(m³/h)" FieldName="PLCNYAI_406014F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="PLCNYAI_406010F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="天然气" VisibleIndex="11">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力(kpa)" FieldName="PLCNYAI_406052F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量(m³/h)" FieldName="PLCNYAI_406054F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="PLCNYAI_406050F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="蒸汽" VisibleIndex="12">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="压力(kpa)" FieldName="PLCNYAI_406022F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="流量(m³/h)" FieldName="PLCNYAI_406024F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="PLCNYAI_406020F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="环境CO" VisibleIndex="13">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="浓度A(ppm)" FieldName="P3AI_401161F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="浓度B(ppm)" FieldName="P3AI_401171F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="环冷机风罩内废气温度" VisibleIndex="14">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="1#温度(℃)" FieldName="P3AI_402921F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="2#温度(℃)" FieldName="P3AI_402931F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火炉膛温度" VisibleIndex="15">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度A(℃)" FieldName="P3AI_402941F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度B(℃)" FieldName="P3AI_402951F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="温度C(℃)" FieldName="P3AI_402961F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>  
                                                            <dx:GridViewBandColumn Caption="烟道废气温度" VisibleIndex="16">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="左侧温度(℃)" FieldName="P3AI_400011F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="右侧温度(℃)" FieldName="P3AI_400021F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="点火用" VisibleIndex="17">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="空气温度(℃)" FieldName="P3AI_400051F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="煤气温度(℃)" FieldName="P3AI_401291F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="天然气温度(℃)" FieldName="P3AI_400061F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn> 
                                                            <dx:GridViewBandColumn Caption="混合料" VisibleIndex="18">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="温度(℃)" FieldName="P3AI_400521F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>                                                                    
                                                                </Columns>
                                                            </dx:GridViewBandColumn> 
                                                            <dx:GridViewBandColumn Caption="环冷机烧结矿冷却温度" VisibleIndex="19">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="前温度(℃)" FieldName="P3AI_400531F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="0">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="后温度(℃)" FieldName="P3AI_401791F" ShowInCustomizationForm="True" UnboundType="Decimal"
                                                                        Width="70px" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn> 

                                                                    
                                                        </Columns>
                                                       
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem FieldName="RECORD_DATE" ShowInGroupFooterColumn="RECORD_DATE" SummaryType="Count" DisplayFormat="平均" />
                                                            <dx:ASPxSummaryItem FieldName="SJ_SI_302" ShowInGroupFooterColumn="SJ_SI_302" SummaryType="Average" DisplayFormat="{0:0.00}" />
                                                            
                                                        </TotalSummary>
                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" VerticalScrollableHeight="550" VerticalScrollBarMode="Hidden" />
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
