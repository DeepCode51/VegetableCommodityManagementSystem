package com.haoduoc.service;

import com.haoduoc.dao.HaoDuoCaiTypeMapper;
import com.haoduoc.pojo.HaoDuoCaiType;

import java.util.List;

public class HaoDuoCaiTypeServiceImpl implements HaoDuoCaiTypeService {
    private HaoDuoCaiTypeMapper haoDuoCaiTypeMapper;

    public void setHaoDuoCaiTypeMapper(HaoDuoCaiTypeMapper haoDuoCaiTypeMapper) {
        this.haoDuoCaiTypeMapper = haoDuoCaiTypeMapper;
    }

    @Override
    public List<HaoDuoCaiType> queryHaoDuoCaiType() {
        return haoDuoCaiTypeMapper.queryHaoDuoCaiType();
    }

    @Override
    public HaoDuoCaiType queryHaoDuoCaiTypeByName(String tname) {
        return haoDuoCaiTypeMapper.queryHaoDuoCaiTypeByName(tname);
    }

    @Override
    public int addType(HaoDuoCaiType haoDuoCaiType) {
        return haoDuoCaiTypeMapper.addType(haoDuoCaiType);
    }

    @Override
    public int deleteType(int tid) {
        return haoDuoCaiTypeMapper.deleteType(tid);
    }

    @Override
    public HaoDuoCaiType queryTypeById(int tid) {
        return haoDuoCaiTypeMapper.queryTypeById(tid);
    }

    @Override
    public int updateType(HaoDuoCaiType haoDuoCaiType) {
        return haoDuoCaiTypeMapper.updateType(haoDuoCaiType);
    }
}
