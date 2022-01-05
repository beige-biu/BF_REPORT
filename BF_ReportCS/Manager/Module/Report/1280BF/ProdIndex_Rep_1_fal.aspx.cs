using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_ReportCS.Manager.Module.Report._1280BF
{
    public partial class ProdIndex_Rep_1_fal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                dateEndTime.Date = DateTime.Now;
            }
            GetData();
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            GetData();
        }

        protected void GetData()
        {
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            string strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            //假数据修改
            
            //原始代码
            strSQL = " select * from l2bf_db.DAY_JJZB_FAL  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            strSQL += " ORDER BY RECORD_TIME ASC";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) ;
                double jb = double.Parse(dt.Rows[i]["GJB"].ToString()) + double.Parse(dt.Rows[i]["JDB"].ToString());
                dt.Rows[i]["IRON_CL"] = cl ;
                dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
                dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1280;
                dt.Rows[i]["IRON_CL"] = cl;
                if (Convert.ToDateTime(dt.Rows[i]["record_time"]) > Convert.ToDateTime("2021-08-25 20:00:01"))
                {
                    dt.Rows[i]["PMB"] = double.Parse(dt.Rows[i]["ML"].ToString()) + double.Parse(dt.Rows[i]["WML"].ToString());
                    dt.Rows[i]["ZHJB"] = double.Parse(dt.Rows[i]["JL"].ToString());
                }
                else
                {
                    dt.Rows[i]["ZHJB"] = (cl * jb * 0.98 / 1000).ToString("N2");
                    dt.Rows[i]["PMB"] = (cl * double.Parse(dt.Rows[i]["PMB"].ToString()) * 0.98 / 1000).ToString("N2");
                }
                dt.Rows[i]["YLQD"] = double.Parse(dt.Rows[i]["ZHJB"].ToString()) / 1280;
            }
            //double jb = 0.451;
            //double mb = 0.0791;
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    string endtime = dt.Rows[i]["RECORD_TIME"].ToString();
            //    string begintime = Convert.ToDateTime(endtime).AddHours(-12).ToString();
            //    string record_time = Convert.ToDateTime(dt.Rows[i]["RECORD_TIME"].ToString()).ToString("yyyyMMddhhmmss");
            //    Int64 time = Int64.Parse(record_time);
            //    if (time >= 20210910080000)
            //    {
            //        double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString())*0.99;
            //        dt.Rows[i]["IRON_CL"] = cl * 0.6835;
            //        dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
            //        dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1280;
            //        dt.Rows[i]["ZHJB"] = (cl * 0.6835 * jb).ToString("N2");
            //        dt.Rows[i]["PMB"] = (cl * 0.6835 * mb).ToString("N2");
            //    }
            //    else if (Convert.ToDateTime(begintime) < Convert.ToDateTime("2021-09-09 20:00:01") & Convert.ToDateTime(endtime) > Convert.ToDateTime("2021-09-09 20:00:00"))
            //    {
            //        if (Convert.ToDateTime(dt.Rows[i]["RECORD_TIME"]) > Convert.ToDateTime("2021-09-09 20:00:01"))
            //        {
            //            double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * 0.99;
            //            dt.Rows[i]["IRON_CL"] = cl * 0.6835;
            //            dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
            //            dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1280;
            //            dt.Rows[i]["ZHJB"] = (cl * 0.6835 * jb).ToString("N2");
            //            dt.Rows[i]["PMB"] = (cl * 0.6835 * mb).ToString("N2");
            //        }
            //        else
            //        {
            //            double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * 0.99;
            //            dt.Rows[i]["IRON_CL"] = cl;
            //            dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
            //            dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1280;
            //            dt.Rows[i]["ZHJB"] = (cl * double.Parse(dt.Rows[i]["ZHJB"].ToString())/1000).ToString("N2");
            //            dt.Rows[i]["PMB"] = (cl * double.Parse(dt.Rows[i]["PMB"].ToString()) / 1000).ToString("N2");

            //            //dt.Rows[i]["PMB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["PMB"].ToString()) / 1000;
            //            //dt.Rows[i]["ZHJB"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["ZHJB"].ToString()) / 1000;
            //        }
            //    }
            //    else
            //    {
            //        double cl = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * 0.99;
            //        dt.Rows[i]["IRON_CL"] = cl;
            //        dt.Rows[i]["IRON_YJ"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) * double.Parse(dt.Rows[i]["IRON_YJPL"].ToString()) / 100;
            //        dt.Rows[i]["LYZS"] = double.Parse(dt.Rows[i]["IRON_CL"].ToString()) / 1280;
            //        //dt.Rows[i]["ZHJB"] = (cl * 0.451).ToString("N2");
            //        //dt.Rows[i]["PMB"] = (cl * 0.0791).ToString("N2");
            //        dt.Rows[i]["ZHJB"] = (cl * double.Parse(dt.Rows[i]["ZHJB"].ToString()) / 1000).ToString("N2");
            //        dt.Rows[i]["PMB"] = (cl * double.Parse(dt.Rows[i]["PMB"].ToString()) / 1000).ToString("N2");
            //    }

            //}
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            GetData();
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