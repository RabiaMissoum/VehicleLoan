<%@page import="Controller.UserDashServlet"%>
<%@page import="Model.users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<% users u= new users();
 u.setRequest(request); u.setResponse(response);
 UserDashServlet ud= new UserDashServlet();
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>  Welcome  <%=ud.GetLoggedInUser(u) %> to Vehicle Loan </title>
<link rel = "icon" href ="${pageContext.request.contextPath}/images/icon.png" type = "image/png">

<link  href ="${pageContext.request.contextPath}/CSS1/default.css" type="text/css" rel="stylesheet" >
<link  href ="${pageContext.request.contextPath}/CSS1/footer.css" type="text/css" rel="stylesheet" >
<link  href ="${pageContext.request.contextPath}/CSS1/font-awesome.min.css" 
       type="text/css" rel="stylesheet">
<link  href ="${pageContext.request.contextPath}/CSS1/styletab.css" 
       type="text/css" rel="stylesheet">


</head>
<body >
<div id="topNav">
            <%@include  file="/inc/topNav.jsp" %>
  </div>
<div id="slid">
    


     
                   