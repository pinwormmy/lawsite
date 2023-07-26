package com.study.column.member;

import com.study.column.util.PageDTO;
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
public class MemberController {
    @Autowired
    MemberService memberService;
    @Autowired
    EmailService emailService;
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        // 로그인 이전 페이지 정보 세션에 저장
        request.getSession().setAttribute("pageBeforeLogin", request.getHeader("Referer"));
        return "login";
    }

    @RequestMapping("/signUp")
    public String signUp() {
        return "signUp";
    }

    @RequestMapping("/isUniqueId")
    @ResponseBody
    public String isUniqueId(String id) throws Exception {
        log.debug("(중복확인용)ID 입력 확인: {}", id);
        return memberService.isUniqueId(id);
    }

    @RequestMapping(value = "/submitSignUp", method = RequestMethod.POST)
    public String submitSignUp(MemberDTO memberDTO, HttpSession httpSession) throws Exception {
        memberService.submitSignUp(memberDTO);
        httpSession.setAttribute("member", memberService.checkLoginData(memberDTO)); // 로그인도 해줌
        log.debug("회원가입 확인: {}", memberDTO);
        return "redirect:/";
    }

    @RequestMapping(value = "/submitLogin", method = RequestMethod.POST)
    public String submitLogin(HttpSession session, MemberDTO memberDTO, Model model) throws Exception {
        MemberDTO loginData = memberService.checkLoginData(memberDTO);
        if (loginData == null) {
            model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login";
        }
        session.setAttribute("member", loginData);
        log.debug("로그인 확인: {}", memberDTO);
        return "redirect:" + session.getAttribute("pageBeforeLogin");
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/myPage")
    public String myPage() {
        return "myPage";
    }

    @RequestMapping(value = "/modifyMyInfo")
    public String modifyMyInfo() {
        return "modifyMyInfo";
    }

    @RequestMapping(value = "/submitModifyMyInfo", method = RequestMethod.POST)
    public String submitModifyMyInfo(MemberDTO member, HttpSession session) throws Exception {
        memberService.submitModifyMyInfo(member);       
        session.setAttribute("member", memberService.checkLoginData(member)); // 재로그인해서 회원정보갱신
        return "myPage";
    }

    @RequestMapping(value = "/modifyMember")
    public String modifyMember() {
        return "modifyMember";
    }

    @RequestMapping(value = "/loginForDemo")
    public String loginForDemo(HttpServletRequest request) throws Exception {
        request.getSession().setAttribute("pageBeforeLogin", request.getHeader("Referer"));
        MemberDTO member = new MemberDTO();
        member.setId("midori"); // midori는 시연용 승인회원 계정
        member.setPw("a111");
        MemberDTO loginData = memberService.checkLoginData(member);
        HttpSession session = request.getSession();
        session.setAttribute("member", loginData);
        log.info("(시연용) 일반로그인 성공 : {}", loginData);
        return "redirect:" + session.getAttribute("pageBeforeLogin");
    }

    @RequestMapping(value = "/loginForDemoAsAdmin")
    public String loginForDemoAsAdmin(HttpServletRequest request) throws Exception {
        request.getSession().setAttribute("pageBeforeLogin", request.getHeader("Referer"));
        MemberDTO member = new MemberDTO();
        member.setId("admin"); // admin은 시연용 관리자 계정입니다.
        member.setPw("a111");
        MemberDTO loginData = memberService.checkLoginData(member);
        HttpSession session = request.getSession();
        session.setAttribute("member", loginData);
        log.info("(시연용) 관리자로그인 성공 : {}", loginData);
        return "redirect:" + session.getAttribute("pageBeforeLogin");
    }

    @PostMapping("/sendVerificationMail")
    @ResponseBody
    public ResponseEntity<VerificationResponseDTO> sendVerificationMail(@RequestBody EmailDTO emailDTO) {
        try {
            String email = emailDTO.getEmail();
            String verificationNumber = emailService.sendSimpleMessage(email);

            VerificationResponseDTO response = new VerificationResponseDTO(true, verificationNumber);

            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            VerificationResponseDTO response = new VerificationResponseDTO(false, null);
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/checkUniqueId")
    @ResponseBody
    public String checkUniqueId(String id) throws Exception {
        log.info("아이디 중복 확인 컨트롤러 작동");
        return memberService.isUniqueId(id);
    }

    @GetMapping("/checkUniqueEmail")
    @ResponseBody
    public String checkUniqueEmail(String email) {
        log.info("아이디 중복 확인 컨트롤러 작동");
        return memberService.isUniqueEmail(email);
    }

    @GetMapping(value = "/adminPage")
    public String adminPage(Model model, PageDTO page) throws Exception {
        log.info("관리자 모드");
        page = memberService.pageSetting(page);
        List<MemberDTO> memberList = memberService.getMemberList(page);
        model.addAttribute("memberList", memberList);
        model.addAttribute("pageInfo", page);
        return "adminPage";
    }

    @RequestMapping(value = "/modifyMemberByAdmin")
    public String modifyMemberByAdmin(Model model, String id) {
        log.info("관리자의 회원수정 페이지");
        model.addAttribute("member", memberService.getMemberInfo(id));
        return "modifyMemberByAdmin";
    }

    @RequestMapping(value = "/submitModifyMemberByAdmin")
    public String submitModifyMemberByAdmin(MemberDTO memberDTO) {
        log.info("관리자의 회원수정 제출");
        memberService.submitModifyMemberByAdmin(memberDTO);
        return "redirect:/adminPage";
    }

    @GetMapping(value = "/findId")
    public String findId() {
        log.info("아이디 찾기 페이지");
        return "findId";
    }

    @PostMapping("/findId")
    public String findIdByNameAndEmail(String userName, String email, Model model) {
        String userId = memberService.findIdByNameAndEmail(userName, email);
        if (userId != null && !userId.isEmpty()) {
            model.addAttribute("message", "당신의 아이디는 " + userId + "입니다.");
        } else {
            model.addAttribute("message", "입력하신 이름과 이메일로 등록된 아이디를 찾을 수 없습니다.");
        }
        return "findId";
    }

    @GetMapping(value = "/findPassword")
    public String findPassword() {
        log.info("패스워드 찾기 페이지");
        return "findPassword";
    }

    @PostMapping("/findPassword")
    public String findPassword(String userId, String email, Model model) {
        try {
            String result = memberService.findPassword(userId, email);

            if (result.equals("success")) {
                model.addAttribute("message", "비밀번호 재설정 링크가 이메일로 전송되었습니다.");
            } else {
                model.addAttribute("message", "입력하신 ID와 이메일로 등록된 회원을 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            log.error("비밀번호 찾기 중 에러 발생", e);
            model.addAttribute("message", "비밀번호 찾기 중 문제가 발생했습니다. 다시 시도해 주세요.");
        }

        return "findPassword";
    }

}