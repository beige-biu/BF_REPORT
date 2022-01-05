using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;
using GemBox.Spreadsheet;
using System.IO;

namespace BF_ReportCS.Manager.Module.Report._1280BF
{
    public partial class OreInput_Rep : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:00";
            string strSQL = "";
            strSQL = "select RECORD_TIME,BC,BB,ORE_NAME,CHARGE_NO,BATCH_NO,'理论值' as DATA_TYPE，0 as MAT_SUM，SF1_SET_WEIGHT,";
            strSQL += "SF2_SET_WEIGHT,SF3_SET_WEIGHT,SF4_SET_WEIGHT,SF5_SET_WEIGHT,SF6_SET_WEIGHT,";
            strSQL += "0 as SF_SUM,AF1_SET_WEIGHT,AF2_SET_WEIGHT,0 as AF_SUM,OF1_SET_WEIGHT,";
            strSQL += "OF2_SET_WEIGHT,0 as OF_SUM,ZF1_SET_WEIGHT,ZF2_SET_WEIGHT,0 as ZF_SUM,CFD_SET_WEIGHT,";
            strSQL += "CHARGE_ORE_FLAG, ";
            strSQL += "0 as MAT_SUM1,0 as SF1_SUM1,0 as SF2_SUM1,0 as SF3_SUM1,0 as SF4_SUM1,0 as SF5_SUM1,0 as SF6_SUM1,0 as SF_SUM1, ";
            strSQL += "0 as AF1_SUM1,0 as AF2_SUM1,0 as AF_SUM1,0 as OF1_SUM1,0 as OF2_SUM1,0 as OF_SUM1,0 as ZF1_SUM1,0 as ZF2_SUM1,0 as ZF_SUM1,0 as CFD_SUM1, ";
            strSQL += "0 as MAT_SUM2,SF1_SET_WEIGHT as SF1_SUM2,SF2_SET_WEIGHT as SF2_SUM2,SF3_SET_WEIGHT as SF3_SUM2,SF4_SET_WEIGHT as SF4_SUM2,SF5_SET_WEIGHT as SF5_SUM2,SF6_SET_WEIGHT as SF6_SUM2,0 as SF_SUM2,";
            strSQL += "AF1_SET_WEIGHT as AF1_SUM2,AF2_SET_WEIGHT as AF2_SUM2,0 as AF_SUM2,OF1_SET_WEIGHT as OF1_SUM2,OF2_SET_WEIGHT as OF2_SUM2,0 as OF_SUM2,ZF1_SET_WEIGHT as ZF1_SUM2,ZF2_SET_WEIGHT as ZF2_SUM2,0 as ZF_SUM2,CFD_SET_WEIGHT as CFD_SUM2";
            strSQL += " from l2bf_db.DAY_CHARGEORE  WHERE TO_CHAR(RECORD_TIME, 'YYYY-MM-DD HH24:MI') BETWEEN '" + strStartTime + "'";
            strSQL += " AND '" + strEndTime + "'   ";
            strSQL += " ORDER BY RECORD_TIME ASC";

            DataTable dt1 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
            foreach (DataRow dr in dt1.Rows)
            {
                try
                {
                    double dsf = double.Parse(dr["SF1_SET_WEIGHT"].ToString()) + double.Parse(dr["SF2_SET_WEIGHT"].ToString()) + double.Parse(dr["SF3_SET_WEIGHT"].ToString());
                    dsf += double.Parse(dr["SF4_SET_WEIGHT"].ToString()) + double.Parse(dr["SF5_SET_WEIGHT"].ToString()) + double.Parse(dr["SF6_SET_WEIGHT"].ToString());
                    dr["SF_SUM"] = dsf.ToString("N2");
                    dr["SF_SUM2"] = dsf.ToString("N2");

                    double daf = double.Parse(dr["AF1_SET_WEIGHT"].ToString()) + double.Parse(dr["AF2_SET_WEIGHT"].ToString());
                    dr["AF_SUM"] = daf.ToString("N2");
                    dr["AF_SUM2"] = daf.ToString("N2");

                    double dof = double.Parse(dr["OF1_SET_WEIGHT"].ToString()) + double.Parse(dr["OF2_SET_WEIGHT"].ToString());
                    dr["OF_SUM"] = dof.ToString("N2");
                    dr["OF_SUM2"] = dof.ToString("N2");

                    double dzf = double.Parse(dr["ZF1_SET_WEIGHT"].ToString()) + double.Parse(dr["ZF2_SET_WEIGHT"].ToString());
                    dr["ZF_SUM"] = dzf.ToString("N2");
                    dr["ZF_SUM2"] = dzf.ToString("N2");

                    dr["MAT_SUM"] = (dsf + daf + dof).ToString("N2");
                    dr["MAT_SUM2"] = (dsf + daf + dof).ToString("N2");
                }
                catch { }
            }
            
