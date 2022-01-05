﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.XtraPrinting;
using DevExpress.Export;


namespace BF_Report.Manager.Module.Report._3200BF
{
    public partial class Power_Rep_3 : System.Web.UI.Page
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
            string strStartTime = "";
            string strEndTime = "";
            strStartTime = dateStartTime.Date.ToString("yyyy-MM-dd");
            strEndTime = dateEndTime.Text.ToString();
            string strSQL = "";
            strSQL = " SELECT PROD_DATE,CASE PROD_SHIFT WHEN '0' THEN '白班' WHEN '1' THEN '夜班' ELSE NULL END AS PROD_SHIFT, ";
            strSQL += " BM_GLMQ,HS_GLMQ,BM_YQ,BM_DQ,BM_TRQ,HS_YSKQ,";
            strSQL += " HS_ZQ,HS_FL,WATER_RS,WATER_SCS,ELECTRIC*10000 AS ELECTRIC,BU_DQZG";
            strSQL += " FROM FL2_TB_REP_ENERGY";
            strSQL += " where to_date(PROD_DATE, 'yyyy-mm-dd') between to_date('" + strStartTime + "', 'yyyy-mm-dd') and to_date('" + strEndTime + "', 'yyyy-mm-dd') ";
            strSQL += " order by PROD_DATE,prod_shift desc";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt);
            
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 18)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 150;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
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
    }
}