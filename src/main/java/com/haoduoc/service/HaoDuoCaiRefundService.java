package com.haoduoc.service;

import com.haoduoc.pojo.HaoDuoCaiRefund;

import java.util.List;

public interface HaoDuoCaiRefundService {

    //用户提交退款处理
    int addHaoDuoCaiRefund(HaoDuoCaiRefund yasairefund);
    //通过yoid查询是否提交申请
    HaoDuoCaiRefund queryRefundByYoid(String yoid);
    //管理员查看所有退款申请
    List<HaoDuoCaiRefund> queryAllRefund();
    //管理员完成处理订单,删除该处理
    int deleteRefund(String yoid);
}
