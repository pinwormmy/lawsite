package com.lawsite.board;

import com.lawsite.util.PageDTO;
import java.util.List;

public interface BoardService {

    List<BoardDTO> showPostList(String boardTitle, PageDTO page) throws Exception;

    void submitPost(String boardTitle, BoardDTO board) throws Exception;

    BoardDTO readPost(String boardTitle, int postNum) throws Exception;

    void submitModifyPost(String boardTitle, BoardDTO post) throws Exception;

    void deletePost(String boardTitle, int postNum) throws Exception;

    PageDTO pageSetting(String boardTitle, PageDTO page) throws Exception;

    void addComment(String boardTitle, CommentDTO comment) throws Exception;

    List<CommentDTO> showCommentList(String boardTitle, PageDTO page) throws Exception;

    void deleteComment(String boardTitle, int commentNum) throws Exception;

    void updateCommentCount(String boardTitle, int postNum) throws Exception;

    void updateViews(String boardTitle, int postNum) throws Exception;

    int checkViewUserIp(String boardTitle, int postNum, String ip) throws Exception;

    void saveViewUserIp(String boardTitle, int postNum, String ip) throws Exception;

    List<BoardDTO> showSelfNoticeList(String boardTitle) throws Exception;

    int countTotalPost(String boardTitle, PageDTO page) throws Exception;

    int countTotalComment(String boardTitle, PageDTO page) throws Exception;

    int checkRecommendation(String boardTitle, RecommendDTO recommendDTO);

    void insertRecommendation(String boardTitle, RecommendDTO recommendDTO);

    void deleteRecommendation(String boardTitle, RecommendDTO recommendDTO);

    int getRecommendCount(String boardTitle, int postNum);

    int getActualRecommendCount(String boardTitle, int postNum);

    PageDTO commentPageSetting(String boardTitle, PageDTO page) throws Exception;

    List<BoardListDTO> getBoardList();

    String getKoreanTitle(String boardTitle);

    List<LatestPostDTO> showLatestPosts();
}
