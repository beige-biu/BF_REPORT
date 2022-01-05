using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;

namespace BF_ReportCS.Manager.Module.Report._1500BF
{
    public partial class IronTo_Rep : System.Web.UI.Page
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
                DataTable dtGrid = new DataTable();
                SQLComm.IronTodt1 = new DataTable();
                SQLComm.IronTodt1 = SQLComm.CreateIronTodt1();
                string strStartTime = dateStartTime.Text.ToString() + " 20:00:01";
                string strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
                string strSQL = "select * from T_IRON_MG where OUT_START_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') order by OUT_START_TIME asc";
                DataTable dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {                    
                    string strIronNo = dt.Rows[i]["IRON_NO"].ToString();                    
                    strSQL = "select sum(net_weight) as Sum_Weight from L2BF_COM.TMMIRF9_IO where iron_degr ='" + strIronNo + "'";
                    DataTable dtTemp = new DataTable();
                    SQLComm.ExecuteSelectSql_dt(strSQL, ref dtTemp);
                    double dSumWeight = 0;
                    try
                    {
                        if (dtTemp.Rows.Count > 0)
                            dSumWeight = double.Parse(dtTemp.Rows[0]["Sum_Weight"].ToString());
                    }
                    catch { }
                    DataTable dtTemp1 = SQLComm.CreateIronTodt1();
                    DataTable dtIron = new DataTable();
                    strSQL = "select * from L2BF_COM.TMMIRF9_IO where iron_degr ='" + strIronNo + "' and dest_gf='01' order by ponder_time asc ";                    
                    SQLComm.ExecuteSelectSql_dt(strSQL, ref dtIron);
                    if (dtIron.Rows.Count > 0)
                    {
                        for (int k = 0; k < dtIron.Rows.Count; k++)
                        {
                            dtTemp1.Rows[k]["field0"] = dt.Rows[i]["OUT_START_TIME"].ToString();
                            dtTemp1.Rows[k]["field1"] = dt.Rows[i]["SHIFT"].ToString();
                            dtTemp1.Rows[k]["field2"] = dt.Rows[i]["TEAM"].ToString();
                            dtTemp1.Rows[k]["field3"] = dt.Rows[i]["IRON_NO"].ToString();
                            dtTemp1.Rows[k]["field12"] = dSumWeight.ToString();
                            dtTemp1.Rows[k]["field5"] = dtIron.Rows[k]["net_weight"].ToString();
                            dtTemp1.Rows[k]["field4"] = dtIron.Rows[k]["tpc_no"].ToString();
                            dtTemp1.Rows[k]["field13"] = dtIron.Rows[k]["car_no"].ToString();
                        }
                    }
                    dtIron = new DataTable();
                    strSQL = "select * from L2BF_COM.TMMIRF9_IO where iron_degr ='" + strIronNo + "' and dest_gf='02' order by ponder_time asc ";
                    SQLComm.ExecuteSelectSql_dt(strSQL, ref dtIron);
                    if (dtIron.Rows.Count > 0)
                    {
                        for (int k = 0; k < dtIron.Rows.Count; k++)
                        {
                            if (dtTemp1.Rows[k]["field3"].ToString() == "-")
                            {
                                dtTemp1.Rows[k]["field0"] = dt.Rows[i]["OUT_START_TIME"].ToString();
                                dtTemp1.Rows[k]["field1"] = dt.Rows[i]["SHIFT"].ToString();
                                dtTemp1.Rows[k]["field2"] = dt.Rows[i]["TEAM"].ToString();
                                dtTemp1.Rows[k]["field3"] = dt.Rows[i]["IRON_NO"].ToString();
                                dtTemp1.Rows[k]["field12"] = dSumWeight.ToString();
                            }
                            dtTemp1.Rows[k]["field7"] = dtIron.Rows[k]["net_weight"].ToString();
                            dtTemp1.Rows[k]["field6"] = dtIron.Rows[k]["tpc_no"].ToString();
                            dtTemp1.Rows[k]["field14"] = dtIron.Rows[k]["car_no"].ToString();
                        }
                    }
                    dtIron = new DataTable();
                    strSQL = "select * from L2BF_COM.TMMIRF9_IO where iron_degr ='" + strIronNo + "' and dest_gf='07' order by ponder_time asc ";
                    SQLComm.ExecuteSelectSql_dt(strSQL, ref dtIron);
                    if (dtIron.Rows.Count > 0)
                    {
                        for (int k = 0; k < dtIron.Rows.Count; k++)
                        {
                            if (dtTemp1.Rows[k]["field3"].ToString() == "-")
                            {
                                dtTemp1.Rows[k]["field0"] = dt.Rows[i]["OUT_START_TIME"].ToString();
                                dtTemp1.Rows[k]["field1"] = dt.Rows[i]["SHIFT"].ToString();
                                dtTemp1.Rows[k]["field2"] = dt.Rows[i]["TEAM"].ToString();
                                dtTemp1.Rows[k]["field3"] = dt.Rows[i]["IRON_NO"].ToString();
                                dtTemp1.Rows[k]["field12"] = dSumWeight.ToString();
                            }
                            dtTemp1.Rows[k]["field9"] = dtIron.Rows[k]["net_weight"].ToString();
                            dtTemp1.Rows[k]["field8"] = dtIron.Rows[k]["tpc_no"].ToString();
                            dtTemp1.Rows[k]["field15"] = dtIron.Rows[k]["car_no"].ToString();
                        }
                    }
                    dtIron = new DataTable();
                    strSQL = "select * from L2BF_COM.TMMIRF9_IO where iron_degr ='" + strIronNo + "' and dest_gf='04' order by ponder_time asc ";
                    SQLComm.ExecuteSelectSql_dt(strSQL, ref dtIron);
                    if (dtIron.Rows.Count > 0)
                    {
                        for (int k = 0; k < dtIron.Rows.Count; k++)
                        {
                            if (dtTemp1.Rows[k]["field3"].ToString() == "-")
                            {
                                dtTemp1.Rows[k]["field0"] = dt.Rows[i]["OUT_START_TIME"].ToString();
                                dtTemp1.Rows[k]["field1"] = dt.Rows[i]["SHIFT"].ToString();
                                dtTemp1.Rows[k]["field2"] = dt.Rows[i]["TEAM"].ToString();
                                dtTemp1.Rows[k]["field3"] = dt.Rows[i]["IRON_NO"].ToString();
                                dtTemp1.Rows[k]["field12"] = dSumWeight.ToString();
                            }
                            dtTemp1.Rows[k]["field11"] = dtIron.Rows[k]["net_weight"].ToString();
                            dtTemp1.Rows[k]["field10"] = dtIron.Rows[k]["tpc_no"].ToString();
                            dtTemp1.Rows[k]["field16"] = dtIron.Rows[k]["car_no"].ToString();
                        }
                    }
                    for (int j = dtTemp1.Rows.Count - 1; j >= 0; j--)
                    {
                        if (dtTemp1.Rows[j]["field3"].ToString() == "-")
                            dtTemp1.Rows[j].Delete();
                    }
                    dtGrid.Merge(dtTemp1);
                }
                gridBase1.DataSource = dtGrid;
                gridBase1.DataBind();
                gridBase1.ExpandAll();
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
        
