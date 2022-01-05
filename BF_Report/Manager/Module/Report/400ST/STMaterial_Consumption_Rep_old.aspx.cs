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

namespace BF_Report.Manager.Module.Report._400ST
{
    public partial class STMaterial_Consumption_Rep_old : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.ToString("yyyyMMdd")+"200000";
            string strEndTime = dateEndTime.Date.ToString("yyyyMMdd") + "200000";
            string strSQL = "";
            strSQL = "SELECT RECORD_DATE, CASE SHIFTS WHEN '0' THEN '白班' WHEN '1' THEN '夜班' END AS SHIFTS,TAEM, ";
            strSQL += "WORK_BEGIN_TIME,WORK_END_TIME,MATERIAL_NAME,CONSUMPTION_SUM,SPECIFIC_CONSUMPTION ";
            strSQL += "FROM ORALTL2_ST.T_MATERIAL_TEAM_CONSUMPTION t ";
            strSQL += " WHERE RECORD_DATE BETWEEN TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-MM-dd hh24:mi:ss') ";
            strSQL += "ORDER BY RECORD_DATE DESC ";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
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