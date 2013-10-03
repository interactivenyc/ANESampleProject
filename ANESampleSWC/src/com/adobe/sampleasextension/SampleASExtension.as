package com.adobe.sampleasextension
{
	import flash.external.ExtensionContext;	
	
	public class SampleASExtension
	{
		private static var extContext:ExtensionContext = null;
		
		public function SampleASExtension() {
			log("CONSTRUCTOR");
			if (!extContext) {
				log("Creating extension context.");
				extContext = ExtensionContext.createExtensionContext
					("com.adobe.sampleasextension","SampleASExtension");
				if (extContext){
					initMe();
				}else{
					log("Failed to create extension context.");
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
			extContext.call("showBrowsers");
		}
		
		private function log(msg:*):void{
			trace("[ SampleASExtension ] " + msg);
		}
	}
}