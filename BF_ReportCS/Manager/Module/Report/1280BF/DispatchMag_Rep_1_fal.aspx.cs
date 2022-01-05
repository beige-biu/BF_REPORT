using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_ReportCS.Manager.Module.Report._1280BF
{
    public partial class DispatchMag_Rep_1_fal : System.Web.UI.Page
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
            try
            {
                string strStartTime = "";
                string strEndTime = "";
                string strSQL = "";

                strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
                strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
                if (Convert.ToDateTime(strStartTime) >= Convert.ToDateTime("2021-09-09 20:00:01"))
                {
                    strSQL = "select record_time, trim(to_char(iron_weight1*0.6835,'99999999999999.99')) as iron_weight,trim(to_char(iron_weight2/iron_weight1,'99999999999999.99'))  as num2,trim(to_char(iron_weight3/iron_weight1,'99999999999999.99'))  as num3,trim(to_char(iron_weight4/iron_weight1,'99999999999999.99'))  as num4,trim(to_char(iron_weight5/iron_weight1,'99999999999999.99'))  as num5,iron_weight1,iron_weight2,iron_weight3,iron_weight4,iron_weight5, PER_COAL,PER_COKE,TRT_ELE from V_1280DISPATCH  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";

                }
                else if (Convert.ToDateTime(strStartTime) < Convert.ToDateTime("2021-09-09 20:00:01") & Convert.ToDateTime(strEndTime) > Convert.ToDateTime("2021-09-09 20:00:00"))
                {
                    
                        if (Convert.ToDateTime(strStartTime) > Convert.ToDateTime("2021-09-09 20:00:01"))
                        {
                            
                            strSQL = "select record_time, trim(to_char(iron_weight1*0.6835,'99999999999999.99')) as iron_weight,trim(to_char(iron_weight2/iron_weight1,'99999999999999.99'))  as num2,trim(to_char(iron_weight3/iron_weight1,'99999999999999.99'))  as num3,trim(to_char(iron_weight4/iron_weight1,'99999999999999.99'))  as num4,trim(to_char(iron_weight5/iron_weight1,'99999999999999.99'))  as num5,iron_weight1,iron_weight2,iron_weight3,iron_weight4,iron_weight5, PER_COAL,PER_COKE,TRT_ELE from V_1280DISPATCH  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                        }
                        
                }              
                else
                {
                    strSQL = "select * from V_1280DISPATCH  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                }


                DataTable dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        double IRON_WEIGHT = double.Parse(dr["IRON_WEIGHT"].ToString());
                        double IRON_WEIGHT2 = double.Parse(dr["IRON_WEIGHT"].ToString()) * double.Parse(dr["num2"].ToString());
                        double IRON_WEIGHT3 = double.Parse(dr["IRON_WEIGHT"].ToString()) * double.Parse(dr["num3"].ToString());
                        double IRON_WEIGHT4 = double.Parse(dr["IRON_WEIGHT"].ToString()) * double.Parse(dr["num4"].ToString());
                        double IRON_WEIGHT5 = double.Parse(dr["IRON_WEIGHT"].ToString()) * double.Parse(dr["num5"].ToString());

                        dr["IRON_WEIGHT1"] = IRON_WEIGHT.ToString("N2").Replace(",", "");
                        dr["IRON_WEIGHT2"] = IRON_WEIGHT2.ToString("N2").Replace(",", "");
                        dr["IRON_WEIGHT3"] = IRON_WEIGHT3.ToString("N2").Replace(",", "");
                        dr["IRON_WEIGHT4"] = IRON_WEIGHT4.ToString("N2").Replace(",", "");
                        dr["IRON_WEIGHT5"] = IRON_WEIGHT5.ToString("N2").Replace(",", "");
                    }
                }
                gridBase1.DataSource = dt;
                gridBase1.DataBind();
            }
            catch { }
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