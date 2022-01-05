using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GemBox.ExcelLite;
using System.IO;

namespace BF_Report.Manager.Module.Report._1500BF
{
    public partial class ProdDay_Rep : System.Web.UI.Page
    {      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
               
            }
            
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            GetData();

        }

        protected void GetData()
        {
            try
            {
                SQLComm.Prodt1 = new DataTable();
                SQLComm.Prodt2 = new DataTable();
                SQLComm.Prodt3 = new DataTable();
                string strSQL = "";
                #region 填充SQLComm.Prodt1数据
                string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
                string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
                string strShift = cbbType.Text.ToString();
                //查询时间、料批、累计、风量、热风压力、炉顶压力、全压差、透气性指数、喷煤量、风温、富氧量、煤气利用率、炉基温度
                Int64 time = Int64.Parse(dateStartTime.Date.AddDays(-1).ToString("yyyyMMdd") + "200000");
                if (time < 20210610200000)
                {
                    if (cbbType.Value.ToString() == "0")
                    {
                        strSQL = "select a.RECORD_TIME,a.HOUR_CHARGE,a.ACCUM_CHARGE,a.BLAST_AMOUNT,a.HOT_PRESS,a.TOP_PRESS,a.TQX,a.P_ALL,a.COKE_JET,a.COKE_JET1,a.BLAST_TEMP,a.GAS_USE,a.T_LD_HEART,a.R_LG_ACTIVE AS OXY_AMOUNT ,a.OXY_AMOUNT AS N2_AMOUNT,a.RICH_OXY_AMOUNT AS FYL ";
                        strSQL += " from T_RPT_BF_RUN_PARA a,T_RPT_ENERGY_CONSUME b where a.RECORD_TIME=b.RECORD_TIME and a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') order by a.RECORD_TIME asc ";
                    }
                    else
                    {
                        strSQL = "select a.RECORD_TIME,a.HOUR_CHARGE,a.ACCUM_CHARGE,a.BLAST_AMOUNT,a.HOT_PRESS,a.TOP_PRESS,a.TQX,a.P_ALL,a.COKE_JET,a.COKE_JET1,a.BLAST_TEMP,a.GAS_USE,a.T_LD_HEART,a.R_LG_ACTIVE AS OXY_AMOUNT ,a.OXY_AMOUNT AS N2_AMOUNT,a.RICH_OXY_AMOUNT AS FYL";
                        strSQL += " from T_RPT_BF_RUN_PARA a,T_RPT_ENERGY_CONSUME b where a.RECORD_TIME=b.RECORD_TIME and a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') and a.WORK_SHIFT = '" + strShift + "' order by a.RECORD_TIME asc";
                    }

                }
                else
                {
                    if (cbbType.Value.ToString() == "0")
                    {
                        strSQL = "select a.RECORD_TIME,b.DAY_CHARGE AS  HOUR_CHARGE,a.ACCUM_CHARGE,a.BLAST_AMOUNT,a.HOT_PRESS,a.TOP_PRESS,a.TQX,a.P_ALL,a.COKE_JET,a.COKE_JET1,a.BLAST_TEMP,a.GAS_USE,a.T_LD_HEART,a.R_LG_ACTIVE AS OXY_AMOUNT ,a.OXY_AMOUNT AS N2_AMOUNT,a.RICH_OXY_AMOUNT AS FYL ";
                        strSQL += " from T_RPT_BF_RUN_PARA a,T_RPT_ENERGY_CONSUME b where a.RECORD_TIME=b.RECORD_TIME and a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') order by a.RECORD_TIME asc ";
                    }
                    else
                    {
                        strSQL = "select a.RECORD_TIME,b.DAY_CHARGE AS  HOUR_CHARGE,a.ACCUM_CHARGE,a.BLAST_AMOUNT,a.HOT_PRESS,a.TOP_PRESS,a.TQX,a.P_ALL,a.COKE_JET,a.COKE_JET1,a.BLAST_TEMP,a.GAS_USE,a.T_LD_HEART,a.R_LG_ACTIVE AS OXY_AMOUNT ,a.OXY_AMOUNT AS N2_AMOUNT,a.RICH_OXY_AMOUNT AS FYL";
                        strSQL += " from T_RPT_BF_RUN_PARA a,T_RPT_ENERGY_CONSUME b where a.RECORD_TIME=b.RECORD_TIME and a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') and a.WORK_SHIFT = '" + strShift + "' order by a.RECORD_TIME asc";
                    }
                }

                DataTable dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                int iCount1 = dt.Rows.Count;
                if (iCount1 > 12)
                    SQLComm.Prodt1 = SQLComm.CreatePord1(iCount1 + 1);
                else
                    SQLComm.Prodt1 = SQLComm.CreatePord1(13);
                if (dt != null && dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        try
                        {
                            SQLComm.Prodt1.Rows[i]["field0"] = DateTime.Parse(dt.Rows[i]["RECORD_TIME"].ToString()).ToString("HH:mm");//时间
                        }
                        catch { }
                        SQLComm.Prodt1.Rows[i]["field1"] = double.Parse(dt.Rows[i]["HOUR_CHARGE"].ToString()).ToString("N1");//料批
                        if (i == 0)
                            SQLComm.Prodt1.Rows[i]["field2"] = double.Parse(dt.Rows[i]["HOUR_CHARGE"].ToString()).ToString("N1");//累计
                        else
                        {
                            try
                            {
                                double dLastValue = double.Parse(SQLComm.Prodt1.Rows[i - 1]["field2"].ToString());
                                double dNowValue = double.Parse(dt.Rows[i]["HOUR_CHARGE"].ToString());
                                SQLComm.Prodt1.Rows[i]["field2"] = (dLastValue + dNowValue).ToString("N1");
                            }
                            catch { }
                        }
                        SQLComm.Prodt1.Rows[i]["field3"] = dt.Rows[i]["BLAST_AMOUNT"].ToString(); //风量
                        SQLComm.Prodt1.Rows[i]["field4"] = dt.Rows[i]["HOT_PRESS"].ToString(); //热风压力
                        SQLComm.Prodt1.Rows[i]["field5"] = dt.Rows[i]["TOP_PRESS"].ToString(); //炉顶压力
                        SQLComm.Prodt1.Rows[i]["field6"] = dt.Rows[i]["TQX"].ToString(); //透气性指数
                        SQLComm.Prodt1.Rows[i]["field7"] = dt.Rows[i]["P_ALL"].ToString(); //全压差
                        double d_cokejet = 0;
                        try
                        {
                            d_cokejet = double.Parse(dt.Rows[i]["COKE_JET"].ToString()) + double.Parse(dt.Rows[i]["COKE_JET1"].ToString());
                        }
                        catch { }
                        SQLComm.Prodt1.Rows[i]["field8"] = d_cokejet.ToString("N2"); //喷煤量                       
                        SQLComm.Prodt1.Rows[i]["field9"] = dt.Rows[i]["BLAST_TEMP"].ToString(); //风温
                        SQLComm.Prodt1.Rows[i]["field10"] = double.Parse(dt.Rows[i]["FYL"].ToString()).ToString("N0").Replace(",", ""); //富氧量
                        SQLComm.Prodt1.Rows[i]["field11"] = double.Parse(dt.Rows[i]["N2_AMOUNT"].ToString()).ToString("N0").Replace(",",""); //高压富氧
                        SQLComm.Prodt1.Rows[i]["field12"] = double.Parse(dt.Rows[i]["OXY_AMOUNT"].ToString()).ToString("N0").Replace(",", ""); //机前富氧
                        SQLComm.Prodt1.Rows[i]["field13"] = dt.Rows[i]["GAS_USE"].ToString(); //煤气利用率
                        SQLComm.Prodt1.Rows[i]["field14"] = dt.Rows[i]["T_LD_HEART"].ToString(); //炉基温度
                        

                    }
                    try
                    {
                        if (iCount1 > 12)
                        {
                            SQLComm.Prodt1.Rows[iCount1]["field0"] = "平均";
                            SQLComm.Prodt1.Rows[iCount1]["field1"] = double.Parse(dt.Compute("avg(HOUR_CHARGE)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field2"] = double.Parse(dt.Compute("sum(HOUR_CHARGE)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field3"] = double.Parse(dt.Compute("avg(BLAST_AMOUNT)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field4"] = double.Parse(dt.Compute("avg(HOT_PRESS)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field5"] = double.Parse(dt.Compute("avg(TOP_PRESS)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field6"] = double.Parse(dt.Compute("avg(TQX)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field7"] = double.Parse(dt.Compute("avg(P_ALL)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field8"] = double.Parse(dt.Compute("avg(COKE_JET)+avg(COKE_JET1)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field9"] = double.Parse(dt.Compute("avg(BLAST_TEMP)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field10"] = double.Parse(dt.Compute("avg(FYL)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field11"] = double.Parse(dt.Compute("avg(N2_AMOUNT)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field12"] = double.Parse(dt.Compute("avg(OXY_AMOUNT)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field13"] = double.Parse(dt.Compute("avg(GAS_USE)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[iCount1]["field14"] = double.Parse(dt.Compute("avg(T_LD_HEART)", "").ToString()).ToString("N2").Replace(",", "");
                            
                        }
                        else
                        {
                            SQLComm.Prodt1.Rows[12]["field0"] = "平均";
                            SQLComm.Prodt1.Rows[12]["field1"] = double.Parse(dt.Compute("avg(HOUR_CHARGE)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field2"] = double.Parse(dt.Compute("sum(HOUR_CHARGE)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field3"] = double.Parse(dt.Compute("avg(BLAST_AMOUNT)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field4"] = double.Parse(dt.Compute("avg(HOT_PRESS)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field5"] = double.Parse(dt.Compute("avg(TOP_PRESS)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field6"] = double.Parse(dt.Compute("avg(TQX)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field7"] = double.Parse(dt.Compute("avg(P_ALL)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field8"] = double.Parse(dt.Compute("avg(COKE_JET)+avg(COKE_JET1)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field9"] = double.Parse(dt.Compute("avg(BLAST_TEMP)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field10"] = double.Parse(dt.Compute("avg(FYL)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field11"] = double.Parse(dt.Compute("avg(N2_AMOUNT)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field12"] = double.Parse(dt.Compute("avg(OXY_AMOUNT)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field13"] = double.Parse(dt.Compute("avg(GAS_USE)", "").ToString()).ToString("N2").Replace(",", "");
                            SQLComm.Prodt1.Rows[12]["field14"] = double.Parse(dt.Compute("avg(T_LD_HEART)", "").ToString()).ToString("N2").Replace(",", "");
                            
                        }
                    }
                    catch { }
                }
                //查询铁次、铁口、开始、来渣、结束、估产、实产、Si、S、P、等级、温度、Ktp、渣色、CaO、SiO2、MgO、Al2O3、FeO、镁铝比、深度、角度、泥量、带流   
                if (cbbType.Value.ToString() == "0")
                    strSQL = "select * from T_IRON_MG where OUT_START_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') order by OUT_START_TIME asc";
                else
                    strSQL = "select * from T_IRON_MG where OUT_START_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') and SHIFT = '" + strShift + "' order by OUT_START_TIME asc";
                dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                if (dt != null && dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string strIronMothNo = dt.Rows[i]["IRON_MOUTH_NO"].ToString();
                        string strIronNo = dt.Rows[i]["IRON_NO"].ToString();
                        double dIronTemp = 0;
                        SQLComm.Prodt1.Rows[i]["field15"] = dt.Rows[i]["IRON_NO"].ToString();//铁次
                        SQLComm.Prodt1.Rows[i]["field16"] = dt.Rows[i]["IRON_MOUTH_NO"].ToString();//铁口
                        SQLComm.Prodt1.Rows[i]["field17"] = Convert.ToDateTime(dt.Rows[i]["OUT_START_TIME"].ToString()).ToString("HH:mm");//开始
                        try
                        {
                            SQLComm.Prodt1.Rows[i]["field18"] = Convert.ToDateTime(dt.Rows[i]["OUT_TIME"].ToString()).ToString("HH:mm"); //来渣
                        }
                        catch { }
                        try
                        {
                            SQLComm.Prodt1.Rows[i]["field19"] = Convert.ToDateTime(dt.Rows[i]["OUT_END_TIME"].ToString()).ToString("HH:mm"); //结束
                        }
                        catch { }
                        SQLComm.Prodt1.Rows[i]["field20"] = dt.Rows[i]["YIEL_AMOU"].ToString();//估产

                        strSQL = " select sum(net_weight) AS YIEL_POUD from L2BF_COM.TMMIRF9_IO WHERE iron_degr ='" + strIronNo + "' ";
                        DataTable dt1 = new DataTable();
                        SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
                        if (dt1 != null && dt1.Rows.Count > 0)
                            SQLComm.Prodt1.Rows[i]["field21"] = dt1.Rows[0]["YIEL_POUD"].ToString();//实产
                        if (strIronMothNo == "东")//温度
                        {
                            dIronTemp = double.Parse(dt.Rows[i]["IRON_TEMP1"].ToString());
                            SQLComm.Prodt1.Rows[i]["field26"] = dt.Rows[i]["IRON_TEMP1"].ToString();
                        }
                        else
                        {
                            dIronTemp = double.Parse(dt.Rows[i]["IRON_TEMP2"].ToString());
                            SQLComm.Prodt1.Rows[i]["field26"] = dt.Rows[i]["IRON_TEMP2"].ToString();
                        }
                        SQLComm.Prodt1.Rows[i]["field28"] = dt.Rows[i]["DREG_COLO"].ToString();//渣色
                        SQLComm.Prodt1.Rows[i]["field36"] = dt.Rows[i]["IRON_MOUTH_DEPTH"].ToString();//深度
                        SQLComm.Prodt1.Rows[i]["field37"] = dt.Rows[i]["IRON_MOUTH_ANGEL"].ToString();//角度
                        SQLComm.Prodt1.Rows[i]["OXY_AMOUNT"] = dt.Rows[i]["HIT_MUD"].ToString();//泥量
                        SQLComm.Prodt1.Rows[i]["R_LG_ACTIVE"] = dt.Rows[i]["DAI_LIU"].ToString();//带流

                        //化验室数据
                        //铁样
                        strSQL = "select* from l2bf_com.tqmir21_io where mat_sample_no like '" + strIronNo + "L%' order by analyse_center_time desc";
                        dt1 = new DataTable();
                        SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
                        if (dt1 != null && dt1.Rows.Count > 0)
                        {
                            string strSampleNo = dt1.Rows[0]["MAT_SAMPLE_NO"].ToString();
                            strSQL = "select * from l2bf_com.tqmir23_io where mat_sample_no ='" + strSampleNo + "'";
                            DataTable dt2 = new DataTable();
                            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt2);
                            foreach (DataRow dr in dt2.Rows)
                            {
                                string strCode = dr["analyse_item_code"].ToString();
                                if (strCode == "Si")
                                {
                                    //ktp [(铁水温度-1400)/100]开根号/si含量
                                    SQLComm.Prodt1.Rows[i]["field22"] = double.Parse(dr["analysis_value"].ToString()).ToString("N3");
                                    if (dIronTemp != 0)
                                    {
                                        try
                                        {
                                            double dTmp = dIronTemp - 1400;
                                            dTmp = dTmp / 100;
                                            dTmp = Math.Sqrt(dTmp);
                                            double dSi = double.Parse(dr["analysis_value"].ToString());
                                            double dktp = dTmp / dSi;
                                            //dktp = System.Math.Pow((dIronTemp - 1400) / 100, 1 / 2) / double.Parse(dr["analysis_value"].ToString());
                                            SQLComm.Prodt1.Rows[i]["field27"] = dktp.ToString("N2");
                                        }
                                        catch { }
                                    }
                                    else
                                    {
                                        double dktp = 0;
                                        SQLComm.Prodt1.Rows[i]["field27"] = dktp.ToString("N2");
                                    }
                                }
                                if (strCode == "S")
                                    SQLComm.Prodt1.Rows[i]["field23"] = double.Parse(dr["analysis_value"].ToString()).ToString("N3");
                                if (strCode == "P")
                                    SQLComm.Prodt1.Rows[i]["field24"] = double.Parse(dr["analysis_value"].ToString()).ToString("N3");
                            }
                            strSQL = "select * from l2bf_com.tqmir24_io where mat_sample_no ='" + strSampleNo + "' and jdg_type='1A0'";
                            dt2 = new DataTable();
                            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt2);
                            if (dt2 != null && dt2.Rows.Count > 0)
                                SQLComm.Prodt1.Rows[i]["field25"] = dt2.Rows[0]["jdg_grade"].ToString();
                        }
                        //渣样
                        strSQL = "select* from l2bf_com.tqmir21_io where mat_sample_no like '" + strIronNo + "Z%' order by analyse_center_time desc";
                        dt1 = new DataTable();
                        SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
                        if (dt1 != null && dt1.Rows.Count > 0)
                        {
                            double dMgO = 0;
                            double dAl2O3 = 0;
                            string strSampleNo = dt1.Rows[0]["mat_sample_no"].ToString();
                            strSQL = "select * from l2bf_com.tqmir23_io where mat_sample_no ='" + strSampleNo + "'";
                            DataTable dt2 = new DataTable();
                            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt2);
                            foreach (DataRow dr in dt2.Rows)
                            {
                                string strCode = dr["analyse_item_code"].ToString();
                                if (strCode == "CaO")
                                    SQLComm.Prodt1.Rows[i]["field29"] = dr["analysis_value"].ToString();
                                if (strCode == "SiO2")
                                    SQLComm.Prodt1.Rows[i]["field30"] = dr["analysis_value"].ToString();
                                if (strCode == "MgO")
                                {
                                    dMgO = double.Parse(dr["analysis_value"].ToString());
                                    SQLComm.Prodt1.Rows[i]["field31"] = dr["analysis_value"].ToString();
                                }
                                if (strCode == "Al2O3")
                                {
                                    dAl2O3 = double.Parse(dr["analysis_value"].ToString());
                                    SQLComm.Prodt1.Rows[i]["field32"] = dr["analysis_value"].ToString();
                                }
                                if (strCode == "FeO")
                                    SQLComm.Prodt1.Rows[i]["field33"] = double.Parse(dr["analysis_value"].ToString()).ToString("N3");
                                if (strCode == "R2")
                                    SQLComm.Prodt1.Rows[i]["field34"] = double.Parse(dr["analysis_value"].ToString()).ToString("N3");
                            }
                            if (dAl2O3 != 0)
                                SQLComm.Prodt1.Rows[i]["field35"] = (dMgO / dAl2O3).ToString("N2");
                        }
                    }
                }
                #endregion
                #region 填充SQLComm.Prodt2数据
                string strDate = dateStartTime.Text.ToString();
                //查询事件、时间、原因和处理
                if (cbbType.Value.ToString() == "0")
                    strSQL = "select * from T_CONFIRM_FAULT where to_char(RECORD_TIME,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and FLAG=1 order by RECORD_TIME asc";
                else
                    strSQL = "select * from T_CONFIRM_FAULT where to_char(RECORD_TIME,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and SHIFT = '" + strShift + "' and FLAG=1 order by RECORD_TIME asc";
                DataTable dt3 = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt3);
                int iCount2 = dt3.Rows.Count;

                //查询批次、矿批、焦批、焦丁、品味、烧结矿、球团矿、块矿、溶剂、批铁、干焦比、燃料比、干焦、全焦、装料制度及变更原因   
                if (cbbType.Value.ToString() == "0")
                    strSQL = "select * from T_MATERIAL_BLJSDATA where to_char(RECORD_TIME,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' order by RECORD_TIME asc";
                else
                    strSQL = "select * from T_MATERIAL_BLJSDATA where to_char(RECORD_TIME,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and WORK_SHIFT = '" + strShift + "' order by RECORD_TIME asc";
                dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                int iCount3 = dt.Rows.Count;
                if (iCount3 > iCount2)
                    iCount2 = iCount3;
                if (iCount2 > 4)
                    SQLComm.Prodt2 = SQLComm.CreatePord2(iCount2);
                else
                    SQLComm.Prodt2 = SQLComm.CreatePord2(4);
                if (dt3 != null && dt3.Rows.Count > 0)
                {
                    for (int i = 0; i < dt3.Rows.Count; i++)
                    {
                        SQLComm.Prodt2.Rows[i]["field18"] = dt3.Rows[i]["STATE"].ToString();//事件
                        SQLComm.Prodt2.Rows[i]["field19"] = dt3.Rows[i]["USED_TIME"].ToString();//时间
                        SQLComm.Prodt2.Rows[i]["field20"] = dt3.Rows[i]["REMARK"].ToString();//原因和处理
                    }
                }

                if (dt.Rows.Count == 0)
                {
                    strSQL = "select * from (select * from T_MATERIAL_BLJSDATA order by RECORD_TIME desc) where rownum=1";
                    dt = new DataTable();
                    SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                }
                if (dt != null && dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        SQLComm.Prodt2.Rows[i]["field21"] = DateTime.Parse(dt.Rows[i]["RECORD_TIME"].ToString()).ToString("MM-dd HH:mm");
                        SQLComm.Prodt2.Rows[i]["field0"] = dt.Rows[i]["CHARGENUM"].ToString();//批次
                        double d_ore = double.Parse(dt.Rows[i]["ORE_WEIGHT"].ToString());
                        double d_coke = double.Parse(dt.Rows[i]["COKE_WEIGHT1"].ToString());
                        double d_cfd = double.Parse(dt.Rows[i]["CFD_WEIGHT"].ToString());
                        SQLComm.Prodt2.Rows[i]["field1"] = (d_ore / 1000).ToString("N2");//矿批
                        SQLComm.Prodt2.Rows[i]["field2"] = (d_coke / 1000).ToString("N2");//焦批
                        SQLComm.Prodt2.Rows[i]["field3"] = (d_cfd / 1000).ToString("N2");//焦丁
                        SQLComm.Prodt2.Rows[i]["field4"] = dt.Rows[i]["THERY_RLPW"].ToString();//品味
                        //烧结矿重量
                        double d_sinter = double.Parse(dt.Rows[i]["SINTER_WEIGHT"].ToString()) / 1000;
                        //球团仓重量
                        double d_af1 = 0;
                        double d_af2 = 0;
                        double d_af3 = 0;
                        //块矿仓重量
                        double d_of1 = double.Parse(dt.Rows[i]["OF1_WEIGHT"].ToString()) / 1000;
                        double d_of2 = double.Parse(dt.Rows[i]["OF2_WEIGHT"].ToString()) / 1000;
                        double d_of3 = 0;
                        double d_of4 = 0;

                        //杂矿仓重量
                        //double d_zf1 = double.Parse(dt.Rows[i]["ZF1_WEIGHT"].ToString());
                        double d_zf1 = double.Parse(dt.Rows[i]["ZF2_WEIGHT"].ToString());
                        double d_zf2 = 0;
                        //查询杂1放的是杂矿还是球团--------
                        string record_time = dt.Rows[i]["RECORD_TIME"].ToString();
                        string strSQL1;
                        string strSQL2;
                        string strSQL3;
                        if (Convert.ToDateTime(record_time) > Convert.ToDateTime("2021-08-08 20:00:00"))
                        {
                            strSQL1 = "SELECT B.MAT_TYPE FROM ORALTL2_BF.T_MATERIAL_BLJSDATA a ,L2BF_COM.T_BASE_MATERIAL_NEW b WHERE a.Zf1_Name=b.ERP_NAME ";
                            strSQL1 += "AND  RECORD_TIME = to_date('" + record_time + "', 'YYYY-MM-DD HH24:MI:SS')";
                            //查询球1放的是块矿还是球团--------                      
                            strSQL2 = "SELECT B.MAT_TYPE FROM ORALTL2_BF.T_MATERIAL_BLJSDATA a ,L2BF_COM.T_BASE_MATERIAL_NEW b WHERE a.Af1_Name=b.ERP_NAME ";
                            strSQL2 += "AND  RECORD_TIME = to_date('" + record_time + "', 'YYYY-MM-DD HH24:MI:SS')";
                            //查询球2放的是块矿还是球团还是烧结矿--------                        
                            strSQL3 = "SELECT B.MAT_TYPE FROM ORALTL2_BF.T_MATERIAL_BLJSDATA a ,L2BF_COM.T_BASE_MATERIAL_NEW b WHERE a.Af2_Name=b.ERP_NAME ";
                            strSQL3 += "AND  RECORD_TIME = to_date('" + record_time + "', 'YYYY-MM-DD HH24:MI:SS')";
                        }
                        else
                        {
                            strSQL1 = "SELECT c_type as MAT_TYPE FROM ORALTL2_BF.T_MATERIAL_BLJSDATA a ,ORALTL2_BF.T_BASE_MATERIAL b WHERE a.Zf1_Name=b.c_name ";
                            strSQL1 += "AND  RECORD_TIME = to_date('" + record_time + "', 'YYYY-MM-DD HH24:MI:SS')";
                            //查询球1放的是块矿还是球团--------                      
                            strSQL2 = "SELECT c_type as MAT_TYPE FROM ORALTL2_BF.T_MATERIAL_BLJSDATA a ,ORALTL2_BF.T_BASE_MATERIAL b WHERE a.Af1_Name=b.c_name ";
                            strSQL2 += "AND  RECORD_TIME = to_date('" + record_time + "', 'YYYY-MM-DD HH24:MI:SS')";
                            //查询球2放的是块矿还是球团还是烧结矿--------                        
                            strSQL3 = "SELECT c_type as MAT_TYPE FROM ORALTL2_BF.T_MATERIAL_BLJSDATA a ,ORALTL2_BF.T_BASE_MATERIAL b WHERE a.Af2_Name=b.c_name ";
                            strSQL3 += "AND  RECORD_TIME = to_date('" + record_time + "', 'YYYY-MM-DD HH24:MI:SS')";
                        }
                        

                        DataTable dt0 = new DataTable();
                        DataTable dt1 = new DataTable();
                        DataTable dt2 = new DataTable();
                        SQLComm.ExecuteSelectSql_dt(strSQL1, ref dt0);
                        SQLComm.ExecuteSelectSql_dt(strSQL2, ref dt1);
                        SQLComm.ExecuteSelectSql_dt(strSQL3, ref dt2);

                        string c_type0 = dt0.Rows[0]["MAT_TYPE"].ToString();
                        string c_type1 = dt1.Rows[0]["MAT_TYPE"].ToString();
                        string c_type2 = dt2.Rows[0]["MAT_TYPE"].ToString();
                        if (c_type0=="2")
                        {
                            d_af3 = double.Parse(dt.Rows[i]["ZF1_WEIGHT"].ToString()) / 1000;
                        }
                        else
                        {
                            d_zf2 = double.Parse(dt.Rows[i]["ZF1_WEIGHT"].ToString()) / 1000;
                        }


                        if (c_type1 == "3")
                        {
                            d_of3 = double.Parse(dt.Rows[i]["AF1_WEIGHT"].ToString()) / 1000;
                        }
                        else
                        {
                            d_af1 = double.Parse(dt.Rows[i]["AF1_WEIGHT"].ToString()) / 1000;
                        }

                        if (c_type2 == "3")
                        {
                            d_of4 = double.Parse(dt.Rows[i]["AF2_WEIGHT"].ToString()) / 1000;
                        }
                        else if (c_type2 == "1")
                        {
                            d_sinter = d_sinter;
                        }
                        else
                        {
                            d_af2 = double.Parse(dt.Rows[i]["AF2_WEIGHT"].ToString()) / 1000;
                        }
                        


                        SQLComm.Prodt2.Rows[i]["field5"] = d_sinter.ToString("N2");//烧结矿t
                        SQLComm.Prodt2.Rows[i]["field6"] = (d_sinter * 100000 / d_ore).ToString("N1");//烧结矿%
                        SQLComm.Prodt2.Rows[i]["field7"] = (d_af1 + d_af2+ d_af3).ToString("N2");//球团矿t
                        SQLComm.Prodt2.Rows[i]["field8"] = ((d_af1 + d_af2 + d_af3) * 100000 / d_ore).ToString("N1");//球团矿%
                        SQLComm.Prodt2.Rows[i]["field9"] = (d_of1 + d_of2+ d_of3 + d_of4).ToString("N2");//块矿仓t
                        SQLComm.Prodt2.Rows[i]["field10"] = ((d_of1 + d_of2 + d_of3 + d_of4) * 100000 / d_ore).ToString("N1");//块矿仓%
                        SQLComm.Prodt2.Rows[i]["field11"] = ((d_zf1 + d_zf2) / 1000).ToString("N2");//溶剂：杂矿重量/1000
                        SQLComm.Prodt2.Rows[i]["field12"] = dt.Rows[i]["THERY_FE"].ToString();//批铁
                        SQLComm.Prodt2.Rows[i]["field13"] = dt.Rows[i]["THERY_GJB"].ToString();//干焦比
                        SQLComm.Prodt2.Rows[i]["field14"] = dt.Rows[i]["THERY_RLB"].ToString();//燃料比
                        SQLComm.Prodt2.Rows[i]["field15"] = double.Parse(dt.Rows[i]["COKE_FH"].ToString()).ToString("N2");//干焦
                        SQLComm.Prodt2.Rows[i]["field16"] = (d_ore / (d_coke + d_cfd)).ToString("N3");//全焦：矿批重/(焦批重+焦丁重)
                        SQLComm.Prodt2.Rows[i]["field17"] = dt.Rows[i]["USER_REMARK"].ToString();//装料制度及变更原因
                    }
                }
                #endregion
                #region 填充SQLComm.Prodt3数据
                //查询白夜班记事
                if (cbbType.Value.ToString() == "0")
                {
                    strSQL = "SELECT * FROM (select * from T_INSERT_NOTE where to_char(RECORD_TIME,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and SHIFT='夜班' ORDER BY RECORD_TIME DESC) WHERE ROWNUM=1 ";
                    strSQL += "UNION ";
                    strSQL += "SELECT * FROM (select * from T_INSERT_NOTE where to_char(RECORD_TIME,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and SHIFT='白班' ORDER BY RECORD_TIME DESC) WHERE ROWNUM=1";
                    SQLComm.Prodt3 = SQLComm.CreatePord3(2);
                }
                else
                {
                    strSQL = "select * from (select * from T_INSERT_NOTE where to_char(RECORD_TIME,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and SHIFT = '" + strShift + "' order by RECORD_TIME desc) where rownum=1 ";
                    SQLComm.Prodt3 = SQLComm.CreatePord3(1);
                }
                dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                if (dt != null && dt.Rows.Count > 0)
                {
                    //焦丁总量：79.24,焦碳1: 铜陵准一级焦,焦碳1比例: 25.0,焦碳2: 铜陵准一级焦,焦碳2比例: 25.0,焦碳3: 铜陵准一级焦,焦碳3比例: 25.0,焦碳4: 铜陵准一级焦,焦碳4比例: 25.0,焦碳5: 焦丁,焦碳5比例: 0.0,备注: 上班矿用量烧结2174 球团344.4 PB块594.4
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string strNote = "";
                        if (dt.Rows[i]["CFD1_MATNAME"].ToString().Trim().Length > 0)
                            strNote += "回收焦丁:" + dt.Rows[i]["CFD1_MATNAME"].ToString() + ",比例: " + dt.Rows[i]["CFD1_ACT_RADIO"].ToString() + ",";
                        if (dt.Rows[i]["CFD2_MATNAME"].ToString().Trim().Length > 0)
                            strNote += "外购焦丁:" + dt.Rows[i]["CFD2_MATNAME"].ToString() + ",比例: " + dt.Rows[i]["CFD2_ACT_RADIO"].ToString() + ",";
                        if (dt.Rows[i]["COKE1_MATNAME"].ToString().Trim().Length > 0)
                            strNote += "焦碳1:" + dt.Rows[i]["COKE1_MATNAME"].ToString() + ",比例: " + dt.Rows[i]["COKE1_ACT_RADIO"].ToString() + ",";
                        if (dt.Rows[i]["COKE2_MATNAME"].ToString().Trim().Length > 0)
                            strNote += "焦碳2:" + dt.Rows[i]["COKE2_MATNAME"].ToString() + ",比例: " + dt.Rows[i]["COKE2_ACT_RADIO"].ToString() + ",";
                        if (dt.Rows[i]["COKE3_MATNAME"].ToString().Trim().Length > 0)
                            strNote += "焦碳3:" + dt.Rows[i]["COKE3_MATNAME"].ToString() + ",比例: " + dt.Rows[i]["COKE3_ACT_RADIO"].ToString() + ",";
                        if (dt.Rows[i]["COKE4_MATNAME"].ToString().Trim().Length > 0)
                            strNote += "焦碳4:" + dt.Rows[i]["COKE4_MATNAME"].ToString() + ",比例: " + dt.Rows[i]["COKE4_ACT_RADIO"].ToString() + ",";
                        if (dt.Rows[i]["COKE5_MATNAME"].ToString().Trim().Length > 0)
                            strNote += "焦碳5:" + dt.Rows[i]["COKE5_MATNAME"].ToString() + ",比例: " + dt.Rows[i]["COKE5_ACT_RADIO"].ToString() + ",";
                        if (dt.Rows[i]["REC_REMARK"].ToString().Trim().Length > 0)
                            strNote += "备注: " + dt.Rows[i]["REC_REMARK"].ToString();
                        SQLComm.Prodt3.Rows[i]["field1"] = strNote;//查询白夜班记事
                        SQLComm.Prodt3.Rows[i]["field0"] = dt.Rows[i]["SHIFT"].ToString() + "记事";
                    }

                }
                //炉况分析
                if (cbbType.Value.ToString() == "0")
                    strSQL = "select * from T_INSERT_NOTE_FURNACE where to_char(RECORD_DATE,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' order by RECORD_DATE asc";
                else
                    strSQL = "select * from T_INSERT_NOTE_FURNACE where to_char(RECORD_DATE,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and SHIFT = '" + strShift + "' order by RECORD_DATE asc";
                dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                if (dt != null && dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        SQLComm.Prodt3.Rows[i]["field3"] = dt.Rows[i]["ANALYSIS"].ToString();//炉况分析
                        SQLComm.Prodt3.Rows[i]["field2"] = dt.Rows[i]["SHIFT"].ToString() + "炉况分析";
                    }
                }
                #endregion

                gridBase1.DataSource = SQLComm.Prodt1;
                gridBase2.DataSource = SQLComm.Prodt2;
                gridBase3.DataSource = SQLComm.Prodt3;
                gridBase1.DataBind();
                gridBase2.DataBind();
                gridBase3.DataBind();
                
            }

            catch (Exception ex) { }
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {

            if (cbbType.Text.ToString() == "全部")
            {
                ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>window.alert('请选择需要导出的班次(白班/夜班)');</script>");
                return;
            }
            string saveFileName = "";
            try
            {
                //存放于服务器
                string file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\1500高炉生产日报.xls";
                ExcelFile excelFile = new ExcelFile(file);
                ExcelWorksheet sheet = excelFile.Worksheets[0];
                sheet.Cells[1, 0].Value = "生产日期：" + dateStartTime.Text.ToString() + "          班次：" + cbbType.Text.ToString(); //+ "         班别：" + strNowTeam;
                for (int i = 0; i < SQLComm.Prodt1.Rows.Count; i++)
                {
                    //for (int j = 0; j < SQLComm.Prodt1.Columns.Count; j++)
                    //时间
                    sheet.Cells[i + 5, 0].Value = SQLComm.Prodt1.Rows[i][0].ToString();
                    //for (int j = 1; j < SQLComm.Prodt1.Columns.Count; j++)
                    for (int j = 1; j < 15; j++)
                    {
                        //double.parse不能把空值转化成数字
                        if (SQLComm.Prodt1.Rows[i][j].ToString() == "")
                        {
                            sheet.Cells[5 + i, j].Value = SQLComm.Prodt1.Rows[i][j].ToString();
                        }
                        else
                        {
                            sheet.Cells[5 + i, j].Value = double.Parse(SQLComm.Prodt1.Rows[i][j].ToString());
                        }


                    }
                    for (int j = 15; j < 20; j++)
                    {
                        sheet.Cells[5 + i, j].Value = SQLComm.Prodt1.Rows[i][j].ToString();
                    }
                    for (int j = 20; j < 25; j++)
                    {
                        if (SQLComm.Prodt1.Rows[i][j].ToString() == "")
                        {
                            sheet.Cells[5 + i, j].Value = SQLComm.Prodt1.Rows[i][j].ToString();
                        }
                        else
                        {
                            sheet.Cells[5 + i, j].Value = double.Parse(SQLComm.Prodt1.Rows[i][j].ToString());
                        }

                    }

                    sheet.Cells[i + 5, 25].Value = SQLComm.Prodt1.Rows[i][25].ToString();
                    for (int j = 26; j < 28; j++)
                    {
                        if (SQLComm.Prodt1.Rows[i][j].ToString() == "")
                        {
                            sheet.Cells[5 + i, j].Value = SQLComm.Prodt1.Rows[i][j].ToString();
                        }
                        else
                        {
                            sheet.Cells[5 + i, j].Value = double.Parse(SQLComm.Prodt1.Rows[i][j].ToString());
                        }
                    }
                    sheet.Cells[i + 5, 28].Value = SQLComm.Prodt1.Rows[i][28].ToString();
                    for (int j = 29; j < 39; j++)
                    {
                        if (SQLComm.Prodt1.Rows[i][j].ToString() == "")
                        {
                            sheet.Cells[5 + i, j].Value = SQLComm.Prodt1.Rows[i][j].ToString();
                        }
                        else
                        {
                            sheet.Cells[5 + i, j].Value = double.Parse(SQLComm.Prodt1.Rows[i][j].ToString());
                        }
                    }
                    sheet.Cells[i + 5, 39].Value = SQLComm.Prodt1.Rows[i][39].ToString();

                }

                for (int i = 0; i < SQLComm.Prodt2.Rows.Count; i++)
                {

                    //for (int j = 0; j < SQLComm.Prodt2.Columns.Count - 4; j++)
                    for (int j = 0; j < 17; j++)
                    {
                        //判断prodt2里面的是否为空
                        if (SQLComm.Prodt2.Rows[i][j].ToString() == "")
                        {
                            sheet.Cells[21 + i, j].Value = SQLComm.Prodt2.Rows[i][j].ToString();
                        }
                        else
                        {
                            sheet.Cells[21 + i, j].Value = double.Parse(SQLComm.Prodt2.Rows[i][j].ToString());
                        }

                    }
                    sheet.Cells[21 + i, 17].Value = SQLComm.Prodt2.Rows[i][17].ToString();
                    sheet.Cells[21 + i, 27].Value = SQLComm.Prodt2.Rows[i][18].ToString();
                    sheet.Cells[21 + i, 28].Value = SQLComm.Prodt2.Rows[i][19].ToString();
                    sheet.Cells[21 + i, 29].Value = SQLComm.Prodt2.Rows[i][20].ToString();
                }
                sheet.Cells[29, 1].Value = SQLComm.Prodt3.Rows[0][1].ToString();
                sheet.Cells[29, 21].Value = SQLComm.Prodt3.Rows[0][3].ToString();

                saveFileName = file.Substring(0, file.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";

                FileInfo TargetFile = new FileInfo(saveFileName);
                excelFile.SaveXls(saveFileName);

                string strTime = DateTime.Now.ToString("yyyyMMdd");
                //清除缓冲区流中的所有内容输出.
                Page.Response.Clear();
                //向输出流添加HTTP头 [指定下载/保存 对话框的文件名]
                Page.Response.AppendHeader("Content-Disposition", "attachment; filename=" + Page.Server.UrlEncode("1500高炉生产日报" + strTime + ".xls"));
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


            ////0 全部 1 白班 2 夜班
            //int iFlag = Convert.ToInt32(cbbType.Value);
            ////if (cbbType.Text.ToString() == "全部")
            ////{
            ////    ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>window.alert('请选择需要导出的班次(白班/夜班)');</script>");
            ////    return;
            ////}
            //string saveFileName = "";
            //try
            //{
            //    //存放于服务器 
            //    string file = "";
            //    if(iFlag == 0)
            //        file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\1500高炉生产日报全部.xls";
            //    else
            //        file = Server.HtmlEncode(Request.PhysicalApplicationPath) + "Manager\\Module\\COMFILE\\1500高炉生产日报.xls";
            //    ExcelFile excelFile = new ExcelFile(file);
            //    ExcelWorksheet sheet = excelFile.Worksheets[0];
            //    if (iFlag == 0)
            //        sheet.Cells[1, 0].Value = "生产日期：" + dateStartTime.Text.ToString();
            //    else
            //        sheet.Cells[1, 0].Value = "生产日期：" + dateStartTime.Text.ToString() + "          班次：" + cbbType.Text.ToString(); //+ "         班别：" + strNowTeam;
            //    for (int i = 0; i < SQLComm.Prodt1.Rows.Count; i++)
            //    {
            //        for (int j = 0; j < SQLComm.Prodt1.Columns.Count; j++)
            //        {
            //            sheet.Cells[5 + i, j].Value = SQLComm.Prodt1.Rows[i][j].ToString();
            //        }
            //    }
            //    int index = 0;
            //    if (iFlag == 0)
            //        index = 21 + 12;
            //    else
            //        index = 21;
            //    int iCont = SQLComm.Prodt2.Rows.Count > 10 ? 10 : SQLComm.Prodt2.Rows.Count;
            //    for (int i = 0; i < iCont; i++)
            //    {
            //        for (int j = 0; j < SQLComm.Prodt2.Columns.Count - 4; j++)
            //        {
            //            sheet.Cells[index + i, j].Value = SQLComm.Prodt2.Rows[i][j].ToString();
            //        }
            //        sheet.Cells[index + i, 17].Value = SQLComm.Prodt2.Rows[i][17].ToString();
            //        sheet.Cells[index + i, 27].Value = SQLComm.Prodt2.Rows[i][18].ToString();
            //        sheet.Cells[index + i, 28].Value = SQLComm.Prodt2.Rows[i][19].ToString();
            //        sheet.Cells[index + i, 29].Value = SQLComm.Prodt2.Rows[i][20].ToString();
            //    }
            //    if (iFlag == 0)
            //    { 
            //        sheet.Cells[43, 1].Value = SQLComm.Prodt3.Rows[0][1].ToString();
            //        sheet.Cells[43, 21].Value = SQLComm.Prodt3.Rows[0][3].ToString();
            //        sheet.Cells[47, 1].Value = SQLComm.Prodt3.Rows[1][1].ToString();
            //        sheet.Cells[47, 21].Value = SQLComm.Prodt3.Rows[1][3].ToString();
            //    }
            //    else
            //    {
            //        sheet.Cells[29, 1].Value = SQLComm.Prodt3.Rows[0][1].ToString();
            //        sheet.Cells[29, 21].Value = SQLComm.Prodt3.Rows[0][3].ToString();
            //    }

            //    saveFileName = file.Substring(0, file.Length - 4) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";

            //    FileInfo TargetFile = new FileInfo(saveFileName);
            //    excelFile.SaveXls(saveFileName);

            //    string strTime = dateStartTime.Date.ToString("yyyyMMdd");
            //    //清除缓冲区流中的所有内容输出.
            //    Page.Response.Clear();
            //    //向输出流添加HTTP头 [指定下载/保存 对话框的文件名]
            //    Page.Response.AppendHeader("Content-Disposition", "attachment; filename=" + Page.Server.UrlEncode("1500高炉生产日报" + strTime + ".xls"));
            //    //向输出流添加HTTP头 [指定文件的长度,这样下载文件就会显示正确的进度
            //    Page.Response.AppendHeader("Content-Length", TargetFile.Length.ToString());
            //    //表明输出的HTTP为流[stream],因此客户端只能下载.
            //    Page.Response.ContentType = "application/octet-stream";
            //    //发送文件流到客户端.
            //    Page.Response.WriteFile(TargetFile.FullName);
            //    //停止执行当前页
            //    Page.Response.Flush();
            //    TargetFile.Delete();
            //    Page.Response.End();
            //}
            //catch (Exception ex)
            //{
            //    ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>window.alert('" + ex.Message + "');</script>");
            //}
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

        protected void gridBase2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            //try
            //{
            //    if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            //    {
            //        //当鼠标停留时更改背景色
            //        e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#B0E2FF';");
            //        //当鼠标移开时还原背景色
            //        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            //    }
            //}
            //catch { }
        }

        protected void gridBase3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            //try
            //{
            //    if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            //    {
            //        //当鼠标停留时更改背景色
            //        e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#B0E2FF';");
            //        //当鼠标移开时还原背景色
            //        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            //    }
            //}
            //catch { }
        }

        protected void gridBase3_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                e.Row.Height = Unit.Pixel(50);
            }
        }
    }
}