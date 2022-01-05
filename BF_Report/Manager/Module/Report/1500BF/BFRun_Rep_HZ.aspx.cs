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

namespace BF_Report.Manager.Module.Report._1500BF
{
    public partial class BFRun_Rep_HZ : System.Web.UI.Page
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

            DataTable dthz = new DataTable();
            dthz.Columns.Add("RECORD_TIME", typeof(DateTime));
            dthz.Columns.Add("CL1", typeof(string));
            dthz.Columns.Add("WML1", typeof(string));
            dthz.Columns.Add("ML1", typeof(string));
            dthz.Columns.Add("JL1", typeof(string));
            dthz.Columns.Add("CL2", typeof(string));
            dthz.Columns.Add("WML2", typeof(string));
            dthz.Columns.Add("ML2", typeof(string));
            dthz.Columns.Add("JL2", typeof(string));
            dthz.Columns.Add("CL3", typeof(string));
            dthz.Columns.Add("WML3", typeof(string));
            dthz.Columns.Add("ML3", typeof(string));
            dthz.Columns.Add("JL3", typeof(string));
            dthz.Columns.Add("CL360", typeof(string));
            dthz.Columns.Add("JL360", typeof(string));
            dthz.Columns.Add("CL400", typeof(string));
            dthz.Columns.Add("JL400", typeof(string));
            dthz.Columns.Add("JLZH", typeof(string));
            dthz.Columns.Add("MLZH", typeof(string));

