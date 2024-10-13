package com.pet.pet;
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SQLExecuter {

    public static void executeSQLFromFile(String filePath) {
        StringBuilder sql = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                sql.append(line);
                if (line.trim().endsWith(";")) {
                    executeStatement(sql.toString());
                    sql.setLength(0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void executeStatement(String sql) throws Exception {
        String jdbcURL = "jdbc:mysql://localhost:3306";
        String username = "root";  // replace with your MySQL username
        String password = "";      // replace with your MySQL password

        try (Connection connection = DriverManager.getConnection(jdbcURL, username, password);
             Statement statement = connection.createStatement()) {
            statement.execute(sql);
        }
    }
}
