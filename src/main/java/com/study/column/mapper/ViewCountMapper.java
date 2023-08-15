package com.study.column.mapper;

import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;

public interface ViewCountMapper {
    ViewCount findByDate(@Param("date") LocalDate date);
    void incrementCount(@Param("date") LocalDate date);
    void incrementTotalCount();
    void insertNewRecord(@Param("date") LocalDate date);
    int getTotalCount();
    int getTodayCount(@Param("date") LocalDate date);
}

