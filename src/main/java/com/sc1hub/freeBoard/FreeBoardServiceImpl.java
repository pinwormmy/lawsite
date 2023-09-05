package com.sc1hub.freeBoard;

import com.sc1hub.mapper.FreeBoardMapper;
import com.sc1hub.util.PageDTO;
import com.sc1hub.util.PageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class FreeBoardServiceImpl implements FreeBoardService {
    @Autowired
    FreeBoardMapper freeBoardMapper;
    @Override
    public List<FreeBoardDTO> showPostList(PageDTO page) throws Exception {
        return freeBoardMapper.showPostList(page);
    }

    @Override
    public void submitPost(FreeBoardDTO board) throws Exception {
        freeBoardMapper.submitPost(board);
    }

    @Override
    public FreeBoardDTO readPost(int postNum) throws Exception {
        return freeBoardMapper.readPost(postNum);
    }

    @Override
    public void submitModifyPost(FreeBoardDTO post) throws Exception {
        freeBoardMapper.submitModifyPost(post);
    }

    @Override
    public void deletePost(int postNum) throws Exception {
        freeBoardMapper.deletePost(postNum);
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

    @Override
    @Transactional
    public void addRecommendation(FreeBoardRecommendDTO recommendDTO) {
        // 1. 사용자가 이미 해당 게시글을 추천했는지 확인
        int count = freeBoardMapper.checkRecommendation(recommendDTO);

        if (count == 0) {
            // 2. 추천하지 않았다면, 추천 테이블에 데이터를 추가하고, 게시글의 추천 수를 증가
            freeBoardMapper.insertRecommendation(recommendDTO);
            freeBoardMapper.increaseRecommendationCount(recommendDTO.getPostNum());
        } else {
            // 3. 이미 추천했다면, 추천을 취소하고 게시글의 추천 수를 감소
            freeBoardMapper.deleteRecommendation(recommendDTO);
            freeBoardMapper.decreaseRecommendationCount(recommendDTO.getPostNum());
        }
    }

    @Override
    public void cancelRecommendation(FreeBoardRecommendDTO recommendDTO) throws Exception {
        // 1. 사용자가 이미 추천을 했는지 확인
        int recommendCount = freeBoardMapper.checkRecommendation(recommendDTO);
        if (recommendCount == 0) {
            throw new Exception("해당 게시글에 대한 추천이 없습니다.");
        }

        // 2. 추천을 했다면, 해당 추천을 데이터베이스에서 삭제
        freeBoardMapper.deleteRecommendation(recommendDTO);

        // 3. 게시글의 총 추천 수를 갱신
        freeBoardMapper.updateTotalRecommendCount(recommendDTO.getPostNum());
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
        return freeBoardMapper.countTotalPost(page);
    }

    public int countTotalComment(PageDTO page) throws Exception {
        return freeBoardMapper.countTotalComment(page);
    }

    private PageService initPageUtil() {
        PageService util = new PageService();
        util.setDISPLAY_POST_LIMIT(10);
        util.setPAGESET_LIMIT(10);
        return util;
    }

    @Override
    public void addComment(FreeBoardCommentDTO comment) throws Exception {
        freeBoardMapper.addComment(comment);
    }

    @Override
    public List<FreeBoardCommentDTO> showCommentList(PageDTO page) throws Exception {
        return freeBoardMapper.showCommentList(page);
    }

    @Override
    public void deleteComment(int commentNum) throws Exception {
        freeBoardMapper.deleteComment(commentNum);
    }

    @Override
    public void updateCommentCount(int postNum) throws Exception {
        freeBoardMapper.updateCommentCount(postNum);
    }

    @Override
    public void updateViews(int postNum) throws Exception {
        freeBoardMapper.updateViews(postNum);
    }

    @Override
    public int checkViewUserIp(int postNum, String ip) throws Exception {
        return freeBoardMapper.checkViewUserIp(postNum, ip);
    }

    @Override
    public void saveViewUserIp(int postNum, String ip) throws Exception {
        freeBoardMapper.saveViewUserIp(postNum, ip);
    }

    @Override
    public List<FreeBoardDTO> showSelfNoticeList() throws Exception {
        return freeBoardMapper.showSelfNoticeList();
    }

}
