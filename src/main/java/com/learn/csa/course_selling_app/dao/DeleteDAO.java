package com.learn.csa.course_selling_app.dao;

import com.learn.csa.course_selling_app.helper.Connection_Provider;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteDAO {

    public static boolean deleteProfile(int id) {
        boolean f = false;
        try {

            Connection con = Connection_Provider.getConnection();

            String storedProcedureCall = "{CALL SP_DEL_STUDENT_PROFILE(?, ?)}";

            CallableStatement callableStatement = con.prepareCall(storedProcedureCall);

            callableStatement.setString(1, "DELETE");
            callableStatement.setInt(2, id);
            
            callableStatement.execute();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }
}
