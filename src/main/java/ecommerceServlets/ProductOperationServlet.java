package ecommerceServlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import ecommerceDao.CategoryDao;
import ecommerceDao.ProductDao;
import ecommerceEntities.Category;
import ecommerceEntities.Product;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		HttpSession session=req.getSession();
			String op=req.getParameter("operation");
			
			if(op.trim().equals("addcategory")) {
//				add Category
				String catTitle=req.getParameter("catTitle");
				String catDesc=req.getParameter("catDescription");
				
				Category c=new Category();
				c.setCategoryName(catTitle);
				c.setCategoryDesc(catDesc);
				
				CategoryDao cd=new CategoryDao();
				cd.saveCategory(c);
				
				session.setAttribute("message", "Category Added SuccessFully"+c.getCategoryId());
				RequestDispatcher rd=req.getRequestDispatcher("admin.jsp");
				rd.forward(req, resp);
			}
			
			else if(op.trim().equals("addproduct")) {
//				Add Products
				String pname=req.getParameter("pname");
				String pdesc=req.getParameter("pdesc");
				double pprice=Double.parseDouble(req.getParameter("productPrice"));
				double pdisc=Double.parseDouble(req.getParameter("productDiscount"));
				int pqty=Integer.parseInt(req.getParameter("productQuantity"));
				int pcatid=Integer.parseInt(req.getParameter("catId"));
//				For Product Photo
				Part part=req.getPart("productPic");
				
				Product p=new Product();
				p.setpName(pname);
				p.setpDesc(pdesc);
				p.setpDiscount(pdisc);
				p.setpPrice(pprice);
				p.setpQuantity(pqty);
				p.setpPhoto(part.getSubmittedFileName());
				
//				Saving Product Photo into folder
//				Finding Path of Folder to Upload Photo
				@SuppressWarnings("deprecation")
				String path=req.getRealPath("img")+File.separator+"product"+File.separator+part.getSubmittedFileName();
				
				try {
//					Uploading Photo
					FileOutputStream fos=new FileOutputStream(path);
					
					InputStream is=part.getInputStream();
					
//					Reading Data
					byte[]data=new byte[is.available()];
					is.read(data);
//					Writing Data
					fos.write(data);
					fos.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				
//				Get Category by Id
				CategoryDao c=new CategoryDao();
				p.setCategory(c.getCategoryById(pcatid));
				
//				Saving Product into DataBase
				ProductDao p1=new ProductDao();
				p1.saveProduct(p);
			
				session.setAttribute("message", "Product Added SuccessFully" +p.getpId());
				RequestDispatcher rd=req.getRequestDispatcher("admin.jsp");
				rd.forward(req, resp);
				
			}
		
		
	}

}
