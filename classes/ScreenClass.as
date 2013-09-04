package classes
{
	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;

	public class ScreenClass extends MovieClip
	{
		
		public function ScreenClass()
		{
			// constructor code

			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}


		public function onAdded(e:Event = null):void
		{
			//trace("hello screen class" );
			addContent();
			addMainMenu();
			this.alpha = 0;
			//init();
			//addContent();
			TweenLite.to(this, .3,  {alpha:1, onComplete:init});//this init is in subclass
			
		}

		public function init(e:Event = null):void
		{
			//trace("home init");
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			
			Object(root).currentScreen = this
			
			
		}
		
		public function addMainMenu(e:Event = null):void
		{
			//do nothing
			//override will be in sub class for home page
			
		}
		
		public function addContent(e:Event = null):void
		{
			//do nothing
			//override will be in sub class for home page
			
		}
		
		
		
		private function removeMe():void{
			Object(root).removeCurrentScreen();
		}
		
		public function onRemoved(e:Event = null):void{
			//trace("removing all child elements")
			while (this.numChildren > 0) {
				
              this.removeChildAt(0);
            }
		}
		
		

	}

}