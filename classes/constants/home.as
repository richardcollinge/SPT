package classes.constants
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	//import flash.net.*;

	public class home extends ScreenClass
	{
		
		private var boxGap:uint=40;
		private var selectBoxMC:selectBox;
		private var backMC:selectBox;
		private var download1:downloadButton;
		private var download2:downloadButedu;
		private var disclaimerBut:homeLink = new homeLink();
		private var promotionalArray:Array = ["Diversity of ADHD","An introduction to Treatment Individualisation","Putting Treatment Individualisation into practice"]
		private var promotionalGOArray:Array = ["prom1","prom5","prom10"]
		private var promotionalIDArray:Array = [1,5,12]
		//private var promotionalIDArray:Array = [1,5,10]
		private var eduArray:Array = ["Burden of disease", "Diversity of ADHD", "Neurobiology of ADHD", "Long-term consequences of ADHD","Patient-centred management"]
        private var eduGOArray:Array = ["edu1","edu4","edu7","edu10","edu11"]
         private var eduIDArray:Array = [1,6,10,14,20]//ids for the main sections



		public function home()
		{
			
		}

  override  public function addContent(e:Event = null):void{
			//this.addChild(contentMC)
	        
		}


		
		
		override public function addMainMenu(e:Event = null):void{
					
///LEFT PINK BOX
			for (var i:int = 0; i<promotionalArray.length; i++)
			{
				selectBoxMC =new selectBox(i/5, promotionalArray[i], promotionalGOArray[i], (i+1)); //delay,title

				selectBoxMC.name = "selectBoxMC" + i;
				selectBoxMC.y=450+i*boxGap;
				selectBoxMC.x=64;
				selectBoxMC.selectID = promotionalIDArray[i]
				this.addChild(selectBoxMC);
		
				
			}
			
			///RIGHT BLUE BOX
				for (var j:int = 0; j<eduArray.length; j++)
			{
			selectBoxMC =new selectBox(j/5, eduArray[j], eduGOArray[j], (j+1)); //delay,title


				selectBoxMC.name = "selectBoxMC" + j;
				
				selectBoxMC.y=450+j*boxGap;
				selectBoxMC.x=544;
				selectBoxMC.arrow_mc.gotoAndStop(2);
				selectBoxMC.selectID = eduIDArray[j]
				this.addChild(selectBoxMC);
		
				
			}
			
			///ad download buttons
			download1 = new downloadButton();
			download1.x=64
			download1.y=679
			download1.titleTxt="Download Promotional scientific platform";
			download2 = new downloadButedu();
			download2.x=540
			download2.y=679
			download2.titleTxt="Download Non-promotional scientific platform";
			this.addChild(download1);
			this.addChild(download2);
		}
		
		
		
		
		

	}

}