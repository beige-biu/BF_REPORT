using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._1280BF
{
    public partial class IronTo_Rep_1 : System.Web.UI.Page
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
            try
            {
                DataTable dtGrid = new DataTable();
                SQLComm.IronTodt1 = new DataTable();
                SQLComm.IronTodt1 = SQLComm.CreateIronTodt1();
                string strStartTime = dateStartTime.Text.ToString() + " 20:00:01";
                string strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
                string strSQL = "select * from l2bf_db.DAY_IRON  where OUT_START_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') order by OUT_START_TIME asc";
                DataTable dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {                    
                    string strIronNo = dt.Rows[i]["IRON_DEGR"].ToString();                    
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
                            dtTemp1.Rows[k]["field1"] = dt.Rows[i]["BC"].ToString();
                            dtTemp1.Rows[k]["field2"] = dt.Rows[i]["BB"].ToString();
                            dtTemp1.Rows[k]["field3"] = dt.Rows[i]["IRON_DEGR"].ToString();
                            dtTemp1.Rows[k]["field12"] = dSumWeight.ToString();
                            dtTemp1.Rows[k]["field5"] = double.Parse(dtIron.Rows[k]["net_weight"].ToString());
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
                                dtTemp1.Rows[k]["field1"] = dt.Rows[i]["BC"].ToString();
                                dtTemp1.Rows[k]["field2"] = dt.Rows[i]["BB"].ToString();
                                dtTemp1.Rows[k]["field3"] = dt.Rows[i]["IRON_DEGR"].ToString();
                                dtTemp1.Rows[k]["field12"] = dSumWeight.ToString();
                            }
                            dtTemp1.Rows[k]["field7"] = double.Parse(dtIron.Rows[k]["net_weight"].ToString());
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
                                dtTemp1.Rows[k]["field1"] = dt.Rows[i]["BC"].ToString();
                                dtTemp1.Rows[k]["field2"] = dt.Rows[i]["BB"].ToString();
                                dtTemp1.Rows[k]["field3"] = dt.Rows[i]["IRON_DEGR"].ToString();
                                dtTemp1.Rows[k]["field12"] = dSumWeight.ToString();
                            }
                            dtTemp1.Rows[k]["field9"] = double.Parse(dtIron.Rows[k]["net_weight"].ToString());
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
                                dtTemp1.Rows[k]["field1"] = dt.Rows[i]["BC"].ToString();
                                dtTemp1.Rows[k]["field2"] = dt.Rows[i]["BB"].ToString();
                                dtTemp1.Rows[k]["field3"] = dt.Rows[i]["IRON_DEGR"].ToString();
                                dtTemp1.Rows[k]["field12"] = double.Parse(dSumWeight.ToString());
                            }
                            dtTemp1.Rows[k]["field11"] = double.Parse(dtIron.Rows[k]["net_weight"].ToString());
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
                //gridBase1.DataSource = dtGrid;
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("field0", typeof(string));
                dt1.Columns.Add("field1", typeof(string));
                dt1.Columns.Add("field2", typeof(string));
                dt1.Columns.Add("field3", typeof(string));
                dt1.Columns.Add("field4", typeof(string));
                dt1.Columns.Add("field5", typeof(decimal));
                dt1.Columns.Add("field6", typeof(string));
                dt1.Columns.Add("field7", typeof(decimal));
                dt1.Columns.Add("field8", typeof(string));
                dt1.Columns.Add("field9", typeof(decimal));
                dt1.Columns.Add("field10", typeof(string));
                dt1.Columns.Add("field11", typeof(decimal));
                dt1.Columns.Add("field12", typeof(decimal));
                dt1.Columns.Add("field13", typeof(string));
                dt1.Columns.Add("field14", typeof(string));
                dt1.Columns.Add("field15", typeof(string));
                dt1.Columns.Add("field16", typeof(string));
             
                foreach (DataRow col in dtGrid.Rows)
                {
                    DataRow row = dt1.NewRow();
                    row["field0"] = col["field0"];
                    row["field1"] = col["field1"];
                    row["field2"] = col["field2"];
                    row["field3"] = col["field3"];
                    row["field4"] = col["field4"];
                    row["field5"] = col["field5"];
                    row["field6"] = col["field6"];
                    row["field7"] = col["field7"];
                    row["field8"] = col["field8"];
                    row["field9"] = col["field9"];
                    row["field10"] = col["field10"];
                    row["field11"] = col["field11"];
                    row["field12"] = col["field12"];
                    row["field13"] = col["field13"];
                    row["field14"] = col["field14"];
                    row["field15"] = col["field15"];
                    row["field16"] = col["field16"];
                    
                    dt1.Rows.Add(row);
                }

                gridBase1.DataSource = dt1;
                gridBase1.DataBind();
                gridBase1.ExpandAll();

                if (dt1.Rows.Count > 18)
                {
                    gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                    gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 150;
                }
                else
                    gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
            }
            catch { }
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