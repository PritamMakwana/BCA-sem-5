package m_01_oracle_select;

import java.sql.*;

public class M_01_oracle_select { 
    public static void main(String[] args) {
       try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con;
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from student");
        while(rs.next())
        {
            System.out.println("ID : "+rs.getString(1)+"  Name : "+rs.getString(2)+" Class : "+rs.getString(3)+"Roll No : "+rs.getString(4));
        }
        con.close();
        System.out.println("end of data");
        }
        catch(ClassNotFoundException | SQLException e)
        {
         System.out.println(e);
        }
    }
}
