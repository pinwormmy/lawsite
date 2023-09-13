package com.sc1hub.freeBoard;

import com.sc1hub.member.MemberDTO;
import com.sc1hub.util.IpService;
import com.sc1hub.util.PageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
        return "freeBoard/postList";
    }

    @RequestMapping("/readPost")
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
                return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
            }
            log.debug("추천 시 데이터 확인 - 회원: {}, 게시글 번호: {}", member, recommendDTO.getPostNum());
            recommendDTO.setUserId(member.getId());
            freeBoardService.insertRecommendation(recommendDTO);
            return new ResponseEntity<>(recommendDTO, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            log.error("추천 중 잘못된 인자가 전달되었습니다.", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            log.error("추천 중 오류 발생", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/cancelRecommendation")
    @ResponseBody
    public ResponseEntity<FreeBoardRecommendDTO> cancelRecommendation(HttpSession session, @RequestBody FreeBoardRecommendDTO recommendDTO) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null || recommendDTO.getPostNum() == 0) {
                return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
            }
            log.debug("추천 취소 시 데이터 확인 - 회원: {}, 게시글 번호: {}", member, recommendDTO.getPostNum());
            recommendDTO.setUserId(member.getId());
            freeBoardService.cancelRecommendation(recommendDTO);
            return new ResponseEntity<>(recommendDTO, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            log.error("추천 취소 중 잘못된 인자가 전달되었습니다.", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            log.error("추천 취소 중 오류 발생", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/checkRecommendation", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<FreeBoardRecommendDTO> checkRecommendation(FreeBoardRecommendDTO recommendDTO, HttpSession session) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null) {
                return new ResponseEntity<>(recommendDTO, HttpStatus.UNAUTHORIZED);
            }
            recommendDTO.setUserId(member.getId());
            int count = freeBoardService.checkRecommendation(recommendDTO); // 추천 확인
            boolean isRecommended = (count > 0); // int를 boolean으로 변환
            recommendDTO.setCheckRecommend(isRecommended); // DTO에 설정
            return new ResponseEntity<>(recommendDTO, HttpStatus.OK);
        } catch (Exception e) {
            log.error("추천 확인 중 오류 발생", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/getRecommendCount", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Integer> getRecommendCount(@RequestParam("postNum") int postNum) {
        try {
            log.info("getRecommendCount 요청 받음. postNum: " + postNum); // 요청 로그 추가

            // 게시글의 갱신된 최신 추천 수를 가져옵니다.
            int recommendCount = freeBoardService.getRecommendCount(postNum);

            log.info("게시글 번호 " + postNum + "의 추천 수: " + recommendCount); // 추천 수 로그 추가

            return new ResponseEntity<>(recommendCount, HttpStatus.OK);
        } catch (Exception e) {
            log.error("추천 수 조회 중 오류 발생", e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}