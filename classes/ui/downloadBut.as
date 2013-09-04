package classes.ui
{

	import flash.display.*;
	import flash.events.*;
	import flash.text.*;


	public class downloadBut extends ButtonClass
	{
		private var title_txt:TextField;
		public var titleTxt:String = "";
		public var myFont = new ArialReg();
		private var myFormat:TextFormat = new TextFormat();

		public function downloadBut()
		{
			// constructor code
			trace("hello downloadBut");
			title_txt = new TextField()  ;

			this.addEventListener(MouseEvent.MOUSE_DOWN, clickMe);
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);

		}


		public function onAdded(e:Event):void
		{
			//trace("hello screen class" );
			myFormat.size = 14.0;
			myFormat.font = myFont.fontName;
			myFormat.leading = 4;
			myFormat.kerning = true;
			title_txt.defaultTextFormat = myFormat;
			title_txt.embedFonts = true;
			title_txt.condenseWhite = true;
			title_txt.x = 52;
			title_txt.y = 18;
			title_txt.text = titleTxt;
			
			title_txt.autoSize = TextFieldAutoSize.LEFT;
			title_txt.textColor = 0xffffff;
			this.addChild(title_txt);
			if(title_txt.text!=""){
            downloadShape.width = 100 + title_txt.width;
			}
		}

		private function clickMe(e:MouseEvent):void
		{
			trace("download code here");

		}




	}

}