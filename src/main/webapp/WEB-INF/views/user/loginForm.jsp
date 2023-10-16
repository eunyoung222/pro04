<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
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
        header { height: 150px; }
        ul { list-style: none; }

        #content { width: 100%; height: 100%; overflow: hidden; margin: 0px; padding: 0px;}
        .title { width: 450px; margin: 10px auto; font-size: 2em; font-weight: bold; text-align: center; color:#00A2FF; padding-top:36px; padding-bottom:20px; }
        .container { width: 450px; margin: 10px auto; padding: 24px; height:auto; overflow-y:auto; }
        #frm1 { width : 400px; margin: 0px auto; }
        table tbody td { padding: 0px; }

        .find_wrap { text-align: center; }
        /* .find_wrap li { float: left; margin-left: 50px; list-style: none; } */

    </style>
</head>
<body>

<header id="header">

</header>
    <div class="content container" id="content">
        <h2 class="title">스마트 해법</h2>

        <div class="container">
            <form action="${path1 }/user/login" method="post" name="loginForm">
                <div class="table_form_wrap">
                    <table class="table_form">
                        <tbody>
                        <tr>
                            <td><input type="text" name="id" id="id" size="100" class="single100" placeholder="아이디 입력" required>
                                <!--  pattern="^[a-z0-9]+$"  -->
                            </td>
                        </tr>
                        <tr>
                            <td><input type="password" name="pw" id="pw"  class="single100" placeholder="비밀번호 입력" required>
                                <!--  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  -->
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="button" value="로그인" style="height: 55px; border-radius: 5px;">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <div class="find_wrap">
                <a href="${path1 }/user/agree">회원가입</a>
                <!-- <ul>
                    <li><a href="">아이디 찾기</a></li>
                    <li>|</li>
                    <li><a href="${path1 }/user/agree">회원가입</a></li>
                </ul> -->
            </div>
            <script>
                function loginFaiure() {
                    alert("로그인 실패");
                }
            </script>
        </div>
    </div>
    <footer id="footer" class="footer-nav row expanded collapse">

    </footer>
</body>
</html>