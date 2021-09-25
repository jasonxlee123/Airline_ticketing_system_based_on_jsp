package com.dao;

import com.db.dbconn;
import com.domain.Vip;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class MyinfoDAO implements IMyinfoDAO {
    protected static final String  FIELDS_INSERT ="vip_name,vip_sex,vip_birth,vip_phone,vip_id,vip_pwd";
    //protected static final String  FIELDS_RETURN ="id, " + FIELDS_INSERT;
    protected static String INSERT_SQL="insert into vip ("+FIELDS_INSERT+")"+"values (?,?,?,?,?,?)";
    protected static String SELECT_SQL="select "+FIELDS_INSERT+" from vip where vip_num=?";
    //protected static String UPDATE_SQL="update vip set vip_num=? where order_num=?";
    //protected static String DELETE_SQL ="delete from vip where vip_num=?";

    @Override
    public int create(Vip vip) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        int res = 0;
        try{
            con=dbconn.getDBconnection();
            prepStmt =con.prepareStatement(INSERT_SQL);
            prepStmt.setString(1,vip.getVip_name());
            prepStmt.setString(2,vip.getVip_sex());
            prepStmt.setString(3,vip.getVip_birth());
            prepStmt.setString(4,vip.getVip_phone());
            prepStmt.setString(5,vip.getVip_id());
            prepStmt.setString(6,vip.getVip_pwd());
            res = prepStmt.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            dbconn.closeDB(con, prepStmt);
        }
        return res;
    }

    @Override
    public int remove(Vip vip) throws Exception {
        return 0;
    }

    @Override
    public Vip find(Vip vip) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        Vip vip1 = null;
        try {
            con=dbconn.getDBconnection();
            prepStmt = con.prepareStatement(SELECT_SQL);
            prepStmt.setInt(1,vip1.getVip_num());
            rs = prepStmt.executeQuery();
            if (rs.next()){
                vip1 = new Vip();
                vip1.setVip_name(rs.getString(1));
                vip1.setVip_sex(rs.getString(2));
                vip1.setVip_birth(rs.getString(3));
                vip1.setVip_phone(rs.getString(4));
                vip1.setVip_id(rs.getString(5));
            }
        } catch (Exception e) {
            // handle exception
        } finally {
            dbconn.closeDB(con, prepStmt, rs);
        }
        return vip1;
    }

    @Override
    public List<Vip> findAll() throws Exception {
        return null;
    }

	@Override
	public boolean login(Vip vip) {
		// TODO Auto-generated method stub
		Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        try {
            con=dbconn.getDBconnection();
            String sql = "select * from vip where vip_phone='15277799999' and vip_pwd=123456"; 
            prepStmt = con.prepareStatement(sql);
            //prepStmt.setString(1,vip.getVip_phone());
            //prepStmt.setString(2,vip.getVip_pwd());
            rs = prepStmt.executeQuery();
            if (rs.next()){
                return true;
            }
            else {
            	return false;
            }
        } catch (Exception e) {
            // handle exception
        } finally {
            dbconn.closeDB(con, prepStmt, rs);
        }
		return false;     
		
	}

    @Override
    public Vip getself(String phone) throws Exception {
        Connection con=null;
        PreparedStatement prepStmt=null;
        ResultSet rs=null;
        Vip vip1 = null;
        try {
            con=dbconn.getDBconnection();
            String sql = "select * from vip where vip_phone=?";
            prepStmt = con.prepareStatement(sql);
            prepStmt.setString(1,phone);
            rs = prepStmt.executeQuery();
            if (rs.next()){
                vip1 = new Vip();
                vip1.setVip_name(rs.getString(1));
                vip1.setVip_sex(rs.getString(2));
                vip1.setVip_birth(rs.getString(3));
                vip1.setVip_phone(rs.getString(4));
                vip1.setVip_id(rs.getString(5));
            }
        } catch (Exception e) {
            // handle exception
        } finally {
            dbconn.closeDB(con, prepStmt, rs);
        }
        return vip1;
    }
}
