package com.haoduoc.dao;

import com.haoduoc.pojo.Manager;

public interface ManagerMapper {
    //查询指定账号的密码，进行登入
    Manager queryByGmaccount(String gmaccount);
}
