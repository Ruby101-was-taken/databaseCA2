package org.example;

import java.sql.*;

public class Main {
    public static void main(String[] args) {
        Connection connection = null;

        try{
            String local_DB_URL = "jdbc:mysql://localhost:3306/CA2";

            String username = "root";
            String password = "";

            connection = DriverManager.getConnection(local_DB_URL, username, password);

            Statement statement = connection.createStatement();
            String sql = "INSERT INTO Products (ProductID, Name, Price, Description) VALUES (26, 'Gaming Poster', 20.00, 'Posters of your favourite video game characters.');";
            statement.executeUpdate(sql);

            ResultSet resultSet = statement.executeQuery("select * from products");

            while (resultSet.next()) {
                System.out.println(resultSet.getString(2));
            }


            connection.close();
        }

        catch (SQLException e) {
            for(Throwable t: e)
            {
                t.printStackTrace();
            }
        }
    }
}