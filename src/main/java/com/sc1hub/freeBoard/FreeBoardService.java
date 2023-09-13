package com.sc1hub.freeBoard;

import com.sc1hub.util.PageDTO;

public interface FreeBoardService {

    int countTotalPost(PageDTO page) throws Exception;

    int countTotalComment(PageDTO page) throws Exception;
}
