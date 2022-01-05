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
    public partial class STMaterial_Consumption_Rep_1 : System.Web.UI.Page
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
            
            string strStartTime = dateStartTime.Date.ToString("yyyyMMdd")+"200000";//20211222200000
            string strEndTime = dateEndTime.Date.ToString("yyyyMMdd") + "200000";//20211223200000
            string strSQL = "";
            strSQL = "SELECT CLASS_START_TIME,CLASS_STOP_TIME,CLASS,HY,HY_CM,RL,RL_CM,HC,  ";
            strSQL += "HC_CM,BYS,BYS_CM,SH,SH_CM,LF,LF_CM,LF_JIN,LF_JIN_CM,GL,GL_CM,  ";
            strSQL += "GL_JIN,GL_JIN_CM,MQ,MQ_CM,DL,DL_CM,CL,GLFJ,WSH,WSH_CM,SH_10A,SH_10B, ";
            strSQL += "SH_11,SH_12,PL_P4,PL_P4_CM,PL_P1,PL_P1_CM ";
            strSQL += "FROM SL2_TB_X_MATERIAL_CONSUME_1 t ";
            //strSQL += " WHERE CLASS_STOP_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-MM-dd hh24:mi:ss') ";
            strSQL += " WHERE CLASS_STOP_TIME  > TO_DATE('" + strStartTime + "','yyyy-MM-dd hh24:mi:ss') AND CLASS_STOP_TIME <= TO_DATE('" + strEndTime + "','yyyy-MM-dd hh24:mi:ss') ";
            strSQL += "ORDER BY CLASS_STOP_TIME DESC ";
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