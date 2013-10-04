package com.adobe.sampleasextension;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class dispatchANEEvent implements FREFunction {

	@Override
    public FREObject call(FREContext context, FREObject[] args) {

		log("dispatchANEEvent");
	
		FREContext ctxt = ANESample.context;
		ctxt.dispatchStatusEventAsync("ANEEvent", "some data?");

   
		return null;
    }
	
	public void log(String msg){
		System.out.println("[ dispatchANEEvent ] "+msg);
	}

}
