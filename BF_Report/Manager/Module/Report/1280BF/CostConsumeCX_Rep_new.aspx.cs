using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using GemBox.ExcelLite;
using GemBox.Spreadsheet;
using System.IO;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._1280BF
{
    public partial class CostConsumeCX_Rep_new : System.Web.UI.Page
    {
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                cbbType.SelectedIndex = 2;
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                
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
            
            gridBase1.Columns["gbc3"].Caption = "日期:" + dateStartTime.Date.ToString("yyyy-MM-dd");
             string date1 = dateStartTime.Date.ToString("yyyy-MM-dd");
            //要在这个地方判断
            switch (cbbType.SelectedIndex)
            {
                case 1:
                    gridBase1.Columns["gbc4"].Caption = "2#高炉成本报表";
                    gridBase1.Columns["gbc5"].Caption = "R61-047/1-03";
                    break;
                case 2:
                    gridBase1.Columns["gbc4"].Caption = "3#高炉成本报表";
                    gridBase1.Columns["gbc5"].Caption = "R61-047/1-03";
                    break;
                default:
                    gridBase1.Columns["gbc4"].Caption = "1#高炉成本报表";
                    gridBase1.Columns["gbc5"].Caption = "R61-047/1-03";
                   
                    break;
            }

            
            
            //获取cbbType的值
            string cbbvalue = cbbType.Value.ToString();
            //根据时间和cbbType的值来查询本日产量和本月产量
            string brcl = "";
            string bycl = "";
            //查询本日产量和本月产量
            string brclSQL = "select day_cost_per,mon_cost_per from L2BF_COM.T_COSTM_MONTHLY_COST where COST_TITLE ='产量' ";
            brclSQL += "and PLANT_CODE = '"+cbbvalue;
            brclSQL += "'   and  US_DT= '"+date1+"' ";
            DataTable dtcl = new DataTable();
            SQLComm.ExecuteSelectSql_dt(brclSQL, ref dtcl);
            //表不为空，表示当天有产量
            if (dtcl.Rows.Count>0)
            {
                brcl = dtcl.Rows[0]["DAY_COST_PER"].ToString();
                bycl = dtcl.Rows[0]["MON_COST_PER"].ToString();
            }
          
            gridBase1.Columns["gbc1"].Caption = "本日产量(t):" + brcl;
            gridBase1.Columns["gbc2"].Caption = "本月产量(t):" + bycl;

            //根据时间和cbbtype的value值来查询
            string strSQL = "select distinct * from L2BF_COM.T_COSTM_MONTHLY_COST where COST_TITLE <>'产量'and US_DT= '" + date1;
            strSQL += "' and PLANT_CODE='"+ cbbvalue+"'";
            strSQL += " order by SORT_ID asc";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 150;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
        }



        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            GetData(SQLComm.strHeight);
            //ExpGrid.WriteXlsToResponse(new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
            //判断是哪个炉子

            string saveFileName = "";
            try
            {
                SpreadsheetInfo.SetLicense("EQU2-1000-0000-000U");
                //存放于服务器
                ExcelFile excelFile = new ExcelFile();
                string file;
                string glName;
                if (cbbType.Value.ToString() == "T6")
                {
                    glName = "1#";
                    file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\炼铁分厂1号高炉槽上成本日报表.xls";
                    excelFile.LoadXls(file);
                }
                else if (cbbType.Value.ToString() == "T7")
                {
                    glName = "2#";
                    file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\炼铁分厂1号高炉槽上成本日报表.xls";
                    excelFile.LoadXls(file);
                }
                else {
                    glName = "3#";
                    file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\炼铁分厂1号高炉槽上成本日报表.xls";
                    excelFile.LoadXls(file);
                }
                
                //string file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\一炼铁分厂2#高炉日工序生产成本表.xls";
                //ExcelFile excelFile = new ExcelFile(file);
                ExcelWorksheet sheet = excelFile.Worksheets[0];
                sheet.Cells[0, 0].Value = "炼铁分厂" + DateTime.Parse(dateStartTime.Text.ToString()).ToString("yyyy年MM月dd日") +glName+ "高炉成本报表";
                DataTable dt = (DataTable)gridBase1.DataSource;
                string strIronDay = gridBase1.Columns["gbc1"].Caption.Substring(8);
                string strIronMonth = gridBase1.Columns["gbc2"].Caption.Substring(8);
                sheet.Cells[1, 4].Value = double.Parse(strIronDay);
                sheet.Cells[1, 7].Value = double.Parse(strIronMonth);

                CellStyle tmpStyle = new CellStyle();
                //tmpStyle.Font.Weight = ExcelFont.BoldWeight;
                tmpStyle.Font.Color = System.Drawing.Color.Black;
                tmpStyle.WrapText = true;
                tmpStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sheet.Cells[4 + i, 0].Value = dt.Rows[i]["COST_TITLE"].ToString();
                    sheet.Cells[4 + i, 0].Style = tmpStyle;

                    sheet.Cells[4 + i, 1].Value = dt.Rows[i]["UNIT"].ToString();
                    sheet.Cells[4 + i, 1].Style = tmpStyle;




                    if (SQLComm.IsNumberic(dt.Rows[i]["PRICE"].ToString()))
                    {
                        sheet.Cells[4 + i, 2].Value = double.Parse(dt.Rows[i]["PRICE"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 2].Value = dt.Rows[i]["PRICE"].ToString();

                    }
                    sheet.Cells[4 + i, 2].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["WATER_PER"].ToString()))
                    {
                        sheet.Cells[4 + i, 3].Value = double.Parse(dt.Rows[i]["WATER_PER"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 3].Value = dt.Rows[i]["WATER_PER"].ToString();

                    }
                    sheet.Cells[4 + i, 3].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["DAY_WET"].ToString()))
                    {
                        sheet.Cells[4 + i, 4].Value = double.Parse(dt.Rows[i]["DAY_WET"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 4].Value = dt.Rows[i]["DAY_WET"].ToString();

                    }
                    sheet.Cells[4 + i, 4].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["DAY_DRY"].ToString()))
                    {
                        sheet.Cells[4 + i, 5].Value = double.Parse(dt.Rows[i]["DAY_DRY"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 5].Value = dt.Rows[i]["DAY_DRY"].ToString();

                    }
                    sheet.Cells[4 + i, 5].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["DAY_COST"].ToString()))
                    {
                        sheet.Cells[4 + i, 6].Value = double.Parse(dt.Rows[i]["DAY_COST"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 6].Value = dt.Rows[i]["DAY_COST"].ToString();

                    }
                    sheet.Cells[4 + i, 6].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["DAY_PER"].ToString()))
                    {
                        sheet.Cells[4 + i, 7].Value = double.Parse(dt.Rows[i]["DAY_PER"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 7].Value = dt.Rows[i]["DAY_PER"].ToString();

                    }
                    sheet.Cells[4 + i, 7].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["DAY_COST_PER"].ToString()))
                    {
                        sheet.Cells[4 + i, 8].Value = double.Parse(dt.Rows[i]["DAY_COST_PER"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 8].Value = dt.Rows[i]["DAY_COST_PER"].ToString();

                    }
                    sheet.Cells[4 + i, 8].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["MON_WET"].ToString()))
                    {
                        sheet.Cells[4 + i, 9].Value = double.Parse(dt.Rows[i]["MON_WET"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 9].Value = dt.Rows[i]["MON_WET"].ToString();

                    }
                    sheet.Cells[4 + i, 9].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["MON_DRY"].ToString()))
                    {
                        sheet.Cells[4 + i, 10].Value = double.Parse(dt.Rows[i]["MON_DRY"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 10].Value = dt.Rows[i]["MON_DRY"].ToString();

                    }
                    sheet.Cells[4 + i, 10].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["MON_COST"].ToString()))
                    {
                        sheet.Cells[4 + i, 11].Value = double.Parse(dt.Rows[i]["MON_COST"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 11].Value = dt.Rows[i]["MON_COST"].ToString();

                    }
                    sheet.Cells[4 + i, 11].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["MON_PER"].ToString()))
                    {
                        sheet.Cells[4 + i, 12].Value = double.Parse(dt.Rows[i]["MON_PER"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 12].Value = dt.Rows[i]["MON_PER"].ToString();

                    }
                    sheet.Cells[4 + i, 12].Style = tmpStyle;


                    if (SQLComm.IsNumberic(dt.Rows[i]["MON_COST_PER"].ToString()))
                    {
                        sheet.Cells[4 + i, 13].Value = double.Parse(dt.Rows[i]["MON_COST_PER"].ToString());
                    }
                    else
                    {
                        sheet.Cells[4 + i, 13].Value = dt.Rows[i]["MON_COST_PER"].ToString();

                    }
                    sheet.Cells[4 + i, 13].Style = tmpStyle;

                }
                saveFileName = file.Substring(0, file.Length - 4) + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";

                FileInfo TargetFile = new FileInfo(saveFileName);
                excelFile.SaveXls(saveFileName);

                string strTime = DateTime.Now.ToString("yyyyMMddHHmmss");
                //清除缓冲区流中的所有内容输出.
                Page.Response.Clear();
                //向输出流添加HTTP头 [指定下载/保存 对话框的文件名]
                Page.Response.AppendHeader("Content-Disposition", "attachment; filename=" + Page.Server.UrlEncode("炼铁分厂"+glName+"高炉成本报表_" + strTime + ".xls"));
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

        
    }
}