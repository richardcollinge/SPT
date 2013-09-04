package classes.promotional
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	//import flash.net.*;

	public class prom10 extends ScreenClass
	{
		private var totalItems:uint = 4;
		private var boxGap:uint=60;
		private var selectBoxMC:selectBox;
		//public var contentMC:puttingIntoContent = new puttingIntoContent();
		private var disclaimerBut:homeLink = new homeLink();
		private var titleArray:Array = ["TI section of the SP","Physicians Toolbox (FA & print versions)","Dr Paulas Case Study – Physician Toolbox","Intro  Physician’s toolbox – slide set","Physician’s toolbox video","TI and goal setting slide set"]

		public function prom10()
		{
		trace("hello prom 10");	
		}

  override  public function addContent(e:Event = null):void{
			//this.addChild(contentMC)
		}


		
		
		override public function addMainMenu(e:Event = null):void{
					
			///select boxes for home page
			
		
			
			
		}
		
		
		
		
		

	}

}