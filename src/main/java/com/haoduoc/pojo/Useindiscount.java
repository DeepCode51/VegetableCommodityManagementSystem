package com.haoduoc.pojo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Useindiscount {
    private int disid;
    private int uid;
    private int unumber;
    private Indiscount indiscount;
}
