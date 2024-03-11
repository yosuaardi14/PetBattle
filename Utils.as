package
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;

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

		public static function loadSwf(urlPath:String, callbackFunc):void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, callbackFunc);
			loader.load(new URLRequest(urlPath));
		}

		public static function searchClassByPetName(obj:Object, petName:String):*
		{
			return obj[petName];
		}

		public static function initButton(btn, func, labelTxt, vis = true)
		{
			if (labelTxt != "")
			{
				btn.txt.text = labelTxt;
				btn.stop();
				btn.buttonMode = true;
			}
			btn.visible = vis;
			btn["clickMask"].addEventListener(MouseEvent.CLICK, func);
			btn["clickMask"].addEventListener(MouseEvent.MOUSE_OVER, onHover);
			btn["clickMask"].addEventListener(MouseEvent.MOUSE_OUT, onRollOut);
			btn["clickMask"].addEventListener(MouseEvent.MOUSE_DOWN, onPress);
		}

		private static function onHover(e:MouseEvent)
		{
			e.target.parent.gotoAndStop(2);
		}

		private static function onRollOut(e:MouseEvent)
		{
			e.target.parent.gotoAndStop(1);
		}

		private static function onPress(e:MouseEvent)
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

		public static function addMouseEventClick(obj:*, callback:*):*
		{
			obj.addEventListener(MouseEvent.CLICK, callback);
		}

		public static function removeMouseEventClick(obj:*, callback:*):*
		{
			obj.removeEventListener(MouseEvent.CLICK, callback);
		}

		public static function hasMouseEventClick(obj:*):Boolean
		{
			return obj.hasEventListener(MouseEvent.CLICK);
		}

		public static function removeChildIfExistAt(obj:*, index:int):*
		{
			if (obj.numChildren > index)
			{
				obj.removeChildAt(index);
			}
		}

	}

}