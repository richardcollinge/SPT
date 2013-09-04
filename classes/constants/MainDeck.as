package classes.constants
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	//import flash.net.*;

	public class MainDeck extends ScreenClass
	{
		private var totalItems:uint = 4;
		private var boxGap:uint=60;
		private var selectBoxMC:selectBox;
		public var contentMC:deckContent = new deckContent();
		private var disclaimerBut:homeLink = new homeLink();
		private var titleArray:Array = ["CLINICAL ISSUES","CLINICAL TRIALS","MS","IMMUNOLOGY","IMAGING"]

		public function MainDeck()
		{
			
		}

  override  public function addContent(e:Event = null):void{
			this.addChild(contentMC)
		}


		
		
		override public function addMainMenu(e:Event = null):void{
					
			///select boxes for home page
			
			for (var i:int = 0; i<totalItems; i++)
			{
				selectBoxMC =new selectBox(i/5, titleArray[i]); //delay,title

				selectBoxMC.name = "selectBoxMC" + i;
				selectBoxMC.y=100+i*boxGap;
				selectBoxMC.x=-100;
				
				if(i>1){
				selectBoxMC.ACTIVE=false;//demo only
				}
				
				this.addChild(selectBoxMC);
				selectBoxMC.bg2.visible=false
				selectBoxMC.bg3.visible=false
				selectBoxMC.bg.visible=true
				
			}
			
			
		}
		
		
		
		
		

	}

}