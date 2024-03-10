package  {
	
	public class Battle {
		public var characterArr:Vector.<Pet>;
		public var initialized:Boolean = false;
		public var nowTurn;
		public var nowTurnStr = "p";
		public var attacker;
		public var defender;
		public var turn:uint = 0;
		public var selectedTarget:uint = 0;
		public var gameFinish:Boolean = false;
		public var skillNameTxt:String = "";
		public var numDead:Object;
		public var winner;

		public function Battle() {
			//initBattle();
			//startBattle();
		}
		
		private function initBattle(){
			startBattle();
		}
	
		private function startBattle(){
			
		}
	}
	
}
