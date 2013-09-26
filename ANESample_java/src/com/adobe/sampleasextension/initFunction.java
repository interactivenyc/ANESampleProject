package com.adobe.sampleasextension;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class initFunction implements FREFunction  {
	public FREObject call(FREContext ctx, FREObject[] passedArgs) {

		System.out.println("initFunction successfully called.");
		return null;
	}
}
