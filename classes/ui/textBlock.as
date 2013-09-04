package classes.ui {
	
	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;
	
	
	public class textBlock extends MovieClip {
		
		
		public function textBlock() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		
		public function onAdded(e:Event = null):void
		{
			//trace("hello textBlockMC---------------------------------" );
			
			this.alpha = 0;
			//init();
			//addContent();
			TweenLite.to(this, .3,  {alpha:1, onComplete:init});//this init is in subclass
			
		}
		
		
		public function init():void
		{
			//trace("home init");
			
			
		}
		
		
		
		
		
	}
	
}
