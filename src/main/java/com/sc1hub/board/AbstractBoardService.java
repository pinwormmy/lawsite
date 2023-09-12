package com.sc1hub.board;

import com.sc1hub.mapper.BoardMapper;
import com.sc1hub.util.PageDTO;
import com.sc1hub.util.PageService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public abstract class AbstractBoardService<T, C, R> implements BoardService<T, C, R> {

    @Autowired
    protected BoardMapper<T, C, R> boardMapper; // 공용 매퍼파일도 만들어야함
    // 추가로 컨트롤러랑 매퍼xml 구성 확인
    // db 구성은 어떻게 할지 파악하기

    @Override
    public List<T> showPostList(PageDTO page) throws Exception {
        return boardMapper.showPostList(page);
    }

    @Override
    public void submitPost(T board) throws Exception {
        boardMapper.submitPost(board);
    }

    @Override
    public T readPost(int postNum) throws Exception {
        return boardMapper.readPost(postNum);
    }

    @Override
    public void submitModifyPost(T post) throws Exception {
        boardMapper.submitModifyPost(post);
    }

    @Override
    public void deletePost(int postNum) throws Exception {
        boardMapper.deletePost(postNum);
    }

    @Override
    public PageDTO pageSetting(PageDTO page) throws Exception {
        checkPageAndKeyword(page);
        return utilLoadingForPage(page);
    }

    @Override
    public void addComment(C comment) throws Exception {
        boardMapper.addComment(comment);
    }

    @Override
    public List<C> showCommentList(PageDTO page) throws Exception {
        return boardMapper.showCommentList(page);
    }

    @Override
    public void deleteComment(int commentNum) throws Exception {
        boardMapper.deleteComment(commentNum);
    }

    @Override
    public void updateCommentCount(int postNum) throws Exception {
        boardMapper.updateCommentCount(postNum);
    }

    @Override
    public void updateViews(int postNum) throws Exception {
        boardMapper.updateViews(postNum);
    }

    @Override
    public int checkViewUserIp(int postNum, String ip) throws Exception {
        return boardMapper.checkViewUserIp(postNum, ip);
    }

    @Override
    public void saveViewUserIp(int postNum, String ip) throws Exception {
        boardMapper.saveViewUserIp(postNum, ip);
    }

    @Override
    public List<T> showSelfNoticeList() throws Exception {
        return boardMapper.showSelfNoticeList();
    }

    protected void checkPageAndKeyword(PageDTO page) {
        if(page.getRecentPage() < 1) { page.setRecentPage(1); }
        if(page.getSearchType() == null) { page.setSearchType("title"); }
        if(page.getKeyword() == null) { page.setKeyword(""); }
    }

    protected PageDTO utilLoadingForPage(PageDTO page) throws Exception {
        page.setTotalPostCount(countTotalPost(page));
        PageService util = initPageUtil();
        return util.calculatePage(page);
    }

    protected abstract PageService initPageUtil();
}

