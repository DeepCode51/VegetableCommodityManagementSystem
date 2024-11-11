package com.haoduoc.pojo;

public class ItemBean {
    private HaoDuoCais haoDuoCais;
    private int quantity;

    public ItemBean(HaoDuoCais haoDuoCais, int quantity) {
        this.haoDuoCais = haoDuoCais;
        this.quantity = quantity;
    }

    public HaoDuoCais getHaoDuoCais() {
        return haoDuoCais;
    }

    public void setHaoDuoCais(HaoDuoCais haoDuoCais) {
        this.haoDuoCais = haoDuoCais;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
