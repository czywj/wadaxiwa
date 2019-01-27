<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 1/17/19
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Java static example</title>
</head>
<body>
<h1>Java static page example</h1>
<%
    String[] arr = {"what's up","hello","It's a nice day today"};
    String greeting = arr[(int)(Math.random()*arr.length)];
%>
<p><%= greeting %></p>
</body>
</html>
