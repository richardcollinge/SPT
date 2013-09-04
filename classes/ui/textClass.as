package classes.ui
{
	import classes.*;
	import classes.ui.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.text.*;
	import com.greensock.*;
	//import flash.TextField.StyleSheet;

	//import com.piterwilson.utils.Tooltip;

	public class textClass extends MovieClip
	{
		public var myFormat:TextFormat = new TextFormat  ;
		public var myFont = new GothamBook  ;
		public var textContent:TextField;
		public var toolTipContent:TextField;
		private var textXMLBlock:String;
		private var myCSS:StyleSheet;
		private var toolTipMC:ToolTip;
		private var refMC:referencePop;
		private var thisWidth:int;
		
		[Embed(source = "../../fonts/Gotham-Medium.otf",fontName = "Gotham Medium",mimeType = "application/x-font-opentype")]
		public static const VerdanaTTF:String;

		[Embed(source = "../../fonts/Gotham-Bold.otf",fontWeight = "bold",fontName = "Gotham Bold",mimeType = "application/x-font-opentype")]
		public static const VerdanaBoldTTF:String;
		
		[Embed(source = "../../assets/glass.png")]
		public static const getLogo:Class;



		public function textClass(_textXMLBlock:String, _w:int)
		{
			// constructor code
			var defaultStyle:Object = new Object();
			//var boldStyle:Object = new Object();
			var refStyle:Object = new Object();
			defaultStyle.fontFamily = "Gotham Medium";
			refStyle.fontFamily = "Gotham Medium";
			//defaultStyle.fontFamily = "Gotham Bold";
			//refStyle.backroundImage = getLogo;
			refStyle.fontSize= 8;
			
            defaultStyle.fontSize= 13;
			defaultStyle.lineHeight= 80;
			thisWidth = _w

			this.addEventListener(Event.ADDED_TO_STAGE,onAdded);
			textXMLBlock = _textXMLBlock;
			myCSS = new StyleSheet  ;
			myCSS.setStyle(".refStyle", refStyle);
			//myCSS.setStyle("backgroundImage", getLogo);
			myCSS.setStyle(".defaultStyle", defaultStyle);
            
			//myCSS.setStyle("p",{fontSize:'12', fontFamily:'GothamBook', color:'#000000'});
			//myCSS.setStyle("span",{fontSize:'34', lineHeight:'34', color:'#000000'});

			myCSS.setStyle("a:link",{color:'#00948a',textDecoration:'none', backgroundImage:getLogo});
			myCSS.setStyle("a:hover",{color:'#00948a',textDecoration:'underline'});
			myCSS.setStyle("b",{fontWeight:'bold'});
			myCSS.setStyle("em",{fontWeight:'bold'});
			
			//trace("hello text class");
			textContent = new TextField  ;
			//textContent.html = true;
			textContent.styleSheet = myCSS;

			textContent.selectable = false;    
			//textContent.embedFonts = true;
			textContent.condenseWhite = true;
			//textContent.textColor = 0x333333;
			//textContent.border = true;
			textContent.multiline = true;
			textContent.autoSize = TextFieldAutoSize.LEFT;
			textContent.wordWrap = true;
			textContent.width = thisWidth;
			textContent.htmlText = textXMLBlock;
			this.addChild(textContent);
			

		}

		private function onAdded(e:Event):void
		{
			
			//textContent.htmlText.split("</br>").join("\n\n");
			textContent.addEventListener(TextEvent.LINK,toolTip);
			//textContent.addEventListener(TextEvent.LINK, toolTip);
			
		}

		function toolTip(e:TextEvent):void
		{



			// if not a reference
			if (e.text.charAt(0) != "#")
			{
				//trace("this is a tooltip" +e.text);
				toolTipMC = new ToolTip  ;
				textContent.removeEventListener(TextEvent.LINK,toolTip);
				//addChildAt(toolTipMC,0);
				Object(root).containerMC.addChild(toolTipMC);
				toolTipMC.alpha = 0;
				TweenLite.to(toolTipMC, .5,  {alpha:1, onComplete:fadeOutToolTip});
				toolTipMC.x =Object(root).mouseX -20;
				toolTipMC.y = Object(root).mouseY- 110;
				toolTipContent = new TextField  ;
				
			myFormat.size = 12.0;
			myFormat.font = myFont.fontName;
			myFormat.leading = 4;
			myFormat.kerning = true;
			toolTipContent.defaultTextFormat = myFormat;
			
				//toolTipContent.styleSheet = myCSS;
				toolTipContent.autoSize = TextFieldAutoSize.LEFT;
				toolTipContent.text = e.text;
				toolTipMC.addChild(toolTipContent)
				toolTipContent.y=-32
				toolTipContent.x=30
				toolTipMC.bg.width = toolTipContent.width + 50
				trace(toolTipContent.width);
			}
			else
			{
				///this is a reference
				trace("this is a reference");
				refMC = new referencePop()  ;
				textContent.removeEventListener(TextEvent.LINK,toolTip);
				Object(root).containerMC.addChild(refMC);
				refMC.buttonMode=true;
				//refMC.mouseEnabled=false;
				//Object(root).containerMC.mouseChildren=false;
				refMC.alpha = 0;
				TweenLite.to(refMC, .5,  {alpha:1, onComplete:addFadeListener});
				
				refMC.title_txt.text =e.text.substring(1);
				refMC.title_txt.autoSize = TextFieldAutoSize.LEFT;
				refMC.refBot.height=refMC.title_txt.height+20
				refMC.x =0;
				refMC.y =0;
			}
			//navigateToURL(new URLRequest(e.text));
		}
		
		private function addFadeListener():void{
			refMC.addEventListener(MouseEvent.CLICK,fadeOutRef);
				
		}

		private function fadeOutToolTip():void
		{

			TweenLite.to(toolTipMC, .5,  {alpha:0,delay:2, onComplete:removeToolTip});

			//navigateToURL(new URLRequest(e.text));
		}

		function removeToolTip():void
		{
			//removeChild(toolTipMC);
			Object(root).containerMC.removeChild(toolTipMC);
			textContent.addEventListener(TextEvent.LINK,toolTip);
		}
		
		
		function fadeOutRef(e:MouseEvent):void
		{

			TweenLite.to(refMC, .5,  {alpha:0, onComplete:removeRef});

			//navigateToURL(new URLRequest(e.text));
		}
		
		function removeRef():void
		{
			Object(root).containerMC.removeChild(refMC);
			textContent.addEventListener(TextEvent.LINK,toolTip);
		}


















	}

}