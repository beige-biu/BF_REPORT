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
using System.Linq;

namespace BF_Report.Manager.Module.Report.SHY
{
    public partial class zlfs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //getInstructNO();
        }

        private void getInstructNO()
        {
            string topname = ASPxComboBox1.Value.ToString();
            string sql0 = "SELECT TO_CHAR(SYSDATE,'YYMMDD')  FROM DUAL;";
            DataTable dt0 = new DataTable();
            SQLComm.ExecuteSelectSql_dt3200(sql0, ref dt0);
            string shijian = dt0.Rows[0][0].ToString();
            

            string station = topname + shijian;
            string sqlText = "select DICT_NO  FROM XCIRON.T_LIMEKM_PUFFSUPPLY where substr(DICT_NO,0,9)='" + station + "'";
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt3200(sqlText, ref dt);

            string currentSeq;
            if (dt.Rows.Count == 0)
            {
                currentSeq = "01";
            }
            else
            {
                List<int> allSeqNo = new List<int>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string seqTxt = dt.Rows[i][0].ToString().Substring(9, 2);
                    int seq = 0;
                    if (int.TryParse(seqTxt, out seq))
                    {
                        allSeqNo.Add(seq);
                    }
                }
                int maxSeq = allSeqNo.Max();
                if (maxSeq > 99)
                {
                    Response.Write("指令编号流水号超出范围!");
                }
                currentSeq = (maxSeq + 1).ToString("D2");
            }

            station += currentSeq;
            this.TextBox1.Text = station;
        }

        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            getInstructNO();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string a = TextBox1.Text.ToString();
        }
    }
}