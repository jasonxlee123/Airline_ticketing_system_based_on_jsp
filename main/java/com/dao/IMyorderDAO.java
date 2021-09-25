package com.dao;
import com.domain.*;

import java.util.List;

public interface IMyorderDAO {
    public abstract int create(Myorder mo) throws Exception; //添加记录的方法
    public abstract int remove(Myorder mo) throws Exception;    //删除记录的方法
    public abstract Myorder find(Myorder mo) throws Exception;   //查询记录的方法
    public abstract List<Myorder> findAll() throws Exception;     //列出全部记录的方法
    public abstract List<Myorder> findUserOrders( String vip_num ) throws Exception;
}
