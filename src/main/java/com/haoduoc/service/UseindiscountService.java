package com.haoduoc.service;

import com.haoduoc.pojo.Useindiscount;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.haoduoc.pojo.Useindiscount;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface UseindiscountService {
    //用户查看自己拥有优惠券
    List<Useindiscount> queryUseindiscount(@Param("uid") int uid);
    //用户第一次领取优惠券
    int addUseindiscountFirst(Useindiscount useindiscount);
    //查询用户是否有该优惠券
    Useindiscount queryUseindiscountHas(@Param("uid") int uid,@Param("disid") int disid);
    //用户再次领取优惠券
    int addUseindiscount(Useindiscount useindiscount);
    //用户使用优惠券
    int reduceUseindiscount(Useindiscount useindiscount);
    //用户使用完最后一张优惠券
    int deleteUseindiscount(Useindiscount useindiscount);
}
