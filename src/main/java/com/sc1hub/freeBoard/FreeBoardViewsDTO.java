package com.sc1hub.freeBoard;

import lombok.Data;

import java.util.Date;

@Data
public class FreeBoardViewsDTO {
    private int postNum;
    private String ip;
    private Date regDate;
}
