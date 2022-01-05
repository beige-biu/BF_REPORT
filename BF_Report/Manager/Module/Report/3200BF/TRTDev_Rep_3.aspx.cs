using System;
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
    public partial class TRTDev_Rep_3 : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:03:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:03:00";
            string strSQL = "";
            strSQL = "SELECT GETTIME, ";
            strSQL += "CASE when substr(TO_CHAR(GETTIME,'yyyy-mm-dd hh24:mi:ss'),11,3)>=9 and substr(TO_CHAR(GETTIME,'yyyy-mm-dd hh24:mi:ss'),11,3)<21 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            strSQL += "TURBINE_ROTATE_SPEED,TURBINE_APER,TURBINE_AXIS_A,TURBINE_AXIS_B,TURBINE_AXIS_INAIRA,TURBINE_AXIS_INAIRB,TURBINE_AXIS_OUTAIRA, ";
            strSQL += "TURBINE_AXIS_OUTAIRB,TURBINE_AXISTEMP_INAIR,TURBINE_AXISTEMP_OUTAIR,TURBINE_AXIS_TEMPA,TURBINE_AXIS_TEMPB,POWER_OIL_PRESS, ";
            strSQL += "POWER_OIL_LEVEL,POWER_OIL_TEMP,LUBR_OIL_PRESS,LUBR_OIL_LEVEL,LUBR_OIL_TEMP,LUBR_OIL_TEMP_COOLER,LUBR_OIL_TEMP_MANA,COAL_GAS_FLOW, ";
            strSQL += "COAL_GAS_FURN_PRESS,COAL_GAS_AIR_IN,COAL_GAS_AIR_OUT,COAL_GAS_TEMP_IN,COAL_GAS_TEMP_OUT,COAL_GAS_TEMP_INWIND,COAL_GAS_TEMP_OUTWIND,COAL_GAS_AXIS_TEMP1, ";
            strSQL += "COAL_GAS_AXIS_TEMP2,DYNAMO_STATOR_TEMPA,DYNAMO_STATOR_TEMPB,DYNAMO_STATOR_TEMPC,DYNAMO_IRON_CETER_TEMPA,DYNAMO_IRON_CETER_TEMPB, ";
            strSQL += "DYNAMO_IRON_CETER_TEMPC,DYNAMO_STATOR_CURRENTA,DYNAMO_STATOR_CURRENTB,DYNAMO_STATOR_CURRENTC,DYNAMO_STATOR_VOLTA,DYNAMO_STATOR_VOLTB, ";
            strSQL += "DYNAMO_STATOR_VOLTC,DYNAMO_POWERA,DYNAMO_POWERB,LUCHJI_POWER,LUCHJI_CURRENT ";
            strSQL += "FROM FL2_TB_REP_TRT ";
            strSQL += "where GETTIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss')  ";
            strSQL += "order by GETTIME asc ";
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