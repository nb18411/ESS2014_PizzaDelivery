package com.example.pizzadelivery;

import com.example.pizzadelivery.listeners.LoginTaskListener;

import Communication.HTTPConstants;
import Communication.LoginAsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;

public class LoginActivity extends Activity implements 
									OnClickListener,
									LoginTaskListener {
	private EditText edtUsername;
    private EditText edtPassword;
    private Button btnLogin;
    private TextView txtError;
    
    LoginAsyncTask loginAsyncTask;
    	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_login);
		edtUsername = (EditText) findViewById(R.id.edtUsername);
        edtPassword = (EditText) findViewById(R.id.edtPassword);
        btnLogin = (Button) findViewById(R.id.btnLogin);
        txtError = (TextView) findViewById(R.id.txtError);
        btnLogin.setOnClickListener(this);
        txtError.setTextColor(Color.RED);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.login, menu);
		return true;
	}

	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
        int id = v.getId();
        switch (id) {
            case R.id.btnLogin:
                doLogin();
                break;
            default:
                break;
        }
	}
	
    private void doLogin() {
    	hideError();
    	if (validateFields()) {
            loginAsyncTask = new LoginAsyncTask(this, edtUsername.getText().toString(), edtPassword.getText()
                    .toString());
            loginAsyncTask.execute(HTTPConstants.LOGIN_URL);
        }
        
    }
    
    private void openMainActivity() {
        Intent mainActivityIntent = new Intent(this, OrderActivity.class);
        startActivity(mainActivityIntent);
    }
    private boolean validateFields() {
        if (edtUsername.getText().toString().equals("")) {
            showError("Please enter the user name");
            return false;
        }
        
        if (edtPassword.getText().toString().equals("")) {
            showError("Please enter the password");
            return false;
        }

        return true;
    }
    
    private void showError(String errorMessage) {
        txtError.setText(errorMessage);
        txtError.setVisibility(View.VISIBLE);
    }
    
    private void hideError() {
        txtError.setText("");
        txtError.setVisibility(View.INVISIBLE);
    }

	@Override
	public void onLoginSuccess(int id, int type) {
		// TODO Auto-generated method stub
		openMainActivity();
	}

	@Override
	public void onLoginFailed(String errorMessage) {
		// TODO Auto-generated method stub
		showError(errorMessage);
	}

}
		