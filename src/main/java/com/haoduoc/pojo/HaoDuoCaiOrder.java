package com.haoduoc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HaoDuoCaiOrder {
    private String yoid;
    private int uid;
    private int yid;
    private int yacount;
    private int yasum;
    private String yafunction;
    private String yastatus;
    private String isreceive;
    private String isevaluate;
    private String isrefundprocess;
    private String yadate;
    private String yausername;
    private String yaaddress;
    private String yaphone;
    private User user;
    private HaoDuoCais haoDuoCais;

}
