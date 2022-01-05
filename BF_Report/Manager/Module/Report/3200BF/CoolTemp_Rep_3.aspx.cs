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
    public partial class CoolTemp_Rep_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
            }
            GetData();
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            GetData();
        }

        protected void GetData()
        {
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
            String strCon = cbbType.Value.ToString();
            string strSQL = "";
            strSQL = " select GETTIME,CASE when substr(to_char(gettime,'yyyy-MM-dd hh24:mi:ss'),11,3)>8 and substr(to_char(gettime,'yyyy-MM-dd hh24:mi:ss'),11,3)<=20 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            strSQL += " COOLING_LAYERNO,COOLING_P1,COOLING_P5,COOLING_P6,COOLING_P10,COOLING_P11,COOLING_P12,COOLING_P15, ";
            strSQL += " COOLING_P16,COOLING_P17,COOLING_P20,COOLING_P21,COOLING_P23,COOLING_P24,COOLING_P26,COOLING_P28,COOLING_P31, ";
            strSQL += " COOLING_P33,COOLING_P34,COOLING_P38,COOLING_P36,COOLING_P39,COOLING_P41,COOLING_P43,COOLING_P44 ";
            strSQL += " from FL2_TB_BF_COOLINGWALLTEMP  ";
            strSQL += " where GETTIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            if (strCon.Equals("1"))
                strSQL += " AND COOLING_LAYERNO = '1' ";
            else if (strCon.Equals("2"))
                strSQL += " AND COOLING_LAYERNO = '2' ";
            else if (strCon.Equals("3"))
                strSQL += " AND COOLING_LAYERNO = '3' ";
            else if (strCon.Equals("4"))
                strSQL += " AND COOLING_LAYERNO = '6' ";
            else if (strCon.Equals("5"))
                strSQL += " AND COOLING_LAYERNO = '7' ";
            else if (strCon.Equals("6"))
                strSQL += " AND COOLING_LAYERNO = '8' ";
            else if (strCon.Equals("7"))
                strSQL += " AND COOLING_LAYERNO = '9' ";
            else if (strCon.Equals("8"))
                strSQL += " AND COOLING_LAYERNO = '10' ";
            else if (strCon.Equals("9"))
                strSQL += " AND COOLING_LAYERNO = '11' ";
            else if (strCon.Equals("10"))
                strSQL += " AND COOLING_LAYERNO = '12' ";
            else if (strCon.Equals("11"))
                strSQL += " AND COOLING_LAYERNO = '13' ";
            else if (strCon.Equals("12"))
                strSQL += " AND COOLING_LAYERNO = '15' ";
            else if (strCon.Equals("13"))
                strSQL += " AND COOLING_LAYERNO = '16' ";
            strSQL += " order by GETTIME asc ";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            GetData();
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