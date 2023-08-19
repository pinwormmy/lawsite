package com.sc1hub.visitorCount;

import lombok.Data;

import java.time.LocalDate;

@Data
public class VisitorCountDTO {

    private Long id;
    private LocalDate date;
    private int dailyCount;
    private int totalCount;
}
