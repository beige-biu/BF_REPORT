using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._1500BF
{
    public partial class ProdIndex_Rep : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            string strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            //假数据修改
            //if (Convert.ToDateTime(strEndTime) <= Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = " select * from T_RPT_TECH_DATA_FAL  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            //    strSQL += " ORDER BY RECORD_TIME ASC";
            //}
            //else if (Convert.ToDateTime(strStartTime) >= Convert.ToDateTime("2020-11-11 20:00:01"))
            //{
            //    strSQL = " select * from T_RPT_TECH_DATA  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            //    strSQL += " ORDER BY RECORD_TIME ASC";
            //}
            //else if (Convert.ToDateTime(strStartTime) < Convert.ToDateTime("2020-11-11 20:00:01") & Convert.ToDateTime(strEndTime) > Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = "select * from ( ";
            //    strSQL += "select * from T_RPT_TECH_DATA_FAL  where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('2020-11-11 20:00:00', 'yyyy-mm-dd hh24:mi:ss') ";
            //    strSQL += " union ";
            //    strSQL += "select * from T_RPT_TECH_DATA  where RECORD_TIME between to_date('2020-11-11 20:00:01', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            //    strSQL += " )order by RECORD_TIME asc";
            //}
            //源代码
            strSQL = " select RECORD_TIME,IRON_CL,IRON_YJ,IRON_YJPL,LYZS,YLQD,GJB,PMB,JDB,RLB,ZHJB,KH *1000 AS KH,FYL,FW,MQLYL,RLPW,ZTB,HTB  ";
            strSQL += " from T_RPT_TECH_DATA WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            strSQL += " ORDER BY RECORD_TIME ASC";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
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