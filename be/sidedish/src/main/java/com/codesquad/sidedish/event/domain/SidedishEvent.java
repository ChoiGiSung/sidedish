package com.codesquad.sidedish.event.domain;

import org.springframework.data.annotation.Id;

import java.util.HashSet;
import java.util.Set;

public class SidedishEvent {

    private static final int PERCENT_100 = 100;

    @Id
    private Long id;

    private String eventName;
    private String eventColor;
    private float eventSaleRate;

    private Set<SidedishEventItem> eventItems = new HashSet<>();

    public SidedishEvent(String eventName, String eventColor, int eventSaleRate) {
        this.eventName = eventName;
        this.eventColor = eventColor;
        this.eventSaleRate = eventSaleRate;
    }

    public int discount(int normalPrice) {
        return (int) (normalPrice * (eventSaleRate / PERCENT_100));
    }

    public Long getId() {
        return id;
    }

    public String getEventName() {
        return eventName;
    }

    public String getEventColor() {
        return eventColor;
    }

    public Set<SidedishEventItem> getEventItems() {
        return eventItems;
    }

    public float getEventSaleRate() {
        return eventSaleRate;
    }

    @Override
    public String toString() {
        return "SidedishEvent{" +
                "id=" + id +
                ", eventName='" + eventName + '\'' +
                ", eventColor='" + eventColor + '\'' +
                ", eventSaleRate=" + eventSaleRate +
                ", eventItems=" + eventItems +
                '}';
    }
}
