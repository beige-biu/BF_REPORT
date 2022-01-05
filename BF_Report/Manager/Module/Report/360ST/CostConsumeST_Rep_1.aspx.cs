using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GemBox.Spreadsheet;
using System.IO;

namespace BF_Report.Manager.Module.Report._360ST
{
    public partial class CostConsumeST_Rep_1 : System.Web.UI.Page
    {
        public string strStartTime, strMonthStart, strMonthEnd;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
                gridBase1.Columns["gbc3"].Caption = "日期:" + dateStartTime.Date.ToString("yyyy-MM-dd");
                int iDay = int.Parse(strStartTime.Substring(8, 2));
                if (iDay > 25)
                {
                    strMonthStart = dateStartTime.Date.ToString("yyyy-MM-") + "26";
                    strMonthEnd = dateStartTime.Date.AddMonths(1).ToString("yyyy-MM-") + "25";
                }
                else
                {
                    strMonthStart = dateStartTime.Date.AddMonths(-1).ToString("yyyy-MM-") + "26";
                    strMonthEnd = dateStartTime.Date.ToString("yyyy-MM-") + "25";
                }

            }
            else
            {
                strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
                gridBase1.Columns["gbc3"].Caption = "日期:" + dateStartTime.Date.ToString("yyyy-MM-dd");
                int iDay = int.Parse(strStartTime.Substring(8, 2));
                if (iDay > 25)
                {
                    strMonthStart = dateStartTime.Date.ToString("yyyy-MM-") + "26";
                    strMonthEnd = dateStartTime.Date.AddMonths(1).ToString("yyyy-MM-") + "25";
                }
                else
                {
                    strMonthStart = dateStartTime.Date.AddMonths(-1).ToString("yyyy-MM-") + "26";
                    strMonthEnd = dateStartTime.Date.ToString("yyyy-MM-") + "25";
                }
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

        public string strIronDay = "0", strMonthIron = "0";


        public void GetSum(string ID, out string a, out string b, out string c)
        {
            string strsql = "SELECT NVL(SUM(DAY_WET),0),NVL(SUM(DAY_TOTAL),0),NVL(SUM(DAY_PCE),0) FROM T_RPT_COST_CONSUME_ST_1 WHERE STATISTICS_ID='" + ID + "' ";
            strsql += " AND to_date(RECORD_DATE, 'yyyy-mm-dd') between to_date('" + strMonthStart + "', 'yyyy-mm-dd') and to_date('" + strStartTime + "', 'yyyy-mm-dd') ";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strsql, ref dt);
            a = dt.Rows[0][0].ToString();
            b = dt.Rows[0][1].ToString();
            c = dt.Rows[0][2].ToString();
            return;


        }
        protected void GetData(string strHeight)
        {
            gridBase1.Columns["gbc3"].Caption = "日期:" + dateStartTime.Date.ToString("yyyy-MM-dd");
            string strSQL = "select * from T_RPT_COST_CONSUME_ST_1 where  RECORD_DATE='" + strStartTime + "'";
            DataTable dtTemp = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dtTemp);
            dtTemp.Columns.Add("MONTH_WET", typeof(string));
            dtTemp.Columns.Add("MONTH_TOTAL", typeof(string));
            dtTemp.Columns.Add("MONTH_PCE", typeof(string));
            dtTemp.Columns.Add("MONTH_COST", typeof(string));
            dtTemp.Columns.Add("MONTH_COST_PCE", typeof(string));
            DataTable dt = dtTemp.Clone();
            CreateDataTable(strMonthStart, strMonthEnd, ref dt);
            string month_cl;
            string b, c;
            GetSum("S5", out month_cl, out b, out c);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strID = dt.Rows[i]["STATISTICS_ID"].ToString();
                string a = dt.Rows[i]["STATISTICS_TYPE"].ToString();
                foreach (DataRow dr in dtTemp.Rows)
                {
                    string month_wet, month_total, month_money;
                    
                    if (dr["STATISTICS_ID"].ToString() == "S5")
                    {
                        gridBase1.Columns["gbc1"].Caption = "本日产量(t):" + dr["DAY_TOTAL"].ToString();
                        gridBase1.Columns["gbc2"].Caption = "本月产量(t):" + month_cl;
                    }
                    if (strID == dr["STATISTICS_ID"].ToString())
                    {
                        GetSum(strID, out month_wet, out month_total, out month_money);
                        if ( a == "矿砂" || a == "溶剂" )
                        {
                            dt.Rows[i]["RECORD_DATE"] = dr["RECORD_DATE"].ToString();
                            dt.Rows[i]["UNIT"] = dr["UNIT"].ToString();
                            dt.Rows[i]["STATISTICS_PCE"] = dr["STATISTICS_PCE"].ToString();
                            dt.Rows[i]["WATER"] = dr["WATER"].ToString();
                            dt.Rows[i]["DAY_WET"] = dr["DAY_WET"].ToString();
                            dt.Rows[i]["DAY_TOTAL"] = dr["DAY_TOTAL"].ToString();
                            dt.Rows[i]["DAY_PCE"] = dr["DAY_PCE"].ToString();
                            dt.Rows[i]["DAY_COST"] = dr["DAY_COST"].ToString();
                            dt.Rows[i]["DAY_COST_PCE"] = dr["DAY_COST_PCE"].ToString();
                            dt.Rows[i]["MONTH_WET"] = month_wet;
                            dt.Rows[i]["MONTH_TOTAL"] = ((100 - double.Parse(dr["WATER"].ToString())) / 100 * double.Parse(month_wet)).ToString("N2").Replace(",", "");
                            dt.Rows[i]["MONTH_PCE"] = (((100 - double.Parse(dr["WATER"].ToString())) / 100 * double.Parse(month_wet)) * double.Parse(dr["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                            dt.Rows[i]["MONTH_COST"] = (((100 - double.Parse(dr["WATER"].ToString())) / 100 * double.Parse(month_wet)) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                            dt.Rows[i]["MONTH_COST_PCE"] = (((100 - double.Parse(dr["WATER"].ToString())) / 100 * double.Parse(month_wet)) / double.Parse(month_cl) * double.Parse(dr["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                        }
                        else if ( a == "工资及附加" || a == "制造费用")
                        {
                            dt.Rows[i]["RECORD_DATE"] = dr["RECORD_DATE"].ToString();
                            dt.Rows[i]["UNIT"] = dr["UNIT"].ToString();
                            dt.Rows[i]["STATISTICS_PCE"] = dr["STATISTICS_PCE"].ToString();
                            dt.Rows[i]["WATER"] = dr["WATER"].ToString();
                            dt.Rows[i]["DAY_WET"] = dr["DAY_WET"].ToString();
                            dt.Rows[i]["DAY_TOTAL"] = dr["DAY_TOTAL"].ToString();
                            dt.Rows[i]["DAY_PCE"] = dr["DAY_PCE"].ToString();
                            dt.Rows[i]["DAY_COST"] = dr["DAY_COST"].ToString();
                            dt.Rows[i]["DAY_COST_PCE"] = dr["DAY_COST_PCE"].ToString();
                            dt.Rows[i]["MONTH_WET"] = "0";
                            dt.Rows[i]["MONTH_TOTAL"] = "0";
                            dt.Rows[i]["MONTH_PCE"] = double.Parse(month_money).ToString("N2").Replace(",", "");
                            dt.Rows[i]["MONTH_COST"] = "0";
                            dt.Rows[i]["MONTH_COST_PCE"] = (double.Parse(month_money) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                        }
                        else
                        {
                            dt.Rows[i]["RECORD_DATE"] = dr["RECORD_DATE"].ToString();
                            dt.Rows[i]["UNIT"] = dr["UNIT"].ToString();
                            dt.Rows[i]["STATISTICS_PCE"] = dr["STATISTICS_PCE"].ToString();
                            dt.Rows[i]["WATER"] = dr["WATER"].ToString();
                            dt.Rows[i]["DAY_WET"] = dr["DAY_WET"].ToString();
                            dt.Rows[i]["DAY_TOTAL"] = dr["DAY_TOTAL"].ToString();
                            dt.Rows[i]["DAY_PCE"] = dr["DAY_PCE"].ToString();
                            dt.Rows[i]["DAY_COST"] = dr["DAY_COST"].ToString();
                            dt.Rows[i]["DAY_COST_PCE"] = dr["DAY_COST_PCE"].ToString();
                            dt.Rows[i]["MONTH_WET"] = month_wet;
                            dt.Rows[i]["MONTH_TOTAL"] = month_total;
                            dt.Rows[i]["MONTH_PCE"] = (double.Parse(month_total) * double.Parse(dr["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                            dt.Rows[i]["MONTH_COST"] = (double.Parse(month_total) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                            dt.Rows[i]["MONTH_COST_PCE"] = (double.Parse(month_total) * double.Parse(dr["STATISTICS_PCE"].ToString()) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                        }

                    }
                }
            }
            foreach (DataRow dr in dt.Rows)
            {
                string strID = dr["STATISTICS_ID"].ToString();
                string strStatPce = dr["STATISTICS_PCE"].ToString();
                if (strID != "" && strStatPce == "")
                {
                    string month_wet, month_total, month_money;
                    GetSum(strID, out month_wet, out month_total, out month_money);
                    strSQL = "select * from T_RPT_COST_CONSUME_ST_1 where  RECORD_DATE between '" + strMonthStart + "' and '" + strMonthEnd + "' and STATISTICS_ID='" + strID + "' order by RECORD_DATE desc";
                    dtTemp = new DataTable();
                    SQLComm.ExecuteSelectSql_dt(strSQL, ref dtTemp);
                    dtTemp.Columns.Add("MONTH_WET", typeof(string));
                    dtTemp.Columns.Add("MONTH_TOTAL", typeof(string));
                    dtTemp.Columns.Add("MONTH_PCE", typeof(string));
                    dtTemp.Columns.Add("MONTH_COST", typeof(string));
                    dtTemp.Columns.Add("MONTH_COST_PCE", typeof(string));
                    if (dtTemp.Rows.Count > 0)
                    {
                        string a = dtTemp.Rows[0]["STATISTICS_TYPE"].ToString();
                        if (a == "矿砂" ||a == "溶剂" )
                        {
                            dr["RECORD_DATE"] = dtTemp.Rows[0]["RECORD_DATE"].ToString();
                            dr["UNIT"] = dtTemp.Rows[0]["UNIT"].ToString();
                            dr["STATISTICS_PCE"] = dtTemp.Rows[0]["STATISTICS_PCE"].ToString();
                            dr["WATER"] = dtTemp.Rows[0]["WATER"].ToString();
                            dr["DAY_WET"] = "0";
                            dr["DAY_TOTAL"] = "0";
                            dr["DAY_PCE"] = "0";
                            dr["DAY_COST"] = "0";
                            dr["DAY_COST_PCE"] = "0";
                            dr["MONTH_WET"] = month_wet; ;
                            dr["MONTH_TOTAL"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * double.Parse(month_wet)).ToString("N2").Replace(",", "");
                            dr["MONTH_PCE"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * double.Parse(month_wet) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                            dr["MONTH_COST"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * double.Parse(month_wet) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                            dr["MONTH_COST_PCE"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * double.Parse(month_wet) / double.Parse(month_cl) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                        }
                        else if (a == "工资及附加" || a == "制造费用")
                        {
                            dr["RECORD_DATE"] = dtTemp.Rows[0]["RECORD_DATE"].ToString();
                            dr["UNIT"] = dtTemp.Rows[0]["UNIT"].ToString();
                            dr["STATISTICS_PCE"] = dtTemp.Rows[0]["STATISTICS_PCE"].ToString();
                            dr["WATER"] = dtTemp.Rows[0]["WATER"].ToString();
                            dr["DAY_WET"] = "0";
                            dr["DAY_TOTAL"] = "0";
                            dr["DAY_PCE"] = "0";
                            dr["DAY_COST"] = "0";
                            dr["DAY_COST_PCE"] = "0";
                            dr["MONTH_WET"] = "0";
                            dr["MONTH_TOTAL"] = "0";
                            dr["MONTH_PCE"] = double.Parse(month_money).ToString("N2").Replace(",", "");
                            dr["MONTH_COST"] = "0";
                            dr["MONTH_COST_PCE"] = (double.Parse(month_money) / double.Parse(month_cl)).ToString("N2");
                        }
                        else
                        {
                            dr["RECORD_DATE"] = dtTemp.Rows[0]["RECORD_DATE"].ToString();
                            dr["UNIT"] = dtTemp.Rows[0]["UNIT"].ToString();
                            dr["STATISTICS_PCE"] = dtTemp.Rows[0]["STATISTICS_PCE"].ToString();
                            dr["WATER"] = dtTemp.Rows[0]["WATER"].ToString();
                            dr["DAY_WET"] = "0";
                            dr["DAY_TOTAL"] = "0";
                            dr["DAY_PCE"] = "0";
                            dr["DAY_COST"] = "0";
                            dr["DAY_COST_PCE"] = "0";
                            dr["MONTH_WET"] = month_wet;
                            dr["MONTH_TOTAL"] = month_total;
                            dr["MONTH_PCE"] = (double.Parse(month_total) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                            dr["MONTH_COST"] = (double.Parse(month_total) * double.Parse(month_wet) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                            dr["MONTH_COST_PCE"] = (double.Parse(month_total) / double.Parse(month_cl) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                        }
                    }
                }
            }
            //SEQ：7种类型,DAY_WET,DAY_TOTAL，DAY_PCE，DAY_COST，DAY_COST_PCE，MONTH_WET,MONTH_TOTAL，MONTH_PCE，MONTH_COST，MONTH_COST_PCE
            double[,] dValue = new double[7, 10] {
                { 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},
                { 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0}
            };
            double d_zj1 = 0, d_zj2 = 0, d_zj3 = 0, d_zj4 = 0;
            foreach (DataRow dr in dt.Rows)
            {
                string strSeq = dr["SEQ"].ToString();
                if (SQLComm.IsNumberic(strSeq))
                {
                    int iSeq = int.Parse(strSeq) - 1;
                    dValue[iSeq, 0] += double.Parse(dr["DAY_WET"].ToString());
                    dValue[iSeq, 1] += double.Parse(dr["DAY_TOTAL"].ToString());
                    dValue[iSeq, 2] += double.Parse(dr["DAY_PCE"].ToString());
                    dValue[iSeq, 3] += double.Parse(dr["DAY_COST"].ToString());
                    dValue[iSeq, 4] += double.Parse(dr["DAY_COST_PCE"].ToString());
                    dValue[iSeq, 5] += double.Parse(dr["MONTH_WET"].ToString());
                    dValue[iSeq, 6] += double.Parse(dr["MONTH_TOTAL"].ToString());
                    dValue[iSeq, 7] += double.Parse(dr["MONTH_PCE"].ToString());
                    dValue[iSeq, 8] += double.Parse(dr["MONTH_COST"].ToString());
                    dValue[iSeq, 9] += double.Parse(dr["MONTH_COST_PCE"].ToString());
                }
                if (dr["STATISTICS_ID"].ToString() == "0403")//折旧
                {
                    d_zj1 = double.Parse(dr["DAY_PCE"].ToString());
                    d_zj2 = double.Parse(dr["DAY_COST_PCE"].ToString());
                    d_zj3 = double.Parse(dr["MONTH_PCE"].ToString());
                    d_zj4 = double.Parse(dr["MONTH_COST_PCE"].ToString());
                }
            }
            double sum_day_pce = 0, sum_day_cost = 0, sum_mon_pce = 0, sum_mon_cost = 0;//生产成本
            for (int i = 0; i < dValue.GetLength(0); i++)
            {
                sum_day_pce += dValue[i, 2];
                sum_day_cost += dValue[i, 4];
                sum_mon_pce += dValue[i, 7];
                sum_mon_cost += dValue[i, 9];
            }
            //可变成本(折旧+工资大项目SEQ=5)
            double d_kb1 = 0, d_kb2 = 0, d_kb3 = 0, d_kb4 = 0;
            d_kb1 = d_zj1 + dValue[4, 2];
            d_kb2 = d_zj2 + dValue[4, 4];
            d_kb3 = d_zj3 + dValue[4, 7];
            d_kb4 = d_zj4 + dValue[4, 9];
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["STATISTICS_DES"].ToString() == "一、原材料")
                {
                    //dr["DAY_WET"] = (dValue[0, 0] + dValue[1, 0]).ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = (dValue[0, 1]+ dValue[1, 1]).ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = (dValue[0, 2] + dValue[1, 2]).ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = (dValue[0, 3] + dValue[1, 3]).ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = (dValue[0, 4] + dValue[1, 4]).ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = (dValue[0, 5] + dValue[1, 5]).ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = (dValue[0, 6] + dValue[1, 6]).ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = (dValue[0, 7] + dValue[1, 7]).ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = (dValue[0, 8] + dValue[1, 8]).ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = (dValue[0, 9] + dValue[1, 9]).ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "(一)矿砂")
                {
                    dr["DAY_WET"] = dValue[0, 0].ToString("N2").Replace(",", "");
                    dr["DAY_TOTAL"] = dValue[0, 1].ToString("N2").Replace(",", "");
                    dr["DAY_PCE"] = dValue[0, 2].ToString("N2").Replace(",", "");
                    dr["DAY_COST"] = dValue[0, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[0, 4].ToString("N2").Replace(",", "");
                    dr["MONTH_WET"] = dValue[0, 5].ToString("N2").Replace(",", "");
                    dr["MONTH_TOTAL"] = dValue[0, 6].ToString("N2").Replace(",", "");
                    dr["MONTH_PCE"] = dValue[0, 7].ToString("N2").Replace(",", "");
                    dr["MONTH_COST"] = dValue[0, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[0, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "(二)熔剂")
                {
                    //dr["DAY_WET"] = dValue[1, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[1, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[1, 2].ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = dValue[1, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[1, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[1, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[1, 6].ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = dValue[1, 7].ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = dValue[1, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[1, 9].ToString("N2").Replace(",", "");
                }

                if (dr["STATISTICS_DES"].ToString() == "二、燃料动力")
                {
                    //dr["DAY_WET"] = dValue[2, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[2, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[2, 2].ToString("N2").Replace(",", "");
                    dr["DAY_COST"] = dValue[2, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[2, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[2, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[2, 6].ToString("N2").Replace(",", "");
                    // dr["MONTH_PCE"] = dValue[2, 7].ToString("N2").Replace(",", "");
                    dr["MONTH_COST"] = dValue[2, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[2, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "三、工资及附加")
                {
                    //dr["DAY_WET"] = dValue[3, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[3, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[3, 2].ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = dValue[3, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[3, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[3, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[3, 6].ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = dValue[3, 7].ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = dValue[3, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[3, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "四、制造费用")
                {
                    //dr["DAY_WET"] = dValue[4, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[4, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[4, 2].ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = dValue[4, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[4, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[4, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[4, 6].ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = dValue[4, 7].ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = dValue[4, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[4, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "五、回收")
                {
                    //dr["DAY_WET"] = dValue[5, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[5, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[5, 2].ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = dValue[5, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[5, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[5, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[5, 6].ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = dValue[5, 7].ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = dValue[5, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[5, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "生产总成本")
                {
                    // dr["DAY_PCE"] = sum_day_pce.ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = sum_day_cost.ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = sum_mon_pce.ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = sum_mon_cost.ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "固定成本")
                {
                    // dr["DAY_PCE"] = d_kb1.ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = d_kb2.ToString("N2").Replace(",", "");
                    // dr["MONTH_PCE"] = d_kb3.ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = d_kb4.ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "可变成本")
                {
                    // dr["DAY_PCE"] = (sum_day_pce - d_kb1).ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = (sum_day_cost - d_kb2).ToString("N2").Replace(",", "");
                    // dr["MONTH_PCE"] = (sum_mon_pce - d_kb3).ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = (sum_mon_cost - d_kb4).ToString("N2").Replace(",", "");
                }
            }

            dt.AcceptChanges();
            gridBase1.DataSource = dt;
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Auto;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 175;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
        }

        protected void CreateDataTable(string strMonthStart, string strMonthEnd, ref DataTable dt)
        {
            try
            {
                string strSQL = "";
                strSQL = "select distinct STATISTICS_ID,STATISTICS_DES,STATISTICS_TYPE,UNIT,SEQ from T_RPT_COST_CONSUME_ST_1 where  RECORD_DATE between '" + strMonthStart + "' and '" + strMonthEnd + "' order by Seq,STATISTICS_ID";
                DataTable dtTemp = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dtTemp);
                DataRow dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "一、原材料";
                dt.Rows.Add(dataRow);
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "(一)矿砂";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "矿砂")
                    {
                        dr["SEQ"] = "1";
                        dt.ImportRow(dr);
                    }
                }
                foreach (DataRow dr in dtTemp.Rows)

                    dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "(二)熔剂";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "溶剂")
                    {
                        dr["SEQ"] = "2";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();

                dataRow["STATISTICS_DES"] = "二、燃料动力";
                dt.Rows.Add(dataRow);

                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "燃料动力")
                    {
                        dr["SEQ"] = "3";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "三、工资及附加";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "工资及附加")
                    {
                        dr["SEQ"] = "4";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "四、制造费用";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "制造费用")
                    {
                        dr["SEQ"] = "5";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "五、回收";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "回收")
                    {
                        dr["SEQ"] = "6";
                        dt.ImportRow(dr);
                    }
                }
                
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "可变成本";
                dataRow["UNIT"] = "元";
                dt.Rows.Add(dataRow);
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "固定成本";
                dataRow["UNIT"] = "元";
                dt.Rows.Add(dataRow);
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "生产总成本";
                dataRow["UNIT"] = "元";
                dt.Rows.Add(dataRow);
            }
            catch { }
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            string saveFileName = "";
            try
            {
                SpreadsheetInfo.SetLicense("EQU2-1000-0000-000U");
                //存放于服务器
                ExcelFile excelFile = new ExcelFile();
                string file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\炼铁分厂2号高炉槽上成本日报表.xls";
                excelFile.LoadXls(file);
                //string file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\一炼铁分厂2#高炉日工序生产成本表.xls";
                //ExcelFile excelFile = new ExcelFile(file);
                ExcelWorksheet sheet = excelFile.Worksheets[0];
                sheet.Cells[0, 0].Value = "烧结分厂" + DateTime.Parse(dateStartTime.Text.ToString()).ToString("yyyy年MM月dd日") + "360烧结成本日报表";
                DataTable dt = (DataTable)gridBase1.DataSource;
                string strIronDay = gridBase1.Columns["gbc1"].Caption.Substring(8);
                string strIronMonth = gridBase1.Columns["gbc2"].Caption.Substring(8);
                sheet.Cells[1, 4].Value = strIronDay;
                sheet.Cells[1, 7].Value = strIronMonth;

                CellStyle tmpStyle = new CellStyle();
                //tmpStyle.Font.Weight = ExcelFont.BoldWeight;
                tmpStyle.Font.Color = System.Drawing.Color.Black;
                tmpStyle.WrapText = true;
                tmpStyle.Borders.SetBorders(MultipleBorders.Right | MultipleBorders.Bottom, System.Drawing.Color.Black, LineStyle.Thin);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sheet.Cells[4 + i, 0].Value = dt.Rows[i]["STATISTICS_DES"].ToString();
                    sheet.Cells[4 + i, 0].Style = tmpStyle;

                    sheet.Cells[4 + i, 1].Value = dt.Rows[i]["UNIT"].ToString();
                    sheet.Cells[4 + i, 1].Style = tmpStyle;

                    sheet.Cells[4 + i, 2].Value = dt.Rows[i]["STATISTICS_PCE"].ToString();
                    sheet.Cells[4 + i, 2].Style = tmpStyle;

                    sheet.Cells[4 + i, 3].Value = dt.Rows[i]["WATER"].ToString();
                    sheet.Cells[4 + i, 3].Style = tmpStyle;

                    sheet.Cells[4 + i, 4].Value = dt.Rows[i]["DAY_WET"].ToString();
                    sheet.Cells[4 + i, 4].Style = tmpStyle;

                    sheet.Cells[4 + i, 5].Value = dt.Rows[i]["DAY_TOTAL"].ToString();
                    sheet.Cells[4 + i, 5].Style = tmpStyle;

                    sheet.Cells[4 + i, 6].Value = dt.Rows[i]["DAY_PCE"].ToString();
                    sheet.Cells[4 + i, 6].Style = tmpStyle;

                    sheet.Cells[4 + i, 7].Value = dt.Rows[i]["DAY_COST"].ToString();
                    sheet.Cells[4 + i, 7].Style = tmpStyle;

                    sheet.Cells[4 + i, 8].Value = dt.Rows[i]["DAY_COST_PCE"].ToString();
                    sheet.Cells[4 + i, 8].Style = tmpStyle;

                    sheet.Cells[4 + i, 9].Value = dt.Rows[i]["MONTH_WET"].ToString();
                    sheet.Cells[4 + i, 9].Style = tmpStyle;

                    sheet.Cells[4 + i, 10].Value = dt.Rows[i]["MONTH_TOTAL"].ToString();
                    sheet.Cells[4 + i, 10].Style = tmpStyle;

                    sheet.Cells[4 + i, 11].Value = dt.Rows[i]["MONTH_PCE"].ToString();
                    sheet.Cells[4 + i, 11].Style = tmpStyle;

                    sheet.Cells[4 + i, 12].Value = dt.Rows[i]["MONTH_COST"].ToString();
                    sheet.Cells[4 + i, 12].Style = tmpStyle;

                    sheet.Cells[4 + i, 13].Value = dt.Rows[i]["MONTH_COST_PCE"].ToString();
                    sheet.Cells[4 + i, 13].Style = tmpStyle;
                }
                saveFileName = file.Substring(0, file.Length - 4) + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";

                FileInfo TargetFile = new FileInfo(saveFileName);
                excelFile.SaveXls(saveFileName);

                string strTime = DateTime.Now.ToString("yyyyMMddHHmmss");
                //清除缓冲区流中的所有内容输出.
                Page.Response.Clear();
                //向输出流添加HTTP头 [指定下载/保存 对话框的文件名]
                Page.Response.AppendHeader("Content-Disposition", "attachment; filename=" + Page.Server.UrlEncode("烧结分厂360烧结成本日报表_" + strTime + ".xls"));
                //向输出流添加HTTP头 [指定文件的长度,这样下载文件就会显示正确的进度
                Page.Response.AppendHeader("Content-Length", TargetFile.Length.ToString());
                //表明输出的HTTP为流[stream],因此客户端只能下载.
                Page.Response.ContentType = "application/octet-stream";
                //发送文件流到客户端.
                Page.Response.WriteFile(TargetFile.FullName);
                //Page.Response.w
                //停止执行当前页
                //TargetFile.Delete();
                Page.Response.Flush();
                TargetFile.Delete();
                Page.Response.End();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>window.alert('" + ex.Message + "');</script>");
            }
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