package com.example.pizzadelivery.listeners;

public interface LoginTaskListener {
    public void onLoginSuccess(int id, int type);

    public void onLoginFailed(String errorMessage);
}
