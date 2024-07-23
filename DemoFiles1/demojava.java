import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/testdb";
        String user = "root";
        String password = "password";

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection(url, user, password);

            // Create a statement object
            Statement stmt = conn.createStatement();

            // Execute a query
            String query = "SELECT * FROM users";
            ResultSet rs = stmt.executeQuery(query);

            // Process the result set
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id") +
                                   ", Username: " + rs.getString("username") +
                                   ", Email: " + rs.getString("email"));
            }

            // Close the connections
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
