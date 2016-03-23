/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Security;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Chino
 */
public class Update {
    public static boolean updateRecord(int uID, String uPass, String uFName, String uLName, String uProfs, String uGender) {
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
        ResultSet rs;
        Statement s;
        String sql = "UPDATE usr_data" +
                "   SET usr_pass=?, usr_firstname=?, usr_lastname=?, " +
                "       usr_profession=?, usr_sex=?" +
                " WHERE usr_id='" + uID + "';";
        try {
            s = connection.createStatement();
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setString(1, uPass);
            stmt.setString(2, uFName);
            stmt.setString(3, uLName);
            stmt.setString(4, uProfs);
            stmt.setString(5, uGender);
            
            if(stmt.executeUpdate() == 1) {
                System.out.println("Valid Update");
                return true;
            }
            else {
                System.out.println("Error on query");
                return false;
            }
        } catch(Exception e) {
            System.out.println("Problem in searching the database");
            System.out.println(e.toString());
        }
        System.out.println("This statement should not be reached.");
        return false;
    }

}
