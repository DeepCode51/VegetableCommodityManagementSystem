package com.haoduoc.service;
import com.haoduoc.dao.IndiscountMapper;
import com.haoduoc.pojo.Indiscount;
import java.util.List;
public class IndiscountServiceImpl  implements  IndiscountService
{
    private IndiscountMapper indiscountMapper;
    public void setIndiscountMapper(IndiscountMapper indiscountMapper) {
        this.indiscountMapper = indiscountMapper;
    }
    @Override
    public List<Indiscount> queryYasaiIndiscount(){
        return indiscountMapper.queryYasaiIndiscount();
    }

    @Override
    public int alterIndiscountByid(Indiscount indiscount) {
        return indiscountMapper.alterIndiscountByid(indiscount);
    }

    @Override
    public Indiscount queryIndiscountById(int disid) {
        return indiscountMapper.queryIndiscountById(disid);
    }

    @Override
    public int reduceIndiscount(int disid) {
        return indiscountMapper.reduceIndiscount(disid);
    }
}
