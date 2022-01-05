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
    public partial class HSDay_Rep : System.Web.UI.Page
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
                //ASPxPageControl1.TabPages[0].Text = "1#热风炉生产日报";
                strSQL = "     SELECT RECORD_TIME,";
                strSQL += "WORK_SHIFT,";
                strSQL += "WORK_TEAM,";
                strSQL += "F_COLDWIND,";
                strSQL += "P_COLDWIND,";
                strSQL += "T_COLDWIND,";
                strSQL += "S_COLDWIND,";
                strSQL += "T_HOTWIND1,";
                strSQL += "T_HOTWIND2,";
                strSQL += "R_THEORY_KRB,";
                strSQL += "R_KRB,";
                strSQL += "HS1_P_VAULT AS HS_P_VAULT,";
                strSQL += "HS1_P_IN AS HS_P_IN,";
                strSQL += "HS1_F_AIR AS HS_F_AIR,";
                strSQL += "HS1_F_GAS AS HS_F_GAS,";
                strSQL += "HS1_R_FIRE AS HS_R_FIRE,";
                strSQL += "HS1_O2_INSOMKE AS HS_O2_INSOMKE,";
                strSQL += "HS1_T_INRSQ AS HS_T_INRSQ,";
                strSQL += "HS1_T_HWBURNROOM AS HS_T_HWBURNROOM,";
                strSQL += "HS1_T_BRUNROOM AS HS_T_BRUNROOM,";
                strSQL += "HS1_T_SIGRID AS HS_T_SIGRID,";
                strSQL += "HS1_T_SI AS HS_T_SI,";
                strSQL += "HS1_T_SMOKE AS HS_T_SMOKE,";
                strSQL += "HS1_T_LP1 AS HS_T_LP1,";
                strSQL += "HS1_T_LP2 AS HS_T_LP2,";
                strSQL += "HS1_T_LP3 AS HS_T_LP3,";
                strSQL += "HS1_T_LBZ AS HS_T_LBZ,";
                strSQL += "HS1_R_KRB AS HS_R_KRB,";
                strSQL += "HS1_STATUS AS HS_STATUS,";
                strSQL += "HS1_STATUS_DES AS HS_STATUS_DES,T_GAS_INLET,T_GAS_OUTLET,T_AIR_INLET,T_AIR_OUTLET,T_SMOKE_INLET,T_SMOKE_AIR_OUTLET,T_SMOKE_GAS_OUTLET ";
                strSQL += " FROM T_RPT_HS    ";
                strSQL += " WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
                strSQL += " ORDER BY RECORD_TIME ASC";
            }
            else if (cbbType.Value.ToString() == "2")
            {
                //ASPxPageControl1.TabPages[0].Text = "2#热风炉生产日报";
                strSQL = "     SELECT RECORD_TIME,";
                strSQL += "WORK_SHIFT,";
                strSQL += "WORK_TEAM,";
                strSQL += "F_COLDWIND,";
                strSQL += "P_COLDWIND,";
                strSQL += "T_COLDWIND,";
                strSQL += "S_COLDWIND,";
                strSQL += "T_HOTWIND1,";
                strSQL += "T_HOTWIND2,";
                strSQL += "R_THEORY_KRB,";
                strSQL += "R_KRB,";
                strSQL += "HS2_P_VAULT AS HS_P_VAULT,";
                strSQL += "HS2_P_IN AS HS_P_IN,";
                strSQL += "HS2_F_AIR AS HS_F_AIR,";
                strSQL += "HS2_F_GAS AS HS_F_GAS,";
                strSQL += "HS2_R_FIRE AS HS_R_FIRE,";
                strSQL += "HS2_O2_INSOMKE AS HS_O2_INSOMKE,";
                strSQL += "HS2_T_INRSQ AS HS_T_INRSQ,";
                strSQL += "HS2_T_HWBURNROOM AS HS_T_HWBURNROOM,";
                strSQL += "HS2_T_BRUNROOM AS HS_T_BRUNROOM,";
                strSQL += "HS2_T_SIGRID AS HS_T_SIGRID,";
                strSQL += "HS2_T_SI AS HS_T_SI,";
                strSQL += "HS2_T_SMOKE AS HS_T_SMOKE,";
                strSQL += "HS2_T_LP1 AS HS_T_LP1,";
                strSQL += "HS2_T_LP2 AS HS_T_LP2,";
                strSQL += "HS2_T_LP3 AS HS_T_LP3,";
                strSQL += "HS2_T_LBZ AS HS_T_LBZ,";
                strSQL += "HS2_R_KRB AS HS_R_KRB,";
                strSQL += "HS2_STATUS AS HS_STATUS,";
                strSQL += "HS2_STATUS_DES AS HS_STATUS_DES,T_GAS_INLET,T_GAS_OUTLET,T_AIR_INLET,T_AIR_OUTLET,T_SMOKE_INLET,T_SMOKE_AIR_OUTLET,T_SMOKE_GAS_OUTLET";
                strSQL += " FROM T_RPT_HS    ";
                strSQL += " WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
                strSQL += " ORDER BY RECORD_TIME ASC";
            }
            else
            {
                //ASPxPageControl1.TabPages[0].Text = "3#热风炉生产日报";
                strSQL = "     SELECT RECORD_TIME,";
                strSQL += "WORK_SHIFT,";
                strSQL += "WORK_TEAM,";
                strSQL += "F_COLDWIND,";
                strSQL += "P_COLDWIND,";
                strSQL += "T_COLDWIND,";
                strSQL += "S_COLDWIND,";
                strSQL += "T_HOTWIND1,";
                strSQL += "T_HOTWIND2,";
                strSQL += "R_THEORY_KRB,";
                strSQL += "R_KRB,";
                strSQL += "HS3_P_VAULT AS HS_P_VAULT,";
                strSQL += "HS3_P_IN AS HS_P_IN,";
                strSQL += "HS3_F_AIR AS HS_F_AIR,";
                strSQL += "HS3_F_GAS AS HS_F_GAS,";
                strSQL += "HS3_R_FIRE AS HS_R_FIRE,";
                strSQL += "HS3_O2_INSOMKE AS HS_O2_INSOMKE,";
                strSQL += "HS3_T_INRSQ AS HS_T_INRSQ,";
                strSQL += "HS3_T_HWBURNROOM AS HS_T_HWBURNROOM,";
                strSQL += "HS3_T_BRUNROOM AS HS_T_BRUNROOM,";
                strSQL += "HS3_T_SIGRID AS HS_T_SIGRID,";
                strSQL += "HS3_T_SI AS HS_T_SI,";
                strSQL += "HS3_T_SMOKE AS HS_T_SMOKE,";
                strSQL += "HS3_T_LP1 AS HS_T_LP1,";
                strSQL += "HS3_T_LP2 AS HS_T_LP2,";
                strSQL += "HS3_T_LP3 AS HS_T_LP3,";
                strSQL += "HS3_T_LBZ AS HS_T_LBZ,";
                strSQL += "HS3_R_KRB AS HS_R_KRB,";
                strSQL += "HS3_STATUS AS HS_STATUS,";
                strSQL += "HS3_STATUS_DES AS HS_STATUS_DES,T_GAS_INLET,T_GAS_OUTLET,T_AIR_INLET,T_AIR_OUTLET,T_SMOKE_INLET,T_SMOKE_AIR_OUTLET,T_SMOKE_GAS_OUTLET";
                strSQL += " FROM T_RPT_HS    ";
                strSQL += " WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
                strSQL += " ORDER BY RECORD_TIME ASC";
            }
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();

            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 225;
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