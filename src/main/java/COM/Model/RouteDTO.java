package COM.Model;

public class RouteDTO {

	private int Route_seq;
	private String Route_user;
	private String Route_child;
	private String Route;
	private float Route_la;
	private float Route_ha;
	private String CheckTime;


	public RouteDTO(int route_seq, String route_user, String route_child, String route, Float route_la, Float route_ha, String checkTime) {
		super();
		Route_seq = route_seq;
		Route_user = route_user;
		Route_child = route_child;
		Route = route;
		Route_la = route_la;
		Route_ha = route_ha;
		CheckTime = checkTime;
	}

	public RouteDTO(int route_seq, String route_user, String route_child, String route, String checkTime) {
		super();
		Route_seq = route_seq;
		Route_user = route_user;
		Route_child = route_child;
		Route = route;
		CheckTime = checkTime;
	}

	public RouteDTO(int route_seq, String route_child, String route, String checkTime) {
		super();

		Route_seq = route_seq;
		Route_child = route_child;
		Route = route;
		CheckTime = checkTime;
	}

	public  float getRoute_la() {
		return Route_la;
	}
	
	public void setRoute_la(  float route_la) {
		Route_la = route_la;
	}
	
	public  float getRoute_ha() {
		return Route_ha;
	}
	
	public void setRoute_ha(  float route_ha) {
		Route_ha = route_ha;
	}
	public RouteDTO(String route_child) {
		super();
		Route_child = route_child;
	}

	public int getRoute_seq() {
		return Route_seq;
	}

	public void setRoute_seq(int route_seq) {
		Route_seq = route_seq;
	}

	public String getRoute_user() {
		return Route_user;
	}

	public void setRoute_user(String route_user) {
		Route_user = route_user;
	}

	public String getRoute_child() {
		return Route_child;
	}

	public void setRoute_child(String route_child) {
		Route_child = route_child;
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
