package com.example.pizzadelivery.model;

import java.util.ArrayList;
import java.util.List;

public class Order {

	private double price = 0.0;
	private List<Pizza> pizzas = new ArrayList<Pizza>();   //The array can be changed to list;
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	public List<Pizza> getPizza() {
		return pizzas;
	}
	
	public void addPizza(Pizza p) {
		this.price += p.getPrice();
		pizzas.add(p);
	}
	
	public void removePizza(Pizza p) {
		this.price -= p.getPrice();
		pizzas.remove(p);
	}
}
