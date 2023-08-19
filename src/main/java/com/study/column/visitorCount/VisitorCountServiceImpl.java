package com.study.column.visitorCount;

import com.study.column.mapper.VisitorCountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class VisitorCountServiceImpl implements VisitorCountService {
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
        Integer totalCount = visitorCountMapper.getTotalCount();
        return totalCount != null ? totalCount : 0; // null 체크
    }
    public int getTodayCount() {
        LocalDate today = LocalDate.now();
        Integer todayCount = visitorCountMapper.getTodayCount(today);
        return todayCount != null ? todayCount : 0; // null 체크
    }
}
