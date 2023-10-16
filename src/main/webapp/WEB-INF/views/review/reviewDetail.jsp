<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>후기 상세보기</title>
  <!-- 헤드 부분 인클루드 -->
  <jsp:include page="../include/head.jsp"></jsp:include>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <c:set var="path" value="<%=request.getContextPath() %>" />
<%--  <%@ include file="../common.jsp"%>--%>
</head>

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
    line-height: 120px;
    font-size: 1.75em;
    margin-bottom: 0.5714em;
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

<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container is-fullhd">
  <div class="content" id="contents">
    <div class="row column1 text-center" style="margin-bottom: 80px;">
      <h2 class="h2">${domain.title}</h2>
      <hr>
      <div class="container">
        <table id="table1">
          <tbody>
          <tr>
            <th style="text-align: center; background-color:#dcdcdc">내용</th>
            <td class="p" style="text-align: center;"><p>${domain.content }</p></td>
          </tr>
          <tr>
            <th style="text-align: center; background-color:#dcdcdc">아이디</th>
            <td class="p" style="text-align: center;"><p>${domain.id }</p></td>
          </tr>
          <tr>
            <th style="text-align: center; background-color:#dcdcdc">작성일</th>
            <td style="text-align: center;">${domain.resdate }</td>
          </tr>
          <tr>
            <th style="text-align: center; background-color:#dcdcdc">조회수</th>
            <td style="text-align: center;">${domain.visit }</td>
          </tr>
          </tbody>
        </table>

<%--        <div class="btn-group" style="float: right">--%>
<%--          <a href="${path1 }/review/list.do" class="button">목록으로</a>--%>
<%--          <br>--%>
<%--          <br>--%>
<%--        </div>--%>



<%--&lt;%&ndash;        <c:if test= "${sid.equals('admin')}">&ndash;%&gt;--%>
<%--          <div class="button-group">--%>
<%--            <a class="button" href="${path1 }/review/list.do">목록으로</a>--%>
<%--            <a class="button3" href="${path1 }/review/delete.do?no=${domain.no}">삭제</a>--%>
<%--            <a class="button3" href="${path1 }/review/edit.do?no=${domain.no}">수정</a>--%>
<%--          </div>--%>
<%--&lt;%&ndash;        </c:if>&ndash;%&gt;--%>

        <c:choose>
          <c:when test="${not empty sid && (sid eq 'admin' || sid eq domain.id)}">
            <div class="column is-3"></div>
            <div class="column is-2">
              <a class="button" style="left: 1090px" href="${path1 }/review/list.do">목록으로</a>
            </div>
            <div class="column is-2">
              <a class="button3" style="float: right" href="${path1 }/review/edit.do?no=${domain.no}">수정</a>
            </div>
            <div class="column is-2">
              <a class="button3" style="float: right" href="${path1 }/review/delete.do?no=${domain.no}">삭제</a>
            </div>
            <div class="column is-3"></div>
          </c:when>

          <c:otherwise>
            <div class="column is-5"></div>
            <div class="column is-2">
              <a class="button" style="left: 1090px" href="${path1 }/review/list.do">목록으로</a>
            </div>
            <div class="column is-5"></div>
          </c:otherwise>
        </c:choose>

      </div>
    </div>
  </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>