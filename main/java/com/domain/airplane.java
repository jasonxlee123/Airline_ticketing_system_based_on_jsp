package com.domain;
import java.sql.*;
import java.util.ArrayList;


public class airplane {
    private String aircraft_num;
    private String aircraft_info;
    private String aircraft_type;
    private int sit_num;

    public String getAircraft_num() {
        return aircraft_num;
    }

    public void setAircraft_num(String aircraft_num) {
        this.aircraft_num = aircraft_num;
    }

    public String getAircraft_info() {
        return aircraft_info;
    }

    public void setAircraft_info(String aircraft_info) {
        this.aircraft_info = aircraft_info;
    }

    public String getAircraft_type() {
        return aircraft_type;
    }

    public void setAircraft_type(String aircraft_type) {
        this.aircraft_type = aircraft_type;
    }

    public int getSit_num() {
        return sit_num;
    }

    public void setSit_num(int sit_num) {
        this.sit_num = sit_num;
    }

    @Override
    public String toString() {
        return "airplane{" +
                "aircraft_num='" + aircraft_num + '\'' +
                ", aircraft_info='" + aircraft_info + '\'' +
                ", aircraft_type='" + aircraft_type + '\'' +
                ", sit_num=" + sit_num +
                '}';
    }
}
