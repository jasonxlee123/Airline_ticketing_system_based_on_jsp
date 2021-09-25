package com.domain;

public class Myorder {
    private String order_num;
    private String vip_num;
    private String pass_num;
    private String navi_num;
    private String order_day;
    private String pass_phone;
    private String vip_phone;

    public String getVip_phone() {
        return vip_phone;
    }

    public void setVip_phone(String vip_phone) {
        this.vip_phone = vip_phone;
    }

    public String getPass_phone() {
        return pass_phone;
    }

    public void setPass_phone(String pass_phone) {
        this.pass_phone = pass_phone;
    }

    private String flight_num;
    private String departure;
    private String destination;
    private String takeoff_time;
    private String pass_name;

    public String getPass_num() {
        return pass_num;
    }

    public void setPass_num(String pass_num) {
        this.pass_num = pass_num;
    }

    public String getNavi_num() {
        return navi_num;
    }

    public void setNavi_num(String navi_num) {
        this.navi_num = navi_num;
    }

    public String getOrder_num() {
        return order_num;
    }

    public void setOrder_num(String order_num) {
        this.order_num = order_num;
    }

    public String getVip_num() {
        return vip_num;
    }

    public void setVip_num(String vip_num) {
        this.vip_num = vip_num;
    }

    public String getOrder_day() {
        return order_day;
    }

    public void setOrder_day(String order_day) {
        this.order_day = order_day;
    }

    public String getFlight_num() {
        return flight_num;
    }

    public void setFlight_num(String flight_num) {
        this.flight_num = flight_num;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getTakeoff_time() {
        return takeoff_time;
    }

    public void setTakeoff_time(String takeoff_time) {
        this.takeoff_time = takeoff_time;
    }

    public String getPass_name() {
        return pass_name;
    }

    public void setPass_name(String pass_name) {
        this.pass_name = pass_name;
    }

    @Override
    public String toString() {
        return "Myorder{" +
                "order_num=" + order_num +
                ", vip_num=" + vip_num +
                ", order_day='" + order_day + '\'' +
                ", flight_num='" + flight_num + '\'' +
                ", departure='" + departure + '\'' +
                ", destination='" + destination + '\'' +
                ", takeoff_time='" + takeoff_time + '\'' +
                ", pass_name='" + pass_name + '\'' +
                '}';
    }
}
