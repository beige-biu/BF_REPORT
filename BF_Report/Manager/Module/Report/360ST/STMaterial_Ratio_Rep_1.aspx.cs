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

namespace BF_Report.Manager.Module.Report._360ST
{
    public partial class STMaterial_Ratio_Rep_1 : System.Web.UI.Page
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
            //strSQL = "SELECT a.PBD_NO, a.MATERIAL_NAME, a.MATERIAL_CODE, a.MATERIAL_PERCENTAGE,b.USE_START_DATE AS BEGIN_STORE_DATE ";
            //strSQL += "FROM ORALTL2_ST.T_SINTER_MATERIAL_RATIO_360 a LEFT JOIN L2BF_COM.CY_RZ_YGH_PBD_IO b ON SUBSTR(a.PBD_NO,2,10) =SUBSTR(b.PBD_NO,2,10)  ";
            //strSQL += "WHERE TO_DATE(b.USE_START_DATE,'yyyy-MM-dd hh24:mi:ss') BETWEEN TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-MM-dd hh24:mi:ss')  ";
            //strSQL += "ORDER BY b.USE_START_DATE DESC ";

            strSQL = "SELECT distinct(a.INGREDIENT_NO),a.MATERIAL_NAME, a.MATERIAL_CODE,MATERIAL_RATE,b.USE_START_DATE AS BEGIN_STORE_DATE ";
            strSQL += " FROM T_XSL2_INGREDIENT_ITEM a LEFT JOIN XCIRON_MATERIAL.CY_RZ_YGH_PBD b ON SUBSTR(a.INGREDIENT_NO,2,10) =SUBSTR(b.PBD_NO,2,10)";
            strSQL += "WHERE TO_DATE(b.USE_START_DATE,'yyyy-MM-dd hh24:mi:ss') BETWEEN TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-MM-dd hh24:mi:ss')  ";
            strSQL += "ORDER BY b.USE_START_DATE,a.INGREDIENT_NO DESC ";


            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt400(strSQL, ref dt);
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