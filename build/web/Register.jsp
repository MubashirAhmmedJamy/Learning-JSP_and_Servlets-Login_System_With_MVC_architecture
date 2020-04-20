<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Register</title>
    <head>
        <style>
            body{
                background-color: #ccccff;
            }

            fieldset{
                border: 5px solid;
                width: 400px;
                margin:auto;
            }

            div {
                position:absolute;
                top:30%;
                right:0;
                left:0;
            }
            button{
                background: #cccccc;
            }

        </style>
    </head>

    <body>

        <form action="user_Management" method="post">
            <div align="center">
                <fieldset>
                    <legend><h3>Register here</h3></legend>
                    <b>Username:</b>
                    <input type="text" placeholder="Enter Username" name="unm" required><br>
                    <b>Mobile:</b>
                    <input type="text" placeholder="Enter Mobile number" name="mbl" required><br>
                    
                    <b>Email:</b>
                    <input type="text" placeholder="Enter Email address" name="eml" required><br>
                    
                    <b>Password:</b>
                    <input type="password" placeholder="Enter Password" name="psw" required><br>

                </fieldset>

                <button type="submit" name="sub">Create User</button>
                <button type="reset" name="rst">Reset</button>
                <a href="Login.jsp">Already Registered</a>

                <%if (request.getAttribute("reg_status") != null) {%>

                <h4><%= "\n" + request.getAttribute("reg_status")%></h4>                    

                <%}%>
                
            </div>
        </form>
    </body>
</html>
