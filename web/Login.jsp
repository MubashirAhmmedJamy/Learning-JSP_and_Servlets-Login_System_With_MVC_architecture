<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <title>Login</title>
    <head>
        <style>
            .custom-select {
                position: relative;
                font-family: Arial;
            }

            .custom-select select {
                display: none; /*hide original SELECT element:*/
            }

            .select-selected {
                background-color: DodgerBlue;
            }

            /*style the arrow inside the select element:*/
            .select-selected:after {
                position: absolute;
                content: "";
                top: 14px;
                right: 10px;
                width: 0;
                height: 0;
                border: 6px solid transparent;
                border-color: #fff transparent transparent transparent;
            }

            /*point the arrow upwards when the select box is open (active):*/
            .select-selected.select-arrow-active:after {
                border-color: transparent transparent #fff transparent;
                top: 7px;
            }

            /*style the items (options), including the selected item:*/
            .select-items div,.select-selected {
                color: #ffffff;
                padding: 8px 16px;
                border: 1px solid transparent;
                border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
                cursor: pointer;
                user-select: none;
            }

            /*style items (options):*/
            .select-items {
                position: absolute;
                background-color: DodgerBlue;
                top: 100%;
                left: 0;
                right: 0;
                z-index: 99;
            }

            /*hide the items when the select box is closed:*/
            .select-hide {
                display: none;
            }

            .select-items div:hover, .same-as-selected {
                background-color: rgba(0, 0, 0, 0.1);
            }


            body{
                background-color: #66ccff;
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

        <form action="inDispatcher.jsp" method="post" >
            <div align="center">
                <fieldset>
                    <legend><h1>Login here</h1></legend>

                    <b>Username:</b>
                    <input type="text" placeholder="Enter Username" name="unm" required><br>

                    <b>Password:</b>
                    <input type="password" placeholder="Enter Password" name="psw" required><br>
                    <button type="submit" name="sub">Login</button>
                    <a href="Register.jsp">Not Registered?</a>

                    <%if (request.getAttribute("error") != null) {%>

                    <h4><%= "\n" + request.getAttribute("error")%></h4>                    

                    <%}%>

                </fieldset>
            </div>
        </form>
    </body>
</html>