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


namespace BF_Report.Manager.Module.Report._Quality
{
    public partial class QUALITY_QUARY_ST_Rep_Q : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now.AddDays(-1);
                dateEndTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
                cbbType1.SelectedIndex = 0;
                DateTime begin_time = Convert.ToDateTime(dateStartTime.Text.ToString() + " 20:00:01");
                DateTime endtime = Convert.ToDateTime(dateEndTime.Text.ToString() + " 20:00:00");
                select(begin_time, endtime, "");

            }
            
        }

        protected void cbp_Base_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            DateTime begin_time = Convert.ToDateTime(dateStartTime.Text.ToString() + " 20:00:01");
            DateTime endtime = Convert.ToDateTime(dateEndTime.Text.ToString() + " 20:00:00");
            select(begin_time, endtime, "");
        }

        public void select(DateTime Begin_time, DateTime End_time, string i)
        {
            OracleParameter[] temp = new OracleParameter[6];
            temp[0] = new OracleParameter("l_RetVal", OracleDbType.RefCursor);
            temp[0].Direction = ParameterDirection.ReturnValue;

            temp[1] = new OracleParameter(":MATERIAL_NAME", OracleDbType.Varchar2);
            temp[1].Value = cbbType.Value.ToString();
            temp[1].Direction = ParameterDirection.Input;


            temp[2] = new OracleParameter(":BEGIN_TIME", OracleDbType.Varchar2);
            temp[2].Value = Begin_time.ToString("yyyy-MM-dd HH:mm:ss");
            temp[2].Direction = ParameterDirection.Input;


            temp[3] = new OracleParameter(":END_TIME", OracleDbType.Varchar2);
            temp[3].Value = End_time.ToString("yyyy-MM-dd HH:mm:ss");
            temp[3].Direction = ParameterDirection.Input;

            temp[4] = new OracleParameter(":SAMPLE_NO", OracleDbType.Varchar2);
            temp[4].Value = sampleno.Text.ToUpper();
            temp[4].Direction = ParameterDirection.Input;

            temp[5] = new OracleParameter(":UNIT_NO", OracleDbType.Varchar2);
            temp[5].Value = cbbType1.Value.ToString();
            temp[5].Direction = ParameterDirection.Input;



            OracleConnection con = new OracleConnection("User Id = ORALTL2_ST; Password=oraltl2_400s;Data Source = (DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.8.16)(PORT = 1521)))(CONNECT_DATA = (SERVICE_NAME = ORALTL2)))");
            con.Open();
            OracleCommand or = con.CreateCommand();
            or.CommandType = CommandType.StoredProcedure;
            or.CommandText = "F_QUAITY_ANALYSE_REP";
            or.Parameters.Add(temp[0]);
            or.Parameters.Add(temp[1]);
            or.Parameters.Add(temp[2]);
            or.Parameters.Add(temp[3]);
            or.Parameters.Add(temp[4]);
            or.Parameters.Add(temp[5]);
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

            gridBase1.Columns["班次"].Visible = false;
            gridBase1.Columns["班别"].Visible = false;

            //DataTable dt_result = new DataTable();
            //if (cbbType.Text.ToString() == "铁水")
            //{

            //    foreach (DataColumn col in dataTable.Columns)
            //    {
            //        dt_result = dataTable.Clone();
            //        foreach (DataColumn col1 in dt_result.Columns)
            //        {
            //            for (int index = 0; index <= 28; index++)
            //            {
            //                if (col1.ColumnName == dataTable.Columns[index].ColumnName && index >= 6 && index < 19)
            //                {
            //                    col1.DataType = typeof(double);
            //                }

            //            }

            //        }


            //        foreach (DataRow row in dataTable.Rows)
            //        {
            //            DataRow rowNew = dt_result.NewRow();
            //            for (int index0 = 0; index0 <= 28; index0++)
            //            {
            //                rowNew[dataTable.Columns[index0].ColumnName] = row[dataTable.Columns[index0].ColumnName];
            //            }
            //            dt_result.Rows.Add(rowNew);

            //        }



            //    }
            //    gridBase1.DataSource = dt_result;

            //}





            //if (dataTable.Rows.Count > 0)
            //{
            //    //gridView1.Columns[2].Visible = false;
            //    gridBase1.Columns[0].DisplayFormat.FormatType = DevExpress.Utils.FormatType.DateTime;
            //    gridBase1.Columns[0].DisplayFormat.FormatString = "yyyy-MM-dd HH:mm:ss";
            //    gridBase1.BestFitColumns();
            //    gridBase1.RowHeight = 30;
            //    int index = 0;
            //    foreach (GridColumn col in gridView1.Columns)
            //    {
            //        gridBase1.Columns[index].Width = gridBase1.Columns[index].Width + 20;

            //        if (index >= 6 && index < 19)
            //        {
            //            string exp;
            //            string exp1;
            //            string temp1;
            //            string temp2;
            //            if (cbbType.Text.ToString() == "铁水")
            //            {
            //                exp = "avg([" + dt_result.Columns[index].ColumnName + "])";
            //                exp1 = "[" + dt_result.Columns[index].ColumnName + "]>0";
            //                temp1 = dt_result.Compute(exp, exp1).ToString();

            //            }
            //            else
            //            {
            //                exp = "avg([" + dataTable.Columns[index].ColumnName + "])";
            //                exp1 = "[" + dataTable.Columns[index].ColumnName + "]>0";
            //                temp1 = dataTable.Compute(exp, exp1).ToString();

            //            }

            //            if (temp1 == "")
            //            {
            //                temp2 = "0";
            //            }
            //            else
            //            {
            //                temp2 = Math.Round(Convert.ToDecimal(temp1), 3).ToString();
            //            }

            //            this.gridBase1.Columns[index].Summary.AddRange(new DevExpress.XtraGrid.GridSummaryItem[] {
            //            new DevExpress.XtraGrid.GridColumnSummaryItem(DevExpress.Data.SummaryItemType.Custom,gridView1.Columns[index].FieldName, "{0:#0.00}")});
            //            gridBase1.Columns[index].SummaryItem.SetSummary(DevExpress.Data.SummaryItemType.Custom, temp2);

            //        }
            //        index++;
            //    }

            //}

            //if (cbbType.Text.ToString() == "铁水" || cbbType.Text.ToString() == "炉渣")
            //{
            //    gridBase1.Columns["班次"].Visible = true;
            //    gridBase1.Columns["班别"].Visible = true;
            //}
            //else
            //{
            //    gridBase1.Columns["班次"].Visible = false;
            //    gridBase1.Columns["班别"].Visible = false;
            //}
        }

        protected void btnExp_Excel_Click(object sender, EventArgs e)
        {
            DateTime begin_time = Convert.ToDateTime(dateStartTime.Text.ToString() + " 20:00:01");
            DateTime endtime = Convert.ToDateTime(dateEndTime.Text.ToString() + " 20:00:00");
            select(begin_time, endtime, "");
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