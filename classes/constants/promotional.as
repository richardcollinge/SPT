package classes.constants
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	//import flash.net.*;

	public class promDiversity extends ScreenClass
	{
		private var totalItems:uint = 4;
		private var boxGap:uint=60;
		private var selectBoxMC:selectBox;
		public var contentMC:promDiversityContent = new promDiversityContent();
		private var disclaimerBut:homeLink = new homeLink();
		private var titleArray:Array = ["DIVERSITY SECTION", "SLIDE SET", "E-DETAIL", "KEY PUB SUMMARY"]

		public function promDiversity()
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
				selectBoxMC.x=800;
				selectBoxMC.ACTIVE=false;//demo only
				this.addChild(selectBoxMC);
				
				
			}
			
			
		}
		
		
		
		
		

	}

}