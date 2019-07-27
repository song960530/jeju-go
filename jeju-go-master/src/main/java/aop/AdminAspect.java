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
	@Around("execution(* controller.Admin*.*(..)) && args(.., session)")
	public Object adminCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		User login = (User)session.getAttribute("login");
		if(login == null) {
			throw new LogInException("�α��� �� �̿��ϼ���", "../user/login.shop");
		}
		if(!login.getUserid().equals("admin")) {
			throw new LogInException("�����ڸ� ���ٰ����� ������ �Դϴ�.", "../user/mypage.shop?id=" + login.getUserid());
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
