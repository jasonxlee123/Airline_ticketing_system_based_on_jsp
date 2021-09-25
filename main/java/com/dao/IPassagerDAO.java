package com.dao;

import com.domain.Passager;

import java.util.List;

public interface IPassagerDAO {
    public abstract int create(Passager pas) throws Exception; //添加记录的方法
    public abstract int remove(Passager pas) throws Exception;    //删除记录的方法
    public abstract Passager find(Passager pas) throws Exception;   //查询记录的方法
    public abstract List<Passager> findAll(Passager pas) throws Exception;     //列出全部记录的方法
}


