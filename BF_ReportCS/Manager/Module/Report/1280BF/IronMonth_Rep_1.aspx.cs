using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;

namespace BF_ReportCS.Manager.Module.Report._1280BF
{
    public partial class IronMonth_Rep_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                GetData();
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
                DataTable dtGrid = SQLComm.CreateIronMonthdt();
                string strStartTime = string.Format("{0:yyyy-MM}", DateTime.Parse(dateStartTime.Value.ToString()).AddMonths(-1)) + "-25 20:00:01";
                string strEndTime = string.Format("{0:yyyy-MM}", DateTime.Parse(dateStartTime.Value.ToString())) + "-25 20:00:00";
                
                string strSQL = "";
                strSQL = " select a.NET_WEIGHT,a.DEST_GF,b.IRON_DEGR as IRON_NO,b.JDG_GRADE from  ";
                strSQL += "(SELECT * FROM L2BF_COM.TMMIRF9_IO WHERE ponder_time>TO_CHAR(to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') ,'yyyymmddhh24miss') and ponder_time<=TO_CHAR(to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ,'yyyymmddhh24miss') ) a ";
                strSQL += " left join (select distinct(iron_degr),b.jdg_grade from L2BF_COM.TMMIRF9_IO a left join l2bf_com.tqmir24_io b on a.iron_degr = substr(b.mat_sample_no, 0, 8)";
                strSQL += " where  unit_no='6' and b.jdg_grade in ('L03', 'L04', 'L06', 'L10', '等外') ";
                strSQL += " and substr(b.mat_sample_no,9,3)= 'L01'   and b.jdg_type = '1A1') b";
                strSQL += " on a.iron_degr = b.IRON_DEGR where b.IRON_DEGR is not null";
                DataTable dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                //第一维：总产量，L03/04，L06,L10，非炼钢铁
                //第二维:总产量，1炼钢 01，2炼钢 02，3炼钢 07，铸铁 04
                double[,] d_Iron = new double[5, 5]{
                        { 0,0,0,0,0},{ 0,0,0,0,0},{ 0,0,0,0,0},{ 0,0,0,0,0},{ 0,0,0,0,0}
                    };
                foreach (DataRow dr in dt.Rows)
                {                    
                    string strDest_gf = dr[1].ToString();
                    string strJdgGrade = dr[3].ToString();
                    double d_Value = 0;
                    string str_Value= dr[0].ToString();
                    if (SQLComm.IsNumberic(str_Value))
                        d_Value = double.Parse(str_Value);
                    d_Iron[0, 0] += d_Value;//铁水总产量
                    if(strDest_gf=="01")//1炼铁水总产量
                        d_Iron[0, 1] += d_Value;
                    if (strDest_gf == "02")//2炼铁水总产量
                        d_Iron[0, 2] += d_Value;
                    if (strDest_gf == "07")//3炼铁水总产量
                        d_Iron[0, 3] += d_Value;
                    if (strDest_gf == "04")//铸铁水总产量
                        d_Iron[0, 4] += d_Value;
                    if (strJdgGrade == "L03" || strJdgGrade == "L04")
                    {
                        d_Iron[1, 0] += d_Value;//铁水总产量
                        if (strDest_gf == "01")//1炼铁水总产量
                            d_Iron[1, 1] += d_Value;
                        if (strDest_gf == "02")//2炼铁水总产量
                            d_Iron[1, 2] += d_Value;
                        if (strDest_gf == "07")//3炼铁水总产量
                            d_Iron[1, 3] += d_Value;
                        if (strDest_gf == "04")//铸铁水总产量
                            d_Iron[1, 4] += d_Value;
                    }
                    if (strJdgGrade == "L06")
                    {
                        d_Iron[2, 0] += d_Value;//铁水总产量
                        if (strDest_gf == "01")//1炼铁水总产量
                            d_Iron[2, 1] += d_Value;
                        if (strDest_gf == "02")//2炼铁水总产量
                            d_Iron[2, 2] += d_Value;
                        if (strDest_gf == "07")//3炼铁水总产量
                            d_Iron[2, 3] += d_Value;
                        if (strDest_gf == "04")//铸铁水总产量
                            d_Iron[2, 4] += d_Value;
                    }
                    if (strJdgGrade == "L10")
                    {
                        d_Iron[3, 0] += d_Value;//铁水总产量
                        if (strDest_gf == "01")//1炼铁水总产量
                            d_Iron[3, 1] += d_Value;
                        if (strDest_gf == "02")//2炼铁水总产量
                            d_Iron[3, 2] += d_Value;
                        if (strDest_gf == "07")//3炼铁水总产量
                            d_Iron[3, 3] += d_Value;
                        if (strDest_gf == "04")//铸铁水总产量
                            d_Iron[3, 4] += d_Value;
                    }
                    if (strJdgGrade == "等外")
                    {
                        d_Iron[4, 0] += d_Value;//铁水总产量
                        if (strDest_gf == "01")//1炼铁水总产量
                            d_Iron[4, 1] += d_Value;
                        if (strDest_gf == "02")//2炼铁水总产量
                            d_Iron[4, 2] += d_Value;
                        if (strDest_gf == "07")//3炼铁水总产量
                            d_Iron[4, 3] += d_Value;
                        if (strDest_gf == "04")//铸铁水总产量
                            d_Iron[4, 4] += d_Value;
                    }
                }
                //取出铁水系数
                double d_Ironoff = 0.99;
                double d_CastIronoff = 0.95;
                strSQL = "select VALUE from T_BASE_SYSDATA where C_FLAG in ('c_ironoff','c_castironoff') order by SEQNO asc";
                dt = new DataTable();
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
                if (dt.Rows.Count == 2)
                {
                    if (SQLComm.IsNumberic(dt.Rows[0][0].ToString()))
                        d_Ironoff = double.Parse(dt.Rows[0][0].ToString());
                    if (SQLComm.IsNumberic(dt.Rows[1][0].ToString()))
                        d_CastIronoff = double.Parse(dt.Rows[1][0].ToString());
                }
                for (int i = 0; i < d_Iron.GetLength(0); i++)
                {
                    dtGrid.Rows[i][1] = (d_Iron[i, 0] * d_Ironoff).ToString("N2").Replace(",","");
                    dtGrid.Rows[i][2] = (d_Iron[i, 1] * d_Ironoff).ToString("N2").Replace(",", "");
                    dtGrid.Rows[i][3] = (d_Iron[i, 2] * d_Ironoff).ToString("N2").Replace(",", "");
                    dtGrid.Rows[i][4] = (d_Iron[i, 3] * d_Ironoff).ToString("N2").Replace(",", "");
                    dtGrid.Rows[i][5] = (d_Iron[i, 4] * d_Ironoff).ToString("N2").Replace(",", "");
                }
                String SQL1 = "SELECT KT from T_INSERT_JSKT where unit_no='1' and record_time>to_char(to_date('"+strStartTime+"','yyyy-MM-dd hh24:mi:ss'),'yyyyMM') and record_time<=to_char(to_date('"+strEndTime+"','yyyy-MM-dd hh24:mi:ss'),'yyyyMM')";
                DataTable dt1 = new DataTable();
                SQLComm.ExecuteSelectSql_dt(SQL1, ref dt1);
                dtGrid.Rows[5][1] = dt1.Rows[0][0].ToString();
                //dtGrid.Rows[5][1]="-"+ (d_Iron[0, 4]* d_CastIronoff).ToString("N2").Replace(",", "");
                dtGrid.DefaultView.Sort = "field6 asc";
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
            //List<string> lMergeFileds = new List<string>{ "field0","field1","field2","field3","field12"};
            //string sMergeByKey = "field3";
            //string sFiledName = "";//当前单元格所在列的列名定义
            //sFiledName = ((GridViewDataTextColumn)e.Column).FieldName;//由于e.Column继承GridViewEditDataColumn父类，所以强转成父类然后调用FieldName即可获取列名

