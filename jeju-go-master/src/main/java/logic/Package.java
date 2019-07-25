package logic;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Package {
   private int no;
   private String name;
   private String content;
   private String travelday;
   private int price;
   private int mon;
   private String startday;
   private Date regdate;
   private int max;
   private String photourl;
   private String photoname;
   private List<String> startdays;
   private List<String> enddays;
   
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getTravelday() {
      return travelday;
   }
   public void setTravelday(String travelday) {
      this.travelday = travelday;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public int getMon() {
      return mon;
   }
   public void setMon(int mon) {
      this.mon = mon;
   }
   public String getStartday() {
      return startday;
   }
   public void setStartday(String startday) {
      this.startday = startday;
   }
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
   public int getMax() {
      return max;
   }
   public void setMax(int max) {
      this.max = max;
   }
   public String getPhotourl() {
      return photourl;
   }
   public void setPhotourl(String photourl) {
      this.photourl = photourl;
   }
   public String getPhotoname() {
      return photoname;
   }
   public void setPhotoname(String photoname) {
      this.photoname = photoname;
   }
   
   public List<String> getStartdays() {
      return startdays;
   }
   public void setStartdays(List<String> startdays) {
      this.startdays = startdays;
   }
   public List<String> getEnddays() {
      return enddays;
   }
   public void setEnddays(List<String> enddays) {
      this.enddays = enddays;
   }
   @Override
   public String toString() {
      return "Package [no=" + no + ", name=" + name + ", content=" + content + ", travelday=" + travelday + ", price="
            + price + ", mon=" + mon + ", startday=" + startday + ", regdate=" + regdate + ", max=" + max
            + ", photourl=" + photourl + ", photoname=" + photoname + ", startdays=" + startdays + "]";
   }
}