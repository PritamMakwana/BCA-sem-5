/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m_03_oracle_delete_data;

/**
 *
 * @author Dell
 */
import java.sql.*;
import java.util.Scanner;
public class M_03_oracle_delete_data {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con;
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
            PreparedStatement ps =con.prepareStatement("DELETE FROM student WHERE sid = ?");
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter Student ID : ");
            String sid = sc.next();
            ps.setString(1, sid);
            int result = ps.executeUpdate();    
            con.close();
            System.out.println("Number of record Deleted : " + result);
            
        } catch (ClassNotFoundException | SQLException e) {
                System.out.println(e);
        }
    }
    
}
