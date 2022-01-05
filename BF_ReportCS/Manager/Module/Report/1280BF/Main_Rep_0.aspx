<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main_Rep_0.aspx.cs" Inherits="BF_ReportCS.Manager.Module.Report._1280BF.Main_Rep_0" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <br />
        </div>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td width="20%"></td>
                    <td width="60%">
                        <dx:ASPxGridView ID="gridBase1" runat="server" ClientInstanceName="gridBase1" Width="100%" Theme="Office2010Blue" OnHtmlRowPrepared="gridBase1_HtmlRowPrepared" Font-Size="14px">
                            <Styles>
                                <Header HorizontalAlign="Center" Wrap="True" />
                                <AlternatingRow Enabled="true" />
                            </Styles>
                            <Columns>
                                <dx:GridViewBandColumn Caption="1#高炉主要设计经济技术指标" VisibleIndex="1">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="指标名称" FieldName="NAME" ShowInCustomizationForm="True" UnboundType="String"
                                            Width="65px" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="单位" FieldName="UNIT_DES" ShowInCustomizationForm="True" UnboundType="String"
                                            Width="65px" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="指标值" FieldName="VALUE6" ShowInCustomizationForm="True" UnboundType="String"
                                            Width="65px" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="备注" FieldName="REMARK6" ShowInCustomizationForm="True" UnboundType="String"
                                            Width="65px" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="2#高炉主要设计经济技术指标" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="指标名称" FieldName="NAME" ShowInCustomizationForm="True" UnboundType="String"
                                            Width="65px" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="单位" FieldName="UNIT_DES" ShowInCustomizationForm="True" UnboundType="String"
                                            Width="65px" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="指标值" FieldName="VALUE" ShowInCustomizationForm="True" UnboundType="String"
                                            Width="65px" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="备注" FieldName="REMARK" ShowInCustomizationForm="True" UnboundType="String"
                                            Width="65px" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="false" AllowDragDrop="false" AllowSort="False" ConfirmDelete="true" MergeGroupsMode="Always" AutoExpandAllGroups="true" />
                            <SettingsPager Mode="ShowAllRecords" />
                        </dx:ASPxGridView>
                    </td>
                    <td width="20%"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
