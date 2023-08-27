package com.sc1hub.video;

import com.sc1hub.util.PageDTO;

import java.util.List;

public interface VideoService {
    List<VideoDTO> showPostList(PageDTO page) throws Exception;

    void submitPost(VideoDTO board) throws Exception;

    VideoDTO readPost(int postNum) throws Exception;

    void submitModifyPost(VideoDTO post) throws Exception;

    void deletePost(int postNum) throws Exception;

    PageDTO pageSetting(PageDTO page) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void addComment(VideoCommentDTO comment) throws Exception;

    List<VideoCommentDTO> showCommentList(PageDTO page) throws Exception;

    void deleteComment(int commentNum) throws Exception;

    void updateCommentCount(int postNum) throws Exception;

    void updateViews(int postNum) throws Exception;

    int checkViewUserIp(int postNum, String ip) throws Exception;

    void saveViewUserIp(int postNum, String ip) throws Exception;

    List<VideoDTO> showSelfNoticeList() throws Exception;

}
