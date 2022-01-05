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
    public partial class BFRun2_Rep : System.Web.UI.Page
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
            strSQL = "select max(to_char(time,'yyyy/mm/dd')) as record_time,";
            strSQL += "sum(HOUR_CHARGE) as accum_charge,";
            strSQL += "round(avg(cold_press),2) as cold_press,";
            strSQL += "round(avg(HOT_PRESS),2) as HOT_PRESS ,";
            strSQL += "round(avg(TOP_PRESS),2) as TOP_PRESS ,";
            strSQL += "round(avg(BOTTOM_PRESS),2) as BOTTOM_PRESS  ,";
            strSQL += "round(avg(P_ALL),2) as P_ALL ,";
            strSQL += "round(avg(TOP_PRESSDIFF),2) as TOP_PRESSDIFF ,";
            strSQL += "round(avg(BOTTOM_PRESSDIFF),2) as BOTTOM_PRESSDIFF  ,";
            strSQL += "round(avg(P_IND_WATER),2) as P_IND_WATER ,";
            strSQL += "round(avg(P_SOFT1_WATER),2) as P_SOFT1_WATER ,";
            strSQL += "round(avg(P_SOFT2_WATER),2) as P_SOFT2_WATER ,";
            strSQL += "round(avg(BLAST_SPEED),2) as BLAST_SPEED ,";
            strSQL += "round(avg(ACT_SPEED),2) as ACT_SPEED ,";
            strSQL += "round(avg(BLAST_TEMP),2) as BLAST_TEMP  ,";
            strSQL += "round(avg(BLAST_AMOUNT),2) as BLAST_AMOUNT  ,";
            strSQL += "round(avg(TH_BURN_TEMP),2) as TH_BURN_TEMP  ,";
            strSQL += "round(avg(BLAST_ENERGY),2) as BLAST_ENERGY  ,";
            strSQL += "round(avg(TOP_TEMPMAX),2) as TOP_TEMPMAX ,";
            strSQL += "round(avg(TOP_TEMPMIN),2) as TOP_TEMPMIN ,";
            strSQL += "round(avg(TOP_TEMPAVG),2) as TOP_TEMPAVG ,";
            strSQL += "round(avg(TQX_T),2) as TQX_T ,";
            strSQL += "round(avg(TQX_B),2) as TQX_B ,";
            strSQL += "round(avg(TQX),2) as TQX  ,";
            strSQL += "round(avg(GAS_USE),2) as GAS_USE ,";
            strSQL += "round(avg(GAS_AMOUNT),2) as GAS_AMOUNT  ,";
            strSQL += "round(avg(RICH_OXY_RATIO),2) as RICH_OXY_RATIO  ,";
            strSQL += "round(avg(RICH_OXY_AMOUNT),2) as RICH_OXY_AMOUNT ,";
            strSQL += "round(avg(T_TEN_HEART),2) as T_TEN_HEART ,";
            strSQL += "round(avg(T_LD_HEART),2) as T_LD_HEART  ,";
            strSQL += "round(avg(T_LJ_HEART),2) as T_LJ_HEART  ,";
            strSQL += "round(avg(XBG),2) as XBG ,"; ;
            strSQL += "round(avg(R_LG_ACTIVE),2) as R_LG_ACTIVE ,";
            strSQL += "round(avg(GY_OXY_AMOUNT),2) as GY_OXY_AMOUNT ,";
            strSQL += "round(avg(LT_RFH),2) as LT_RFH  ,";
            strSQL += "round(sum(COKE_JET),2) as COKE_JET  ,";
            strSQL += "round(avg(COKE_RATIO),2) as COKE_RATIO  ,";
            strSQL += "round(avg(SPEED_LMXJ),2) as SPEED_LMXJ  ,";
            strSQL += "round(sum(COKE_JET1),2) as COKE_JET1 ,";
            strSQL += "round(avg(TOP_PRESSRATIO),2) as TOP_PRESSRATIO ,";
            strSQL += "round(avg(MIDDLE_PRESSRATIO),2) as MIDDLE_PRESSRATIO ,";
            strSQL += "round(avg(BOTTOM_PRESSRATIO),2) as BOTTOM_PRESSRATIO, ";
            strSQL += "round(avg(TEMPHFQ),2) as TEMPHFQ ";
            strSQL += "from ";
            strSQL += "(select (a.RECORD_TIME+3/24) as time,a.WORK_SHIFT,a.WORK_TEAM,a.accum_charge,RTRIM(TO_CHAR(b.DAY_CHARGE,'FM9990.9'),'.') AS  HOUR_CHARGE,a.GAS_USE,a.BLAST_AMOUNT,a.HOT_PRESS,COLD_PRESS,";
            strSQL += " a.TOP_PRESS,a.BOTTOM_PRESS,a.TOP_PRESSDIFF,a.BOTTOM_PRESSDIFF,a.TOP_PRESSRATIO,a.MIDDLE_PRESSRATIO, ";
            strSQL += " a.BOTTOM_PRESSRATIO,a.TEMPHFQ,a.TQX,BLAST_TEMP,a.TOP_TEMPMAX,a.TOP_TEMPMIN,a.TOP_TEMPAVG,a.RICH_OXY_RATIO, ";
            strSQL += " a.RICH_OXY_AMOUNT,a.COKE_JET,a.COKE_JET1,a.COKE_RATIO,a.BLAST_SPEED, ";
            strSQL += " a.ACT_SPEED,a.TH_BURN_TEMP,a.BLAST_ENERGY,a.P_ALL,a.TQX_T,a.TQX_B,a.GAS_AMOUNT,a.P_IND_WATER,a.XBG,a.P_SOFT1_WATER, ";
            strSQL += " a.P_SOFT2_WATER,a.T_TEN_HEART,a.T_LD_HEART,a.T_LJ_HEART,a.R_LG_ACTIVE,a.OXY_AMOUNT as GY_OXY_AMOUNT,a.LT_RFH,a.SPEED_LMXJ ";
            strSQL += " FROM T_RPT_BF_RUN_PARA a ,T_RPT_ENERGY_CONSUME b ";
            strSQL += "WHERE a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            strSQL += " AND a.RECORD_TIME=b.RECORD_TIME order by a.RECORD_TIME asc) ";
            strSQL += "group by substr(time, 0, 10) ";
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