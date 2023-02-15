package ecommerceDao;

import java.util.List;

import javax.persistence.Query;

import ecommerceEntities.Category;
import ecommerceHelper.Helper;

public class CategoryDao {

	public void saveCategory(Category category) {
		Helper.tx.begin();
		Helper.em.persist(category);
		Helper.tx.commit();
	}
	public List<Category>getCategories(){
		Query q=Helper.em.createQuery("select a from Category a");
		@SuppressWarnings("unchecked")
		List<Category>c=q.getResultList();
		return c;
	}
	
	public Category getCategoryById(int cid) {
		
		Category c=Helper.em.find(Category.class, cid);
		return c;
	}
	public int getTotalCategory() {
		List<Category>p=getCategories();
		Category a=getCategory(p);
		return countCategory(a);
	}
	private Category getCategory(List<Category>cat) {
		Category u=null;
		for(Category q:cat) {
		 u=(Category)q;
		}
		return u;
	}
	private int countCategory(Category u) {
		int count=0;
		int a=u.getCategoryId();
		while(a!=0) {
			count++;
			a--;
		}
		return count;
	}
}
