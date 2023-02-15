function add_to_cart(pid,pname,pprice)
{
let cart=localStorage.getItem("cart");	
	if(cart==null){
		let products=[];
		let product={productId:pid,productName:pname,productPrice:pprice,productQuantity:1};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("product is added for First Time")
		
	}
	else{
		//Cart is already Present
		let pcart=JSON.parse(cart);
		
		let oldproduct= pcart.find((item)=>item.productId==pid);
		if(oldproduct){
			//we have to increase the quantity
			oldproduct.productQuantity=oldproduct.productQuantity+1;
			pcart.map((item) => {
			if(item.productId==oldproduct.productId)
			{
				item.productQuantity=oldproduct.productQuantity;
			}
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product quantity is increased")
		}
		else{
			//we have to add the product
			let product={productId:pid,productName:pname,productPrice:pprice,productQuantity:1};
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product is added")
		}
		
	}
	updateCart();
}
//update Cart
function updateCart()
{
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null || cart.length==0)
	{
		console.log("Cart is empty");
		$(".cart-item").html("(0)");
		$(".cart-body").html("<h3>Cart does not have any item</h3>");
		$(".checkout-btn").attr('disabled',true);
	}
	else{
		console.log(cart);
		$(".cart-item").html(`(${cart.length})`);
		let table=`
		<table class='table'>
		<thead class='thread-light';
		<tr>
		<th>Item Name</th>
		<th>price</th>
		<th>Quantity</th>
		<th>total Price</th>
		<th>Action</th>
		</tr>
		</thead>
		`;
		let totalprice=0;
		cart.map((item)=>{
			table+=`
			<tr>
			<td>${item.productName}</td>
			<td>${item.productPrice}</td>
			<td>${item.productQuantity}</td>
			<td>${item.productQuantity*item.productPrice}</td>
			<td><button onclick='deleteItemFromCart(${item.productId})'class='btn btn-danger btn-sm'>Remove</button> </td>
			</tr>
			`;
			totalprice+=item.productPrice*item.productQuantity;
		})
		
		table=table+`
		<tr><td colspan='5'class="text-right font-weight-bold">Total Price:${totalprice}</td></tr>
		</table>`;
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
	}
}
//Delete Item
function deleteItemFromCart(pid)
{
	let cart= JSON.parse(localStorage.getItem('cart'));
	let newcart=cart.filter((item)=>item.productId!=pid);
	localStorage.setItem('cart',JSON.stringify(newcart));
	updateCart();
}

function gotToCheckOut(){
	window.location="Checkout.jsp";
}

$(document).ready(function(){
	updateCart()
})

