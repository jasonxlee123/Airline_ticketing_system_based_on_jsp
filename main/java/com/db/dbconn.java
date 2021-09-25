package com.db;
import java.sql.*;

public class dbconn {
    private static String driverName = "com.mysql.cj.jdbc.Driver";   //驱动程序名
    private static String userName = "root";                      //数据库用户名
    private static String userPwd = "450430";                     //密码
    private static String dbName = "fpa";                    //数据库名
    public static Connection getDBconnection() {
        String  url1="jdbc:mysql://localhost:3306/"+dbName;
        String  url2 ="?user="+userName+"&password="+userPwd;
        String  url3="&useUnicode=true&characterEncoding=UTF-8";
        String  url =url1+url2+url3;
        try {
            Class.forName(driverName);
            return DriverManager.getConnection(url);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void closeDB(Connection con,PreparedStatement  pstm, ResultSet rs){
        try {
            if(rs!=null) rs.close();
            if(pstm!=null) pstm.close();
            if(con!=null) con.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void closeDB(Connection con,PreparedStatement  pstm){
        try {
            if(pstm!=null) pstm.close();
            if(con!=null) con.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
