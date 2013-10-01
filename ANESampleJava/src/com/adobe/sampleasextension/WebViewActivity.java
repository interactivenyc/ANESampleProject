package com.adobe.sampleasextension;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class WebViewActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        System.out.println("WebViewActivity.onCreate");

        int layoutID = getIntent().getIntExtra("layoutID", -1);
		System.out.printf("layout ID: %d\n", layoutID);

        setContentView(layoutID);

        int CNNButtonID = getIntent().getIntExtra("CNNButtonID", -1);
		System.out.printf("CNNButton ID: %d\n", CNNButtonID);

        int YahooButtonID = getIntent().getIntExtra("YahooButtonID", -1);
		System.out.printf("YahooButton ID: %d\n", YahooButtonID );

		Button CNNButton = (Button)findViewById(CNNButtonID);
		Button YahooButton = (Button)findViewById(YahooButtonID);

		CNNButton.setOnClickListener(new OnClickListener() {
		    @Override
			public void onClick(View v) {
				Intent i = new Intent(Intent.ACTION_VIEW);
				i.setData(Uri.parse("http://www.cnn.com"));
				startActivity(i);
			}
		});

		YahooButton.setOnClickListener(new OnClickListener() {
		    @Override
			public void onClick(View v) {
				Intent i = new Intent(Intent.ACTION_VIEW);
				i.setData(Uri.parse("http://www.yahoo.com"));
				startActivity(i);
			}
		});
	}

    @Override
    protected void onStart() {
    	super.onStart();
		System.out.println( "WebViewActivity.onStart" );
    }
    
    @Override
    protected void onRestart() {
    	super.onRestart();
		System.out.println( "WebViewActivity.onRestart" );
    }

    @Override
    protected void onResume() {
    	super.onResume();
		System.out.println( "WebViewActivity.onResume" );
    }

    @Override
    protected void onPause() {
    	super.onPause();
		System.out.println( "brosenqu WebViewActivity.onPause" );
    }

    @Override
    protected void onStop() {
    	super.onStop();
		System.out.println( "WebViewActivity.onStop" );
    }

    @Override
    protected void onDestroy() {
    	super.onDestroy();
		System.out.println( "WebViewActivity.onDestroy" );
    }	
}
