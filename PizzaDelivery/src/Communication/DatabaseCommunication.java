package Communication;

import java.util.ArrayList;
import java.util.List;

import com.example.pizzadelivery.model.Pizza;

public class DatabaseCommunication {
	
	private String connectionString = "";

	public boolean authenticateUser(String userName, String password) {
		//TODO
		return true;
	}
	
	public List<Pizza> getPizzas() {
		List<Pizza> pizzas = new ArrayList<Pizza>();
		//TODO
		
		
		return pizzas;
	}
	
	public void proceedTheOrder() {
		//TODO
	}
	
	public void logOut(int userId) {
		//TODO
	}
	
	public void registerUser(String userName, String password, String address, String phone) {
		//TODO
	}
	
	public void editUserData(int userId, String userName, String password, String address, String phone) {
		//TODO
	}
}
