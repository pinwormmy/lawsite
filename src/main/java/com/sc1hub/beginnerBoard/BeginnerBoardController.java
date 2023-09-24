package com.sc1hub.beginnerBoard;

import com.sc1hub.board.AbstractBoardController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/beginnerBoard")
public class BeginnerBoardController extends AbstractBoardController<BeginnerBoardDTO, BeginnerBoardCommentDTO, BeginnerBoardRecommendDTO> {

    @Autowired
    private BeginnerBoardService beginnerBoardService;

    @Override
    protected BeginnerBoardService getBoardService() {
        return this.beginnerBoardService;
    }

    @Override
    protected String getBoardName() {
        return "beginnerBoard";
    }
}
