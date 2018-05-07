package client.log;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.util.StopWatch;

@Aspect
public class Client_logging {
	// 매개벼수로 호출을 가로챈 함수를 전달받는다.(핵심 관심사항 메소드)
	public Object logAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		// 호출을 가로챈 함수의 이름 얻어오기
		System.out.println("client");
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

        Object retVal = null;
        if(request != null) {
        	HttpSession session = request.getSession();
			
        	String member_id = (String) session.getAttribute("memId");
        	if(response != null) {
        		if(member_id == null || member_id.equals("")) {
        			////  페이지 이동 및 파라미터 제어 //////
        			String origin_uri = request.getRequestURI();
        			System.out.println("origin_uri is" + origin_uri);
        			if(!origin_uri.equals("/MyCGV/main/member/memberLoginForm.do")) {
        				request.setAttribute("origin_uri", origin_uri);
        				request.setAttribute("param_map", request.getParameterMap());        				
        			}
        			
        			RequestDispatcher dispatcher = request.getRequestDispatcher("/main/member/memberLoginForm.do");
        			dispatcher.forward(request, response);
        			//////////////////////////////
        			
        			//response.sendRedirect("/MyCGV/main/member/memberLoginForm.do");
        		} else {
        	        retVal = proceedingJoinPoint.proceed();
        		}
        	} else {
        		System.out.println("Cannot find response...");
    	        retVal = proceedingJoinPoint.proceed();
        	}
        }
		
		sw.stop();
		System.out.println("[LOG} METHOD : " + methodName + " was done");
		System.out.println("[LOG} 처리시간 : " + sw.getTotalTimeMillis()/1000.0 + " 초");
		
		return retVal;
	}

}
