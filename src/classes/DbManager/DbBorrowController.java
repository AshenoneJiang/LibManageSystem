package classes.DbManager;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;


public class DbBorrowController {
    private static List<Borrow> executeQuery(String sql) {
        Connection conn = DbUtil.getConnection();
        ResultSet rs = null;
        Statement stmt = null;

        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        List<Borrow> resultBorrows = new ArrayList<>();
        Borrow e = null;
        try{
            while (rs.next()){
                e = new Borrow();
                e.setId(rs.getInt("bo_id"));
                e.setBookName(rs.getString("bo_bookName"));
                e.setUserId(rs.getInt("bo_userId"));
                e.setBegin(rs.getDate("bo_begin"));
                e.setEnd(rs.getDate("bo_end"));
                e.setTime(rs.getInt("bo_maxTime"));
                
                resultBorrows.add(e);
            }
            
            rs.close();
            stmt.close();
        } catch (SQLException exception){
            exception.printStackTrace();
        }
        
        return resultBorrows;
    }


    
    public static List<Borrow> getAlBorrows(){
        String sql = "SELECT * FROM Borrow ORDER BY bo_begin DESC";
        return executeQuery(sql);
    }

    public static List<Borrow> getAlBorrows(int userId){
        String sql = "SELECT * FROM Borrow WHERE bo_userId = " + userId +" ORDER BY bo_begin DESC";
        return executeQuery(sql);
    }

    public static List<Borrow> getEndBorrows(){
        String sql = "SELECT * FROM Borrow WHERE bo_end IS NOT NULL ORDER BY bo_begin DESC";
        return executeQuery(sql);
    }

    public static List<Borrow> getEndBorrows(int userId){
        String sql = "SELECT * FROM Borrow WHERE bo_end IS NOT NULL AND bo_userId = " + userId + " ORDER BY bo_begin DESC";
        return executeQuery(sql);
    }

    public static List<Borrow> getNotEndBorrows() {
        String sql = "SELECT * FROM Borrow WHERE bo_end IS NULL ORDER BY bo_begin DESC";
        return executeQuery(sql);
    } 

    public static List<Borrow> getNotEndBorrows(int userId) {
        String sql = "SELECT * FROM Borrow WHERE bo_end IS NULL AND bo_userId = " + userId + " ORDER BY bo_begin DESC";
        return executeQuery(sql);
    } 

    public static int getId() {
        String sql = "SELECT * FROM Borrow ORDER BY bo_id DESC";
        List<Borrow> rs = executeQuery(sql);
        if (rs.size() == 0)
        	return 0;
        else
        	return rs.get(0).getId();
    }
    
    public static int addBorrow(int userId, String bookName, int time){
        Connection conn = DbUtil.getConnection();
        Book bookCount = null;

        try{
            bookCount = DbBookControler.QueryByName(bookName).get(0);
            if (bookCount.getCount() == 0){
                return 0;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }// if book count is 0

        String sql = "INSERT INTO Borrow (bo_id, bo_bookName, bo_userId, bo_begin, bo_maxTime)"+" VALUES (?,?,?,?,?)";
        Date curDate = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setInt(1, getId()+1);
            ptmt.setString(2, bookName);
            ptmt.setInt(3, userId);
            ptmt.setString(4, format.format(curDate));
            ptmt.setInt(5, time);

            ptmt.executeUpdate();
            ptmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        try{
            bookCount.setCount(bookCount.getCount()-1); //update book count
            if (DbBookControler.ModifyByName(bookCount) == 0)
                return -2;
        } catch (SQLException e){
            return -1;
        }
        return 1;
    }

    public static void delBorrow(int id){
        Connection conn = DbUtil.getConnection();
        String sql = "DELETE FROM Borrow WHERE bo_id=?";
        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);
            ptmt.setInt(1, id);

            ptmt.executeUpdate();

            ptmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void backBook(int userId, String bookName){
        Connection conn = DbUtil.getConnection();
        String sql = "UPDATE Borrow SET bo_end=? WHERE bo_userId=? AND bo_bookName=?";

        Date curDate = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        try{
            PreparedStatement ptmt = conn.prepareStatement(sql);

            ptmt.setString(1, format.format(curDate));
            ptmt.setInt(2, userId);
            ptmt.setString(3, bookName);

            ptmt.executeUpdate();

            //update count of book
            Book book = DbBookControler.QueryByName(bookName).get(0);
            book.setCount(book.getCount()+1);
            DbBookControler.ModifyByName(book);

            ptmt.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

}