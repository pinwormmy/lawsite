package com.sc1hub.board;

import com.sc1hub.mapper.BoardMapper;
import com.sc1hub.util.PageDTO;
import com.sc1hub.util.PageService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    BoardMapper boardMapper;

    @Override
    public List<BoardDTO> showPostList(String boardTitle, PageDTO page) throws Exception {
        return boardMapper.showPostList(boardTitle, page);
    }

    @Override
    public void submitPost(String boardTitle, BoardDTO board) throws Exception {
        boardMapper.submitPost(boardTitle, board);
    }

    @Override
    public BoardDTO readPost(String boardTitle, int postNum) throws Exception {
        return boardMapper.readPost(boardTitle, postNum);
    }

    @Override
    public void submitModifyPost(String boardTitle, BoardDTO post) throws Exception {
        boardMapper.submitModifyPost(boardTitle, post);
    }

    @Override
    public void deletePost(String boardTitle, int postNum) throws Exception {
        boardMapper.deletePost(boardTitle, postNum);
    }

    @Override
    public PageDTO pageSetting(String boardTitle, PageDTO page) throws Exception {
        checkPageAndKeyword(page);
        return utilLoadingForPage(boardTitle, page);
    }

    @Override
    public void addComment(String boardTitle, CommentDTO comment) throws Exception {
        boardMapper.addComment(boardTitle, comment);
    }

    @Override
    public List<CommentDTO> showCommentList(String boardTitle, PageDTO page) throws Exception {
        return boardMapper.showCommentList(boardTitle, page);
    }

    @Override
    public void deleteComment(String boardTitle, int commentNum) throws Exception {
        boardMapper.deleteComment(boardTitle, commentNum);
    }

    @Override
    public void updateCommentCount(String boardTitle, int postNum) throws Exception {
        boardMapper.updateCommentCount(boardTitle, postNum);
    }

    @Override
    public void updateViews(String boardTitle, int postNum) throws Exception {
        boardMapper.updateViews(boardTitle, postNum);
    }

    @Override
    public int checkViewUserIp(String boardTitle, int postNum, String ip) throws Exception {
        return boardMapper.checkViewUserIp(boardTitle, postNum, ip);
    }

    @Override
    public void saveViewUserIp(String boardTitle, int postNum, String ip) throws Exception {
        boardMapper.saveViewUserIp(boardTitle, postNum, ip);
    }

    @Override
    public List<BoardDTO> showSelfNoticeList(String boardTitle) throws Exception {
        return boardMapper.showSelfNoticeList(boardTitle);
    }

    @Override
    public int countTotalPost(String boardTitle, PageDTO page) throws Exception {
        return boardMapper.countTotalPost(boardTitle, page);
    }

    @Override
    public int countTotalComment(String boardTitle, PageDTO page) throws Exception {
        return boardMapper.countTotalComment(boardTitle, page);
    }

    @Override
    public int checkRecommendation(String boardTitle, RecommendDTO recommendDTO) {
        return boardMapper.checkRecommendation(boardTitle, recommendDTO);
    }

    @Override
    public void insertRecommendation(String boardTitle, RecommendDTO recommendDTO) {
        boardMapper.insertRecommendation(boardTitle, recommendDTO);
    }

    @Override
    public void deleteRecommendation(String boardTitle, RecommendDTO recommendDTO) {
        boardMapper.deleteRecommendation(boardTitle, recommendDTO);
    }

    @Override
    public void updateTotalRecommendCount(String boardTitle, int postNum) {
        boardMapper.updateTotalRecommendCount(boardTitle, postNum);
    }

    @Override
    public int getRecommendCount(String boardTitle, int postNum) {
        return boardMapper.getRecommendCount(boardTitle, postNum);
    }

    @Override
    public int getActualRecommendCount(String boardTitle, int postNum) {
        return boardMapper.getActualRecommendCount(boardTitle, postNum);
    }

    @Override
    public PageDTO commentPageSetting(String boardTitle, PageDTO page) throws Exception {
        checkPageAndKeyword(page);
        return utilLoadingForCommentPage(boardTitle, page);
    }

    // 나머지 유틸리티 메서드들
    protected void checkPageAndKeyword(PageDTO page) {
        if(page.getRecentPage() < 1) { page.setRecentPage(1); }
        if(page.getSearchType() == null) { page.setSearchType("title"); }
        if(page.getKeyword() == null) { page.setKeyword(""); }
    }

    protected PageDTO utilLoadingForPage(String boardTitle, PageDTO page) throws Exception {
        page.setTotalPostCount(countTotalPost(boardTitle, page));
        return initPageUtil().calculatePage(page);
    }

    protected PageDTO utilLoadingForCommentPage(String boardTitle, PageDTO page) throws Exception {
        page.setTotalPostCount(countTotalComment(boardTitle, page));
        return initPageUtil().calculatePage(page);
    }

    protected PageService initPageUtil() {
        PageService util = new PageService();
        util.setDISPLAY_POST_LIMIT(10);
        util.setPAGESET_LIMIT(10);
        return util;
    }
}