            strSQL = "select RECORD_TIME,BC,BB,ORE_NAME,CHARGE_NO,BATCH_NO,'实际值' as DATA_TYPE，0 as MAT_SUM，SF1_ACT_WEIGHT as SF1_SET_WEIGHT,";
            strSQL += "SF2_ACT_WEIGHT as SF2_SET_WEIGHT,SF3_ACT_WEIGHT as SF3_SET_WEIGHT,SF4_ACT_WEIGHT as SF4_SET_WEIGHT,";
            strSQL += "SF5_ACT_WEIGHT as SF5_SET_WEIGHT,SF6_ACT_WEIGHT as SF6_SET_WEIGHT,";
            strSQL += "0 as SF_SUM,";
            strSQL += "AF1_ACT_WEIGHT as AF1_SET_WEIGHT,AF2_ACT_WEIGHT as AF2_SET_WEIGHT,0 as AF_SUM,OF1_ACT_WEIGHT as OF1_SET_WEIGHT,";
            strSQL += "OF2_ACT_WEIGHT as OF2_SET_WEIGHT,0 as OF_SUM,ZF1_ACT_WEIGHT as ZF1_SET_WEIGHT,ZF2_ACT_WEIGHT as ZF2_SET_WEIGHT,0 as ZF_SUM,";
            strSQL += "CFD_ACT_WEIGHT as CFD_SET_WEIGHT,";
            strSQL += "CHARGE_ORE_FLAG, ";
            strSQL += "0 as MAT_SUM1,SF1_ACT_WEIGHT as SF1_SUM1,SF2_ACT_WEIGHT as SF2_SUM1,SF3_ACT_WEIGHT as SF3_SUM1,SF4_ACT_WEIGHT as SF4_SUM1,SF5_ACT_WEIGHT as SF5_SUM1,SF6_ACT_WEIGHT as SF6_SUM1,0 as SF_SUM1,";
            strSQL += "AF1_ACT_WEIGHT as AF1_SUM1,AF2_ACT_WEIGHT as AF2_SUM1,0 as AF_SUM1,OF1_ACT_WEIGHT as OF1_SUM1,OF2_ACT_WEIGHT as OF2_SUM1,0 as OF_SUM1,ZF1_ACT_WEIGHT as ZF1_SUM1,ZF2_ACT_WEIGHT as ZF2_SUM1,0 as ZF_SUM1,CFD_ACT_WEIGHT as CFD_SUM1,";
            strSQL += "0 as MAT_SUM2,0 as SF1_SUM2,0 as SF2_SUM2,0 as SF3_SUM2,0 as SF4_SUM2,0 as SF5_SUM2,0 as SF6_SUM2,0 as SF_SUM2,";
            strSQL += "0 as AF1_SUM2,0 as AF2_SUM2,0 as AF_SUM2,0 as OF1_SUM2,0 as OF2_SUM2,0 as OF_SUM2,0 as ZF1_SUM2,0 as ZF2_SUM2,0 as ZF_SUM2,0 as CFD_SUM2";
            strSQL += " from l2bf_db.DAY_CHARGEORE  WHERE TO_CHAR(RECORD_TIME, 'YYYY-MM-DD HH24:MI') BETWEEN '" + strStartTime + "'";
            strSQL += " AND '" + strEndTime + "'   ";
            strSQL += "   ORDER BY RECORD_TIME ASC";
            DataTable dt2 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt2);
            foreach (DataRow dr in dt2.Rows)
            {
                try
                {
                    double dsf = double.Parse(dr["SF1_SET_WEIGHT"].ToString()) + double.Parse(dr["SF2_SET_WEIGHT"].ToString()) + double.Parse(dr["SF3_SET_WEIGHT"].ToString());
                    dsf += double.Parse(dr["SF4_SET_WEIGHT"].ToString()) + double.Parse(dr["SF5_SET_WEIGHT"].ToString()) + double.Parse(dr["SF6_SET_WEIGHT"].ToString());
                    dr["SF_SUM"] = dsf.ToString("N2");
                    dr["SF_SUM1"] = dsf.ToString("N2");

                    double daf = double.Parse(dr["AF1_SET_WEIGHT"].ToString()) + double.Parse(dr["AF2_SET_WEIGHT"].ToString());
                    dr["AF_SUM"] = daf.ToString("N2");
                    dr["AF_SUM1"] = daf.ToString("N2");

                    double dof = double.Parse(dr["OF1_SET_WEIGHT"].ToString()) + double.Parse(dr["OF2_SET_WEIGHT"].ToString());
                    dr["OF_SUM"] = dof.ToString("N2");
                    dr["OF_SUM1"] = dof.ToString("N2");

                    double dzf = double.Parse(dr["ZF1_SET_WEIGHT"].ToString()) + double.Parse(dr["ZF2_SET_WEIGHT"].ToString());
                    dr["ZF_SUM"] = dzf.ToString("N2");
                    dr["ZF_SUM1"] = dzf.ToString("N2");

                    dr["MAT_SUM"] = (dsf + daf + dof).ToString("N2");
                    dr["MAT_SUM1"] = (dsf + daf + dof).ToString("N2");
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
            SetVisible(gridBase1.TotalSummary, cbbType.Value.ToString());
            SetVisible(gridBase1.GroupSummary, cbbType.Value.ToString());

            gridBase1.DataBind();
            gridBase1.ExpandAll();

            if (dt1.Rows.Count > 12 || dt2.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 205;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
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
            //GetData(SQLComm.strHeight);
            //ExpGrid.WriteXlsxToResponse();

            try
            {
                if (!(gridBase1.DataSource is DataTable dt) || dt.Rows.Count < 1)
                    return;
                dt = dt.Copy();
                //清理多余的
                dt.Columns.Remove("MAT_SUM1");
                dt.Columns.Remove("MAT_SUM2");
                for (int i = 1; i <= 6; i++)
                {
                    dt.Columns.Remove("SF" + i + "_SUM1");
                    dt.Columns.Remove("SF" + i + "_SUM2");
                }
                dt.Columns.Remove("SF_SUM1");
                dt.Columns.Remove("SF_SUM2");
                for (int i = 1; i <= 2; i++)
                {
                    dt.Columns.Remove("AF" + i + "_SUM1");
                    dt.Columns.Remove("AF" + i + "_SUM2");
                }
                dt.Columns.Remove("AF_SUM1");
                dt.Columns.Remove("AF_SUM2");
                for (int i = 1; i <= 2; i++)
                {
                    dt.Columns.Remove("OF" + i + "_SUM1");
                    dt.Columns.Remove("OF" + i + "_SUM2");
                }
                dt.Columns.Remove("OF_SUM1");
                dt.Columns.Remove("OF_SUM2");
                for (int i = 1; i <= 2; i++)
                {
                    dt.Columns.Remove("ZF" + i + "_SUM1");
                    dt.Columns.Remove("ZF" + i + "_SUM2");
                }
                dt.Columns.Remove("ZF_SUM1");
                dt.Columns.Remove("ZF_SUM2");

                dt.Columns.Remove("CFD_SUM1");
                dt.Columns.Remove("CFD_SUM2");


                dt.Columns.Remove("BATCH_NO");
                //dt.Columns.Remove("SUM_ZF");
                //排序
                dt.DefaultView.Sort = " RECORD_TIME ASC,DATA_TYPE DESC ";
                dt = dt.DefaultView.ToTable();

                string saveFileName = "";

                SpreadsheetInfo.SetLicense("EQU2-1000-0000-000U");
                //存放于服务器
                ExcelFile excelFile = new ExcelFile();
                string file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\矿石投料1280.xls";
                excelFile.LoadXls(file);
                ExcelWorksheet sheet = excelFile.Worksheets[0];

                //普通的单元格式
                CellStyle tmpStyle = new CellStyle();
                //tmpStyle.Font.Weight = ExcelFont.BoldWeight;
                tmpStyle.Font.Color = System.Drawing.Color.Black;
                tmpStyle.WrapText = true;
                tmpStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

                //时间单元格式
                CellStyle timeStyle = new CellStyle();
                timeStyle.HorizontalAlignment = HorizontalAlignmentStyle.Right;
                timeStyle.NumberFormat = "hh:mm";
                timeStyle.Font.Color = System.Drawing.Color.Black;
                timeStyle.WrapText = true;
                timeStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

                //合并单元格式
                CellStyle mergeStyle = new CellStyle();
                //设置水平对齐模式
                mergeStyle.HorizontalAlignment = HorizontalAlignmentStyle.Center;
                //设置垂直对齐模式
                mergeStyle.VerticalAlignment = VerticalAlignmentStyle.Center;
                mergeStyle.Font.Color = System.Drawing.Color.Black;
                mergeStyle.WrapText = true;
                mergeStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

                //时间合并单元格式
                CellStyle mergeTimeStyle = new CellStyle();
                mergeTimeStyle.NumberFormat = "hh:mm";
                mergeTimeStyle.HorizontalAlignment = HorizontalAlignmentStyle.Center;
                mergeTimeStyle.VerticalAlignment = VerticalAlignmentStyle.Center;
                mergeTimeStyle.Font.Color = System.Drawing.Color.Black;
                mergeTimeStyle.WrapText = true;
                mergeTimeStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

                DateTime dtLast = DateTime.Now; //上个时间 判断是否合并
                int index = 2; //行索引
                //上个班次 数据模式1 数据模式2
                string strShiftLast = "", strType1 = dt.Rows[0]["DATA_TYPE"].ToString(), strType2 = "", strValue = "";
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    //检查新的班次
                    string strShiftNow = dt.Rows[i]["BC"].ToString();
                    if (!strShiftNow.Equals(strShiftLast))
                    {
                        sheet.Cells[index, 0].Value = strShiftNow;
                        sheet.Cells[index, 0].Style = tmpStyle;
                        sheet.Cells.GetSubrangeAbsolute(index, 1, index, 28).Merged = true;
                        sheet.Cells[index, 1].Style = mergeStyle;
                        index++;
                    }
                    DateTime dtNow = DateTime.Parse(dt.Rows[i]["RECORD_TIME"].ToString());
                    sheet.Cells[index, 0].Value = dtNow;
                    sheet.Cells[index, 0].Style = timeStyle;

                    sheet.Cells[index, 1].Value = dt.Rows[i]["BC"].ToString();
                    sheet.Cells[index, 1].Style = tmpStyle;

                    sheet.Cells[index, 2].Value = dt.Rows[i]["ORE_NAME"].ToString();
                    sheet.Cells[index, 2].Style = tmpStyle;

                    sheet.Cells[index, 3].Value = dt.Rows[i]["CHARGE_NO"].ToString();
                    sheet.Cells[index, 3].Style = tmpStyle;

                    sheet.Cells[index, 23].Value = dt.Rows[i]["CHARGE_ORE_FLAG"].ToString();
                    sheet.Cells[index, 23].Style = tmpStyle;

                    if (dtNow == dtLast)
                    {
                        //合并
                        sheet.Cells.GetSubrangeAbsolute(index - 1, 0, index, 0).Merged = true;
                        sheet.Cells[index - 1, 0].Style = mergeTimeStyle;
                        for (int j = 1; j < 4; j++)
                        {
                            sheet.Cells.GetSubrangeAbsolute(index - 1, j, index, j).Merged = true;
                            sheet.Cells[index - 1, j].Style = mergeStyle;
                        }
                        //保存数据模式
                        strType1 = dt.Rows[i - 1]["DATA_TYPE"].ToString();
                        strType2 = dt.Rows[i]["DATA_TYPE"].ToString();
                    }

                    sheet.Cells[index, 4].Value = dt.Rows[i]["DATA_TYPE"].ToString();
                    sheet.Cells[index, 4].Style = tmpStyle;

                    sheet.Cells[index, 5].Value = dt.Rows[i]["MAT_SUM"].ToString();
                    sheet.Cells[index, 5].Style = tmpStyle;

                    sheet.Cells[index, 6].Value = dt.Rows[i]["SF1_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 6].Style = tmpStyle;

                    sheet.Cells[index, 7].Value = dt.Rows[i]["SF2_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 7].Style = tmpStyle;

                    sheet.Cells[index, 8].Value = dt.Rows[i]["SF3_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 8].Style = tmpStyle;

                    sheet.Cells[index, 9].Value = dt.Rows[i]["SF4_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 9].Style = tmpStyle;

                    sheet.Cells[index, 10].Value = dt.Rows[i]["SF5_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 10].Style = tmpStyle;

                    sheet.Cells[index, 11].Value = dt.Rows[i]["SF6_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 11].Style = tmpStyle;

                    sheet.Cells[index, 12].Value = dt.Rows[i]["SF_SUM"].ToString();
                    sheet.Cells[index, 12].Style = tmpStyle;

                    sheet.Cells[index, 13].Value = dt.Rows[i]["AF1_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 13].Style = tmpStyle;

                    sheet.Cells[index, 14].Value = dt.Rows[i]["AF2_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 14].Style = tmpStyle;

                    sheet.Cells[index, 15].Value = dt.Rows[i]["AF_SUM"].ToString();
                    sheet.Cells[index, 15].Style = tmpStyle;

                    sheet.Cells[index, 16].Value = dt.Rows[i]["OF1_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 16].Style = tmpStyle;

                    sheet.Cells[index, 17].Value = dt.Rows[i]["OF2_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 17].Style = tmpStyle;

                    sheet.Cells[index, 18].Value = dt.Rows[i]["OF_SUM"].ToString();
                    sheet.Cells[index, 18].Style = tmpStyle;

                    sheet.Cells[index, 19].Value = dt.Rows[i]["ZF1_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 19].Style = tmpStyle;

                    sheet.Cells[index, 20].Value = dt.Rows[i]["ZF2_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 20].Style = tmpStyle;

                    sheet.Cells[index, 21].Value = dt.Rows[i]["ZF_SUM"].ToString();
                    sheet.Cells[index, 21].Style = tmpStyle;

                    sheet.Cells[index, 22].Value = dt.Rows[i]["CFD_SET_WEIGHT"].ToString();
                    sheet.Cells[index, 22].Style = tmpStyle;

                    #region 检查合计
                    string strShiftNext = "";
                    if (dt.Rows.Count > i + 1)
                        strShiftNext = dt.Rows[i + 1]["BC"].ToString();
                    else if (dt.Rows.Count == i + 1)
                        strShiftNext = "last";
                    if (!string.IsNullOrEmpty(strShiftNext) && !strShiftNext.Equals(strShiftNow))
                    {
                        index++;
                        strValue = dt.Compute("COUNT(RECORD_TIME)", "BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 0].Value = strShiftNow + "合计(" + strValue + "条)";
                        sheet.Cells[index, 0].Style = tmpStyle;

                        sheet.Cells[index, 1].Style = tmpStyle;
                        sheet.Cells[index, 2].Style = tmpStyle;
                        sheet.Cells[index, 3].Style = tmpStyle;
                        sheet.Cells[index, 23].Style = tmpStyle;

                        sheet.Cells[index, 4].Value = strType1;
                        sheet.Cells[index, 4].Style = tmpStyle;

                        strValue = dt.Compute("SUM(MAT_SUM)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 5].Value = strValue;
                        sheet.Cells[index, 5].Style = tmpStyle;

                        strValue = dt.Compute("SUM(SF1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 6].Value = strValue;
                        sheet.Cells[index, 6].Style = tmpStyle;

                        strValue = dt.Compute("SUM(SF2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 7].Value = strValue;
                        sheet.Cells[index, 7].Style = tmpStyle;

                        strValue = dt.Compute("SUM(SF3_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 8].Value = strValue;
                        sheet.Cells[index, 8].Style = tmpStyle;

                        strValue = dt.Compute("SUM(SF4_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 9].Value = strValue;
                        sheet.Cells[index, 9].Style = tmpStyle;

                        strValue = dt.Compute("SUM(SF5_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 10].Value = strValue;
                        sheet.Cells[index, 10].Style = tmpStyle;

                        strValue = dt.Compute("SUM(SF6_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 11].Value = strValue;
                        sheet.Cells[index, 11].Style = tmpStyle;

                        strValue = dt.Compute("SUM(SF_SUM)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 12].Value = strValue;
                        sheet.Cells[index, 12].Style = tmpStyle;

                        strValue = dt.Compute("SUM(AF1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 13].Value = strValue;
                        sheet.Cells[index, 13].Style = tmpStyle;

                        strValue = dt.Compute("SUM(AF2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 14].Value = strValue;
                        sheet.Cells[index, 14].Style = tmpStyle;

                        strValue = dt.Compute("SUM(AF_SUM)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 15].Value = strValue;
                        sheet.Cells[index, 15].Style = tmpStyle;

                        strValue = dt.Compute("SUM(OF1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 16].Value = strValue;
                        sheet.Cells[index, 16].Style = tmpStyle;

                        strValue = dt.Compute("SUM(OF2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 17].Value = strValue;
                        sheet.Cells[index, 17].Style = tmpStyle;

                        strValue = dt.Compute("SUM(OF_SUM)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 18].Value = strValue;
                        sheet.Cells[index, 18].Style = tmpStyle;

                        strValue = dt.Compute("SUM(ZF1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 19].Value = strValue;
                        sheet.Cells[index, 19].Style = tmpStyle;

                        strValue = dt.Compute("SUM(ZF2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 20].Value = strValue;
                        sheet.Cells[index, 20].Style = tmpStyle;

                        strValue = dt.Compute("SUM(ZF_SUM)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 21].Value = strValue;
                        sheet.Cells[index, 21].Style = tmpStyle;

                        strValue = dt.Compute("SUM(CFD_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "' and BC = '" + strShiftNow + "'").ToString();
                        sheet.Cells[index, 22].Value = strValue;
                        sheet.Cells[index, 22].Style = tmpStyle;

                        if (!string.IsNullOrEmpty(strType2))
                        {
                            index++;
                            sheet.Cells[index, 0].Style = tmpStyle;

                            sheet.Cells[index, 1].Style = tmpStyle;
                            sheet.Cells[index, 2].Style = tmpStyle;
                            sheet.Cells[index, 3].Style = tmpStyle;
                            sheet.Cells[index, 23].Style = tmpStyle;
                            for (int k = 0; k < 4; k++)
                            {
                                sheet.Cells.GetSubrangeAbsolute(index - 1, k, index, k).Merged = true;
                                sheet.Cells[index - 1, k].Style = mergeStyle;
                            }

                            sheet.Cells[index, 4].Value = strType2;
                            sheet.Cells[index, 4].Style = tmpStyle;

                            strValue = dt.Compute("SUM(MAT_SUM)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 5].Value = strValue;
                            sheet.Cells[index, 5].Style = tmpStyle;

                            strValue = dt.Compute("SUM(SF1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 6].Value = strValue;
                            sheet.Cells[index, 6].Style = tmpStyle;

                            strValue = dt.Compute("SUM(SF2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 7].Value = strValue;
                            sheet.Cells[index, 7].Style = tmpStyle;

                            strValue = dt.Compute("SUM(SF3_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 8].Value = strValue;
                            sheet.Cells[index, 8].Style = tmpStyle;

                            strValue = dt.Compute("SUM(SF4_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 9].Value = strValue;
                            sheet.Cells[index, 9].Style = tmpStyle;

                            strValue = dt.Compute("SUM(SF5_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 10].Value = strValue;
                            sheet.Cells[index, 10].Style = tmpStyle;

                            strValue = dt.Compute("SUM(SF6_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 11].Value = strValue;
                            sheet.Cells[index, 11].Style = tmpStyle;

                            strValue = dt.Compute("SUM(SF_SUM)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 12].Value = strValue;
                            sheet.Cells[index, 12].Style = tmpStyle;

                            strValue = dt.Compute("SUM(AF1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 13].Value = strValue;
                            sheet.Cells[index, 13].Style = tmpStyle;

                            strValue = dt.Compute("SUM(AF2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 14].Value = strValue;
                            sheet.Cells[index, 14].Style = tmpStyle;

                            strValue = dt.Compute("SUM(AF_SUM)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 15].Value = strValue;
                            sheet.Cells[index, 15].Style = tmpStyle;

                            strValue = dt.Compute("SUM(OF1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 16].Value = strValue;
                            sheet.Cells[index, 16].Style = tmpStyle;

                            strValue = dt.Compute("SUM(OF2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 17].Value = strValue;
                            sheet.Cells[index, 17].Style = tmpStyle;

                            strValue = dt.Compute("SUM(OF_SUM)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 18].Value = strValue;
                            sheet.Cells[index, 18].Style = tmpStyle;

                            strValue = dt.Compute("SUM(ZF1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 19].Value = strValue;
                            sheet.Cells[index, 19].Style = tmpStyle;

                            strValue = dt.Compute("SUM(ZF2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 20].Value = strValue;
                            sheet.Cells[index, 20].Style = tmpStyle;

                            strValue = dt.Compute("SUM(ZF_SUM)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 21].Value = strValue;
                            sheet.Cells[index, 21].Style = tmpStyle;

                            strValue = dt.Compute("SUM(CFD_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "' and BC = '" + strShiftNow + "'").ToString();
                            sheet.Cells[index, 22].Value = strValue;
                            sheet.Cells[index, 22].Style = tmpStyle;
                        }
                    }
                    #endregion
                    strShiftLast = strShiftNow;
                    dtLast = dtNow;
                    index++;
                }
                #region 总计
                strValue = dt.Compute("COUNT(RECORD_TIME)", "TRUE").ToString();
                sheet.Cells[index, 0].Value = "总计(" + strValue + "条)";
                sheet.Cells[index, 0].Style = tmpStyle;

                sheet.Cells[index, 1].Style = tmpStyle;
                sheet.Cells[index, 2].Style = tmpStyle;
                sheet.Cells[index, 3].Style = tmpStyle;
                sheet.Cells[index, 23].Style = tmpStyle;

                sheet.Cells[index, 4].Value = strType1;
                sheet.Cells[index, 4].Style = tmpStyle;

                strValue = dt.Compute("SUM(MAT_SUM)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 5].Value = strValue;
                sheet.Cells[index, 5].Style = tmpStyle;

                strValue = dt.Compute("SUM(SF1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 6].Value = strValue;
                sheet.Cells[index, 6].Style = tmpStyle;

                strValue = dt.Compute("SUM(SF2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 7].Value = strValue;
                sheet.Cells[index, 7].Style = tmpStyle;

                strValue = dt.Compute("SUM(SF3_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 8].Value = strValue;
                sheet.Cells[index, 8].Style = tmpStyle;

                strValue = dt.Compute("SUM(SF4_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 9].Value = strValue;
                sheet.Cells[index, 9].Style = tmpStyle;

                strValue = dt.Compute("SUM(SF5_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 10].Value = strValue;
                sheet.Cells[index, 10].Style = tmpStyle;

                strValue = dt.Compute("SUM(SF6_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 11].Value = strValue;
                sheet.Cells[index, 11].Style = tmpStyle;

                strValue = dt.Compute("SUM(SF_SUM)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 12].Value = strValue;
                sheet.Cells[index, 12].Style = tmpStyle;

                strValue = dt.Compute("SUM(AF1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 13].Value = strValue;
                sheet.Cells[index, 13].Style = tmpStyle;

                strValue = dt.Compute("SUM(AF2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 14].Value = strValue;
                sheet.Cells[index, 14].Style = tmpStyle;

                strValue = dt.Compute("SUM(AF_SUM)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 15].Value = strValue;
                sheet.Cells[index, 15].Style = tmpStyle;

                strValue = dt.Compute("SUM(OF1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 16].Value = strValue;
                sheet.Cells[index, 16].Style = tmpStyle;

                strValue = dt.Compute("SUM(OF2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 17].Value = strValue;
                sheet.Cells[index, 17].Style = tmpStyle;

                strValue = dt.Compute("SUM(OF_SUM)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 18].Value = strValue;
                sheet.Cells[index, 18].Style = tmpStyle;

                strValue = dt.Compute("SUM(ZF1_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 19].Value = strValue;
                sheet.Cells[index, 19].Style = tmpStyle;

                strValue = dt.Compute("SUM(ZF2_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 20].Value = strValue;
                sheet.Cells[index, 20].Style = tmpStyle;

                strValue = dt.Compute("SUM(ZF_SUM)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 21].Value = strValue;
                sheet.Cells[index, 21].Style = tmpStyle;

                strValue = dt.Compute("SUM(CFD_SET_WEIGHT)", "DATA_TYPE='" + strType1 + "'").ToString();
                sheet.Cells[index, 22].Value = strValue;
                sheet.Cells[index, 22].Style = tmpStyle;


                if (!string.IsNullOrEmpty(strType2))
                {
                    index++;
                    sheet.Cells[index, 0].Style = tmpStyle;

                    sheet.Cells[index, 1].Style = tmpStyle;
                    sheet.Cells[index, 2].Style = tmpStyle;
                    sheet.Cells[index, 3].Style = tmpStyle;
                    sheet.Cells[index, 23].Style = tmpStyle;
                    for (int k = 0; k < 4; k++)
                    {
                        sheet.Cells.GetSubrangeAbsolute(index - 1, k, index, k).Merged = true;
                        sheet.Cells[index - 1, k].Style = mergeStyle;
                    }

                    sheet.Cells[index, 4].Value = strType2;
                    sheet.Cells[index, 4].Style = tmpStyle;

                    strValue = dt.Compute("SUM(MAT_SUM)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 5].Value = strValue;
                    sheet.Cells[index, 5].Style = tmpStyle;

                    strValue = dt.Compute("SUM(SF1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 6].Value = strValue;
                    sheet.Cells[index, 6].Style = tmpStyle;

                    strValue = dt.Compute("SUM(SF2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 7].Value = strValue;
                    sheet.Cells[index, 7].Style = tmpStyle;

                    strValue = dt.Compute("SUM(SF3_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 8].Value = strValue;
                    sheet.Cells[index, 8].Style = tmpStyle;

                    strValue = dt.Compute("SUM(SF4_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 9].Value = strValue;
                    sheet.Cells[index, 9].Style = tmpStyle;

                    strValue = dt.Compute("SUM(SF5_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 10].Value = strValue;
                    sheet.Cells[index, 10].Style = tmpStyle;

                    strValue = dt.Compute("SUM(SF6_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 11].Value = strValue;
                    sheet.Cells[index, 11].Style = tmpStyle;

                    strValue = dt.Compute("SUM(SF_SUM)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 12].Value = strValue;
                    sheet.Cells[index, 12].Style = tmpStyle;

                    strValue = dt.Compute("SUM(AF1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 13].Value = strValue;
                    sheet.Cells[index, 13].Style = tmpStyle;

                    strValue = dt.Compute("SUM(AF2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 14].Value = strValue;
                    sheet.Cells[index, 14].Style = tmpStyle;

                    strValue = dt.Compute("SUM(AF_SUM)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 15].Value = strValue;
                    sheet.Cells[index, 15].Style = tmpStyle;

                    strValue = dt.Compute("SUM(OF1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 16].Value = strValue;
                    sheet.Cells[index, 16].Style = tmpStyle;

                    strValue = dt.Compute("SUM(OF2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 17].Value = strValue;
                    sheet.Cells[index, 17].Style = tmpStyle;

                    strValue = dt.Compute("SUM(OF_SUM)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 18].Value = strValue;
                    sheet.Cells[index, 18].Style = tmpStyle;

                    strValue = dt.Compute("SUM(ZF1_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 19].Value = strValue;
                    sheet.Cells[index, 19].Style = tmpStyle;

                    strValue = dt.Compute("SUM(ZF2_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 20].Value = strValue;
                    sheet.Cells[index, 20].Style = tmpStyle;

                    strValue = dt.Compute("SUM(ZF_SUM)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 21].Value = strValue;
                    sheet.Cells[index, 21].Style = tmpStyle;

                    strValue = dt.Compute("SUM(CFD_SET_WEIGHT)", "DATA_TYPE='" + strType2 + "'").ToString();
                    sheet.Cells[index, 22].Value = strValue;
                    sheet.Cells[index, 22].Style = tmpStyle;

                }
                #endregion

                saveFileName = file.Substring(0, file.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";

                FileInfo TargetFile = new FileInfo(saveFileName);
                excelFile.SaveXls(saveFileName);

                string strTime = DateTime.Now.ToString("yyyyMMddHHmmss");
                //清除缓冲区流中的所有内容输出.
                Page.Response.Clear();
                //向输出流添加HTTP头 [指定下载/保存 对话框的文件名]
                Page.Response.AppendHeader("Content-Disposition", "attachment; filename=" + Page.Server.UrlEncode("矿石投料_" + strTime + ".xls"));
                //向输出流添加HTTP头 [指定文件的长度,这样下载文件就会显示正确的进度
                Page.Response.AppendHeader("Content-Length", TargetFile.Length.ToString());
                //表明输出的HTTP为流[stream],因此客户端只能下载.
                Page.Response.ContentType = "application/octet-stream";
                //发送文件流到客户端.
                Page.Response.WriteFile(TargetFile.FullName);
                //Page.Response.w
                //停止执行当前页
                //TargetFile.Delete();
                Page.Response.Flush();
                TargetFile.Delete();
                Page.Response.End();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>window.alert('" + ex.Message + "');</script>");
            }
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

        protected void gridBase1_CustomCellMerge(object sender, DevExpress.Web.ASPxGridViewCustomCellMergeEventArgs e)
        {
            List<string> lMergeFileds = new List<string> { "RECORD_TIME", "CHARGE_NO", "BB", "ORE_NAME" };
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
    }
}
 