using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._1500BF
{
    public partial class HSChange_Rep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
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
            string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
            DataTable dt = SQLComm.CreateHSdt();
            string strSQL = "";
            strSQL = "  select RECORD_TIME,WORK_SHIFT,WORK_TEAM,STATUS,HS_NAME,STATUSDESC,HS_END_TIME from T_HS_CHANGE where ";
            strSQL += " RECORD_TIME BETWEEN TO_DATE('"+ strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') AND TO_DATE('"+ strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
            strSQL += " and hs_name like '1#%'  order by RECORD_TIME asc";
            DataTable dt1 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                dt.Rows[i]["WORK_SHIFT"] = dt1.Rows[i]["WORK_SHIFT"].ToString();
                dt.Rows[i]["WORK_TEAM"] = dt1.Rows[i]["WORK_TEAM"].ToString();
                dt.Rows[i]["FIELD_0"] = dt1.Rows[i]["STATUS"].ToString();
                dt.Rows[i]["FIELD_1"] = dt1.Rows[i]["STATUSDESC"].ToString();
                dt.Rows[i]["FIELD_2"] = dt1.Rows[i]["RECORD_TIME"].ToString();
                dt.Rows[i]["FIELD_3"] = dt1.Rows[i]["HS_END_TIME"].ToString();                
            }
            DataTable dtTemp = new DataTable();
            if (dt1.Rows.Count < 1)
            {
                strSQL = "  select * from (select RECORD_TIME,WORK_SHIFT,WORK_TEAM,STATUS,HS_NAME,STATUSDESC,HS_END_TIME from T_HS_CHANGE where ";
                strSQL += "  hs_name like '1#%') order by RECORD_TIME desc where rownum = 1";
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dtTemp);
                for (int i = 0; i < dtTemp.Rows.Count; i++)
                {
                    dt.Rows[i]["WORK_SHIFT"] = dtTemp.Rows[i]["WORK_SHIFT"].ToString();
                    dt.Rows[i]["WORK_TEAM"] = dtTemp.Rows[i]["WORK_TEAM"].ToString();
                    dt.Rows[i]["FIELD_0"] = dtTemp.Rows[i]["STATUS"].ToString();
                    dt.Rows[i]["FIELD_1"] = dtTemp.Rows[i]["STATUSDESC"].ToString();
                    dt.Rows[i]["FIELD_2"] = dtTemp.Rows[i]["RECORD_TIME"].ToString();
                    dt.Rows[i]["FIELD_3"] = dtTemp.Rows[i]["HS_END_TIME"].ToString();
                }
            }

            strSQL = "  select RECORD_TIME,WORK_SHIFT,WORK_TEAM,STATUS,HS_NAME,STATUSDESC,HS_END_TIME from T_HS_CHANGE where ";
            strSQL += " RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
            strSQL += " and hs_name like '2#%' order by RECORD_TIME asc";
            dt1 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                if (dt.Rows[i]["WORK_SHIFT"].ToString() == "-")
                {
                    dt.Rows[i]["WORK_SHIFT"] = dt1.Rows[i]["WORK_SHIFT"].ToString();
                    dt.Rows[i]["WORK_TEAM"] = dt1.Rows[i]["WORK_TEAM"].ToString();
                }
                dt.Rows[i]["FIELD_4"] = dt1.Rows[i]["STATUS"].ToString();
                dt.Rows[i]["FIELD_5"] = dt1.Rows[i]["STATUSDESC"].ToString();
                dt.Rows[i]["FIELD_6"] = dt1.Rows[i]["RECORD_TIME"].ToString();
                dt.Rows[i]["FIELD_7"] = dt1.Rows[i]["HS_END_TIME"].ToString();
            }
            dtTemp = new DataTable();
            if (dt1.Rows.Count < 1)
            {

                strSQL = "  select * from (select RECORD_TIME,WORK_SHIFT,WORK_TEAM,STATUS,HS_NAME,STATUSDESC,HS_END_TIME from T_HS_CHANGE where ";
                strSQL += "  hs_name like '2#%') order by RECORD_TIME desc where rownum = 1";
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dtTemp);
                for (int i = 0; i < dtTemp.Rows.Count; i++)
                {
                    if (dt.Rows[i]["WORK_SHIFT"].ToString() == "-")
                    {
                        dt.Rows[i]["WORK_SHIFT"] = dtTemp.Rows[i]["WORK_SHIFT"].ToString();
                        dt.Rows[i]["WORK_TEAM"] = dtTemp.Rows[i]["WORK_TEAM"].ToString();
                    }
                    dt.Rows[i]["FIELD_4"] = dtTemp.Rows[i]["STATUS"].ToString();
                    dt.Rows[i]["FIELD_5"] = dtTemp.Rows[i]["STATUSDESC"].ToString();
                    dt.Rows[i]["FIELD_6"] = dtTemp.Rows[i]["RECORD_TIME"].ToString();
                    dt.Rows[i]["FIELD_7"] = dtTemp.Rows[i]["HS_END_TIME"].ToString();
                }
            }


            strSQL = "  select RECORD_TIME,WORK_SHIFT,WORK_TEAM,STATUS,HS_NAME,STATUSDESC,HS_END_TIME from T_HS_CHANGE where ";
            strSQL += " RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
            strSQL += " and hs_name like '3#%' order by RECORD_TIME asc";
            dt1 = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt1);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                if (dt.Rows[i]["WORK_SHIFT"].ToString() == "-")
                {
                    dt.Rows[i]["WORK_SHIFT"] = dt1.Rows[i]["WORK_SHIFT"].ToString();
                    dt.Rows[i]["WORK_TEAM"] = dt1.Rows[i]["WORK_TEAM"].ToString();
                }
                dt.Rows[i]["FIELD_8"] = dt1.Rows[i]["STATUS"].ToString();
                dt.Rows[i]["FIELD_9"] = dt1.Rows[i]["STATUSDESC"].ToString();
                dt.Rows[i]["FIELD_10"] = dt1.Rows[i]["RECORD_TIME"].ToString();
                dt.Rows[i]["FIELD_11"] = dt1.Rows[i]["HS_END_TIME"].ToString();
            }
            dtTemp = new DataTable();
            if (dt1.Rows.Count < 1)
            {

                strSQL = "  select * from (select RECORD_TIME,WORK_SHIFT,WORK_TEAM,STATUS,HS_NAME,STATUSDESC,HS_END_TIME from T_HS_CHANGE where ";
                strSQL += "  hs_name like '3#%') order by RECORD_TIME desc where rownum = 1";
                SQLComm.ExecuteSelectSql_dt(strSQL, ref dtTemp);
                for (int i = 0; i < dtTemp.Rows.Count; i++)
                {
                    if (dt.Rows[i]["WORK_SHIFT"].ToString() == "-")
                    {
                        dt.Rows[i]["WORK_SHIFT"] = dtTemp.Rows[i]["WORK_SHIFT"].ToString();
                        dt.Rows[i]["WORK_TEAM"] = dtTemp.Rows[i]["WORK_TEAM"].ToString();
                    }
                    dt.Rows[i]["FIELD_8"] = dtTemp.Rows[i]["STATUS"].ToString();
                    dt.Rows[i]["FIELD_9"] = dtTemp.Rows[i]["STATUSDESC"].ToString();
                    dt.Rows[i]["FIELD_10"] = dtTemp.Rows[i]["RECORD_TIME"].ToString();
                    dt.Rows[i]["FIELD_11"] = dtTemp.Rows[i]["HS_END_TIME"].ToString();
                }
            }

            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                if (dt.Rows[i]["WORK_SHIFT"].ToString() == "-")
                    dt.Rows[i].Delete();
            }
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();

            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 155;
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