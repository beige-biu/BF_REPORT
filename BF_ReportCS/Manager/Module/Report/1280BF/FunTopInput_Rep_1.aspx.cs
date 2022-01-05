using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_ReportCS.Manager.Module.Report._1280BF
{
    public partial class FunTopInput_Rep_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
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
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:00";
            string strSQL = "";
            if (cbbType.SelectedIndex == 0)
            {
                strSQL = "select * from L2BF_DB.day_dumppractice  where TO_CHAR(RECORD_TIME, 'YYYY-MM-DD HH24:MI') BETWEEN '" + strStartTime + "'AND '" + strEndTime + "' ";
                strSQL += "order by RECORD_TIME asc";
            }
            else
            {
                gridBase1.Columns["ORE_NAME"].Visible = false;
                gridBase1.Columns["DUMP_WEIGHT"].Visible = false;
                gridBase1.Columns["RING_B_INI"].Visible = false;
                gridBase1.Columns["RING_B_TOTAL"].Visible = false;
                gridBase1.Columns["RING_R"].Visible = false;
                gridBase1.Columns["DUMP_FLAG"].Visible = false;
                gridBase1.Columns["9"].Caption = "料线";
                gridBase1.Columns["SD1_DOWN_LINE"].Caption = "矿石";
                gridBase1.Columns["SD2_DOWN_LINE"].Caption = "焦炭";

                strSQL = "select a.RECORD_TIME,a.BC,a.BB,";
                strSQL += "b.CHARGE_NO,a.SETTING_SOUND_ORE AS SD1_DOWN_LINE,a.SETTING_SOUND_COKE AS SD2_DOWN_LINE,";
                strSQL += "a.SETTING_A1 AS SET_A1,a.SETTING_A1_RING AS A1_RINGS,a.SETTING_A1_W AS A1_WEIGHT,";
                strSQL += "a.SETTING_A2 AS SET_A2,a.SETTING_A2_RING AS A2_RINGS,a.SETTING_A2_W AS A2_WEIGHT,";
                strSQL += "a.SETTING_A3 AS SET_A3,a.SETTING_A3_RING AS A3_RINGS,a.SETTING_A3_W AS A3_WEIGHT,";
                strSQL += "a.SETTING_A4 AS SET_A4,a.SETTING_A4_RING AS A4_RINGS,a.SETTING_A4_W AS A4_WEIGHT,";
                strSQL += "a.SETTING_A5 AS SET_A5,a.SETTING_A5_RING AS A5_RINGS,a.SETTING_A5_W AS A5_WEIGHT,";
                strSQL += "a.SETTING_A6 AS SET_A6,a.SETTING_A6_RING AS A6_RINGS,a.SETTING_A6_W AS A6_WEIGHT,";
                strSQL += "a.SETTING_A7 AS SET_A7,a.SETTING_A7_RING AS A7_RINGS,a.SETTING_A7_W AS A7_WEIGHT,";
                strSQL += "a.SETTING_A8 AS SET_A8,a.SETTING_A8_RING AS A8_RINGS,a.SETTING_A8_W AS A8_WEIGHT,";
                strSQL += "a.SETTING_A9 AS SET_A9,a.SETTING_A9_RING AS A9_RINGS,a.SETTING_A9_W AS A9_WEIGHT,";
                strSQL += "a.SETTING_A10 AS SET_A10,a.SETTING_A10_RING AS A10_RINGS,a.SETTING_A10_W AS A10_WEIGHT,";
                strSQL += "a.SETTING_A11 AS SET_A11,a.SETTING_A11_RING AS A11_RINGS,a.SETTING_A11_W AS A11_WEIGHT ";
                strSQL += "from L2BF_DB.day_dumpsetting  a left join L2BF_DB.day_dumppractice  b on a.record_time=b.record_time ";
                strSQL += "where a.RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " order by RECORD_TIME asc";
            }
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();

            if (dt.Rows.Count > 12 )
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 195;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            GetData(SQLComm.strHeight);
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