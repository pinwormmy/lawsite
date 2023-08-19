package com.sc1hub.mapper;

import com.sc1hub.board.BoardDTO;
import com.sc1hub.fullNotice.FullNoticeCommentDTO;
import com.sc1hub.fullNotice.FullNoticeDTO;
import com.sc1hub.openColumn.OpenColumnDTO;
import com.sc1hub.util.PageDTO;
import com.sc1hub.video.VideoDTO;
import com.sc1hub.library.LibraryDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FullNoticeMapper {
    List<BoardDTO> showBoardList() throws Exception;

    List<OpenColumnDTO> showOpencolumnList() throws Exception;

    List<VideoDTO> showVideoList() throws Exception;

    void submitPost(FullNoticeDTO board) throws Exception;

    void submitModifyPost(FullNoticeDTO board) throws Exception;

    FullNoticeDTO readPost(int postNum) throws Exception;

    void deletePost(int postNum) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void addComment(FullNoticeCommentDTO comment) throws Exception;

    List<FullNoticeCommentDTO> showCommentList(PageDTO page) throws Exception;

    void deleteComment(int commentNum) throws Exception;

    void updateCommentCount(int postNum) throws Exception;

    void updateViews(int postNum) throws Exception;

    int checkViewUserIp(@Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    void saveViewUserIp(@Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    List<FullNoticeDTO> showSelfNoticeList() throws Exception;

    List<LibraryDTO> showLibraryList() throws Exception;
}
