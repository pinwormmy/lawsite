package com.study.column.mapper;

import com.study.column.visitorCount.VisitorCountDTO;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;

public interface VisitorCountMapper {
    VisitorCountDTO findByDate(@Param("date") LocalDate date);
    void incrementDailyCount(@Param("date") LocalDate date);
    void incrementTotalCount();
    void insertNewRecord(@Param("date") LocalDate date, @Param("totalCount") int totalCount);
    Integer getTotalCount();
    Integer getTodayCount(@Param("date") LocalDate date);
}


