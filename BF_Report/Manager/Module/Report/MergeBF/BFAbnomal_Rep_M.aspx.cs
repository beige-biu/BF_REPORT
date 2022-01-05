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
    public partial class BFAbnomal_Rep_M : System.Web.UI.Page
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
            DataTable dt = new DataTable();
            if (cbbType.Value.ToString() == "0")
            {
                strSQL = "select RECORD_TIME AS NO1,";
                strSQL += "BB AS NO5 ,";
                strSQL += "STATE AS NO6 ,";
                strSQL += "BEGIN_TIME AS NO2,";
                strSQL += "END_TIME AS NO3,";
                strSQL += "USED_TIME AS NO4, ";
                strSQL += "REC_MAN AS NO8, ";
                strSQL += "REMARK AS NO7 ";
                strSQL += "from L2BF_DB.DAY_GLYC where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')  order by RECORD_TIME asc";
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            }
            if (cbbType.Value.ToString() == "1")
            {
                strSQL = "select RECORD_TIME AS NO1,";
                strSQL += "TEAM AS NO5,";
                strSQL += "STATE AS NO6,";
                strSQL += "BEGIN_TIME AS NO2,";
                strSQL += "END_TIME AS NO3,";
                strSQL += "USED_TIME AS NO4,";
                strSQL += "RECORD_NAME AS NO8 ,";
                strSQL += "REMARK AS NO7 ";
                strSQL += "from T_CONFIRM_FAULT where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')  order by RECORD_TIME asc";
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            }
            if (cbbType.Value.ToString() == "2")
            {
                strSQL = "select FAULTLOGDATE AS NO1,";
                strSQL += "SHIFTCLASS AS NO5,";
                strSQL += "FAULTBEGTIME AS NO2,";
                strSQL += "FAULTENDTIME AS NO3,";
                strSQL += "FAULTLASTTIME  AS NO4,";
                strSQL += "CAUSECODE AS NO6,";
                strSQL += "FAULTNOTE AS NO7,";
                strSQL += "PRINCIPAL AS NO8 ";
                strSQL += "from FL2_TB_BUS_MISWORK where FAULTLOGDATE between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')  order by FAULTLOGDATE asc";
                SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt);
            }
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