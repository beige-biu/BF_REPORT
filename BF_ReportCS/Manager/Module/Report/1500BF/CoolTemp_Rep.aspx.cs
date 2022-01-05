using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BF_ReportCS.Manager.Module.Report._1500BF
{
    public partial class CoolTemp_Rep : System.Web.UI.Page
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
            string strStartTime = dateStartTime.Date.AddDays(-1).ToString("yyyy-MM-dd") + " 20:00:01";
            string strEndTime = dateStartTime.Text.ToString() + " 20:00:00";
            string strSQL = "";
            if (cbbType.Value.ToString() == "1")//炉基、炉底、冷却壁1段
            {
                #region
                gridBase1.Columns["gbc1"].Visible = true;
                gridBase1.Columns["gbc2"].Visible = true;
                gridBase1.Columns["FIELD_0"].Visible = true;
                gridBase1.Columns["gbc1"].Caption = "炉基标高";
                gridBase1.Columns["gbc2"].Caption = "+4140";
                gridBase1.Columns["gbc3"].Caption = "炉底 - 找平层标高";
                gridBase1.Columns["gbc4"].Caption = "5152-1";
                gridBase1.Columns["gbc5"].Caption = "5152-2";
                gridBase1.Columns["gbc6"].Caption = "5152-3";
                gridBase1.Columns["gbc7"].Caption = "5152-4";
                gridBase1.Columns["gbc8"].Caption = "5152-5";
                gridBase1.Columns["gbc9"].Visible = false;
                gridBase1.Columns["FIELD_6"].Visible = false;
                gridBase1.Columns["gbc10"].Visible = false;
                gridBase1.Columns["FIELD_7"].Visible = false;
                gridBase1.Columns["gbc11"].Visible = false;
                gridBase1.Columns["FIELD_8"].Visible = false;
                gridBase1.Columns["gbc12"].Visible = false;
                gridBase1.Columns["FIELD_9"].Visible = false;

                gridBase1.Columns["gbc13"].Caption = "第1段冷却壁标高";
                gridBase1.Columns["gbc14"].Caption = "6105-1";
                gridBase1.Columns["gbc15"].Caption = "6105-2";
                gridBase1.Columns["gbc16"].Caption = "6105-3";
                gridBase1.Columns["gbc17"].Caption = "6105-4";
                gridBase1.Columns["gbc18"].Caption = "6105-5";
                gridBase1.Columns["gbc19"].Caption = "6105-6";
                gridBase1.Columns["gbc20"].Caption = "6105-7";
                gridBase1.Columns["gbc21"].Caption = "6105-8";
                gridBase1.Columns["gbc22"].Visible = false;
                gridBase1.Columns["FIELD_18"].Visible = false;
                gridBase1.Columns["gbc23"].Visible = false;
                gridBase1.Columns["FIELD_19"].Visible = false;
                gridBase1.Columns["gbc24"].Visible = false;
                gridBase1.Columns["FIELD_20"].Visible = false;
                gridBase1.Columns["gbc25"].Visible = false;
                gridBase1.Columns["FIELD_21"].Visible = false;


                strSQL = " select RECORD_TIME,WORK_SHIFT,WORK_TEAM,TE1101 as FIELD_0,TE1102 as FIELD_1,TE1103 as FIELD_2,TE1104 as FIELD_3,TE1105 as FIELD_4,   ";
                strSQL += " TE1106 as FIELD_5,TE1201 as FIELD_10,TE1202 as FIELD_11,TE1203 as FIELD_12,TE1204 as FIELD_13,TE1205 as FIELD_14,TE1206 as FIELD_15,";
                strSQL += " TE1207 as FIELD_16,TE1208 as FIELD_17 from T_RPT_COOLING1_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "2")//冷却壁2、3段
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc2"].Visible = false;
                gridBase1.Columns["FIELD_0"].Visible = false;
                gridBase1.Columns["gbc3"].Caption = "第2段冷却壁标高";
                gridBase1.Columns["gbc4"].Caption = "7685-1";
                gridBase1.Columns["gbc5"].Caption = "7685-2";
                gridBase1.Columns["gbc6"].Caption = "7685-3";
                gridBase1.Columns["gbc7"].Caption = "7685-4";
                gridBase1.Columns["gbc8"].Caption = "7685-5";
                gridBase1.Columns["gbc9"].Caption = "7685-6";
                gridBase1.Columns["gbc10"].Caption = "7685-7";
                gridBase1.Columns["gbc11"].Caption = "7685-8";
                gridBase1.Columns["gbc9"].Visible = true;
                gridBase1.Columns["FIELD_6"].Visible = true;
                gridBase1.Columns["gbc10"].Visible = true;
                gridBase1.Columns["FIELD_7"].Visible = true;
                gridBase1.Columns["gbc11"].Visible = true;
                gridBase1.Columns["FIELD_8"].Visible = true;
                gridBase1.Columns["gbc12"].Visible = false;
                gridBase1.Columns["FIELD_9"].Visible = false;

                gridBase1.Columns["gbc13"].Caption = "第3段冷却壁标高";
                gridBase1.Columns["gbc14"].Caption = "9465-1";
                gridBase1.Columns["gbc15"].Caption = "9465-2";
                gridBase1.Columns["gbc16"].Caption = "9465-3";
                gridBase1.Columns["gbc17"].Caption = "9465-4";
                gridBase1.Columns["gbc18"].Caption = "9465-5";
                gridBase1.Columns["gbc19"].Caption = "9465-6";
                gridBase1.Columns["gbc20"].Caption = "9465-7";
                gridBase1.Columns["gbc21"].Caption = "9465-8";
                gridBase1.Columns["gbc22"].Visible = false;
                gridBase1.Columns["FIELD_18"].Visible = false;
                gridBase1.Columns["gbc23"].Visible = false;
                gridBase1.Columns["FIELD_19"].Visible = false;
                gridBase1.Columns["gbc24"].Visible = false;
                gridBase1.Columns["FIELD_20"].Visible = false;
                gridBase1.Columns["gbc25"].Visible = false;
                gridBase1.Columns["FIELD_21"].Visible = false;


                strSQL = " select RECORD_TIME,WORK_SHIFT,WORK_TEAM,TE1209 as FIELD_1,TE1210 as FIELD_2,TE1211 as FIELD_3,TE1212 as FIELD_4,   ";
                strSQL += " TE1213 as FIELD_5,TE1214 as FIELD_6,TE1215 as FIELD_7,TE1216 as FIELD_8,TE1217 as FIELD_10,TE1218 as FIELD_11,TE1219 as FIELD_12,TE1220 as FIELD_13,TE1221 as FIELD_14,TE1222 as FIELD_15,";
                strSQL += " TE1223 as FIELD_16,TE1224 as FIELD_17 from T_RPT_COOLING1_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "3")//冷却壁6、7段
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc2"].Visible = false;
                gridBase1.Columns["FIELD_0"].Visible = false;
                gridBase1.Columns["gbc3"].Caption = "第6段冷却壁标高";
                gridBase1.Columns["gbc4"].Caption = "16681-1";
                gridBase1.Columns["gbc5"].Caption = "16681-2";
                gridBase1.Columns["gbc6"].Caption = "16681-3";
                gridBase1.Columns["gbc7"].Caption = "16681-4";
                gridBase1.Columns["gbc8"].Caption = "16681-5";
                gridBase1.Columns["gbc9"].Caption = "16681-6";
                gridBase1.Columns["gbc10"].Caption = "16681-7";
                gridBase1.Columns["gbc11"].Caption = "16681-8";
                gridBase1.Columns["gbc12"].Caption = "16681-9";
                gridBase1.Columns["gbc9"].Visible = true;
                gridBase1.Columns["FIELD_6"].Visible = true;
                gridBase1.Columns["gbc10"].Visible = true;
                gridBase1.Columns["FIELD_7"].Visible = true;
                gridBase1.Columns["gbc11"].Visible = true;
                gridBase1.Columns["FIELD_8"].Visible = true;
                gridBase1.Columns["gbc12"].Visible = true;
                gridBase1.Columns["FIELD_9"].Visible = true;

                gridBase1.Columns["gbc13"].Caption = "第7段冷却壁标高";
                gridBase1.Columns["gbc14"].Caption = "18698-1";
                gridBase1.Columns["gbc15"].Caption = "18698-2";
                gridBase1.Columns["gbc16"].Caption = "18698-3";
                gridBase1.Columns["gbc17"].Caption = "18698-4";
                gridBase1.Columns["gbc18"].Caption = "18698-5";
                gridBase1.Columns["gbc19"].Caption = "18698-6";
                gridBase1.Columns["gbc20"].Caption = "18698-7";
                gridBase1.Columns["gbc21"].Caption = "18698-8";
                gridBase1.Columns["gbc22"].Caption = "18698-9";
                gridBase1.Columns["gbc22"].Visible = true;
                gridBase1.Columns["FIELD_18"].Visible = true;
                gridBase1.Columns["gbc23"].Visible = false;
                gridBase1.Columns["FIELD_19"].Visible = false;
                gridBase1.Columns["gbc24"].Visible = false;
                gridBase1.Columns["FIELD_20"].Visible = false;
                gridBase1.Columns["gbc25"].Visible = false;
                gridBase1.Columns["FIELD_21"].Visible = false;


                strSQL = " select RECORD_TIME,WORK_SHIFT,WORK_TEAM,TE1225 as FIELD_1,TE1226 as FIELD_2,TE1227 as FIELD_3,TE1228 as FIELD_4,   ";
                strSQL += " TE1229 as FIELD_5,TE1230 as FIELD_6,TE1231 as FIELD_7,TE1232 as FIELD_8,TE1233 as FIELD_9,TE1234 as FIELD_10,TE1235 as FIELD_11,TE1236 as FIELD_12,TE1237 as FIELD_13,TE1238 as FIELD_14,TE1239 as FIELD_15,";
                strSQL += " TE1240 as FIELD_16,TE1241 as FIELD_17,TE1242 as FIELD_18 from T_RPT_COOLING1_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "4")//冷却壁8、9段
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc2"].Visible = false;
                gridBase1.Columns["FIELD_0"].Visible = false;
                gridBase1.Columns["gbc3"].Caption = "第8段冷却壁标高";
                gridBase1.Columns["gbc4"].Caption = "20823-1";
                gridBase1.Columns["gbc5"].Caption = "20823-2";
                gridBase1.Columns["gbc6"].Caption = "20823-3";
                gridBase1.Columns["gbc7"].Caption = "20823-4";
                gridBase1.Columns["gbc8"].Caption = "20823-5";
                gridBase1.Columns["gbc9"].Caption = "20823-6";
                gridBase1.Columns["gbc10"].Caption = "20823-7";
                gridBase1.Columns["gbc11"].Caption = "20823-8";
                gridBase1.Columns["gbc12"].Caption = "20823-9";
                gridBase1.Columns["gbc9"].Visible = true;
                gridBase1.Columns["FIELD_6"].Visible = true;
                gridBase1.Columns["gbc10"].Visible = true;
                gridBase1.Columns["FIELD_7"].Visible = true;
                gridBase1.Columns["gbc11"].Visible = true;
                gridBase1.Columns["FIELD_8"].Visible = true;
                gridBase1.Columns["gbc12"].Visible = true;
                gridBase1.Columns["FIELD_9"].Visible = true;

                gridBase1.Columns["gbc13"].Caption = "第9段冷却壁标高";
                gridBase1.Columns["gbc14"].Caption = "22880-1";
                gridBase1.Columns["gbc15"].Caption = "22880-2";
                gridBase1.Columns["gbc16"].Caption = "22880-3";
                gridBase1.Columns["gbc17"].Caption = "22880-4";
                gridBase1.Columns["gbc18"].Caption = "22880-5";
                gridBase1.Columns["gbc19"].Caption = "22880-6";
                gridBase1.Columns["gbc20"].Caption = "22880-7";
                gridBase1.Columns["gbc21"].Caption = "22880-8";
                gridBase1.Columns["gbc22"].Caption = "22880-9";
                gridBase1.Columns["gbc22"].Visible = true;
                gridBase1.Columns["FIELD_18"].Visible = true;
                gridBase1.Columns["gbc23"].Visible = false;
                gridBase1.Columns["FIELD_19"].Visible = false;
                gridBase1.Columns["gbc24"].Visible = false;
                gridBase1.Columns["FIELD_20"].Visible = false;
                gridBase1.Columns["gbc25"].Visible = false;
                gridBase1.Columns["FIELD_21"].Visible = false;


                strSQL = " select RECORD_TIME,WORK_SHIFT,WORK_TEAM,TE1243 as FIELD_1,TE1244 as FIELD_2,TE1245 as FIELD_3,TE1246 as FIELD_4,   ";
                strSQL += " TE1247 as FIELD_5,TE1248 as FIELD_6,TE1249 as FIELD_7,TE1250 as FIELD_8,TE1251 as FIELD_9,TE1252 as FIELD_10,TE1253 as FIELD_11,TE1254 as FIELD_12,TE1255 as FIELD_13,TE1256 as FIELD_14,TE1257 as FIELD_15,";
                strSQL += " TE1258 as FIELD_16,TE1259 as FIELD_17,TE1260 as FIELD_18 from T_RPT_COOLING1_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "5")//冷却壁10、11段
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc2"].Visible = false;
                gridBase1.Columns["FIELD_0"].Visible = false;
                gridBase1.Columns["gbc3"].Caption = "第10段冷却壁标高";
                gridBase1.Columns["gbc4"].Caption = "24780-1";
                gridBase1.Columns["gbc5"].Caption = "24780-2";
                gridBase1.Columns["gbc6"].Caption = "24780-3";
                gridBase1.Columns["gbc7"].Caption = "24780-4";
                gridBase1.Columns["gbc8"].Caption = "24780-5";
                gridBase1.Columns["gbc9"].Caption = "24780-6";
                gridBase1.Columns["gbc10"].Caption = "24780-7";
                gridBase1.Columns["gbc11"].Caption = "24780-8";
                gridBase1.Columns["gbc12"].Caption = "24780-9";
                gridBase1.Columns["gbc9"].Visible = true;
                gridBase1.Columns["FIELD_6"].Visible = true;
                gridBase1.Columns["gbc10"].Visible = true;
                gridBase1.Columns["FIELD_7"].Visible = true;
                gridBase1.Columns["gbc11"].Visible = true;
                gridBase1.Columns["FIELD_8"].Visible = true;
                gridBase1.Columns["gbc12"].Visible = true;
                gridBase1.Columns["FIELD_9"].Visible = true;

                gridBase1.Columns["gbc13"].Caption = "第11段冷却壁标高";
                gridBase1.Columns["gbc14"].Caption = "26680-1";
                gridBase1.Columns["gbc15"].Caption = "26680-2";
                gridBase1.Columns["gbc16"].Caption = "26680-3";
                gridBase1.Columns["gbc17"].Caption = "26680-4";
                gridBase1.Columns["gbc18"].Caption = "26680-5";
                gridBase1.Columns["gbc19"].Caption = "26680-6";
                gridBase1.Columns["gbc20"].Caption = "26680-7";
                gridBase1.Columns["gbc21"].Caption = "26680-8";
                gridBase1.Columns["gbc22"].Caption = "26680-9";
                gridBase1.Columns["gbc22"].Visible = true;
                gridBase1.Columns["FIELD_18"].Visible = true;
                gridBase1.Columns["gbc23"].Visible = false;
                gridBase1.Columns["FIELD_19"].Visible = false;
                gridBase1.Columns["gbc24"].Visible = false;
                gridBase1.Columns["FIELD_20"].Visible = false;
                gridBase1.Columns["gbc25"].Visible = false;
                gridBase1.Columns["FIELD_21"].Visible = false;

                strSQL = " select RECORD_TIME,WORK_SHIFT,WORK_TEAM,TE1261 as FIELD_1,TE1262 as FIELD_2,TE1263 as FIELD_3,TE1264 as FIELD_4,   ";
                strSQL += " TE1265 as FIELD_5,TE1266 as FIELD_6,TE1267 as FIELD_7,TE1268 as FIELD_8,TE1269 as FIELD_9,TE1270 as FIELD_10,TE1271 as FIELD_11,TE1272 as FIELD_12,TE1273 as FIELD_13,TE1274 as FIELD_14,TE1275 as FIELD_15,";
                strSQL += " TE1276 as FIELD_16,TE1277 as FIELD_17,TE1278 as FIELD_18 from T_RPT_COOLING2_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "6")//冷却壁12、13段
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc2"].Visible = false;
                gridBase1.Columns["FIELD_0"].Visible = false;
                gridBase1.Columns["gbc3"].Caption = "第12段冷却壁标高";
                gridBase1.Columns["gbc4"].Caption = "29215-1";
                gridBase1.Columns["gbc5"].Caption = "29215-2";
                gridBase1.Columns["gbc6"].Caption = "29215-3";
                gridBase1.Columns["gbc7"].Caption = "29215-4";
                gridBase1.Columns["gbc8"].Caption = "29215-5";
                gridBase1.Columns["gbc9"].Caption = "29215-6";
                gridBase1.Columns["gbc10"].Caption = "29215-7";
                gridBase1.Columns["gbc11"].Caption = "29215-8";
                gridBase1.Columns["gbc12"].Caption = "29215-9";
                gridBase1.Columns["gbc9"].Visible = true;
                gridBase1.Columns["FIELD_6"].Visible = true;
                gridBase1.Columns["gbc10"].Visible = true;
                gridBase1.Columns["FIELD_7"].Visible = true;
                gridBase1.Columns["gbc11"].Visible = true;
                gridBase1.Columns["FIELD_8"].Visible = true;
                gridBase1.Columns["gbc12"].Visible = true;
                gridBase1.Columns["FIELD_9"].Visible = true;

                gridBase1.Columns["gbc13"].Caption = "第13段冷却壁标高";
                gridBase1.Columns["gbc14"].Caption = "30480-1";
                gridBase1.Columns["gbc15"].Caption = "30480-2";
                gridBase1.Columns["gbc16"].Caption = "30480-3";
                gridBase1.Columns["gbc17"].Caption = "30480-4";
                gridBase1.Columns["gbc18"].Caption = "30480-5";
                gridBase1.Columns["gbc19"].Caption = "30480-6";
                gridBase1.Columns["gbc20"].Caption = "30480-7";
                gridBase1.Columns["gbc21"].Caption = "30480-8";
                gridBase1.Columns["gbc22"].Caption = "30480-9";
                gridBase1.Columns["gbc22"].Visible = true;
                gridBase1.Columns["FIELD_18"].Visible = true;
                gridBase1.Columns["gbc23"].Visible = false;
                gridBase1.Columns["FIELD_19"].Visible = false;
                gridBase1.Columns["gbc24"].Visible = false;
                gridBase1.Columns["FIELD_20"].Visible = false;
                gridBase1.Columns["gbc25"].Visible = false;
                gridBase1.Columns["FIELD_21"].Visible = false;


                strSQL = " select RECORD_TIME,WORK_SHIFT,WORK_TEAM,TE1279 as FIELD_1,TE1280 as FIELD_2,TE1281 as FIELD_3,TE1282 as FIELD_4,   ";
                strSQL += " TE1283 as FIELD_5,TE1284 as FIELD_6,TE1285 as FIELD_7,TE1286 as FIELD_8,TE1287 as FIELD_9,TE1288 as FIELD_10,TE1289 as FIELD_11,TE1290 as FIELD_12,TE1291 as FIELD_13,TE1292 as FIELD_14,TE1293 as FIELD_15,";
                strSQL += " TE1294 as FIELD_16,TE1295 as FIELD_17,TE1296 as FIELD_18 from T_RPT_COOLING2_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                #endregion
            }
            else if (cbbType.Value.ToString() == "7")//冷却壁14段、炉壳
            {
                #region
                gridBase1.Columns["gbc1"].Visible = false;
                gridBase1.Columns["gbc2"].Visible = false;
                gridBase1.Columns["FIELD_0"].Visible = false;
                gridBase1.Columns["gbc3"].Caption = "第14段冷却壁标高";
                gridBase1.Columns["gbc4"].Caption = "32380-1";
                gridBase1.Columns["gbc5"].Caption = "32380-2";
                gridBase1.Columns["gbc6"].Caption = "32380-3";
                gridBase1.Columns["gbc7"].Caption = "32380-4";
                gridBase1.Columns["gbc8"].Caption = "32380-5";
                gridBase1.Columns["gbc9"].Caption = "32380-6";
                gridBase1.Columns["gbc10"].Caption = "32380-7";
                gridBase1.Columns["gbc11"].Caption = "32380-8";
                gridBase1.Columns["gbc12"].Caption = "32380-9";
                gridBase1.Columns["gbc9"].Visible = true;
                gridBase1.Columns["FIELD_6"].Visible = true;
                gridBase1.Columns["gbc10"].Visible = true;
                gridBase1.Columns["FIELD_7"].Visible = true;
                gridBase1.Columns["gbc11"].Visible = false;
                gridBase1.Columns["FIELD_8"].Visible = true;
                gridBase1.Columns["gbc12"].Visible = true;
                gridBase1.Columns["FIELD_9"].Visible = true;

                gridBase1.Columns["gbc13"].Caption = "炉壳温度 标高";
                gridBase1.Columns["gbc14"].Caption = "8250-1";
                gridBase1.Columns["gbc15"].Caption = "8250-2";
                gridBase1.Columns["gbc16"].Caption = "8250-3";
                gridBase1.Columns["gbc17"].Caption = "8250-4";
                gridBase1.Columns["gbc18"].Caption = "8250-5";
                gridBase1.Columns["gbc19"].Caption = "8250-6";
                gridBase1.Columns["gbc20"].Caption = "8250-7";
                gridBase1.Columns["gbc21"].Caption = "8250-8";
                gridBase1.Columns["gbc22"].Caption = "9305-1";
                gridBase1.Columns["gbc23"].Caption = "9305-2";
                gridBase1.Columns["gbc24"].Caption = "9305-3";
                gridBase1.Columns["gbc25"].Caption = "9305-4";
                gridBase1.Columns["gbc22"].Visible = true;
                gridBase1.Columns["FIELD_18"].Visible = true;
                gridBase1.Columns["gbc23"].Visible = true;
                gridBase1.Columns["FIELD_19"].Visible = true;
                gridBase1.Columns["gbc24"].Visible = true;
                gridBase1.Columns["FIELD_20"].Visible = true;
                gridBase1.Columns["gbc25"].Visible = true;
                gridBase1.Columns["FIELD_21"].Visible = true;


                strSQL = " select RECORD_TIME,WORK_SHIFT,WORK_TEAM,TE1297 as FIELD_1,TE1298 as FIELD_2,TE1299 as FIELD_3,TE1300 as FIELD_4,   ";
                strSQL += " TE1301 as FIELD_5,TE1302 as FIELD_6,TE1303 as FIELD_7,TE1304 as FIELD_8,TE1305 as FIELD_9,TE1311 as FIELD_10,TE1312 as FIELD_11,TE1313 as FIELD_12,TE1314 as FIELD_13,TE1315 as FIELD_14,TE1316 as FIELD_15,";
                strSQL += " TE1317 as FIELD_16,TE1318 as FIELD_17,TE1319 as FIELD_18,TE1320 as FIELD_19,TE1321 as FIELD_20,TE1322 as FIELD_21 from T_RPT_COOLING2_TE WHERE RECORD_TIME BETWEEN TO_DATE('" + strStartTime + "','yyyy-mm-dd hh24:mi:ss') ";
                strSQL += " AND TO_DATE('" + strEndTime + "','yyyy-mm-dd hh24:mi:ss') order by RECORD_TIME asc";
                #endregion
            }
            DataTable dt = new DataTable();
            SQLComm.ExecuteSelectSql_dt(strSQL, ref dt);
            gridBase1.DataSource = dt;
            gridBase1.DataBind();
            gridBase1.ExpandAll();
            if (dt.Rows.Count > 12)
            {
                gridBase1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Auto;
                gridBase1.Settings.VerticalScrollableHeight = int.Parse(strHeight) - 220;
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