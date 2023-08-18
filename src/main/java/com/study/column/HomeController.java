package com.study.column;

import com.study.column.board.BoardService;
import com.study.column.library.LibraryService;
import com.study.column.openColumn.OpenColumnService;
import com.study.column.util.PageDTO;
import com.study.column.video.VideoService;
import com.study.column.visitorCount.VisitorCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    BoardService boardService;
    @Autowired
    OpenColumnService openColumnService;
    @Autowired
    VideoService videoService;
    @Autowired
    LibraryService libraryService;
    @Autowired
    VisitorCountService visitorCountService;

    @RequestMapping("/")
    public String home(PageDTO page, Model model, HttpSession session) throws Exception {
        if (session.getAttribute("visited") == null) {
            visitorCountService.incrementVisitorCount();
            session.setAttribute("visited", true);
        }
        model.addAttribute("todayCount", visitorCountService.getTodayCount());
        model.addAttribute("totalCount", visitorCountService.getTotalCount());
        model.addAttribute("page", boardService.pageSetting(page));
        model.addAttribute("boardList", boardService.showPostList(page));
        model.addAttribute("opencolumnList", openColumnService.showPostList(page));
        model.addAttribute("videoList", videoService.showPostList(page));
        model.addAttribute("libraryList", libraryService.showPostList(page));

        return "index";
    }
}