        protected void gridBase1_CustomCellMerge(object sender, DevExpress.Web.ASPxGridViewCustomCellMergeEventArgs e)
        {
            List<string> lMergeFileds = new List<string>{ "field0","field1","field2","field3","field12"};
            string sMergeByKey = "field3";
            string sFiledName = "";//当前单元格所在列的列名定义
            sFiledName = ((GridViewDataTextColumn)e.Column).FieldName;//由于e.Column继承GridViewEditDataColumn父类，所以强转成父类然后调用FieldName即可获取列名

            if (lMergeFileds.Contains(sFiledName))//lMergeFileds:List集合,即需要合并列的列名集合，sFiledName：当前单元格所在列名
            {
                int iFirst_Row = e.RowVisibleIndex1;//当前行的行号
                int iSecond_Row = e.RowVisibleIndex2;//下一行的行号
                object oFirst_Value = e.Value1;//当前行单元格的值
                object oSecond_Value = e.Value2;//下一行单元格的值
                object oYwbh_First = gridBase1.GetRowValues(iFirst_Row, sMergeByKey);//获取当前行关键列的单元格的值，注:关键列是指依据哪列进行合并的列名（字符型)
                object oYwbh_Second = gridBase1.GetRowValues(iSecond_Row, sMergeByKey);//获取第二行关键列的单元格的值，注:关键列是指依据哪列进行合并的列名（字符型)

                if (oYwbh_First.Equals(oYwbh_Second))//当第一行业务编号与第二行业务编号相同时
                {
                    if (oFirst_Value.Equals(oSecond_Value))//当第一行单元格的值与第二行单元格的值相同时
                    {
                        e.Merge = true;//合并
                    }
                    else//当第一行单元格的值与第二行单元格的值不相同时
                    {
                        e.Merge = false;//不合并
                    }
                }
                else//当第一行业务编号与第二行业务编号不相同时
                {
                    e.Merge = false;
                }

            }
            e.Handled = true;//关键代码：此句负责执行上面的合并，刷新客户端的表格中的合并情况
        }
    }
}