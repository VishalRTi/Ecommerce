package ecommerceServlets;

import java.io.IOException;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ecommerceEntities.User;
import ecommerceHelper.Helper;
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession hs=req.getSession();
		String email=req.getParameter("email");
		String password=req.getParameter("pass");
		Query q=Helper.em.createQuery("select a from User a where a. userEmail=?1");
		q.setParameter(1, email);
		@SuppressWarnings("unchecked")
		List<User>user=q.getResultList();
		if(user.size()>0) {
			for(User a:user) {
				User u=Helper.em.find(User.class,a.getUserId());
				u.setUserPassword(password);
				Helper.tx.begin();
				Helper.em.merge(u);
				Helper.tx.commit();
			}
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
		else
		{
			hs.setAttribute("message", "Invalid Email Please Check it Again !");
			RequestDispatcher rd=req.getRequestDispatcher("ForgetPassword.jsp");
			rd.forward(req, resp);
		}
	}
}
