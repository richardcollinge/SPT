package classes.ui
{

	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;


	public class selectBox extends ButtonClass
	{
		private var animDelay:Number;
		private var titleText :String;
		private var movieGO:String;
		private var ID:int;
		public var selectID:int;
	    //public var ACTIVE:Boolean =true;

		public function selectBox(_delay:Number, _titleText:String, _movieGO:String, _ID:int)
		{
			// constructor code
			animDelay = _delay;
			titleText = _titleText;
			movieGO = _movieGO;
			ID=_ID;
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}

		private function onAdded(e:Event):void
		{
			//trace("this is a select box added" + this.name);
			this.alpha = 0;
			TweenLite.to(this, .5,  {alpha:1, delay:animDelay});
			init();
		}

		private function init():void
		{
         this.addEventListener(MouseEvent.CLICK, onClick);
		 this.title_txt.text = titleText;
		}
		
		private function onClick(e:MouseEvent):void{
			//go to indication screen
			
			if(this.ACTIVE==true){
			Object(root).currentSelection = titleText;
			Object(root).globalselectionID = selectID;//ties in the rh menu selection black
			trace(movieGO + ID);
			Object(root).globalID=ID-1;//ties in the rh menu
			//Object(root).globalselectionID=ID;//ties in the rh menu
			Object(root).goIndicationString(movieGO);
			
			}
			
		}



	}

}