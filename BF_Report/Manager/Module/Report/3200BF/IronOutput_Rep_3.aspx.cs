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
    public partial class IronOutput_Rep_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //dateStartTime.Date = DateTime.Now;               
                //cbbType.SelectedIndex = 0;
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
            //string strCon = cbbType.Value.ToString();
            string strSQL = "";
            strSQL = "select CURDAY,SEQ,TAP_HOLE,ARRIVED_TIME,START_TIME,END_TIME,TAP_TIME,THEORY_YIELD, ";
            strSQL += "EST_YIELD,POUND_YIELD,EST_SI,EST_S,EST_R2,ACT_SI,ACT_S,ACT_MN,ACT_P,ACT_TI, ";
            strSQL += "ACT_AS,ACT_CU,ACT_PH,OUTDREG_COLOR,DEEPTH,ANGLE,MUD ";
            strSQL += "from V_FL2_TB_TAP t ";
            strSQL += "WHERE CURDAY between to_date('" + strStartTime + "', 'yyyy-mm-dd') and to_date('" + strEndTime + "', 'yyyy-mm-dd') AND TAP_NO!='铁水累计' ";
            //strSQL += "WHERE TO_CHAR(CURDAY,'yyyy-MM-dd')='" + strStartTime + "' AND TAP_NO!='铁水累计' ";
            strSQL += "order by ARRIVED_TIME asc";
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
            if (SQLComm.strHeight != null)
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