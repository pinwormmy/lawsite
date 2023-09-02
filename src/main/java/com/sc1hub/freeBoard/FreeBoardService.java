package com.sc1hub.freeBoard;

import com.sc1hub.util.PageDTO;

import java.util.List;

public interface FreeBoardService {
    List<FreeBoardDTO> showPostList(PageDTO page) throws Exception;

    void submitPost(FreeBoardDTO board) throws Exception;

    FreeBoardDTO readPost(int postNum) throws Exception;

    void submitModifyPost(FreeBoardDTO post) throws Exception;

    void deletePost(int postNum) throws Exception;

    PageDTO pageSetting(PageDTO page) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void addComment(FreeBoardCommentDTO comment) throws Exception;

    List<FreeBoardCommentDTO> showCommentList(PageDTO page) throws Exception;

    void deleteComment(int commentNum) throws Exception;

    void updateCommentCount(int postNum) throws Exception;

    void updateViews(int postNum) throws Exception;

    int checkViewUserIp(int postNum, String ip) throws Exception;

    void saveViewUserIp(int postNum, String ip) throws Exception;

    List<FreeBoardDTO> showSelfNoticeList() throws Exception;


    PageDTO commentPageSetting(PageDTO page) throws Exception;

    void addRecommendation(int postNum, String userId);
}
