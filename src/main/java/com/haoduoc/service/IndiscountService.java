package com.haoduoc.service;

import org.apache.ibatis.annotations.Param;
import com.haoduoc.pojo.Indiscount;
import java.util.List;

public interface IndiscountService {
    //查询该用户的订单
    List<Indiscount> queryYasaiIndiscount();
    //修改优惠卷的数量
    int alterIndiscountByid(Indiscount indiscount);
    Indiscount queryIndiscountById(int disid);
    int reduceIndiscount(@Param("disid")int disid);
}
