package com.haoduoc.dao;

import com.haoduoc.pojo.HaoDuoCais;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface HaoDuoCaiMapper {

    //上传菜品
    int addHaoDuoCai(HaoDuoCais haoDuoCais);
    //查看所有菜品,返回List集合
    List<HaoDuoCais> queryAllHaoDuoCais();
    //上架或者下架菜品
    int updateHaoDuoCaisYmanage(@Param("ymanage") String ymanage,@Param("yid") int yid);
    //通过id查询菜品
    HaoDuoCais queryHaoDuoCaisById(int yid);
    //修改菜品信息
    int updateHaoDuoCais(HaoDuoCais haoDuoCais);
    //删除菜品通过id
    int deleteHaoDuoCaisById(int yid);
    //查询蔬菜或者肉类菜品
    List<HaoDuoCais> queryHaoDuoCaisRange(Map map);
    //查询分类菜品
    List<HaoDuoCais> queryHaoDuoCaisType(String ytype);
    //商品购买后增加销量
    int addHaoDuoCaiYsale(@Param("yid") int yid,@Param("ysale") int ysale);
    //购买后减少库存
    int addHaoDuoCaiInventory(@Param("yid") int yid, @Param("inventory") int inventory);
    //通过名称查询菜品
    List<HaoDuoCais>  queryHaoDuoCaisByName(String yname);
    //进入菜品详情页面，查询和该菜品类型相同的菜品
    List<HaoDuoCais> queryHaoDuoCaisSame(HaoDuoCais haoDuoCais);
    //首页，查询销量最高的六个菜
    List<HaoDuoCais> queryHaoDuoCaisBySale();
}
