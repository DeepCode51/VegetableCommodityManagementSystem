package com.haoduoc.dao;

import com.haoduoc.pojo.HaoDuoCaiCollect;
import org.apache.ibatis.annotations.Param;

public interface HaoDuoCaiCollectMapper {

    //用户查看自己的收藏菜品
    HaoDuoCaiCollect queryUserCollect(int uid);
    //删除收藏的菜品
    int deleteHaoDuoCaiCollect(@Param("uid") int uid,@Param("yid") int yid);
    //添加收藏菜品
    int addHaoDuoCaiCollect(@Param("uid") int uid,@Param("yid") int yid);
    //查看是否已经收藏该菜品
    HaoDuoCaiCollect queryCollect(@Param("uid") int uid, @Param("yid") int yid);
}
