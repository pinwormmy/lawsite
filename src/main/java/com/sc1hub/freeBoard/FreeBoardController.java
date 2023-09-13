package com.sc1hub.freeBoard;

import com.sc1hub.board.AbstractBoardController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController extends AbstractBoardController<FreeBoardDTO, FreeBoardCommentDTO, FreeBoardRecommendDTO> {

    @Autowired
    private FreeBoardService freeBoardService;

    @Override
    protected FreeBoardService getBoardService() {
        return this.freeBoardService;
    }

    @Override
    protected String getBoardName() {
        return "freeBoard";
    }
}
