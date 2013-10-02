package com.adobe.sampleasextension
{
	import flash.external.ExtensionContext;	
	
	public class SampleASExtension
	{
		private static var extContext:ExtensionContext = null;
		
		public function SampleASExtension() {
			trace("in SampleASExtension Constructor");
			if (!extContext) {
				trace("Creating extension context.");
				extContext = ExtensionContext.createExtensionContext
					("com.adobe.sampleasextension","SampleASExtension");
				if (extContext){
					initMe();
				}else{
					trace("Failed to create extension context.");
				}
			}
		}
		
		public function initMe():void {
			extContext.call("initMe");
		}
		
		public function getVersion():void {
			extContext.call("getVersion");
		}
		
		public function showBrowser():void {
			extContext.call("showBrowser");
		}
	}
}