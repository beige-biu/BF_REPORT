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
    public partial class HSChangeDetail_Rep_1 : System.Web.UI.Page
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
            if (cbbType.Value.ToString() == "1")
            {
                strSQL = "select RECORD_TIME";
                strSQL += ",BC ";
                strSQL += ",BB ";
                strSQL += ",HS1_STATUS AS HS_STATUS ";
                strSQL += ",HS1_STATUSCODE AS HS_STATUSCODE ";
                strSQL += ",HS1_STATUSDESC AS HS_STATUSDESC ";
                strSQL += ",HS1_C_TIME AS HS_C_TIME ";
                strSQL += ",HS1_W_TIME AS HS_W_TIME ";
                strSQL += ",HS1_S_TIME AS HS_S_TIME ";
                strSQL += ",HS1_T_INRSQ_BS AS  HS_T_INRSQ_BS ";
                strSQL += ",HS1_T_INRSQ_BE AS   HS_T_INRSQ_BE ";
                strSQL += ",HS1_T_INRSQ_BB AS  HS_T_INRSQ_BB ";
                strSQL += ",HS1_T_BURNROOM_BS AS HS_T_BURNROOM_BS ";
                strSQL += ",HS1_T_BURNROOM_WS AS HS_T_BURNROOM_WS ";
                strSQL += ",HS1_T_SIGRID_S AS HS_T_SIGRID_S ";
                strSQL += ",HS1_T_SIGRID_E AS HS_T_SIGRID_E  ";
                strSQL += ",HS1_T_SI_S AS HS_T_SI_S ";
                strSQL += ",HS1_T_SI_E AS HS_T_SI_E  ";
                strSQL += ",HS1_T_SMOKE_BS AS  HS_T_SMOKE_BS  ";
                strSQL += ",HS1_T_SMOKE_BSMAX AS HS_T_SMOKE_BSMAX ";
                strSQL += ",HS1_T_SMOKE_BSAVG AS HS_T_SMOKE_BSAVG ";
                strSQL += ",HS1_T_SMOKE_BE AS HS_T_SMOKE_BE  ";
                strSQL += ",nvl(HS1_T_SMOKE_BEMAX,0) AS HS_T_SMOKE_BEMAX ";
                strSQL += ",nvl(HS1_T_SMOKE_BEAVG,0) AS HS_T_SMOKE_BEAVG ";
                strSQL += "from l2bf_db.day_hs1_change   WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";


            }
            else if (cbbType.Value.ToString() == "2")
            {
                strSQL = "select RECORD_TIME";
                strSQL += ",BC ";
                strSQL += ",BB ";
                strSQL += ",HS2_STATUS AS HS_STATUS ";
                strSQL += ",HS2_STATUSCODE AS HS_STATUSCODE ";
                strSQL += ",HS2_STATUSDESC AS HS_STATUSDESC ";
                strSQL += ",HS2_C_TIME AS HS_C_TIME ";
                strSQL += ",HS2_W_TIME AS HS_W_TIME ";
                strSQL += ",HS2_S_TIME AS HS_S_TIME ";
                strSQL += ",HS2_T_INRSQ_BS AS  HS_T_INRSQ_BS ";
                strSQL += ",HS2_T_INRSQ_BE AS   HS_T_INRSQ_BE ";
                strSQL += ",HS2_T_INRSQ_BB AS  HS_T_INRSQ_BB ";
                strSQL += ",HS2_T_BURNROOM_BS AS HS_T_BURNROOM_BS ";
                strSQL += ",HS2_T_BURNROOM_WS AS HS_T_BURNROOM_WS ";
                strSQL += ",HS2_T_SIGRID_S AS HS_T_SIGRID_S ";
                strSQL += ",HS2_T_SIGRID_E AS HS_T_SIGRID_E  ";
                strSQL += ",HS2_T_SI_S AS HS_T_SI_S ";
                strSQL += ",HS2_T_SI_E AS HS_T_SI_E  ";
                strSQL += ",HS2_T_SMOKE_BS AS  HS_T_SMOKE_BS  ";
                strSQL += ",HS2_T_SMOKE_BSMAX AS HS_T_SMOKE_BSMAX ";
                strSQL += ",HS2_T_SMOKE_BSAVG AS HS_T_SMOKE_BSAVG ";
                strSQL += ",HS2_T_SMOKE_BE AS HS_T_SMOKE_BE  ";
                strSQL += ",nvl(HS2_T_SMOKE_BEMAX,0) AS HS_T_SMOKE_BEMAX ";
                strSQL += ",nvl(HS2_T_SMOKE_BEAVG,0) AS HS_T_SMOKE_BEAVG ";
                strSQL += "from l2bf_db.day_HS2_change   WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
                
            }
            else
            {
                strSQL = "select RECORD_TIME";
                strSQL += ",BC ";
                strSQL += ",BB ";
                strSQL += ",HS3_STATUS AS HS_STATUS ";
                strSQL += ",HS3_STATUSCODE AS HS_STATUSCODE ";
                strSQL += ",HS3_STATUSDESC AS HS_STATUSDESC ";
                strSQL += ",HS3_C_TIME AS HS_C_TIME ";
                strSQL += ",HS3_W_TIME AS HS_W_TIME ";
                strSQL += ",HS3_S_TIME AS HS_S_TIME ";
                strSQL += ",HS3_T_INRSQ_BS AS  HS_T_INRSQ_BS ";
                strSQL += ",HS3_T_INRSQ_BE AS   HS_T_INRSQ_BE ";
                strSQL += ",HS3_T_INRSQ_BB AS  HS_T_INRSQ_BB ";
                strSQL += ",HS3_T_BURNROOM_BS AS HS_T_BURNROOM_BS ";
                strSQL += ",HS3_T_BURNROOM_WS AS HS_T_BURNROOM_WS ";
                strSQL += ",HS3_T_SIGRID_S AS HS_T_SIGRID_S ";
                strSQL += ",HS3_T_SIGRID_E AS HS_T_SIGRID_E  ";
                strSQL += ",HS3_T_SI_S AS HS_T_SI_S ";
                strSQL += ",HS3_T_SI_E AS HS_T_SI_E  ";
                strSQL += ",HS3_T_SMOKE_BS AS  HS_T_SMOKE_BS  ";
                strSQL += ",HS3_T_SMOKE_BSMAX AS HS_T_SMOKE_BSMAX ";
                strSQL += ",HS3_T_SMOKE_BSAVG AS HS_T_SMOKE_BSAVG ";
                strSQL += ",HS3_T_SMOKE_BE AS HS_T_SMOKE_BE  ";
                strSQL += ",nvl(HS3_T_SMOKE_BEMAX,0) AS HS_T_SMOKE_BEMAX ";
                strSQL += ",nvl(HS3_T_SMOKE_BEAVG,0） AS HS_T_SMOKE_BEAVG ";
                strSQL += "from l2bf_db.day_HS3_change   WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
               
            }
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();

            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 185;
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