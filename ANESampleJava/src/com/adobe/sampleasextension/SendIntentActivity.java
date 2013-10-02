package com.adobe.sampleasextension;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class SendIntentActivity extends Activity {

	 @Override
	    public void onCreate(Bundle savedInstanceState) {
	        super.onCreate(savedInstanceState);
	        log("SendIntentActivity.onCreate");
	        
	        Intent intent = getIntent();
	        String action = intent.getAction();
	        String type = intent.getType();
	        
	        log(action);
	        log(type);
	        

	        //if (Intent.ACTION_SEND.equals(action) && type != null) {            
	            this.handleSend(intent);
	        //}
		}
	 
		 protected void handleSend(Intent intent){
			 log("SendIntentActivity.handleSend");
		 }


	    @Override
	    protected void onStart() {
	    	super.onStart();
	    	log( "SendIntentActivity.onStart" );
	    }
	    
	    @Override
	    protected void onRestart() {
	    	super.onRestart();
	    	log( "SendIntentActivity.onRestart" );
	    }

	    @Override
	    protected void onResume() {
	    	super.onResume();
	    	log( "SendIntentActivity.onResume" );
	    }

	    @Override
	    protected void onPause() {
	    	super.onPause();
	    	log( "brosenqu SendIntentActivity.onPause" );
	    }

	    @Override
	    protected void onStop() {
	    	super.onStop();
	    	log( "SendIntentActivity.onStop" );
	    }

	    @Override
	    protected void onDestroy() {
	    	super.onDestroy();
	    	log( "SendIntentActivity.onDestroy" );
	    }	

	 	public void log(String msg){
			System.out.println("[ SendIntentActivity ] "+msg);
		}

}
