package com.haoduoc.dao;
import java.util.List;
import com.haoduoc.pojo.Indiscount;
import com.haoduoc.pojo.Useindiscount;
import org.apache.ibatis.annotations.Param;


public interface IndiscountMapper {
    //查询所以优惠卷的属性
    List<Indiscount> queryYasaiIndiscount();
    //修改优惠卷的数量
    int alterIndiscountByid(Indiscount indiscount);
    Indiscount queryIndiscountById(int disid);
    //减少优惠卷的数量，在用户领取时
    int reduceIndiscount(@Param("disid")int disid);
}
