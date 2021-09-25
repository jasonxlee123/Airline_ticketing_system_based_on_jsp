package com.domain;
import java.sql.*;
import java.util.ArrayList;

public class flight {
    private String flight_num;
    private String departure;
    private String destination;
    private String takeoff_time;
    private String arrival_time;
    private int aircraft_num;

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

    public String getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(String arrival_time) {
        this.arrival_time = arrival_time;
    }

    public int getAircraft_num() {
        return aircraft_num;
    }

    public void setAircraft_num(int aircraft_num) {
        this.aircraft_num = aircraft_num;
    }

    @Override
    public String toString() {
        return "flight{" +
                "flight_num='" + flight_num + '\'' +
                ", departure='" + departure + '\'' +
                ", destination='" + destination + '\'' +
                ", takeoff_time='" + takeoff_time + '\'' +
                ", arrival_time='" + arrival_time + '\'' +
                ", aircraft_num=" + aircraft_num +
                '}';
    }
}
