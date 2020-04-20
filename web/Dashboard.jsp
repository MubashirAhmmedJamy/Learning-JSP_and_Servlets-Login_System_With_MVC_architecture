<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    if (session.getAttribute("current") == null || (session.getAttribute("current") == "")) {
        request.setAttribute("error", "You're not logged in");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>

        <style>
            body{
                background-color: #99ff00;
            }
        </style>

    </head>
    <body>
        <p>

        <h1>Hello <%= session.getAttribute("current")%> </h1>
    </p>
    
    <form action="outDispatcher.jsp" method="post">
        <input type="submit" name="logout" value="LogOut"/>            
    </form>
</body>
</html>