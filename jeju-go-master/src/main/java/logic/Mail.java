package logic;

public class Mail {
	private String recipient;
	   private String title;
	   private String mtype;
	   private String contents;
	   private String naverid;
	   private String naverpw;
	   
	   public String getRecipient() {
	      return recipient;
	   }
	   public void setRecipient(String recipient) {
	      this.recipient = recipient;
	   }
	   public String getTitle() {
	      return title;
	   }
	   public void setTitle(String title) {
	      this.title = title;
	   }
	   public String getMtype() {
	      return mtype;
	   }
	   public void setMtype(String mtype) {
	      this.mtype = mtype;
	   }
	   public String getContents() {
	      return contents;
	   }
	   public void setContents(String contents) {
	      this.contents = contents;
	   }
	   public String getNaverid() {
	      return naverid;
	   }
	   public void setNaverid(String naverid) {
	      this.naverid = naverid;
	   }
	   public String getNaverpw() {
	      return naverpw;
	   }
	   public void setNaverpw(String naverpw) {
	      this.naverpw = naverpw;
	   }
	   @Override
	   public String toString() {
	      return "Mail [recipient=" + recipient + ", title=" + title + ", mtype=" + mtype + ", contents=" + contents
	            + ", naverid=" + naverid + ", naverpw=" + naverpw + "]";
	   }
}
