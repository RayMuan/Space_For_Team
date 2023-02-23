package com.space4team.host.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
// 클래스 만들기 위한 틀 부모의 공통적인 특
public interface Action {
	// 추상 메서드	: 부모의 공통적인 메서드 틀
	// 리턴할형 이동정보를 담아서 리턴
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
=======
// 클래스 만들기 위한 부모의 공통적인 틀
public interface Action {
	// 추상메서드 : 부모의 공통적인 메서드 틀
	// 리턴할형 이동정보를 담아서 리턴
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
}
