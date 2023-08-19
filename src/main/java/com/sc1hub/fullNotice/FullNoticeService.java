package com.sc1hub.fullNotice;

import com.sc1hub.board.BoardDTO;
import com.sc1hub.library.LibraryDTO;
import com.sc1hub.openColumn.OpenColumnDTO;
import com.sc1hub.util.PageDTO;
import com.sc1hub.video.VideoDTO;

import java.util.List;

public interface FullNoticeService {
    List<BoardDTO> showBoardList() throws Exception;

    List<OpenColumnDTO> showOpencolumnList() throws Exception;

    List<VideoDTO> showVideoList() throws Exception;

    List<LibraryDTO> showLibraryList() throws Exception;

    void submitPost(FullNoticeDTO board) throws Exception;

    FullNoticeDTO readPost(int postNum) throws Exception;

    void submitModifyPost(FullNoticeDTO post) throws Exception;

    void deletePost(int postNum) throws Exception;

    PageDTO pageSetting(PageDTO page) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void addComment(FullNoticeCommentDTO comment) throws Exception;

    List<FullNoticeCommentDTO> showCommentList(PageDTO page) throws Exception;

    void deleteComment(int commentNum) throws Exception;

    void updateCommentCount(int postNum) throws Exception;

    void updateViews(int postNum) throws Exception;

    int checkViewUserIp(int postNum, String ip) throws Exception;

    void saveViewUserIp(int postNum, String ip) throws Exception;

    List<FullNoticeDTO> showSelfNoticeList() throws Exception;
}
