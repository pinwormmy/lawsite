package com.sc1hub.mapper;

import com.sc1hub.fullNotice.FullNoticeDTO;
import com.sc1hub.util.PageDTO;
import com.sc1hub.library.LibraryDTO;
import com.sc1hub.library.LibraryCommentDTO;
import com.sc1hub.library.LibraryFileDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LibraryMapper {
    List<LibraryDTO> showPostList(PageDTO page) throws Exception;

    void submitPost(LibraryDTO board) throws Exception;

    void submitModifyPost(LibraryDTO board) throws Exception;

    LibraryDTO readPost(int postNum) throws Exception;

    void deletePost(int postNum) throws Exception;

    int countTotalPost(PageDTO page) throws Exception;

    void addComment(LibraryCommentDTO comment) throws Exception;

    List<LibraryCommentDTO> showCommentList(PageDTO page) throws Exception;

    void deleteComment(int commentNum) throws Exception;

    void updateCommentCount(int postNum) throws Exception;

    void updateViews(int postNum) throws Exception;

    int checkViewUserIp(@Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    void saveViewUserIp(@Param("postNum") int postNum, @Param("ip") String ip) throws Exception;

    List<LibraryDTO> showSelfNoticeList() throws Exception;

    List<FullNoticeDTO> showFullNoticeList() throws Exception;

    int countTotalComment(PageDTO page) throws Exception;

    int getRecentPostNum() throws Exception;

    void insertBoardFileList(List<LibraryFileDTO> fileList) throws Exception;

    List<LibraryFileDTO> showFileListInPost(int postNum) throws Exception;

    void deleteFileList(int postNum) throws Exception;
}
