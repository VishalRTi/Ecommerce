package ecommerceHelper;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class Helper {

	public static EntityManagerFactory emf=Persistence.createEntityManagerFactory("vishal");
	public static EntityManager em=emf.createEntityManager();
	public static EntityTransaction tx=em.getTransaction();
}

