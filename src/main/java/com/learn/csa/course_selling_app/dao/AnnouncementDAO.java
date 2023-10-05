package com.learn.csa.course_selling_app.dao;

import com.learn.csa.course_selling_app.entity.Announcement;
import com.learn.csa.course_selling_app.helper.Connection_Provider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AnnouncementDAO {
    
    public static boolean saveAnnouncement(Announcement announcement){
        
        boolean f = false;
        try
        {
            Connection con = Connection_Provider.getConnection();
            
            String sql = "INSERT INTO announcements (start_date,end_date,linked_course_id,a_img) VALUES(?,?,?,?)";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, announcement.getA_starDate());
            pstmt.setString(2, announcement.getA_endDate());
            
            if(announcement.getLinked_course_id() == null)
                pstmt.setNull(3, java.sql.Types.INTEGER);
            else
                pstmt.setInt(3, announcement.getLinked_course_id());
            
            pstmt.setString(4, announcement.getA_img());
            
            pstmt.executeUpdate();
            
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
        
    }
    
    public static List<Announcement> getAllCurrentAnnouncements()
    {
        List<Announcement> announcements=new ArrayList<>();//blank arraylist is created to return every course
        try{
            Connection con= Connection_Provider.getConnection();
            String sql="SELECT * FROM announcements WHERE CURDATE()>=date(start_date) && CURDATE()<=date(end_date);";
            Statement statement=con.createStatement();//blank satatement returned
            ResultSet set= statement.executeQuery(sql);
            
            while(set.next())
            {
                Announcement announcement=new Announcement(set.getInt(1),set.getString(2),set.getString(3),set.getInt(4),set.getString(5));
                announcements.add(announcement);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return announcements;//if no course and get into the database then size will be returned as 0
    }
    
    public static List<Announcement> getAllAnnouncements()
    {
        List<Announcement> announcements=new ArrayList<>();//blank arraylist is created to return every course
        try{
            Connection con= Connection_Provider.getConnection();
            String sql="SELECT * FROM announcements";
            Statement statement=con.createStatement();//blank satatement returned
            ResultSet set= statement.executeQuery(sql);
            
            while(set.next())
            {
                Announcement announcement=new Announcement(set.getInt(1),set.getString(2),set.getString(3),set.getInt(4),set.getString(5));
                announcements.add(announcement);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return announcements;//if no course and get into the database then size will be returned as 0
    }
    
    
    
}
