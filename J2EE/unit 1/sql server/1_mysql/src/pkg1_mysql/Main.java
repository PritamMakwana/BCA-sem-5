/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg1_mysql;

import java.sql.*;
import java.util.*;


/**
 *
 * @author KSC
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_db", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from student");
            while (rs.next()) {
                System.out.println("name :"+rs.getString(1)+ " roll: " + rs.getInt(2) + " age :" + rs.getInt(3));
            }

            con.close();
            System.out.println("End of Data !!!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error :"+e);
        }

    }

}
