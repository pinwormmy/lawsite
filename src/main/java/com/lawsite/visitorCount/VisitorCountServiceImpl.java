package com.lawsite.visitorCount;

import com.lawsite.mapper.VisitorCountMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Slf4j
@Service
public class VisitorCountServiceImpl implements VisitorCountService {
    @Autowired
    private VisitorCountMapper visitorCountMapper;

    @Transactional
    public void incrementVisitorCount() {
        LocalDate today = LocalDate.now();
        VisitorCountDTO visitorCount = visitorCountMapper.findByDate(today);

        Integer totalCount = visitorCountMapper.getTotalCount();
        if (totalCount == null) {
            totalCount = 0;
        }

        if (visitorCount != null) {
            visitorCountMapper.incrementDailyCount(today);
        } else {
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
