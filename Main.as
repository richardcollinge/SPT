package 
{

	import flash.display.*;
	import classes.constants.*;
	import classes.*;
	import classes.ui.*;
	import flash.net.URLRequest;
	import flash.events.*;
	import flash.text.*;
	import com.greensock.*;
	import flash.utils.*;
	import classes.promotional.*;


	public class Main extends MovieClip
	{
		//private var m:Model = new Model();
		public var currentScreen:MovieClip;
		public var nextScreen:MovieClip;
		public var headerMC:Header;
		
		public var containerMC:Container = new Container();;
		//public var deckMC:MainDeck = new MainDeck();
		
		//pages
		public var homeMC:home = new home();
		//public var introMC:intro = new intro();
		//public var howtoMC:howto = new howto();
		public var titleMC:title_mc = new title_mc();
		
		//these are the top 2 elements for each section
		//diversity section
		//public var promDiversityMC:prom1 = new prom1();//for top link
		//edu section
		//public var eduBurdenMC:edu1 = new edu1();//change to edu
		
	
		public var currentSelection:String;
		//buttons//
		private var homeBut:textLink = new textLink();
		private var promBut:textLink = new textLink();
		private var nonpromBut:textLink = new textLink();
		
		public var globalID:int;
		public var globalselectionID:int;
		
		///for rh menu Diversity section
	 public var screenArray=["prom1","prom2","prom4","prom4b","prom5","prom6","prom7","prom8","prom9","prom9b","prom9c","prom10","prom11","prom12","prom13"]
     public var screenArray2=["edu1","edu2","edu3","edu3b","edu3c","edu4","edu5","edu6","edu6b","edu7","edu8","edu9","edu9b","edu10","edu10b","edu10c","edu11","edu12","edu13","edu14","edu15","edu15b","edu15c","edu15d","edu16","edu16b"]

		public function Main()
		{
			stage.displayState == StageDisplayState.NORMAL;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			// constructor code
			headerMC = new Header();
			addChild(headerMC);
			addChild(containerMC);
			containerMC.addChild(titleMC);

		initTopNav();

		}
		
	

		public function goIndication(_nextScreen:MovieClip):void
		{

			nextScreen = _nextScreen;
			TweenLite.to(currentScreen, .3,  {alpha:0, onComplete:addNextScreen});


		}
		
			public function goIndicationString(_nextScreen:String):void
		{

			
		 var classType:Class = getDefinitionByName(String(_nextScreen)) as Class;
			
			trace(classType)
			var nextMC:MovieClip = new classType();
			nextScreen = nextMC;
			//containerMC.addChild(nextScreen);
			TweenLite.to(currentScreen, .3,  {alpha:0, onComplete:addNextScreen});


		}

		public function initTopNav():void
		{
			headerMC.addChild(homeBut);
			homeBut.title_txt.text = "HOME";
			homeBut.goToMovie = "home";
			homeBut.x = 500;
			homeBut.y = 94;
			;
			
			headerMC.addChild(promBut);
			promBut.title_txt.text = "PROMOTIONAL";
			promBut.goToMovie = "prom1";
			promBut.x = 630;
			promBut.y = 94;
			
			
			headerMC.addChild(nonpromBut);
			nonpromBut.title_txt.text = "EDUCATIONAL";
			nonpromBut.goToMovie = "edu1";
			nonpromBut.x = 800;
			nonpromBut.y = 94;
			
		}


		public function addNextScreen():void
		{
			removeCurrentScreen();
			containerMC.addChild(nextScreen);
			
		}

		public function removeCurrentScreen():void
		{
			//trace("curr screen is " + currentScreen)
			containerMC.removeChild(currentScreen);
		}







	}

}