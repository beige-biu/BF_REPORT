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
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._3200BF
{
    public partial class HSDay_Rep_3 : System.Web.UI.Page
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
            strSQL = " SELECT CODE_GETDATATIME, ";
            strSQL += "CASE when substr(to_char(CODE_GETDATATIME,'yyyy-MM-dd hh24:mi:ss'),11,3)>8 and substr(to_char(CODE_GETDATATIME,'yyyy-MM-dd hh24:mi:ss'),11,3)<=20 THEN '白班' else '夜班' END AS WORK_SHIFT, ";
            strSQL += " SENDNO,HS_ROOF_TEMP1_1,HS_ROOF_TEMP2_1,HS_BURNT_TEMP_1,HS_BURNT_PRESS_1,HS_BRANCH_TEMP_1,HS_REMO2_1,HS_SI_BRICK_TEMP_1,HS_BRICK_TEMP_1, ";
            strSQL += " HS_LUPI_TEMP1_1,HS_LUPI_TEMP2_1,HS_LUPI_TEMP3_1,HS_LUBIZI_TEMP_1,HS_GAS_BRANCH_FLOW_1,HS_AIR_BRANCH_FLOW_1,HS_INSIDE_PRESS_1,HS_INWATER_1,HS_OUTWATER_1, ";
            strSQL += " HS_ROOF_TEMP1_2,HS_ROOF_TEMP2_2,HS_BURNT_TEMP_2,HS_BURNT_PRESS_2,HS_BRANCH_TEMP_2,HS_REMO2_2,HS_SI_BRICK_TEMP_2,HS_BRICK_TEMP_2,HS_LUPI_TEMP1_2,HS_LUPI_TEMP2_2, ";
            strSQL += " HS_LUPI_TEMP3_2,HS_LUBIZI_TEMP_2,HS_GAS_BRANCH_FLOW_2,HS_AIR_BRANCH_FLOW_2,HS_INSIDE_PRESS_2,HS_INWATER_2,HS_OUTWATER_2,HS_ROOF_TEMP1_3,HS_ROOF_TEMP2_3,HS_BURNT_TEMP_3, ";
            strSQL += " HS_BURNT_PRESS_3,HS_BRANCH_TEMP_3,HS_REMO2_3,HS_SI_BRICK_TEMP_3,HS_BRICK_TEMP_3,HS_LUPI_TEMP1_3,HS_LUPI_TEMP2_3,HS_LUPI_TEMP3_3,HS_LUBIZI_TEMP_3,HS_GAS_BRANCH_FLOW_3, ";
            strSQL += " HS_AIR_BRANCH_FLOW_3,HS_INSIDE_PRESS_3,HS_INWATER_3,HS_OUTWATER_3,VALVA_TEMP_SF,VALVAOPEN_SF,COOLINGWATERINFLUX_SEND,COOLINGWATERINTEMP_SEND,COOLINGWATERINPRESS_SEND, ";
            strSQL += " OUT_WATER_TEMP_SEND,COLD_WIND_TEMP_SEND,COLD_WIND_FLOW_SEND,COLD_WIND_HUMIDITY_SEND,GASHOTVALUE_SEND,CAN_PRESS_SEND,N2_FLOW_SEND,N2_PRESS_SEND,AIR_FLOW_SEND, ";
            strSQL += " JYF1_PRESS_SEND,JYF2_PRESS_SEND,PRETEMP_GAS,AFTTEMP_GAS,PREPRESS_GAS,AFTPRESS_GAS,PRESSDIFF_GAS,PRETEMP_AIR,AFTTEMP_AIR,PREPRESS_AIR,AFTPRESS_AIR,PRESSDIFF_AIR ";
            strSQL += " FROM ORAL2DB_BF.V_FL2_TB_HEAT_INF1 ";
            strSQL += " WHERE CODE_GETDATATIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by CODE_GETDATATIME asc";

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