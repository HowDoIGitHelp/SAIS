/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SAIS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rub account
 */

public class SAISConnection {
    Statement query;
    Connection conn;
    public SAISConnection() throws SQLException{
        
    }
    public void connect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/sais", "root", "");
            query = conn.createStatement();
            //String respond = "";
        } catch (ClassNotFoundException ex) {
            System.out.println("Class not found");
        } catch (SQLException ex) {
            System.out.println("SQL Exception");
        }
    }
    public ResultSet executeQuery(String s) throws SQLException{
        return query.executeQuery(s);
    }
}
