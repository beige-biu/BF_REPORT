using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.XtraPrinting;
using DevExpress.Export;

namespace BF_Report.Manager.Module.Report._1280BF
{
    public partial class CoolTemp_Rep_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateStartTime.Date = DateTime.Now;
                cbbType.SelectedIndex = 0;
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
            if (cbbType.Value.ToString() == "1")//炉基、炉底、炉壳温度 TE1101-TE1110
            {
                #region
                gridBase1.Columns["gbc1"].Visible = true;
                gridBase1.Columns["gbc3"].Visible = true;
                gridBase1.Columns["bt10"].Visible = true;
                gridBase1.Columns["bt10"].Caption = "炉壳温度：8.9m";
                gridBase1.Columns["bt11"].Caption = "1103";
                gridBase1.Columns["bt12"].Caption = "1104";
                gridBase1.Columns["bt13"].Caption = "1105";
                gridBase1.Columns["bt14"].Caption = "1106";
                gridBase1.Columns["bt15"].Visible = false;
                gridBase1.Columns["bt16"].Visible = false;
                gridBase1.Columns["bt17"].Visible = false;
                gridBase1.Columns["bt18"].Visible = false;

                gridBase1.Columns["bt20"].Visible = true;
                gridBase1.Columns["bt20"].Caption = "炉壳温度：9.9m";
                gridBase1.Columns["bt21"].Caption = "1107";
                gridBase1.Columns["bt22"].Caption = "1108";
                gridBase1.Columns["bt23"].Caption = "1109";
                gridBase1.Columns["bt24"].Caption = "1110";
                gridBase1.Columns["bt25"].Visible = false;
                gridBase1.Columns["bt26"].Visible = false;
                gridBase1.Columns["bt27"].Visible = false;
                gridBase1.Columns["bt28"].Visible = false;

                gridBase1.Columns["bt30"].Visible = false;
                gridBase1.Columns["bt40"].Visible = false;

                strSQL = " select RECORD_TIME,BC,BB,TE1101,TE1102,TE1103 as DATA11,TE1104 as DATA12,TE1105 as DATA13,   ";
                strSQL += " TE1106 as DATA14,TE1107 as DATA21,TE1108 as DATA22,TE1109 as DATA23,TE1110 as DATA24 ";
                strSQL += "  from L2BF_DB.DAY_COOLTEMP   WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " order by RECORD_TIME asc";

                #endregion
            }
            else if (cbbType.Value.ToString() == "2")//炉缸温度 TE1201-TE1220
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc3"].Visible = false;
                gridBase1.Columns["bt40"].Visible = false;

                gridBase1.Columns["bt10"].Visible = true;
                gridBase1.Columns["bt10"].Caption = "1段标高：7.04m";
                gridBase1.Columns["bt11"].Caption = "1201";
                gridBase1.Columns["bt12"].Caption = "1202";
                gridBase1.Columns["bt13"].Caption = "1203";
                gridBase1.Columns["bt14"].Caption = "1204";
                gridBase1.Columns["bt15"].Visible = false;
                gridBase1.Columns["bt16"].Visible = false;
                gridBase1.Columns["bt17"].Visible = false;
                gridBase1.Columns["bt18"].Visible = false;

                gridBase1.Columns["bt20"].Visible = true;
                gridBase1.Columns["bt20"].Caption = "2段标高：8.795m";
                gridBase1.Columns["bt21"].Caption = "1205";
                gridBase1.Columns["bt22"].Caption = "1206";
                gridBase1.Columns["bt23"].Caption = "1207";
                gridBase1.Columns["bt24"].Caption = "1208"; 
                gridBase1.Columns["bt25"].Caption = "1209";
                gridBase1.Columns["bt26"].Caption = "1210";
                gridBase1.Columns["bt27"].Caption = "1211";
                gridBase1.Columns["bt28"].Caption = "1212";
                gridBase1.Columns["bt25"].Visible = true;
                gridBase1.Columns["bt26"].Visible = true;
                gridBase1.Columns["bt27"].Visible = true;
                gridBase1.Columns["bt28"].Visible = true;

                gridBase1.Columns["bt30"].Visible = true;
                gridBase1.Columns["bt30"].Caption = "3段标高：10.4m";
                gridBase1.Columns["bt31"].Caption = "1213";
                gridBase1.Columns["bt32"].Caption = "1214";
                gridBase1.Columns["bt33"].Caption = "1215";
                gridBase1.Columns["bt34"].Caption = "1216";
                gridBase1.Columns["bt35"].Caption = "1217";
                gridBase1.Columns["bt36"].Caption = "1218";
                gridBase1.Columns["bt37"].Caption = "1219";
                gridBase1.Columns["bt38"].Caption = "1220";
                gridBase1.Columns["bt35"].Visible = true;
                gridBase1.Columns["bt36"].Visible = true;
                gridBase1.Columns["bt37"].Visible = true;
                gridBase1.Columns["bt38"].Visible = true;

