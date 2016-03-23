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
public class Registration {

    public static boolean insertUserData(
            String userName,
            String userPass,
            String userFirstName,
            String userLastName,
            String userProfession,
            boolean userIsProfessional,
            int userAge,
            String userGender) {
        
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

        String sql = "INSERT INTO usr_data VALUES(NEXTVAL('seq_usr_id'),?,?,?,?,?,?,?,?);";
        String sql2 = "INSERT INTO usr_bal VALUES(CURRVAL('seq_usr_id'),0);";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            PreparedStatement stmt2 = connection.prepareStatement(sql2);

            stmt.setString(1, userName);
            stmt.setString(2, userPass);
            stmt.setString(3, userFirstName);
            stmt.setString(4, userLastName);
            stmt.setString(5, userProfession);
            stmt.setBoolean(6, userIsProfessional);
            stmt.setInt(7, userAge);
            stmt.setString(8, userGender);
            
            
            if(stmt.executeUpdate() == 1) {
                stmt2.execute();
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
