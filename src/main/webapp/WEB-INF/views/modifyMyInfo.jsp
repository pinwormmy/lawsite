<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보 수정</title>
<style>
body {
    height: 100%;
}
.my-page {
    width: 1600px;
    margin: auto;
}
.btn-turquoise {
    background-color: #40E0D0;
    color: #fff;
    border: none;
    margin: 10px;
}
.btn-turquoise:hover {
    background-color: #3CB7B8;
    color: #fff;
}
.leftbar-ul li a{
    color : white;
    font-size: 12px;
    font-weight: 500px;
}
.page-navigation {
    text-align: center;
}
.checkbox-list {
    padding: 10px;
}
.checkbox-list label {
    font-weight: 400;
}
.main-banner {
    font-size: 32px;
    margin: 10px;
    text-align: center;
}
</style>
</head>
<body>
<body>
<%@include file="./include/header.jspf" %>
<div class="section-inner">
    <div class="container" style="width: 1600px;">
        <div class="main-banner">
            회원정보 수정
        </div>
        <%@include file="./include/sidebar.jspf" %>
        <div class="col-lg-8">
            <div class="media">
                <div class="media-body">
                    <hr>
                    <div class="member-info" style="font-size: 20px; line-height: 50px;">
                        <form action="/submitModifyMyInfo" id="modifyMyInfo" method="post">
                            <table>
                                <tr>
                                    <td>ID >> </td>
                                    <td>${member.id}<input type="hidden" name="id" value="${member.id}"></td>
                                </tr>
                                <tr>
                                    <td>별명 >> </td>
                                    <td><input type="text" name="nickName" value="${member.nickName}"></td>
                                </tr>
                                <tr>
                                    <td>비밀번호 >></td>
                                    <td><input type="password" name="pw" placeholder="비밀번호를 입력하세요" value="${member.pw}"></td>
                                </tr>
                                <tr>
                                    <td>비밀번호확인 >></td>
                                    <td><input type="password" name="pw2" placeholder="비밀번호를 다시 입력하세요" value="${member.pw}"></td>
                                </tr>
                                <tr>
                                    <td>이메일 >> </td>
                                    <td><input type="email" name="email" value="${member.email}" oninput="checkEmailChanged();">
                                        <button type="button" id="sendVerificationNumberButton">인증받기</button>
                                        <span id="emailCheckText" style="margin-left: 10px;">인증받은 이메일입니다.</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>인증 코드 >> </td>
                                    <td>
                                        <input type="text" name="authCode" id="inputEmailVerificationNumber" placeholder="메일로 받은 인증코드를 입력">
                                    </td>
                                </tr>
                            </table>
                            <div style="margin-top: 20px;">
                                <button type="button" onclick="checkSignupForm();">수정하기</button>
                                <button type="button" onclick="location.href='/myPage'">취소</button>
                                <button type="button" onclick="confirmDelete();" style="background-color: #FF5733; color: #fff;">탈퇴하기</button>
                           </div>
                       </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="./include/footer.jspf" %>

<script>
let modifyMyInfoForm = document.getElementById("modifyMyInfo");
let isEmailAuthed = true;

const emailCheckText = document.getElementById("emailCheckText");
const sendVerificationNumberButton = document.getElementById('sendVerificationNumberButton');
const inputEmail = document.getElementsByName('email')[0];
const inputEmailVerificationNumber = document.getElementById('inputEmailVerificationNumber');

const validateEmailVerificationNumber = (inputValue) => {
  const verificationNumberPattern = /^\d{8}$/;
  return verificationNumberPattern.test(inputValue);
};

const validateEmail = (inputEmail) => {
  const emailPattern = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
  return emailPattern.test(inputEmail);
};

inputEmail.addEventListener('input', checkEmailChanged);

