<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("current", null);
    session.invalidate();
    response.sendRedirect("Login.jsp");
%>