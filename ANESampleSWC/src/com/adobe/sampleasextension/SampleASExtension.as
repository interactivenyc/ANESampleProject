package com.adobe.sampleasextension
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;
	import flash.system.Security;
	
	public class SampleASExtension extends EventDispatcher
	{
		public static var extContext:ExtensionContext = null;
		
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
			extContext.call("showBrowser");
		}
		
		public function dispatchANEEvent():void{
			extContext.call("dispatchANEEvent");
		}
		
		private function log(msg:*):void{
			trace("[ SampleASExtension ] " + msg);
		}
	}
}