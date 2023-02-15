package ecommerceServlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ecommerceDao.UserDao;
import ecommerceEntities.User;
@WebServlet("/Login")
public class UserLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		HttpSession session=req.getSession();
		String email=req.getParameter("email");
		String password=req.getParameter("pass");
		
//		Validate
		if(email.equals(null)&& password.equals(null)) {
			session.setAttribute("message", "Email & Password Can`t be Empty");
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
		
//		Authentication
		else if(email!=null&&password!=null)
		{
			UserDao ud=new UserDao();
			User user1=ud.getUserbyEmailandPassword(email, password);
//			Storing user into Session
			session.setAttribute("current-user", user1);
			if(user1!=null) {
				if(user1.getUserEmail().equals(email)&&user1.getUserPassword().equals(password)) {
					
					if(user1.getUserType().equals("admin")) {
						RequestDispatcher rd=req.getRequestDispatcher("admin.jsp");
						rd.forward(req, resp);
					}
					else if(user1.getUserType().equals("normal")) {
						RequestDispatcher rd=req.getRequestDispatcher("Normal.jsp");
						rd.forward(req, resp);
					}		
				}
			}
				else{
					session.setAttribute("message", "Invalid Creditials !");
					RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
					rd.forward(req, resp);	
				}
		}
	}
		
	
	
}
