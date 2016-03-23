package Security;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Chino
 */
public class Transfer {
    
    public static boolean doFundTransfer(String fromID, String toID, int cashAmount) {
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
        String sql = "UPDATE usr_bal "
                    + "SET usr_bal = usr_bal + ? "
                    + " WHERE usr_id = ?;";
        
        String sql2 = "UPDATE usr_bal "
                    + "SET usr_bal = usr_bal - ? "
                    + " WHERE usr_id = ?;";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setInt(1, cashAmount);
            stmt.setInt(2, Integer.parseInt(toID));
            System.out.println("stmt: " + stmt.toString());
            stmt.executeUpdate();

            PreparedStatement stmt2 = connection.prepareStatement(sql2);
            
            stmt2.setInt(1, cashAmount);
            stmt2.setInt(2, Integer.parseInt(fromID));
            System.out.println("stmt2: " + stmt2.toString());
            stmt2.executeUpdate();
            
            System.out.println("Valid Update");
            return true;
        } catch(Exception e) {
            System.out.println("Problem in searching the database");
            System.out.println(e.toString());
        }
        System.out.println("This statement should not be reached.");
        return false;
    }

}
