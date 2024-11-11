package com.haoduoc.service;

import com.haoduoc.dao.ManagerMapper;
import com.haoduoc.pojo.Manager;

public class ManagerServiceImpl implements ManagerService{

    private ManagerMapper managerMapper;

    public void setManagerMapper(ManagerMapper managerMapper) {
        this.managerMapper = managerMapper;
    }

    @Override
    public Manager queryByGmaccount(String gmaccount) {
        return managerMapper.queryByGmaccount(gmaccount);
    }
}
