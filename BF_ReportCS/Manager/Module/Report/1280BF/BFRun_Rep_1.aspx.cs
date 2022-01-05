using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;
using GemBox.ExcelLite;
using System.IO;

namespace BF_ReportCS.Manager.Module.Report._1280BF
{
    public partial class BFRun_Rep_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
            }
            GetData();
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            GetData();
        }

        protected void GetData()
        {
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            //假数据修改
            //if (Convert.ToDateTime(strStartTime) <= Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = "select a.*,(RICH_OXY_AMOUNT-R_LG_ACTIVE) as RICH_OXY_AMOUNT from l2bf_db.day_handlepara_falii a where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            //    strSQL += " order by RECORD_TIME asc";


            //}
            //else if (Convert.ToDateTime(strStartTime) > Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = "select a.*,(RICH_OXY_AMOUNT-R_LG_ACTIVE) as RICH_OXY_AMOUNT from l2bf_db.day_handlepara a where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            //    strSQL += " order by RECORD_TIME asc";
            //}
            //原始代码
            strSQL = "select a.*,(RICH_OXY_AMOUNT-R_LG_ACTIVE) as RICH_OXY_AMOUNT from l2bf_db.day_handlepara a where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            strSQL += " order by RECORD_TIME asc";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            GetData();
            ExpGrid.WriteXlsxToResponse();
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