package classes.DbManager;

import java.sql.*;
// 用于连接数据库，返回连接
public class DbUtil {
    public static final String url = "jdbc:mysql://47.100.52.170:3306/LibManager";
    public static final String user = "LibManager";
    public static final String password = "MBDdjMx8kfPrRERs";
    private static Connection connection = null;
    static{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            System.out.println("Cant Find MYSQL Driver");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connect data base fail");
        }
    }

    public static Connection getConnection(){
        return connection;
    }
}