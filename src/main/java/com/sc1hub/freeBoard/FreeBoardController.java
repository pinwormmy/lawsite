package com.sc1hub.freeBoard;

import com.sc1hub.member.MemberDTO;
import com.sc1hub.util.IpService;
import com.sc1hub.util.PageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return "freeBoard/postList";
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

    @RequestMapping(value = "/addRecommendation")
    @ResponseBody
    public ResponseEntity<FreeBoardRecommendDTO> addRecommendation(HttpSession session, @RequestBody FreeBoardRecommendDTO recommendDTO) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null || recommendDTO.getPostNum() == 0) {
                log.debug("추천 시 데이터 확인 - 회원: {}, 게시글 번호: {}", member, recommendDTO.getPostNum());
                return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
            }
            recommendDTO.setUserId(member.getId());
            freeBoardService.addRecommendation(recommendDTO.getUserId());
            return new ResponseEntity<>(recommendDTO, HttpStatus.OK);
        } catch (Exception e) {
            log.error("추천 중 오류 발생", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/cancelRecommendation")
    @ResponseBody
    public ResponseEntity<Map<String, String>> cancelRecommendation(HttpSession session, @RequestBody FreeBoardRecommendDTO recommendDTO) {
        Map<String, String> response = new HashMap<>();
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null || recommendDTO.getPostNum() == 0) {
                log.debug("추천 취소 시 데이터 확인 - 회원: {}, 게시글 번호: {}", member, recommendDTO.getPostNum());
                response.put("message", "잘못된 요청입니다.");
                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
            }
            recommendDTO.setUserId(member.getId());
            freeBoardService.cancelRecommendation(recommendDTO);
            response.put("message", "추천이 취소되었습니다.");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            log.error("추천 취소 중 오류 발생", e);
            response.put("message", "추천 취소 중 오류가 발생했습니다.");
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


}