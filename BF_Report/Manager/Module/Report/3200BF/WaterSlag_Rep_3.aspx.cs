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
    public partial class WaterSlag_Rep_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 1;
            }
            GetData();
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            GetData();
        }

        protected void GetData()
        {
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:02:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:02:00";
            string strSQL = "";
            string strwhere = "";
            string strwhere1 = "";
            strSQL = "SELECT GETTIME,  ";
            strSQL += "CASE when substr(TO_CHAR(GETTIME,'yyyy-mm-dd hh24:mi:ss'),11,3)>=9 and substr(TO_CHAR(GETTIME,'yyyy-mm-dd hh24:mi:ss'),11,3)<21 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            strSQL += "WW_NO,WW_AI_CASW_FLUX,WW_CASW_FLUX_NEW,WW_AI_CWS_FLUX,WW_SUPV_FLUX_NEW,WW_AI_FLU_FLUX,WW_AI_FLU_PRE, ";
            strSQL += "WW_RTD_FLU,WW_AI_HOTW_FLUX,WW_AI_HOTW_PRE,WW_RTD_FILW,WW_AI_FLUM1_CURA,WW_AI_FLUM2_CURA,WW_AI_HOTM1_CURA, ";
            strSQL += "WW_AI_HOTM2_CURA,WW_AI_HOTM3_CURA,WW_FLUM1_T1,WW_FLUM1_T2,WW_FLUM1_T3,WW_FLUM1_T4,WW_FLUM1_T5,WW_FLUM1_T6, ";
            strSQL += "WW_FLUM2_T1,WW_FLUM2_T2,WW_FLUM2_T3,WW_FLUM2_T4,WW_FLUM2_T5,WW_FLUM2_T6,WW_HOTM1_T1,WW_HOTM1_T2,WW_HOTM1_T3, ";
            strSQL += "WW_HOTM1_T4,WW_HOTM1_T5,WW_HOTM2_T1,WW_HOTM2_T2,WW_HOTM2_T3,WW_HOTM2_T4,WW_HOTM2_T5,WW_HOTM3_T1,WW_HOTM3_T2, ";
            strSQL += "WW_HOTM3_T3,WW_HOTM3_T4,WW_HOTM3_T5 ";
            strSQL += "FROM FL2_TB_BF_WW ";
            if (cbbType.Value.ToString() == "1")
            {
                strwhere = "WHERE WW_NO='2#水冲渣' ";
            }
            else
            {
                strwhere = "WHERE WW_NO='1#水冲渣' ";
            }

            strwhere1 = "AND GETTIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
            strwhere1 += "order by GETTIME asc";
            strSQL = strSQL + strwhere + strwhere1;
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt);
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