package com.dao;
import com.domain.*;
import com.domain.Navigation;

import java.util.List;

public interface INavigationDAO {
    public abstract Navigation find(Navigation navi) throws Exception;
    public abstract List<Navigation> findAll() throws Exception;
    public abstract int update(Navigation navi) throws Exception;
}
