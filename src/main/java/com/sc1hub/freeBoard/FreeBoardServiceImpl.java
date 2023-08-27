package com.sc1hub.freeBoard;

import com.sc1hub.util.PageDTO;
import com.sc1hub.util.PageService;
import com.sc1hub.mapper.FreeBoardMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class FreeBoardServiceImpl implements FreeBoardService {
    @Autowired
    FreeBoardMapper FreeBoardMapper;
    @Override
    public List<FreeBoardDTO> showPostList(PageDTO page) throws Exception {
        return FreeBoardMapper.showPostList(page);
    }

    @Override
    public void submitPost(FreeBoardDTO board) throws Exception {
        FreeBoardMapper.submitPost(board);
    }

    @Override
    public FreeBoardDTO readPost(int postNum) throws Exception {
        return FreeBoardMapper.readPost(postNum);
    }

    @Override
    public void submitModifyPost(FreeBoardDTO post) throws Exception {
        FreeBoardMapper.submitModifyPost(post);
    }

    @Override
    public void deletePost(int postNum) throws Exception {
        FreeBoardMapper.deletePost(postNum);
    }

    @Override
    public PageDTO pageSetting(PageDTO page) throws Exception {
        checkPageAndKeyword(page);
        return utilLoadingForPage(page);
    }

    @Override
    public PageDTO commentPageSetting(PageDTO page) throws Exception {
        if(page.getRecentPage() < 1) { page.setRecentPage(1); }
        return utilLoadingForCommentPage(page);
    }

    private void checkPageAndKeyword(PageDTO page) {
        if(page.getRecentPage() < 1) { page.setRecentPage(1); }
        if(page.getSearchType() == null) { page.setSearchType("title"); }
        if(page.getKeyword() == null) { page.setKeyword(""); }
    }

    private PageDTO utilLoadingForPage(PageDTO page) throws Exception {
        log.debug("서비스단계에서 검색어 확인 : {}", page.getKeyword());
        page.setTotalPostCount(countTotalPost(page));
        PageService util = initPageUtil();
        return util.calculatePage(page);
    }

    private PageDTO utilLoadingForCommentPage(PageDTO page) throws Exception {
        page.setTotalPostCount(countTotalComment(page)); // 총댓글수 의미
        PageService util = initPageUtil();
        log.debug("서비스단계 댓글페이지 로직 확인 : {}", page);
        return util.calculatePage(page);
    }

    @Override
    public int countTotalPost(PageDTO page) throws Exception {
        return FreeBoardMapper.countTotalPost(page);
    }

    public int countTotalComment(PageDTO page) throws Exception {
        return FreeBoardMapper.countTotalComment(page);
    }

    private PageService initPageUtil() {
        PageService util = new PageService();
        util.setDISPLAY_POST_LIMIT(10);
        util.setPAGESET_LIMIT(10);
        return util;
    }

    @Override
    public void addComment(FreeBoardCommentDTO comment) throws Exception {
        FreeBoardMapper.addComment(comment);
    }

    @Override
    public List<FreeBoardCommentDTO> showCommentList(PageDTO page) throws Exception {
        return FreeBoardMapper.showCommentList(page);
    }

    @Override
    public void deleteComment(int commentNum) throws Exception {
        FreeBoardMapper.deleteComment(commentNum);
    }

    @Override
    public void updateCommentCount(int postNum) throws Exception {
        FreeBoardMapper.updateCommentCount(postNum);
    }

    @Override
    public void updateViews(int postNum) throws Exception {
        FreeBoardMapper.updateViews(postNum);
    }

    @Override
    public int checkViewUserIp(int postNum, String ip) throws Exception {
        return FreeBoardMapper.checkViewUserIp(postNum, ip);
    }

    @Override
    public void saveViewUserIp(int postNum, String ip) throws Exception {
        FreeBoardMapper.saveViewUserIp(postNum, ip);
    }

    @Override
    public List<FreeBoardDTO> showSelfNoticeList() throws Exception {
        return FreeBoardMapper.showSelfNoticeList();
    }

}
