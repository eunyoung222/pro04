<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시범 강의 상세보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <c:set var="path1" value="<%=request.getContextPath() %>" />
    <%--    <%@ include file="../common.jsp"%>--%>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

        *{
            font-family: 'Nanum Gothic Coding', monospace;
        }

        .h2{
            font-family: 'Nanum Gothic Coding', monospace;
            font-weight: 400;
            line-height: 110px;
            text-align: center;
            font-size: 1.75em;
            margin-bottom: 0.5714em;
        }


        .content h2 {
            height: 80px;
            margin-top: 155px;
            text-align: center;
            font-size: 30px;
            margin-bottom: 0.5714em;
            color: #363636;
            font-weight: 540;
            line-height: 40px;
        }

        .column1 {
            margin-top: -125px;
            text-align: center;
            display: block;
            flex-basis: 0;
            flex-grow: 1;
            flex-shrink: 1;
            padding: 0.75rem;
        }
        .p {
            line-height: 35px;
        }

        .button {
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            padding: 10px;
            float: right;
            background-color: #008CD6;
            border-color: #008CD6;
            color: #ffffff;
        }

        .button2 {
            text-decoration: none;
            border-radius: 20px;
            margin: 10px;
            padding: 25px;
            float: right;
            background-color: #FFA500;
            border-color: #FFA500;
            color: #ffffff;
        }

        .button3 {
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            padding: 10px;
            float: right;
            background-color: #FFA500;
            border-color: #FFA500;
            color: #ffffff;
        }
    </style>
<%--    <video src="${path1}/resources/video/${domain.videofile}" controls></video>--%>

</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container is-fullhd">
    <div class="content" id="contents">
        <div class="row column1 text-center" style="margin-bottom: 80px;">
            <h2 class="h2" style="font-weight: 400;">${domain.title}</h2>
            <hr>
            <div class="container">
                <table id="table1">
                    <tbody>
<%--                    <tr>--%>
<%--                        <th style="background-color:#dcdcdc">강의명</th>--%>
<%--                        <td class="p"><p>${domain.title }</p></td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th style="background-color:#dcdcdc"></th>
                        <!-- 영상 플레이어 -->
                        <td><video src="${path1}/resources/video/${domain.videofile}" controls></video></td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">내용</th>
                        <td class="p"><p>${domain.content }</p></td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">선생님</th>
                        <td>${domain.teacher }</td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">작성일</th>
                        <td>${domain.resdate }</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="button" style="float: right; ">
                <a href="${path1 }/video/list.do" class="button">목록으로</a>
            </div>

            <c:if test= "${sid.equals('admin')}">
            <div class="button-group">
<%--                <a class="button" href="${path1 }/video/list.do">목록으로</a>--%>
                <a class="button3" href="${path1 }/video/delete.do?no=${domain.no}">삭제</a>
<%--                <a class="button3" href="${path1 }/video/edit.do?no=${domain.no}">수정</a>--%>
            </div>
            </c:if>

        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>