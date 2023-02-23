package com.space4team.host.action;

public class ActionForward {
<<<<<<< HEAD
//	String path="주소 정보";
//	boolean isRedirect = true;
	// true => response.sendRedirect()
	// false => dispatcher.forward()
	
	private String path;
	private boolean isRedirect;
	
	// get set
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

=======
//	String path = "주소정보"; 
//	boolean isRedirect = true;
	// true면 reponse.sendRedirect()
	// false 면 dispatcher.forward() 약속!
	
	private String path;
	private boolean isRedirect;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
		
	}	
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
}
