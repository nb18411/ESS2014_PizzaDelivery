package com.example.pizzadelivery;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class ListOrdersActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_list_orders);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.list_orders, menu);
		return true;
	}

}
