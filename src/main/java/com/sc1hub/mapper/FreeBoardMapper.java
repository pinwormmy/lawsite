package com.sc1hub.mapper;

import com.sc1hub.freeBoard.FreeBoardCommentDTO;
import com.sc1hub.freeBoard.FreeBoardDTO;
import com.sc1hub.freeBoard.FreeBoardRecommendDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FreeBoardMapper extends BoardMapper<FreeBoardDTO, FreeBoardCommentDTO, FreeBoardRecommendDTO> {
    // 자유게시판에만 특화된 메서드들을 여기에 추가합니다.
}
