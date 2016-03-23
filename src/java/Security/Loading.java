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
public class Loading {
    public static boolean topUp (String uID, String cashCode) {
        System.out.println("Registration.insertUserData");
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
        
        try {
            String sql1 = "SELECT tu_amount FROM top_up_codes WHERE tu_is_used = false AND "
                + "tu_code = '" + cashCode + "'";
            Statement stmt1 = connection.createStatement();
            ResultSet rs = stmt1.executeQuery(sql1);
            int iCashIn = 0;
            if(rs.next()) {
                iCashIn = rs.getInt(1);
            }
            else {
                System.out.println("Invalid Code");
                return false;
            }
            
            String sql2 = "UPDATE top_up_codes SET tu_is_used = true WHERE "
                    + "tu_code = '" + cashCode + "'";
            PreparedStatement stmt2 = connection.prepareStatement(sql2);
            stmt2.executeUpdate();

            String sql = "UPDATE usr_bal SET usr_bal = usr_bal + " + iCashIn +
                " WHERE usr_id = " + uID;

            PreparedStatement stmt = connection.prepareStatement(sql);
            
            if(stmt.executeUpdate() == 1) {
                System.out.println("Valid Insert");
                return true;
            }
            else {
                System.out.println("Invalid Insert");
                return false;
            }
        } catch (Exception e) {
            System.out.println("Problem in searching the database");
            System.out.println(e.toString());
        }
        System.out.println("This statement should not be reached.");
        return false;
    }


}
