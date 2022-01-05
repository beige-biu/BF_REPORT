using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GemBox.Spreadsheet;
using System.IO;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._400ST
{
    public partial class CostConsumeST_Rep_NEW_3 : System.Web.UI.Page
    {
        public string strStartTime, strMonthStart, strMonthEnd;
        public int iDay;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cbbType.SelectedIndex = 0;
                dateStartTime.Date = DateTime.Now.AddDays(-1);

            }
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string strNowHeight = e.Parameter.ToString();
            if (strNowHeight != null)
                SQLComm.strHeight = strNowHeight;
            GetData(SQLComm.strHeight);
        }

        public string strIronDay = "0", strMonthIron = "0";

       

        protected void GetData(string strHeight)
        {
            gridBase1.Columns["gbc3"].Caption = "日期:" + dateStartTime.Date.ToString("yyyy-MM-dd");
            string date1 = dateStartTime.Date.ToString("yyyy-MM-dd");
            //要在这个地方判断
            switch (cbbType.SelectedIndex)
            {
                case 1:
                    gridBase1.Columns["gbc4"].Caption = "400烧结成本报表";
                    gridBase1.Columns["gbc5"].Caption = "R61-047/1-03";
                    break;
                default:
                    gridBase1.Columns["gbc4"].Caption = "360烧结成本报表";
                    gridBase1.Columns["gbc5"].Caption = "R61-047/1-03";
                    break;
            }
            //获取cbbType的值
            string cbbvalue = cbbType.Value.ToString();
            //根据时间和cbbType的值来查询本日产量和本月产量
            string brcl = "";
            string bycl = "";
            //查询本日产量和本月产量
            string brclSQL = "select day_cost_per,mon_cost_per from L2BF_COM.T_COSTM_MONTHLY_COST where COST_TITLE ='产量' ";
            brclSQL += "and PLANT_CODE = '" + cbbvalue;
            brclSQL += "'   and  US_DT= '" + date1 + "' ";
            DataTable dtcl = new DataTable();
            SQLComm.ExecuteSelectSql_dt(brclSQL, ref dtcl);
            //表不为空，表示当天有产量
            if (dtcl.Rows.Count > 0)
            {
                brcl = dtcl.Rows[0]["DAY_COST_PER"].ToString();
                bycl = dtcl.Rows[0]["MON_COST_PER"].ToString();
            }

            gridBase1.Columns["gbc1"].Caption = "本日产量(t):" + brcl;
            gridBase1.Columns["gbc2"].Caption = "本月产量(t):" + bycl;

            //根据时间和cbbtype的value值来查询
            string strSQL = "select * from L2BF_COM.T_COSTM_MONTHLY_COST where COST_TITLE <>'产量'and US_DT= '" + date1;
            strSQL += "' and PLANT_CODE='" + cbbvalue + "'";
            strSQL += " order by SORT_ID asc";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 150;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
        }



        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
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