package
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.filters.GlowFilter;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLLoader;
	import flash.utils.getQualifiedClassName;

	public class Utils
	{

		public static function genSwfFilePath(swfName:String, folderName:String):String
		{
			return folderName + "/" + swfName + ".swf";
		}

		public static function genPetSwfFilePath(swfName:String):String
		{
			return Utils.genSwfFilePath(swfName, "pets");
		}

		public static function loadSwf(urlPath:String, callbackFunc:Function):void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, callbackFunc);
			loader.load(new URLRequest(urlPath));
		}

		public static function loadJson(urlPath:String, callbackFunc:*):void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, callbackFunc);
			loader.load(new URLRequest(urlPath));
		}

		public static function searchClassBySwfName(obj:Object, petName:String):*
		{
			return obj[petName];
		}

		public static function printObject(obj:Object):void
		{
			var txt = "";
			for (var key:String in obj)
			{
				txt += key + ": " + obj[key] + ", ";
				// trace("Key:", key, "Value:", obj[key]);
			}
			trace(txt);
		}

		public static function initButton(btn:*, func:Function, labelTxt:String = "", vis:Boolean = true):void
		{
			if (labelTxt != "")
			{
				btn.txt.text = labelTxt;
				btn.stop();
				btn.buttonMode = true;
			}
			btn.visible = vis;
			if (btn["clickMask"].hasEventListener(MouseEvent.CLICK))
			{
				btn["clickMask"].removeEventListener(MouseEvent.CLICK, func);
			}
			btn["clickMask"].addEventListener(MouseEvent.CLICK, func);
			if (btn["clickMask"].hasEventListener(MouseEvent.MOUSE_OVER))
			{
				btn["clickMask"].removeEventListener(MouseEvent.MOUSE_OVER, onHover);
			}
			btn["clickMask"].addEventListener(MouseEvent.MOUSE_OVER, onHover);
			if (btn["clickMask"].hasEventListener(MouseEvent.MOUSE_OUT))
			{
				btn["clickMask"].removeEventListener(MouseEvent.MOUSE_OUT, onRollOut);
			}
			btn["clickMask"].addEventListener(MouseEvent.MOUSE_OUT, onRollOut);
			if (btn["clickMask"].hasEventListener(MouseEvent.MOUSE_DOWN))
			{
				btn["clickMask"].removeEventListener(MouseEvent.MOUSE_DOWN, onPress);
			}
			btn["clickMask"].addEventListener(MouseEvent.MOUSE_DOWN, onPress);
		}

		public static function initSwitchButton(btn:*, func:Function, labelTxt:String = "", initialValue:Boolean = true, vis:Boolean = true):void
		{
			btn["txt"].text = labelTxt;
			btn.stop();
			btn.buttonMode = true;
			btn.visible = vis;
			if (initialValue)
			{
				btn.gotoAndStop(2);
			}
			else
			{
				btn.gotoAndStop(1);
			}
			if (btn.hasEventListener(MouseEvent.CLICK))
			{
				btn.removeEventListener(MouseEvent.CLICK, func);
			}
			btn.addEventListener(MouseEvent.CLICK, func);
		}

		private static function onHover(e:MouseEvent):void
		{
			e.target.parent.gotoAndStop(2);
		}

		private static function onRollOut(e:MouseEvent):void
		{
			e.target.parent.gotoAndStop(1);
		}

		private static function onPress(e:MouseEvent):void
		{
			e.target.parent.gotoAndStop(3);
		}

		public static function moveToFront(param1:MovieClip):void
		{
			var _loc2_:MovieClip = null;
			if (param1 != null)
			{
				_loc2_ = param1.parent as MovieClip; // MovieClip(param1.parent);
				_loc2_.setChildIndex(param1, _loc2_.numChildren - 1);
			}
		}

		public static function moveToFrontTF(param1:*):void
		{
			var _loc2_:MovieClip = null;
			if (param1 != null)
			{
				_loc2_ = param1.parent as MovieClip; // MovieClip(param1.parent);
				_loc2_.setChildIndex(param1, _loc2_.numChildren - 1);
			}
		}

		public static function removeAllChild(param1:MovieClip):void
		{
			var _loc2_:uint = 0;
			var _loc3_:uint = 0;
			if (param1 != null)
			{
				_loc2_ = uint(param1.numChildren);
				_loc3_ = 0;
				while (_loc3_ < _loc2_)
				{
					param1.removeChildAt(0);
					_loc3_++;
				}
			}
		}

		public static function duplicateDisplayObject(param1:DisplayObject, param2:Boolean = false):DisplayObject
		{
			var _loc5_:Rectangle = null;
			var _loc3_:Class = param1["constructor"];
			var _loc4_:DisplayObject;
			(_loc4_ = new _loc3_()).transform = param1.transform;
			_loc4_.filters = param1.filters;
			_loc4_.cacheAsBitmap = param1.cacheAsBitmap;
			_loc4_.opaqueBackground = param1.opaqueBackground;
			if (param1.scale9Grid)
			{
				_loc5_ = param1.scale9Grid;
				_loc4_.scale9Grid = _loc5_;
			}
			if (param2 && Boolean(param1.parent))
			{
				param1.parent.addChild(_loc4_);
			}
			_loc4_.x = 0;
			_loc4_.y = 0;
			trace("GF :: " + _loc4_.width + " :: " + _loc4_.height);
			return _loc4_;
		}

		public static function removeParent(param1:MovieClip):void
		{
			if (param1 != null)
			{
				if (param1.parent)
				{
					MovieClip(param1.parent).removeChild(param1);
				}
			}
		}

		public static function getAsset(param1:MovieClip, param2:String):*
		{
			var cls:Class = null;
			var _swf:MovieClip = param1;
			var _cls:String = param2;
			try
			{
				cls = Class(_swf.loaderInfo.applicationDomain.getDefinition(_cls));
				return new cls();
			}
			catch (e:Error)
			{
				trace("ERROR :: getAsset :: " + _cls + " ::" + e.message);
				return null;
			}
		}

		public static function getStaticFullBody(param1:*):*
		{
			return getAsset(param1, "StaticFullBody");
		}

		public static function getPetIcon(param1:*):*
		{
			return getAsset(param1, "icon");
		}

		public static function addMouseEvent(obj:*, mouseEvent:*, callback:*):*
		{
			obj.addEventListener(mouseEvent, callback);
		}

		public static function removeMouseEvent(obj:*, mouseEvent:*, callback:*):*
		{
			obj.removeEventListener(mouseEvent, callback);
		}

		public static function hasMouseEvent(obj:*, mouseEvent:*):Boolean
		{
			return obj.hasEventListener(mouseEvent);
		}

		public static function removeMouseEventIfExist(obj:*, mouseEvent:*, callback:*):void
		{
			if (obj.hasEventListener(mouseEvent))
			{
				obj.removeEventListener(mouseEvent, callback);
			}
		}

		public static function addMouseEventIfNotExist(obj:*, mouseEvent:*, callback:*):void
		{
			if (obj.hasEventListener(mouseEvent))
			{
				obj.removeEventListener(mouseEvent, callback);
			}
			obj.addEventListener(mouseEvent, callback);
		}

		public static function addMouseEventClick(obj:*, callback:*):void
		{
			addMouseEvent(obj, MouseEvent.CLICK, callback);
		}

		public static function removeMouseEventClick(obj:*, callback:*):void
		{
			removeMouseEvent(obj, MouseEvent.CLICK, callback);
		}

		public static function hasMouseEventClick(obj:*):Boolean
		{
			return hasMouseEvent(obj, MouseEvent.CLICK);
		}

		public static function addMouseEventClickIfNotExist(obj:*, callback:*):void
		{
			addMouseEventIfNotExist(obj, MouseEvent.CLICK, callback);
		}

		public static function removeMouseClickIfExist(obj:*, callback:*):void
		{
			removeMouseEventIfExist(obj, MouseEvent.CLICK, callback);
		}

		public static function addMouseEventRollOver(obj:*, callback:*):void
		{
			addMouseEvent(obj, MouseEvent.ROLL_OVER, callback);
		}

		public static function removeMouseEventRollOver(obj:*, callback:*):void
		{
			removeMouseEvent(obj, MouseEvent.ROLL_OVER, callback);
		}

		public static function hasMouseEventRollOver(obj:*):Boolean
		{
			return hasMouseEvent(obj, MouseEvent.ROLL_OVER);
		}

		public static function addMouseEventRollOverIfNotExist(obj:*, callback:*):void
		{
			addMouseEventIfNotExist(obj, MouseEvent.ROLL_OVER, callback);
		}

		public static function removeMouseRollOverIfExist(obj:*, callback:*):void
		{
			removeMouseEventIfExist(obj, MouseEvent.ROLL_OVER, callback);
		}

		public static function addMouseEventRollOut(obj:*, callback:*):void
		{
			addMouseEvent(obj, MouseEvent.ROLL_OUT, callback);
		}

		public static function removeMouseEventRollOut(obj:*, callback:*):void
		{
			removeMouseEvent(obj, MouseEvent.ROLL_OUT, callback);
		}

		public static function hasMouseEventRollOut(obj:*):Boolean
		{
			return hasMouseEvent(obj, MouseEvent.ROLL_OUT);
		}

		public static function addMouseEventRollOutIfNotExist(obj:*, callback:*):void
		{
			addMouseEventIfNotExist(obj, MouseEvent.ROLL_OUT, callback);
		}

		public static function removeMouseRollOutIfExist(obj:*, callback:*):void
		{
			removeMouseEventIfExist(obj, MouseEvent.ROLL_OUT, callback);
		}

		public static function removeChildIfExistAt(obj:*, index:int):*
		{
			if (obj.numChildren > index)
			{
				obj.removeChildAt(index);
			}
		}

		public static function getLinkageName(mc:*):String
		{
			return getQualifiedClassName(mc);
		}

		public static function switchButtonBaseFunction(value:Boolean, buttonMc:*, callback:Function = null):void
		{
			if (value == false)
			{
				buttonMc.gotoAndStop(1);
			}
			else
			{
				buttonMc.gotoAndStop(2);
			}

			if (callback != null)
			{
				callback();
			}
		}

		public static function addGlowFilter(mc:*, active:Boolean = false, target:Boolean = false):void
		{
			var glow:GlowFilter = new GlowFilter();
			if (target)
			{
				glow.color = 0xFF0000;
				glow.blurX = 3;
				glow.blurY = 3;
				glow.strength = 4;
				glow.quality = 3; // BitmapFilterQuality.HIGH;
				mc.filters = [glow];
			}
			else if (active)
			{
				glow.color = 0x00FF00;
				glow.blurX = 3;
				glow.blurY = 3;
				glow.strength = 4;
				glow.quality = 3; // BitmapFilterQuality.HIGH;
				mc.filters = [glow];
			}
			else
			{
				mc.filters = [];
			}
		}

		public static function setMCText(mc:*, text:String, isHtml:Boolean = false):void
		{
			if (isHtml)
			{
				mc.text = text;
			}
			else
			{
				mc.htmlText = text;
			}
		}

	}

}