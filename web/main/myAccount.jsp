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
            
            <div class="page_header_buttons_zone" style="top: 57px;">
                <a href="#" onclick="history.back();"><div class="page_header_button">Back</div></a>
            </div>
        </div><br/>
<%
    try {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://188.166.204.23:5432/chatservdb";
        String username = "chatservadmin";
        String password = "chatservadmin";
        System.out.println(request.getParameter("myID"));
        String query = "SELECT * "
                + "FROM usr_data _DT "
                + "INNER JOIN usr_bal _BL "
                + "on _DT.usr_id = _BL.usr_id "
                + "WHERE _DT.usr_id = '" + request.getParameter("myID") +"';";

        Connection conn=DriverManager.getConnection(url, username, password);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        rs.next();

%>
            <div class="main_content_card">
                <div class="card_title_zone">
                    My Account Balance
                </div>
                <div class="card_element centered_in_card" style="font-size: medium">
                    <table>
                        <tr>
                            <td>
                                User ID:
                            </td>
                            <td>
                                <%= rs.getInt("usr_id") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                My Balance:
                            </td>
                            <td>
                                <%= String.format("%.2f",((float)rs.getInt("usr_bal"))/100) + "php" %>
                            </td>
                        </tr>
                    </table>
                </div>
            </div><br/>
                            
        <form action="topup" method="post">
            <input type="hidden" name="url_param" value="<%= request.getParameter("myID")%>">
            <div class="main_content_card">
                <div class="card_title_zone">
                    Is your balance not enough?
                </div>
                <div class="card_element centered_in_card" style="font-size: medium">
                    <table>
                        <tr>
                            <td>
                                Cash Code:
                            </td>
                            <td>
                                <input type="text" name="cash_code" value=""/>
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="card_button_zone centered_in_card">
                    <input type="submit" value="Top up!"/>
                </div>
            </div>
        </form>
<%  }
    catch (Exception e) {
        e.printStackTrace();
    }
%>
    </body>
</html>

