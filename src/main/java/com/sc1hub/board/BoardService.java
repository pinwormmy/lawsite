package com.sc1hub.board;

import com.sc1hub.util.PageDTO;
import java.util.List;

public interface BoardService<T, R, C> {
    List<T> showPostList(PageDTO page) throws Exception;
    void submitPost(T board) throws Exception;
    T readPost(int postNum) throws Exception;
    void submitModifyPost(T post) throws Exception;
    void deletePost(int postNum) throws Exception;
    PageDTO pageSetting(PageDTO page) throws Exception;
    void addRecommendation(R recommendDTO);
    void cancelRecommendation(R recommendDTO) throws Exception;
    int checkRecommendation(R recommendDTO);
    int getRecommendCount(int postNum);
    void addComment(C comment) throws Exception;
    List<C> showCommentList(PageDTO page) throws Exception;
    void deleteComment(int commentNum) throws Exception;
    void updateCommentCount(int postNum) throws Exception;
    void updateViews(int postNum) throws Exception;
    int checkViewUserIp(int postNum, String ip) throws Exception;
    void saveViewUserIp(int postNum, String ip) throws Exception;
    List<T> showSelfNoticeList() throws Exception;
    PageDTO commentPageSetting(PageDTO page) throws Exception;
}
