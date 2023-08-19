package com.sc1hub.mapper;

import com.sc1hub.board.BoardDTO;
import com.sc1hub.board.PostCommentDTO;
import com.sc1hub.board.ViewsDetailDTO;
import com.sc1hub.fullNotice.FullNoticeDTO;
import com.sc1hub.util.PageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardDTO> showPostList(PageDTO page) throws Exception;

    void submitPost(BoardDTO board) throws Exception;

    void submitModifyPost(BoardDTO board) throws Exception;

    BoardDTO readPost(int postNum) throws Exception;

    void deletePost(int postNum) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void addComment(PostCommentDTO comment) throws Exception;

    List<PostCommentDTO> showCommentList(PageDTO page) throws Exception;

    void deleteComment(int commentNum) throws Exception;

    void updateCommentCount(int postNum) throws Exception;

    void updateViews(int postNum) throws Exception;

    int checkViewUserIp(ViewsDetailDTO viewsDetailDTO) throws Exception;

    void saveViewUserIp(ViewsDetailDTO viewsDetailDTO) throws Exception;

    List<BoardDTO> showSelfNoticeList() throws Exception;

    List<FullNoticeDTO> showFullNoticeList() throws Exception;

    int countTotalComment(PageDTO page) throws Exception;

    List<ViewsDetailDTO> getViewsDetailsByPostNum(int postNum);
}
