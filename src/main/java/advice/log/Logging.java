package advice.log;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.util.StopWatch;

@Aspect
public class Logging {
	// 매개벼수로 호출을 가로챈 함수를 전달받는다.(핵심 관심사항 메소드)
	public Object logAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
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

        Object retVal = null;
        if(request != null) {
        	HttpSession session = request.getSession();
        	
        	String admin_id = (String) session.getAttribute("admin_id");
        	if(response != null) {
        		if(admin_id == null || admin_id.equals("")) {
        			response.sendRedirect("/MyCGV/admin/adminMain/adminLoginForm.do");
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
