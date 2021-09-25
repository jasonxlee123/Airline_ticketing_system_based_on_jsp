package com.dao;

import com.db.dbconn;
import com.domain.Passager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class PassagerDAO implements IPassagerDAO {
    protected static final String  FIELDS_INSERT ="vip_num,pass_name,pass_id,pass_phone";
    //protected static final String  FIELDS_RETURN ="id, " + FIELDS_INSERT;
    protected static String INSERT_SQL="insert into passager ("+FIELDS_INSERT+")"+"values (?,?,?,?)";
    protected static String SELECT_SQL="select pass_name,pass_id,pass_phone from passager where vip_num=?";
    //protected static String UPDATE_SQL="update myorder set vip_num=? where order_num=?";
    protected static String DELETE_SQL ="delete from passager where pass_num=?";


    @Override
    public int create(Passager pas) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        int res = 0;
        try{
            con= dbconn.getDBconnection();
            prepStmt =con.prepareStatement(INSERT_SQL);
            prepStmt.setString(1,pas.getVip_num());
            prepStmt.setString(2,pas.getPass_name());
            prepStmt.setString(3,pas.getPass_id());
            prepStmt.setString(4,pas.getPass_phone());
            res = prepStmt.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            dbconn.closeDB(con, prepStmt, rs);
        }
        return res;
    }

    @Override
    public int remove(Passager pas) throws Exception {
        return 0;
    }

    @Override
    public Passager find(Passager pas) throws Exception {
        return null;
    }

    @Override
    public List<Passager> findAll(Passager pas) throws Exception {
        return null;
    }
}
