package com.haoduoc.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int uid;
    private String uaccount;
    private String upass;
    private String uphone;
    private String uemail;
    private String uaddress;
    private String uheadphoto;
    private String nname;
}
