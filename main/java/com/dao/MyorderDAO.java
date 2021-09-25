package com.dao;

import com.db.dbconn;
import com.domain.Myorder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;

public class MyorderDAO implements IMyorderDAO {
    protected static final String  FIELDS_INSERT ="vip_num,pass_num,navi_num,order_day";
    //protected static final String  FIELDS_RETURN ="id, " + FIELDS_INSERT;
    protected static String INSERT_SQL="insert into myorder ("+FIELDS_INSERT+")"+"values (?,?,?,?)";
    protected static String SELECT_SQL="select "+FIELDS_INSERT+" from myorder where order_num=?";
    //protected static String UPDATE_SQL="update myorder set vip_num=? where order_num=?";
    protected static String DELETE_SQL ="delete from myorder where order_num=?";
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
    java.util.Date Dates = new java.util.Date();
    //java.sql.Timestamp time = new java.sql.Timestamp(Dates.getTime());String.valueOf(time)

    @Override
    public int create(Myorder mo) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        con=dbconn.getDBconnection();
        System.out.println("Print order:");
        //get vip_num
        String sql = "select vip_num from vip where vip_phone=?";
        prepStmt = con.prepareStatement(sql);
        prepStmt.setString(1,mo.getVip_phone());
        rs = prepStmt.executeQuery();
        String vm="";
        while(rs.next()) {
            vm=rs.getString(1);
        }
        int vmi = Integer.parseInt(vm);
        System.out.println(vmi);
        //get pass_num
        System.out.println(mo.getPass_phone());
        String sql2 = "select pass_num from passager where pass_phone=?";
        prepStmt = con.prepareStatement(sql2);
        prepStmt.setString(1,mo.getPass_phone());
        rs = prepStmt.executeQuery();
        int pn=0;
        while(rs.next()) {
            pn=rs.getInt(1);
        }
        System.out.println(pn);
        //get navi_num
        String sql1 = "select navi_num from navigation where flight_num=?";
        prepStmt = con.prepareStatement(sql1);
        prepStmt.setString(1,mo.getFlight_num());
        System.out.println(mo.getFlight_num());
        rs = prepStmt.executeQuery();
        int nn=0;
        while(rs.next()) {
            nn = rs.getInt(1);
            System.out.println(nn);
        }
        int res = 0;
        try{
            prepStmt =con.prepareStatement(INSERT_SQL);
            prepStmt.setInt(1,vmi);
            prepStmt.setInt(2,pn);
            prepStmt.setInt(3,nn);
            prepStmt.setString(4,df.format(new Date()));
            res = prepStmt.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            dbconn.closeDB(con, prepStmt, rs);
        }
        return res;
    }


    @Override
    public int remove(Myorder mo) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        try {
            con=dbconn.getDBconnection();
            prepStmt = con.prepareStatement(DELETE_SQL);
            prepStmt.setString(1,mo.getOrder_num());
            prepStmt.executeUpdate();
        }catch(Exception e) {
            //
        } finally {
            dbconn.closeDB(con, prepStmt, rs);
            return 1;
        }
    }

    @Override
    public Myorder find(Myorder mo) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        Myorder mo2 = null;
        try {
            con=dbconn.getDBconnection();
            prepStmt = con.prepareStatement(SELECT_SQL);
            prepStmt.setString(1,mo2.getOrder_num());
            rs = prepStmt.executeQuery();
            if (rs.next()){
                mo2 = new Myorder();
                mo2.setOrder_day(rs.getString(1));
                mo2.setFlight_num(rs.getString(2));
                mo2.setDeparture(rs.getString(3));
                mo2.setDestination(rs.getString(4));
                mo2.setTakeoff_time(rs.getString(5));
                mo2.setPass_name(rs.getString(6));
            }
        } catch (Exception e) {
            // handle exception
        } finally {
            dbconn.closeDB(con, prepStmt, rs);
        }
        return mo2;
    }

    @Override
    public List<Myorder> findAll() throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        con=dbconn.getDBconnection();
        String sql="select order_day,navigation.flight_num,flight.departure,flight.destination,navigation.takeoff_time,pass_name " +
                "from myorder,flight,navigation,passager " +
                "where myorder.vip_num=1 and myorder.navi_num=navigation.navi_num and myorder.pass_num=passager.pass_num and navigation.flight_num=flight.flight_num";
        prepStmt = con.prepareStatement(sql);
        rs = prepStmt.executeQuery();
        List<Myorder> myorders = new ArrayList<Myorder>();
        while(rs.next()) {
            Myorder mo2 = new Myorder();
            mo2 = new Myorder();
            mo2.setOrder_day(rs.getString(1));
            mo2.setFlight_num(rs.getString(2));
            mo2.setDeparture(rs.getString(3));
            mo2.setDestination(rs.getString(4));
            mo2.setTakeoff_time(rs.getString(5));
            mo2.setPass_name(rs.getString(6));
            myorders.add(mo2);
        }
        dbconn.closeDB(con, prepStmt, rs);
        return myorders;

    }

    @Override
    public List<Myorder> findUserOrders(String vip_phone) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        List<Myorder> myorders = new ArrayList<Myorder>();
        con=dbconn.getDBconnection();
        String sql = "" +
                "select " +
                "order_day, navigation.flight_num, departure, destination, navigation.takeoff_time, pass_name " +
                "from " +
                "myorder, flight, passager, navigation " +
                "where myorder.vip_phone = ? " +
                "and myorder.pass_num = passager.pass_num " +
                "and myorder.navi_num = navigation.navi_num " +
                "and navigation.flight_num = flight.flight_num";
        prepStmt = con.prepareStatement(sql);
        prepStmt.setString(1,vip_phone);
        rs = prepStmt.executeQuery();
        while(rs.next()) {
            Myorder mo2 = new Myorder();
            mo2 = new Myorder();
            mo2.setOrder_day(rs.getString(1));
            mo2.setFlight_num(rs.getString(2));
            mo2.setDeparture(rs.getString(3));
            mo2.setDestination(rs.getString(4));
            mo2.setTakeoff_time(rs.getString(5));
            mo2.setPass_name(rs.getString(6));
            myorders.add(mo2);
        }
        dbconn.closeDB(con, prepStmt, rs);
        return myorders;
    }
}
