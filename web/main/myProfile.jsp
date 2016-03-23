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
        </div>
<%
    try {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://188.166.204.23:5432/chatservdb";
        String username = "chatservadmin";
        String password = "chatservadmin";
        System.out.println(request.getParameter("myID"));
        String query = "SELECT * FROM usr_data WHERE usr_id = " + request.getParameter("myID") +";";

        Connection conn=DriverManager.getConnection(url, username, password);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        rs.next();

%>
        <form action="updater" method="post">
            <input type="hidden" name="url_param" value="<%= request.getParameter("myID")%>">
            <div class="main_content_card">
                <div class="card_title_zone">
                    <img src="User-Profile.png"/>
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
                                User Name:
                            </td>
                            <td>
                                <%= rs.getString("usr_name") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password:
                            </td>
                            <td>
                                <input name="f_usr_pass" type="password" value="" required="required"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                First Name:
                            </td>
                            <td>
                                <input name="f_usr_firstname" type="text" value="<%= rs.getString("usr_firstname") %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Last Name:
                            </td>
                            <td>
                                <input name="f_usr_lastname" type="text" value="<%= rs.getString("usr_lastname") %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Profession:
                            </td>
                            <td>
                                <input name="f_usr_profession" type="text" value="<%= rs.getString("usr_profession") %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender(M/F):
                            </td>
                            <td>
                                <input name="f_usr_sex" type="text" value="<%= rs.getString("usr_sex") %>" maxlength="1" pattern="[MF]{1}" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="align-content: center;">
                                <input type="submit" value="Update Details"/>
                            </td>
                        </tr>
                    </table>
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

