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

namespace BF_Report.Manager.Module.Report._MergeBF
{
    public partial class EQUIPMENT_FAULT_Rep_M : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                dateEndTime.Date = DateTime.Now;
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
            string strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            if (cbbType.Value.ToString() == "0")
            {
                strSQL = "select FAULT_NAME, ";
                strSQL += "START_TIME ,";
                strSQL += "SUBMIT_MAN ,";
                strSQL += "ACCEPT_TIME  ,";
                strSQL += "ACCEPT_MAN ,";
                strSQL += "END_TIME ,";
                strSQL += "CONFIRM_MAN  ,";
                strSQL += "TIME AS CONTINUE_TIME,";
                strSQL += "REMARK ";
                strSQL += "from L2BF_DB.PUBLIC_EQUIPMENT_FAULT where START_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')  order by START_TIME asc";
            }
            else if (cbbType.Value.ToString() == "1")
            {
                strSQL = "select ";
                strSQL += "FAULT_NAME,";
                strSQL += "START_TIME ,";
                strSQL += "SUBMIT_MAN ,";
                strSQL += "ACCEPT_TIME  ,";
                strSQL += "ACCEPT_MAN ,";
                strSQL += "END_TIME ,";
                strSQL += "CONFIRM_MAN  ,";
                strSQL += "CONTINUE_TIME  ,";
                strSQL += "REMARK ";
                strSQL += "from T_INSERT_EQUIPMENT_FAULT where START_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')  order by START_TIME asc";
            }
            else
            {
                strSQL = "select ";
                strSQL += "FAULT_NAME,";
                strSQL += "START_TIME ,";
                strSQL += "SUBMIT_MAN ,";
                strSQL += "ACCEPT_TIME  ,";
                strSQL += "ACCEPT_MAN ,";
                strSQL += "END_TIME ,";
                strSQL += "CONFIRM_MAN  ,";
                strSQL += "CONTINUE_TIME  ,";
                strSQL += "REMARK ";
                strSQL += "from T_INSERT_EQUIPMENT_FAULT_3 where FLAG='T5' START_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')  order by START_TIME asc";
            }
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            if (dt.Rows.Count > 18)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 150;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
            gridBase1.ExpandAll();
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