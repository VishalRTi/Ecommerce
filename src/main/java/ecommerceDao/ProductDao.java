package ecommerceDao;

import java.util.List;

import javax.persistence.Query;

import ecommerceEntities.Product;
import ecommerceHelper.Helper;

public class ProductDao {

	public void saveProduct(Product prod) {
		
		Helper.tx.begin();
		Helper.em.persist(prod);
		Helper.tx.commit();
		
	}
//	Get All products
	public List<Product>getAllProducts(){
		
		Query q=Helper.em.createQuery("select a from Product a");
		@SuppressWarnings("unchecked")
		List<Product>p=q.getResultList();
		return p;
	}
	public int getTotalProduct() {
		List<Product>p=getAllProducts();
		Product a=getProduct(p);
		return countProduct(a);
	}
	private Product getProduct(List<Product>product) {
		Product u=null;
		for(Product q:product) {
		 u=(Product)q;
		}
		return u;
	}
	private int countProduct(Product u) {
		int count=0;
		int a=u.getpId();
		while(a!=0) {
			count++;
			a--;
		}
		return count;
	}
//	Get all product of Given Category
public List<Product>getAllProductsByCId(int cid){
		Query q=Helper.em.createQuery("select a from Product a where a.category.categoryId=?1");
		q.setParameter(1, cid);
		@SuppressWarnings("unchecked")
		List<Product>p=q.getResultList();
		return p;
	}
}
