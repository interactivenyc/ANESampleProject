
package
{
	import com.adobe.sampleasextension.SampleASExtension;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.InvokeEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	
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
		
		
		public function ANESampleTest()
		{
			super();
			
			log("CONSTRUCTOR");
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.MEDIUM; // .LOW; // .HIGH; //
			stage.color = 0xcccccc;
			
			start();
		}
		
		
		private function start():void {
			
			_bg = getFilledMC(800,600,0xFF6600);
			_bg.x = 10;
			_bg.y = 10;
			stage.addChild(_bg);
			
			_console = new TextField();
			_console.wordWrap = true;
			_console.multiline = true;
			_console.width = 800;
			_console.height = 600;
			_console.border = true;
			_console.selectable = false;
			_console.mouseEnabled = false;
			_console.x = 10;
			_console.y = 10;
			//_console.type = TextFieldType.DYNAMIC;
			
			
			
			
			_tf = _console.getTextFormat();
			_tf.size = 24;
			_tf.bold = true;
			_tf.font = "_sans";
			_console.setTextFormat(_tf);
			
			_console.text = "start";
			
			stage.addChild(_console);
			
			
			var simpleButton:MovieClip = getTextButton("try this");
			simpleButton.x = 820;
			simpleButton.y = 10;
			
			simpleButton.addEventListener(MouseEvent.CLICK, testIntent);
			
			
			stage.addChild(simpleButton);
			
			addEventListeners();
			handleResize();
			
			//try to dismiss soft keyboard
			stage.focus = simpleButton;
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
			//			log("DEVICE_SCREEN: "+stage.stageWidth + " x " + stage.stageHeight);
			//			log("ASPECT_RATIO: "+aspectRatio);
			//			log("LEFT_EDGE: "+leftEdge);
			//			log("VISIBLE_WIDTH: "+visibleWidth);
			//			log("stageScale: "+stageScale);
			//			log("***************************************");
			
			
			//			_bg.x = -(leftEdge * stageScale);
			//			_bg.scaleX = stageScale;
			//			_bg.scaleY = stageScale;
			//			
			//			_console.x = -(leftEdge * stageScale);
			//			_console.scaleX = stageScale;
			//			_console.scaleY = stageScale;
			
		}
		
		
		
		public function getFilledMC(w:Number,h:Number,color:Number = 0x0000FF):MovieClip {
			log("getFilledRect()");
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
		
		private function addEventListeners():void{
			stage.addEventListener(Event.RESIZE, handleResize);
			
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, handleActivate, false, 0, true);
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, handleDeactivate, false, 0, true);
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, handleKeys, false, 0, true);
		}
		
		private function testIntent(e:MouseEvent):void{
			log("testIntent");
			
			var ane:SampleASExtension = new SampleASExtension();
			ane.getVersion();
		}
		
		
		private function onInvoke(event:InvokeEvent):void{
			log("onInvoke(event) "+event.type);
			
			if(event.arguments && event.arguments.length){
				var contentUri:String = event.arguments[0] as String;
				//log("Content:", contentUri);
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
		
		//Handle Android System Events
		
		private function handleActivate(event:Event):void{
			log("handleActivate");
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
		}
		
		private function handleDeactivate(event:Event):void{
			log("handleDeactivate");
			NativeApplication.nativeApplication.exit();
		}
		
		private function handleKeys(event:KeyboardEvent):void{
			log("handleKeys event.keyCode: "+event.keyCode);
			if(event.keyCode == Keyboard.BACK)
				NativeApplication.nativeApplication.exit();
		}
		
		private function log(msg:*):void{
			trace("[ LOG ] " + msg);
			try{
				_console.text = "[ log ]  " + msg + "\r" + _console.text;
				_console.setTextFormat(_tf);
			}catch(e:Error){
				trace("log error");
			}
		}
	}
}