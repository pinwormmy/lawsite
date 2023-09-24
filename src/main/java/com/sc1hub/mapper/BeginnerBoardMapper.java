package com.sc1hub.mapper;

import com.sc1hub.beginnerBoard.BeginnerBoardCommentDTO;
import com.sc1hub.beginnerBoard.BeginnerBoardDTO;
import com.sc1hub.beginnerBoard.BeginnerBoardRecommendDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BeginnerBoardMapper extends BoardMapper<BeginnerBoardDTO, BeginnerBoardCommentDTO, BeginnerBoardRecommendDTO> {
    // 초보자마당에만 특화된 메서드들을 여기에 추가합니다.
}
