using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._1500BF
{
    public partial class CrossTemp_Rep : System.Web.UI.Page
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
            if (cbbType.Value.ToString() == "1")//东北与西南
            {                
                gridBase1.Columns["TitleName1"].Caption = "东北十字测温";
                gridBase1.Columns["TitleName3"].Caption = "西南十字测温";
                strSQL = "select RECORD_TIME,WORK_TEAM,WORK_SHIFT,TE1337 as FIELD_0,TE1338 as FIELD_1,TE1339 as FIELD_2,TE1340 as FIELD_3,TE1341 as FIELD_4,TE1346 as FIELD_5,";
                strSQL += "TE1351 as FIELD_6,TE1350 as FIELD_7,TE1349 as FIELD_8,TE1348 as FIELD_9,TE1347 as FIELD_10 ";
                strSQL += "from T_RPT_CROSS_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('"+ strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
            }
            else
            {
                gridBase1.Columns["TitleName1"].Caption = "西北十字测温";
                gridBase1.Columns["TitleName3"].Caption = "东南十字测温";
                strSQL = "select RECORD_TIME,WORK_TEAM,WORK_SHIFT,TE1336 as FIELD_0,TE1342 as FIELD_1,TE1343 as FIELD_2,TE1344 as FIELD_3,TE1345 as FIELD_4,TE1346 as FIELD_5,";
                strSQL += "TE1335 as FIELD_6,TE1334 as FIELD_7,TE1333 as FIELD_8,TE1332 as FIELD_9,TE1331 as FIELD_10 ";
                strSQL += "from T_RPT_CROSS_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
            }
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 200;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
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