package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LogInException;
import logic.User;

@Component
@Aspect
public class AdminAspect {
	@Around("execution(* controller.*.adcheck*(..)) && args(.., session)")
	public Object adminCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		User login = (User)session.getAttribute("login");
		if(login == null) {
			throw new LogInException("�α��� �� �̿��ϼ���", "../user/login.jeju");
		}
		if(!login.getUserid().equals("admin")) {
			throw new LogInException("�����ڸ� ���ٰ����� ������ �Դϴ�.", "../user/main.jeju");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
