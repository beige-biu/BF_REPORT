using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FrameWork;
using DevExpress.Web;
using FrameWork.web;
using GemBox.ExcelLite;
using System.IO;

namespace BF_Report.Manager.Module.Report._3200BF
{
    public partial class BFNOTE_Rep_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
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
                SQLComm.Prodt1 = new DataTable();
                SQLComm.Prodt3 = new DataTable();
                string strSQL = "";
                #region 填充SQLComm.Prodt1数据
                string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
                string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
                string strCon = cbbType.Value.ToString();
                strSQL = "SELECT SHIFTLOG_DATE,SHIFTID,SHIFTLOG_YIELD,SHIFTLOG_CARBONRATIO,SHIFTLOG_HK,SHIFTLOG_COKE1,SHIFTLOG_COKE2,SHIFTLOG_COKE3,SHIFTLOG_COKE4,SHIFTLOG_COKE1RATIO,SHIFTLOG_COKE2RATIO,SHIFTLOG_COKE3RATIO,SHIFTLOG_COKE4RATIO";
                strSQL += " from ORAL2DB_BF.FL2_TB_SHIFT_LOG where SHIFTLOG_DATE between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')";

                if (strCon.Equals("0"))
                    strSQL += " AND SHIFTID = '0' ";
                else if (strCon.Equals("1"))
                    strSQL += " AND SHIFTID = '1' ";
                strSQL += "order by SHIFTLOG_DATE desc";
                


                DataTable dt1 = new DataTable();
                SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt1);
                #endregion

                #region 填充SQLComm.Prodt3数据
                //查询白夜班记事
                if (cbbType.Value.ToString() == "0")
                {
                    strSQL = "select SHIFTLOG_DATE,SHIFTID,SHIFTLOG_LOG from ORAL2DB_BF.FL2_TB_SHIFT_LOG where to_char(SHIFTLOG_DATE,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and SHIFTID = '0'  and rownum=1 order by SHIFTLOG_DATE desc ";
                    SQLComm.Prodt3 = SQLComm.CreateBFnotePord(1);
                }
                else
                {
                    strSQL = "select SHIFTLOG_DATE,SHIFTID,SHIFTLOG_LOG from ORAL2DB_BF.FL2_TB_SHIFT_LOG where to_char(SHIFTLOG_DATE,'yyyy-MM-dd hh24:mi:ss') between '" + strStartTime + "' and '" + strEndTime + "' and SHIFTID = '1' and rownum=1 order by SHIFTLOG_DATE desc";
                    SQLComm.Prodt3 = SQLComm.CreateBFnotePord(1);
                }
                DataTable dt3 = new DataTable();
                SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt3);
                if (dt3 != null && dt3.Rows.Count > 0)
                {
                    for (int i = 0; i < dt3.Rows.Count; i++)
                    {
                        SQLComm.Prodt3.Rows[i]["field0"] = dt3.Rows[i]["SHIFTLOG_LOG"].ToString();//炉况分析
                        SQLComm.Prodt3.Rows[i]["field1"] = "记事";
                    }
                }
                #endregion

                gridBase1.DataSource = dt1;
                gridBase3.DataSource = SQLComm.Prodt3;
                gridBase1.DataBind();
                gridBase3.DataBind();
            }

            catch (Exception ex) { }
        }

        //protected void btnExp_Excel_Click(object sender, EventArgs e)
        //{
        //    GetData();
        //    ExpGrid.WriteXlsxToResponse();
        //}

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
        protected void gridBase3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
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
        protected void gridBase3_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                e.Row.Height = Unit.Pixel(50);
            }
        }


    }
}