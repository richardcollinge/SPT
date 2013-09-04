package classes.constants
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	//import flash.net.*;

	public class clinicalTrials extends ScreenClass
	{
		private var totalItems:uint = 4;
		private var boxGap:uint=60;
		private var selectBoxMC:selectBox;
		private var backMC:selectBox;
		public var contentMC:clinicalTrialsContent = new clinicalTrialsContent();
		private var disclaimerBut:homeLink = new homeLink();
		private var titleArray:Array = ["PRISMS", "EVIDENCE", "REGARD"]
		private var PanelScrollExampleMC:PanelScrollExample;
		private var pleaseSwipeMC:pleaseSwipe = new pleaseSwipe();
		private var introTextMC:introText=new introText();

		public function clinicalTrials()
		{
			
		}

  override  public function addContent(e:Event = null):void{
			this.addChild(contentMC)
			contentMC.addChild(introTextMC)
			introTextMC.x=246
			introTextMC.y=135
			
		}

public function initSlideScroll():void{
	contentMC.removeChild(introTextMC)
	addChild(pleaseSwipeMC)
	pleaseSwipeMC.x=444
	pleaseSwipeMC.y=87
	PanelScrollExampleMC = new PanelScrollExample();
	addChild(PanelScrollExampleMC)
	PanelScrollExampleMC.x=270
	PanelScrollExampleMC.y=110
}
		
		
		override public function addMainMenu(e:Event = null):void{
					
			///select boxes for home page
			backMC = new selectBox(0, "BACK TO MAIN DECK MENU");
			backMC.y = 40
			backMC.x=-100;
			this.addChild(backMC);
			backMC.bg.visible=false
			backMC.bg2.visible=true
			backMC.bg3.visible=false
			
			for (var i:int = 0; i<titleArray.length; i++)
			{
				selectBoxMC =new selectBox(i/5, titleArray[i]); //delay,title

				selectBoxMC.name = "selectBoxMC" + i;
				
				selectBoxMC.y=100+i*boxGap;
				selectBoxMC.x=-100;
				if(i>0){
				selectBoxMC.ACTIVE=false;//demo only
				}else{
				selectBoxMC.ACTIVE=true;//demo only
				}
				this.addChild(selectBoxMC);
				selectBoxMC.bg2.visible=false
				selectBoxMC.bg3.visible=false
				selectBoxMC.bg.visible=true
				
			}
			
			
		}
		
		
		/*
		override public function onRemoved(e:Event = null):void{
			//trace("removing all child elements")
			this.removeChild(contentMC)
		}*/
		

	}

}