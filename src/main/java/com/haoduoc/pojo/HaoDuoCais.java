package com.haoduoc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HaoDuoCais {
    private int yid;
    private String yname;
    private String yimage1;
    private String yrange;
    private String ytype;
    private String yintro;
    private double yprice;
    private String ymanage;
    private int ysale;
    private int inventory;

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public int getYid() {
        return yid;
    }

    public void setYid(int yid) {
        this.yid = yid;
    }

    public String getYname() {
        return yname;
    }

    public void setYname(String yname) {
        this.yname = yname;
    }

    public String getYimage1() {
        return yimage1;
    }

    public void setYimage1(String yimage1) {
        this.yimage1 = yimage1;
    }

    public String getYrange() {
        return yrange;
    }

    public void setYrange(String yrange) {
        this.yrange = yrange;
    }

    public String getYtype() {
        return ytype;
    }

    public void setYtype(String ytype) {
        this.ytype = ytype;
    }

    public String getYintro() {
        return yintro;
    }

    public void setYintro(String yintro) {
        this.yintro = yintro;
    }

    public double getYprice() {
        return yprice;
    }

    public void setYprice(double yprice) {
        this.yprice = yprice;
    }

    public String getYmanage() {
        return ymanage;
    }

    public void setYmanage(String ymanage) {
        this.ymanage = ymanage;
    }

    public int getYsale() {
        return ysale;
    }

    public void setYsale(int ysale) {
        this.ysale = ysale;
    }
}
