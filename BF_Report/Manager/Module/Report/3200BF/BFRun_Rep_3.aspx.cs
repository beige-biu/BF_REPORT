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
    public partial class BFRun_Rep_3 : System.Web.UI.Page
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
            //string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            //string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
            string strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
            string strSQL = "";
            strSQL = "SELECT substr(gettime,6,11) as gettime, ";
            strSQL += "CASE when substr(gettime,11,3)>8 and substr(gettime,11,3)<=20 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            strSQL += "lot,lot_sum,line_c,line_bigsinter,line_smallsinter,line_radar, ";
            strSQL += "wind_mac,cold_wind_flow,oxygen_flow,cold_wind_press,one_send_running, ";
            strSQL += "two_send_running,three_send_running,hot_wind_press,wind_temp,roof_press1, ";
            strSQL += "roof_press2,roof_press3,roof_press4,spray_qnt,sealed_temp1,sealed_temp2, ";
            strSQL += "sealed_temp3,roof_east_temp,roof_south_temp,roof_west_temp,roof_north_temp  ";
            strSQL += "FROM (select * from FL2_TB_REP_GLSCBB_1 WHERE gettime!='白班平均' and gettime!='夜班平均' and gettime!='日平均' AND product_date='" + strStartTime + "') ";
            //strSQL += "AND gettime between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            strSQL += "order by gettime asc";


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