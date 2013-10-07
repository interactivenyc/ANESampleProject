package com.adobe.sampleasextension;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class dispatchANEEvent implements FREFunction {

	@Override
    public FREObject call(FREContext context, FREObject[] args) {

		log("dispatchANEEvent");
		
		try{
			context.dispatchStatusEventAsync("ANEEvent", "some data?");
		}catch(Error e){
			log("Error: "+e.getMessage());
		}
		
   
		return null;
    }
	
	public void log(String msg){
		System.out.println("[ dispatchANEEvent ] "+msg);
	}

}
