package org.example;

import java.sql.*;

public class Main {
    public static void main(String[] args) {
        //Video used to connect DB to Java App: https://youtu.be/AHFBPxWebFQ?si=UMsBsKxpAOizz-9S

        Connection connection = null;

        try{
            //Xampp localhost URL for DB
            String local_DB_URL = "jdbc:mysql://localhost:3306/CA2";

            //User Login Details
            String username = "root";
            String password = "";

            connection = DriverManager.getConnection(local_DB_URL, username, password);

            //Testing
            Statement statement = connection.createStatement();
            String sql = "INSERT INTO Products (ProductID, Name, Price, Description) VALUES (26, 'Gaming Poster', 20.00, 'Posters of your favourite video game characters.');";
            statement.executeUpdate(sql);

            //Using ResultSet to output query
            ResultSet resultSet = statement.executeQuery("select * from products");

            //Constructing output
            while (resultSet.next()) {
                System.out.println(resultSet.getString(2 /* or 1 idk */));
            }


            //Closing / Ending connection
            connection.close();
        }

        //Error Catching / Handling
        catch (SQLException e) {
            for(Throwable t: e)
            {
                t.printStackTrace();
            }
        }
    }
}