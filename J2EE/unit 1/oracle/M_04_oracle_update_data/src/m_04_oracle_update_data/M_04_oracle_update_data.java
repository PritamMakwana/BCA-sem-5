/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m_04_oracle_update_data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

/**
 *
 * @author Dell
 */
public class M_04_oracle_update_data {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con;
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
            PreparedStatement pupdete = con.prepareStatement("UPDATE student SET srollno= ? , sname= ? ,sclass= ? WHERE sid= ? ");
            Scanner sc = new Scanner(System.in);
            System.out.println("id  update enter: ");
            int idupdate = sc.nextInt();
            System.out.println("Name : ");
            String name = sc.next();
            System.out.println("class : ");
            String cls = sc.next();
            System.out.println("roll : ");
            String roll = sc.next();

            pupdete.setString(1, roll);
            pupdete.setString(2, name);
            pupdete.setString(3, cls);
            pupdete.setInt(4, idupdate);
            int resupdate = pupdete.executeUpdate();
            System.out.println("update of record inserted : " + resupdate);

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }

    }

}
