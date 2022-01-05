using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_Report.Manager.Module.Report._3200BF
{
    public partial class WaterSystem_Rep_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;                
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
            string strSQL = "";

            strSQL = " SELECT TO_DATE(TO_CHAR(gettime, 'YYYY-MM-DD HH24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss') AS GETTIME, ";
            strSQL += "CASE when substr(to_char(gettime,'yyyy-MM-dd hh24:mi:ss'),11,3)>8 and substr(to_char(gettime,'yyyy-MM-dd hh24:mi:ss'),11,3)<=20 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            strSQL += " WATER_TYPE_KLPL,WATER_FLUX1_KLPL,WATER_PRESS_KLPL,WATER_FLUX1AVG_KLPL,WATER_PRESSAVG_KLPL,WATER_TYPE_PLB,WATER_FLUX1_PLB,WATER_PRESS_PLB,WATER_FLUX1AVG_PLB,WATER_PRESSAVG_PLB, ";
            strSQL += " WATER_TYPE_RSTS,WATER_FLUX1_RSTS,WATER_PRESS_RSTS,WATER_TEMP_RSTS,WATER_FLUX1AVG_RSTS,WATER_PRESSAVG_RSTS,WATER_TEMPAVG_RSTS,WATER_TYPE_GJGY,WATER_FLUX1_GJGY,WATER_FLUX2_GJGY, ";
            strSQL += " WATER_PRESS_GJGY,WATER_TEMP_GJGY,WATER_FLUX1AVG_GJGY,WATER_FLUX2AVG_GJGY,WATER_PRESSAVG_GJGY,WATER_TEMPAVG_GJGY,WATER_TYPE_GJDY,WATER_PRESS_GJDY,WATER_TEMP_GJDY, ";
            strSQL += " WATER_FLUX1AVG_GJDY,WATER_FLUX2AVG_GJDY,WATER_PRESSAVG_GJDY,WATER_TEMPAVG_GJDY,WATER_TYPE_JJBS,WATER_FLUX1_JJBS,WATER_PRESS_JJBS,WATER_TEMP_JJBS,WATER_FLUX1AVG_JJBS, ";
            strSQL += " WATER_PRESSAVG_JJBS,WATER_TEMPAVG_JJBS,WATER_TYPE_GRBH,WATER_PRESS_GRBH,WATER_TEMP_GRBH,WATER_PRESSAVG_GRBH,WATER_TEMPAVG_GRBH,WATER_TYPE_GRGS,WATER_PRESS_GRGS, ";
            strSQL += " WATER_TEMP_GRGS,WATER_PRESSAVG_GRGS,WATER_TEMPAVG_GRGS,WATER_PLC,WATER_PLCS,WATER_JHS,WATER_JHSC,WATER_RSZG ";
            strSQL += " FROM ORAL2DB_BF.V_FL2_TB_WATER1 ";
            strSQL += " WHERE TO_DATE(TO_CHAR(gettime, 'YYYY-MM-DD HH24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss') BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by GETTIME asc";

            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt3200(strSQL, ref dt);
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