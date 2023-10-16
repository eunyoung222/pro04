<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 보기</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="resources/css/normalize.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/motion-ui/1.2.3/motion-ui.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation-prototype.min.css">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel='stylesheet' type='text/css'>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/js/foundation.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/motion-ui/1.2.3/motion-ui.min.js"></script>

    <style>
        td { height: 40px; margin: 0px;}
        input { width:400px; float:left; margin-bottom: 0px; }

        #content { width: 100%; height: 100%; overflow: hidden; margin: 0px; padding: 0px;}
        .title { width: 450px; margin: 10px auto; font-size: 2em; font-weight: bold; text-align: center; color:#00A2FF; padding-top:36px; padding-bottom:20px; }
        .container { width: 450px; margin: 10px auto; padding: 24px; height:auto; overflow-y:auto; }
        #frm1 { width : 400px; margin: 0px auto; }
        table tbody td { padding: 0px; }

        input[type="date"]:not(.has-value):before{ color: #cacaca; content: attr(placeholder); }

        .button { margin: 0 0.6rem 1rem 0; }
    </style>
</head>
<body>
<header id="header">

</header>

<div class="content container" id="content">
    <div class="container">
        <c:if test="${sid!='admin' }">
            <h2 class="title">마이 페이지</h2>
        </c:if>
        <form name="frm1" id="frm1" action="${path1 }/user/update.do" method="post" onsubmit="return updateCheck(this)">
            <div class="table_form_wrap">
                <table class="table_form">
                    <tbody>
                    <tr>
                        <td><input type="text" name="id" id="id" size="100" class="single100" value="${user.id }" readonly required>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" name="pw" id="pw"  class="single100" value="${user.pw }" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                            <p>(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" name="pw2" id="pw2"  class="single100" value="${user.pw }" required></td>
                    </tr>
                        <td><input type="text" name="name" id="name" class="single100"  value="${user.name }" required></td>
                    </tr>
                    <tr>
                        <td><input type="email" name="email" id="email" class="single100" value="${user.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
                    </tr>
                    <tr>
                        <td><input type="tel" name="tel" id="tel" class="single100"  value="${user.tel }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="postcode" id="postcode"  class="single40" value="${user.postcode }" required style="width: 200px;">
                            <input type="button" id="isAddrBtn" class="button" value="주소찾기" onclick="findAddr()" style="border-radius: 5px; width:200px;">
                            <input type="text" name="addr1" id="addr1" class="single100" value="${user.addr1 }"><br>
                            <input type="text" name="addr2" id="addr2" class="single100" value="${user.addr2 }"><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fmt:parseDate value="${user.birth }" var="birth" pattern="yyyy-MM-dd" />
                            <span style="display:none"><fmt:formatDate var="br" value="${birth }" pattern="yyyy-MM-dd" /></span>
                            <input type="date" name="birth" id="birth" value="${br }" class="single100">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" class="button btn-writer" style="border-radius: 5px; width:120px;" value="회원정보수정">
                            <input type="reset" class="button btn-primary" style="border-radius: 5px; width:120px;" value="취소">
                            <c:if test="${sid!='admin' }">
                                <a href="${path1 }/user/delete?id=${sid }" class="button btn-danger" style="border-radius: 5px; width:120px;">회원 탈퇴</a>
                            </c:if>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </form>
        <script>
            function updateCheck(f){
                if(f.userpw.value!=f.userpw2.value){
                    alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                    return false;
                }
            }
        </script>
        <script>
            function findAddr() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        console.log(data);
                        var roadAddr = data.roadAddress;
                        var jibunAddr = data.jibunAddress;
                        document.getElementById("postcode").value = data.zonecode;
                        if(roadAddr !== '') {
                            document.getElementById("addr1").value = roadAddr;
                        } else if(jibunAddr !== ''){
                            document.getElementById("addr1").value = jibunAddr;
                        }
                    }
                }).open();
            }
        </script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">

</footer>
</body>
</html>
