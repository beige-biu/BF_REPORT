using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;
using GemBox.ExcelLite;
using System.IO;

namespace BF_ReportCS.Manager.Module.Report._1500BF
{
    public partial class BFRun_Rep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
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
            string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            Int64 time = Int64.Parse(dateStartTime.Date.AddDays(-1).ToString("yyyyMMdd") + "200000");
            if (time < 20210610200000)
            {
                strSQL = "select a.RECORD_TIME,a.WORK_SHIFT,a.WORK_TEAM,a.HOUR_CHARGE,a.GAS_USE,a.BLAST_AMOUNT,a.HOT_PRESS,COLD_PRESS, ";
                strSQL += "a.TOP_PRESS,a.BOTTOM_PRESS,a.TOP_PRESSDIFF,a.BOTTOM_PRESSDIFF,a.TOP_PRESSRATIO,a.MIDDLE_PRESSRATIO,  ";
                strSQL += "a.BOTTOM_PRESSRATIO,a.TQX,BLAST_TEMP,a.TOP_TEMPMAX,a.TOP_TEMPMIN,a.TOP_TEMPAVG,a.RICH_OXY_RATIO,  ";
                strSQL += "a.COKE_JET,a.COKE_JET1,a.COKE_RATIO,a.BLAST_SPEED,  ";
                strSQL += "a.ACT_SPEED,a.TH_BURN_TEMP,a.BLAST_ENERGY,a.P_ALL,a.TQX_T,a.TQX_B,a.GAS_AMOUNT,a.P_IND_WATER,a.XBG,a.P_SOFT1_WATER,  ";
                strSQL += "a.P_SOFT2_WATER,a.T_TEN_HEART,a.T_LD_HEART,a.T_LJ_HEART, ";
                strSQL += "a.LT_RFH,a.SPEED_LMXJ,a.TEMPHFQ ,NVL(a.F_SOFT_WATER,0) AS F_SOFT_WATER,NVL(a.T_SOFT_WATER,0) AS T_SOFT_WATER,";
                strSQL += "a.RICH_OXY_AMOUNT,a.R_LG_ACTIVE, a.OXY_AMOUNT as GY_OXY_AMOUNT, NVL(b.AVGPRE_MQ, 0) AS AVGPRE_MQ ";
                strSQL += "FROM T_RPT_BF_RUN_PARA a left join T_RPT_ENERGY_CONSUME b on a.RECORD_TIME = b.RECORD_TIME ";
                strSQL += "where a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')  ";
                strSQL += "order by a.RECORD_TIME asc ";
            }
            else
            {
                strSQL = "select a.RECORD_TIME,a.WORK_SHIFT,a.WORK_TEAM,RTRIM(TO_CHAR(b.DAY_CHARGE,'FM9990.9'),'.') AS  HOUR_CHARGE ,a.GAS_USE,a.BLAST_AMOUNT,a.HOT_PRESS,COLD_PRESS, ";
                strSQL += "a.TOP_PRESS,a.BOTTOM_PRESS,a.TOP_PRESSDIFF,a.BOTTOM_PRESSDIFF,a.TOP_PRESSRATIO,a.MIDDLE_PRESSRATIO,  ";
                strSQL += "a.BOTTOM_PRESSRATIO,a.TQX,BLAST_TEMP,a.TOP_TEMPMAX,a.TOP_TEMPMIN,a.TOP_TEMPAVG,a.RICH_OXY_RATIO,  ";
                strSQL += "a.COKE_JET,a.COKE_JET1,a.COKE_RATIO,a.BLAST_SPEED,  ";
                strSQL += "a.ACT_SPEED,a.TH_BURN_TEMP,a.BLAST_ENERGY,a.P_ALL,a.TQX_T,a.TQX_B,a.GAS_AMOUNT,a.P_IND_WATER,a.XBG,a.P_SOFT1_WATER,  ";
                strSQL += "a.P_SOFT2_WATER,a.T_TEN_HEART,a.T_LD_HEART,a.T_LJ_HEART, ";
                strSQL += "a.LT_RFH,a.SPEED_LMXJ,a.TEMPHFQ ,NVL(a.F_SOFT_WATER,0) AS F_SOFT_WATER,NVL(a.T_SOFT_WATER,0) AS T_SOFT_WATER, ";
                strSQL += "a.RICH_OXY_AMOUNT, a.R_LG_ACTIVE, a.OXY_AMOUNT as GY_OXY_AMOUNT, NVL(b.AVGPRE_MQ, 0) AS AVGPRE_MQ ";
                strSQL += "FROM T_RPT_BF_RUN_PARA a left join T_RPT_ENERGY_CONSUME b on a.RECORD_TIME = b.RECORD_TIME ";
                strSQL += "where a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')  ";
                strSQL += "order by a.RECORD_TIME asc ";
            }

            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Auto;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 235;
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