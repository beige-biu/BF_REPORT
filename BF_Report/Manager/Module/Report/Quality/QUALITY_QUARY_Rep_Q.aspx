<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QUALITY_QUARY_Rep_Q.aspx.cs" Inherits="BF_Report.Manager.Module.Report._Quality.QUALITY_QUARY_Rep_Q" %>

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
        #cbp_Base_gridBase1_DXMainTable {
              
             empty-cells: show;
            table-layout: fixed;
            overflow: hidden;
            text-overflow: ellipsis;
            //background-color: yellow;
            width:auto !important;
           
        }
       
        
    </style>

    <script language="JavaScript" type="text/javascript">
        //操作
        function OnQueryClick(s, e) {
            try {
                cbp_Base.PerformCallback();
            }
            finally {

                //CollectGarbage();
            }
        }
    </script>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr style="background-color: cornflowerblue; font-size: 15pt;">
                    <td width="100%;" height="30px" align="center" valign="center">
                        质检信息查询
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table style="width: 100%;" align="center" valign="top">
                            <tr style="background-color: lightblue;">
                                <td>
                                    <table style="width: 100%; height: 35px;" valign="center">
                                        <tr>
                                            <td width="70px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel1" Font-Size="14px" runat="server" Text="开始日期:" Width="70px">
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
                                            <td width="60px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel6" Font-Size="14px" runat="server" Text="查询项目:" Width="80px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxComboBox ID="cbbType" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="80px" ClientInstanceName="cbbType" >
                                                    <Items>
                                                        <dx:ListEditItem Text="铁水" Value="铁水" />
                                                        <dx:ListEditItem Text="炉渣" Value="炉渣" />
                                                        <dx:ListEditItem Text="烧结矿" Value="烧结矿" />
                                                        <dx:ListEditItem Text="球团矿" Value="球团矿" />
                                                        <dx:ListEditItem Text="块矿" Value="块矿" />
                                                        <dx:ListEditItem Text="喷煤煤粉" Value="喷煤煤粉" />
                                                        <dx:ListEditItem Text="焦炭" Value="焦炭" />
                                                        <dx:ListEditItem Text="高炉瓦斯灰" Value="高炉瓦斯灰" />
                                                        <dx:ListEditItem Text="除尘灰" Value="除尘灰" />
                                                        <dx:ListEditItem Text="石灰石" Value="石灰石" />
                                                        <dx:ListEditItem Text="白云石" Value="白云石" />
                                                        <dx:ListEditItem Text="硅石" Value="硅石" />
                                                        <dx:ListEditItem Text="萤石" Value="萤石" />
                                                        <dx:ListEditItem Text="锰矿" Value="锰矿" />
                                                        <dx:ListEditItem Text="高炉返焦" Value="高炉返焦" />
                                                        <dx:ListEditItem Text="高炉焦屑" Value="高炉焦屑" />
                                                        <dx:ListEditItem Text="高炉煤气" Value="高炉煤气" />
                                                        <dx:ListEditItem Text="蛇纹石" Value="蛇纹石" />
                                                        <dx:ListEditItem Text="高炉返矿" Value="高炉返矿" />
                                                        <dx:ListEditItem Text="焦丁" Value="焦丁" />
                                                        <dx:ListEditItem Text="无烟煤" Value="无烟煤" />
                                                        <dx:ListEditItem Text="烟煤" Value="烟煤" />
                                                        <dx:ListEditItem Text="烧结返矿" Value="烧结返矿" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>

                                            <td width="60px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel7" Font-Size="14px" runat="server" Text="作业区:" Width="80px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxComboBox ID="cbbType1" Font-Size="14px" runat="server" ValueType="System.String"
                                                    Width="80px" ClientInstanceName="cbbType1" >
                                                    <Items>
                                                        <dx:ListEditItem Text="1#高炉" Value="T6" />
                                                        <dx:ListEditItem Text="2#高炉" Value="T7" />
                                                        <dx:ListEditItem Text="3#高炉" Value="T5" />
                                                        <dx:ListEditItem Text="全部"   Value="T_" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>

                                            <td width="50px" align="right">
                                                <dx:ASPxLabel ID="ASPxLabel5" Font-Size="14px" runat="server" Text="试样号:" Width="80px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td width="80px">
                                                <dx:ASPxTextBox ID="sampleno" Font-Size="14px" runat="server" Width="150px" ClientInstanceName="sampleno">

                                                </dx:ASPxTextBox>
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
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="" Width="20px">
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

                                                        <Settings ShowGroupPanel="false" ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" VerticalScrollableHeight="650" VerticalScrollBarMode="Hidden" />
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
