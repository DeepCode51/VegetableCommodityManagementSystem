package com.haoduoc.service;

import com.haoduoc.dao.HaoDuoCaiCollectMapper;
import com.haoduoc.pojo.HaoDuoCaiCollect;

public class HaoDuoCaiCollectServiceImpl implements HaoDuoCaiCollectService {
    private HaoDuoCaiCollectMapper haoDuoCaiCollectMapper;

    public void setHaoDuoCaiCollectMapper(HaoDuoCaiCollectMapper haoDuoCaiCollectMapper) {
        this.haoDuoCaiCollectMapper = haoDuoCaiCollectMapper;
    }


    @Override
    public HaoDuoCaiCollect queryUserCollect(int uid) {
        return haoDuoCaiCollectMapper.queryUserCollect(uid);
    }

    @Override
    public int deleteHaoDuoCaiCollect(int uid, int yid) {
        return haoDuoCaiCollectMapper.deleteHaoDuoCaiCollect(uid,yid);
    }

    @Override
    public int addHaoDuoCaiCollect(int uid, int yid) {
        return haoDuoCaiCollectMapper.addHaoDuoCaiCollect(uid, yid);
    }

    @Override
    public HaoDuoCaiCollect queryCollect(int uid, int yid) {
        return haoDuoCaiCollectMapper.queryCollect(uid, yid);
    }
}
