package com.adobe.sampleasextension
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	public class SampleASExtension extends EventDispatcher
	{
		public static var extContext:ExtensionContext = null;
		
		public function SampleASExtension() {
			log("CONSTRUCTOR");
			//try {Security.allowDomain("*");}catch (e) { };
			if (!extContext) {
				log("Creating extension context.");
				extContext = ExtensionContext.createExtensionContext("com.adobe.sampleasextension", "");
				extContext.addEventListener(StatusEvent.STATUS, statusHandle);
				if (extContext){
					initMe();
					
				}else{
					log("Failed to create extension context.");
				}
			}
		}
		
		public function initMe():void {
			log("initMe");
			extContext.call("initMe");
		}
		
		public function getVersion():void {
			extContext.call("getVersion");
		}
		
		public function getContext():ExtensionContext {
			log("getContext");
			return extContext;
		}
		
		public function showBrowser():void {
			extContext.call("showBrowser");
		}
		
		public function dispatchANEEvent():void{
			log("dispatchANEEvent");
			extContext.call("dispatchANEEvent");
		}
		
		public function statusHandle(e:StatusEvent):void{
			log("statusHandle e.type: "+e.type);
			dispatchEvent(e);
		}
		
		private function log(msg:*):void{
			trace("[ SampleASExtension ] " + msg);
		}
	}
}