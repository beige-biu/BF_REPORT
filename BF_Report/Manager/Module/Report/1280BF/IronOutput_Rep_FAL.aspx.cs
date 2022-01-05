using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace BF_Report.Manager.Module.Report._1280BF
{
    public partial class IronOutput_Rep_FAL : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd") + " 20:00:00";
            string strEndTime = dateEndTime.Date.ToString("yyyy-MM-dd") + " 20:00:00";
            string strCon = cbbType.Value.ToString();
            string strSQL = "";
            //出渣率 出渣时间/出铁时间
            strSQL = "select * from (";
            strSQL += " select a.*,0 as OUT_IRON_SPAN,0 as OUT_SLAG_SPAN,0 as OUT_SALG_PER,Si,S,P,CaO,SiO2,Al2O3,MgO,FeO,R2 from l2bf_db.day_iron  a,l2bf_db.V_DAY_GLZL_INFO  b where a.iron_degr=b.mat_sample_no and a.OUT_START_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
            strSQL += " union ";
            strSQL += " select a.*,0 as OUT_IRON_SPAN,0 as OUT_SLAG_SPAN,0 as OUT_SALG_PER,Si,S,P,CaO,SiO2,Al2O3,MgO,FeO,R2 from l2bf_db.day_iron_fal  a,l2bf_db.V_DAY_GLZL_INFO_FAL  b where a.iron_degr=b.mat_sample_no and a.OUT_START_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
            if (strCon.Equals("2"))
                strSQL += " AND IRON_MOUTH_NO = '东' "; 
            else if (strCon.Equals("3"))
                strSQL += " AND IRON_MOUTH_NO = '西' ";
            strSQL += " )ORDER BY OUT_START_TIME ASC ";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            foreach (DataRow dr in dt.Rows)
            {
                double dIron = 0;
                double dSlag = 0;
                double dSlagPer = 0;
                string strIronNo = dr["IRON_DEGR"].ToString();
                strSQL = "select * from (";
                strSQL += " select sum(YIEL_POUD) AS YIEL_POUD from l2bf_db.day_iron  WHERE iron_degr ='" + strIronNo + "' ";
                strSQL += " union ";
                strSQL += " select sum(YIEL_POUD) AS YIEL_POUD from l2bf_db.day_iron_fal  WHERE iron_degr ='" + strIronNo + "') ";
                DataTable dt1 = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
                try
                {
                    dr["YIEL_POUD"] = dt1.Rows[0]["YIEL_POUD"].ToString();//实产
                }
                catch { }
                try
                {
                    TimeSpan span1 = DateTime.Parse(dr["OUT_END_TIME"].ToString()) - DateTime.Parse(dr["OUT_START_TIME"].ToString());
                    dIron = span1.TotalMinutes;
                    dr["OUT_IRON_SPAN"] = dIron.ToString("N0");
                }
                catch { }
                try
                {
                    TimeSpan span1 = DateTime.Parse(dr["OUT_END_TIME"].ToString()) - DateTime.Parse(dr["OUT_TIME"].ToString());
                    dSlag = span1.TotalMinutes;
                    dSlagPer = dSlag / dIron;
                    dr["OUT_SLAG_SPAN"] = dSlag.ToString("N0");
                    dr["OUT_SALG_PER"] = dSlagPer.ToString("N2");
                }
                catch { }
                
            }
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Auto;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 190;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;

            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            if (SQLComm.strHeight != null)
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