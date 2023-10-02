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
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping(value = "/{boardTitle}/list")
    public String list(@PathVariable String boardTitle, PageDTO page, Model model, HttpSession session) throws Exception {
        String koreanTitle = getKoreanTitle(boardTitle);
        model.addAttribute("koreanTitle", koreanTitle);
        model.addAttribute("boardTitle", boardTitle);
        model.addAttribute("selfNoticeList", boardService.showSelfNoticeList(boardTitle));
        model.addAttribute("page", boardService.pageSetting(boardTitle, page));
        model.addAttribute("postList", boardService.showPostList(boardTitle, page));

        // 글쓰기 권한 설정
        boolean canWrite = true; // 기본적으로 글쓰기 가능
        if ("terranGuideBoard".equals(boardTitle)) {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            canWrite = (member != null && member.getGrade() == 3); // 관리자만 글쓰기 가능
        }
        model.addAttribute("canWrite", canWrite);

        return "board/postList";
    }


    private String getKoreanTitle(String boardTitle) {
        switch (boardTitle) {
            case "freeBoard":
                return "자유게시판";
            case "beginnerBoard":
                return "초보자마당";
            case "terranBoard":
                return "테란 게시판";
            case "zVsTBoard":
                return "저테전 게시판";
            case "terranGuideBoard":
                return "테란 공략";
            // ... 기타 매핑
            default:
                return "알 수 없는 게시판(오류가 있는지 확인하시오)";
        }
    }

    @RequestMapping("/{boardTitle}/readPost")
    public String readPost(@PathVariable String boardTitle, Model model, HttpServletRequest request) throws Exception {
        int postNum = Integer.parseInt(request.getParameter("postNum"));
        checkIpAndUpdateViews(boardTitle, request, postNum);
        model.addAttribute("boardTitle", boardTitle);
        model.addAttribute("post", boardService.readPost(boardTitle, postNum));
        return "board/readPost";
    }

    private void checkIpAndUpdateViews(String boardTitle, HttpServletRequest request, int postNum) throws Exception {
        String ip = IpService.getRemoteIP(request);
        if(boardService.checkViewUserIp(boardTitle, postNum, ip) == 0) {
            boardService.saveViewUserIp(boardTitle, postNum, ip);
            boardService.updateViews(boardTitle, postNum);
        }
    }

    @RequestMapping("/{boardTitle}/writePost")
    public String writePost(@PathVariable String boardTitle, Model model) {
        model.addAttribute("boardTitle", boardTitle);
        return "board/writePost";
    }

    @RequestMapping("/{boardTitle}/submitPost")
    public String submitPost(@PathVariable String boardTitle, BoardDTO post) throws Exception {
        boardService.submitPost(boardTitle, post);
        return "redirect:/" + boardTitle + "/list";
    }

    @RequestMapping("/{boardTitle}/deletePost")
    public String deletePost(@PathVariable String boardTitle, int postNum) throws Exception {
        boardService.deletePost(boardTitle, postNum);
        return "redirect:/" + boardTitle + "/list";
    }

    @RequestMapping(value = "/{boardTitle}/modifyPost")
    public String modifyPost(@PathVariable String boardTitle, Model model, int postNum) throws Exception {
        model.addAttribute("boardTitle", boardTitle);
        model.addAttribute("post", boardService.readPost(boardTitle, postNum));
        return "board/modifyPost";
    }

    @RequestMapping(value = "/{boardTitle}/submitModifyPost")
    public String submitModifyPost(@PathVariable String boardTitle, BoardDTO post) throws Exception {
        boardService.submitModifyPost(boardTitle, post);
        return "redirect:/" + boardTitle + "/readPost?postNum=" + post.getPostNum();
    }

    @RequestMapping(value = "/{boardTitle}/addComment")
    @ResponseBody
    public ResponseEntity<Map<String, String>> addComment(@PathVariable String boardTitle, @RequestBody CommentDTO comment) throws Exception {
        log.debug("댓글 인수 확인(댓글내용) : {}", comment.getContent());
        boardService.addComment(boardTitle, comment);
        Map<String, String> response = new HashMap<>();
        response.put("message", "댓글이 성공적으로 추가되었습니다.");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @RequestMapping(value = "/{boardTitle}/commentPageSetting")
    @ResponseBody
    public PageDTO commentPageSetting(@PathVariable String boardTitle, @RequestBody PageDTO page) throws Exception {
        return boardService.commentPageSetting(boardTitle, page);
    }

    @RequestMapping(value = "/{boardTitle}/showCommentList")
    @ResponseBody
    public List<CommentDTO> showCommentList(@PathVariable String boardTitle, @RequestBody PageDTO page) throws Exception {
        return boardService.showCommentList(boardTitle, page);
    }

    @RequestMapping(value = "/{boardTitle}/deleteComment")
    @ResponseBody
    public void deleteComment(@PathVariable String boardTitle, int commentNum) throws Exception {
        boardService.deleteComment(boardTitle, commentNum);
    }

    @RequestMapping(value = "/{boardTitle}/updateCommentCount")
    @ResponseBody
    public void updateCommentCount(@PathVariable String boardTitle, int postNum) throws Exception {
        boardService.updateCommentCount(boardTitle, postNum);
    }

    @RequestMapping(value = "/{boardTitle}/addRecommendation")
    @ResponseBody
    public ResponseEntity<RecommendDTO> addRecommendation(@PathVariable String boardTitle, HttpSession session, @RequestBody RecommendDTO recommendDTO) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null || recommendDTO.getPostNum() == 0) {
                return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
            }
            log.debug("추천 시 데이터 확인 - 회원: {}, 게시글 번호: {}", member, recommendDTO.getPostNum());
            recommendDTO.setUserId(member.getId());
            boardService.insertRecommendation(boardTitle, recommendDTO);
            return new ResponseEntity<>(recommendDTO, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            log.error("추천 중 잘못된 인자가 전달되었습니다.", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            log.error("추천 중 오류 발생", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/{boardTitle}/cancelRecommendation")
    @ResponseBody
    public ResponseEntity<RecommendDTO> cancelRecommendation(@PathVariable String boardTitle, HttpSession session, @RequestBody RecommendDTO recommendDTO) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null || recommendDTO.getPostNum() == 0) {
                return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
            }
            log.debug("추천 취소 시 데이터 확인 - 회원: {}, 게시글 번호: {}", member, recommendDTO.getPostNum());
            recommendDTO.setUserId(member.getId());
            boardService.deleteRecommendation(boardTitle, recommendDTO);
            return new ResponseEntity<>(recommendDTO, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            log.error("추천 취소 중 잘못된 인자가 전달되었습니다.", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            log.error("추천 취소 중 오류 발생", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/{boardTitle}/checkRecommendation", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<RecommendDTO> checkRecommendation(@PathVariable String boardTitle, RecommendDTO recommendDTO, HttpSession session) {
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");
            if (member == null) {
                return new ResponseEntity<>(recommendDTO, HttpStatus.UNAUTHORIZED);
            }
            recommendDTO.setUserId(member.getId());
            int count = boardService.checkRecommendation(boardTitle, recommendDTO);
            boolean isRecommended = (count > 0);
            log.info("추천 확인 컨트롤러 작동여부 : " + isRecommended);
            recommendDTO.setCheckRecommend(isRecommended);
            return new ResponseEntity<>(recommendDTO, HttpStatus.OK);
        } catch (Exception e) {
            log.error("추천 확인 중 오류 발생", e);
            return new ResponseEntity<>(recommendDTO, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/{boardTitle}/getRecommendCount", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Integer> getRecommendCount(@PathVariable String boardTitle, @RequestParam("postNum") int postNum) {
        try {
            log.info("getRecommendCount 요청 받음. postNum: " + postNum);
            int recommendCount = boardService.getRecommendCount(boardTitle, postNum);
            log.info("게시글 번호 " + postNum + "의 추천 수: " + recommendCount);
            return new ResponseEntity<>(recommendCount, HttpStatus.OK);
        } catch (Exception e) {
            log.error("추천 수 조회 중 오류 발생", e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
