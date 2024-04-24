package
{
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class OverheadNumber extends MovieClip
   {
      public var wordMc:MovieClip;
      
      public var healMc:MovieClip;
      
      public var criticalMc:MovieClip;
      
      public var damageMc:MovieClip;
      
      private var displayArr:Array;
      
      private var displayTimer:Timer;
      
      public function OverheadNumber()
      {
         this.displayArr = [];
         this.displayTimer = new Timer(400);
         super();
         this.displayTimer.addEventListener(TimerEvent.TIMER,this.updateDisplay);
      }
      
      public function showNumber(param1:String, param2:String) : void
      {
         var _loc4_:MovieClip = null;
         var _loc3_:Object = {};
         _loc3_.type = param1;
         _loc3_.str = param2;
         this.displayArr.push(_loc3_);
         if(this.displayArr.length == 1)
         {
            switch(param1)
            {
               case "NORMAL":
                  _loc4_ = new OHDamage();// Central.main.getLib("OHDamage");
                  break;
               case "CRITICAL":
                  (_loc4_ = new OHCritical())["textMc"]["lbl_criticalstrike_title"].text = "Critical Strike";//Central.main.getLib("OHCritical"))["textMc"]["lbl_criticalstrike_title"].text = Central.main.langLib.get(409);
                  break;
               case "DEBUFF":
                  _loc4_ = new OHDebuff(); //Central.main.getLib("OHWord");
                  break;
               case "BUFF":
                  _loc4_ = new OHBuff(); //Central.main.getLib("OHWord");
                  break;
               case "HEAL":
                  (_loc4_ = new OHHeal())["textMc"]["lbl_heal_title"].text = "HEAL"; //Central.main.getLib("OHHeal"))["textMc"]["lbl_heal_title"].text = Central.main.langLib.get(408);
            }
            _loc4_["textMc"]["txt"].text = param2;
            this.addChild(_loc4_);
            this.displayTimer.start();
         }
      }
      
      private function updateDisplay(param1:TimerEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:MovieClip = null;
         this.displayArr.shift();
         if(this.displayArr.length > 0)
         {
            _loc2_ = this.displayArr[0];
            _loc3_ = _loc2_.type;
            _loc4_ = _loc2_.str;
            switch(_loc3_)
            {
               case "NORMAL":
                  _loc5_ = new OHDamage();// Central.main.getLib("OHDamage");
                  break;
               case "CRITICAL":
                  (_loc5_ = new OHCritical())["textMc"]["lbl_criticalstrike_title"].text = "Critical Strike";//Central.main.getLib("OHCritical"))["textMc"]["lbl_criticalstrike_title"].text = Central.main.langLib.get(409);
                  break;
               case "DEBUFF":
                  _loc5_ = new OHDebuff(); //Central.main.getLib("OHWord");
                  break;
               case "BUFF":
                  _loc5_ = new OHBuff(); //Central.main.getLib("OHWord");
                  break;
               case "HEAL":
                  (_loc5_ = new OHHeal())["textMc"]["lbl_heal_title"].text = "HEAL"; //Central.main.getLib("OHHeal"))["textMc"]["lbl_heal_title"].text = Central.main.langLib.get(408);
            }
            _loc5_["textMc"]["txt"].text = _loc4_;
            this.addChild(_loc5_);
         }
         else
         {
            this.displayTimer.stop();
            this.displayTimer.reset();
         }
      }
   }
}
