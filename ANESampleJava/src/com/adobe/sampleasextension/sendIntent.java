package com.adobe.sampleasextension;

import android.content.Intent;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class sendIntent implements FREFunction {
	
	public FREObject call(FREContext ctx, FREObject[] passedArgs) {		
		try {
			log("sending intent");
			Intent i = new Intent(ctx.getActivity(), SendIntentActivity.class);
			ctx.getActivity().startActivity(i);
		} catch (Exception e) {
			log("FAIL [ sending intent ]");
		}
		
		return null;
	}
	
	
	
	public void log(String msg){
		System.out.println(msg);
	}
	

}
