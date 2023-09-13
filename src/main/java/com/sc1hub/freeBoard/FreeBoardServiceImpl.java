package com.sc1hub.freeBoard;

import com.sc1hub.board.AbstractBoardService;
import com.sc1hub.mapper.BoardMapper;
import com.sc1hub.mapper.FreeBoardMapper;
import com.sc1hub.util.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl extends AbstractBoardService<FreeBoardDTO, FreeBoardCommentDTO, FreeBoardRecommendDTO> implements FreeBoardService {

    @Autowired
    private FreeBoardMapper freeBoardMapper;

    @Override
    public BoardMapper<FreeBoardDTO, FreeBoardCommentDTO, FreeBoardRecommendDTO> getBoardMapper() {
        return freeBoardMapper;
    }
    @Override
    public int countTotalPost(PageDTO page) throws Exception {
        return freeBoardMapper.countTotalPost(page);
    }

    @Override
    public int countTotalComment(PageDTO page) throws Exception {
        return freeBoardMapper.countTotalComment(page);
    }
}