                strSQL = " select RECORD_TIME,BC,BB,TE1201 as DATA11,TE1202 as DATA12,TE1203 as DATA13,TE1204 as DATA14,   ";
                strSQL += " TE1205 as DATA21,TE1206 as DATA22,TE1207 as DATA23,TE1208 as DATA24,TE1209 as DATA25,TE1210 as DATA26,TE1211 as DATA27,TE1212 as DATA28, ";
                strSQL += " TE1213 as DATA31,TE1214 as DATA32，TE1215 as DATA33,TE1216 as DATA34，TE1217 as DATA35,TE1218 as DATA36，TE1219 as DATA37,TE1220 as DATA38  from L2BF_DB.DAY_COOLTEMP  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += "  order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "3")//炉腹、炉腰温度 TE1221-TE1236
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc3"].Visible = false;
                gridBase1.Columns["bt30"].Visible = false;
                gridBase1.Columns["bt40"].Visible = false;

                gridBase1.Columns["bt10"].Visible = true;
                gridBase1.Columns["bt10"].Caption = "6段标高：16.545m";
                gridBase1.Columns["bt11"].Caption = "1221";
                gridBase1.Columns["bt12"].Caption = "1222";
                gridBase1.Columns["bt13"].Caption = "1223";
                gridBase1.Columns["bt14"].Caption = "1224";
                gridBase1.Columns["bt15"].Caption = "1225";
                gridBase1.Columns["bt16"].Caption = "1226";
                gridBase1.Columns["bt17"].Caption = "1227";
                gridBase1.Columns["bt18"].Caption = "1228";
                gridBase1.Columns["bt15"].Visible = true;
                gridBase1.Columns["bt16"].Visible = true;
                gridBase1.Columns["bt17"].Visible = true;
                gridBase1.Columns["bt18"].Visible = true;

                gridBase1.Columns["bt20"].Visible = true;
                gridBase1.Columns["bt20"].Caption = "7段标高：13.8m";
                gridBase1.Columns["bt21"].Caption = "1229";
                gridBase1.Columns["bt22"].Caption = "1230";
                gridBase1.Columns["bt23"].Caption = "1231";
                gridBase1.Columns["bt24"].Caption = "1232";
                gridBase1.Columns["bt25"].Caption = "1233";
                gridBase1.Columns["bt26"].Caption = "1234";
                gridBase1.Columns["bt27"].Caption = "1235";
                gridBase1.Columns["bt28"].Caption = "1236";
                gridBase1.Columns["bt25"].Visible = true;
                gridBase1.Columns["bt26"].Visible = true;
                gridBase1.Columns["bt27"].Visible = true;
                gridBase1.Columns["bt28"].Visible = true;

                strSQL = " select RECORD_TIME,BC,BB,TE1221 as DATA11,TE1222 as DATA12,TE1223 as DATA13,TE1224 as DATA14,TE1225 as DATA15,TE1226 as DATA16,TE1227 as DATA17,TE1228 as DATA18,   ";
                strSQL += " TE1229 as DATA21,TE1230 as DATA22,TE1231 as DATA23,TE1232 as DATA24,TE1233 as DATA25,TE1234 as DATA26,TE1235 as DATA27,TE1236 as DATA28 ";
                strSQL += "  from L2BF_DB.DAY_COOLTEMP  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += "  order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "4")//炉身下部温度 TE1237-TE1252
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc3"].Visible = false;
                gridBase1.Columns["bt30"].Visible = false;
                gridBase1.Columns["bt40"].Visible = false;

                gridBase1.Columns["bt10"].Visible = true;
                gridBase1.Columns["bt10"].Caption = "8段标高：20.04m";
                gridBase1.Columns["bt11"].Caption = "1237";
                gridBase1.Columns["bt12"].Caption = "1238";
                gridBase1.Columns["bt13"].Caption = "1239";
                gridBase1.Columns["bt14"].Caption = "1240";
                gridBase1.Columns["bt15"].Caption = "1241";
                gridBase1.Columns["bt16"].Caption = "1242";
                gridBase1.Columns["bt17"].Caption = "1243";
                gridBase1.Columns["bt18"].Caption = "1244";
                gridBase1.Columns["bt15"].Visible = true;
                gridBase1.Columns["bt16"].Visible = true;
                gridBase1.Columns["bt17"].Visible = true;
                gridBase1.Columns["bt18"].Visible = true;

                gridBase1.Columns["bt20"].Visible = true;
                gridBase1.Columns["bt20"].Caption = "9段标高：21.92m";
                gridBase1.Columns["bt21"].Caption = "1245";
                gridBase1.Columns["bt22"].Caption = "1246";
                gridBase1.Columns["bt23"].Caption = "1247";
                gridBase1.Columns["bt24"].Caption = "1248";
                gridBase1.Columns["bt25"].Caption = "1249";
                gridBase1.Columns["bt26"].Caption = "1250";
                gridBase1.Columns["bt27"].Caption = "1251";
                gridBase1.Columns["bt28"].Caption = "1252";
                gridBase1.Columns["bt25"].Visible = true;
                gridBase1.Columns["bt26"].Visible = true;
                gridBase1.Columns["bt27"].Visible = true;
                gridBase1.Columns["bt28"].Visible = true;

                strSQL = " select RECORD_TIME,BC,BB,TE1237 as DATA11,TE1238 as DATA12,TE1239 as DATA13,TE1240 as DATA14,TE1241 as DATA15,TE1242 as DATA16,TE1243 as DATA17,TE1244 as DATA18,   ";
                strSQL += " TE1245 as DATA21,TE1246 as DATA22,TE1247 as DATA23,TE1248 as DATA24,TE1249 as DATA25,TE1250 as DATA26,TE1251 as DATA27,TE1252 as DATA28 ";
                strSQL += "  from L2BF_DB.DAY_COOLTEMP  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += "  order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "5")//冷却壁10、11段
            {
                #region               
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc3"].Visible = false;

                gridBase1.Columns["bt10"].Visible = true;
                gridBase1.Columns["bt10"].Caption = "10段标高：23.62m";
                gridBase1.Columns["bt11"].Caption = "1253";
                gridBase1.Columns["bt12"].Caption = "1254";
                gridBase1.Columns["bt13"].Caption = "1255";
                gridBase1.Columns["bt14"].Caption = "1256";
                gridBase1.Columns["bt15"].Caption = "1257";
                gridBase1.Columns["bt16"].Caption = "1258";
                gridBase1.Columns["bt17"].Caption = "1259";
                gridBase1.Columns["bt18"].Caption = "1260";
                gridBase1.Columns["bt15"].Visible = true;
                gridBase1.Columns["bt16"].Visible = true;
                gridBase1.Columns["bt17"].Visible = true;
                gridBase1.Columns["bt18"].Visible = true;

                gridBase1.Columns["bt20"].Visible = true;
                gridBase1.Columns["bt20"].Caption = "11段标高：25.125m";
                gridBase1.Columns["bt21"].Caption = "1261";
                gridBase1.Columns["bt22"].Caption = "1262";
                gridBase1.Columns["bt23"].Caption = "1263";
                gridBase1.Columns["bt24"].Caption = "1264";
                gridBase1.Columns["bt25"].Caption = "1265";
                gridBase1.Columns["bt26"].Caption = "1266";
                gridBase1.Columns["bt27"].Caption = "1267";
                gridBase1.Columns["bt28"].Caption = "1268";
                gridBase1.Columns["bt25"].Visible = true;
                gridBase1.Columns["bt26"].Visible = true;
                gridBase1.Columns["bt27"].Visible = true;
                gridBase1.Columns["bt28"].Visible = true;

                gridBase1.Columns["bt30"].Visible = true;
                gridBase1.Columns["bt30"].Caption = "12段标高：27.485m";
                gridBase1.Columns["bt31"].Caption = "1269";
                gridBase1.Columns["bt32"].Caption = "1270";
                gridBase1.Columns["bt33"].Caption = "1271";
                gridBase1.Columns["bt34"].Caption = "1272";
                gridBase1.Columns["bt31"].Visible = true;
                gridBase1.Columns["bt32"].Visible = true;
                gridBase1.Columns["bt33"].Visible = true;
                gridBase1.Columns["bt34"].Visible = true;
                gridBase1.Columns["bt35"].Visible = false;
                gridBase1.Columns["bt36"].Visible = false;
                gridBase1.Columns["bt37"].Visible = false;
                gridBase1.Columns["bt38"].Visible = false;

                gridBase1.Columns["bt40"].Visible = true;
                gridBase1.Columns["bt40"].Caption = "14段标高：30.495m";
                gridBase1.Columns["bt41"].Caption = "1273";
                gridBase1.Columns["bt42"].Caption = "1274";
                gridBase1.Columns["bt43"].Caption = "1275";
                gridBase1.Columns["bt44"].Caption = "1276";
                gridBase1.Columns["bt41"].Visible = true;
                gridBase1.Columns["bt42"].Visible = true;
                gridBase1.Columns["bt43"].Visible = true;
                gridBase1.Columns["bt44"].Visible = true;

                strSQL = " select RECORD_TIME,BC,BB,TE1253 as DATA11,TE1254 as DATA12,TE1255 as DATA13,TE1256 as DATA14,TE1257 as DATA15,TE1258 as DATA16,TE1259 as DATA17,TE1260 as DATA18,   ";
                strSQL += " TE1261 as DATA21,TE1262 as DATA22,TE1263 as DATA23,TE1264 as DATA24,TE1265 as DATA25,TE1266 as DATA26,TE1267 as DATA27,TE1268 as DATA28, ";
                strSQL += " TE1269 as DATA31,TE1270 as DATA32,TE1271 as DATA33,TE1272 as DATA34,TE1273 as DATA41,TE1274 as DATA42,TE1275 as DATA43,TE1276 as DATA44  ";
                strSQL += " from L2BF_DB.DAY_COOLTEMP  WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss')  ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += "  order by RECORD_TIME asc";
                #endregion
            }

            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 18)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible;
                gridBase1.Settings.VerticalScrollableHeight = 800;
            }
            else
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden;
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