package com.sc1hub.board;

import com.sc1hub.mapper.BoardMapper;
import com.sc1hub.util.PageDTO;
import com.sc1hub.util.PageService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public abstract class AbstractBoardService<T, C, R extends RecommendDTO> implements BoardService<T, C, R> {

    protected abstract BoardMapper<T, C, R> getBoardMapper();

    @Override
    public List<T> showPostList(PageDTO page) throws Exception {
        return getBoardMapper().showPostList(page);
    }

    @Override
    public void submitPost(T board) throws Exception {
        getBoardMapper().submitPost(board);
    }

    @Override
    public T readPost(int postNum) throws Exception {
        return getBoardMapper().readPost(postNum);
    }

    @Override
    public void submitModifyPost(T post) throws Exception {
        getBoardMapper().submitModifyPost(post);
    }

    @Override
    public void deletePost(int postNum) throws Exception {
        getBoardMapper().deletePost(postNum);
    }

    @Override
    public PageDTO pageSetting(PageDTO page) throws Exception {
        checkPageAndKeyword(page);
        return utilLoadingForPage(page);
    }

    @Override
    public void addComment(C comment) throws Exception {
        getBoardMapper().addComment(comment);
    }

    @Override
    public List<C> showCommentList(PageDTO page) throws Exception {
        return getBoardMapper().showCommentList(page);
    }

    @Override
    public void deleteComment(int commentNum) throws Exception {
        getBoardMapper().deleteComment(commentNum);
    }

    @Override
    public void updateCommentCount(int postNum) throws Exception {
        getBoardMapper().updateCommentCount(postNum);
    }

    @Override
    public void updateViews(int postNum) throws Exception {
        getBoardMapper().updateViews(postNum);
    }

    @Override
    public int checkViewUserIp(int postNum, String ip) throws Exception {
        return getBoardMapper().checkViewUserIp(postNum, ip);
    }

    @Override
    public void saveViewUserIp(int postNum, String ip) throws Exception {
        getBoardMapper().saveViewUserIp(postNum, ip);
    }

    @Override
    public List<T> showSelfNoticeList() throws Exception {
        return getBoardMapper().showSelfNoticeList();
    }

    protected void checkPageAndKeyword(PageDTO page) {
        if(page.getRecentPage() < 1) { page.setRecentPage(1); }
        if(page.getSearchType() == null) { page.setSearchType("title"); }
        if(page.getKeyword() == null) { page.setKeyword(""); }
    }

    protected PageDTO utilLoadingForPage(PageDTO page) throws Exception {
        page.setTotalPostCount(countTotalPost(page));
        return initPageUtil().calculatePage(page);
    }

    protected PageDTO utilLoadingForCommentPage(PageDTO page) throws Exception {
        page.setTotalPostCount(countTotalComment(page));
        return initPageUtil().calculatePage(page);
    }

    public abstract int countTotalPost(PageDTO page) throws Exception;

    public abstract int countTotalComment(PageDTO page) throws Exception;

    protected PageService initPageUtil() {
        PageService util = new PageService();
        util.setDISPLAY_POST_LIMIT(10);
        util.setPAGESET_LIMIT(10);
        return util;
    }

    @Override
    @Transactional
    public void addRecommendation(R recommendDTO) {
        // 1. 사용자가 이미 해당 게시글을 추천했는지 확인
        int count = getBoardMapper().checkRecommendation(recommendDTO);
        if (count == 0) {
            // 2. 추천하지 않았다면, 추천 테이블에 데이터를 추가하고, 게시글의 추천 수를 증가
            getBoardMapper().insertRecommendation(recommendDTO);
            // 3. 게시글의 총 추천 수를 갱신
            updateRecommendCount(recommendDTO.getPostNum());
        }
    }

    @Override
    @Transactional
    public void cancelRecommendation(R recommendDTO) {
        // 1. 사용자가 이미 추천을 했는지 확인
        int recommendCount = getBoardMapper().checkRecommendation(recommendDTO);
        if (recommendCount == 0) {
            throw new RuntimeException("해당 게시글에 대한 추천이 없습니다.");
        }
        // 2. 추천을 했다면, 해당 추천을 데이터베이스에서 삭제
        getBoardMapper().deleteRecommendation(recommendDTO);
        // 3. 게시글의 총 추천 수를 갱신
        updateRecommendCount(recommendDTO.getPostNum());
    }

    private void updateRecommendCount(int postNum) {
        int actualRecommendCount = getBoardMapper().getActualRecommendCount(postNum);
        int currentRecommendCount = getBoardMapper().getRecommendCount(postNum);

        if (actualRecommendCount != currentRecommendCount) {
            getBoardMapper().updateTotalRecommendCount(postNum);
        }
    }


    @Override
    public int checkRecommendation(R recommendDTO) {
        return getBoardMapper().checkRecommendation(recommendDTO);
    }

    @Override
    public int getRecommendCount(int postNum) {
        return getBoardMapper().getRecommendCount(postNum);
    }

    @Override
    public PageDTO commentPageSetting(PageDTO page) throws Exception {
        checkPageAndKeyword(page);
        return utilLoadingForCommentPage(page);
    }

}


