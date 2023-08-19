package com.sc1hub.visitorCount;

public interface VisitorCountService {
    void incrementVisitorCount();
    int getTotalCount();
    int getTodayCount();
}
