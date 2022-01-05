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
    public partial class MaterialInput_Rep_3 : System.Web.UI.Page
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
            string strEndTime = dateEndTime.Date.ToString("yyyy-MM-dd");
            string strSQL = "";
            strSQL = "SELECT GETTIME,CASE SHIFT_ID WHEN '0' THEN '夜班' WHEN '1' THEN '白班' ELSE NULL END AS SHIFT_ID, ";
            strSQL += "COKEWEIGHT,DRYCOKEWEIGHT,COKEDOTWEIGHT,COAL,SINTERWEIGHT,BALL_MINE1_NAME,BALL_MINE1,BALL_MINE2_NAME, ";
            strSQL += "BALL_MINE2,BALL_MINE3_NAME,BALL_MINE3,BALL_MINE_ZC,BLOC_MINE1_NAME,BLOC_MINE1,BLOC_MINE2_NAME, ";
            strSQL += "BLOC_MINE2,BLOC_MINE3_NAME,BLOC_MINE3,BLOC_MINE4_NAME,BLOC_MINE4,BLOC_MINE5_NAME,BLOC_MINE5,DOLO, ";
            strSQL += "SILEX,SHS,YS,MK,SWS,TOTAL_WEIG ";
            strSQL += "FROM FL2_TB_REP_MATERIAL_IN_NEW t ";
            strSQL += "WHERE CLASS_KIND!='合计'  ";
            strSQL += "AND GETTIME between to_date('" + strStartTime + "', 'yyyy-mm-dd') and to_date('" + strEndTime + "', 'yyyy-mm-dd') ";
            strSQL += "order by gettime asc";


            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
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