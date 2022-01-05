using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._1280BF
{
    public partial class CrossTemp_Rep_1 : System.Web.UI.Page
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
            GetData(SQLComm.strHeight); ;
        }

        protected void GetData(string strHeight)
        {
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            if (cbbType.Value.ToString() == "1")//东北与西南
            {                
                gridBase1.Columns["TitleName1"].Visible = true;
                gridBase1.Columns["TitleName2"].Visible = true;
                gridBase1.Columns["TitleName3"].Visible = true;
                gridBase1.Columns["TitleName4"].Visible = false;
                gridBase1.Columns["TitleName5"].Visible = false;
                strSQL = "select RECORD_TIME,BC,BB,TE1417 as TE1317,TE1416 as TE1316,TE1415 as TE1315,TE1414 as TE1314,TE1401 as TE1301,";
                strSQL += "TE1406 as TE1306,TE1407 as TE1307,TE1408 as TE1308,TE1409 as TE1309 ";
                strSQL += "from l2bf_db.day_tenmeasure  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('"+ strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " order by RECORD_TIME asc";

            }
            else
            {
                gridBase1.Columns["TitleName1"].Visible = false;
                gridBase1.Columns["TitleName3"].Visible = false;
                gridBase1.Columns["TitleName4"].Visible = true;
                gridBase1.Columns["TitleName2"].Visible = true;
                gridBase1.Columns["TitleName5"].Visible = true;
                strSQL = "select RECORD_TIME,BC,BB,TE1405 as TE1305,TE1404 as TE1304,TE1403 as TE1303,TE1402 as TE1302,TE1401 as TE1301,";
                strSQL += "TE1410 as TE1310,TE1800 as TE1311,TE1412 as TE1312,TE1413 as TE1313 ";
                strSQL += "from l2bf_db.day_tenmeasure  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " order by RECORD_TIME asc";
            }
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            
            if (dt.Rows.Count > 18)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 150;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
            gridBase1.ExpandAll();
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            GetData(SQLComm.strHeight);
            ExpGrid.WriteXlsToResponse(new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
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