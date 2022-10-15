/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysql_prepred;


import java.util.Scanner;
import java.sql.*;
/**
 *
 * @author KSC
 */
public class MySql_Prepred {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        try {
             Class.forName("com.mysql.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_db", "root", "");
             PreparedStatement ps = con.prepareStatement("Insert into student (name ,roll,age,class ) VALUES (? , ? , ? , ?)");
            
             Scanner sc = new Scanner(System.in);
             
             System.out.println("Name : ");
             String name = sc.next();
             System.out.println("Roll : ");
             int roll = sc.nextInt();
             System.out.println("Age : ");
             int age = sc.nextInt();
             System.out.println("Class : ");
             int cls = sc.nextInt();
                  
             ps.setString(1, name);
             ps.setInt(2, roll);
             ps.setInt(3, age);
             ps.setInt(4, cls);
             
             int result = ps.executeUpdate();
             con.close();
             System.out.println("number of record inserted : " + result);
             
             
        } catch (ClassNotFoundException  | SQLException e) {
            System.out.println(e);
        }

    }

}
