package classes.constants
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	//import flash.net.*;

	public class title_mc extends ScreenClass
	{
		
		private var boxGap:uint=60;
		private var selectBoxMC:selectBox;
		private var backMC:selectBox;
		public var contentMC:titleContent = new titleContent();
	//	private var nextBut:homeLink = new homeLink();
		private var skipBut:homeLink = new homeLink();
		private var downloadVid:downloadButLarge;
		private var filmVid:downloadButLarge2;
		public function clinical()
		{
			
		}

  override  public function addContent(e:Event = null):void{
			this.addChild(contentMC)
		}


		
				override public function addMainMenu(e:Event = null):void{
			
			this.addChild(skipBut)
			skipBut.title_txt.text = "NEXT"
			skipBut.goToMovie = Object(root).homeMC;
			skipBut.x=790
			skipBut.y=674
			
			downloadVid = new downloadButLarge();
			
			this.addChild(downloadVid)
			downloadVid .x=557
			downloadVid .y=503
			
			filmVid = new downloadButLarge2();			
			this.addChild(filmVid)
			filmVid .x=111
			filmVid .y=503
			
		}

		
		
		
		
		

	}

}