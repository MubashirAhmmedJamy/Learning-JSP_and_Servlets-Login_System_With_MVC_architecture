<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <body>
        <jsp:useBean id="log" class="Beans.LoginBean" scope="request">    
            <jsp:setProperty name="log" property="USERNAME_B" value='<%= request.getParameter("unm")%>'/>
            <jsp:setProperty name="log" property="PASSWORD_B" value='<%= request.getParameter("psw")%>'/>            
        </jsp:useBean>
        
        <jsp:forward page="user_Management">
            <jsp:param name="unm" value='${log.getUSERNAME_B()}'/>
            <jsp:param name="psw" value='<%=log.getPASSWORD_B()%>'/>
        </jsp:forward>
    </body>
</html>