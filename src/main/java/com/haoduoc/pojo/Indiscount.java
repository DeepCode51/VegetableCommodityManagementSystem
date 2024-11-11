package com.haoduoc.pojo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Indiscount {
    private int disid;
    private String discontext;
    private Double quota;
    private int disnumber;
}
