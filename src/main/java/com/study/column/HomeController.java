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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

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
    public String home(PageDTO page, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Cookie[] cookies = request.getCookies();
        boolean isVisitor = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("visitor".equals(cookie.getName())) {
                    isVisitor = true;
                    break;
                }
            }
        }

        if (!isVisitor) {
            createVisitorCookie(response);
            visitorCountService.incrementVisitorCount();
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

    private void createVisitorCookie(HttpServletResponse response) {
        Cookie visitorCookie = new Cookie("visitor", "true");

        // 오늘의 자정까지의 시간을 초 단위로 계산
        LocalDateTime midnight = LocalDateTime.of(LocalDate.now().plusDays(1), LocalTime.MIDNIGHT);
        int secondsUntilMidnight = (int) Duration.between(LocalDateTime.now(), midnight).getSeconds();

        visitorCookie.setMaxAge(secondsUntilMidnight); // 자정까지
        visitorCookie.setPath("/"); // 전체 도메인에서 유효
        response.addCookie(visitorCookie);
    }

}