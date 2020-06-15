package classes.DbManager;

import java.util.*;

public class Notice {
    int id;
    Date date;
    String notice;
    
    public int getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    public String getNotice() {
        return notice;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }
}