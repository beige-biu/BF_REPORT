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
    public partial class GasDustReve_Rep_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                dateEndTime.Date = DateTime.Now;
            }
            GetData();
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            GetData();
        }

        protected void GetData()
        {
            string strStartTime = "";
            string strEndTime = "";
            strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            strSQL = "select a.*,0 as FC_CXSJ from l2bf_db.DAY_FC   a where a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            strSQL += "order by RECORD_TIME asc";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            string fc_start, fc_end;
            double FC_CXSJ;
            DateTime T1, T2;
            System.TimeSpan ts;
            foreach (DataRow dr in dt.Rows)
            {
                try
                {
                    fc_start = dr["fc_start"].ToString();
                    fc_end = dr["fc_end"].ToString();
                    if (fc_start != "" && fc_end != "")
                    {
                        T1 = DateTime.Parse(fc_start);
                        T2 = DateTime.Parse(fc_end);
                        ts = T2.Subtract(T1);
                        FC_CXSJ = ts.TotalMinutes;
                        dr["FC_CXSJ"] = FC_CXSJ.ToString("N2");
                    }
                }
                catch { }
            }
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            GetData();
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