function checkEmailChanged() {
    if (inputEmail.value === '${member.email}') {
        emailCheckText.innerHTML = '인증받은 이메일입니다.';
        isEmailAuthed = true;
    } else {
        emailCheckText.innerHTML = '이메일 인증이 필요합니다.';
        isEmailAuthed = false;
    }
}

sendVerificationNumberButton.addEventListener('click', () => {
    const userEmail = inputEmail.value;
    if (userEmail === '') {
        alert("이메일을 입력해주세요.");
        return false;
    }
    if (!validateEmail(userEmail)) {
        alert("이메일 주소 확인해주세요!");
        return false;
    }
    if (isEmailAuthed == true) {
        alert("이미 인증된 이메일입니다.");
        return false;
    }

    fetch('/sendVerificationMail', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            email: userEmail
        })
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error(response.statusText);
        }
    })
    .then(data => {
        if (data.success) {
            alert("인증번호가 이메일로 발송되었습니다. 확인해주세요.");
            sessionStorage.setItem("verificationNumber", data.verificationNumber); // 인증번호를 sessionStorage에 저장
        } else {
            // 서버에서 반환한 실패 메시지를 사용합니다.
            alert(data.message || "인증번호 발송에 실패했습니다. 이메일 주소를 확인해주세요.");
        }
    })
    .catch(error => {
        console.error("Error: ", error);
        alert("인증번호 발송에 실패했습니다. 이메일 주소를 확인해주세요.");
    });
});


inputEmailVerificationNumber.addEventListener('input', () => {
    checkVerificationNumber();
});

function checkVerificationNumber() {
    const storedVerificationNumber = sessionStorage.getItem("verificationNumber");
    const inputText = inputEmailVerificationNumber.value;
    const length = inputText.length;
    if (length === 8) {

        if (inputText === storedVerificationNumber) {
            alert("인증번호 확인이 완료되었습니다.");
            emailCheckText.innerHTML = '인증번호 확인이 완료되었습니다.';
            isEmailAuthed = true;
        } else {
            alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
            isEmailAuthed = false;
        }
    }
}

function checkSignupForm() {
    if (!isEmailAuthed) {
        alert("이메일 인증을 완료해주세요.");
        return;
    }

    const id = modifyMyInfoForm.id.value;
    const nickName = modifyMyInfoForm.nickName.value;
    const pw = modifyMyInfoForm.pw.value;
    const pw2 = modifyMyInfoForm.pw2.value;
    const email = modifyMyInfoForm.email.value;
    let isPassword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;

    if (id === "") {
        alert("ID를 입력하세요!");
        modifyMyInfoForm.id.focus();
        return;
    }

    if (nickName === "") {
        alert("별명을 입력하세요!");
        modifyMyInfoForm.nickName.focus();
        return;
    }

    if (pw === "") {
        alert("비밀번호를 입력하세요!");
        modifyMyInfoForm.pw.focus();
        return;
    }

    if (pw !== pw2) {
        alert("비밀번호가 일치하지 않습니다!");
        modifyMyInfoForm.pw2.focus();
        return;
    }

    if(!isPassword.test(pw)){
        alert("비밀번호는 4~16 자리 영문+숫자 조합으로 이루어져야 합니다.");
        submitSignUpForm.pw.focus();
        return false;
    }

    if (email === "") {
        alert("이메일을 입력하세요!");
        modifyMyInfoForm.email.focus();
        return;
    }

    modifyMyInfoForm.submit();
}

function confirmDelete() {
    if(confirm("정말로 탈퇴하시겠습니까? 탈퇴 시 모든 데이터가 삭제됩니다.")) {
        $.ajax({
            url: '/deleteMyAccount',
            type: 'POST',
            success: function(data) {
                if(data.success) {
                    alert("탈퇴가 완료되었습니다. 감사합니다.");
                    location.href = '/'; // 홈페이지로 리다이렉트
                } else {
                    alert("탈퇴 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
                }
            }
        });
    }
}

</script>

</body>
</html>