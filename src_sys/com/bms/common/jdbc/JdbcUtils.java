package com.bms.common.jdbc;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;

public class JdbcUtils
{
  private static DataSource ds = new ComboPooledDataSource();

  private static ThreadLocal<Connection> tl = new ThreadLocal();

  public static DataSource getDataSource() {
    return ds;
  }

  public static Connection getConnection()
    throws SQLException
  {
    Connection con = (Connection)tl.get();
    if (con != null) return con;
    return ds.getConnection();
  }

  public static void beginTransaction()
    throws SQLException
  {
    Connection con = (Connection)tl.get();
    if (con != null) throw new SQLException("�Ѿ����������񣬲����ظ�������");
    con = ds.getConnection();
    con.setAutoCommit(false);
    tl.set(con);
  }

  public static void commitTransaction()
    throws SQLException
  {
    Connection con = (Connection)tl.get();
    if (con == null) throw new SQLException("û���������ύ��");
    con.commit();
    con.close();
    con = null;
    tl.remove();
  }

  public static void rollbackTransaction()
    throws SQLException
  {
    Connection con = (Connection)tl.get();
    if (con == null) throw new SQLException("û�������ܻع���");
    con.rollback();
    con.close();
    con = null;
    tl.remove();
  }

  public static void releaseConnection(Connection connection)
    throws SQLException
  {
    Connection con = (Connection)tl.get();
    if ((connection != con) && 
      (connection != null) && (!connection.isClosed()))
      connection.close();
  }
}