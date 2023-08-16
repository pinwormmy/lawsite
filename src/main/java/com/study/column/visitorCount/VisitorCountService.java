package com.study.column.visitorCount;

public interface VisitorCountService {
    void incrementVisitorCount();
    int getTotalCount();
    int getTodayCount();
}
