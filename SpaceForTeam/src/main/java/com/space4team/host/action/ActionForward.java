package com.space4team.host.action;

public class ActionForward {
//<<<<<<< HEAD
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

}
