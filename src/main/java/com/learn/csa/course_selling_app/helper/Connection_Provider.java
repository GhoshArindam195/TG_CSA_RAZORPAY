package com.learn.csa.course_selling_app.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connection_Provider {
    
     private static Connection con=null;
    
    public static Connection getConnection()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
//            Local...........
            String username="root";
            String pwd="arindam";
            String url="jdbc:mysql://localhost:3306/CSA";
            
//            Live.....................
//            String username="techghos_admin";
//            String pwd="Aghosh12345**";
//            String url ="jdbc:mysql://65.109.122.227:3306/techghos_csa";
            
            con = DriverManager.getConnection(url, username, pwd);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
}
