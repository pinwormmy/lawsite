package com.sc1hub.freeBoard;

import com.sc1hub.util.IpService;
import com.sc1hub.util.PageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/freeBoard")
public class FreeBoardController {
    @Autowired
    FreeBoardService freeBoardService;

    @GetMapping(value = "/list")
    public String list(PageDTO page, Model model) throws Exception {
        model.addAttribute("selfNoticeList", freeBoardService.showSelfNoticeList());
        model.addAttribute("page", freeBoardService.pageSetting(page));
        model.addAttribute("postList", freeBoardService.showPostList(page));
        return "freeBoard/freeBoard";
    }

    @RequestMapping("/readPost")
    @Transactional
    public String readPost(Model model, HttpServletRequest request) throws Exception {
        int postNum = Integer.parseInt(request.getParameter("postNum"));
        checkIpAndUpdateViews(request, postNum);
        model.addAttribute("post", freeBoardService.readPost(postNum));
        return "freeBoard/readPost";
    }

    private void checkIpAndUpdateViews(HttpServletRequest request, int postNum) throws Exception {
        String ip = IpService.getRemoteIP(request);
        if(freeBoardService.checkViewUserIp(postNum, ip) == 0) {
            freeBoardService.saveViewUserIp(postNum, ip);
            freeBoardService.updateViews(postNum);
        }
    }

    @RequestMapping("/writePost")
    public String writePost() {
        return "freeBoard/writePost";
    }

    @RequestMapping("/submitPost")
    public String submitPost(FreeBoardDTO post) throws Exception {
        freeBoardService.submitPost(post);
        return "redirect:/freeBoard/list";
    }

    @RequestMapping("/deletePost")
    public String deletePost(int postNum) throws Exception {
        freeBoardService.deletePost(postNum);
        return "redirect:/freeBoard/list";
    }

    @RequestMapping(value = "/modifyPost")
    public String modifyPost(Model model, int postNum) throws Exception {
        model.addAttribute("post", freeBoardService.readPost(postNum));
        return "freeBoard/modifyPost";
    }

    @RequestMapping(value = "/submitModifyPost")
    public String submitModifyPost(FreeBoardDTO post) throws Exception {
        freeBoardService.submitModifyPost(post);
        return "redirect:/freeBoard/readPost?postNum=" + post.getPostNum();
    }

    @RequestMapping(value = "/addComment")
    @ResponseBody
    public void addComment(@RequestBody FreeBoardCommentDTO comment) throws Exception {
        log.debug("댓글 인수 확인(댓글내용) : {}", comment.getContent());
        freeBoardService.addComment(comment);
    }

    @RequestMapping(value = "/commentPageSetting")
    @ResponseBody
    public PageDTO commentPageSetting(@RequestBody PageDTO page) throws Exception {
        return freeBoardService.commentPageSetting(page);
    }

    @RequestMapping(value = "/showCommentList")
    @ResponseBody
    public List<FreeBoardCommentDTO> showCommentList(@RequestBody PageDTO page) throws Exception {
        return freeBoardService.showCommentList(page);
    }

    @RequestMapping(value = "/deleteComment")
    @ResponseBody
    public void deleteComment(int commentNum) throws Exception {
        freeBoardService.deleteComment(commentNum);
    }

    @RequestMapping(value = "/updateCommentCount")
    @ResponseBody
    public void updateCommentCount(int postNum) throws Exception {
        freeBoardService.updateCommentCount(postNum);
    }
}