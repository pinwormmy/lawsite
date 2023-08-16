package com.study.column.visitorCount;

import com.study.column.mapper.VisitorCountMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;

public class VisitorCountServcieImpl implements VisitorCountService {
    @Autowired
    private VisitorCountMapper visitorCountMapper;

    public void incrementVisitorCount() {
        LocalDate today = LocalDate.now();
        VisitorCountDTO visitorCount = visitorCountMapper.findByDate(today);

        if (visitorCount != null) {
            visitorCountMapper.incrementDailyCount(today);
        } else {
            int totalCount = visitorCountMapper.getTotalCount();
            visitorCountMapper.insertNewRecord(today, totalCount);
        }

        visitorCountMapper.incrementTotalCount();
    }

    public int getTotalCount() {
        return visitorCountMapper.getTotalCount();
    }

    public int getTodayCount() {
        LocalDate today = LocalDate.now();
        return visitorCountMapper.getTodayCount(today);
    }
}
