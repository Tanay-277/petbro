package com.pet.pet;

import java.util.Date;

public class Event {
    private int id; // Assuming id is an integer
    private Date date; // Use java.util.Date
    private String pet;
    private String venue;
    private String healthCheckup;
    private String grooming;
    private String training;
    private String reminder;

    // Constructor
    public Event(int id, Date date, String pet, String venue, String healthCheckup, String grooming, String training, String reminder) {
        this.id = id;
        this.date = date;
        this.pet = pet;
        this.venue = venue;
        this.healthCheckup = healthCheckup;
        this.grooming = grooming;
        this.training = training;
        this.reminder = reminder;
    }

    // Getters (and setters if needed)
    public int getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    public String getPet() {
        return pet;
    }

    public String getVenue() {
        return venue;
    }

    public String getHealthCheckup() {
        return healthCheckup;
    }

    public String getGrooming() {
        return grooming;
    }

    public String getTraining() {
        return training;
    }

    public String getReminder() {
        return reminder;
    }
}
