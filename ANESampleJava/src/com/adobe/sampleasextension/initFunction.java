package com.adobe.sampleasextension;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class initFunction implements FREFunction  {
	public FREObject call(FREContext ctx, FREObject[] passedArgs) {

		log("initFunction successfully called.");
		return null;
	}
	
	public void log(String msg){
		System.out.println("[ initFunction.java ] "+msg);
	}
}
