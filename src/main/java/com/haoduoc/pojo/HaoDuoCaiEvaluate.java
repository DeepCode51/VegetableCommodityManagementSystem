package com.haoduoc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HaoDuoCaiEvaluate {
    private String yoid;
    private int yid;
    private int uid;
    private String yeimage;
    private String yecontent;
    private String yedate;
    private String yequality;
    private HaoDuoCaiOrder haoDuoCaiOrder;
    private User user;
}
