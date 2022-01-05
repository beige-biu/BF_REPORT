using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.OracleClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace BF_Report
{
    public static class SQLComm
    {
        public static string strHeight;
        public static DataTable Prodt1 = new DataTable();
        public static DataTable Prodt2 = new DataTable();
        public static DataTable Prodt3 = new DataTable();
        #region 初始化高炉日报记录集1
        public static DataTable CreatePord1(int iCount)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("field0", typeof(string));
            dt.Columns.Add("field1", typeof(string));
            dt.Columns.Add("field2", typeof(string));
            dt.Columns.Add("field3", typeof(string));
            dt.Columns.Add("field4", typeof(string));
            dt.Columns.Add("field5", typeof(string));
            dt.Columns.Add("field6", typeof(string));
            dt.Columns.Add("field7", typeof(string));
            dt.Columns.Add("field8", typeof(string));
            dt.Columns.Add("field9", typeof(string));
            dt.Columns.Add("field10", typeof(string));
            dt.Columns.Add("field11", typeof(string));
            dt.Columns.Add("field12", typeof(string));
            dt.Columns.Add("field13", typeof(string));
            dt.Columns.Add("field14", typeof(string));
            dt.Columns.Add("field15", typeof(string));
            dt.Columns.Add("field16", typeof(string));
            dt.Columns.Add("field17", typeof(string));
            dt.Columns.Add("field18", typeof(string));
            dt.Columns.Add("field19", typeof(string));
            dt.Columns.Add("field20", typeof(string));
            dt.Columns.Add("field21", typeof(string));
            dt.Columns.Add("field22", typeof(string));
            dt.Columns.Add("field23", typeof(string));
            dt.Columns.Add("field24", typeof(string));
            dt.Columns.Add("field25", typeof(string));
            dt.Columns.Add("field26", typeof(string));
            dt.Columns.Add("field27", typeof(string));
            dt.Columns.Add("field28", typeof(string));
            dt.Columns.Add("field29", typeof(string));
            dt.Columns.Add("field30", typeof(string));
            dt.Columns.Add("field31", typeof(string));
            dt.Columns.Add("field32", typeof(string));
            dt.Columns.Add("field33", typeof(string));
            dt.Columns.Add("field34", typeof(string));
            dt.Columns.Add("field35", typeof(string));
            dt.Columns.Add("field36", typeof(string));
            dt.Columns.Add("field37", typeof(string));
            dt.Columns.Add("OXY_AMOUNT", typeof(string));
            dt.Columns.Add("R_LG_ACTIVE", typeof(string));
            for (int i = 0; i < iCount; i++)
            {
                DataRow dr = dt.NewRow();
                dr["field0"] = "";
                dr["field1"] = "";
                dr["field2"] = "";
                dr["field3"] = "";
                dr["field4"] = "";
                dr["field5"] = "";
                dr["field6"] = "";
                dr["field7"] = "";
                dr["field8"] = "";
                dr["field9"] = "";
                dr["field10"] = "";
                dr["field11"] = "";
                dr["field12"] = "";
                dr["field13"] = "";
                dr["field14"] = "";
                dr["field15"] = "";
                dr["field16"] = "";
                dr["field17"] = "";
                dr["field18"] = "";
                dr["field19"] = "";
                dr["field20"] = "";
                dr["field21"] = "";
                dr["field22"] = "";
                dr["field23"] = "";
                dr["field24"] = "";
                dr["field25"] = "";
                dr["field26"] = "";
                dr["field27"] = "";
                dr["field28"] = "";
                dr["field29"] = "";
                dr["field30"] = "";
                dr["field31"] = "";
                dr["field32"] = "";
                dr["field33"] = "";
                dr["field34"] = "";
                dr["field35"] = "";
                dr["field36"] = "";
                dr["field37"] = "";
                dr["OXY_AMOUNT"] = "";
                dr["R_LG_ACTIVE"] = "";
                dt.Rows.Add(dr);
            }
            return dt;
        }
        #endregion
        #region 初始化高炉日报记录集2
        public static DataTable CreatePord2(int iCount)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("field0", typeof(string));
            dt.Columns.Add("field1", typeof(string));
            dt.Columns.Add("field2", typeof(string));
            dt.Columns.Add("field3", typeof(string));
            dt.Columns.Add("field4", typeof(string));
            dt.Columns.Add("field5", typeof(string));
            dt.Columns.Add("field6", typeof(string));
            dt.Columns.Add("field7", typeof(string));
            dt.Columns.Add("field8", typeof(string));
            dt.Columns.Add("field9", typeof(string));
            dt.Columns.Add("field10", typeof(string));
            dt.Columns.Add("field11", typeof(string));
            dt.Columns.Add("field12", typeof(string));
            dt.Columns.Add("field13", typeof(string));
            dt.Columns.Add("field14", typeof(string));
            dt.Columns.Add("field15", typeof(string));
            dt.Columns.Add("field16", typeof(string));
            dt.Columns.Add("field17", typeof(string));
            dt.Columns.Add("field18", typeof(string));
            dt.Columns.Add("field19", typeof(string));
            dt.Columns.Add("field20", typeof(string));
            dt.Columns.Add("field21", typeof(string));
            for (int i = 0; i < iCount; i++)
            {
                DataRow dr = dt.NewRow();
                dr["field0"] = "";
                dr["field1"] = "";
                dr["field2"] = "";
                dr["field3"] = "";
                dr["field4"] = "";
                dr["field5"] = "";
                dr["field6"] = "";
                dr["field7"] = "";
                dr["field8"] = "";
                dr["field9"] = "";
                dr["field10"] = "";
                dr["field11"] = "";
                dr["field12"] = "";
                dr["field13"] = "";
                dr["field14"] = "";
                dr["field15"] = "";
                dr["field16"] = "";
                dr["field17"] = "";
                dr["field18"] = "";
                dr["field19"] = "";
                dr["field20"] = "";
                dr["field21"] = "";
                dt.Rows.Add(dr);
            }
            return dt;
        }
        #endregion
        #region 初始化高炉日报记录集3
        public static DataTable CreatePord3(int iCount)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("field0", typeof(string));
            dt.Columns.Add("field1", typeof(string));
            dt.Columns.Add("field2", typeof(string));
            dt.Columns.Add("field3", typeof(string));
            for (int i = 0; i < iCount; i++)
            {
                DataRow dr = dt.NewRow();
                dr["field0"] = "";
                dr["field1"] = "";
                dr["field2"] = "";
                dr["field3"] = "";
                dt.Rows.Add(dr);
            }
            return dt;
        }
        #endregion
        #region 初始化3#高炉白夜班记事记录集
        public static DataTable CreateBFnotePord(int iCount)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("field0", typeof(string));
            dt.Columns.Add("field1", typeof(string));
            for (int i = 0; i < iCount; i++)
            {
                DataRow dr = dt.NewRow();
                dr["field0"] = "";
                dr["field1"] = "";
                dt.Rows.Add(dr);
            }
            return dt;
        }
        #endregion
        #region 初始化铁水去向日报记录集
        public static DataTable IronTodt1 = new DataTable();
        public static DataTable CreateIronTodt1()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("field0", typeof(string));
            dt.Columns.Add("field1", typeof(string));
            dt.Columns.Add("field2", typeof(string));
            dt.Columns.Add("field3", typeof(string));
            dt.Columns.Add("field4", typeof(string));
            dt.Columns.Add("field5", typeof(string));
            dt.Columns.Add("field6", typeof(string));
            dt.Columns.Add("field7", typeof(string));
            dt.Columns.Add("field8", typeof(string));
            dt.Columns.Add("field9", typeof(string));
            dt.Columns.Add("field10", typeof(string));
            dt.Columns.Add("field11", typeof(string));
            dt.Columns.Add("field12", typeof(string));
            dt.Columns.Add("field13", typeof(string));
            dt.Columns.Add("field14", typeof(string));
            dt.Columns.Add("field15", typeof(string));
            dt.Columns.Add("field16", typeof(string));
            for (int i = 0; i < 20; i++)
            {
                DataRow dr = dt.NewRow();
                dr["field3"] = "-";
                dt.Rows.Add(dr);
            }
            return dt;
        }
        #endregion
        #region 初始化热风炉交换作业日报记录集
        public static DataTable CreateHSdt()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("WORK_SHIFT", typeof(string));
            dt.Columns.Add("WORK_TEAM", typeof(string));
            dt.Columns.Add("FIELD_0", typeof(string));
            dt.Columns.Add("FIELD_1", typeof(string));
            dt.Columns.Add("FIELD_2", typeof(string));
            dt.Columns.Add("FIELD_3", typeof(string));
            dt.Columns.Add("FIELD_4", typeof(string));
            dt.Columns.Add("FIELD_5", typeof(string));
            dt.Columns.Add("FIELD_6", typeof(string));
            dt.Columns.Add("FIELD_7", typeof(string));
            dt.Columns.Add("FIELD_8", typeof(string));
            dt.Columns.Add("FIELD_9", typeof(string));
            dt.Columns.Add("FIELD_10", typeof(string));
            dt.Columns.Add("FIELD_11", typeof(string));
            for (int i = 0; i < 200; i++)
            {
                DataRow dr = dt.NewRow();
                dr["WORK_SHIFT"] = "-";
                dt.Rows.Add(dr);
            }
            return dt;
        }
        #endregion
        #region 初始化铁水月报记录集        
        public static DataTable CreateIronMonthdt()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("field0", typeof(string));
            dt.Columns.Add("field1", typeof(string));
            dt.Columns.Add("field2", typeof(string));
            dt.Columns.Add("field3", typeof(string));
            dt.Columns.Add("field4", typeof(string));
            dt.Columns.Add("field5", typeof(string));
            dt.Columns.Add("field6", typeof(string));

            DataRow dr = dt.NewRow();
            dr["field0"] = "总产量";
            dr["field6"] = "1";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["field0"] = "L03/L04";
            dr["field6"] = "2";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["field0"] = "L06";
            dr["field6"] = "3";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["field0"] = "L10";
            dr["field6"] = "4";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["field0"] = "非炼钢铁";
            dr["field6"] = "5";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["field0"] = "结算铁量";
            dr["field6"] = "6";
            dt.Rows.Add(dr);

            return dt;
        }
        #endregion
        /// <summary>
        /// 根据SQL查询语句获取记录集
        /// </summary>
        /// <param name="strSql">查询用SQL语句</param>
        /// <param name="dt">返回记录集</param>
        public static void ExecuteSelectSql_dt(string strSql, ref DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle"].ToString();
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter(strSql, conn);
            try
            {
                conn.Open();
                dt = new DataTable();
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
        public static void ExecuteSelectSql_dt3200(string strSql, ref DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle3200"].ToString();
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter(strSql, conn);
            try
            {
                conn.Open();
                dt = new DataTable();
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
        public static void ExecuteSelectSql_dt400(string strSql, ref DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle400"].ToString();
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter(strSql, conn);
            try
            {
                conn.Open();
                dt = new DataTable();
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }

        public static void ExecuteSelectSql_ds(string strSql, ref DataSet ds)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle"].ToString();
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter(strSql, conn);
            try
            {
                conn.Open();
                ds = new DataSet();
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }

        public static void ExecuteSelectSql_ds3200(string strSql, ref DataSet ds)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle3200"].ToString();
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter(strSql, conn);
            try
            {
                conn.Open();
                ds = new DataSet();
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
        public static void ExecuteSelectSql_ds400(string strSql, ref DataSet ds)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle400"].ToString();
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter(strSql, conn);
            try
            {
                conn.Open();
                ds = new DataSet();
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="SQLString">SQL语句</param>
        /// <returns>影响的记录数</returns>
        public static int ExecuteSql(string SQLString)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleCommand cmd = new OracleCommand(SQLString, conn);
            try
            {
                conn.Open();
                iRet = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }

        public static int ExecuteSql3200(string SQLString)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle3200"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleCommand cmd = new OracleCommand(SQLString, conn);
            try
            {
                conn.Open();
                iRet = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }
        public static int ExecuteSql400(string SQLString)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle400"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleCommand cmd = new OracleCommand(SQLString, conn);
            try
            {
                conn.Open();
                iRet = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }
        /// <summary>
        /// 新增数据库表中对应的dt记录表的数据
        /// </summary>
        /// <param name="strSQL"></param>
        /// <param name="strconn">数据库连接字符串</param>
        /// <param name="dt">将要插入的记录</param>
        /// <returns>返回影响的行数</returns>
        public static int InsertData(string strSQL, DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter();
            try
            {
                foreach (DataRow row in dt.Rows)
                    row.SetAdded();
                conn.Open();
                OracleCommandBuilder cmdBuilder = new OracleCommandBuilder(da);
                da.SelectCommand = new OracleCommand(strSQL, conn);
                da.InsertCommand = cmdBuilder.GetInsertCommand();
                iRet = da.Update(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }

        public static int InsertData3200(string strSQL, DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle3200"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter();
            try
            {
                foreach (DataRow row in dt.Rows)
                    row.SetAdded();
                conn.Open();
                OracleCommandBuilder cmdBuilder = new OracleCommandBuilder(da);
                da.SelectCommand = new OracleCommand(strSQL, conn);
                da.InsertCommand = cmdBuilder.GetInsertCommand();
                iRet = da.Update(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }
        public static int InsertData400(string strSQL, DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle400"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter();
            try
            {
                foreach (DataRow row in dt.Rows)
                    row.SetAdded();
                conn.Open();
                OracleCommandBuilder cmdBuilder = new OracleCommandBuilder(da);
                da.SelectCommand = new OracleCommand(strSQL, conn);
                da.InsertCommand = cmdBuilder.GetInsertCommand();
                iRet = da.Update(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }
        // 更新数据库表中对应的dt记录表的数据
        public static int UpdateData(string strSQL, DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter();
            try
            {
                conn.Open();
                OracleCommandBuilder cmdBuilder = new OracleCommandBuilder(da);
                da.SelectCommand = new OracleCommand(strSQL, conn);
                da.UpdateCommand = cmdBuilder.GetUpdateCommand();
                iRet = da.Update(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }

        public static int UpdateData3200(string strSQL, DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle3200"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter();
            try
            {
                conn.Open();
                OracleCommandBuilder cmdBuilder = new OracleCommandBuilder(da);
                da.SelectCommand = new OracleCommand(strSQL, conn);
                da.UpdateCommand = cmdBuilder.GetUpdateCommand();
                iRet = da.Update(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }
        public static int UpdateData400(string strSQL, DataTable dt)
        {
            string connstr = ConfigurationManager.AppSettings["Oracle400"].ToString();
            int iRet = 0;
            string strMsg = "";
            OracleConnection conn = new OracleConnection();
            conn.ConnectionString = connstr;
            OracleDataAdapter da = new OracleDataAdapter();
            try
            {
                conn.Open();
                OracleCommandBuilder cmdBuilder = new OracleCommandBuilder(da);
                da.SelectCommand = new OracleCommand(strSQL, conn);
                da.UpdateCommand = cmdBuilder.GetUpdateCommand();
                iRet = da.Update(dt);
            }
            catch (Exception ex)
            {
                strMsg = ex.Message.ToString();
                iRet = -2;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return iRet;
        }

        public static bool IsNumberic(string value)
        {
            try
            {
                decimal dvalue = decimal.Parse(value, System.Globalization.NumberStyles.Any);
                return true;
            }
            catch { return false; }
        }
    }
}