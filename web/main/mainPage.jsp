<%-- 
    Document   : guestPage
    Created on : Mar 18, 2016, 11:06:53 AM
    Author     : Chino
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
                <%
                    int iResult = 0;
                    String chk = "";
                    try {
                        chk = request.getParameter("myID").toString();
                    }
                    catch (Exception e) {
                        
                    }
                    
                    if(!chk.equals("")) {
                        iResult = Integer.parseInt(chk);
                    }
                    else {
                        iResult = -1;
                    }
                    if (iResult > 0) {
                    %>
                    <a href="myProfile.jsp?myID=<%= request.getParameter("myID")%>"><div class="page_header_button">My Profile</div></a>
                    <a href="myAccount.jsp?myID=<%= request.getParameter("myID")%>"><div class="page_header_button">My Account</div></a>
                    <a href="txn_history.jsp?myID=<%= request.getParameter("myID")%>"><div class="page_header_button">Transactions History</div></a>                    
                    
                    <%
                }
                else if (iResult == -1) {
                    %>
                    <a href="myProfile.jsp?myID=${myID}"><div class="page_header_button">My Profile</div></a>
                    <a href="myAccount.jsp?myID=${myID}"><div class="page_header_button">My Account</div></a>
                    <a href="txn_history.jsp?myID=${myID}"><div class="page_header_button">Transactions History</div></a>                    
                    <%
                }%>
                <a href="/ProConWeb/"><div class="page_header_button">Log Out</div></a>
            </div>
        </div><br/>
            <div class="main_content_card">
                <div class="card_title_zone">
                    <img src="The-Professionals.png"/>
                </div>
                <div class="card_element centered_in_card">
                    <table>
                        <tr>
                            <td class="user_id xlarge">
                                UserID
                            </td>
                            <td class="name_of_pro xlarge">
                                Name of Professional
                            </td>
                            <td class="user_profs xlarge">
                                User Profession
                            </td>
                        </tr>
<%
    try {
        
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://188.166.204.23:5432/chatservdb";
        String username = "chatservadmin";
        String password = "chatservadmin";
        String query = "SELECT * "
                + "FROM usr_data _DATA "
                + "INNER JOIN usr_bal _BAL "
                + "ON _DATA.usr_id = _BAL.usr_id "
                + "WHERE usr_isprofesional=true "
                + "ORDER BY _BAL.usr_bal DESC, _DATA.usr_id DESC;";

        Connection conn=DriverManager.getConnection(url, username, password);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()) {
%>
                        <tr>
                            <td class="user_id">
<% if(iResult > 0) { %>
                            <a href="user.jsp?userID=<%= rs.getInt("usr_id")%>&myID=<%= request.getParameter("myID")%>" />
<%} else if(iResult == -1) { %>
                            <a href="user.jsp?userID=<%= rs.getInt("usr_id")%>&myID=${myID}" />
<%}%>   
                                <%= rs.getInt("usr_id")%>
                                </a>
                            </td>
                            <td class="name_of_pro">
                                <%= rs.getString("usr_firstname") + " " + rs.getString("usr_lastname")%>
                            </td>
                            <td class="user_profs">
                                <%= rs.getString("usr_profession")%>
                            </td>
                        </tr>
<%      } 
        rs.close();
        stmt.close();
        conn.close();
    }
    catch(Exception e) {
        e.printStackTrace();
    }
%>

                    </table>
                </div>
            </div>
    </body>
</html>

