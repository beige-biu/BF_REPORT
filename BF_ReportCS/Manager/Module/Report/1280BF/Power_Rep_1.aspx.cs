using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_ReportCS.Manager.Module.Report._1280BF
{
    public partial class Power_Rep_1 : System.Web.UI.Page
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
            string strStartTime = "";
            string strEndTime = "";
            strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            strEndTime = dateEndTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            //假数据
            //if (Convert.ToDateTime(strEndTime) <= Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = " SELECT RECORD_TIME,BC,BB,GL_GAS_OUT ,OXY_AMOUNT,N2_AMOUNT ,NATURAL_GAS_AMOUNT,GL_GAS_USED,AIR_AMOUNT,STEAM_AMOUNT,BLAST_AMOUNT,SOFT_WATER_AMOUNT,INDUSTRY_WATER_AMOUNT,TRT_AMOUNT,N2_PIPE_AMOUNT,YD_AMOUNT,FXDN_OUT FROM l2bf_db.DAY_ENERGY_FALII  where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss')";
            //    strSQL += " order by RECORD_TIME asc";
            //}
            //else if (Convert.ToDateTime(strStartTime) >= Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = "SELECT RECORD_TIME,BC,BB,GL_GAS_OUT ,OXY_AMOUNT,N2_AMOUNT ,NATURAL_GAS_AMOUNT,GL_GAS_USED,AIR_AMOUNT,STEAM_AMOUNT,BLAST_AMOUNT,SOFT_WATER_AMOUNT,INDUSTRY_WATER_AMOUNT,TRT_AMOUNT,N2_PIPE_AMOUNT,YD_AMOUNT,FXDN_OUT FROM l2bf_db.DAY_ENERGY  where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            //    strSQL += " order by RECORD_TIME asc";
            //}
            //else if (Convert.ToDateTime(strStartTime) < Convert.ToDateTime("2020-11-11 20:00:00") & Convert.ToDateTime(strEndTime) > Convert.ToDateTime("2020-11-11 20:00:00"))
            //{
            //    strSQL = "select * from ( ";
            //    strSQL += "SELECT RECORD_TIME,BC,BB,GL_GAS_OUT ,OXY_AMOUNT,N2_AMOUNT ,NATURAL_GAS_AMOUNT,GL_GAS_USED,AIR_AMOUNT,STEAM_AMOUNT,BLAST_AMOUNT,SOFT_WATER_AMOUNT,INDUSTRY_WATER_AMOUNT,TRT_AMOUNT,N2_PIPE_AMOUNT,YD_AMOUNT,FXDN_OUT FROM l2bf_db.DAY_ENERGY_FALII  where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('2020-11-11 20:00:00', 'yyyy-mm-dd hh24:mi:ss') ";
            //    strSQL += " union ";
            //    strSQL += "SELECT RECORD_TIME,BC,BB,GL_GAS_OUT ,OXY_AMOUNT,N2_AMOUNT ,NATURAL_GAS_AMOUNT,GL_GAS_USED,AIR_AMOUNT,STEAM_AMOUNT,BLAST_AMOUNT,SOFT_WATER_AMOUNT,INDUSTRY_WATER_AMOUNT,TRT_AMOUNT,N2_PIPE_AMOUNT,YD_AMOUNT,FXDN_OUT FROM l2bf_db.DAY_ENERGY  where RECORD_TIME between to_date('2020-11-11 20:00:01', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            //    strSQL += " )order by RECORD_TIME asc";
            //}
            //原始代码
            strSQL = " SELECT RECORD_TIME,BC,BB,(GL_GAS_OUT*10000) as GL_GAS_OUT ,OXY_AMOUNT,N2_AMOUNT ,(NATURAL_GAS_AMOUNT*10000) as NATURAL_GAS_AMOUNT,(GL_GAS_USED*10000)GL_GAS_USED,AIR_AMOUNT,STEAM_AMOUNT,(BLAST_AMOUNT*10000) as BLAST_AMOUNT,SOFT_WATER_AMOUNT,INDUSTRY_WATER_AMOUNT,TRT_AMOUNT,(N2_PIPE_AMOUNT*10000) as N2_PIPE_AMOUNT,(YD_AMOUNT*10000) as YD_AMOUNT,FXDN_OUT FROM l2bf_db.DAY_ENERGY  where RECORD_TIME between to_date('" + strStartTime + "', 'yyyy-mm-dd hh24:mi:ss') and to_date('" + strEndTime + "', 'yyyy-mm-dd hh24:mi:ss') ";
            strSQL += " order by RECORD_TIME asc";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            
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