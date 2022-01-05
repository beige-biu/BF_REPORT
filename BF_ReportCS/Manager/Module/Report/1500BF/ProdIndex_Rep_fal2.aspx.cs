using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_ReportCS.Manager.Module.Report._1500BF
{
    public partial class ProdIndex_Rep_fal2 : System.Web.UI.Page
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
            
            //源代码
            strSQL = " select * from T_RPT_TECH_DATA_FAL WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            strSQL += " ORDER BY RECORD_TIME ASC";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString());
                double jb = double.Parse(dt.Rows[i]["GJB"].ToString())+ double.Parse(dt.Rows[i]["JDB"].ToString()); 
                dt.Rows[i]["IRON_CL"] = cl ;
                if (Convert.ToDateTime(dt.Rows[i]["record_time"]) > Convert.ToDateTime("2021-08-25 20:00:01"))
                {
                    dt.Rows[i]["PMB"] = double.Parse(dt.Rows[i]["ML"].ToString())+ double.Parse(dt.Rows[i]["WML"].ToString());
                    dt.Rows[i]["ZHJB"] = double.Parse(dt.Rows[i]["JL"].ToString());
                }
                else
                {
                    dt.Rows[i]["PMB"] = double.Parse(dt.Rows[i]["PMB"].ToString()) * cl * 0.98 / 1000;
                    dt.Rows[i]["ZHJB"] = jb * cl * 0.98 / 1000;
                }
                
                dt.Rows[i]["IRON_YJ"] = cl * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
                dt.Rows[i]["LYZS"] = cl / 1500;
                dt.Rows[i]["YLQD"] = double.Parse(dt.Rows[i]["ZHJB"].ToString()) / 1500;
            }
            //if (Convert.ToDateTime(strStartTime) >= Convert.ToDateTime("2021-09-09 20:00:01"))
            //{
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString());
            //    dt.Rows[i]["IRON_CL"] = cl * 0.6555 * 0.99;
            //    dt.Rows[i]["PMB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * 0.0853;
            //    dt.Rows[i]["ZHJB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * 0.426;
            //    dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
            //    dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1500;
            //}

            //}
            //else if (Convert.ToDateTime(strStartTime) < Convert.ToDateTime("2021-09-09 20:00:01") & Convert.ToDateTime(strEndTime) > Convert.ToDateTime("2021-09-09 20:00:00"))
            //{
            //    for (int i = 0; i < dt.Rows.Count; i++)
            //        if (Convert.ToDateTime(dt.Rows[i]["record_time"]) > Convert.ToDateTime("2021-09-09 20:00:01"))
            //        {
            //            {
            //                double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString());
            //                dt.Rows[i]["IRON_CL"] = cl * 0.6555 * 0.99;
            //                dt.Rows[i]["PMB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * 0.0853;
            //                dt.Rows[i]["ZHJB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * 0.426;
            //                dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
            //                dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1500;
            //            }
            //        }
            //        else
            //        {
            //            double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString());
            //            dt.Rows[i]["IRON_CL"] = cl * 0.99;
            //            dt.Rows[i]["PMB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["PMB"].ToString()) / 1000;
            //            dt.Rows[i]["ZHJB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["ZHJB"].ToString()) / 1000;
            //            dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
            //            dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1500;
            //        }
            //}
            //else
            //{
            //    for (int i = 0; i < dt.Rows.Count; i++)
            //        if (Convert.ToDateTime(dt.Rows[i]["record_time"]) > Convert.ToDateTime("2021-09-09 20:00:01"))
            //        {
            //            {
            //                double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString());
            //                dt.Rows[i]["IRON_CL"] = cl  * 0.99;
            //                dt.Rows[i]["PMB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["PMB"].ToString()) / 1000;
            //                dt.Rows[i]["ZHJB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["ZHJB"].ToString()) / 1000;
            //                dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
            //                dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1500;
            //            }
            //        }
            //}
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            if (dt.Rows.Count > 18)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Auto;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 150;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;

        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            GetData(SQLComm.strHeight);
            ExpGrid.WriteXlsxToResponse();
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