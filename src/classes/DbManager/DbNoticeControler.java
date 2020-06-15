package classes.DbManager;

import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;

public class DbNoticeControler {
    public static Notice getLastNotice() {
        List<Notice> lNotices = getAllNotices();
        Notice notice = lNotices.get(0);

        return notice;
    }

    public static List<Notice> getAllNotices() {
        Connection conn = DbUtil.getConnection();
        String sql = "SELECT * FROM notice ORDER BY n_id DESC";
        List<Notice> result = new ArrayList<>();
        Statement stmt;
        ResultSet rs;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            Notice temp = null;

            while (rs.next()) {
                temp = new Notice();
                temp.setDate(rs.getDate("n_date"));
                temp.setNotice(rs.getString("n_notice"));
                temp.setId(rs.getInt("n_id"));
                result.add(temp);
            }
            
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }

    public static int getLastId() {
        List<Notice> rs = getAllNotices();
        if (rs.size() != 0)
            return rs.get(0).getId();
        else 
            return 0;
    }

    public static void delNotice(int id) {
        Connection conn = DbUtil.getConnection();
        String sql = "DELETE FROM notice WHERE n_id=?";
        try {
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setInt(1, id);

            ptmt.executeUpdate();

            ptmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void addNotice(String notice) {
        Connection conn = DbUtil.getConnection();
        String sql = "INSERT INTO notice (n_id, n_date, n_notice)" + "VALUES (?, ?, ?)";
        Date curDate = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        PreparedStatement ptmt;
        try {
            ptmt = conn.prepareStatement(sql);
            ptmt.setInt(1, getLastId()+1);
            ptmt.setString(2, format.format(curDate));
            ptmt.setString(3, notice);

            ptmt.executeUpdate();

            ptmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return;
    }
}