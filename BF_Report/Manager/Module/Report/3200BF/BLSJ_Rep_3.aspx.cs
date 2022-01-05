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

namespace BF_Report.Manager.Module.Report._3200BF
{
    public partial class BLSJ_Rep_3 : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
            string strSQL = "";
            strSQL = "SELECT TIME,BATCH,CLASS_KIND,RECORDER,DRY_COKE_WEIG,WET_COKE_WEIG,COKE1_NAME,COKE1,COKE2_NAME,COKE2,COKE3_NAME,COKE3,COKE4_NAME,COKE4,JD,MINE_BATC_WEIG,SINT_MINE,BALL_MINE1_NAME,BALL_MINE1,BALL_MINE2_NAME,BALL_MINE2,BALL_MINE3_NAME,BALL_MINE3,BALL_MINE_ZC,BLOC_MINE1_NAME,BLOC_MINE1,BLOC_MINE2_NAME,BLOC_MINE2,BLOC_MINE3_NAME,BLOC_MINE3,DOLO,SILEX,YS,MK,COAL,ZZAL2O3,ZZCAO,ZZSIO2,ZZMGO,R2,H_DRY,BATC_IRON,BATC_VOL from ORAL2DB_BF.FL2_TB_TAP_BL_NEW  ";
            strSQL += "WHERE TO_CHAR(TIME,'yyyy-MM-dd')='" + strStartTime + "'  ";
            strSQL += "order by TIME asc";


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