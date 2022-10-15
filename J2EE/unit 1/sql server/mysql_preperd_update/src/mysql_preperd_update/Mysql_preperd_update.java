/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysql_preperd_update;

import java.sql.*;
import java.util.*;

/**
 *
 * @author KSC
 */
public class Mysql_preperd_update {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_db", "root", "");
             System.out.println("------ALL Select recored -----");
            PreparedStatement psall = con.prepareStatement("SELECT * FROM student");
            ResultSet rsall = psall.executeQuery();
               while (rsall.next()) {
                System.out.println("name :" + rsall.getString(1) + " roll: " + rsall.getInt(2) + " age :" + rsall.getInt(3) + " class :" + rsall.getInt(4));
            }
       
       //-------------------------     
           PreparedStatement ps = con.prepareStatement("SELECT name, roll, age, class FROM student WHERE roll = ?");
            Scanner sc = new Scanner(System.in);
            System.out.println("------Select recored Roll using-----");
            System.out.println("Roll : ");
            int roll = sc.nextInt();
            ps.setInt(1, roll);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("name :" + rs.getString(1) + " roll: " + rs.getInt(2) + " age :" + rs.getInt(3) + " class :" + rs.getInt(4));
            }
            if (rs.next() == false) {
                System.out.println("End record ");
            }
//-------------------------------
            PreparedStatement pupdete = con.prepareStatement("UPDATE student SET name= ?,age=?,class=? WHERE roll = ? ");
            System.out.println("------Update recored-----");
            System.out.println("Roll  update enter: ");
            int rollupdate = sc.nextInt();
            System.out.println("Name : ");
            String name = sc.next();
            System.out.println("Age : ");
            int age = sc.nextInt();
            System.out.println("Class : ");
            int cls = sc.nextInt();
            

            pupdete.setString(1, name);
            pupdete.setInt(2, age);
            pupdete.setInt(3, cls);
            pupdete.setInt(4, rollupdate);
            int resupdate = pupdete.executeUpdate();
            System.out.println("update of record inserted : " + resupdate); 
  //--------------------------------------
            PreparedStatement psdele = con.prepareStatement("DELETE FROM student WHERE roll=?");
            System.out.println("Roll  delete  enter: ");
            int rolldele = sc.nextInt();
            
            psdele.setInt(1, rolldele);
            int delete = psdele.executeUpdate();
            System.out.println("delete of record : " + delete ); 
 //---------------------------------------           
            con.close();
            

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

}
