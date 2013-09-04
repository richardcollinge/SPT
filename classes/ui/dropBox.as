package classes.ui
{

	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;
	import flash.geom.*;


	public class dropBox extends ButtonClass
	{
		private var animDelay:Number;
		private var titleText:String;
		private var movieGO:MovieClip;
		public var blockRow:int = 0;
		public var ID;
		public var selectID:int;
		private var screenArray:Array;
		public var colorTransform:ColorTransform;
		//public var ACTIVE:Boolean =true;

		public function dropBox(_delay:Number, _titleText:String, _screenArray:Array)
		{
			// constructor code
			animDelay = _delay;
			titleText = _titleText;
			screenArray = _screenArray;




			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}

		private function onAdded(e:Event):void
		{
			//trace("this is a select box added" + this.name);
			this.alpha = 0;
			TweenLite.to(this, .1,  {alpha:1, delay:0});
			init();
		}

		private function init():void
		{
			this.addEventListener(MouseEvent.CLICK, onClick);
			this.title_txt.text = titleText;
			trace("hello" + selectID);
			if (screenArray==Object(root).screenArray2)
			{
				// this.title_txt.textColor=0x0395c2;
				if (selectID == Object(root).globalselectionID)
				{
					changecolor(0x000000);
				}
				else
				{
					changecolor(0x0395c2);
				}
			}

		}

		public function changecolor(col:uint):void
		{
			colorTransform = this.transform.colorTransform;
			colorTransform.color = col;
			this.transform.colorTransform = colorTransform;
		}

		private function onClick(e:MouseEvent):void
		{
			//go to indication screen
			//Object(parent).accordionBlock(Object(parent).level1Array,blockRow)
			trace("hello" + selectID);
			Object(root).globalselectionID = selectID;//ties in the rh menu

			Object(root).globalID = blockRow;//ties in the rh menu
			Object(root).goIndicationString(screenArray[ID-1]);
		}



	}

}