            //if (lMergeFileds.Contains(sFiledName))//lMergeFileds:List集合,即需要合并列的列名集合，sFiledName：当前单元格所在列名
            //{
            //    int iFirst_Row = e.RowVisibleIndex1;//当前行的行号
            //    int iSecond_Row = e.RowVisibleIndex2;//下一行的行号
            //    object oFirst_Value = e.Value1;//当前行单元格的值
            //    object oSecond_Value = e.Value2;//下一行单元格的值
            //    object oYwbh_First = gridBase1.GetRowValues(iFirst_Row, sMergeByKey);//获取当前行关键列的单元格的值，注:关键列是指依据哪列进行合并的列名（字符型)
            //    object oYwbh_Second = gridBase1.GetRowValues(iSecond_Row, sMergeByKey);//获取第二行关键列的单元格的值，注:关键列是指依据哪列进行合并的列名（字符型)

            //    if (oYwbh_First.Equals(oYwbh_Second))//当第一行业务编号与第二行业务编号相同时
            //    {
            //        if (oFirst_Value.Equals(oSecond_Value))//当第一行单元格的值与第二行单元格的值相同时
            //        {
            //            e.Merge = true;//合并
            //        }
            //        else//当第一行单元格的值与第二行单元格的值不相同时
            //        {
            //            e.Merge = false;//不合并
            //        }
            //    }
            //    else//当第一行业务编号与第二行业务编号不相同时
            //    {
            //        e.Merge = false;
            //    }

            //}
            //e.Handled = true;//关键代码：此句负责执行上面的合并，刷新客户端的表格中的合并情况
        }
    }
}