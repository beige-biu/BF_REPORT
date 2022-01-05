using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_ReportCS.Manager.Module.Report._1280BF
{
    public partial class MaterialInput_Rep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                dateEndTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
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
            if (cbbType.Value.ToString() == "1")
            {
                gridBase1.Columns["gbc1"].Visible = true;
                gridBase1.Columns["gbc2"].Visible = true;
                gridBase1.Columns["gbc3"].Visible = true;
                gridBase1.Columns["SUM_SF"].Visible = true;
                gridBase1.Columns["SUM_SF2"].Visible = true;
                gridBase1.Columns["SUM_AF"].Visible = true;                
                gridBase1.Columns["AF_NAME1"].Visible = true;
                gridBase1.Columns["AF_WEIGHT1"].Visible = true;                
                gridBase1.Columns["AF_NAME2"].Visible = true;
                gridBase1.Columns["AF_WEIGHT2"].Visible = true;               
                gridBase1.Columns["SUM_OF"].Visible = true;
                gridBase1.Columns["OF_NAME1"].Visible = true;
                gridBase1.Columns["OF_WEIGHT1"].Visible = true;               
                gridBase1.Columns["OF_NAME2"].Visible = true;
                gridBase1.Columns["OF_WEIGHT2"].Visible = true;                
                gridBase1.Columns["ZF_WEIGHT1"].Visible = true;
                gridBase1.Columns["ZF_WEIGHT2"].Visible = true;
                gridBase1.Columns["ZF_WEIGHT3"].Visible = true;
                gridBase1.Columns["ZF_WEIGHT4"].Visible = true;
                gridBase1.Columns["ZF_WEIGHT5"].Visible = true;
                gridBase1.Columns["ZF_WEIGHT6"].Visible = true;
                gridBase1.Columns["SUM_ORE"].Visible = true;

                gridBase1.Columns["gbc5"].Visible = false;
                gridBase1.Columns["gbc6"].Visible = false;
                gridBase1.Columns["gbc7"].Visible = false;
                //gridBase1.Columns["gbc8"].Visible = false;
                //gridBase1.Columns["gbc9"].Visible = false;
                //gridBase1.Columns["gbc10"].Visible = false;
                gridBase1.Columns["SUM_COKE"].Visible = false;
                gridBase1.Columns["SUM_DRY_COKE"].Visible = false;
                gridBase1.Columns["COKE_NAME1"].Visible = false;
                gridBase1.Columns["COKE_WEIGHT1"].Visible = false;
                gridBase1.Columns["COKE_NAME2"].Visible = false;
                gridBase1.Columns["COKE_WEIGHT2"].Visible = false;
                gridBase1.Columns["COKE_NAME3"].Visible = false;
                gridBase1.Columns["COKE_WEIGHT3"].Visible = false;
                //gridBase1.Columns["COKE_NAME4"].Visible = false;
                //gridBase1.Columns["COKE_WEIGHT4"].Visible = false;
                //gridBase1.Columns["COKE_NAME5"].Visible = false;
                //gridBase1.Columns["COKE_WEIGHT5"].Visible = false;
                gridBase1.Columns["SUM_CFD"].Visible = false;
                gridBase1.Columns["SUM_CFD2"].Visible = false;
                gridBase1.Columns["SUM_COKEJET"].Visible = false;
            }
            else
            {
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc2"].Visible = false;
                gridBase1.Columns["gbc3"].Visible = false;
                gridBase1.Columns["SUM_SF"].Visible = false;
                gridBase1.Columns["SUM_SF2"].Visible = false;
                gridBase1.Columns["SUM_AF"].Visible = false;
                gridBase1.Columns["AF_NAME1"].Visible = false;
                gridBase1.Columns["AF_WEIGHT1"].Visible = false;
                gridBase1.Columns["AF_NAME2"].Visible = false;
                gridBase1.Columns["AF_WEIGHT2"].Visible = false;
                gridBase1.Columns["SUM_OF"].Visible = false;
                gridBase1.Columns["OF_NAME1"].Visible = false;
                gridBase1.Columns["OF_WEIGHT1"].Visible = false;
                gridBase1.Columns["OF_NAME2"].Visible = false;
                gridBase1.Columns["OF_WEIGHT2"].Visible = false;
                gridBase1.Columns["ZF_WEIGHT1"].Visible = false;
                gridBase1.Columns["ZF_WEIGHT2"].Visible = false;
                gridBase1.Columns["ZF_WEIGHT3"].Visible = false;
                gridBase1.Columns["ZF_WEIGHT4"].Visible = false;
                gridBase1.Columns["ZF_WEIGHT5"].Visible = false;
                gridBase1.Columns["ZF_WEIGHT6"].Visible = false;
                gridBase1.Columns["SUM_ORE"].Visible = false;

                gridBase1.Columns["gbc5"].Visible = true;
                gridBase1.Columns["gbc6"].Visible = true;
                gridBase1.Columns["gbc7"].Visible = true;
                //gridBase1.Columns["gbc8"].Visible = true;
                //gridBase1.Columns["gbc9"].Visible = true;
                //gridBase1.Columns["gbc10"].Visible = true;
                gridBase1.Columns["SUM_COKE"].Visible = true;
                gridBase1.Columns["SUM_DRY_COKE"].Visible = true;
                gridBase1.Columns["COKE_NAME1"].Visible = true;
                gridBase1.Columns["COKE_WEIGHT1"].Visible = true;
                gridBase1.Columns["COKE_NAME2"].Visible = true;
                gridBase1.Columns["COKE_WEIGHT2"].Visible = true;
                gridBase1.Columns["COKE_NAME3"].Visible = true;
                gridBase1.Columns["COKE_WEIGHT3"].Visible = true;
                //gridBase1.Columns["COKE_NAME4"].Visible = true;
                //gridBase1.Columns["COKE_WEIGHT4"].Visible = true;
                //gridBase1.Columns["COKE_NAME5"].Visible = true;
                //gridBase1.Columns["COKE_WEIGHT5"].Visible = true;
                gridBase1.Columns["SUM_CFD"].Visible = true;
                gridBase1.Columns["SUM_CFD2"].Visible = true;
                gridBase1.Columns["SUM_COKEJET"].Visible = true;

            }
           
            DataTable dt = new DataTable();
            dt.Columns.Add("DATETIME", typeof(string));
            dt.Columns.Add("RECORD_TIME", typeof(string));
            dt.Columns.Add("BC", typeof(string));
            dt.Columns.Add("BB", typeof(string));
            dt.Columns.Add("SUM_SF", typeof(string));
            dt.Columns.Add("SUM_SF2", typeof(string));
            dt.Columns.Add("SUM_AF", typeof(string));
            dt.Columns.Add("AF_NAME1", typeof(string));
            dt.Columns.Add("AF_WEIGHT1", typeof(string));
            dt.Columns.Add("AF_NAME2", typeof(string));
            dt.Columns.Add("AF_WEIGHT2", typeof(string));
            dt.Columns.Add("SUM_OF", typeof(string));
            dt.Columns.Add("OF_NAME1", typeof(string));
            dt.Columns.Add("OF_WEIGHT1", typeof(string));
            dt.Columns.Add("OF_NAME2", typeof(string));
            dt.Columns.Add("OF_WEIGHT2", typeof(string));
            dt.Columns.Add("ZF_WEIGHT1", typeof(string));
            dt.Columns.Add("ZF_WEIGHT2", typeof(string));
            dt.Columns.Add("ZF_WEIGHT3", typeof(string));
            dt.Columns.Add("ZF_WEIGHT4", typeof(string));
            dt.Columns.Add("ZF_WEIGHT5", typeof(string));
            dt.Columns.Add("ZF_WEIGHT6", typeof(string));
            dt.Columns.Add("SUM_ORE", typeof(string));
            dt.Columns.Add("SUM_COKE", typeof(string));
            dt.Columns.Add("SUM_DRY_COKE", typeof(string));
            dt.Columns.Add("COKE_NAME1", typeof(string));
            dt.Columns.Add("COKE_WEIGHT1", typeof(string));
            dt.Columns.Add("COKE_NAME2", typeof(string));
            dt.Columns.Add("COKE_WEIGHT2", typeof(string));
            dt.Columns.Add("COKE_NAME3", typeof(string));
            dt.Columns.Add("COKE_WEIGHT3", typeof(string));
            dt.Columns.Add("SUM_CFD", typeof(string));
            dt.Columns.Add("SUM_CFD2", typeof(string));
            dt.Columns.Add("SUM_COKEJET", typeof(string));
            //假数据修改
            //if (Convert.ToDateTime(strEndTime) <= Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = " select to_char(a.RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* FROM l2bf_db.DAY_RLYRL_FALII  a where TO_CHAR(RECORD_TIME,'YYYY-MM-DD HH24:MI:SS') between '" + strStartTime + "' and '" + strEndTime + "' "; 
            //    strSQL += " ORDER BY RECORD_TIME ASC ";
            //}
            //else if (Convert.ToDateTime(strStartTime) >= Convert.ToDateTime("2020-11-11 20:00:01"))
            //{
            //    strSQL = " SELECT to_char(a.RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* FROM l2bf_db.DAY_RLYRL  a WHERE TO_CHAR(RECORD_TIME,'YYYY-MM-DD HH24:MI:SS') BETWEEN '" + strStartTime + "' AND '" + strEndTime + "'  ";
            //    strSQL += " ORDER BY RECORD_TIME ASC ";
            //}
            //else if (Convert.ToDateTime(strStartTime) < Convert.ToDateTime("2020-11-11 20:00:01") & Convert.ToDateTime(strEndTime) > Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = "select * from ( ";
            //    strSQL += "select to_char(a.RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* FROM l2bf_db.DAY_RLYRL_FALII  a  where TO_CHAR(RECORD_TIME,'YYYY-MM-DD HH24:MI:SS') between '" + strStartTime + "' and '2020-11-11 20:00:00' ";
            //    strSQL += " union ";
            //    strSQL += "select to_char(a.RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* FROM l2bf_db.DAY_RLYRL a where TO_CHAR(RECORD_TIME,'YYYY-MM-DD HH24:MI:SS') between '2020-11-11 20:00:01' and '" + strEndTime + "' ";
            //    strSQL += " )order by RECORD_TIME asc";
            //}
            //原始代码
            strSQL = " SELECT to_char(a.RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* FROM l2bf_db.DAY_RLYRL  a WHERE TO_CHAR(RECORD_TIME,'YYYY-MM-DD HH24:MI:SS') BETWEEN '" + strStartTime + "' AND '" + strEndTime + "'  ";
            strSQL += " ORDER BY RECORD_TIME ASC ";
            DataTable dtOre = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dtOre);
            foreach (DataRow dr in dtOre.Rows)
            {
                DataRow drNow = dt.NewRow();
                //其他
                drNow["DATETIME"] = dr["DATETIME"];
                drNow["RECORD_TIME"] = dr["RECORD_TIME"];
                drNow["BC"] = dr["BC"];
                drNow["BB"] = dr["BB"];
                drNow["SUM_SF"] = dr["SUM_SF"];
                drNow["SUM_SF2"] = dr["SUM_SF2"];
                drNow["SUM_AF"] = dr["SUM_AF"];
                drNow["SUM_OF"] = dr["SUM_OF"];
                drNow["ZF_WEIGHT1"] = dr["ZF_WEIGHT1"];
                drNow["ZF_WEIGHT2"] = dr["ZF_WEIGHT2"];
                drNow["ZF_WEIGHT3"] = dr["ZF_WEIGHT3"];
                drNow["ZF_WEIGHT4"] = dr["ZF_WEIGHT4"];
                drNow["ZF_WEIGHT5"] = dr["ZF_WEIGHT5"];
                drNow["ZF_WEIGHT6"] = dr["ZF_WEIGHT6"];
                drNow["SUM_ORE"] = dr["SUM_ORE"];
                drNow["SUM_COKE"] = dr["SUM_COKE"];
                drNow["SUM_DRY_COKE"] = dr["SUM_DRY_COKE"];
                drNow["SUM_CFD"] = dr["SUM_CFD"];
                drNow["SUM_CFD2"] = dr["SUM_CFD2"];
                drNow["SUM_COKEJET"] = dr["SUM_COKEJET"];





                //COKE_NAME COKE_WEIGHT
                int index = 1;
                for (int i = 1; i <= 5; i++)//检查5个仓
                {
                    string strName = dr["COKE_NAME" + i].ToString();
                    if (!string.IsNullOrEmpty(strName))
                    {
                        double dTmp = 0, dOre = 0;
                        int j = 0;
                        for(j = 1; j < index; j++) //检查3个料种是否存在
                        {
                            if (drNow["COKE_NAME" + j].ToString().Equals(strName))//存在累加
                            {
                                if (double.TryParse(dr["COKE_WEIGHT" + i].ToString(), out dTmp))
                                    if (double.TryParse(drNow["COKE_WEIGHT" + j].ToString(), out dOre))
                                        drNow["COKE_WEIGHT" + j] = (dOre + dTmp).ToString();
                                    else
                                        drNow["COKE_WEIGHT" + j] = dTmp.ToString();
                                break;
                            }
                        }
                        if(j >= index)//不存在超过3个料种时新增
                        {
                            if (index <= 3)
                            {
                                drNow["COKE_NAME" + index] = strName;
                                drNow["COKE_WEIGHT" + index] = dr["COKE_WEIGHT" + i].ToString();
                                index++;
                            }
                        }
                    }
                }
                //AF_NAME AF_WEIGHT
                index = 1;
                for (int i = 1; i <= 2; i++)//检查2个仓
                {
                    string strName = dr["AF_NAME" + i].ToString();
                    if (!string.IsNullOrEmpty(strName))
                    {
                        double dTmp = 0, dOre = 0;
                        int j = 0;
                        for (j = 1; j < index; j++) 
                        {
                            if (drNow["AF_NAME" + j].ToString().Equals(strName))//存在累加
                            {
                                if (double.TryParse(dr["AF_WEIGHT" + i].ToString(), out dTmp))
                                    if (double.TryParse(drNow["AF_WEIGHT" + j].ToString(), out dOre))
                                        drNow["AF_WEIGHT" + j] = (dOre + dTmp).ToString();
                                    else
                                        drNow["AF_WEIGHT" + j] = dTmp.ToString();
                                break;
                            }
                        }
                        if (j >= index)
                        {

                            drNow["AF_NAME" + index] = strName;
                            drNow["AF_WEIGHT" + index] = dr["AF_WEIGHT" + i].ToString();
                            index++;

                        }
                    }
                }

                //OF_NAME OF_WEIGHT
                index = 1;
                for (int i = 1; i <= 2; i++)//检查2个仓
                {
                    string strName = dr["OF_NAME" + i].ToString();
                    if (!string.IsNullOrEmpty(strName))
                    {
                        double dTmp = 0, dOre = 0;
                        int j = 0;
                        for (j = 1; j < index; j++)
                        {
                            if (drNow["OF_NAME" + j].ToString().Equals(strName))//存在累加
                            {
                                if (double.TryParse(dr["OF_WEIGHT" + i].ToString(), out dTmp))
                                    if (double.TryParse(drNow["OF_WEIGHT" + j].ToString(), out dOre))
                                        drNow["OF_WEIGHT" + j] = (dOre + dTmp).ToString();
                                    else
                                        drNow["OF_WEIGHT" + j] = dTmp.ToString();
                                break;
                            }
                        }
                        if (j >= index)
                        {

                            drNow["OF_NAME" + index] = strName;
                            drNow["OF_WEIGHT" + index] = dr["OF_WEIGHT" + i].ToString();
                            index++;

                        }
                    }
                }

                dt.Rows.Add(drNow);
            }
            
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
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