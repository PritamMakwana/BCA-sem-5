/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m_02_oracle_insert_data;

import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author Dell
 */
public class M_02_oracle_insert_data {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con;
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
            PreparedStatement ps =con.prepareStatement("INSERT INTO student VALUES (? , ? , ? , ?)");
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter Student ID : ");
            String sid = sc.next();
            System.out.println("Enter Student Name : ");
            String sname = sc.next();
            System.out.println("Enter Student Class : ");
            String sclass = sc.next();
            System.out.println("Enter Student Roll No : ");
            String srollno = sc.next();
            ps.setString(1, sid);
            ps.setString(2, sname);
            ps.setString(3, sclass);
            ps.setString(4, srollno);
            int result = ps.executeUpdate();    
            con.close();
            System.out.println("Number of record inserted : " + result);
            
        } catch (ClassNotFoundException | SQLException e) {
                System.out.println(e);
        }
    }
}
