package com.learn.csa.course_selling_app.dao;

import com.learn.csa.course_selling_app.helper.Connection_Provider;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class FeedbackDAO {

    public static Map<Integer, String[]> getCoursesFeedbackCountAndRAtings() {
        Map<Integer, String[]> map = new HashMap<>();
        try {
            
            Connection con = Connection_Provider.getConnection();
            String query = "SELECT COURSE_ID, COUNT(*) AS FEEDBACK_COUNT, ROUND(AVG(RATING),2) FROM csa.feedback GROUP BY COURSE_ID";
            Statement statement = con.createStatement();//blank satatement returned
            ResultSet set = statement.executeQuery(query);
            
            while(set.next()){
                
                int course_id = set.getInt(1);
                String feedback_count = set.getInt(2)+"";
                String avg_rating = set.getDouble(3)+"";
                
                map.put(course_id, new String[]{course_id+"", feedback_count, avg_rating});
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;

    }
}
