package com.haoduoc.dao;

import com.haoduoc.pojo.HaoDuoCaiOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface HaoDuoCaiOrderMapper {

    //用户购买后付款，新增了一个订单
    int addHaoDuoCaiOrder(HaoDuoCaiOrder haoDuoCaiOrder);
    //查询所有订单数量
    int queryOrderCount();
    //查询该用户的订单
    List<HaoDuoCaiOrder> queryUserOrder(Map map);
    //确认收货,修改isreceive,变为ture
    int updateIsreceive(String yoid);
    //通过订单查询该订单信息
    HaoDuoCaiOrder queryOrderByYoid(String yoid);
    //用户完成评价,修改isevaluate,变为true
    int updateIsevaluate(String yoid);
    //管理员完成退款处理,修改isrefundprocess,变为true
    int updateIsrefundprocess(String yoid);
    //管理员查询所有订单
    List<HaoDuoCaiOrder> queryAllOrder(@Param("startPlace")int startPlace, @Param("pageSize")int pageSize);
    //管理员确认发货
    int updateYastatus(String yoid);
    //管理员删除订单
    int deleteOrderById(String yoid);
}
