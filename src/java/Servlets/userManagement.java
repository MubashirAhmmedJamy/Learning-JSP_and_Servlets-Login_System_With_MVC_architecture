package Servlets;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet(name = "userManagement", urlPatterns = "/user_Management")

public class userManagement extends HttpServlet {
    Connection con;
    String sql;
    Statement state;
    String USERNAME;
    String PASSWORD;
    String EMAIL;
    String MOBILE_NUMBER;
    String WHEN_INSERTED;
    ResultSet result;

    private void connector() {

        //System.out.println("Connecting to database");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/voice", "root", "paradise46");
            state = con.createStatement();
            //System.out.println("Database connected");
        } catch (ClassNotFoundException | SQLException ex) {
            //System.out.println("Failed to conncet co database");
        }
    }

    protected void processLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //System.out.println("Login request received");
        USERNAME = req.getParameter("unm");
        PASSWORD = req.getParameter("psw");
        sql = "select * from users where user_Name='" + USERNAME + "'";

        connector();

        try {
            result = state.executeQuery(sql);
            
            if (result.next()) {
                PASSWORD = result.getString("password");
                EMAIL = result.getString("email_ID");
                MOBILE_NUMBER = result.getString("mobile_Number");
                WHEN_INSERTED = result.getString("when_inserted");
                
                if (PASSWORD.equals(req.getParameter("psw"))) {
                    HttpSession session = req.getSession(true);
                    
                    //System.out.println("creating new session!");
                    session.setAttribute("current", USERNAME);
//                    req.setAttribute("PASSWORD", PASSWORD);
//                    req.setAttribute("EMAIL", EMAIL);
//                    req.setAttribute("MOBILE_NUMBER", MOBILE_NUMBER);
//                    req.setAttribute("WHEN_INSERTED", WHEN_INSERTED);
                    res.sendRedirect("Dashboard.jsp");
                } else {
                    req.setAttribute("error", "wrong passowrd");
                    req.getRequestDispatcher("Login.jsp").forward(req, res);
                }
            }
            else {
                req.setAttribute("error", "You are not registered");
                req.getRequestDispatcher("Login.jsp").forward(req, res);
            }
        } catch (IOException | SQLException | ServletException e) {
            req.setAttribute("error", "Something went wrong. Please try again.");
            req.getRequestDispatcher("Login.jsp").forward(req, res);
        }
    }

    protected void processRegister(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        USERNAME = req.getParameter("unm");
        MOBILE_NUMBER = req.getParameter("mbl");
        EMAIL = req.getParameter("eml");
        PASSWORD = req.getParameter("psw");
        WHEN_INSERTED = new java.util.Date().toString();

        //System.out.println("Date: " + WHEN_INSERTED);
        
        int found;

        connector();
        sql = "select count(user_Name) from users where user_Name='" + USERNAME + "'";

        try {
            result = state.executeQuery(sql);
            result.next();
            
            found = result.getInt(1);

            //System.out.println("no problem until count");

            if (found == 0) {
                //System.out.println("NO user like you");
                sql = "insert into users(user_Name,email_ID, mobile_Number, password, when_inserted) values ('" + USERNAME + "','" + EMAIL + "','" + MOBILE_NUMBER + "','" + PASSWORD + "','" + WHEN_INSERTED + "')";
                state.executeUpdate(sql);
                //System.out.println("No problem until insert: User Created Successfully");

                req.setAttribute("reg_status", "User created successfully");
                req.getRequestDispatcher("Register.jsp").forward(req, res);
                
            } else {
                req.setAttribute("reg_status", "You are already registered");
                req.getRequestDispatcher("Register.jsp").forward(req, res);
            }

        } catch (SQLException e) {

            req.setAttribute("reg_status", "Something went wrong");
            req.getRequestDispatcher("Register.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //res.setContentType("text/html");
        
        try {
            String previous_page = req.getHeader("referer");

            if (previous_page.endsWith("Register.jsp")) {
                processRegister(req, res);
            } else {
                processLogin(req, res);
            }
        } catch (IOException | ServletException e) {
        }

    }
}