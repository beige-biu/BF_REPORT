using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using FrameWork;
using DevExpress.Web;
using FrameWork.web;
using GemBox.ExcelLite;
using System.IO;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._400ST
{
    public partial class STMaterial_Consumption_Rep_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-7);
                dateEndTime.Date = DateTime.Now;
            }
            DateTime begin_time = Convert.ToDateTime(dateStartTime.Text.ToString() + " 20:00:01");
            DateTime endtime = Convert.ToDateTime(dateEndTime.Text.ToString() + " 20:00:00");
            select(begin_time, endtime, "");
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            DateTime begin_time = Convert.ToDateTime(dateStartTime.Text.ToString() + " 20:00:01");
            DateTime endtime = Convert.ToDateTime(dateEndTime.Text.ToString() + " 20:00:00");
            select(begin_time, endtime, "");
        }

        public void select(DateTime Begin_time, DateTime End_time, string i)
        {
            OracleParameter[] temp = new OracleParameter[3];
            temp[0] = new OracleParameter("l_RetVal", OracleDbType.RefCursor);
            temp[0].Direction = ParameterDirection.ReturnValue;



            temp[1] = new OracleParameter(":BEGIN_TIME", OracleDbType.Varchar2);
            temp[1].Value = Begin_time.ToString("yyyyMMddHHmmss");
            temp[1].Direction = ParameterDirection.Input;


            temp[2] = new OracleParameter(":END_TIME", OracleDbType.Varchar2);
            temp[2].Value = End_time.ToString("yyyyMMddHHmmss");
            temp[2].Direction = ParameterDirection.Input;


            

            OracleConnection con = new OracleConnection("User Id = oraltl2_st; Password=oraltl2_400s;Data Source = (DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.8.16)(PORT = 1521)))(CONNECT_DATA = (SERVICE_NAME = ORALTL2)))");
            con.Open();
            OracleCommand or = con.CreateCommand();
            or.CommandType = CommandType.StoredProcedure;
            or.CommandText = "F_MATERIAL_TEAM_XH";
            or.Parameters.Add(temp[0]);
            or.Parameters.Add(temp[1]);
            or.Parameters.Add(temp[2]);
            gridBase1.DataSource = null;
            gridBase1.Columns.Clear();
            DataTable dataTable = new DataTable();
            OracleDataAdapter oracleDataAdapter = new OracleDataAdapter(or);
            oracleDataAdapter.SelectCommand = or;
            oracleDataAdapter.Fill(dataTable);

            GridViewDataTextColumn gridViewDataTextColumn;

            //gridView1.OptionsBehavior.AutoPopulateColumns = false;
            int visibleIndex = 0;
            foreach (DataColumn col in dataTable.Columns)
            {
                gridViewDataTextColumn = new GridViewDataTextColumn();
                gridViewDataTextColumn.Name = gridViewDataTextColumn.Caption = gridViewDataTextColumn.FieldName = col.ColumnName;
                gridViewDataTextColumn.VisibleIndex = visibleIndex;
                gridViewDataTextColumn.Width = 150;
                gridBase1.Columns.Add(gridViewDataTextColumn);
                visibleIndex++;
            }
            gridBase1.DataSource = dataTable;
            gridBase1.DataBind();
            gridBase1.ExpandAll();

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