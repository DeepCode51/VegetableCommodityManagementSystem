package com.haoduoc.service;

import com.haoduoc.dao.UserMapper;
import com.haoduoc.pojo.User;

import java.util.List;

public class UserServiceImpl implements UserService{

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User queryByUaccount(String uaccount) {
        return userMapper.queryByUaccount(uaccount);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int alterNnameById(User user) {
        return userMapper.alterNnameById(user);
    }

    @Override
    public int alterUserInfo(User user) {
        return userMapper.alterUserInfo(user);
    }

    @Override
    public User queryUserById(int uid) {
        return userMapper.queryUserById(uid);
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public int deleteUserById(int uid) {
        return userMapper.deleteUserById(uid);
    }

    @Override
    public int addUserAddress(String uaddress, int uid) {
        return userMapper.addUserAddress(uaddress, uid);
    }

    @Override
    public String queryUserAddress(int uid) {
        return userMapper.queryUserAddress(uid);
    }

    @Override
    public int updateUserInfoAtOrder(User user) {
        return userMapper.updateUserInfoAtOrder(user);
    }
}
