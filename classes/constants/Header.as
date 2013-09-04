package classes.constants {
	import classes.*;
	import classes.ui.homeLink;
	import flash.display.*;
	import flash.events.*;
	
	
	public class Header extends ScreenClass {
		
		public function Header() {
			// constructor code
			trace("hello header");
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		override public function onAdded(e:Event = null):void
		{
			
			
		}
		
		
	}
	
}