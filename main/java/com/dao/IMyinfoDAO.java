package com.dao;
import com.domain.Vip;

import java.util.List;

public interface IMyinfoDAO {
    int create(Vip vip) throws Exception; //添加记录的方法
    int remove(Vip vip) throws Exception;    //删除记录的方法
    Vip find(Vip vip) throws Exception;   //查询记录的方法
    List<Vip> findAll() throws Exception;     //列出全部记录的方法
    boolean login(Vip vip);	//登录实现
    Vip getself(String phone) throws Exception;
}
