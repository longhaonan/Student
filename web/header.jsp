<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/5/18
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <base href="<%=basePath%>">
  <link rel="icon" href="<%=basePath%>favicon.ico">
<%--  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">--%>
<%--  <link rel="stylesheet" href="css/bootstrap.min.css">--%>
<!--  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>-->
<!--  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>-->



