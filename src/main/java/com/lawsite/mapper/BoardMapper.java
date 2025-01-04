package com.lawsite.mapper;

import com.lawsite.board.*;
import com.lawsite.util.PageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {

    List<BoardDTO> showPostList(@Param("boardTitle") String boardTitle, @Param("page") PageDTO page) throws Exception;

    void submitPost(@Param("boardTitle") String boardTitle, @Param("board") BoardDTO board) throws Exception;

    void submitModifyPost(@Param("boardTitle") String boardTitle, @Param("board") BoardDTO board) throws Exception;

    BoardDTO readPost(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum) throws Exception;

    void deletePost(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum) throws Exception;

    int countTotalPost(@Param("boardTitle") String boardTitle, @Param("page") PageDTO page) throws Exception;

    void addComment(@Param("boardTitle") String boardTitle, @Param("comment") CommentDTO comment) throws Exception;

    List<CommentDTO> showCommentList(@Param("boardTitle") String boardTitle, @Param("page") PageDTO page) throws Exception;

    void deleteComment(@Param("boardTitle") String boardTitle, @Param("commentNum") int commentNum) throws Exception;

    void updateCommentCount(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum) throws Exception;

    void updateViews(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum) throws Exception;

    int checkViewUserIp(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    void saveViewUserIp(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    List<BoardDTO> showSelfNoticeList(@Param("boardTitle") String boardTitle) throws Exception;

    int countTotalComment(@Param("boardTitle") String boardTitle, @Param("page") PageDTO page) throws Exception;

    int checkRecommendation(@Param("boardTitle") String boardTitle, @Param("recommendDTO") RecommendDTO recommendDTO);

    void insertRecommendation(@Param("boardTitle") String boardTitle, @Param("recommendDTO") RecommendDTO recommendDTO);

    void deleteRecommendation(@Param("boardTitle") String boardTitle, @Param("recommendDTO") RecommendDTO recommendDTO);

    void updateTotalRecommendCount(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum);

    int getRecommendCount(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum);

    int getActualRecommendCount(@Param("boardTitle") String boardTitle, @Param("postNum") int postNum);

    List<BoardListDTO> getBoardList();

    String getKoreanTitle(String boardTitle);

    List<LatestPostDTO> showLatestPosts();
}

