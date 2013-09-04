package classes.constants {
	import classes.*;
	import classes.ui.textLink;
	import flash.display.*;
	import flash.events.*;
	
	
	public class Footer extends ScreenClass {
		private var disclaimerBut:textLink = new textLink();
		private var homeBut:textLink = new textLink();
		
		public function Footer() {
			// constructor code
			
			this.y=688;
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		override public function onAdded(e:Event = null):void
		{
			
			
		}
		
		
	}
	
}
