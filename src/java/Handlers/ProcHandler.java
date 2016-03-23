/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Handlers;

import java.sql.*;

/**
 *
 * @author Chino
 */
public class ProcHandler {
    private String userName;
    private String passWord;
    
    public ProcHandler() {
        userName = null;
        passWord = null;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getUserName() {
        return this.userName;
    }
    
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
    
    public String getTest() {
        //Establish Connection
        Connection connection = null;
        String url = "jdbc:postgresql://188.166.204.23:5432/chatservdb";
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, "chatservadmin", "chatservadmin");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error on connecting");
            System.out.println(e.toString());
        }
        
        //Query statement
        ResultSet rs = null;
        Statement s = null;
        try {
            s = connection.createStatement();
            rs = s.executeQuery("SELECT COUNT(*) FROM usr_data "
                    + "WHERE usr_name = '" + this.userName +"' "
                    + "AND usr_pass = '" + this.passWord +"';");
            rs.next();
            if(!rs.isAfterLast()) {
                if(rs.getInt(1) == 1) {
                    
                    return "Login Successful";
                }
                else {
                    return "Login Failed";
                }
            }
            else {
                return "NONE";
            }
        } catch(Exception e) {
            System.out.println("Problem in searching the database");
            System.out.println(e.toString());
        }
        return "NO CONNECTION";
    }
}
