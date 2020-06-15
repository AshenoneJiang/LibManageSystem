package classes.DbManager;

import java.sql.*;//增删改查 Book表，并返回结果
import java.util.*;

public class DbBookControler {

    public static List<Book> QueryByName(String name) throws SQLException{
        Connection conn = DbUtil.getConnection(); //获取连接
        String sql = "SELECT * FROM Book WHERE b_name LIKE '%" + name + "%'";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        
        List<Book> result = new ArrayList<Book>();
        Book temp = null;
        while (rs.next()){
            temp = new Book();
            temp.setISBN(rs.getString("b_ISBN"));
            temp.setAuthor(rs.getString("b_author"));
            temp.setKeyword(rs.getString("b_keyword"));
            temp.setName(rs.getString("b_name"));
            temp.setPdate(rs.getString("b_pdate"));
            temp.setPublish(rs.getString("b_publishing"));
            temp.setSummary(rs.getString("b_summary"));
            temp.setCount(rs.getInt("b_count"));
            
            result.add(temp);
        }

        rs.close();
        stmt.close();

        return result;
    }//按名称查找

    public static List<Book> QueryByAuthor(String author) throws SQLException{
        Connection conn = DbUtil.getConnection(); //获取连接
        String sql = "SELECT * FROM Book WHERE b_author LIKE '%" + author + "%'";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        
        List<Book> result = new ArrayList<Book>();
        Book temp = null;
        while (rs.next()){
            temp = new Book();
            temp.setISBN(rs.getString("b_ISBN"));
            temp.setAuthor(rs.getString("b_author"));
            temp.setKeyword(rs.getString("b_keyword"));
            temp.setName(rs.getString("b_name"));
            temp.setPdate(rs.getString("b_pdate"));
            temp.setPublish(rs.getString("b_publishing"));
            temp.setSummary(rs.getString("b_summary"));
            temp.setCount(rs.getInt("b_count"));
            
            result.add(temp);
        }

        rs.close();
        stmt.close();
        return result;
    }//根据作者搜索

    public static void ModifyCount(String name)throws SQLException{
        Connection conn = DbUtil.getConnection();
        List<Book> rs = null;
        rs = QueryByName(name);

        String sql = "UPDATE Book SET b_count=? WHERE b_name=?";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setInt(1, rs.get(0).getCount());
        ptmt.setString(2, rs.get(0).getName());

        ptmt.execute();
        return;
    }//借一本书

    public static int ModifyByName(Book book)throws SQLException{
        Connection conn = DbUtil.getConnection();
        String sql = "UPDATE Book SET b_ISBN=?, b_author=?, b_publishing=?, b_keyword=?, b_summary=?, b_pdate=?, b_count=? WHERE b_name=?";

        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, book.getISBN());
        ptmt.setString(2, book.getAuthor());
        ptmt.setString(3, book.getPublish());
        ptmt.setString(4, book.getKeyword());
        ptmt.setString(5, book.getSummary());
        ptmt.setString(6, book.getPdate());
        ptmt.setInt(7, book.getCount());
        ptmt.setString(8, book.getName());
        return ptmt.executeUpdate();
    }//修改某个书名的信息

    public static int DeleteByName(String name)throws SQLException{
        Connection conn = DbUtil.getConnection();
        String sql = "DELETE FROM Book WHERE b_name=?";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, name);
        return ptmt.executeUpdate();
    }//根据名称删除 返回值为删除的行数

    public static void AddNewBook(Book book)throws SQLException{
        Connection conn = DbUtil.getConnection();
        String sql = "INSERT INTO Book (b_ISBN, b_name, b_author, b_publishing, b_keyword, b_summary, b_pdate, b_count) VALUES" + 
        "(?,?,?,?,?,?,?,?)";

        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, book.getISBN());
        ptmt.setString(2, book.getName());
        ptmt.setString(3, book.getAuthor());
        ptmt.setString(4, book.getPublish());
        ptmt.setString(5, book.getKeyword());
        ptmt.setString(6, book.getSummary());
        ptmt.setString(7, book.getPdate());
        ptmt.setInt(8, book.getCount());

        ptmt.execute();

        ptmt.close();
        return;
    }//新增一本书
}
