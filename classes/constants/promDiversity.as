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
		//introToTiContent
		//puttingIntoContent
		private var disclaimerBut:homeLink = new homeLink();
		private var titleArray:Array = ["Diversity SP Section","Slide Set","e-detail","key pub summary"]

		public function promDiversity()
		{
			
		}

  override  public function addContent(e:Event = null):void{
			this.addChild(contentMC)
		}


		
		
		override public function addMainMenu(e:Event = null):void{
					
			///select boxes for home page
			
			for (var i:int = 0; i<titleArray.length; i++)
			{
				selectBoxMC =new selectBox(i/5, titleArray[i],"contentMC"); //delay,title

				selectBoxMC.name = "selectBoxMC" + i;
				selectBoxMC.y=100+i*boxGap;
				selectBoxMC.x=800;
				selectBoxMC.ACTIVE=false;//demo only
				this.addChild(selectBoxMC);
			
				
			}
			
			
		}
		
		
		
		
		

	}

}