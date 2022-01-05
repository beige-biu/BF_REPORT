using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._3200BF
{
    public partial class ProdIndex_Rep_3 : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
            string strEndTime = dateEndTime.Text.ToString();
            string strSQL = "";
            strSQL = "select PROD_DATE,YIELD,COEF,SMELTING_STRENGTH,COLL_COKE_RATE,DRY_COKE_RATE, ";
            strSQL += "DRY_COKE_RATE_L1,DRY_COKE_RATE_BATCH,COAL_RATE,OXYG_RATE,FIRST_CLASS_RATE, ";
            strSQL += "MINE_CONSUME,FUEL_CONSUME,L04_RATE,L08_RATE,L10_RATE,DELAY_RATE,DELAY_TIME, ";
            strSQL += "IRON_FIT_RATE,OUTDREG_RATE,GAS_H2,GAS_CO2,GAS_CO,GAS_N2,GAS_CH4,SILICON_DEVIATION ";
            strSQL += "from FL2_TB_PROD_TECH_ECON_TARGET t ";
            strSQL += "where to_date(PROD_DATE,'yyyy-MM-dd') between to_date('" + strStartTime + "', 'yyyy-MM-dd') and to_date('" + strEndTime + "', 'yyyy-MM-dd') ";
            strSQL += "order by PROD_DATE asc";

            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
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