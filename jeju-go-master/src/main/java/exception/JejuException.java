package exception;

public class JejuException extends RuntimeException{
	private String url;
	public JejuException(String msg, String url) {
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}
