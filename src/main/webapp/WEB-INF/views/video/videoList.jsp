<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시범 강의</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <c:set var="path1" value="<%=request.getContextPath() %>" />
    <%--    <%@ include file="../common.jsp"%>--%>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

        *{
            font-family: 'Nanum Gothic Coding', monospace;
        }

        .title {
            font-family: 'Nanum Gothic Coding', monospace;
            margin-top: 55px;
            text-align: center;
            font-weight: 700;
        }

        .contents {
            font-family: 'Nanum Gothic Coding', monospace;
            text-align: center;
            font-weight: 200;
        }

        .button2 {
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            padding: 10px;
            float: right;
            background-color: #FFA500;
            border-color: #FFA500;
            color: #ffffff;
        }


        .video-item ul {
            padding: 0;
        }

        .video-item li {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .thumb-img {
            flex: 0 0 100px;
            margin-right: 20px;
        }

        .thumb-img img {
            width: auto;
            height: auto;
        }

        .exp {
            flex: 1;
            text-align: left;
        }

        .tab li {
            flex: 1;
        }

        ul {
            list-style: none;
        }

        ul:after {
            content: '';
            display: block;
            clear: both;
        }

        ul {
            margin-top: 0;
            margin-bottom: 1rem;
        }

        ul {
            padding-left: 2rem;
        }

        .tab {
            position: relative;
            display: flex;
            text-align: center;
        }

        .tab li > a {
            background-color: #eee;
            text-decoration: none;
            display: block;
            line-height: 55px;
            border-left: 1px solid #d7d8da;
            color: #666;
            font-size: 20px;
            font-weight: 600;
        }

        .tab li > a.active {
            color: #fff;
            background: #69748a;
            font-weight: 600;
        }

        .title {
            margin-top: 55px;
            text-align: center;
        }

        .box_wrap thead th {
            padding: 15px 5px;
            border-bottom: 1px solid #d0cfd5;
            text-align: center;
        }


        .box_wrap tbody td {
            padding: 15px 5px;
            border-bottom: 1px solid #d0cfd5;
            text-align: center;
        }

        .video-list li {
            position: relative;
            padding: 35px 0;
            border-bottom: 1px solid #ddd;
            overflow: hidden;
        }

        /*.evt-list li .img img {*/
        /*    position: absolute;*/
        /*    top: 0;*/
        /*    left: 0;*/
        /*    width: 100%;*/
        /*    height: 100%;*/
        /*}*/

        .video-list {
            list-style: none;
            margin-top: 40px;
            border-top: 2px solid #999;
        }

        video-list li .exp > a {
            position: relative;
        }

        a {
            font-family: inherit;
            text-decoration: none;
            color: inherit;
        }

        .exp strong {
            display: block;
            margin-top: 38px;
            font-size: 25px;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }


        .exp p {
            margin: 10px 0 20px;
            line-height: 1.3;
            color: #666;
            font-size: 18px;
            word-break: keep-all;
        }

        .exp span {
            font-size: 15px;
            display: block;
            color: #888;
        }

        .video-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .exp {
            text-align: center;
            display: inline-block;
            width: calc(100%- 600px);
            padding: 6px 0 0 45px;
        }


    </style>

</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container-fluid">
    <h2 class="title"></h2>
    <div class="container" id="container">
        <h1 class="title">
            시범 강의
        </h1>
        <h3 class="contents">
            강의 구매 전에 맛보기 강의로 강의 내용을 미리 확인해 보세요!
        </h3>
        <br>
        <form action="${path1 }/video/list.do" method="get" class="field has-addons has-addons-right">
            <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </span>
            </p>
            <p class="control">
                <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
            </p>
            <p class="control">
                <input type="submit" class="button is-mainColor" value="검색" />
            </p>
        </form>
        <br>
        
        <div class="video-list">
            <c:forEach var="video" items="${videoList }" varStatus="status">
                <a href="${path1}/video/detail.do?no=${video.no}">
                    <li>
                        <ul class="video-item">
                            <div class="thumb-img">
                                <div class="img" style="width: 587px; height: 220px;">
                                    <img src="${path1}/resources/img/${video.img}" />
                                </div>
                            </div>
                            <div class="exp">
                                <strong>
                                        ${video.title}
                                </strong>
                                <p>${video.content}</p>
                            </div>
                        </ul>
                    </li>
                </a>
            </c:forEach>
        </div>

<%--        <c:if test= "${sid.equals('admin')}">--%>
            <div class="button-group">
                <a class="button2" href="${path1 }/video/insert.do">영상 올리기</a>
            </div>
<%--        </c:if>--%>

    </div>
    <br>
    <br>
    <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
        <c:if test="${curPage > page.pageCount }">
            <a href="${path1 }/video/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
        </c:if>
        <c:if test="${page.blockLastNum < page.totalPageCount }">
            <a href="${path1 }/video/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
        </c:if>

        <ul class="pagination-list">
            <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                <c:choose>
                    <c:when test="${i == curPage }">
                        <li>
                            <a href="${path1 }/video/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="${path1 }/video/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </nav>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>