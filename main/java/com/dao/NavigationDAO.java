package com.dao;

import com.domain.Navigation;
import com.db.dbconn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NavigationDAO implements INavigationDAO {
    protected static final String  FIELDS_INSERT ="flight_num,takeoff_time,rest_tickets,ticket_price";
    //protected static String INSERT_SQL="insert into navigation ("+FIELDS_INSERT+")"+"values (?,?,?,?)";
    protected static String SELECT_SQL="select "+FIELDS_INSERT+" from Navigation where navi_num=?";
    protected static String UPDATE_SQL="update Navigation set rest_tickets=rest_tickets-1 where navi_num=?";
    @Override
    public Navigation find(Navigation navi) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        Navigation navi2 = null;
        try {
            con=dbconn.getDBconnection();
            prepStmt = con.prepareStatement(SELECT_SQL);
            prepStmt.setInt(1,navi.getNavi_num());
            rs = prepStmt.executeQuery();
            if (rs.next()){
                navi2 = new Navigation();
                navi2.setFlight_num(rs.getString(2));
                navi2.setTakeoff_time(rs.getString(3));
                navi2.setRest_tickets(rs.getInt(4));
                navi2.setTicket_price(rs.getInt(5));
            }
        } catch (Exception e) {
            // handle exception
        } finally {
            dbconn.closeDB(con, prepStmt, rs);
        }
        return navi2;
    }

    @Override
    public List<Navigation> findAll() throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        List<Navigation> navigations = new ArrayList<Navigation>();
        con=dbconn.getDBconnection();
        prepStmt = con.prepareStatement("select navigation.flight_num,airplane.aircraft_type,flight.departure,flight.destination,flight.takeoff_time,flight.arrival_time,navigation.ticket_price,navigation.rest_tickets\r\n"
        		+ "from navigation,flight,airplane\r\n"
        		+ "where navigation.flight_num = flight.flight_num and flight.aircraft_num = airplane.aircraft_num;");
        rs = prepStmt.executeQuery();
        while(rs.next()) {
            Navigation navi2 = new Navigation();
            navi2 = new Navigation();
            navi2.setFlight_num(rs.getString(1));
            navi2.setAircraft_type(rs.getString(2));
            navi2.setDeparture(rs.getString(3));
            navi2.setDestination(rs.getString(4));
            navi2.setTakeoff_time(rs.getString(5));
            navi2.setArrival_time(rs.getString(6));
            navi2.setTicket_price(rs.getInt(7));
            navi2.setRest_tickets(rs.getInt(8));
            navigations.add(navi2);
        }
        dbconn.closeDB(con, prepStmt, rs);
        return navigations;
    }

    @Override
    public int update(Navigation navi) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        int res = 0;
        try {
            con=dbconn.getDBconnection();
            prepStmt = con.prepareStatement(UPDATE_SQL);
            prepStmt.setInt(1,navi.getNavi_num());
            int rowCount=prepStmt.executeUpdate();
            if (rowCount == 0) {
                throw new Exception("Update Error:Student Id:" + navi.getNavi_num());
            }
        } catch (Exception e) {
            // handle exception
        } finally {
            dbconn.closeDB(con, prepStmt, rs);
        }
        return res;
    }

}
