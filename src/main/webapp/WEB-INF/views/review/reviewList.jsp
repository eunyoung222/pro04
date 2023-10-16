<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <c:set var="path1" value="<%=request.getContextPath() %>" />
    <%--    <%@ include file="../common.jsp"%>--%>
    <script src=""></script>

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

        .box_wrap {
            margin-top: 15px;
            position: relative;
            max-width: 1280px;
            min-height: 450px;
        }

        .review-list th:nth-child(1) {
            width: 12%;
        }

        .box_wrap {
            border-top: 2px solid #666;
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

        .item2 .al{
            text-decoration-line: none;
            color: black;
            display: block;
            text-overflow: ellipsis;
            max-height: 2.8em;
            line-height: 3.4em;
            word-wrap: break-word;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            word-break: keep-all;
        }

        .paginate {
            list-style-type: none;
            width: 100%;
            margin-top: 40px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .paginate .page-item {
            margin: 0 5px;
        }

        .paginate .page-link {
            display: inline-block;
            width: 34px;
            height: 34px;
            border: 1px solid #ddd;
            background-color: #f8f9fa;
            color: #333;
            font-size: 14px;
            line-height: 32px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }

        .paginate .page-link:hover {
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }

        .item1, .item2, .item3 {
            font-size: 18px;
        }

        .button2 {
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            padding: 10px;
            float: right;
            background-color: #008CD6;
            border-color: #008CD6;
            color: #ffffff;
        }




        #tb1 { width:980px; margin:40px auto; }
        #tb1 th { background-color: #00A2FF; color:#fff; font-size: 20px;}
        .item1 { width:10%; }
        .item2 { width:65%; }
        .item3 { width:10%; }
        .item4 { width:30%; }
        #page-nation1 { width: 960px; margin:20px auto; }

    </style>

</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container-fluid">
    <h2 class="title">후기</h2>
    <h3 class="contents">해법의 장점과 특히 만족과 함께 성적 향상을 경험한 학생들의 솔직한 수업만족도 체험수기입니다.</h3>
    <br>
    <form action="${path1 }/review/list.do" method="get" class="field has-addons has-addons-right"
          style="margin-right: 503px;">
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
    <div class="container">
        <div class="box_wrap">
            <table class="review-list" id="tb1">
                <thead>
                <tr>
                    <th class="item1">번호</th>
                    <th class="item2">제목</th>
                    <th class="item3">아이디</th>
                    <th class="item4">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="review" items="${reviewList }" varStatus="status">
                    <tr>
                        <td class="item1">${status.count }</td>
                        <td class="item2">
                            <a href="${path1 }/review/detail.do?no=${review.no }" class="al">${review.title }</a>
                        </td>
                        <td class="item3">${review.id }</td>
                        <td class="item4">${review.resdate }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <c:choose>
            <c:when test="${not empty sid }">
                <a class="button2" href="${path1 }/review/insert.do">글쓰기</a>
            </c:when>
            <c:otherwise>
                <a class="button2" href="javascript:checkLogin()">글쓰기</a>
            </c:otherwise>
        </c:choose>

    </div>
    <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
        <c:if test="${curPage > page.pageCount }">
            <a href="${path1 }/review/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
        </c:if>
        <c:if test="${page.blockLastNum < page.totalPageCount }">
            <a href="${path1 }/review/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
        </c:if>

        <ul class="pagination-list">
            <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                <c:choose>
                    <c:when test="${i == curPage }">
                        <li>
                            <a href="${path1 }/review/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="${path1 }/review/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </nav>
</div>
<script>
    function checkLogin() {
        var confirmLogin = confirm("글 작성은 로그인이 필요해요! 로그인하시겠어요?");
        if (confirmLogin) {
            location.href = '${path1 }/user/loginForm';
        }
    }
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
