package classes.ui
{

	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import com.greensock.*;



	public class closeBut extends ButtonClass
	{
		public var goToMovie:MovieClip;
		private var imageSprite:Sprite;
		public var iconBmp:Bitmap;
		private var iconX:int;

		public function closeBut()
		{
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}

		private function onAdded(e:Event):void
		{

			init();
			title_txt.autoSize = TextFieldAutoSize.RIGHT;
			title_txt.text = "CLOSE";
		}

		private function init():void
		{

			imageSprite = new Sprite();
			this.addChild(imageSprite);

			this.addEventListener(MouseEvent.CLICK, onClick);
		}

		public function addBitmap(_iconX:int,_iconY:int):void
		{
			imageSprite.x = _iconX;
			imageSprite.y = _iconY;
			imageSprite.addChild(iconBmp);
		}

		private function onClick(e:MouseEvent):void
		{
			//go to indication screen
			Object(root).removeUsefulPopUp();
		}



	}

}