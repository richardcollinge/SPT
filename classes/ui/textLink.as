package classes.ui {
	
	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;
	
	
	public class textLink extends ButtonClass {
		public var goToMovie:String;
		
		public function textLink() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			
			init();
		}

		private function init():void
		{
         this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void{
			//go to indication screen
			Object(root).currentSelection = goToMovie;
            Object(root).globalselectionID=1;
			Object(root).globalID=0//ties in the rh menu
			Object(root).goIndicationString(goToMovie);
		}
		
		
		
	}
	
}
