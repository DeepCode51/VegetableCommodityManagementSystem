package com.haoduoc.service;

import com.haoduoc.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {

    //查询指定账号的密码，进行登入
    User queryByUaccount(String uaccount);
    //添加用户
    int addUser(User user);
    //通过id修改昵称
    int alterNnameById(User user);
    //修改个人信息
    int alterUserInfo(User user);
    //通过id查询用户信息
    User queryUserById(int uid);
    //查询全部用户信息
    List<User> queryAllUser();
    //通过id删除用户
    int deleteUserById(int uid);
    //添加新用户的收货地址
    int addUserAddress(@Param("uaddress") String uaddress, @Param("uid") int uid);
    //添加新用户的收货地址
    String queryUserAddress(int uid);
    //提交订单时，修改个人信息
    int updateUserInfoAtOrder(User user);
}
