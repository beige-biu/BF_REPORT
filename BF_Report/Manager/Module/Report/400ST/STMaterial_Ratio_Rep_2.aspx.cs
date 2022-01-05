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
    public partial class STMaterial_Ratio_Rep_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-5);
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
            strSQL = "SELECT PBD_NO, MATERIAL_NAME, MATERIAL_CODE, MATERIAL_PERCENTAGE, BEGIN_STORE_DATE, RECORD_DATE, RECORD_PERSON ";
            strSQL += "FROM ORALTL2_ST.T_SINTER_MATERIAL_RATIO ";
            strSQL += "WHERE BEGIN_STORE_DATE BETWEEN TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-MM-dd hh24:mi:ss')  ";
            strSQL += "ORDER BY BEGIN_STORE_DATE DESC ";

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