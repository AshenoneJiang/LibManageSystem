package classes.DbManager;

import java.sql.*;

public class DbRuleController {
    public static int getMaxTime(){
        Connection conn = DbUtil.getConnection();
        String sql = "SELECT r_maxTime FROM Rule";
        ResultSet rs = null;
        int maxTime = 0;

        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            rs = ptmt.executeQuery();
            if(rs.next()){
                maxTime = rs.getInt("r_maxTime");
            }
            rs.close();
            ptmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return maxTime;
    }

    public static int getMaxBook(){
        Connection conn = DbUtil.getConnection();
        String sql = "SELECT r_maxBook FROM Rule";
        ResultSet rs = null;
        int max = 0;

        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            rs = ptmt.executeQuery();
            if(rs.next()){
                max = rs.getInt("r_maxBook");
            }
            rs.close();
            ptmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return max;
    }

    public static void modifyMaxTime(int time){
        Connection conn = DbUtil.getConnection();
        String sql = "UPDATE Rule SET r_maxTime="+time;

        try {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    public static void modifyMaxBook(int book){
        Connection conn = DbUtil.getConnection();
        String sql = "UPDATE Rule SET r_maxBook="+book;

        try {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}