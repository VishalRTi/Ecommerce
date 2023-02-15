package ecommerceEntities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	private String categoryTitle;
	private String categoryDesc;
	@OneToMany(mappedBy ="category")
	private List<Product>products=new ArrayList<>();
	
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public Category(List<Product> products) {
		super();
		this.products = products;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(String categoryTitle, String categoryDesc) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDesc = categoryDesc;
	}
	public String getCategoryName() {
		return categoryTitle;
	}
	public void setCategoryName(String categoryName) {
		this.categoryTitle = categoryName;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	public int getCategoryId() {
		return categoryId;
	}
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" +categoryTitle + ", categoryDesc="
				+ categoryDesc + "]";
	}
}
