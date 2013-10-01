package com.adobe.sampleasextension;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;

public class IntentActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		//setContentView(R.layout.activity_intent);
		log("IntentActivity onCreate");
		
		 // Get the message from the intent
	    Intent intent = getIntent();
	    String message = intent.getType();
	}

//	@Override
//	public boolean onCreateOptionsMenu(Menu menu) {
//		// Inflate the menu; this adds items to the action bar if it is present.
//		getMenuInflater().inflate(R.menu.intent, menu);
//		return true;
//	}
	
	
	public void log(String msg){
		System.out.println(msg);
	}

}
