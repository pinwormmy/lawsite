package com.sc1hub.board;

import com.sc1hub.mapper.BoardMapper;
import com.sc1hub.util.PageDTO;
import com.sc1hub.util.PageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardMapper boardMapper;

    @Override
    public List<BoardDTO> showPostList(String boardTitle, PageDTO page) throws Exception {
        log.debug("showPostList 작동 테스트입니다.");
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
    @Transactional
    public void insertRecommendation(String boardTitle, RecommendDTO recommendDTO) {
        // 1. 사용자가 이미 해당 게시글을 추천했는지 확인
        int count = boardMapper.checkRecommendation(boardTitle, recommendDTO);
        if (count == 0) {
            // 2. 추천하지 않았다면, 추천 테이블에 데이터를 추가
            boardMapper.insertRecommendation(boardTitle, recommendDTO);
            // 3. 게시글의 총 추천 수를 갱신
            updateRecommendCount(boardTitle, recommendDTO.getPostNum());
        } else {
            throw new RuntimeException("이미 추천한 게시글입니다.");
        }
    }


    @Override
    @Transactional
    public void deleteRecommendation(String boardTitle, RecommendDTO recommendDTO) {
        // 1. 사용자가 이미 추천을 했는지 확인
        int recommendCount = boardMapper.checkRecommendation(boardTitle, recommendDTO);
        if (recommendCount == 0) {
            throw new RuntimeException("해당 게시글에 대한 추천이 없습니다.");
        }
        // 2. 추천을 했다면, 해당 추천을 데이터베이스에서 삭제
        boardMapper.deleteRecommendation(boardTitle, recommendDTO);
        // 3. 게시글의 총 추천 수를 갱신
        updateRecommendCount(boardTitle, recommendDTO.getPostNum());
    }

    private void updateRecommendCount(String boardTitle, int postNum) {
        int actualRecommendCount = getActualRecommendCount(boardTitle, postNum);
        int currentRecommendCount = getRecommendCount(boardTitle, postNum);

        if (actualRecommendCount != currentRecommendCount) {
            updateTotalRecommendCount(boardTitle, postNum);
        }
    }

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

    @Override
    public List<BoardListDTO> getBoardList() {
        return boardMapper.getBoardList();
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
