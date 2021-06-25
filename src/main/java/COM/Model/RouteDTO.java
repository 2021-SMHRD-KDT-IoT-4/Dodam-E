package COM.Model;

public class RouteDTO {

	private int Route_seq;
	private String Route;
	private String CheckTime;
	public RouteDTO(int route_seq, String route, String checkTime) {
		super();
		Route_seq = route_seq;
		Route = route;
		CheckTime = checkTime;
	}
	public int getRoute_seq() {
		return Route_seq;
	}
	public void setRoute_seq(int route_seq) {
		Route_seq = route_seq;
	}
	public String getRoute() {
		return Route;
	}
	public void setRoute(String route) {
		Route = route;
	}
	public String getCheckTime() {
		return CheckTime;
	}
	public void setCheckTime(String checkTime) {
		CheckTime = checkTime;
	}
	
}
