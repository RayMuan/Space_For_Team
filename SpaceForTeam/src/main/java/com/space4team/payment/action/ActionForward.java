package com.space4team.payment.action;


public class ActionForward {
	//이동=> 이동정보( 주소정보, 이동방식 ) => 이동정보 저장하는 자바파일
	//		String path ="주소정보";
	//		boolean isRedirect = true;
	// true => response.sendRedirect()
	// false => dispatcher.forward()
	
		private String path;
		private boolean isRedirect;
		
		// 알트 + 쉬프트 + S + r 
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
