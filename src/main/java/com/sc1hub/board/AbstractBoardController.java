package com.sc1hub.board;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public abstract class AbstractBoardController<T extends BoardDTO, C extends CommentDTO, R extends RecommendDTO> {

    @Autowired
    protected abstract BoardService<T, C, R> getBoardService();

    protected abstract String getBoardName();

    @GetMapping(value = "/list")
    public String list(PageDTO page, Model model) throws Exception {
        model.addAttribute("selfNoticeList", getBoardService().showSelfNoticeList());
        model.addAttribute("page", getBoardService().pageSetting(page));
        model.addAttribute("postList", getBoardService().showPostList(page));
        return getBoardName() + "/postList";
    }

    @RequestMapping("/readPost")
    public String readPost(Model model, HttpServletRequest request) throws Exception {
        int postNum = Integer.parseInt(request.getParameter("postNum"));
        checkIpAndUpdateViews(request, postNum);
        model.addAttribute("post", getBoardService().readPost(postNum));
        return getBoardName() + "/readPost";
    }

    private void checkIpAndUpdateViews(HttpServletRequest request, int postNum) throws Exception {
        String ip = IpService.getRemoteIP(request);
        if(getBoardService().checkViewUserIp(postNum, ip) == 0) {
            getBoardService().saveViewUserIp(postNum, ip);
            getBoardService().updateViews(postNum);
        }
    }

    @RequestMapping("/writePost")
    public String writePost() {
        return getBoardName() + "/writePost";
    }

    @RequestMapping("/submitPost")
    public String submitPost(T post) throws Exception {
        getBoardService().submitPost(post);
        return "redirect:/" + getBoardName() + "/list";
    }

    @RequestMapping("/deletePost")
    public String deletePost(int postNum) throws Exception {
        getBoardService().deletePost(postNum);
        return "redirect:/" + getBoardName() + "/list";
    }

    @RequestMapping(value = "/modifyPost")
    public String modifyPost(Model model, int postNum) throws Exception {
        model.addAttribute("post", getBoardService().readPost(postNum));
        return getBoardName() + "/modifyPost";
    }

    @RequestMapping(value = "/submitModifyPost")
    public String submitModifyPost(T post) throws Exception {
        getBoardService().submitModifyPost(post);
        return "redirect:/" + getBoardName() + "/readPost?postNum=" + post.getPostNum();
    }

    @RequestMapping(value = "/addComment")
    @ResponseBody
    public ResponseEntity<Map<String, String>> addComment(@RequestBody C comment) throws Exception {
        log.debug("댓글 인수 확인(댓글내용) : {}", comment.getContent());
        getBoardService().addComment(comment);
        Map<String, String> response = new HashMap<>();
        response.put("message", "댓글이 성공적으로 추가되었습니다.");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @RequestMapping(value = "/commentPageSetting")
    @ResponseBody
    public PageDTO commentPageSetting(@RequestBody PageDTO page) throws Exception {
        return getBoardService().commentPageSetting(page);
    }

    @RequestMapping(value = "/showCommentList")
    @ResponseBody
    public List<C> showCommentList(@RequestBody PageDTO page) throws Exception {
        return getBoardService().showCommentList(page);
    }

    @RequestMapping(value = "/deleteComment")
    @ResponseBody
    public void deleteComment(int commentNum) throws Exception {
        getBoardService().deleteComment(commentNum);
    }

    @RequestMapping(value = "/updateCommentCount")
    @ResponseBody
    public void updateCommentCount(int postNum) throws Exception {
        getBoardService().updateCommentCount(postNum);
    }

    @RequestMapping(value = "/addRecommendation")
    @ResponseBody
    public ResponseEntity<R> addRecommendation(HttpSession session, @RequestBody R recommendDTO) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null || recommendDTO.getPostNum() == 0) {
                return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
            }
            log.debug("추천 시 데이터 확인 - 회원: {}, 게시글 번호: {}", member, recommendDTO.getPostNum());
            recommendDTO.setUserId(member.getId());
            getBoardService().addRecommendation(recommendDTO);
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
    public ResponseEntity<R> cancelRecommendation(HttpSession session, @RequestBody R recommendDTO) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null || recommendDTO.getPostNum() == 0) {
                return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
            }
            log.debug("추천 취소 시 데이터 확인 - 회원: {}, 게시글 번호: {}", member, recommendDTO.getPostNum());
            recommendDTO.setUserId(member.getId());
            getBoardService().cancelRecommendation(recommendDTO);
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
    public ResponseEntity<R> checkRecommendation(R recommendDTO, HttpSession session) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null) {
                return new ResponseEntity<>(recommendDTO, HttpStatus.UNAUTHORIZED);
            }
            recommendDTO.setUserId(member.getId());
            int count = getBoardService().checkRecommendation(recommendDTO);
            boolean isRecommended = (count > 0);
            log.info("추천 확인 컨트롤러 작동여부 : " + isRecommended);
            recommendDTO.setCheckRecommend(isRecommended);
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
            log.info("getRecommendCount 요청 받음. postNum: " + postNum);
            int recommendCount = getBoardService().getRecommendCount(postNum);
            log.info("게시글 번호 " + postNum + "의 추천 수: " + recommendCount);
            return new ResponseEntity<>(recommendCount, HttpStatus.OK);
        } catch (Exception e) {
            log.error("추천 수 조회 중 오류 발생", e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
