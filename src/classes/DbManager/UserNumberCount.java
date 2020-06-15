package classes.DbManager;

import java.sql.*;
//用于计数总人数
public class UserNumberCount {
    
    public static int GetNumber(){
        Connection conn = DbUtil.getConnection();
        String sql = "SELECT * FROM NumberOfUser";
        PreparedStatement ptmt;
        ResultSet rs;
        int num = 0;

        try {
            ptmt = conn.prepareStatement(sql);
            rs = ptmt.executeQuery();
            rs.next();
            num = rs.getInt("number");
            rs.close();
            ptmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return num;
    }

    public static void Register() {
        Connection conn = DbUtil.getConnection();
        int current = GetNumber();
        String sql = "UPDATE NumberOfUser SET number=?";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setInt(1, current+1);
            
            ptmt.executeUpdate();

            ptmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}