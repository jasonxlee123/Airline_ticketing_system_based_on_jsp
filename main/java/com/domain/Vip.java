package com.domain;

public class Vip {
    private int vip_num;
    private String vip_name;
    private String vip_sex;
    private String vip_birth;
    private String vip_phone;
    private String vip_id;
    private String vip_pwd;

    public int getVip_num() {
        return vip_num;
    }

    public void setVip_num(int vip_num) {
        this.vip_num = vip_num;
    }

    public String getVip_name() {
        return vip_name;
    }

    public void setVip_name(String vip_name) {
        this.vip_name = vip_name;
    }

    public String getVip_sex() {
        return vip_sex;
    }

    public void setVip_sex(String vip_sex) {
        this.vip_sex = vip_sex;
    }

    public String getVip_birth() {
        return vip_birth;
    }

    public void setVip_birth(String vip_birth) {
        this.vip_birth = vip_birth;
    }

    public String getVip_phone() {
        return vip_phone;
    }

    public void setVip_phone(String vip_phone) {
        this.vip_phone = vip_phone;
    }

    public String getVip_id() {
        return vip_id;
    }

    public void setVip_id(String vip_id) {
        this.vip_id = vip_id;
    }

    public String getVip_pwd() {
        return vip_pwd;
    }

    public void setVip_pwd(String vip_pwd) {
        this.vip_pwd = vip_pwd;
    }

    @Override
    public String toString() {
        return "vip{" +
                "vip_num='" + vip_num + '\'' +
                ", vip_name='" + vip_name + '\'' +
                ", vip_sex='" + vip_sex + '\'' +
                ", vip_birth='" + vip_birth + '\'' +
                ", vip_phone='" + vip_phone + '\'' +
                ", vip_id='" + vip_id + '\'' +
                ", vip_pwd='" + vip_pwd + '\'' +
                '}';
    }
}
