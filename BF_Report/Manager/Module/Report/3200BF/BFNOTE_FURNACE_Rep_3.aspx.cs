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
    public partial class BFNOTE_FURNACE_Rep_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                dateEndTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
                GetData(SQLComm.strHeight);
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
            try
            {
                string strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd") + " 20:00:01";
                string strEndTime = dateEndTime.Date.ToString("yyyy-MM-dd") + " 20:00:00";
                string strCon = cbbType.Value.ToString();
                string strSQL = "select ANALYES_DATE,ANALYES_SHIFT,ANALYES_CLASSKIND,ANALYES_LOG,ANALYES_CHIEF,ANALYES_VCHIEF from ORAL2DB_BF.FL2_TB_SHIFT_ANALYES where ANALYES_DATE BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
                if (strCon.Equals("2"))
                    strSQL += " AND SHIFTID = '0' ";
                else if (strCon.Equals("3"))
                    strSQL += " AND SHIFTID = '1' ";
                strSQL += " order by ANALYES_DATE asc ";
                DataTable dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt);
                gridBase1.DataSource = dt;
                gridBase1.DataBind();
                if (dt.Rows.Count > 0)
                {
                    gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                    gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 150;
                }
                else
                    gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
            }
            catch { }
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