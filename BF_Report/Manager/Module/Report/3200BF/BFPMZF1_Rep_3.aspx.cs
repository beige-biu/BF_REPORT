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
    public partial class BFPMZF1_Rep_3 : System.Web.UI.Page
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
            strSQL += "PCI_IF_TT_GWFJ_ZC1,PCI_IF_TT_GWFJ_ZC2,PCI_IF_TT_GWFJ_RK,PCI_OS_QT_GLFQ1,PCI_IF_TT_YQ1_ZXH,PCI_OS_QT_ZXH1,PCI_IF_PT_MQ1,PCI_OS_QT_MQ1,PCI_IF_TT_YQL1,PCI_IF_PT_YQL1 ";
            strSQL += ",PCI_IF_TT_YQL1_CK,PCI_OS_PT_MM1_MFF,PCI_IF_TT_MM1_JSJ_1,PCI_IF_TT_MM1_JSJ_2,PCI_IF_TT_MM1_JSJ_3,PCI_IF_TT_MM1_YYZ_1,PCI_IF_TT_MM1_YYZ_2,PCI_IF_PT_YYZ1,PCI_IF_TT_MM1_RK";
            strSQL += ",PCI_IF_PT_MM1_RK,PCI_IF_TT_MM1_CK,PCI_IF_PT_MM1_CK,PCI_IF_PT_MM1_SUB,PCI_IF_TT_MM1_FLQ1,PCI_IF_TT_MM1_FLQ2,PCI_IF_TT_MM1_FLQ3,PCI_IF_TT_MM1_FLQ4,PCI_IF_TT_MM1_FLQ5,";
            strSQL += "PCI_IF_TT_MM1_FLQ6,PCI_IF_TT_MM1_TLW_1,PCI_IF_TT_MM1_TLW_2,PCI_IF_TT_MM1_TLW_3,PCI_IF_TT_MM1_TLW_4,PCI_IF_IT_MM1,PCI_IF_TT_MM1_ZC1,PCI_IF_TT_MM1_ZC2,PCI_IF_TT_MM1_U";
            strSQL += ",PCI_IF_TT_MM1_V,PCI_IF_TT_MM1_W,PCI_OS_QT_PFFJ1,PCI_IF_IT_PFFJ1,PCI_IF_TT_PFFJ1_LZQ1,PCI_IF_TT_PFFJ1_LZQ2,PCI_IF_TT_PFFJ1_ZC1,PCI_IF_TT_PFFJ1_ZC2,PCI_IF_TT_PFFJ1_U";
            strSQL += ",PCI_IF_TT_PFFJ1_V,PCI_IF_TT_PFFJ1_W,PCI_IF_Q_GMJ_1,PCI_IF_Q_GMJ_2,PCI_IF_TT_CCQ1_CK,PCI_IF_PT_CCQ1_PUASE,PCI_IF_PT_CCQ1_SUB,PCI_DX_TT_DMFC_MAX,PCI_DX_TT_DMFC_MIN";
            strSQL += ",PCI_IF_WT_DMFC,PCI_IF_AN_MM1_RK_O2,PCI_IF_AN_SC1_CK_O2,PCI_IF_AN_MFC_O2,PCI_IF_AN_MFC_CO,PCI_IF_PT_YSKQ,PCI_IF_PT_LOW_N2,PCI_DX_TT_PCG_1_MAX,PCI_IF_PT_PCG_1,PCI_IF_W_PCG_1";
            strSQL += ",PCI_DX_TT_PCG_2_MAX,PCI_IF_PT_PCG_2,PCI_IF_W_PCG_2,PCI_DX_TT_PCG_3_MAX,PCI_IF_PT_PCG_3,PCI_IF_W_PCG_3,PCI_IF_PT_HHQ_Q";
            strSQL += ",PCI_IF_PT_BQQ_Q,PCI_IF_PT_BQQ_H_YSKQ,PCI_GLPM_IF_FPQ_Q_P,PCI_GLPM_DX_FPQ_GLRF_PT_SUB,PCI_DX_QT_123G_PCF_LJL,PCI_OS_QT_4G_QSF_LJL,PCI_OS_QT_4G_SMF_LJL,STANDBY1,STANDBY2,STANDBY3,STANDBY4";
            strSQL += " FROM FL2_TB_PUFF_MILLINGLOGS1_REP ";
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