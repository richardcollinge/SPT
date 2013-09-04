/** 
* Very simple demo of panel flick-scrolling. It loads in an XML file
* containing the file names for 5 panel jpg files and then arranges them 
* side-by-side in a Sprite (_container) and makes it scrollable horizontally.
* Feel free to add more panels in the XML, change the _panelBounds position/size, 
* add a preloader, error handling, etc. the goal was to keep this simple. 
* 
* Get more code at http://www.greensock.com
**/
package classes.constants
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.*;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import com.greensock.*;
	
	import com.greensock.easing.Strong;

	public class PanelScrollExample extends MovieClip
	{
		private var _panelBounds:Rectangle = new Rectangle(0,0,600,450);
		private var _container:MovieClip;
		private var _currentPanelIndex:int = 0;
		private var _panelCount:int;
		private var _x1:Number;
		private var _x2:Number;
		private var _t1:uint;
		private var _t2:uint;
		private var maskMC:mask_mc;

		public function PanelScrollExample()
		{
			_container = new MovieClip();
			_container.x = _panelBounds.x;
			_container.y = _panelBounds.y;

			addChildAt(_container, 0);
            _container.alpha=0;
			
			maskMC=new mask_mc;
			maskMC.x=270;
			maskMC.y=210;
			//_container.addChild(maskMC)
			_container.mask=maskMC
			
			// TweenLite.to(this, 1, {alpha:1, delay:1});
			_container.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler, false, 0, true);
			var xmlLoader:XMLLoader = new XMLLoader("assets/panels.xml",{onComplete:_xmlCompleteHandler});
			xmlLoader.load();
		}

		private function _xmlCompleteHandler(event:LoaderEvent):void
		{

			var panels:XMLList = event.target.content.panel;
			_panelCount = panels.length();
			var queue:LoaderMax = new LoaderMax({onComplete:fadeIn});
			for (var i:int = 0; i < _panelCount; i++)
			{
				queue.append( new ImageLoader("assets/" + panels[i].@file, {x:i * _panelBounds.width, width:_panelBounds.width, height:_panelBounds.height, container:_container}) );

			}
			//feel free to add a PROGRESS event listener to the LoaderMax instance to show a loading progress bar. 
			queue.load();
			//var image1:Bitmap = LoaderMax.getLoader("assets/" + panels[0].@file).rawContent;
//trace(image1);

		}

		function fadeIn(event:LoaderEvent):void
		{
			trace(event.target.name)
			//var imageFade:ContentDisplay = LoaderMax.getContent(event.target.name);
			
			TweenLite.to(_container, 1, {alpha:1});
		}
		

	private function _mouseDownHandler(event:MouseEvent):void
	{
		TweenLite.killTweensOf(_container);
		_x1 = _x2 = this.mouseX;
		_t1 = _t2 = getTimer();
		_container.startDrag(false, new Rectangle(_panelBounds.x - 9999, _panelBounds.y, 9999999, 0));
		this.stage.addEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler, false, 0, true);
		this.addEventListener(Event.ENTER_FRAME, _enterFrameHandler, false, 0, true);
	}

	private function _enterFrameHandler(event:Event):void
	{
		_x2 = _x1;
		_t2 = _t1;
		_x1 = this.mouseX;
		_t1 = getTimer();
	}

	private function _mouseUpHandler(event:MouseEvent):void
	{
		_container.stopDrag();
		this.removeEventListener(Event.ENTER_FRAME, _enterFrameHandler);
		this.stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUpHandler);
		var elapsedTime:Number = (getTimer() - _t2) / 1000;
		var xVelocity:Number = (this.mouseX - _x2) / elapsedTime;
		//we make sure that the velocity is at least 20 pixels per second in either direction in order to advance. Otherwise, look at the position of the _container and if it's more than halfway into the next/previous panel, tween there.
		if (_currentPanelIndex > 0 && (xVelocity > 20 || _container.x > (_currentPanelIndex - 0.5) * -_panelBounds.width + _panelBounds.x))
		{
			_currentPanelIndex--;
		}
		else if (_currentPanelIndex < _panelCount - 1 && (xVelocity < -20 || _container.x < (_currentPanelIndex + 0.5) * -_panelBounds.width + _panelBounds.x))
		{
			_currentPanelIndex++;
		}
		TweenLite.to(_container, 0.7, {x:_currentPanelIndex * -_panelBounds.width + _panelBounds.x, ease:Strong.easeOut});
	}

}

}