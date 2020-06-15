package classes.DbManager;
import java.util.Date;

public class Borrow {
    int id;
    String bookName;
    int userId;

    Date begin;
    Date end = null;
    int time; //day

    public Date getBegin() {
        return begin;
    }

    public Date getEnd() {
        return end;
    }

    public String getBookName() {
        return bookName;
    }

    public int getId() {
        return id;
    }

    public int getTime() {
        return time;
    }

    public int getUserId() {
        return userId;
    }

    public void setBegin(Date begin) {
        this.begin = begin;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public void setTime(int time) {
        this.time = time;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}