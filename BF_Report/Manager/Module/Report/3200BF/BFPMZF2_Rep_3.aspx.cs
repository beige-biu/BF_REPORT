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
    public partial class BFPMZF2_Rep_3 : System.Web.UI.Page
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

            strSQL = " SELECT TO_DATE(GETTIME,'yyyy-mm-dd hh24:mi:ss') AS GETTIME, ";
            strSQL += "CASE when substr(gettime,11,3)>8 and substr(gettime,11,3)<=20 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            strSQL += " PCI_IF_TT_GWFJ_ZC1,PCI_IF_TT_GWFJ_ZC2,PCI_IF_TT_GWFJ_RK,PCI_OS_QT_GLFQ2,PCI_IF_TT_YQ2_ZXH,PCI_IF_QT_ZXH2,PCI_IF_PT_MQ2,PCI_IF_QT_MQ2,PCI_IF_TT_YQL2,PCI_IF_PT_YQL2, ";
            strSQL += " PCI_IF_TT_YQL2_CK,PCI_OS_PT_MM2_MFF,PCI_IF_TT_MM2_MOGUN1,PCI_IF_TT_MM2_MOGUN2,PCI_IF_TT_MM2_MOGUN3,PCI_IF_PT_RHZ2,PCI_IF_TT_MM2_YYZ_1,PCI_IF_TT_MM2_YYZ_2, ";
            strSQL += " PCI_IF_PT_YYZ2,PCI_IF_TT_MM2_RK,PCI_IF_PT_MM2_RK,PCI_IF_TT_MM2_CK,PCI_IF_PT_MM2_CK,PCI_OS_PT_MM2_SUB,PCI_IF_TT_MM2_FLQ1,PCI_IF_TT_MM2_FLQ2,PCI_IF_TT_MM2_FLQ3, ";
            strSQL += " PCI_IF_TT_MM2_TLW_1,PCI_IF_TT_MM2_TLW_2,PCI_IF_TT_MM2_TLW_3,PCI_IF_TT_MM2_TLW_4,PCI_IF_IT_MM2,PCI_IF_TT_MM2_ZC1,PCI_IF_TT_MM2_ZC2,PCI_IF_TT_MM2_U,PCI_IF_TT_MM2_V, ";
            strSQL += " PCI_IF_TT_MM2_W,PCI_IF_QT_PFFJ2,PCI_IF_IT_PFFJ2,PCI_IF_TT_PFFJ2_LZQ1,PCI_IF_TT_PFFJ2_LZQ2,PCI_IF_TT_PFFJ2_ZC1,PCI_IF_TT_PFFJ2_ZC2,PCI_IF_TT_PFFJ2_U,PCI_IF_TT_PFFJ2_V, ";
            strSQL += " PCI_IF_TT_PFFJ2_W,PCI_IF_LT_YMC3,PCI_IF_LT_YMC4,PCI_IF_TT_CCQ2_CK,PCI_IF_PT_CCQ2_PUASE,PCI_DX_SC2_P_SUB,PCI_IF_TT_XMFC_MAX,PCI_IF_TT_XMFC_MIN,PCI_IF_WT_XMFC, ";
            strSQL += " PCI_IF_AN_MM2_RK_O2,PCI_IF_AN_SC2_CK_O2,PCI_OS_AN_O2_XMFC,PCI_OS_AN_CO_XMFC,PCI_IF_PT_YSKQ,PCI_IF_PT_LOW_N2,PCI_IF_TT_PCG_MAX,PCI_IF_PT_PCG_4,PCI_IF_PT_PCG_4_PC, ";
            strSQL += " PCI_IF_W_PCG_4,PCI_OS_QT_4G_QSF_LJL,PCI_OS_QT_4G_SMF_LJL ";
            strSQL += " FROM FL2_TB_PUFF_MILLINGLOGS_REP ";
            strSQL += " WHERE gettime !='白班平均' and gettime !='夜班平均' ";
            strSQL += " AND TO_DATE(GETTIME,'yyyy-mm-dd hh24:mi:ss') BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by GETTIME asc";

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