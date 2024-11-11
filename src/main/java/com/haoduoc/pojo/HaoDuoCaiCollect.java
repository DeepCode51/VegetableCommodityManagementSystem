package com.haoduoc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HaoDuoCaiCollect {
    private List<HaoDuoCais> haoDuoCais;
    private int uid;
    private int yid;
}
