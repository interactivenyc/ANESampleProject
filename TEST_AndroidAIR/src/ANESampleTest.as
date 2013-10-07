
package
{
	import com.adobe.sampleasextension.SampleASExtension;
	
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.InvokeEvent;
	import flash.events.MouseEvent;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	[SWF(width=1600,height=900)]
	public class ANESampleTest extends Sprite
	{
		private static var _bg:MovieClip;
		private static var _console:TextField;
		private static var _tf:TextFormat;
		
		
		public static const STAGE_WIDTH:int = 1600;
		public static const STAGE_HEIGHT:int = 900;
		
		public static var deviceWidth:int;
		public static var deviceHeight:int;
		
		public static var visibleWidth:Number;
		public static var leftEdge:Number;
		public static var aspectRatio:Number;
		public static var stageScale:Number;
		
		private var file_ani:File;
		private var fs_ani:FileStream;
		
		
		private var _ane:SampleASExtension;
		private var _aneContext:ExtensionContext;
		private var _button1:MovieClip;
		private var _button2:MovieClip;
		private var _button3:MovieClip;
		
		
		public function ANESampleTest()
		{
			super();
			
			log("CONSTRUCTOR");
			
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.MEDIUM; // .LOW; // .HIGH; //
			stage.color = 0xcccccc;
			
			start();
		}
		
		
		private function start():void {
			log("start")
			
			_bg = getFilledMC(800,900,0xFF6600);
			_bg.x = 10;
			_bg.y = 10;
			stage.addChild(_bg);
			
			_console = new TextField();
			_console.wordWrap = true;
			_console.multiline = true;
			_console.width = 800;
			_console.height = 900;
			_console.border = true;
			_console.selectable = false;
			_console.mouseEnabled = false;
			_console.x = 10;
			_console.y = 10;
			_tf = _console.getTextFormat();
			_tf.size = 24;
			_tf.bold = true;
			_tf.font = "_sans";
			_console.setTextFormat(_tf);
			_console.text = "start";
			stage.addChild(_console);
			
			_button1 = getTextButton("ShowVersion");
			_button1.x = 830;
			_button1.y = 10;
			_button1.addEventListener(MouseEvent.CLICK, onMouseEvent);
			stage.addChild(_button1);
			
			_button2 = getTextButton("dispatchANEEvent");
			_button2.x = 830;
			_button2.y = 110;
			_button2.addEventListener(MouseEvent.CLICK, onMouseEvent);
			stage.addChild(_button2);
			
//			_button3 = getTextButton("ane.dispatchEvent(ANEEvent)");
//			_button3.x = 830;
//			_button3.y = 210;
//			_button3.addEventListener(MouseEvent.CLICK, onMouseEvent);
//			stage.addChild(_button3);
			
			addEventListeners();
			handleResize();
		}
		
		private function addEventListeners():void{
			stage.addEventListener(Event.RESIZE, handleResize);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE,onInvoke);
			
			//NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, handleActivate, false, 0, true);
			//NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, handleDeactivate, false, 0, true);
			//NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, handleKeys, false, 0, true);
		}
		
		private function onAddedToStage(e:Event):void{
			//try to dismiss soft keyboard
			stage.focus = _button1;
			initializeANE()
			
		}
		
		
		private function onMouseEvent(e:MouseEvent):void{
			//log("onMouseEvent: "+e.currentTarget);
			switch(e.currentTarget){
				case _button1:
					_ane.getVersion();
					break;
				case _button2:
					_ane.dispatchANEEvent();
					break;
				case _button3:
					break;
				default:
					
			}
		}
		
		private function handleResize(e:Event = null) :void { 
			
			deviceWidth = stage.stageWidth;
			deviceHeight = stage.stageHeight;
			stageScale = deviceHeight / STAGE_HEIGHT;
			aspectRatio = deviceWidth/deviceHeight;
			visibleWidth = STAGE_HEIGHT * aspectRatio;
			leftEdge = (STAGE_WIDTH - visibleWidth) / 2;
			
			log("***************************************");
			log("handleResize(e)");
			log("***************************************");
					log("DEVICE_SCREEN: "+stage.stageWidth + " x " + stage.stageHeight);
					log("ASPECT_RATIO: "+aspectRatio);
					log("stageScale: "+stageScale);
			log("***************************************");
			log("waiting for message from ANE...");
			log("***************************************");
			
		}
		
		
		
		public function getFilledMC(w:Number,h:Number,color:Number = 0x0000FF):MovieClip {
			var mc:MovieClip = new MovieClip();
			var rect:Shape = new Shape();
			rect.graphics.beginFill(color);
			rect.graphics.lineStyle(0,color,0);
			rect.graphics.drawRect(0, 0, w, h);
			rect.graphics.endFill();
			mc.addChild(rect);
			return mc;
		}
		
		private function getTextButton(label:String):MovieClip{
			var button:MovieClip = new noClassButton();
			button.text.label.text = label;
			button.width = button.text.label.textWidth + 20;
			
			return button;
		}
		
		
		private function initializeANE():void{
			log("initializeANE");
			_ane = new SampleASExtension();
			
			try {
				_aneContext = ExtensionContext(_ane.getContext());
				_aneContext.addEventListener(StatusEvent.STATUS,statusHandle);
			}catch (e:Error){
				log("initializeANE error: "+e.message);
			}
		}
		
		
		// listener function
		public function statusHandle(event:StatusEvent):void{
			//log("statusHandle event: "+event);
			log("***************************************");
			log("statusHandle event.type: "+event.type);
			log("statusHandle event.code: "+event.code);
			log("statusHandle event.level: "+event.level);
			log("***************************************");
			// process event data
		}
		
		public function requestEvent():void{
			_aneContext.call("dispatchANEEvent");
		}
		
		//Catch Android Intents
		
		private function onInvoke(event:InvokeEvent):void{
			log("onInvoke(event) event.type: "+event.type);
			log("onInvoke(event) event.arguments: "+event.arguments);
			
			if(event.arguments && event.arguments.length){
				var contentUri:String = event.arguments[0] as String;
				if (contentUri) log("Content:" + contentUri);
				file_ani = new File(contentUri);
				fs_ani = new FileStream();
				fs_ani.openAsync(file_ani, FileMode.READ);
				fs_ani.addEventListener(Event.COMPLETE, onFileComplete, false, 0, true);
			}
		}
		
		private function onFileComplete(event:Event):void{
			log("onFileComplete(event) "+event.type);
			var fs:FileStream = event.target as FileStream;
			var fileContent:String = fs.readUTFBytes(fs.bytesAvailable);
			log(fileContent);
			file_ani = null;
			fs_ani = null;
		}
				
//		private function handleActivate(event:Event):void{
//			log("handleActivate");
//			//NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
//		}
//		
//		private function handleDeactivate(event:Event):void{
//			log("handleDeactivate");
//			//NativeApplication.nativeApplication.exit();
//		}
//		
//		private function handleKeys(event:KeyboardEvent):void{
//			log("handleKeys event.keyCode: "+event.keyCode);
//			//if(event.keyCode == Keyboard.BACK)
//				//NativeApplication.nativeApplication.exit();
//		}
		
		private function log(msg:*):void{
			trace("[ AIRTest ] " + msg);
			try{
				_console.text = _console.text + "\r" + msg ;
				_console.setTextFormat(_tf);
				_console.scrollV = _console.maxScrollV;
			}catch(e:Error){
				//trace("log error :: "+e.message);
			}
		}
	}
}