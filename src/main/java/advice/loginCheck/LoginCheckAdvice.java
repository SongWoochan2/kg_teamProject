package advice.loginCheck;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.util.StopWatch;

@Aspect
public class LoginCheckAdvice {
/*
	public void before(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
		String admin_id = (String) session.getAttribute("admin_id");
		
		if(admin_id == null) {
			System.out.println("Have to log in...");
			try {
				response.sendRedirect("/MyCGV/admin/adminLogin.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}*/
	public void before(JoinPoint joinPoint) {
		System.out.println("advice");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        String method = joinPoint.getSignature().getName();
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        
        for(Object o:joinPoint.getArgs()){
            if(o instanceof HttpServletRequest){
                request = (HttpServletRequest) o;
            } else if(o instanceof HttpServletResponse){
            	response = (HttpServletResponse) o;
            }
        }
        if(request != null){
            HttpSession session = request.getSession();
            String admin_id = (String) session.getAttribute("admin_id");
            if(admin_id == null){
                try {
					response.sendRedirect("/MyCGV/admin/adminLogin.do");
				} catch (IOException e) {
					e.printStackTrace();
				}
            }
        }
        stopWatch.stop();
        System.out.println("#############  "+method+"() Method Performance time : "+stopWatch.getTotalTimeMillis()+"(ms)  #############");
	}

	// 매개벼수로 호출을 가로챈 함수를 전달받는다.(핵심 관심사항 메소드)
	public void logAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		// 호출을 가로챈 함수의 이름 얻어오기
		System.out.println("advice");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
		String methodName = proceedingJoinPoint.getSignature().getName();
		StopWatch sw = new StopWatch();
		
		System.out.println("From [applictionacContext.xml]");
		System.out.println("[LOG] METHOD : " + methodName + " is Calling");
		sw.start();

        
        for(Object o:proceedingJoinPoint.getArgs()){
            if(o instanceof HttpServletRequest){
                request = (HttpServletRequest) o;
            } else if(o instanceof HttpServletResponse){
            	response = (HttpServletResponse) o;
            }
        }
        if(request != null){
            HttpSession session = request.getSession();
            String admin_id = (String) session.getAttribute("admin_id");
            if(admin_id == null){
                try {
					response.sendRedirect("/MyCGV/admin/adminMain/adminLogin.jsp");
				} catch (IOException e) {
					
					
					e.printStackTrace();
				}
            } else {
    			proceedingJoinPoint.proceed();
            }
        }
		
		sw.stop();
		System.out.println("[LOG} METHOD : " + methodName + " was done");
		System.out.println("[LOG} 처리시간 : " + sw.getTotalTimeMillis()/1000 + " 초");
		
		
	}

}
