package com.haoduoc.service;
import com.haoduoc.dao.RevenuereportMapper;
import com.haoduoc.pojo.Revenuereport;
import java.util.List;
public class RevenuereportServiceImpl implements RevenuereportService
{
    private RevenuereportMapper revenuereportMapper;


    public void setRevenuereportMapper(RevenuereportMapper revenuereportMapper) {
        this.revenuereportMapper = revenuereportMapper;
    }

    @Override
    public List<Revenuereport> queryYasaiRevenuereport() {
        return revenuereportMapper.queryYasaiRevenuereport();
    }
}
