using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using GemBox.ExcelLite;
using GemBox.Spreadsheet;
using System.IO;

namespace BF_Report.Manager.Module.Report._1280BF
{
    public partial class CostConsumeCX_Rep_1 : System.Web.UI.Page
    {
        public string strStartTime, strMonthStart, strMonthEnd,starttime,endtime, strmintime,endtime_day,fjd_monlj;
        public int iDay;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
                strmintime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd");
                gridBase1.Columns["gbc3"].Caption = "日期:" + dateStartTime.Date.ToString("yyyy-MM-dd");
                endtime_day = dateStartTime.Date.ToString("yyyyMMdd");
                endtime = dateStartTime.Date.ToString("yyyyMMdd") + "200000";               
                iDay = int.Parse(strStartTime.Substring(8, 2));
                if (iDay > 25)
                {
                    strMonthStart = dateStartTime.Date.ToString("yyyy-MM-") + "26";
                    strMonthEnd = dateStartTime.Date.AddMonths(1).ToString("yyyy-MM-") + "25";
                    starttime = dateStartTime.Date.ToString("yyyyMM") + "25200001";
                }
                else
                {
                    strMonthStart = dateStartTime.Date.AddMonths(-1).ToString("yyyy-MM-") + "26";
                    strMonthEnd = dateStartTime.Date.ToString("yyyy-MM-") + "25";
                    starttime = dateStartTime.Date.AddMonths(-1).ToString("yyyyMM") + "25200001";
                }

            }
            else
            {
                strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
                strmintime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd");
                gridBase1.Columns["gbc3"].Caption = "日期:" + dateStartTime.Date.ToString("yyyy-MM-dd");
                endtime_day = dateStartTime.Date.ToString("yyyyMMdd");
                endtime = dateStartTime.Date.ToString("yyyyMMdd") + "200000";
                iDay = int.Parse(strStartTime.Substring(8, 2));
                if (iDay > 25)
                {
                    strMonthStart = dateStartTime.Date.ToString("yyyy-MM-") + "26";
                    strMonthEnd = dateStartTime.Date.AddMonths(1).ToString("yyyy-MM-") + "25";
                    starttime = dateStartTime.Date.ToString("yyyyMM") + "25200001";
                }
                else
                {
                    strMonthStart = dateStartTime.Date.AddMonths(-1).ToString("yyyy-MM-") + "26";
                    strMonthEnd = dateStartTime.Date.ToString("yyyy-MM-") + "25";
                    starttime = dateStartTime.Date.AddMonths(-1).ToString("yyyyMM") + "25200001";
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

        
         public  void  GetSum(string ID,out string a,out string b,out string c)
        {

            string vc = " ";
            if (ID.Length >= 5)
            {
                vc = ID.Substring(0, 5);
            }
            if (vc == "D0602" || vc == "D0603" || vc == "D0710" || vc == "360D0" || vc == "C6020"||ID== "D07201010002")
            {
                //取出单价水分
                string sql0 = "";
                sql0 = "select water,price from T_INSERT_MATERIAL_NEW where  prodcode='" + ID + "' AND WP_NO='GL'";
                if (vc == "360D0")
                {
                    sql0 = "select water,price from T_INSERT_MATERIAL_NEW where  prodcode='D06061010001' AND WP_NO='GL'";
                }
                DataTable dt0 = new DataTable();
                SQLComm.ExecuteSelectSql_dt(sql0, ref dt0);
                //取值
                string strsql = "SELECT NVL(WGT,0) AS WGT FROM L2BF_COM.TMMIRV2_monjs WHERE MAT_CODE='" + ID + "' AND WORK_DATE='" + strStartTime + "' and unit_no='T6' ";
                if(ID== "D07201010002")
                {
                    strsql = "select ";
                    strsql += "((SELECT NVL(SUM(DAY_WET),0) FROM T_RPT_COST_CONSUME_JL_1 WHERE STATISTICS_ID in ('D07201010001') ";
                    strsql += " AND to_date(RECORD_DATE, 'yyyy-mm-dd') between to_date('" + strMonthStart + "', 'yyyy-mm-dd') and to_date('" + strStartTime + "', 'yyyy-mm-dd')) ";
                    strsql += " - ";
                    strsql += "(SELECT SUM(WGT)*1000 FROM L2BF_COM.TMMIRV2_monjs WHERE MAT_CODE IN ('D07201010001','D07201010002') AND WORK_DATE='" + strStartTime + "' and unit_no='T6'))*-1/1000 ";
                    strsql += " AS WGT FROM DUAL";
                }
                DataTable dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strsql, ref dt);
                //结算值第二天中午才整理出来，如果查询的时候还没有值，用已有的结算值累计加前一天日实时值
                if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString()!="")
                {
                    a = (double.Parse(dt.Rows[0]["WGT"].ToString()) * 1000).ToString("N2").Replace(",", "");
                    b = ((100 - double.Parse(dt0.Rows[0]["WATER"].ToString())) / 100 * double.Parse(a)).ToString("N2").Replace(",", "");
                    c = (double.Parse(dt0.Rows[0]["PRICE"].ToString()) * double.Parse(b)).ToString("N2").Replace(",", "");
                    if (ID == "D07201010002")
                    {
                        fjd_monlj = ((100 - double.Parse(dt0.Rows[0]["WATER"].ToString())) / 100 * double.Parse(a)).ToString("N2").Replace(",", "");
                    }
                    return;
                }
                else
                {
                    if(ID== "D07201010002")
                    {
                        if(iDay==26)
                        {
                            strsql = "select ";
                            strsql += "((SELECT NVL(SUM(DAY_WET),0) FROM T_RPT_COST_CONSUME_JL_1 WHERE STATISTICS_ID in ('D07201010001') ";
                            strsql += " AND to_date(RECORD_DATE, 'yyyy-mm-dd') between to_date('" + strMonthStart + "', 'yyyy-mm-dd') and to_date('" + strStartTime + "', 'yyyy-mm-dd')) ";
                            strsql += " - ";
                            strsql += "(SELECT NVL(SUM(WGT),0)*1000 FROM L2BF_COM.TMMIRV2_dayss WHERE MAT_CODE IN ('D07201010001','D07201010002') AND WORK_DATE='" + strStartTime + "' and unit_no='T6'))*-1";
                            strsql += " AS WGT FROM DUAL";
                        }
                        else
                        {
                            strsql = "select ";
                            strsql += "((SELECT NVL(SUM(DAY_WET),0) FROM T_RPT_COST_CONSUME_JL_1 WHERE STATISTICS_ID in ('D07201010001') ";
                            strsql += " AND to_date(RECORD_DATE, 'yyyy-mm-dd') between to_date('" + strMonthStart + "', 'yyyy-mm-dd') and to_date('" + strStartTime + "', 'yyyy-mm-dd')) ";
                            strsql += " - ";
                            strsql += "(SELECT NVL(SUM(WGT),0)*1000 FROM L2BF_COM.TMMIRV2_monjs WHERE MAT_CODE IN ('D07201010001','D07201010002') AND WORK_DATE='" + strmintime + "' and unit_no='T6') ";
                            strsql += " - ";
                            strsql += "(SELECT NVL(SUM(WGT),0)*1000 FROM L2BF_COM.TMMIRV2_dayss WHERE MAT_CODE IN ('D07201010001','D07201010002') AND WORK_DATE='" + strStartTime + "' and unit_no='T6'))*-1";
                            strsql += " AS WGT FROM DUAL";
                        }
                        
                        dt = new DataTable();
                        SQLComm.ExecuteSelectSql_dt(strsql, ref dt);
                        a = (double.Parse(dt.Rows[0]["WGT"].ToString())).ToString("N2").Replace(",", "");
                        b = ((100 - double.Parse(dt0.Rows[0]["WATER"].ToString())) / 100 * double.Parse(a)).ToString("N2").Replace(",", "");
                        c = (double.Parse(dt0.Rows[0]["PRICE"].ToString()) * double.Parse(b)).ToString("N2").Replace(",", "");
                        fjd_monlj= ((100 - double.Parse(dt0.Rows[0]["WATER"].ToString())) / 100 * double.Parse(a)).ToString("N2").Replace(",", "");
                        return;

                    }
                    else
                    {
                        strsql = "SELECT NVL(WGT,0) AS WGT FROM L2BF_COM.TMMIRV2_monjs WHERE MAT_CODE='" + ID + "' AND WORK_DATE='" + strmintime + "' and unit_no='T6' ";
                        dt = new DataTable();
                        SQLComm.ExecuteSelectSql_dt(strsql, ref dt);
                        string wgt1 ="0";
                        if(dt.Rows.Count==0|| strStartTime.Substring(8,2)=="26")
                        {
                            wgt1 = "0";
                        }
                        else
                        {
                            wgt1 = dt.Rows[0]["WGT"].ToString();
                        }
                        string sql1 = "SELECT NVL(WGT,0) AS WGT FROM L2BF_COM.TMMIRV2_dayss WHERE MAT_CODE='" + ID + "' AND WORK_DATE='" + strStartTime + "' and unit_no='T6' ";
                        dt = new DataTable();
                        SQLComm.ExecuteSelectSql_dt(sql1, ref dt);
                        string wgt2 = "0";
                        if (dt.Rows.Count > 0)
                        {
                            wgt2 = dt.Rows[0]["WGT"].ToString();
                        }

                        double wgt = double.Parse(wgt1) + double.Parse(wgt2);
                        a = (wgt * 1000).ToString("N2").Replace(",", "");
                        b = ((100 - double.Parse(dt0.Rows[0]["WATER"].ToString())) / 100 * double.Parse(a)).ToString("N2").Replace(",", "");
                        c = (double.Parse(dt0.Rows[0]["PRICE"].ToString()) * double.Parse(b)).ToString("N2").Replace(",", "");
                        return;
                    }
                    

                }

            }
            else
            {
                string strsql = "SELECT NVL(SUM(DAY_WET),0),NVL(SUM(DAY_TOTAL),0),NVL(SUM(DAY_PCE),0) FROM T_RPT_COST_CONSUME_JL_1 WHERE STATISTICS_ID='" + ID + "' ";
                strsql += " AND to_date(RECORD_DATE, 'yyyy-mm-dd') between to_date('" + strMonthStart + "', 'yyyy-mm-dd') and to_date('" + strStartTime + "', 'yyyy-mm-dd') ";
                DataTable dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strsql, ref dt);
                a = dt.Rows[0][0].ToString();
                b = dt.Rows[0][1].ToString();
                c = dt.Rows[0][2].ToString();
                return;
            }





        }
        protected void GetData(string strHeight)
        {
            gridBase1.Columns["gbc3"].Caption = "日期:" + dateStartTime.Date.ToString("yyyy-MM-dd");
            //string strSQL = "select * from T_RPT_COST_CONSUME_CX_1 where (STATISTICS_TYPE!=' ' OR SEQ='7') AND RECORD_DATE='" + strStartTime + "'";
            string strSQL = "select * from T_RPT_COST_CONSUME_CX_1 where  RECORD_DATE='" + strStartTime + "'";
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
            double c_ironoff = 0;
            string sqlironoff = "select value from T_BASE_SYSDATA t where c_flag='c_ironoff'";
            DataTable dtironoff = new DataTable();
            SQLComm.ExecuteSelectSql_dt(sqlironoff, ref dtironoff);
            c_ironoff = double.Parse(dtironoff.Rows[0][0].ToString());
            string sql1 = "SELECT SUM(NET_WEIGHT)*"+c_ironoff+"  FROM L2BF_COM.TMMIRF9_IO WHERE UNIT_NO='6' ";
            sql1 += "AND (PONDER_TIME>'" + starttime + "' AND PONDER_TIME<='" + endtime + "')";
            DataTable dtcl = new DataTable();
            SQLComm.ExecuteSelectSql_dt(sql1, ref dtcl);
            month_cl = dtcl.Rows[0][0].ToString();
            double sjxh400 = 0;
            double sjxh360 = 0;
            double jg400 = 0;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string strID = dt.Rows[i]["STATISTICS_ID"].ToString();
                string a = dt.Rows[i]["STATISTICS_TYPE"].ToString();
                foreach (DataRow dr in dtTemp.Rows)
                {
                    string month_wet, month_total,month_money;

                    if (dr["STATISTICS_ID"].ToString() == "T6")
                    {
                        gridBase1.Columns["gbc1"].Caption = "本日产量(t):"+ dr["DAY_TOTAL"].ToString();                                           
                        gridBase1.Columns["gbc2"].Caption = "本月产量(t):" + month_cl;
                    }
                    if (strID == dr["STATISTICS_ID"].ToString())
                    {
                        GetSum(strID, out month_wet, out month_total,out month_money);
                        if (a == "铁水" || a == "烧结矿" || a == "煤" || a == "球团" || a == "块矿" || a == "焦丁" || a == "焦" || a == "溶剂" || a == null)
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
                            dt.Rows[i]["MONTH_TOTAL"] = ((100 - double.Parse(dr["WATER"].ToString())) / 100 * double.Parse(month_wet)).ToString("N2").Replace(",","");
                            dt.Rows[i]["MONTH_PCE"] = (((100 - double.Parse(dr["WATER"].ToString())) / 100 * double.Parse(month_wet)) * double.Parse(dr["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                            dt.Rows[i]["MONTH_COST"] = (((100 - double.Parse(dr["WATER"].ToString())) / 100 * double.Parse(month_wet)) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                            dt.Rows[i]["MONTH_COST_PCE"] = (((100 - double.Parse(dr["WATER"].ToString())) / 100 * double.Parse(month_wet)) / double.Parse(month_cl) * double.Parse(dr["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                        }
                        else if(a == "辅助材料" || a == "工资及附加" || a == "制造费用")
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
                            dt.Rows[i]["MONTH_WET"] ="0";
                            dt.Rows[i]["MONTH_TOTAL"] = "0";
                            dt.Rows[i]["MONTH_PCE"] = double.Parse(month_money).ToString("N2").Replace(",","");
                            dt.Rows[i]["MONTH_COST"] = "0";
                            dt.Rows[i]["MONTH_COST_PCE"] = (double.Parse(month_money) /double.Parse(month_cl)).ToString("N2").Replace(",","");
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
                string name = dr["STATISTICS_DES"].ToString();
                string e, f, g;
                GetSum("360D06061010001", out e, out f, out g);
                sjxh360 = double.Parse(e);
                if (strID != "" && (strStatPce == ""||name=="烧结矿"))
                {
                    string month_wet,month_total,month_money;
                    GetSum(strID, out month_wet,out month_total,out month_money);
                    //strSQL = "select * from T_RPT_COST_CONSUME_CX_1 where  (STATISTICS_TYPE!=' ' OR SEQ='7') AND RECORD_DATE between '" + strMonthStart + "' and '" + strMonthEnd + "' and STATISTICS_ID='" + strID + "' order by RECORD_DATE desc";
                    strSQL = "select * from T_RPT_COST_CONSUME_CX_1 where   RECORD_DATE between '" + strMonthStart + "' and '" + strMonthEnd + "' and STATISTICS_ID='" + strID + "' order by RECORD_DATE desc";
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

                        if (name == "烧结矿")
                        {
                            
                            //========直接改用胖胖算好的量=======
                            string strsqlsjk = "select wgt from L2BF_COM.TMMIRV2_MONJS t where unit_no='T6' AND MAT_CODE='400D06061010001' AND WORK_DATE='" + strStartTime + "' ";
                            DataTable dtsjk = new DataTable();
                            SQLComm.ExecuteSelectSql_dt(strsqlsjk, ref dtsjk);
                            if(dtsjk.Rows.Count!=0 && dtsjk.Rows[0][0].ToString()!="")
                            {
                                sjxh400 = double.Parse(dtsjk.Rows[0][0].ToString());
                            }
                            //
                            else
                            {
                                //1280槽下烧结矿+0.88返矿-360烧结矿的月累计值 
                                //double sjk_ls_1280 = double.Parse(month_wet) - sjxh360;
                                //查出400烧结矿当月总产量
                                string strsql0 = "select NVL(CL_SUM,0)*1000 from oraltl2_st.T_PRODUCE_SINTER_SCRB where team = '累计' and RECORD_DATE = to_date('" + endtime + "', 'yyyy/mm/dd hh24:mi:ss') ";
                                DataTable dt1 = new DataTable();
                                SQLComm.ExecuteSelectSql_dt(strsql0, ref dt1);
                                double month_sjk_400 = double.Parse(dt1.Rows[0][0].ToString());
                                //查出400烧结当月落地烧的量
                                strsql0 = " select nvl(sum(NET_WT),0)*1000  from XCT1.TYMIRD3 @TO_XCTQ where SUPPLY_DEPT_CODE = '8020' and(BUY_DEPT_CNAME = '新烧结' OR BUY_DEPT_CNAME = '储运公司') and RECV_DEPT = '烧结矿' ";
                                strsql0 += "and to_char(to_date(CAL_TIME,'yyyy-mm-dd hh24:mi:ss'),'yyyymmddhh24miss')> '" + starttime + "' ";
                                strsql0 += " and to_char(to_date(CAL_TIME,'yyyy-mm-dd hh24:mi:ss'),'yyyymmddhh24miss')<= '" + endtime + "'";
                                dt1 = new DataTable();
                                SQLComm.ExecuteSelectSql_dt(strsql0, ref dt1);
                                double month_sjk_400_lds = double.Parse(dt1.Rows[0][0].ToString());
                                //查出1280槽下烧结矿值总量
                                strsql0 = "SELECT SUM(WET_WGT)*1000  FROM l2bf_com.tb_o_glrlsj WHERE MAT_PROD_CODE='D06061010001' AND WORK_DATE between replace('" + strMonthStart + "','-','') and '" + endtime_day + "'";
                                dt1 = new DataTable();
                                SQLComm.ExecuteSelectSql_dt(strsql0, ref dt1);
                                double month_sjk = double.Parse(dt1.Rows[0][0].ToString());
                                //查出1500槽下烧结矿值总量
                                //strsql0 = "select SUM(DAY_WET) from T_RPT_COST_CONSUME_JL_2 t where statistics_des='烧结矿' AND RECORD_DATE between '" + strMonthStart + "' and '" + strMonthEnd + "'";
                                strsql0 = "select SUM(SUM_SF)*1000 from T_RPT_MATERIAL t WHERE RECORD_TIME BETWEEN TO_DATE('" + starttime + "','yyyy/mm/dd hh24:mi:ss') and TO_DATE('" + endtime + "','yyyy/mm/dd hh24:mi:ss')";
                                dt1 = new DataTable();
                                SQLComm.ExecuteSelectSql_dt(strsql0, ref dt1);
                                double month_sjk_1500_LS = double.Parse(dt1.Rows[0][0].ToString());
                                //查出1280当月返矿*0.88
                                if (iDay == 26)
                                {
                                    strsql0 = "select wgt*0.88*1000 as wet_wgt from  l2bf_com.tmmirv2_dayss ";
                                    strsql0 += " where mat_code = 'D06040020100000X' and unit_no = 'T6' and WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd')  ";
                                }
                                else
                                {
                                    strsql0 = "select wgt*0.88*1000 as wet_wgt from  l2bf_com.tmmirv2_monjs ";
                                    strsql0 += " where mat_code = 'D06040020100000X' and unit_no = 'T6' and (WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd') or WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss')-1,'yyyy-MM-dd' )) ORDER BY WORK_DATE DESC ";
                                }

                                dt1 = new DataTable();
                                SQLComm.ExecuteSelectSql_dt(strsql0, ref dt1);
                                double month_fk_1280 = double.Parse(dt1.Rows[0][0].ToString());

                                //查出1500当月返矿*0.88
                                if (iDay == 26)
                                {
                                    strsql0 = "select wgt*0.88*1000 as wet_wgt from  l2bf_com.tmmirv2_dayss ";
                                    strsql0 += " where mat_code = 'D06040020100000X' and unit_no = 'T7' and WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd') ";
                                }
                                else
                                {
                                    strsql0 = "select wgt*0.88*1000 as wet_wgt from  l2bf_com.tmmirv2_monjs ";
                                    strsql0 += " where mat_code = 'D06040020100000X' and unit_no = 'T7' and (WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd') or WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss')-1,'yyyy-MM-dd' )) ORDER BY WORK_DATE DESC";
                                }

                                dt1 = new DataTable();
                                SQLComm.ExecuteSelectSql_dt(strsql0, ref dt1);
                                double month_fk_1500 = double.Parse(dt1.Rows[0][0].ToString());
                                //查出1280当月使用360烧结矿
                                if (iDay == 26)
                                {
                                    strsql0 = "select wgt*1000  from  l2bf_com.tmmirv2_dayss ";
                                    strsql0 += " where mat_name = '烧结矿' and unit_no = 'T6' and WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd')  ";
                                }
                                else
                                {
                                    strsql0 = "select wgt*1000  from  l2bf_com.tmmirv2_monjs ";
                                    strsql0 += " where mat_name = '烧结矿' and unit_no = 'T6' and (WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd') or WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss')-1,'yyyy-MM-dd' )) ORDER BY WORK_DATE DESC ";
                                }

                                dt1 = new DataTable();
                                SQLComm.ExecuteSelectSql_dt(strsql0, ref dt1);
                                double month_sjk360_1280 = 0;
                                if (dt1.Rows.Count!=0 && dt1.Rows[0][0].ToString()!="")
                                {
                                    month_sjk360_1280 = double.Parse(dt1.Rows[0][0].ToString());
                                }
                                
                                //查出1500当月使用360烧结矿
                                if (iDay == 26)
                                {
                                    strsql0 = "select wgt*1000 from  l2bf_com.tmmirv2_dayss ";
                                    strsql0 += " where mat_name = '烧结矿' and unit_no = 'T7' and WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd') ";
                                }
                                else
                                {
                                    strsql0 = "select wgt*1000 from  l2bf_com.tmmirv2_monjs ";
                                    strsql0 += " where mat_name = '烧结矿' and unit_no = 'T7' and (WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd') or WORK_DATE=TO_CHAR(TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss')-1,'yyyy-MM-dd' )) ORDER BY WORK_DATE DESC ";
                                }

                                dt1 = new DataTable();
                                SQLComm.ExecuteSelectSql_dt(strsql0, ref dt1);
                                double month_sjk360_1500 = 0;
                                if (dt1.Rows.Count != 0 && dt1.Rows[0][0].ToString() != "")
                                {
                                    month_sjk360_1500 = double.Parse(dt1.Rows[0][0].ToString());
                                }
                                    
                                //1280槽下烧结矿+0.88返矿-360烧结矿
                                double month_1280 = month_sjk - month_fk_1280 - month_sjk360_1280;
                                //1500槽下烧结矿+0.88返矿-360烧结矿
                                double month_1500 = month_sjk_1500_LS - month_fk_1500 - month_sjk360_1500;

                                //1500烧结矿=（400烧结当月总产量-400烧结当月落地烧的量）*（1280槽下烧结矿+0.88返矿-360烧结矿的月累计值 /(1500槽下烧结矿+0.88返矿-360烧结矿的月累计值 +1280槽下烧结矿+0.88返矿-360烧结矿的月累计值 )）
                                //sjxh400 = double.Parse(((month_sjk_400 - month_sjk_400_lds) * (month_sjk / (month_sjk + month_sjk_1500_LS))).ToString("N2"));
                                sjxh400 = double.Parse(((month_sjk_400 - month_sjk_400_lds) * (month_1280 / (month_1280 + month_1500))).ToString("N2"));
                            }



                        }
                        if (a=="铁水"||a=="烧结矿"||a=="煤"||a=="球团"||a=="块矿"||a=="焦丁"||a=="焦"||a=="溶剂"||a==null)
                        {
                            if (name == "烧结矿")
                            {
                                dr["MONTH_WET"] = sjxh400;
                                dr["MONTH_TOTAL"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * sjxh400).ToString("N2").Replace(",", "");
                                dr["MONTH_PCE"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * sjxh400 * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                                dr["MONTH_COST"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * sjxh400 / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                                dr["MONTH_COST_PCE"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * sjxh400 / double.Parse(month_cl) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
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
                                dr["MONTH_TOTAL"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * double.Parse(month_wet)).ToString("N2").Replace(",", "");
                                dr["MONTH_PCE"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * double.Parse(month_wet) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                                dr["MONTH_COST"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * double.Parse(month_wet) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                                dr["MONTH_COST_PCE"] = ((100 - double.Parse(dtTemp.Rows[0]["WATER"].ToString())) / 100 * double.Parse(month_wet) / double.Parse(month_cl) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                            }
                            
                            
                        }
                        else if (a == "辅助材料" || a == "工资及附加" || a == "制造费用")
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
                            dr["MONTH_PCE"] = double.Parse(month_money).ToString("N2").Replace(",","");
                            dr["MONTH_COST"] = "0";
                            dr["MONTH_COST_PCE"] = (double.Parse(month_money)/double.Parse(month_cl)).ToString("N2");
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
                            dr["MONTH_WET"] =month_wet;
                            dr["MONTH_TOTAL"] = month_total;
                            dr["MONTH_PCE"] = (double.Parse(month_total) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                            dr["MONTH_COST"] = (double.Parse(month_total) * double.Parse(month_wet) / double.Parse(month_cl)).ToString("N2").Replace(",", "");
                            dr["MONTH_COST_PCE"] = (double.Parse(month_total)/ double.Parse(month_cl) * double.Parse(dtTemp.Rows[0]["STATISTICS_PCE"].ToString())).ToString("N2").Replace(",", "");
                        }
                    }
                }
            }
            //SEQ：7种类型,DAY_WET,DAY_TOTAL，DAY_PCE，DAY_COST，DAY_COST_PCE，MONTH_WET,MONTH_TOTAL，MONTH_PCE，MONTH_COST，MONTH_COST_PCE
            double[,] dValue = new double[8, 10] {
                { 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},
                { 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0},{ 0,0,0,0,0,0,0,0,0,0}
            };
            double d_zj1 = 0, d_zj2 = 0, d_zj3 = 0, d_zj4 = 0;
            foreach (DataRow dr in dt.Rows)
            {
                string strSeq = dr["SEQ"].ToString();
                if(SQLComm.IsNumberic(strSeq))
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
            //算焦比
            //计算当日焦炭消耗
            string sql = "SELECT  SUM(DAY_TOTAL) FROM T_RPT_COST_CONSUME_CX_1 where (STATISTICS_TYPE='焦' OR STATISTICS_ID='D07201010002' OR STATISTICS_ID='C60200100500000B') AND RECORD_DATE='" + strStartTime + "'";
            DataTable dt0 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(sql, ref dt0);
            string weight_j = dt0.Rows[0][0].ToString();
            //当月
            //计算返焦的量
            sql = "SELECT  SUM(DAY_TOTAL) FROM T_RPT_COST_CONSUME_JL_1 where STATISTICS_ID='C60200100500000B' ";
            sql += "AND to_date(RECORD_DATE, 'yyyy-mm-dd') between to_date('" + strMonthStart + "', 'yyyy-mm-dd') and to_date('" + strStartTime + "', 'yyyy-mm-dd')";
            dt0 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(sql, ref dt0);
            string weight_m_j = dt0.Rows[0][0].ToString();
            //计算焦炭的量
            //查找有几种焦炭
            sql = "SELECT distinct(STATISTICS_ID) FROM T_RPT_COST_CONSUME_JL_1 WHERE STATISTICS_TYPE='焦' ";
            sql += "AND to_date(RECORD_DATE, 'yyyy-mm-dd') between to_date('" + strMonthStart + "', 'yyyy-mm-dd') and to_date('" + strStartTime + "', 'yyyy-mm-dd')";
            dt0 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(sql, ref dt0);
            string id_m, wet_m, total_m, money_m;
            double weight_tt = 0;//作为临时变量存每种焦重量
            for (int i = 0; i < dt0.Rows.Count; i++)
            {
                id_m = dt0.Rows[i][0].ToString();
                GetSum(id_m, out wet_m, out total_m, out money_m);
                weight_tt = weight_tt + double.Parse(total_m);
            }
            weight_m_j = (weight_tt + double.Parse(weight_m_j)+double.Parse(fjd_monlj)).ToString();
            //当日产量
            sql = "SELECT  DAY_TOTAL FROM T_RPT_COST_CONSUME_CX_1 where STATISTICS_ID='T6' AND RECORD_DATE='" + strStartTime + "' ";
            dt0 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(sql, ref dt0);
            string day_cl = dt0.Rows[0][0].ToString();
            

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
            d_kb1 = d_zj1 + dValue[5, 2];
            d_kb2 = d_zj2 + dValue[5, 4];
            d_kb3 = d_zj3 + dValue[5, 7];
            d_kb4 = d_zj4 + dValue[5, 9];
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
                    dr["DAY_WET"] = dValue[1, 0].ToString("N2").Replace(",", "");
                    dr["DAY_TOTAL"] = dValue[1, 1].ToString("N2").Replace(",", "");
                    dr["DAY_PCE"] = dValue[1, 2].ToString("N2").Replace(",", "");
                    dr["DAY_COST"] = dValue[1, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[1, 4].ToString("N2").Replace(",", "");
                    dr["MONTH_WET"] = dValue[1, 5].ToString("N2").Replace(",", "");
                    dr["MONTH_TOTAL"] = dValue[1, 6].ToString("N2").Replace(",", "");
                    dr["MONTH_PCE"] = dValue[1, 7].ToString("N2").Replace(",", "");
                    dr["MONTH_COST"] = dValue[1, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[1, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "二、辅助材料")
                {
                    //dr["DAY_WET"] = dValue[2, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[2, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[2, 2].ToString("N2").Replace(",", "");
                    dr["DAY_COST"] = dValue[2, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[2, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[2, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[2, 6].ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = dValue[2, 7].ToString("N2").Replace(",", "");
                    dr["MONTH_COST"] = dValue[2, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[2, 9].ToString("N2").Replace(",", "");
                }

                if (dr["STATISTICS_DES"].ToString() == "三、燃料" )
                {
                    //dr["DAY_WET"] = dValue[3, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[3, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[3, 2].ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = dValue[3, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST"] = (double.Parse(weight_j)/double.Parse(day_cl)).ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[3, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[3, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[3, 6].ToString("N2").Replace(",", "");
                    // dr["MONTH_PCE"] = dValue[3, 7].ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = dValue[3, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST"] = (double.Parse(weight_m_j)/double.Parse(month_cl)).ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[3, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "四、动力")
                {
                    
                    dr["DAY_COST_PCE"] = dValue[4, 4].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[4, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "五、工资及附加")
                {
                    //dr["DAY_WET"] = dValue[4, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[4, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[4, 2].ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = dValue[4, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[5, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[4, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[4, 6].ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = dValue[4, 7].ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = dValue[4, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[5, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "六、制造费用")
                {
                    //dr["DAY_WET"] = dValue[5, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[5, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[5, 2].ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = dValue[5, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[6, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[5, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[5, 6].ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = dValue[5, 7].ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = dValue[5, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[6, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "七、回收")
                {
                    //dr["DAY_WET"] = dValue[6, 0].ToString("N2").Replace(",", "");
                    //dr["DAY_TOTAL"] = dValue[6, 1].ToString("N2").Replace(",", "");
                    //dr["DAY_PCE"] = dValue[6, 2].ToString("N2").Replace(",", "");
                    //dr["DAY_COST"] = dValue[6, 3].ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = dValue[7, 4].ToString("N2").Replace(",", "");
                    //dr["MONTH_WET"] = dValue[6, 5].ToString("N2").Replace(",", "");
                    //dr["MONTH_TOTAL"] = dValue[6, 6].ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = dValue[6, 7].ToString("N2").Replace(",", "");
                    //dr["MONTH_COST"] = dValue[6, 8].ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = dValue[7, 9].ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "生产总成本")
                {
                   //dr["DAY_PCE"] = sum_day_pce.ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = sum_day_cost.ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = sum_mon_pce.ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = sum_mon_cost.ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "固定成本")
                {
                    //dr["DAY_PCE"] = d_kb1.ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = d_kb2.ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = d_kb3.ToString("N2").Replace(",", "");
                    dr["MONTH_COST_PCE"] = d_kb4.ToString("N2").Replace(",", "");
                }
                if (dr["STATISTICS_DES"].ToString() == "可变成本")
                {
                    //dr["DAY_PCE"] = (sum_day_pce - d_kb1).ToString("N2").Replace(",", "");
                    dr["DAY_COST_PCE"] = (sum_day_cost - d_kb2).ToString("N2").Replace(",", "");
                    //dr["MONTH_PCE"] = (sum_mon_pce - d_kb3).ToString("N2").Replace(",", "");
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
                strSQL = "select distinct STATISTICS_ID,STATISTICS_DES,STATISTICS_TYPE,UNIT,SEQ from T_RPT_COST_CONSUME_CX_1 where  RECORD_DATE between '" + strMonthStart + "' and '" + strMonthEnd + "' order by Seq,STATISTICS_ID";
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
                    if (dr["STATISTICS_TYPE"].ToString() == "烧结矿")
                    {
                        dr["SEQ"] = "1";
                        dt.ImportRow(dr);
                    }
                }
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "球团")
                    {
                        dr["SEQ"] = "1";
                        dt.ImportRow(dr);
                    }
                }
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "块矿")
                    {
                        dr["SEQ"] = "1";
                        dt.ImportRow(dr);
                    }
                }
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_DES"].ToString() == "高炉返矿")
                    {
                        dr["SEQ"] = "1";
                        dt.ImportRow(dr);
                    }
                }
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_DES"].ToString() == "烧结返矿")
                    {
                        dr["SEQ"] = "1";
                        dt.ImportRow(dr);
                    }
                }
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
                dataRow["STATISTICS_DES"] = "二、辅助材料";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "辅助材料")
                    {
                        dr["SEQ"] = "3";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "三、燃料";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "焦")
                    {
                        dr["SEQ"] = "4";
                        dt.ImportRow(dr);
                    }
                }
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_DES"].ToString() == "返焦")
                    {
                        dr["SEQ"] = "4";
                        dt.ImportRow(dr);
                    }
                }
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_DES"].ToString() == "返焦丁")
                    {
                        dr["SEQ"] = "4";
                        dt.ImportRow(dr);
                    }
                }
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_DES"].ToString() == "焦丁")
                    {
                        dr["SEQ"] = "4";
                        dt.ImportRow(dr);
                    }
                }

                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "煤")
                    {
                        dr["SEQ"] = "4";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "四、动力";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "燃料动力")
                    {
                        dr["SEQ"] = "5";
                        dt.ImportRow(dr);
                    }
                }  
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "五、工资及附加";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "工资及附加")
                    {
                        dr["SEQ"] = "6";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "六、制造费用";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "制造费用")
                    {
                        dr["SEQ"] = "7";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "七、回收";
                dt.Rows.Add(dataRow);
                foreach (DataRow dr in dtTemp.Rows)
                {
                    if (dr["STATISTICS_TYPE"].ToString() == "回收")
                    {
                        dr["SEQ"] = "8";
                        dt.ImportRow(dr);
                    }
                }
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "生产总成本";
                dataRow["UNIT"] = "元";
                dt.Rows.Add(dataRow);
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "可变成本";
                dataRow["UNIT"] = "元";
                dt.Rows.Add(dataRow);
                dataRow = dt.NewRow();
                dataRow["STATISTICS_DES"] = "固定成本";
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
                string file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\炼铁分厂1号高炉槽上成本日报表.xls";
                excelFile.LoadXls(file);
                //string file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\一炼铁分厂2#高炉日工序生产成本表.xls";
                //ExcelFile excelFile = new ExcelFile(file);
                ExcelWorksheet sheet = excelFile.Worksheets[0];
                sheet.Cells[0, 0].Value = "炼铁分厂"+ DateTime.Parse(dateStartTime.Text.ToString()).ToString("yyyy年MM月dd日") + "1#高炉槽上成本日报表";
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
                Page.Response.AppendHeader("Content-Disposition", "attachment; filename=" + Page.Server.UrlEncode("炼铁分厂1#高炉槽上成本日报表_" + strTime + ".xls"));
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