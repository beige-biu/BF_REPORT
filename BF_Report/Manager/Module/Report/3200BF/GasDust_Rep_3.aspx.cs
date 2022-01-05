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
    public partial class GasDust_Rep_3 : System.Web.UI.Page
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
            strSQL = "SELECT GETTIME,HMQZG_PRESS,JMQZG_PRESS,HMQZG_TEMP,XT1_UP_TEMP,XT1_DOWN_TEMP,XT1_CHROMA, ";
            strSQL += "XT2_UP_TEMP,XT2_DOWN_TEMP,XT2_CHROMA,XT3_UP_TEMP,XT3_DOWN_TEMP,XT3_CHROMA, ";
            strSQL += "XT4_UP_TEMP,XT4_DOWN_TEMP,XT4_CHROMA,XT5_UP_TEMP,XT5_DOWN_TEMP,XT5_CHROMA, ";
            strSQL += "XT6_UP_TEMP,XT6_DOWN_TEMP,XT6_CHROMA,XT7_UP_TEMP,XT7_DOWN_TEMP,XT7_CHROMA, ";
            strSQL += "XT8_UP_TEMP,XT8_DOWN_TEMP,XT8_CHROMA,XT9_UP_TEMP,XT9_DOWN_TEMP,XT9_CHROMA, ";
            strSQL += "XT10_UP_TEMP,XT10_DOWN_TEMP,XT10_CHROMA,XT11_UP_TEMP,XT11_DOWN_TEMP,XT11_CHROMA, ";
            strSQL += "XT12_UP_TEMP,XT12_DOWN_TEMP,XT12_CHROMA,XT13_UP_TEMP,XT13_DOWN_TEMP,XT13_CHROMA, ";
            strSQL += "XT14_UP_TEMP,XT14_DOWN_TEMP,XT14_CHROMA,XT15_UP_TEMP,XT15_DOWN_TEMP,XT15_CHROMA, ";
            strSQL += "DHC_UP_TEMP,DHC_DOWN_TEMP,DHC_PRESS,JMQZG_CHROMA,ZQ_PRESS,N2_IN_PRESS ";
            strSQL += "FROM FL2_TB_REP_MQCC ";
            strSQL += "WHERE GETTIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by GETTIME asc";
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