            strSQL = " select a.record_time,a.IRON_CL as CL2,b.IRON_CL as CL1,a.JDB AS JDB2,b.JDB AS JDB1,a.GJB AS GJB2,b.GJB as GJB1,a.PMB AS PMB2,b.PMB AS PMB1 from T_RPT_TECH_DATA_fal a,l2bf_db.DAY_JJZB_fal b WHERE a.record_time=b.record_time and a.RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            strSQL += " ORDER BY a.RECORD_TIME ASC";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dthz.Rows.Add();
                dthz.Rows[i]["RECORD_TIME"] = dt.Rows[i]["RECORD_TIME"];
                if (Convert.ToDateTime(dt.Rows[i]["record_time"]) < Convert.ToDateTime("2021-08-25 20:00:01"))
                {
                    dthz.Rows[i]["CL1"] = double.Parse(dt.Rows[i]["CL1"].ToString()).ToString("N2");
                    dthz.Rows[i]["WML1"] = (double.Parse(dt.Rows[i]["CL1"].ToString()) * (double.Parse(dt.Rows[i]["PMB1"].ToString())) / 1000 * 0.98 * 0.6).ToString("N2");
                    dthz.Rows[i]["ML1"] = (double.Parse(dt.Rows[i]["CL1"].ToString()) * double.Parse(dt.Rows[i]["PMB1"].ToString()) / 1000 * 0.98 * 0.4).ToString("N2");
                    dthz.Rows[i]["JL1"] = (double.Parse(dt.Rows[i]["CL1"].ToString()) * (double.Parse(dt.Rows[i]["JDB1"].ToString()) + double.Parse(dt.Rows[i]["GJB1"].ToString())) / 1000 * 0.98).ToString("N2");

                    dthz.Rows[i]["CL2"] = double.Parse(dt.Rows[i]["CL2"].ToString()).ToString("N2");
                    dthz.Rows[i]["WML2"] = (double.Parse(dt.Rows[i]["CL2"].ToString()) * double.Parse(dt.Rows[i]["PMB2"].ToString()) / 1000 * 0.98 * 0.6).ToString("N2");
                    dthz.Rows[i]["ML2"] = (double.Parse(dt.Rows[i]["CL2"].ToString()) * double.Parse(dt.Rows[i]["PMB2"].ToString()) / 1000 * 0.98 * 0.4).ToString("N2");
                    dthz.Rows[i]["JL2"] = (double.Parse(dt.Rows[i]["CL2"].ToString()) * (double.Parse(dt.Rows[i]["JDB2"].ToString()) + double.Parse(dt.Rows[i]["GJB2"].ToString())) / 1000 * 0.98).ToString("N2");

                    string time = Convert.ToDateTime(dt.Rows[i]["RECORD_TIME"].ToString()).ToString("yyyyMMdd");
                    string sql = "select YIELD AS CL3,COLL_COKE_RATE AS JL3,COAL_RATE AS ML3 from ORAL2DB_BF.FL2_TB_PROD_TECH_ECON_TARGETBK@TO_DPM  WHERE REPLACE(PROD_DATE,'-','')='" + time + "' ";
                    DataTable dtnew = new DataTable();
                    SQLComm.ExecuteSelectSql_dt(sql, ref dtnew);
                    dthz.Rows[i]["CL3"] = double.Parse(dtnew.Rows[0]["CL3"].ToString()).ToString("N2");
                    dthz.Rows[i]["WML3"] = (double.Parse(dtnew.Rows[0]["ML3"].ToString()) * 0.6).ToString("N2");
                    dthz.Rows[i]["ML3"] = (double.Parse(dtnew.Rows[0]["ML3"].ToString()) * 0.4).ToString("N2");
                    dthz.Rows[i]["JL3"] = (double.Parse(dtnew.Rows[0]["JL3"].ToString())).ToString("N2");

                    string sql0 = "select wet_wgt  FROM V_MATERIAL_S6_FAL WHERE REPLACE(RECORD_DATE,'-','')='" + time + "' and prodname='焦屑'";
                    DataTable dt0 = new DataTable();
                    SQLComm.ExecuteSelectSql_dt(sql0, ref dt0);
                    dthz.Rows[i]["JL400"] = double.Parse(dt0.Rows[0]["WET_WGT"].ToString()).ToString("N2");

                    string sql1 = "select wet_wgt  FROM V_CL_S6_FAL WHERE REPLACE(RECORD_DATE,'-','')='" + time + "'";
                    DataTable dt1 = new DataTable();
                    SQLComm.ExecuteSelectSql_dt(sql1, ref dt1);
                    dthz.Rows[i]["CL400"] = double.Parse(dt1.Rows[0]["WET_WGT"].ToString()).ToString("N2");

                    string sql2 = "select wet_wgt  FROM (select record_date,sum(wet_wgt) as wet_wgt from (select to_char(CLASS_STOP_TIME,'yyyy-MM-dd') as record_date ,RL as wet_wgt FROM SL2_TB_X_MATERIAL_CONSUME_FAL a) GROUP BY record_date  order by record_date desc) ";
                    sql2 += " WHERE REPLACE(RECORD_DATE,'-','')='" + time + "'";
                    DataTable dt2 = new DataTable();
                    SQLComm.ExecuteSelectSql_dt400(sql2, ref dt2);
                    dthz.Rows[i]["JL360"] = double.Parse(dt2.Rows[0]["WET_WGT"].ToString()).ToString("N2");

                    string sql3 = "select wet_wgt  FROM (select record_date,sum(wet_wgt) as wet_wgt from (select to_char(CLASS_STOP_TIME,'yyyy-MM-dd') as record_date ,CL as wet_wgt FROM SL2_TB_X_MATERIAL_CONSUME_FAL a) GROUP BY record_date  order by record_date desc) ";
                    sql3 += " WHERE REPLACE(RECORD_DATE,'-','')='" + time + "'";
                    DataTable dt3 = new DataTable();
                    SQLComm.ExecuteSelectSql_dt400(sql3, ref dt3);
                    dthz.Rows[i]["CL360"] = double.Parse(dt3.Rows[0]["WET_WGT"].ToString()).ToString("N2");

                    dthz.Rows[i]["JLZH"] = (double.Parse(dthz.Rows[i]["JL1"].ToString()) + double.Parse(dthz.Rows[i]["JL2"].ToString()) + double.Parse(dthz.Rows[i]["JL3"].ToString()) + double.Parse(dthz.Rows[i]["JL360"].ToString()) + double.Parse(dthz.Rows[i]["JL400"].ToString())).ToString("N2");
                    dthz.Rows[i]["MLZH"] = (double.Parse(dthz.Rows[i]["WML1"].ToString()) + double.Parse(dthz.Rows[i]["ML1"].ToString()) + double.Parse(dthz.Rows[i]["WML2"].ToString()) + double.Parse(dthz.Rows[i]["ML2"].ToString()) + double.Parse(dthz.Rows[i]["WML3"].ToString()) + double.Parse(dthz.Rows[i]["ML3"].ToString())).ToString("N2");
                }
                else
                {
                    string time = Convert.ToDateTime(dt.Rows[i]["RECORD_TIME"].ToString()).ToString("yyyyMMdd");
                    string sql = "select * from BFRUN_REP_HZ_FAL t where REPLACE(RECORD_TIME,'-','')='" + time + "'";
                    DataTable dt0 = new DataTable();
                    SQLComm.ExecuteSelectSql_dt(sql, ref dt0);

                    dthz.Rows[i]["CL1"] = dt0.Rows[0]["CL1"];
                    dthz.Rows[i]["WML1"] = dt0.Rows[0]["WML1"];
                    dthz.Rows[i]["ML1"] = dt0.Rows[0]["ML1"];
                    dthz.Rows[i]["JL1"] = dt0.Rows[0]["JL1"];

                    dthz.Rows[i]["CL2"] = dt0.Rows[0]["CL2"];
                    dthz.Rows[i]["WML2"] = dt0.Rows[0]["WML2"];
                    dthz.Rows[i]["ML2"] = dt0.Rows[0]["ML2"];
                    dthz.Rows[i]["JL2"] = dt0.Rows[0]["JL2"];

                    dthz.Rows[i]["CL3"] = dt0.Rows[0]["CL3"];
                    dthz.Rows[i]["WML3"] = dt0.Rows[0]["WML3"];
                    dthz.Rows[i]["ML3"] = dt0.Rows[0]["ML3"];
                    dthz.Rows[i]["JL3"] = dt0.Rows[0]["JL3"];

                    dthz.Rows[i]["CL360"] = dt0.Rows[0]["CL360"];
                    dthz.Rows[i]["JL360"] = dt0.Rows[0]["JL360"];
                    dthz.Rows[i]["CL400"] = dt0.Rows[0]["CL400"];
                    dthz.Rows[i]["JL400"] = dt0.Rows[0]["JL400"];
                    dthz.Rows[i]["JLZH"] = (double.Parse(dt0.Rows[0]["JL1"].ToString()) + double.Parse(dt0.Rows[0]["JL2"].ToString()) + double.Parse(dt0.Rows[0]["JL3"].ToString()) + double.Parse(dt0.Rows[0]["JL360"].ToString()) + double.Parse(dt0.Rows[0]["JL400"].ToString())).ToString("N2");
                    dthz.Rows[i]["MLZH"] = (double.Parse(dt0.Rows[0]["WML1"].ToString()) + double.Parse(dt0.Rows[0]["ML1"].ToString()) + double.Parse(dt0.Rows[0]["WML2"].ToString()) + double.Parse(dt0.Rows[0]["ML2"].ToString()) + double.Parse(dt0.Rows[0]["WML3"].ToString()) + double.Parse(dt0.Rows[0]["ML3"].ToString())).ToString("N2");


                }

            }
            
            


            gridBase1.DataSource = dthz;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 225;
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