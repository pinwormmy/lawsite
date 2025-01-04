package com.lawsite.board;

import lombok.Data;

@Data
public class RecommendDTO {
    private int recommendId;
    private String userId;
    private int postNum;
    private boolean checkRecommend;
}
