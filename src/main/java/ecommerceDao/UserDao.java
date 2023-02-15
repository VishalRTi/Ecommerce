package ecommerceDao;

import java.util.List;

import javax.persistence.Query;

import ecommerceEntities.User;
import ecommerceHelper.Helper;

public class UserDao {

	public void saveUser(User user) {
		Helper.tx.begin();
		Helper.em.persist(user);
		Helper.tx.commit();
	}
	
	public User getUserbyEmailandPassword(String email,String password) {
		Query q=Helper.em.createQuery("select a from User a where a.userEmail=?1 and a.userPassword=?2");
		q.setParameter(1, email);
		q.setParameter(2, password);
		@SuppressWarnings("unchecked")
		List<User>user=q.getResultList();
		User u=getUser(user);
		return u;
	}
	public int getTotalUser(){
		Query q=Helper.em.createQuery("select a from User a");
		@SuppressWarnings("unchecked")
		List<User>u=q.getResultList();
		User u1=getUser(u);
		int totalUser=countUser(u1);
		return totalUser;
	}
	public User getUser(List<User>user) {
		User u=null;
		for(User q:user) {
		 u=(User)q;
		}
		return u;
	}
	private int countUser(User u) {
		int count=0;
		int a=u.getUserId();
		while(a!=0) {
			count++;
			a--;
		}
		return count;
	}
}
