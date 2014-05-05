package Communication;

import org.json.JSONObject;

import com.example.pizzadelivery.listeners.LoginTaskListener;
import com.example.pizzadelivery.requests.RequestMethod;
import com.example.pizzadelivery.requests.RestClient;

import android.os.AsyncTask;

public class LoginAsyncTask extends AsyncTask<String, Void, Boolean> {
	
    private final LoginTaskListener loginTaskListener;

    private String errorMessage;
    private final String username;
    private final String password;
    private int type;
    private int userid;

    public LoginAsyncTask(LoginTaskListener loginTaskListener,
            String username,
            String password) {
        this.loginTaskListener = loginTaskListener;
        this.username = username;
        this.password = password;
    }

	@Override
	protected Boolean doInBackground(String... params) {
		RestClient client = new RestClient(params[0]);
        client.addParam("username", username);
        client.addParam("pass", password);
        try {
            client.execute(RequestMethod.POST);
            JSONObject jObj = new JSONObject(client.getResponse());
            if (jObj.optString("success").equals("1")) {
                type = jObj.optInt("type");
                userid = jObj.optInt("userid");
                return true;
            } else if (jObj.optString("success").equals("0")) {
                errorMessage = jObj.optString("message");
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "Catch";
        }
        return false;
	}
	
	@Override
    protected void onPreExecute() {
        super.onPreExecute();
        
    }

    @Override
    protected void onPostExecute(Boolean result) {
        super.onPostExecute(result);
        if (result) {
            loginTaskListener.onLoginSuccess(userid, type);
        } else {
            loginTaskListener.onLoginFailed(errorMessage);
        }
    }
}
