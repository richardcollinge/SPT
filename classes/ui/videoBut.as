package classes.ui {
	
	import flash.display.*;
	import flash.events.*;
	
	public class videoBut extends ButtonClass {
		
		
		public function videoBut() {
			// constructor code
			trace("hello videoBut");
			this.addEventListener(MouseEvent.MOUSE_DOWN, clickMe);
		}
		
		
		
		
		private function clickMe(e:MouseEvent):void{
			trace("video code here");
			
		}
	}
	
}
