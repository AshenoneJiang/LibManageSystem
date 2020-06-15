package classes.DbManager;
import java.lang.String;

public class Book {
    private String name;
    private String author;
    private String publish;
    private String keyword;
    private String summary;
    private String pdate;
    private String ISBN;
    private int count;

    public String getAuthor() {
        return author;
    }
    public int getCount() {
        return count;
    }
    public String getISBN() {
        return ISBN;
    }
    public String getKeyword() {
        return keyword;
    }
    public String getName() {
        return name;
    }
    public String getPdate() {
        return pdate;
    }
    public String getPublish() {
        return publish;
    }
    public String getSummary() {
        return summary;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    public void setCount(int count) {
        this.count = count;
    }
    public void setISBN(String iSBN) {
        ISBN = iSBN;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPdate(String pdate) {
        this.pdate = pdate;
    }
    public void setPublish(String publish) {
        this.publish = publish;
    }
    public void setSummary(String summary) {
        this.summary = summary;
    }
}