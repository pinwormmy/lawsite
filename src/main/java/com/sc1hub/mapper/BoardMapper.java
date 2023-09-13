package com.sc1hub.mapper;

import com.sc1hub.util.PageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper<T, C, R> {

    List<T> showPostList(PageDTO page) throws Exception;

    void submitPost(T board) throws Exception;

    void submitModifyPost(T postNum) throws Exception;

    T readPost(int postNum) throws Exception;

    void deletePost(int postNum) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void addComment(C comment) throws Exception;

    List<C> showCommentList(PageDTO page) throws Exception;

    void deleteComment(int commentNum) throws Exception;

    void updateCommentCount(int postNum) throws Exception;

    void updateViews(int postNum) throws Exception;

    int checkViewUserIp(@Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    void saveViewUserIp(@Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    List<T> showSelfNoticeList() throws Exception;

    int countTotalComment(PageDTO page) throws Exception;

    int checkRecommendation(R recommendDTO);

    void insertRecommendation(R recommendDTO);

    void deleteRecommendation(R recommendDTO);

    void updateTotalRecommendCount(int postNum);

    int getRecommendCount(int postNum);

    int getActualRecommendCount(int postNum);

}
