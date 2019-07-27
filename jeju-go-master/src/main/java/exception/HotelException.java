package exception;

public class HotelException extends RuntimeException{
	private String url;
	public HotelException(String msg, String url) {
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}
