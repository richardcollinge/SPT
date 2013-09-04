package classes.promotional
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	//import flash.net.*;

	public class promHolder extends ScreenClass
	{
	private var dropBoxMC:dropBox;
	private var boxGap:uint=30;
	private var menuHolder:MovieClip = new MovieClip
	private var diversityArray = ["Diversity SP Section","Slide Set","key pub summary 1","key pub summary 2"]
	private var introArray=["TI section of SP","Intro to TI slide set","Brochure","TI animation","Intro to TI for field force","Key pub summaries 1","Key pub summaries 2"]
	private var practiceArray=["TI and goal setting slide set","Physicians Toolbox","Toolbox slide set","Toolbox video"]
	private var level1Array=[diversityArray,introArray,practiceArray]
	private var noOfDownloadsArray = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
	private var download1:downloadButton;
	private var download2:downloadButton;
	///create menu block
	
	
		public function promHolder()
		{
		
		
		}

  override  public function addContent(e:Event = null):void{
			//this.addChild(contentMC)
			trace("add downloads here");
			
			var downloadArray:Array = flatten(level1Array);
			trace(downloadArray)
			///create download buttons based on params 0,1,2
			if(noOfDownloadsArray[Object(root).globalselectionID-1]>=1){
			download1 = new downloadButton();
			download1.x=70
			download1.y=maintext.y+maintext.height+20;
			download1.titleTxt="Download the " + downloadArray[Object(root).globalselectionID-1]; //finds global selection and brings in the title based on the joined array
			this.addChild(download1);
			}
			if(noOfDownloadsArray[Object(root).globalselectionID-1]>=2){
			download2 = new downloadButton();
			download2.x=57
			download2.y=839
			download2.titleTxt="Download the " + downloadArray[Object(root).globalselectionID-1]; //finds global selection and brings in the title based on the joined array
			this.addChild(download2);
			}
			
		}
		
		private function flatten(arrays:Array):Array {
    var result:Array = [];
    for(var i:int=0;i<arrays.length;i++){
        result = result.concat(arrays[i]);
    }
    return result;
}



		
		
		override public function addMainMenu(e:Event = null):void{
					
			///rh menu
		trace("add rh menu here")
		createBlock(level1Array,Object(root).globalID)//select number is based on click
	
			
		}
		
		
		
///menu functions
private function createBlock(blockArray:Array, selectionNum:int):void{
		
for ( var row:int = 0; row < blockArray.length; row++ )
{
    for ( var column:int = 0; column < blockArray[row].length; column++ )
    {
       // trace( row, column, blockArray[row][column] );
		var block:String = blockArray[row][column] 
		///row is top level
		//column is increment
		var ID:int;
		ID ++;
		//block is name
		//if column == selectionnum or column ==0 then expand this area
	if(row ==selectionNum || column==0){
		var i:int
		i ++;
		dropBoxMC =new dropBox(i/10, block,Object(root).screenArray); //delay,title
		dropBoxMC.selectID=ID;//for highlighting individual dropbox
		
		if (column==0){
			dropBoxMC.arrowDown.visible=true
				dropBoxMC.line.visible=true
				dropBoxMC.line2.visible=true
			trace("global id is" + Object(root).globalID)
			trace("id is" + row)
			if(Object(root).globalID ==row){
			dropBoxMC.arrowDown.gotoAndStop(2)//if section is selected
			}
			dropBoxMC.x=10;
		}else{//sub menu
			dropBoxMC.arrowDown.visible=false
				dropBoxMC.line.visible=false;
				dropBoxMC.line2.visible=false;
			dropBoxMC.x=20;
		}
                dropBoxMC.blockRow = row;//this is to allow accordion to select the right level
		        dropBoxMC.ID=ID;
				dropBoxMC.name = "dropBoxMC" + block
				dropBoxMC.y=10+i*boxGap;
				
				menuHolder.addChild(dropBoxMC);
				///this is to highlight the selection
				trace("Object(root).globalselectionID" + Object(root).globalselectionID);
				if(dropBoxMC.selectID == Object(root).globalselectionID){
				dropBoxMC.changecolor(0x000000)
				}
				
				
	}	//end if
	addChild(menuHolder)
	menuHolder.x=712
	menuHolder.y=247
	
    } 
}
}
		
		
			function accordionBlock(blockArray:Array, selectionNum:int):void{
		//remove menu
			removeChildrenOf(menuHolder)	
		createBlock(blockArray,selectionNum)
				
			}
			
function removeChildrenOf(mc:MovieClip):void{
    if(mc.numChildren!=0){
        var k:int = mc.numChildren;
        while( k -- )
        {
            mc.removeChildAt( k );
        }
    }
}
			
		
		
		
		
		

	}

}