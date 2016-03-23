package Security;


import java.sql.*;

public class Validate {

    public static int getUserID(String user_name, String user_pass) {
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
        try {
            s = connection.createStatement();
            rs = s.executeQuery("SELECT usr_id FROM usr_data "
                    + "WHERE usr_name = '" + user_name +"' "
                    + "AND usr_pass = '" + user_pass +"';");
            rs.next();
            if(!rs.isAfterLast()) {
                System.out.println("UserName: " + user_name);
                System.out.println("Password: " + user_pass);
                System.out.println("Result is: " + rs.getString(1));
                if(rs.getInt(1) != 0) {
                    System.out.println("Login is successful");
                    return rs.getInt(1);
                }
                else {
                    System.out.println("Username and password incorrect");
                    return 0;
                }
            }
            else {
                System.out.println("Error on query");
                return 0;
            }
        } catch(Exception e) {
            System.out.println("Problem in searching the database");
            System.out.println(e.toString());
        }
        System.out.println("This statement should not be reached.");
        return 0;
    }
}
