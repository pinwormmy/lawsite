package com.sc1hub.beginnerBoard;

import com.sc1hub.board.BoardService;
import com.sc1hub.util.PageDTO;

public interface BeginnerBoardService extends BoardService<BeginnerBoardDTO, BeginnerBoardCommentDTO, BeginnerBoardRecommendDTO> {

    int countTotalPost(PageDTO page) throws Exception;

    int countTotalComment(PageDTO page) throws Exception;
}
