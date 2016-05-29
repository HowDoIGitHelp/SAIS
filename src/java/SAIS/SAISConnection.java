/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SAIS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
    public void connect() throws ClassNotFoundException, SQLException{
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/sais", "root", "");
            query = conn.createStatement();
            //String respond = "";
        
    }
    public ResultSet executeQuery(String s) throws SQLException{
        return query.executeQuery(s);
    }
    public void executePreparedQuery(String s,String s1) throws SQLException{
        PreparedStatement stmt = conn.prepareStatement(s);
        stmt.setString(1, s1);
        stmt.execute();
    }
    public void executePreparedQuery(String s,String s1,String s2) throws SQLException{
        PreparedStatement stmt = conn.prepareStatement(s);
        stmt.setString(1, s1);
        stmt.setString(2, s2);
        stmt.execute();
    }
    public void executePreparedQuery(String s,String s1,String s2,String s3) throws SQLException{
        PreparedStatement stmt = conn.prepareStatement(s);
        stmt.setString(1, s1);
        stmt.setString(2, s2);
        stmt.setString(3, s3);
        stmt.execute();
    }
}
