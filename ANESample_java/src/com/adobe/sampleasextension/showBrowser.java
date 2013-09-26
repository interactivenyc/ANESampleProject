package com.adobe.sampleasextension;

import android.content.Intent;
import android.widget.Toast;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class showBrowser implements FREFunction {
	public FREObject call(FREContext ctx, FREObject[] passedArgs) {
		System.out.println( "inside showBrowser.call");

		int layoutID, CNNButtonID, YahooButtonID;
		Intent i = new Intent(ctx.getActivity(), WebViewActivity.class);

		try {
			layoutID = ctx.getResourceId("layout.anesample");
			CNNButtonID = ctx.getResourceId("id.CNNButton");
			YahooButtonID = ctx.getResourceId("id.YahooButton");
		} catch (Exception e) {
			System.out.printf("getResourceID() failed with error:\n\"%s\"\n",
							  e.toString());
			Toast.makeText(ctx.getActivity(), "getResourceID() failed" +
						   e.toString(), Toast.LENGTH_SHORT).show();
			return null;
		}

		System.out.printf( "layout ID: %d\n", layoutID);
		Toast.makeText(ctx.getActivity(), "success: layout ID is " +
					   String.valueOf(layoutID), Toast.LENGTH_SHORT).show();

		i.putExtra("layoutID", layoutID);
		i.putExtra("CNNButtonID", CNNButtonID);
		i.putExtra("YahooButtonID", YahooButtonID);

		try {
			ctx.getActivity().startActivity(i);
		} catch (Exception e) {
			System.out.printf("startActivity() failed with error:\n\"%s\"\n",
							  e.toString());
			Toast.makeText(ctx.getActivity(), "startActivity() failed: " +
						   e.toString(), Toast.LENGTH_SHORT).show();			
		}
		return null;
	}
}
