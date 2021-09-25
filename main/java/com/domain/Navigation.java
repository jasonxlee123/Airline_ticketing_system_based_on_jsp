package com.domain;

public class Navigation {
    private int navi_num;
    private String flight_num;
    private String takeoff_time;
    private int rest_tickets;
    private int ticket_price;
    private String departure;
    private String destination;
    private String arrival_time;
    private String aircraft_info;
    private String aircraft_type;

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

    public String getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(String arrival_time) {
        this.arrival_time = arrival_time;
    }

    

    public int getNavi_num() {
        return navi_num;
    }

    public void setNavi_num(int navi_num) {
        this.navi_num = navi_num;
    }

    public String getFlight_num() {
        return flight_num;
    }

    public void setFlight_num(String flight_num) {
        this.flight_num = flight_num;
    }

    public String getTakeoff_time() {
        return takeoff_time;
    }

    public void setTakeoff_time(String takeoff_time) {
        this.takeoff_time = takeoff_time;
    }

    public int getRest_tickets() {
        return rest_tickets;
    }

    public void setRest_tickets(int rest_tickets) {
        this.rest_tickets = rest_tickets;
    }

    public int getTicket_price() {
        return ticket_price;
    }

    public void setTicket_price(int ticket_price) {
        this.ticket_price = ticket_price;
    }

    @Override
    public String toString() {
        return "Navigation{" +
                "navi_num=" + navi_num +
                ", flight_num='" + flight_num + '\'' +
                ", takeoff_time='" + takeoff_time + '\'' +
                ", rest_tickets=" + rest_tickets +
                ", ticket_price=" + ticket_price +
                '}';
    }
}
