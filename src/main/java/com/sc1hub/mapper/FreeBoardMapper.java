package com.sc1hub.mapper;

import com.sc1hub.freeBoard.FreeBoardCommentDTO;
import com.sc1hub.freeBoard.FreeBoardDTO;
import com.sc1hub.util.PageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FreeBoardMapper {
    List<FreeBoardDTO> showPostList(PageDTO page) throws Exception;

    void submitPost(FreeBoardDTO board) throws Exception;

    void submitModifyPost(FreeBoardDTO postNum) throws Exception;

    FreeBoardDTO readPost(int postNum) throws Exception;

    void deletePost(int postNum) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void addComment(FreeBoardCommentDTO comment) throws Exception;

    List<FreeBoardCommentDTO> showCommentList(PageDTO page) throws Exception;

    void deleteComment(int commentNum) throws Exception;

    void updateCommentCount(int postNum) throws Exception;

    void updateViews(int postNum) throws Exception;

    int checkViewUserIp(@Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    void saveViewUserIp(@Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    List<FreeBoardDTO> showSelfNoticeList() throws Exception;

    int countTotalComment(PageDTO page) throws Exception;

    int checkRecommendation(int postNum, String userId);

    void insertRecommendation(int postNum, String userId);

    void increaseRecommendationCount(int postNum);

    void deleteRecommendation(int postNum, String userId);

    void decreaseRecommendationCount(int postNum);

    void updateTotalRecommendCount(int postNum);
}
