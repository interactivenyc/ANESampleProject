package com.adobe.sampleasextension;

import java.util.HashMap;
import java.util.Map;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

/*
 * This class specifies the mapping between the actionscript functions and the native classes.
 */

public class ANESampleContext extends FREContext 
{
	
	@Override
	public void dispose() {
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		log("creating map");

		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		functionMap.put("getVersion", new getVersion() );
		functionMap.put("showBrowser", new showBrowser() );
		functionMap.put("dispatchANEEvent", new dispatchANEEvent() );
		functionMap.put("initMe", new initFunction() );

		return functionMap;
	}
	
	
	public void log(String msg){
		System.out.println("[ ANESampleContext ] "+msg);
	}
}
