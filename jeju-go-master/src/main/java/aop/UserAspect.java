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
public class UserAspect {
	@Around("execution(* controller.*.lcheck*(..)) && args(.., session))")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		User login = (User) session.getAttribute("login");
		if (login == null) {
			throw new LogInException("로그인 후 거래하세요.", "../user/main.jeju");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
