package com.sc1hub.freeBoard;

import com.sc1hub.board.BoardService;
import com.sc1hub.util.PageDTO;

public interface FreeBoardService extends BoardService<FreeBoardDTO, FreeBoardCommentDTO, FreeBoardRecommendDTO> {

    int countTotalPost(PageDTO page) throws Exception;

    int countTotalComment(PageDTO page) throws Exception;
}
