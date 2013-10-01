package com.adobe.sampleasextension;

import java.util.List;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.view.View;
import android.widget.Toast;

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
