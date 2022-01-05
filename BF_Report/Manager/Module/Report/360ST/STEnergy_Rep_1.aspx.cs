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
    public partial class STEnergy_Rep_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                //dateStartTime.Date = DateTime.Now.AddDays(-1);
                
            }
            GetData();
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            GetData();
        }

        protected void GetData()
        {
            //string strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyyMMdd") + "200500";
            string strEndTime = dateStartTime.Date.ToString("yyyyMMdd") + "200500";
            string strSQL = "";

            strSQL = "select GETTIME,SUM_RS_FLOW,TL_FS_FE3,FE_902_03,PL_FIQ_102ACC,ST_PL_YSKQ_ACCMU,ST_SHK_YSKQ_ACCMU, ";
            strSQL += "YSKQ_FT3,SJ_FIQ_305_ACCMU,SJ_FRQ_301_ACCMU,SJ_FRQ_381_ACCMU,SJ_MQZG_ACCMU,ZQLJ01,SJ_TRQ_ACCMU ";
            strSQL += "from XCIRON.SL2_TB_BAS_ENERGY_SJ ";
            strSQL += "where to_date(GETTIME,'yyyy-MM-dd hh24:mi:ss') BETWEEN TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-MM-dd hh24:mi:ss') ";
            strSQL += "order by gettime asc";

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