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
    public partial class Hopper_sum_shift_Rep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                dateEndTime.Date = DateTime.Now;
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
            string strStartTime = "";
            string strEndTime = "";
            strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            strSQL = "  select RECORD_TIME,WORK_SHIFT,WORK_TEAM,ROUND(WEIGHT_SUM_01/1000,2) AS WEIGHT_SUM_01,ROUND(WEIGHT_SUM_02/1000,2) AS WEIGHT_SUM_02,ROUND(WEIGHT_SUM_03/1000,2) AS WEIGHT_SUM_03,ROUND(WEIGHT_SUM_04/1000,2) AS WEIGHT_SUM_04,ROUND(WEIGHT_SUM_05/1000,2) AS WEIGHT_SUM_05,ROUND(WEIGHT_SUM_06/1000,2) AS WEIGHT_SUM_06,ROUND(WEIGHT_SUM_07/1000,2) AS WEIGHT_SUM_07,ROUND(WEIGHT_SUM_08/1000,2) AS WEIGHT_SUM_08,ROUND(WEIGHT_SUM_09/1000,2) AS WEIGHT_SUM_09,ROUND(WEIGHT_SUM_10/1000,2) AS WEIGHT_SUM_10,ROUND(WEIGHT_SUM_11/1000,2) AS WEIGHT_SUM_11,ROUND(WEIGHT_SUM_12/1000,2) AS WEIGHT_SUM_12,ROUND(WEIGHT_SUM_13/1000,2) AS WEIGHT_SUM_13,ROUND(WEIGHT_SUM_14/1000,2) AS WEIGHT_SUM_14,ROUND(WEIGHT_SUM_15/1000,2) AS WEIGHT_SUM_15,ROUND(WEIGHT_SUM_16/1000,2) AS WEIGHT_SUM_16,ROUND(WEIGHT_SUM_17/1000,2) AS WEIGHT_SUM_17,ROUND(WEIGHT_SUM_18/1000,2) AS WEIGHT_SUM_18,ROUND(WEIGHT_SUM_21/1000,2) AS WEIGHT_SUM_21,ROUND(WEIGHT_SUM_22/1000,2) AS WEIGHT_SUM_22,ROUND(WEIGHT_SUM_23/1000,2) AS WEIGHT_SUM_23,ROUND(WEIGHT_SUM_24/1000,2) AS WEIGHT_SUM_24,ROUND(WEIGHT_SUM_25/1000,2) AS WEIGHT_SUM_25,ROUND(WEIGHT_SUM_26/1000,2) AS WEIGHT_SUM_26,ROUND(WEIGHT_SUM_27/1000,2) AS WEIGHT_SUM_27,ROUND(WEIGHT_SUM_SJ/1000,2) AS WEIGHT_SUM_SJ,ROUND(WEIGHT_SUM_QT/1000,2) AS WEIGHT_SUM_QT,ROUND(WEIGHT_SUM_KK/1000,2) AS WEIGHT_SUM_KK,ROUND(WEIGHT_SUM_ZK/1000,2) AS WEIGHT_SUM_ZK,ROUND(WEIGHT_SUM_JD/1000,2) AS WEIGHT_SUM_JD,ROUND(WEIGHT_SUM_JD_WG/1000,2) AS WEIGHT_SUM_JD_WG,ROUND(WEIGHT_SUM_JT/1000,2) AS WEIGHT_SUM_JT from T_RPT_HOPPER_SUM_DAY t where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 0)
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