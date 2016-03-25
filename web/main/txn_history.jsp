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
                <a href="#" onclick="history.back();"><div class="page_header_button">Back</div></a>            
            </div>
        </div><br/>
            <div class="main_content_card">
                <div class="card_title_zone">
                    <img src="The-Professionals.png"/>
                </div>
                <div class="card_element centered_in_card">
                    <table>
                        <tr>
                            <td class="frm_usr xlarge">
                                Paid by
                            </td>
                            <td class="to_usr xlarge">
                                Received by
                            </td>
                            <td class="txn_amt xlarge">
                                Amount
                            </td>
                            <td class="txn_datetime xlarge">
                                Date
                            </td>
                        </tr>
                        
<%
    try {
        
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://188.166.204.23:5432/chatservdb";
        String username = "chatservadmin";
        String password = "chatservadmin";
        String query = "SELECT "
                + "userFrom.usr_firstname as uff, "
                + "userFrom.usr_lastname as ufl, "
                + "userTo.usr_firstname as utf, "
                + "userTo.usr_lastname as utl, "
                + "usr_txn.txn_amt as tamt, "
                + "usr_txn.txn_datetime as tdt "
                + "FROM usr_txn "
                + "INNER JOIN usr_data userFrom ON usr_txn.frm_usr = userFrom.usr_id "
                + "INNER JOIN usr_data userTo ON usr_txn.to_usr = userTo.usr_id "
                + "WHERE frm_usr = " + request.getParameter("myID").toString()
                + " OR to_usr = " + request.getParameter("myID").toString()
                + "ORDER BY userFrom, userTo DESC ";

       
         System.out.println(query);
        
        Connection conn=DriverManager.getConnection(url, username, password);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        
        
        while(rs.next()) {
%>
                        <tr>
                            <td class="frm_usr">
                                <%= rs.getString("uff") + " " + rs.getString("ufl")%>
                                </a>
                            </td>
                            <td class="to_usr">
                                <%= rs.getString("utf") + " " + rs.getString("utl")%>
                            </td>
                            <td class="txn_amt">
                                <%= "Php " + String.format("%.2f",((float)rs.getInt("tamt"))/100) %>
                            </td>
                            <td class="txn_datetime">
                                <%= rs.getDate("tdt")%>
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

