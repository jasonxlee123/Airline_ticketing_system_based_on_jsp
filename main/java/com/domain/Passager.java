package com.domain;
import java.sql.*;
import java.util.ArrayList;

public class Passager {
    private String pass_num;
    private String vip_num;
    private String pass_name;
    private String pass_id;
    private String pass_phone;

    public String getPass_num() {
        return pass_num;
    }

    public void setPass_num(String pass_num) {
        this.pass_num = pass_num;
    }

    public String getVip_num() {
        return vip_num;
    }

    public void setVip_num(String vip_num) {
        this.vip_num = vip_num;
    }

    public String getPass_name() {
        return pass_name;
    }

    public void setPass_name(String pass_name) {
        this.pass_name = pass_name;
    }

    public String getPass_id() {
        return pass_id;
    }

    public void setPass_id(String pass_id) {
        this.pass_id = pass_id;
    }

    public String getPass_phone() {
        return pass_phone;
    }

    public void setPass_phone(String pass_phone) {
        this.pass_phone = pass_phone;
    }

    @Override
    public String toString() {
        return "passager{" +
                "pass_num='" + pass_num + '\'' +
                ", vip_num='" + vip_num + '\'' +
                ", pass_name='" + pass_name + '\'' +
                ", pass_id='" + pass_id + '\'' +
                ", pass_phone='" + pass_phone + '\'' +
                '}';
    }
}
