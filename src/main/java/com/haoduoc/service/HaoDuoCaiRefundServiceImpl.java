package com.haoduoc.service;

import com.haoduoc.dao.HaoDuoCaiRefundMapper;
import com.haoduoc.pojo.HaoDuoCaiRefund;

import java.util.List;

public class HaoDuoCaiRefundServiceImpl implements HaoDuoCaiRefundService {
    private HaoDuoCaiRefundMapper haoDuoCaiRefundMapper;

    public void setHaoDuoCaiRefundMapper(HaoDuoCaiRefundMapper haoDuoCaiRefundMapper) {
        this.haoDuoCaiRefundMapper = haoDuoCaiRefundMapper;
    }

    @Override
    public int addHaoDuoCaiRefund(HaoDuoCaiRefund yasairefund) {
        return haoDuoCaiRefundMapper.addHaoDuoCaiRefund(yasairefund);
    }

    @Override
    public HaoDuoCaiRefund queryRefundByYoid(String yoid) {
        return haoDuoCaiRefundMapper.queryRefundByYoid(yoid);
    }

    @Override
    public List<HaoDuoCaiRefund> queryAllRefund() {
        return haoDuoCaiRefundMapper.queryAllRefund();
    }

    @Override
    public int deleteRefund(String yoid) {
        return haoDuoCaiRefundMapper.deleteRefund(yoid);
    }
}
