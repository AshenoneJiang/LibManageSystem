package classes.DbManager;

import java.sql.*;
import java.util.*;



public class DbUserControler {

    public static List<User> QueryByName(String user) throws SQLException {
        Connection conn = DbUtil.getConnection();
        String sql = "SELECT * FROM Login WHERE l_username=?";
        ResultSet rs = null;
        PreparedStatement ptmt = conn.prepareStatement(sql);

        List<User> result = new ArrayList<>();
        ptmt.setString(1, user);
        rs = ptmt.executeQuery();

        User temp = null;
        while (rs.next()) {
            temp = new User();
            temp.setId(rs.getInt("l_id"));
            temp.setUsername(rs.getString("l_username"));
            temp.setPassword(rs.getString("l_password"));
            temp.setAdmin(rs.getInt("l_isAdmin") == 1 ? true : false);
            result.add(temp);
        }

        rs.close();
        ptmt.close();
        return result;
    }

    public static List<User> getAllUser() throws SQLException {
        Connection conn = DbUtil.getConnection();
        String sql = "SELECT * FROM Login WHERE l_isAdmin=0";
        ResultSet rs = null;
        PreparedStatement ptmt = conn.prepareStatement(sql);

        List<User> result = new ArrayList<>();
        rs = ptmt.executeQuery();

        User temp = null;
        while (rs.next()) {
            temp = new User();
            temp.setId(rs.getInt("l_id"));
            temp.setUsername(rs.getString("l_username"));
            temp.setPassword(rs.getString("l_password"));
            temp.setAdmin(rs.getInt("l_isAdmin") == 1 ? true : false);
            result.add(temp);
        }

        rs.close();
        ptmt.close();
        return result;
    }

    public static List<User> QueryById(int id) throws SQLException {
        Connection conn = DbUtil.getConnection();
        String sql = "SELECT * FROM Login WHERE l_id=?";
        ResultSet rs = null;
        PreparedStatement ptmt = conn.prepareStatement(sql);

        List<User> result = new ArrayList<>();
        ptmt.setInt(1, id);
        rs = ptmt.executeQuery();

        User temp = null;
        while (rs.next()) {
            temp = new User();
            temp.setId(rs.getInt("l_id"));
            temp.setUsername(rs.getString("l_username"));
            temp.setPassword(rs.getString("l_password"));
            temp.setAdmin(rs.getInt("l_isAdmin") == 1 ? true : false);
            result.add(temp);
        }

        rs.close();
        ptmt.close();
        return result;
    }

    public static int DeleteUserByName(String username)throws SQLException {
        Connection conn = DbUtil.getConnection();
        String sql = "DELETE FROM Login WHERE l_username=?";

        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, username);

        int result = ptmt.executeUpdate();
        ptmt.close();

        return result;
    }

    public static boolean AddUser(User new_user) {
        Connection conn = DbUtil.getConnection();
        String sql = "INSERT INTO Login (l_id, l_username, l_password, l_isAdmin)" + "VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement ptmt = conn.prepareStatement(sql); //get connection
            //set para
            ptmt.setInt(1, new_user.getId());
            ptmt.setString(2, new_user.getUsername());
            ptmt.setString(3, new_user.getPassword());
            ptmt.setInt(4, new_user.isAdmin() ? 1 : 0);
            //execute
            ptmt.executeUpdate();
            ptmt.close();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int ModifyUser(User user)throws SQLException{
        Connection conn = DbUtil.getConnection();
        String sql = "UPDATE Login SET l_username=?, l_password=? WHERE l_id=?";

        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, user.getUsername());
        ptmt.setString(2, user.getPassword());
        ptmt.setInt(3, user.getId());

        int result = ptmt.executeUpdate();
        ptmt.close();

        return result;
    }

    public static int Login(String user, String password) {
        List<User> users = null;
        try {
            users = QueryByName(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if (users.size() != 0) {
            User temp = users.get(0);
            String encode = SHA256.getSHA256(password);

            if (temp.getPassword().equals(encode)) {

                if (temp.isAdmin())
                    return 2;
                else
                    return 1;

            } else {
                return 0;
            } // password not right

        } else {
            return 3;
        } // username not found
    }

    public static boolean SignUp(String user, String password) {
        List<User> users = null;
        try {
            users = QueryByName(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (users.size() != 0) {
            return false;
        }
        else {
            User new_user = new User();
            new_user.setAdmin(false);
            new_user.setId(UserNumberCount.GetNumber() + 1);
            new_user.setUsername(user);
            new_user.setPassword(SHA256.getSHA256(password));
            UserNumberCount.Register();

            DbUserControler.AddUser(new_user);
            return true;
        }
    }

}