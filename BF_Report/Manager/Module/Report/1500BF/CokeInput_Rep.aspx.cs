using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Data;
using DevExpress.Web;
using DevExpress.XtraGrid;
using System.Windows.Forms;
using GemBox.Spreadsheet;
using System.IO;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._1500BF
{
    public partial class CokeInput_Rep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
            }
            else
            {
                if (SQLComm.strHeight != null)
                    GetData(SQLComm.strHeight);
            }
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string strNowHeight = e.Parameter.ToString();
            if (strNowHeight != null)
                SQLComm.strHeight = strNowHeight;
            GetData(SQLComm.strHeight);
        }

        protected void GetData(string strHeight)
        {
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            strSQL = "select RECORD_TIME,WORK_SHIFT,WORK_TEAM,CHARGE_NO,BATCH_NO,ORE_NAME,V_CHARGE_WAY,'理论值' as DATA_TYPE,COKE1_SET_WEIGHT, ";
            strSQL += "COKE2_SET_WEIGHT,COKE3_SET_WEIGHT,COKE4_SET_WEIGHT,COKE5_SET_WEIGHT,COKE6_SET_WEIGHT,COKE7_SET_WEIGHT,SUM_DRY_COKE,0 as SUM_WET_COKE, ";
            strSQL += "ZF1_SET_WEIGHT,ZF2_SET_WEIGHT,0 as SUM_ZF, ";
            strSQL += " 0 as COKE1_SUM1,0 as COKE2_SUM1,0 as COKE3_SUM1,0 as COKE4_SUM1,0 as COKE5_SUM1,0 as COKE6_SUM1,0 as COKE7_SUM1,0 as SUM_WET1,0 as SUM_DRY1,  COKE1_SET_WEIGHT as COKE1_SUM2,COKE2_SET_WEIGHT as COKE2_SUM2,COKE3_SET_WEIGHT as COKE3_SUM2,COKE4_SET_WEIGHT as COKE4_SUM2,COKE5_SET_WEIGHT as COKE5_SUM2,COKE6_SET_WEIGHT as COKE6_SUM2,COKE7_SET_WEIGHT as COKE7_SUM2,0 as SUM_WET2,SUM_DRY_COKE as SUM_DRY2 ";
            strSQL += " from T_BASE_COKE_CONSUME  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime;
            strSQL += "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
            strSQL += "ORDER BY RECORD_TIME ASC";
            DataTable dt1 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
            foreach (DataRow dr in dt1.Rows)
            {
                try
                {
                    double dvalue = double.Parse(dr["COKE1_SET_WEIGHT"].ToString()) + double.Parse(dr["COKE2_SET_WEIGHT"].ToString()) + double.Parse(dr["COKE3_SET_WEIGHT"].ToString());
                    dvalue += double.Parse(dr["COKE4_SET_WEIGHT"].ToString()) + double.Parse(dr["COKE5_SET_WEIGHT"].ToString()) + double.Parse(dr["COKE6_SET_WEIGHT"].ToString());
                    dvalue += double.Parse(dr["COKE7_SET_WEIGHT"].ToString());
                    dr["SUM_DRY_COKE"] = dvalue.ToString("N2");
                    dr["SUM_DRY2"] = dvalue.ToString("N2");
                    dr["SUM_ZF"] = (double.Parse(dr["ZF1_SET_WEIGHT"].ToString()) + double.Parse(dr["ZF2_SET_WEIGHT"].ToString())).ToString("N2");
                }
                catch { }
            }

            strSQL = "select RECORD_TIME,WORK_SHIFT,WORK_TEAM,CHARGE_NO,BATCH_NO,ORE_NAME,V_CHARGE_WAY,'实际值' as DATA_TYPE,COKE1_ACT_WEIGHT as COKE1_SET_WEIGHT, ";
            strSQL += "COKE2_ACT_WEIGHT as COKE2_SET_WEIGHT,COKE3_ACT_WEIGHT as COKE3_SET_WEIGHT,COKE4_ACT_WEIGHT as COKE4_SET_WEIGHT,              ";
            strSQL += " COKE5_ACT_WEIGHT as COKE5_SET_WEIGHT,COKE6_ACT_WEIGHT as COKE6_SET_WEIGHT,COKE7_ACT_WEIGHT as COKE7_SET_WEIGHT,SUM_DRY_COKE,SUM_COKE as SUM_WET_COKE, ";
            strSQL += "ZF1_ACT_WEIGHT as ZF1_SET_WEIGHT,ZF2_ACT_WEIGHT as ZF2_SET_WEIGHT,0 as SUM_ZF, ";
            strSQL += "COKE1_ACT_WEIGHT as COKE1_SUM1,COKE2_ACT_WEIGHT as COKE2_SUM1,COKE3_ACT_WEIGHT as COKE3_SUM1,COKE4_ACT_WEIGHT as COKE4_SUM1,COKE5_ACT_WEIGHT as COKE5_SUM1,COKE6_ACT_WEIGHT as COKE6_SUM1,COKE7_ACT_WEIGHT as COKE7_SUM1,SUM_COKE as SUM_WET1,SUM_DRY_COKE as SUM_DRY1,  0 as COKE1_SUM2,0 as COKE2_SUM2,0 as COKE3_SUM2,0 as COKE4_SUM2,0as COKE5_SUM2,0 as COKE6_SUM2,0 as COKE7_SUM2,0 as SUM_WET2,0 as SUM_DRY2";
            strSQL += " from T_BASE_COKE_CONSUME  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime;
            strSQL += "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
            strSQL += "ORDER BY RECORD_TIME ASC";
            DataTable dt2 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt2);
            foreach (DataRow dr in dt2.Rows)
            {
                try
                {
                    double dvalue = double.Parse(dr["COKE1_SET_WEIGHT"].ToString()) + double.Parse(dr["COKE2_SET_WEIGHT"].ToString()) + double.Parse(dr["COKE3_SET_WEIGHT"].ToString());
                    dvalue += double.Parse(dr["COKE4_SET_WEIGHT"].ToString()) + double.Parse(dr["COKE5_SET_WEIGHT"].ToString()) + double.Parse(dr["COKE6_SET_WEIGHT"].ToString());
                    dvalue += double.Parse(dr["COKE7_SET_WEIGHT"].ToString());
                    dr["SUM_WET_COKE"] = double.Parse(dr["SUM_WET_COKE"].ToString()).ToString("N2");
                    //dr["SUM_DRY1"] = double.Parse(dr["SUM_WET_COKE"].ToString()).ToString("N2");
                    dr["SUM_ZF"] = (double.Parse(dr["ZF1_SET_WEIGHT"].ToString()) + double.Parse(dr["ZF2_SET_WEIGHT"].ToString())).ToString("N2");
                }
                catch { }
            }
            if (cbbType.Value.ToString() == "1")
            {
                dt1.Merge(dt2);
                dt1.DefaultView.Sort = " RECORD_TIME asc,DATA_TYPE desc";
                gridBase1.DataSource = dt1;
            }
            else if (cbbType.Value.ToString() == "2")
            {
                dt2.DefaultView.Sort = " RECORD_TIME asc,DATA_TYPE desc ";
                gridBase1.DataSource = dt2;
            }
            else
            {
                dt1.DefaultView.Sort = " RECORD_TIME asc,DATA_TYPE desc ";
                gridBase1.DataSource = dt1;
            }

            if (dt1.Rows.Count > 12 || dt2.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Auto;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 170;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;

            SetVisible(gridBase1.TotalSummary, cbbType.Value.ToString());
            SetVisible(gridBase1.GroupSummary, cbbType.Value.ToString());
            gridBase1.DataBind();
            gridBase1.ExpandAll();
        }

        private void SetVisible(ASPxSummaryItemCollection items, string cbb)
        {
            foreach (var item in items.FindAll(t => t.Visible == false))
                item.Visible = true;
            if (cbb.Equals("2"))
            {
                foreach (var item in items.FindAll(t => t.Tag == "tag2"))
                    item.Visible = false;
            }
            else if (cbb.Equals("3"))
            {
                foreach (var item in items.FindAll(t => t.Tag == "tag1"))
                    item.Visible = false;
            }
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            
                GetData(SQLComm.strHeight);
            ExpGrid.WriteXlsToResponse(new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
            //try
            //{
            //    if (!(gridBase1.DataSource is DataTable dt) || dt.Rows.Count < 1)
            //        return;
            //    dt = dt.Copy();
            //    //清理多余的
            //    for (int i = 1; i <= 7; i++)
            //    {
            //        dt.Columns.Remove("COKE" + i + "_SUM1");
            //        dt.Columns.Remove("COKE" + i + "_SUM2");
            //    }
            //    dt.Columns.Remove("SUM_WET1");
            //    dt.Columns.Remove("SUM_DRY1");
            //    dt.Columns.Remove("SUM_WET2");
            //    dt.Columns.Remove("SUM_DRY2");

            //    dt.Columns.Remove("ZF1_SET_WEIGHT");
            //    dt.Columns.Remove("ZF2_SET_WEIGHT");
            //    dt.Columns.Remove("SUM_ZF");
            //    //排序
            //    dt.DefaultView.Sort = " RECORD_TIME ASC,DATA_TYPE DESC ";
            //    dt = dt.DefaultView.ToTable();

            //    string saveFileName = "";

            //    SpreadsheetInfo.SetLicense("EQU2-1000-0000-000U");
            //    //存放于服务器
            //    ExcelFile excelFile = new ExcelFile();
            //    string file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\焦炭投料.xls";
            //    excelFile.LoadXls(file);
            //    ExcelWorksheet sheet = excelFile.Worksheets[0];

            //    //普通的单元格式
            //    CellStyle tmpStyle = new CellStyle();
            //    //tmpStyle.Font.Weight = ExcelFont.BoldWeight;
            //    tmpStyle.Font.Color = System.Drawing.Color.Black;
            //    tmpStyle.WrapText = true;
            //    tmpStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

            //    //时间单元格式
            //    CellStyle timeStyle = new CellStyle();
            //    timeStyle.HorizontalAlignment = HorizontalAlignmentStyle.Right;
            //    timeStyle.NumberFormat = "hh:mm";
            //    timeStyle.Font.Color = System.Drawing.Color.Black;
            //    timeStyle.WrapText = true;
            //    timeStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

            //    //合并单元格式
            //    CellStyle mergeStyle = new CellStyle();
            //    //设置水平对齐模式
            //    mergeStyle.HorizontalAlignment = HorizontalAlignmentStyle.Center;
            //    //设置垂直对齐模式
            //    mergeStyle.VerticalAlignment = VerticalAlignmentStyle.Center;
            //    mergeStyle.Font.Color = System.Drawing.Color.Black;
            //    mergeStyle.WrapText = true;
            //    mergeStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

            //    //时间合并单元格式
            //    CellStyle mergeTimeStyle = new CellStyle();
            //    mergeTimeStyle.NumberFormat = "hh:mm";
            //    mergeTimeStyle.HorizontalAlignment = HorizontalAlignmentStyle.Center;
            //    mergeTimeStyle.VerticalAlignment = VerticalAlignmentStyle.Center;
            //    mergeTimeStyle.Font.Color = System.Drawing.Color.Black;
            //    mergeTimeStyle.WrapText = true;
            //    mergeTimeStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

            //    DateTime dtLast = DateTime.Now; //上个时间 判断是否合并
            //    int index = 1; //行索引
            //    //上个班次 数据模式1 数据模式2
            //    string strShiftLast = "", strType1 = dt.Rows[0]["DATA_TYPE"].ToString(), strType2 = "", strValue = "";
            //    for (int i = 0; i < dt.Rows.Count; i++)
            //    {
            //        //检查新的班次
            //        string strShiftNow = dt.Rows[i]["WORK_SHIFT"].ToString();
            //        if (!strShiftNow.Equals(strShiftLast))
            //        {
            //            sheet.Cells[index, 0].Value = strShiftNow;
            //            sheet.Cells[index, 0].Style = tmpStyle;
            //            sheet.Cells.GetSubrangeAbsolute(index, 1, index, 14).Merged = true;
            //            sheet.Cells[index, 1].Style = mergeStyle;
            //            index++;
            //        }
            //        DateTime dtNow = DateTime.Parse(dt.Rows[i]["RECORD_TIME"].ToString());
            //        sheet.Cells[index, 0].Value = dtNow;
            //        sheet.Cells[index, 0].Style = timeStyle;

            //        sheet.Cells[index, 1].Value = dt.Rows[i]["WORK_TEAM"].ToString();
            //        sheet.Cells[index, 1].Style = tmpStyle;

            //        sheet.Cells[index, 2].Value = dt.Rows[i]["BATCH_NO"].ToString();
            //        sheet.Cells[index, 2].Style = tmpStyle;

            //        sheet.Cells[index, 3].Value = dt.Rows[i]["ORE_NAME"].ToString();
            //        sheet.Cells[index, 3].Style = tmpStyle;

            //        sheet.Cells[index, 4].Value = dt.Rows[i]["V_CHARGE_WAY"].ToString();
            //        sheet.Cells[index, 4].Style = tmpStyle;

            //        if (dtNow == dtLast)
            //        {
            //            //合并
            //            sheet.Cells.GetSubrangeAbsolute(index - 1, 0, index, 0).Merged = true;
            //            sheet.Cells[index - 1, 0].Style = mergeTimeStyle;
            //            for (int j = 1; j < 5; j++)
            //            {
            //                sheet.Cells.GetSubrangeAbsolute(index - 1, j, index, j).Merged = true;
            //                sheet.Cells[index - 1, j].Style = mergeStyle;
            //            }
            //            //保存数据模式
            //            strType1 = dt.Rows[i - 1]["DATA_TYPE"].ToString();
            //            strType2 = dt.Rows[i]["DATA_TYPE"].ToString();
            //        }

            //        sheet.Cells[index, 5].Value = dt.Rows[i]["DATA_TYPE"].ToString();
            //        sheet.Cells[index, 5].Style = tmpStyle;

            //        sheet.Cells[index, 6].Value = dt.Rows[i]["COKE1_SET_WEIGHT"].ToString();
            //        sheet.Cells[index, 6].Style = tmpStyle;

            //        sheet.Cells[index, 7].Value = dt.Rows[i]["COKE2_SET_WEIGHT"].ToString();
            //        sheet.Cells[index, 7].Style = tmpStyle;

            //        sheet.Cells[index, 8].Value = dt.Rows[i]["COKE3_SET_WEIGHT"].ToString();
            //        sheet.Cells[index, 8].Style = tmpStyle;

            //        sheet.Cells[index, 9].Value = dt.Rows[i]["COKE4_SET_WEIGHT"].ToString();
            //        sheet.Cells[index, 9].Style = tmpStyle;

            //        sheet.Cells[index, 10].Value = dt.Rows[i]["COKE5_SET_WEIGHT"].ToString();
            //        sheet.Cells[index, 10].Style = tmpStyle;

            //        sheet.Cells[index, 11].Value = dt.Rows[i]["COKE6_SET_WEIGHT"].ToString();
            //        sheet.Cells[index, 11].Style = tmpStyle;

            //        sheet.Cells[index, 12].Value = dt.Rows[i]["COKE7_SET_WEIGHT"].ToString();
            //        sheet.Cells[index, 12].Style = tmpStyle;

            //        sheet.Cells[index, 13].Value = dt.Rows[i]["SUM_WET_COKE"].ToString();
            //        sheet.Cells[index, 13].Style = tmpStyle;

            //        sheet.Cells[index, 14].Value = dt.Rows[i]["SUM_DRY_COKE"].ToString();
            //        sheet.Cells[index, 14].Style = tmpStyle;

            //        #region 检查合计
            //        string strShiftNext = "";
            //        if (dt.Rows.Count > i + 1)
            //            strShiftNext = dt.Rows[i + 1]["WORK_SHIFT"].ToString();
            //        else if (dt.Rows.Count == i + 1)
            //            strShiftNext = "last";
            //        if (!string.IsNullOrEmpty(strShiftNext) && !strShiftNext.Equals(strShiftNow))
            //        {
            //            index++;
            //            strValue = dt.Compute("COUNT(RECORD_TIME)", "WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 0].Value = strShiftNow + "合计(" + strValue + "条)";
            //            sheet.Cells[index, 0].Style = tmpStyle;

            //            sheet.Cells[index, 1].Style = tmpStyle;
            //            sheet.Cells[index, 2].Style = tmpStyle;
            //            sheet.Cells[index, 3].Style = tmpStyle;
            //            sheet.Cells[index, 4].Style = tmpStyle;

            //            sheet.Cells[index, 5].Value = strType1;
            //            sheet.Cells[index, 5].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(COKE1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 6].Value = strValue;
            //            sheet.Cells[index, 6].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(COKE2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 7].Value = strValue;
            //            sheet.Cells[index, 7].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(COKE3_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 8].Value = strValue;
            //            sheet.Cells[index, 8].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(COKE4_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 9].Value = strValue;
            //            sheet.Cells[index, 9].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(COKE5_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 10].Value = strValue;
            //            sheet.Cells[index, 10].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(COKE6_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 11].Value = strValue;
            //            sheet.Cells[index, 11].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(COKE7_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 12].Value = strValue;
            //            sheet.Cells[index, 12].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(SUM_WET_COKE)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 13].Value = strValue;
            //            sheet.Cells[index, 13].Style = tmpStyle;

            //            strValue = dt.Compute("SUM(SUM_DRY_COKE)", "DATA_TYPE='" + strType1 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //            sheet.Cells[index, 14].Value = strValue;
            //            sheet.Cells[index, 14].Style = tmpStyle;

            //            if (!string.IsNullOrEmpty(strType2))
            //            {
            //                index++;
            //                sheet.Cells[index, 0].Style = tmpStyle;

            //                sheet.Cells[index, 1].Style = tmpStyle;
            //                sheet.Cells[index, 2].Style = tmpStyle;
            //                sheet.Cells[index, 3].Style = tmpStyle;
            //                sheet.Cells[index, 4].Style = tmpStyle;
            //                for (int k = 0; k < 5; k++)
            //                {
            //                    sheet.Cells.GetSubrangeAbsolute(index - 1, k, index, k).Merged = true;
            //                    sheet.Cells[index - 1, k].Style = mergeStyle;
            //                }

            //                sheet.Cells[index, 5].Value = strType2;
            //                sheet.Cells[index, 5].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(COKE1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 6].Value = strValue;
            //                sheet.Cells[index, 6].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(COKE2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 7].Value = strValue;
            //                sheet.Cells[index, 7].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(COKE3_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 8].Value = strValue;
            //                sheet.Cells[index, 8].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(COKE4_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 9].Value = strValue;
            //                sheet.Cells[index, 9].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(COKE5_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 10].Value = strValue;
            //                sheet.Cells[index, 10].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(COKE6_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 11].Value = strValue;
            //                sheet.Cells[index, 11].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(COKE7_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 12].Value = strValue;
            //                sheet.Cells[index, 12].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(SUM_WET_COKE)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 13].Value = strValue;
            //                sheet.Cells[index, 13].Style = tmpStyle;

            //                strValue = dt.Compute("SUM(SUM_DRY_COKE)", "DATA_TYPE='" + strType2 + "' and WORK_SHIFT = '" + strShiftNow + "'").ToString();
            //                sheet.Cells[index, 14].Value = strValue;
            //                sheet.Cells[index, 14].Style = tmpStyle;
            //            }
            //        }
            //        #endregion
            //        strShiftLast = strShiftNow;
            //        dtLast = dtNow;
            //        index++;
            //    }

            //    #region 总计
            //    strValue = dt.Compute("COUNT(RECORD_TIME)", "TRUE").ToString();
            //    sheet.Cells[index, 0].Value = "总计(" + strValue + "条)";
            //    sheet.Cells[index, 0].Style = tmpStyle;

            //    sheet.Cells[index, 1].Style = tmpStyle;
            //    sheet.Cells[index, 2].Style = tmpStyle;
            //    sheet.Cells[index, 3].Style = tmpStyle;
            //    sheet.Cells[index, 4].Style = tmpStyle;

            //    sheet.Cells[index, 5].Value = strType1;
            //    sheet.Cells[index, 5].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(COKE1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 6].Value = strValue;
            //    sheet.Cells[index, 6].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(COKE2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 7].Value = strValue;
            //    sheet.Cells[index, 7].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(COKE3_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 8].Value = strValue;
            //    sheet.Cells[index, 8].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(COKE4_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 9].Value = strValue;
            //    sheet.Cells[index, 9].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(COKE5_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 10].Value = strValue;
            //    sheet.Cells[index, 10].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(COKE6_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 11].Value = strValue;
            //    sheet.Cells[index, 11].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(COKE7_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 12].Value = strValue;
            //    sheet.Cells[index, 12].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(SUM_WET_COKE)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 13].Value = strValue;
            //    sheet.Cells[index, 13].Style = tmpStyle;

            //    strValue = dt.Compute("SUM(SUM_DRY_COKE)", "DATA_TYPE='" + strType1 + "'").ToString();
            //    sheet.Cells[index, 14].Value = strValue;
            //    sheet.Cells[index, 14].Style = tmpStyle;

            //    if (!string.IsNullOrEmpty(strType2))
            //    {
            //        index++;
            //        sheet.Cells[index, 0].Style = tmpStyle;

            //        sheet.Cells[index, 1].Style = tmpStyle;
            //        sheet.Cells[index, 2].Style = tmpStyle;
            //        sheet.Cells[index, 3].Style = tmpStyle;
            //        sheet.Cells[index, 4].Style = tmpStyle;
            //        for (int k = 0; k < 5; k++)
            //        {
            //            sheet.Cells.GetSubrangeAbsolute(index - 1, k, index, k).Merged = true;
            //            sheet.Cells[index - 1, k].Style = mergeStyle;
            //        }

            //        sheet.Cells[index, 5].Value = strType2;
            //        sheet.Cells[index, 5].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(COKE1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 6].Value = strValue;
            //        sheet.Cells[index, 6].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(COKE2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 7].Value = strValue;
            //        sheet.Cells[index, 7].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(COKE3_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 8].Value = strValue;
            //        sheet.Cells[index, 8].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(COKE4_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 9].Value = strValue;
            //        sheet.Cells[index, 9].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(COKE5_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 10].Value = strValue;
            //        sheet.Cells[index, 10].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(COKE6_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 11].Value = strValue;
            //        sheet.Cells[index, 11].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(COKE7_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 12].Value = strValue;
            //        sheet.Cells[index, 12].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(SUM_WET_COKE)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 13].Value = strValue;
            //        sheet.Cells[index, 13].Style = tmpStyle;

            //        strValue = dt.Compute("SUM(SUM_DRY_COKE)", "DATA_TYPE='" + strType2 + "'").ToString();
            //        sheet.Cells[index, 14].Value = strValue;
            //        sheet.Cells[index, 14].Style = tmpStyle;
            //    }
            //    #endregion

            //    saveFileName = file.Substring(0, file.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";

            //    FileInfo TargetFile = new FileInfo(saveFileName);
            //    excelFile.SaveXls(saveFileName);

            //    string strTime = DateTime.Now.ToString("yyyyMMddHHmmss");
            //    //清除缓冲区流中的所有内容输出.
            //    Page.Response.Clear();
            //    //向输出流添加HTTP头 [指定下载/保存 对话框的文件名]
            //    Page.Response.AppendHeader("Content-Disposition", "attachment; filename=" + Page.Server.UrlEncode("焦炭投料_" + strTime + ".xls"));
            //    //向输出流添加HTTP头 [指定文件的长度,这样下载文件就会显示正确的进度
            //    Page.Response.AppendHeader("Content-Length", TargetFile.Length.ToString());
            //    //表明输出的HTTP为流[stream],因此客户端只能下载.
            //    Page.Response.ContentType = "application/octet-stream";
            //    //发送文件流到客户端.
            //    Page.Response.WriteFile(TargetFile.FullName);
            //    //Page.Response.w
            //    //停止执行当前页
            //    //TargetFile.Delete();
            //    Page.Response.Flush();
            //    TargetFile.Delete();
            //    Page.Response.End();
            //}
            //catch (Exception ex)
            //{
            //    ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>window.alert('" + ex.Message + "');</script>");
            //}
        }

        protected void gridBase1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            try
            {
                if (e.RowType == DevExpress.Web.GridViewRowType.Data)
                {
                    //当鼠标停留时更改背景色
                    e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#B0E2FF';");
                    //当鼠标移开时还原背景色
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
                }
            }
            catch { }
        }

        protected void gridBase1_CustomCellMerge(object sender, ASPxGridViewCustomCellMergeEventArgs e)
        {
            List<string> lMergeFileds = new List<string> { "RECORD_TIME", "WORK_TEAM", "BATCH_NO", "ORE_NAME", "V_CHARGE_WAY" };
            string sMergeByKey = "RECORD_TIME";
            string sFiledName = "";
            sFiledName = ((GridViewDataTextColumn)e.Column).FieldName;
            if (lMergeFileds.Contains(sFiledName))
            {
                int iFirst_Row = e.RowVisibleIndex1;
                int iSecond_Row = e.RowVisibleIndex2;
                object oFirst_Value = e.Value1;
                object oSecond_Value = e.Value2;
                object oYwbh_First = gridBase1.GetRowValues(iFirst_Row, sMergeByKey);
                object oYwbh_Second = gridBase1.GetRowValues(iSecond_Row, sMergeByKey);

                if (oYwbh_First != null && oYwbh_Second != null)
                {
                    if (oYwbh_First.Equals(oYwbh_Second))
                    {
                        if (oFirst_Value.Equals(oSecond_Value))
                        {
                            e.Merge = true;
                        }
                        else
                        {
                            e.Merge = false;
                        }
                    }
                    else
                    {
                        e.Merge = false;
                    }
                }
                else
                {
                    e.Merge = false;
                }
            }
            e.Handled = true;
        }
        protected void gridBase1_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            if (e.Item != null)
            {
                string strField = ((ASPxSummaryItem)e.Item).FieldName.ToString();
                DataTable dt = gridBase1.DataSource as DataTable;
                string strValue = "0";

                strValue = dt.Compute("sum(COKE1_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "COKE1_SUM1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE1_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "COKE1_SUM2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE2_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "COKE2_SUM1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE2_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "COKE2_SUM2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE3_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "COKE3_SUM1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE3_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "COKE3_SUM2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE4_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "COKE4_SUM1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE4_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "COKE4_SUM2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE5_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "COKE5_SUM1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE5_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "COKE5_SUM2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE6_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "COKE6_SUM1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE6_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "COKE6_SUM2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE7_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "COKE7_SUM1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(COKE7_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "COKE7_SUM2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(SUM_WET_COKE)", "DATA_TYPE='实际值'").ToString();
                if (strField == "SUM_WET1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(SUM_WET_COKE)", "DATA_TYPE='理论值'").ToString();
                if (strField == "SUM_WET2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(SUM_DRY_COKE)", "DATA_TYPE='实际值'").ToString();
                if (strField == "SUM_DRY1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(SUM_DRY_COKE)", "DATA_TYPE='理论值'").ToString();
                if (strField == "SUM_DRY2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(ZF1_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "ZF1_SET1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(ZF1_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "ZF1_SET2")
                    calculate(e, strValue);
                strValue = dt.Compute("sum(ZF2_SET_WEIGHT)", "DATA_TYPE='实际值'").ToString();
                if (strField == "ZF2_SET1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(ZF2_SET_WEIGHT)", "DATA_TYPE='理论值'").ToString();
                if (strField == "ZF2_SET2")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(SUM_ZF)", "DATA_TYPE='理论值'").ToString();
                if (strField == "SUM_ZF1")
                    calculate(e, strValue);

                strValue = dt.Compute("sum(SUM_ZF)", "DATA_TYPE='理论值'").ToString();
                if (strField == "SUM_ZF2")
                    calculate(e, strValue);
            }
        }

        protected void calculate(DevExpress.Data.CustomSummaryEventArgs e, string strValue)
        {
            switch (e.SummaryProcess)
            {
                case CustomSummaryProcess.Start:
                    break;

                case CustomSummaryProcess.Calculate:
                    break;

                case CustomSummaryProcess.Finalize:

                    if (e.IsTotalSummary || e.IsGroupSummary)
                    {
                        try
                        {
                            e.TotalValue = double.Parse(strValue).ToString("N2");
                        }
                        catch { }
                    }
                    break;

                default:
                    break;
            }
        }
    }
}