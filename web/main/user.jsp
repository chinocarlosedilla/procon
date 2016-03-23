<%-- 
    Document   : guestPage
    Created on : Mar 18, 2016, 11:06:53 AM
    Author     : Chino
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../loginResource/general_css.css"/>
        <title>ProCon - The Professional Consultation Site</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body class="full_bg">
        <div class="page_header_zone">
            <div class="page_header_home"><img src="../loginResource/title_image.png" alt="ProCon"></div>
            
            <div class="page_header_buttons_zone">
                <a href="#" onclick="history.back();"><div class="page_header_button">Back</div></a>
            </div>
        </div>
<%
    try {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://188.166.204.23:5432/chatservdb";
        String username = "chatservadmin";
        String password = "chatservadmin";
        String query = "SELECT * FROM usr_data WHERE usr_id = " + request.getParameter("userID") +";";

        Connection conn=DriverManager.getConnection(url, username, password);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        rs.next();

%>
        <div class="main_content_card">
            <div class="card_title_zone">
                <img src="User-Profile.png"/>
            </div>
            <div class="card_element left_in_card">
                <table>
                    <tr>
                        <td class="profile_title xlarge">
                            User ID:
                        </td>
                        <td class="profile_detail">
                            <%= rs.getInt("usr_id") %>
                        </td>
                    </tr>
                    <tr>
                        <td class="profile_title xlarge">
                            User Name:
                        </td>
                        <td class="profile_detail">
                            <%= rs.getString("usr_firstname") + " " + rs.getString("usr_lastname")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="profile_title xlarge">
                            Gender:
                        </td>
                        <td class="profile_detail">
                            <%= rs.getString("usr_sex") %>
                        </td>
                    </tr>
                    <tr>
                        <td class="profile_title xlarge">
                            Age:
                        </td>
                        <td class="profile_detail">
                            <%= rs.getInt("usr_age") %>
                        </td>
                    </tr>
                    <tr>
                        <td class="profile_title xlarge">
                            Profession:
                        </td>
                        <td class="profile_detail">
                            <%= rs.getString("usr_profession") %>
                        </td>
                    </tr>
                    <tr>
                        <td class="profile_title xlarge">
                            CLReview Rating:
                        </td>
                        <td class="profile_detail">
                            2.5/5 (out of 3 reviews)
                        </td>
                    </tr>

                </table>
            </div>
            <div class="card_button_zone">
                <a href="fundTransfer.jsp?myID=<%= request.getParameter("myID")%>&userID=<%= request.getParameter("userID")%>">
                <div class="card_button">
                    <img src="ic_pay_ico.png">
                </div>
                </a>
            </div>
        </div>
<%  }
    catch (Exception e) {
        e.printStackTrace();
    }
%>
    </body>
</html>

