package com.sc1hub.beginnerBoard;

import com.sc1hub.board.AbstractBoardService;
import com.sc1hub.mapper.BoardMapper;
import com.sc1hub.mapper.BeginnerBoardMapper;
import com.sc1hub.util.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BeginnerBoardServiceImpl extends AbstractBoardService<BeginnerBoardDTO, BeginnerBoardCommentDTO, BeginnerBoardRecommendDTO> implements BeginnerBoardService {

    @Autowired
    private BeginnerBoardMapper beginnerBoardMapper;

    @Override
    public BoardMapper<BeginnerBoardDTO, BeginnerBoardCommentDTO, BeginnerBoardRecommendDTO> getBoardMapper() {
        return beginnerBoardMapper;
    }
    @Override
    public int countTotalPost(PageDTO page) throws Exception {
        return beginnerBoardMapper.countTotalPost(page);
    }

    @Override
    public int countTotalComment(PageDTO page) throws Exception {
        return beginnerBoardMapper.countTotalComment(page);
    }
}
