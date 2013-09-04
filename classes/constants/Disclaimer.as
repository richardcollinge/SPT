package classes.constants
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	//import flash.net.*;

	public class Disclaimer extends ScreenClass
	{
		private var deckBut:homeLink = new homeLink();
		private var reactiveBut:homeLink = new homeLink();
		public var contentMC:disclaimerContent = new disclaimerContent();
		
		public function Disclaimer ()
		{
			// constructor code
			
		}
		
		  override  public function addContent(e:Event = null):void{
			this.addChild(contentMC)
		}
		
		override public function addMainMenu(e:Event = null):void{
			this.addChild(deckBut)
			deckBut.title_txt.text = "MAIN DECK"
			deckBut.goToMovie = Object(root).deckMC;
			deckBut.x=550
			deckBut.y=447
			deckBut.iconBmp = new Bitmap(new arrow_png(0,0));
			
			deckBut.addBitmap(63,6)
			
					this.addChild(reactiveBut)
			reactiveBut.title_txt.text = "REACTIVE RESPONSES"
			reactiveBut.goToMovie = Object(root).reactiveMC;
			reactiveBut.x=780
			reactiveBut.y=447
			reactiveBut.iconBmp = new Bitmap(new arrow_png(0,0));
			
			reactiveBut.addBitmap(63,6)
		}

   
		
		
			
			
		

	}

}