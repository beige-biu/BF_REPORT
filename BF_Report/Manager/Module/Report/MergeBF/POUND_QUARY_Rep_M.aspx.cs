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
    public partial class POUND_QUARY_Rep_M : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.ToString("yyyyMMdd")+"200001" ;
            string strEndTime = dateEndTime.Date.ToString("yyyyMMdd")+"200000" ;
            string strSQL = "";
            string unit_no = "";
            if (cbbType.Value.ToString() == "0")
            {
                unit_no = "6";
            }
            else if (cbbType.Value.ToString() == "1")
            {
                unit_no = "7";
            }
            else
            {
                unit_no = "5";
            }
            strSQL = "select to_date(work_date,'yyyy-mm-dd') AS work_date, iron_degr, car_no,tpc_no,weigh_app_no, ";
            strSQL += " weigh_no,gross_wt,tare_wt,net_weight,to_date(ponder_time,'yyyy-mm-dd hh24:mi:ss') AS ponder_time, ";
            strSQL += " weigh_by,case dest_gf when '01' then '一炼钢' when '02' then '二炼钢' when '04' then '混铸' when '07' then '三期炼钢' end AS dest_gf ";
            strSQL += "from L2BF_COM.TMMIRF9_IO ";           
            strSQL += " where unit_no='"+unit_no+ "' and ponder_time >= '"+ strStartTime + "' ";
            strSQL += " and ponder_time <= '"+ strEndTime + "' ";
            strSQL += " order by ponder_time asc ";
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