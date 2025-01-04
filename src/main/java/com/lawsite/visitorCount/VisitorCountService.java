package com.lawsite.visitorCount;

public interface VisitorCountService {
    void incrementVisitorCount();
    int getTotalCount();
    int getTodayCount();
}
