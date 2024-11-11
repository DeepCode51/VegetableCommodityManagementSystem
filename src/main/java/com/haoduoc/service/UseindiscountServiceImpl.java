package com.haoduoc.service;
import com.haoduoc.pojo.Useindiscount;
import com.haoduoc.service.UseindiscountService;
import com.haoduoc.dao.UseindiscountMapper;

import java.util.List;

public class UseindiscountServiceImpl implements UseindiscountService{
    private UseindiscountMapper useindiscountMapper;
    public void setUseindiscountMapper(UseindiscountMapper useindiscountMapper) {
        this.useindiscountMapper = useindiscountMapper;
    }
    @Override
    public List<Useindiscount> queryUseindiscount(int uid) {
        return useindiscountMapper.queryUseindiscount(uid);
    }

    @Override
    public int addUseindiscountFirst(Useindiscount useindiscount) {
        return useindiscountMapper.addUseindiscountFirst(useindiscount);
    }

    @Override
    public Useindiscount queryUseindiscountHas(int uid, int disid) {
        return useindiscountMapper.queryUseindiscountHas(uid,disid);
    }

    @Override
    public int addUseindiscount(Useindiscount useindiscount) {
        return useindiscountMapper.addUseindiscount(useindiscount);
    }

    @Override
    public int reduceUseindiscount(Useindiscount useindiscount) {
        return useindiscountMapper.reduceUseindiscount(useindiscount);
    }

    @Override
    public int deleteUseindiscount(Useindiscount useindiscount) {
        return useindiscountMapper.addUseindiscount(useindiscount);
    }
}
