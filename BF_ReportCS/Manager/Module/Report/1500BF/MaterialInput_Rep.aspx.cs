using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_ReportCS.Manager.Module.Report._1500BF
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
            if (cbbType.Value.ToString() == "1")
            {
                gridBase1.Columns["gbc1"].Visible = true;
                gridBase1.Columns["gbc2"].Visible = true;
                gridBase1.Columns["gbc3"].Visible = true;
                gridBase1.Columns["SUM_SF"].Visible = true;
                gridBase1.Columns["SUM_AF"].Visible = true;
                gridBase1.Columns["SUM_WET_AF"].Visible = true;
                gridBase1.Columns["AF_NAME1"].Visible = true;
                gridBase1.Columns["AF_WEIGHT1"].Visible = true;
                gridBase1.Columns["AF_WET_WEIGHT1"].Visible = true;
                gridBase1.Columns["AF_NAME2"].Visible = true;
                gridBase1.Columns["AF_WEIGHT2"].Visible = true;
                gridBase1.Columns["AF_WET_WEIGHT2"].Visible = true;
                gridBase1.Columns["AF_NAME3"].Visible = true;
                gridBase1.Columns["AF_WEIGHT3"].Visible = true;
                gridBase1.Columns["AF_WET_WEIGHT3"].Visible = true;
                gridBase1.Columns["SUM_WET_OF"].Visible = true;
                gridBase1.Columns["SUM_OF"].Visible = true;
                gridBase1.Columns["OF_NAME1"].Visible = true;
                gridBase1.Columns["OF_WEIGHT1"].Visible = true;
                gridBase1.Columns["OF_WET_WEIGHT1"].Visible = true;
                gridBase1.Columns["OF_NAME2"].Visible = true;
                gridBase1.Columns["OF_WEIGHT2"].Visible = true;
                gridBase1.Columns["OF_WET_WEIGHT2"].Visible = true;
                gridBase1.Columns["OF_NAME3"].Visible = true;
                gridBase1.Columns["OF_WEIGHT3"].Visible = true;
                gridBase1.Columns["OF_WET_WEIGHT3"].Visible = true;
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
                gridBase1.Columns["gbc8"].Visible = false;
                gridBase1.Columns["gbc9"].Visible = false;
                gridBase1.Columns["gbc10"].Visible = false;
                gridBase1.Columns["SUM_COKE"].Visible = false;
                gridBase1.Columns["SUM_DRY_COKE"].Visible = false;
                gridBase1.Columns["COKE_NAME1"].Visible = false;
                gridBase1.Columns["COKE_WEIGHT1"].Visible = false;
                gridBase1.Columns["COKE_WET_WEIGHT1"].Visible = false;
                gridBase1.Columns["COKE_NAME2"].Visible = false;
                gridBase1.Columns["COKE_WEIGHT2"].Visible = false;
                gridBase1.Columns["COKE_WET_WEIGHT2"].Visible = false;
                gridBase1.Columns["COKE_NAME3"].Visible = false;
                gridBase1.Columns["COKE_WEIGHT3"].Visible = false;
                gridBase1.Columns["COKE_WET_WEIGHT3"].Visible = false;
                gridBase1.Columns["SUM_CFD"].Visible = false;
                gridBase1.Columns["SUM_WET_CFD"].Visible = false;
                gridBase1.Columns["SUM_CFD2"].Visible = false;
                gridBase1.Columns["SUM_WET_CFD2"].Visible = false;
                gridBase1.Columns["SUM_COKEJET"].Visible = false;
                gridBase1.Columns["COKE_WEIGHT6"].Visible = false;
                gridBase1.Columns["COKE_WEIGHT7"].Visible = false;
            }
            else
            {
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc2"].Visible = false;
                gridBase1.Columns["gbc3"].Visible = false;
                gridBase1.Columns["SUM_SF"].Visible = false;
                gridBase1.Columns["SUM_AF"].Visible = false;
                gridBase1.Columns["SUM_WET_AF"].Visible = false;
                gridBase1.Columns["AF_NAME1"].Visible = false;
                gridBase1.Columns["AF_WEIGHT1"].Visible = false;
                gridBase1.Columns["AF_WET_WEIGHT1"].Visible = false;
                gridBase1.Columns["AF_NAME2"].Visible = false;
                gridBase1.Columns["AF_WEIGHT2"].Visible = false;
                gridBase1.Columns["AF_WET_WEIGHT2"].Visible = false;
                gridBase1.Columns["AF_NAME3"].Visible = false;
                gridBase1.Columns["AF_WEIGHT3"].Visible = false;
                gridBase1.Columns["AF_WET_WEIGHT3"].Visible = false;
                gridBase1.Columns["SUM_WET_OF"].Visible = false;
                gridBase1.Columns["SUM_OF"].Visible = false;
                gridBase1.Columns["OF_NAME1"].Visible = false;
                gridBase1.Columns["OF_WEIGHT1"].Visible = false;
                gridBase1.Columns["OF_WET_WEIGHT1"].Visible = false;
                gridBase1.Columns["OF_NAME2"].Visible = false;
                gridBase1.Columns["OF_WEIGHT2"].Visible = false;
                gridBase1.Columns["OF_WET_WEIGHT2"].Visible = false;
                gridBase1.Columns["OF_NAME3"].Visible = false;
                gridBase1.Columns["OF_WEIGHT3"].Visible = false;
                gridBase1.Columns["OF_WET_WEIGHT3"].Visible = false;
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
                gridBase1.Columns["gbc8"].Visible = true;
                gridBase1.Columns["gbc9"].Visible = true;
                gridBase1.Columns["gbc10"].Visible = true;
                gridBase1.Columns["SUM_COKE"].Visible = true;
                gridBase1.Columns["SUM_DRY_COKE"].Visible = true;
                gridBase1.Columns["COKE_NAME1"].Visible = true;
                gridBase1.Columns["COKE_WEIGHT1"].Visible = true;
                gridBase1.Columns["COKE_WET_WEIGHT1"].Visible = true;
                gridBase1.Columns["COKE_NAME2"].Visible = true;
                gridBase1.Columns["COKE_WEIGHT2"].Visible = true;
                gridBase1.Columns["COKE_WET_WEIGHT2"].Visible = true;
                gridBase1.Columns["COKE_NAME3"].Visible = true;
                gridBase1.Columns["COKE_WEIGHT3"].Visible = true;
                gridBase1.Columns["COKE_WET_WEIGHT3"].Visible = true;
                gridBase1.Columns["SUM_CFD"].Visible = true;
                gridBase1.Columns["SUM_WET_CFD"].Visible = true;
                gridBase1.Columns["SUM_CFD2"].Visible = true;
                gridBase1.Columns["SUM_WET_CFD2"].Visible = true;
                gridBase1.Columns["SUM_COKEJET"].Visible = true;
                gridBase1.Columns["COKE_WEIGHT6"].Visible = true;
                gridBase1.Columns["COKE_WEIGHT7"].Visible = true;
            }
            //假数据修改
            //if (Convert.ToDateTime(strEndTime) <= Convert.ToDateTime("2020-11-09 20:00:00"))
            //{
            //    strSQL = " select to_char(RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* from T_RPT_MATERIAL_FAL a WHERE a.RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            //    strSQL += " ORDER BY RECORD_TIME ASC ";
            //}
            //else if (Convert.ToDateTime(strStartTime) >= Convert.ToDateTime("2020-11-09 20:00:01"))
            //{
            //    strSQL = " SELECT to_char(a.RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* FROM T_RPT_MATERIAL  a WHERE TO_CHAR(RECORD_TIME,'YYYY-MM-DD HH24:MI:SS') BETWEEN '" + strStartTime + "' AND '" + strEndTime + "'  ";
            //    strSQL += " ORDER BY RECORD_TIME ASC ";
            //}
            //else if (Convert.ToDateTime(strStartTime) < Convert.ToDateTime("2020-11-09 20:00:01") & Convert.ToDateTime(strEndTime) > Convert.ToDateTime("2020-11-09 20:00:00"))
            //{
            //    strSQL = "select * from ( ";
            //    strSQL += "select to_char(RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* from T_RPT_MATERIAL_FAL a WHERE a.RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('2020-11-09 20:00:00','yyyy-mm-dd hh24:mi:ss')";
            //    strSQL += " union ";
            //    strSQL += "select to_char(RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* from T_RPT_MATERIAL a WHERE a.RECORD_TIME BETWEEN TO_DATE('2020-11-09 20:00:01','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            //    strSQL += " )order by RECORD_TIME asc";
            //}
            //源代码
            strSQL = " select to_char(RECORD_TIME,'yyyy-MM-dd') as DATETIME,a.* from T_RPT_MATERIAL a WHERE a.RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')";
            strSQL += " ORDER BY RECORD_TIME ASC";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 8)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Auto;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 175;
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