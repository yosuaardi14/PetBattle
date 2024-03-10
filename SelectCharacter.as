package
{

	public class SelectCharacter
	{
		public var petLib;
		public var petList:Array;
		public var bg = [
				background0,
				background1,
				background2,
				background3,
				background4,
				background5,
				background6,
				background7,
				background8,
				background9,
				background10,
				background11,
			];
		public var mapIndex:uint = 0;
		public var bg_map:*;

		public var newPlayerArr:Vector.<Pet> = new Vector.<Pet>();
		public var newEnemyArr:Vector.<Pet> = new Vector.<Pet>();
		public var charNum:int;
		public var playerArr:Array = [];
		public var enemyArr:Array = [];
		public var controlParty = false;
		public var playerMaster;
		public var enemyMaster;
		public var selectedChar;
		public var selectedOpponent;
		public var selectTurn;

		public function SelectCharacter()
		{

		}

	}

}