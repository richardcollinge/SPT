package classes.ui
{
	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;
	import flash.media.*;
	import flash.net.*;

	public class ButtonClass extends MovieClip
	{
		public var ACTIVE:Boolean=true;

		public function ButtonClass()
		{
			// constructor code
			//trace("this is a button");
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
			this.buttonMode = true
			this.mouseChildren=false
		}
		
		private function onAdded(e:Event):void
		{
			//trace("this is a select box added" + this.name);
			if(this.ACTIVE==true){
			this.addEventListener(MouseEvent.ROLL_OVER, onRollMe);
			this.addEventListener(MouseEvent.MOUSE_DOWN, clickSound);
			}
		}
		
		private function clickSound(e:MouseEvent):void{
			var mySound:Sound = new Sound();
				mySound.load(new URLRequest("assets/sounds/blip_click.audioonly.mp3"));
				//mySound.play();
				var my_randomchannel:SoundChannel = new SoundChannel();

				my_randomchannel = mySound.play();
			
		}
		
		
		private function onRollMe(e:MouseEvent):void{
			//trace("roll in")
			if(this.ACTIVE==true){
			this.addEventListener(MouseEvent.ROLL_OUT, onRollOutMe);
			this.removeEventListener(MouseEvent.ROLL_OVER, onRollMe);
			TweenLite.to(this, .3,  {alpha:.5});
			}
			
		}
		
		private function onRollOutMe(e:MouseEvent):void{
			//trace("roll out")
			if(this.ACTIVE==true){
			TweenLite.to(this, .3,  {alpha:1});
			this.addEventListener(MouseEvent.ROLL_OVER, onRollMe);
			}
		}

	}

}