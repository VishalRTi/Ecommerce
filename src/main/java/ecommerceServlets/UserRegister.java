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

@WebServlet("/Register")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		try 
		{
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			String address=req.getParameter("address");
			long phno=Long.parseLong(req.getParameter("phno"));
			
//			Creating Object For user
			User user=new User();
			
			user.setUserName(name);
			user.setUserEmail(email);
			user.setUserPassword(password);
			user.setUserAddress(address);
			user.setUserPhno(phno);
			user.setUserType("normal");
			
//			Saving Data into Database
			UserDao ud=new UserDao();
			ud.saveUser(user);
			
			HttpSession session=req.getSession();
			session.setAttribute("message", "Registrataion SuccessFull !");
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
