using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FrameWork;
using DevExpress.Web;
using FrameWork.web;
using GemBox.ExcelLite;
using System.IO;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._360ST
{
    public partial class STRun_Rep_1 : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:05:00";
            string strEndTime = dateStartTime.Text.ToString() + " 20:05:00";
            string strSQL = "";
            //            strSQL = "SELECT RECORD_DATE, ";
            //            strSQL += "CASE when substr(to_char(record_date,'yyyy-MM-dd hh24:mi:ss'),11,3)>8 and substr(to_char(record_date,'yyyy-MM-dd hh24:mi:ss'),11,3)<=20 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            //;           strSQL += "SJ_LI_304,SJ_LI_305,SJ_LI_306,SJ_LI_307, SJ_LI_308, SJ_SI_302, SJ_SI_305, ";
            //            strSQL += "HH2_PCIOUT2, SJ_PR_301, SJ_PR_302, SJ_FRQ_301, SJ_FRQ_302,SJ_FRQ_381, SJ_FRQ_382, ";
            //            strSQL += "SJ_PR_381,SJ_PR_382,SJ_PI_337,SJ_PI_338,SJ_FIQ_305,SJ_FIQ_306,SJ_AR_301, ";
            //            strSQL += "ROUND(HH_MI_202,2),HH_MI_211,SJ_LISA_301,ROUND(SJ_LISA_302,2),ROUND(PL_LISA_113,2), ";
            //            strSQL += "ROUND(PL_LISA_114,2),ZC_HISC_601_FBACK,ZC_HISC_621_FBACK,ZC_AT_601,ZC_AT_602, ";
            //            strSQL += "ZC_AT_621,ZC_AT_622,ZC_FI_609,ZC_FI_629,ROUND(ZC_PI_304,2),ROUND(ZC_PI_305,2),SJ_FI_303,SJ_FI_304  ";
            //            strSQL += "FROM (select * from SL2_TB_X_OPERATIONAL_LOG WHERE  record_date between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')) ";           
            //            strSQL += "order by record_date asc";



            strSQL = "SELECT record_time AS RECORD_DATE, ";
            strSQL += "CASE when substr(to_char(record_time,'yyyy-MM-dd hh24:mi:ss'),11,3)>8 and substr(to_char(record_time,'yyyy-MM-dd hh24:mi:ss'),11,3)<=20 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            ; strSQL += "SJ_LI_304,SJ_LI_305,SJ_LI_306,SJ_LI_307, SJ_LI_308, SJ_SI_302, SJ_SI_305, ";
            strSQL += "HH2_PCIOUT2, SJ_PR_301, SJ_PR_302, SJ_FRQ_301, SJ_FRQ_302,SJ_FRQ_381, SJ_FRQ_382, ";
            strSQL += "SJ_PR_381,SJ_PR_382,SJ_PI_337,SJ_PI_338,SJ_FIQ_305,SJ_FIQ_306,SJ_AR_301, ";
            strSQL += "ROUND(HH_MI_202,2),HH_MI_211,SJ_LISA_301,ROUND(SJ_LISA_302,2),ROUND(PL_LISA_113,2), ";
            strSQL += "ROUND(PL_LISA_114,2),ZC_HISC_601_FBACK,ZC_HISC_621_FBACK,ZC_AT_601,ZC_AT_602, ";
            strSQL += "ZC_AT_621,ZC_AT_622,ZC_FI_609,ZC_FI_629,ROUND(ZC_PI_304,2),ROUND(ZC_PI_305,2),SJ_FI_303,SJ_FI_304, ";
            strSQL += " SJ_TR_303A,SJ_TR_303B,SJ_TI_385,SJ_TI_356,SJ_TI_357,SJ_TI_358,SJ_TI_304,SJ_TI_305,SJ_TR_301,SJ_TR_302,";
            strSQL += " SJ_TR_381,SJ_TR_382,SJ_TI_337,SJ_TI_338,SJ_TI_385_1,SJ_TR_384";
            strSQL += " FROM (select a.record_date as record_time,a.*,b.* from SL2_TB_X_OPERATIONAL_LOG a left join SL2_TB_X_OPERATIONAL_TEMP_REP b on to_char(a.record_date,'yyyymmddhh24')=to_char(b.record_date,'yyyymmddhh24')  ";
            strSQL += " WHERE  a.record_date between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss'))";
            strSQL += "order by record_date asc";


            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt400(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = 500;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
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