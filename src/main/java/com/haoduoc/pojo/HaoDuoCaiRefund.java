package com.haoduoc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HaoDuoCaiRefund {
    private String yoid;
    private String yrtype;
    private String yrreason;
    private String yrimage;
    private String yrdate;
    private HaoDuoCaiOrder haoDuoCaiOrder;
}
