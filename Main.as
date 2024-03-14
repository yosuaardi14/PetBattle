package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.filters.GlowFilter;
	import flash.utils.setTimeout;
	import Constant;

	public class Main extends MovieClip
	{
		// FRAME 1
		public var mode:int = 1;
		public var playerNum:int = 1;
		public var opponentNum:int = 1;
		public var customStats:int = 0;
		public var gameMode:Array;
		public var allSwfData:Object = new Object;
		public var back:*;
		// FRAME 2
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
				// background11,
			];
		public var mapIndex:int = 0;
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
		// CHARACTER PAGE
		public var currentPage:int = 1;
		public var maxPage:int = 1;

		// FRAME 3
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

		public function Main()
		{
			this.allSwfData["length"] = 0;
			this.gameMode = Constant.GAME_MODE_ARR;
			this.petLib = PetLibrary.PET;
			this.petList = Constant.PET_LIST;
			this.charNum = petList.length;
			this.selectTurn = "p";
			addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3);
		}

		internal function frame1()
		{
			stop();
			this.mode = 1;
			this.playerNum = 1;
			this.opponentNum = 1;
			this.customStats = 0;

			this["popupCustom"].visible = false;
			Central.battle = this;
			this.back;
			if (back != undefined)
			{
				if (stage.contains(back))
				{
					stage.removeChild(back);
				}
			}

			// 1
			for (var i:int = 1; i <= 4; i++)
			{
				var labelStr = i == 4 ? "Custom" : i + " vs " + i;
				Utils.initButton(this["btnV" + i], this.onBattleMode, labelStr, true);
			}
			// 2
			// Utils.initButton(btnV1, this.onBattleMode, "1 vs 1", true);
			// Utils.initButton(btnV2, this.onBattleMode, "2 vs 2", true);
			// Utils.initButton(btnV3, this.onBattleMode, "3 vs 3", true);
			// Utils.initButton(btnV4, this.onBattleMode, "Custom", true);
		}

		internal function frame2()
		{
			// var selectChar = new SelectCharacter(this.mode, playerNum, opponentNum);
			this.mapIndex = 0;
			this.bg_map = new bg[this.mapIndex]();
			this.bg_map.scaleX = 0.5;
			this.bg_map.scaleY = 0.5;

			this["popupMap"].visible = false;
			this["popupMap"]["map"].addChild(bg_map);
			// this.allSwfData = {};
			// this.allSwfData["length"] = 0;
			this.newPlayerArr.splice(0, newPlayerArr.length);
			this.newEnemyArr.splice(0, newEnemyArr.length);
			this.selectTurn = "p";
			this.currentPage = 1;
			this.maxPage = Math.ceil(petList.length / Constant.MAX_CHAR_IN_GAME);
			// this["btnPrev"].visible = false;
			// this["btnNext"].visible = false;
			Utils.addMouseEventClick(this["btnPrev"], this.changeCharPage);
			Utils.addMouseEventClick(this["btnNext"], this.changeCharPage);
			this.loadAllPet();
			if (this.mode == 1 || this.playerNum == 1)
			{
				this["popupMap"].btnControl.visible = false;
			}

			for (var i = 2; i >= playerNum; i--)
			{
				this["player_" + i].visible = false;
			}

			for (i = 2; i >= opponentNum; i--)
			{
				this["enemy_" + i].visible = false;
			}

			this["popupMap"].btnControl.gotoAndStop(0);
			this["popupMap"].btnNext.addEventListener(MouseEvent.CLICK, changeBg);
			this["popupMap"].btnPrev.addEventListener(MouseEvent.CLICK, changeBg);

			this["btnBack"].addEventListener(MouseEvent.CLICK, this.gotoMenu);
			Utils.initButton(this["btnBattle"], this.onStartBattle, "Start", true);
			this["popupMap"]["btnControl"].addEventListener(MouseEvent.CLICK, this.onControlMode);
		}

		internal function frame3()
		{
			this.initialized = false;
			this.nowTurnStr = "p";
			this.turn = 0;
			this.selectedTarget = 0;
			this.gameFinish = false;
			this.skillNameTxt = "";
			this.numDead = {
					"p": 0,
					"e": 0
				};

			this["effectListMc"].visible = false;
			this["statusTxt"].visible = false;
			this["popup"].visible = false;

			Utils.initButton(this["popup"]["btnBack"], this.backtoMenu, "Back to Menu", true);
			// Utils.initButton(this["btnSpecial"], this.onSpecilClicked, "Special", true);
			Utils.initButton(this["btnPass"], this.onPassClicked, "Pass", true);

			this["btnSurrend"].visible = false;
			this["btnSurrend"].addEventListener(MouseEvent.CLICK, this.gotoMenu);
			this["txt"].visible = false;

			back = bg_map;
			back.scaleX = 2;
			back.scaleY = 2;
			stage.addChildAt(back, 0);

			this.startBattle();
		}

		// NAVIGATION
		private function gotoSelectChar(e:MouseEvent)
		{
			this.gotoAndStop("selectChar");
		}

		private function gotoMenu(e:MouseEvent)
		{
			this.gotoAndStop("menu");
		}

		private function gotoBattle(e:MouseEvent)
		{
			this.gotoAndStop("battle");
		}

		// FRAME 1
		public function onBattleMode(e:MouseEvent)
		{
			this.mode = e.target.parent.name.substr(-1, 1);
			if (this.mode == 4)
			{
				// show popup
				this.popupCustom.visible = true;
				this.playerNum = 1;
				this.opponentNum = 1;
				this.initCustomPopup();
			}
			else
			{
				this.playerNum = mode;
				this.opponentNum = mode;
				this.gotoAndStop("selectChar");
			}
		}

		public function initCustomPopup()
		{
			this["popupCustom"]["txtPlayerNum"].text = playerNum.toString();
			this["popupCustom"]["txtOpponentNum"].text = opponentNum.toString();
			Utils.initButton(this.popupCustom["btnStart"], this.gotoSelectChar, "Start", true);
			this["popupCustom"]["btnExit"].addEventListener(MouseEvent.CLICK, this.hidePopupCustom);
			this["popupCustom"]["btnMinP"].addEventListener(MouseEvent.CLICK, changeNum);
			this["popupCustom"]["btnMinO"].addEventListener(MouseEvent.CLICK, changeNum);
			this["popupCustom"]["btnPlusP"].addEventListener(MouseEvent.CLICK, changeNum);
			this["popupCustom"]["btnPlusO"].addEventListener(MouseEvent.CLICK, changeNum);

			this["popupCustom"]["btnStatsPrev"].addEventListener(MouseEvent.CLICK, changeNum);
			this["popupCustom"]["btnStatsNext"].addEventListener(MouseEvent.CLICK, changeNum);
		}

		private function hidePopupCustom(e:MouseEvent)
		{
			this["popupCustom"].visible = false;
		}

		public function changeNum(e:MouseEvent)
		{
			if (e.target == this["popupCustom"]["btnPlusO"])
			{
				if (this.opponentNum < 3)
				{
					this.opponentNum += 1;
				}
			}
			else if (e.target == this["popupCustom"]["btnPlusP"])
			{
				if (this.playerNum < 3)
				{
					this.playerNum += 1;
				}
			}
			else if (e.target == this["popupCustom"]["btnMinP"])
			{
				if (this.playerNum > 1)
				{
					this.playerNum -= 1;
				}
			}
			else if (e.target == this["popupCustom"]["btnMinO"])
			{
				if (this.opponentNum > 1)
				{
					this.opponentNum -= 1;
				}
			}
			else if (e.target == this["popupCustom"]["btnStatsPrev"])
			{
				this.customStats--;
				if (this.customStats < 0)
				{
					this.customStats = Constant.CUSTOM_CHAR_STATS.length - 1;
				}
			}
			else if (e.target == this["popupCustom"]["btnStatsNext"])
			{
				this.customStats++;
				if (this.customStats > Constant.CUSTOM_CHAR_STATS.length - 1)
				{
					this.customStats = 0;
				}
			}
			this["popupCustom"]["txtOpponentNum"].text = this.opponentNum.toString();
			this["popupCustom"]["txtPlayerNum"].text = this.playerNum.toString();
			if (this.customStats == 0)
			{
				this["popupCustom"]["txtStats"].text = Constant.CUSTOM_CHAR_STATS[this.customStats].toString();
			}
			else
			{
				this["popupCustom"]["txtStats"].text = "Lv " + Constant.CUSTOM_CHAR_STATS[this.customStats].toString();
			}

		}

		// FRAME 2
		public function changeBg(e:MouseEvent)
		{
			if (this["popupMap"]["map"].numChildren > 0)
			{
				this["popupMap"]["map"].removeChildAt(0);
			}
			if (e.target == this["popupMap"].btnNext)
			{
				this.mapIndex++;
				if (this.mapIndex > bg.length - 1)
				{
					this.mapIndex = 0;
				}
			}
			else if (e.target == this["popupMap"].btnPrev)
			{
				this.mapIndex--;
				if (this.mapIndex < 0)
				{
					this.mapIndex = bg.length - 1;
				}
			}
			this.bg_map = new bg[this.mapIndex]();
			this.bg_map.scaleX = 0.5;
			this.bg_map.scaleY = 0.5;
			this["popupMap"]["map"].addChild(this.bg_map);
		}

		public function onControlMode(e:MouseEvent)
		{
			this.controlParty = !controlParty;
			if (controlParty == false)
			{
				this["popupMap"].btnControl.gotoAndStop(1);
			}
			else
			{
				this["popupMap"].btnControl.gotoAndStop(2);
			}
		}

		public function hidePopupMap(e:MouseEvent)
		{
			this["popupMap"].visible = false;
		}

		public function onStartBattle(e:MouseEvent)
		{
			if (this.newPlayerArr.length == this.playerNum && this.newEnemyArr.length == this.opponentNum)
			{
				this.playerMaster = this.newPlayerArr[0];
				this.enemyMaster = this.newEnemyArr[0];
				this["popupMap"].visible = true;
			}
			if (e.target.parent == this["popupMap"]["btnBattle"])
			{
				gotoAndStop("battle");
			}
		}
		public function getBaseStats()
		{
			return {
					"critical": 5,
					"dodge": 5,
					"purify": 5
				};
		}
		public function setupStats(petObj:Object):Object
		{
			var charLevel = petObj["max_level"]; // 1
			if (this.customStats > 0)
			{
				charLevel = Constant.CUSTOM_CHAR_STATS[this.customStats];
			}
			var stats = {
					// "dmg": setupDamage(charLevel, petObj["type"]),
					"lv": charLevel,
					"hp": charLevel * 20 + 80, // 40 + 60,
					"cp": 0,
					"maxHP": charLevel * 20 + 80, // 40 + 60,
					"maxCP": charLevel * 20 + 80, // 40 + 60,
					"isDead": false,
					"critical": 5,
					"dodge": 5,
					"purify": 5,
					"agility": charLevel + 9,
					"buff": {},
					"debuff": {}
				};
			return stats;
		}

		/*public function setupAttributeType(attrType: String) {
			var attrStats = {
				"dmg": 0,
				"hp": 0,
				"cp": 0,
				"agility": 0
			};
			if (attrType = "wind") {
				attrStats = {
					"dmg": 8,
					"hp": 0,
					"cp": 0,
					"agility": 10
				};
				return attrStats;
			} else if (attrType = "fire") {
				attrStats = {
					"dmg": 12,
					"hp": 0,
					"cp": 0,
					"agility": 0
				};
				return attrStats;
			} else if (attrType = "lightning") {
				attrStats = {
					"dmg": 11,
					"hp": 0,
					"cp": 0,
					"agility": 0
				};
				return attrStats;
			} else if (attrType = "earth") {
				attrStats = {
					"dmg": 10,
					"hp": 10,
					"cp": 0,
					"agility": 0
				};
				return attrStats;
			} else if (attrType = "water") {
				attrStats = {
					"dmg": 9,
					"hp": 0,
					"cp": 10,
					"agility": 0
				};
				return attrStats;
			} else {
				return attrStats;
			}
		}*/

		public function setInitialCooldown(petSkill:Object)
		{
			var cooldown = {};
			for (var i in petSkill)
			{
				cooldown[i] = 0;
			}
			return cooldown;
		}

		public function setupDamage(level:int, petType:int):int
		{
			var dmg = 0;
			if (level <= 0)
			{
				return 1;
			}
			switch (petType)
			{
				case 1:
					dmg = Math.round(level * 0.75);
					break;
				case 2:
					dmg = Math.round(level * 0.4);
					break;
				case 3:
					dmg = Math.round(level * 0.6);
			}

			if (dmg <= 0)
			{
				dmg = 1;
			}
			return dmg;
		}

		public function loadAllPet()
		{
			this.playerArr = [];
			this.enemyArr = [];

			Utils.initButton(this["popupMap"]["btnBattle"], onStartBattle, "Battle", true);
			this["popupMap"]["btnExit"].addEventListener(MouseEvent.CLICK, hidePopupMap);
			for (var j = 0; j < playerNum; j++)
			{
				Utils.initButton(this["player_" + j]["btnRemove"], removeSelectedChar, "Remove", false);
			}
			for (j = 0; j < opponentNum; j++)
			{
				Utils.initButton(this["player_" + j]["btnRemove"], removeSelectedChar, "Remove", false);
				Utils.initButton(this["enemy_" + j]["btnRemove"], removeSelectedChar, "Remove", false);
			}

			this.hidePet();
			if (this.allSwfData["length"] == this.petList.length)
			{
				this.showPet();
				return;
			}
			for (var i in petList)
			{
				Utils.loadSwf(Utils.genPetSwfFilePath(petList[i]), this.onLoadFinish);
			}
		}

		public function buttonVisibility()
		{
			this["btnPrev"].visible = this.currentPage > 1;
			this["btnNext"].visible = this.currentPage < this.maxPage;
		}

		public function changeCharPage(e:MouseEvent)
		{
			if (e.target == this["btnNext"])
			{
				if (this.currentPage < this.maxPage)
				{
					this.currentPage += 1;
					this.hidePet();
					this.showPet();
				}
			}
			else if (e.target == this["btnPrev"])
			{
				if (this.currentPage > 1)
				{
					this.currentPage -= 1;
					this.hidePet();
					this.showPet();
				}
			}
			buttonVisibility();
		}

		public function showPet()
		{
			this.buttonVisibility();
			var start = (currentPage - 1) * Constant.MAX_CHAR_IN_GAME;
			var end = Math.min(petList.length, this.currentPage * Constant.MAX_CHAR_IN_GAME);
			var index = 0;
			for (var i = start; i < end; i++)
			{
				var cls = Utils.getAsset(Utils.searchClassByPetName(allSwfData, petList[i]), "icon");
				var petMC = cls;
				petMC.x = 40;
				petMC.y = 70;
				petMC.scaleX = 0.5;
				petMC.scaleY = 0.5;
				var petObj = PetLibrary.getPetBySwfName(petList[i]);
				this["charMC_" + index]["petType"].gotoAndStop(petObj["type"]);
				this["charMC_" + index]["attributeType"].gotoAndStop(petObj["attribute_type"]);
				this["charMC_" + index].gotoAndStop(PetLibrary.getType(petList[i]));
				this["charMC_" + index].visible = true;
				// this["charMC_" + i]["holder"].addChild(petMC);
				// this["charMC_" + i]["maskMC"].addEventListener(MouseEvent.CLICK, loadCharacter);
				Utils.removeChildIfExistAt(this["charMC_" + index]["holder"], 2);
				this["charMC_" + index]["holder"].addChild(petMC);
				if (Utils.hasMouseEventClick(this["charMC_" + index]["maskMC"]))
				{
					Utils.removeMouseEventClick(this["charMC_" + index]["maskMC"], loadCharacter);
				}
				Utils.addMouseEventClick(this["charMC_" + index]["maskMC"], loadCharacter);
				index++;
			}
			// for (var i in petList)
			// {
			// if (i >= Constant.MAX_CHAR_IN_GAME)
			// {
			// break;
			// }
			// var cls = Utils.getAsset(Utils.searchClassByPetName(allSwfData, petList[i]), "icon");
			// var petMC = cls;
			// petMC.x = 40;
			// petMC.y = 70;
			// petMC.scaleX = 0.5;
			// petMC.scaleY = 0.5;
			// var petObj = PetLibrary.getPetBySwfName(petList[i]);
			// this["charMC_" + i]["petType"].gotoAndStop(petObj["type"]);
			// this["charMC_" + i]["attributeType"].gotoAndStop(petObj["attribute_type"]);
			// this["charMC_" + i].gotoAndStop(PetLibrary.getType(petList[i]));
			// this["charMC_" + i].visible = true;
			// this["charMC_" + i]["holder"].addChild(petMC);
			// this["charMC_" + i]["maskMC"].addEventListener(MouseEvent.CLICK, loadCharacter);
			// }
		}

		public function onLoadFinish(e:Event):void
		{
			try
			{
				var petName = e.target.url;
				petName = petName.slice(petName.lastIndexOf("/") + 1);
				petName = petName.slice(0, -4);

				var objNew:MovieClip = MovieClip(e.currentTarget.content);
				this.allSwfData[petName] = objNew;
				this.allSwfData["length"] = allSwfData["length"] + 1;
			}
			catch (err:Error)
			{
				trace("Error");
			}
			if (this.allSwfData["length"] == this.petList.length)
			{
				this.showPet();
			}
		}

		public function loadPetById(id:int):Object
		{
			var newId = ((currentPage - 1) * Constant.MAX_CHAR_IN_GAME) + id;
			var petSwfName = petList[newId];
			var petObj = PetLibrary.getPetBySwfName(petSwfName);
			var clsName = petObj["clsName"];

			var cls = Utils.getAsset(Utils.searchClassByPetName(allSwfData, petSwfName), clsName);
			cls.name = "petMc";
			cls.scaleX = -0.6;
			if (selectTurn == "e")
			{
				cls.scaleX = 0.6;
			}
			cls.scaleY = 0.6;
			cls.setSkillCooldown(setInitialCooldown(petObj["skill"]));
			cls.skillData = petObj["skill"];
			cls.setPetObj(petObj);
			if (this.customStats == 0)
			{
				cls.setupDamage(petObj["max_level"]);
			}
			else
			{
				cls.setupDamage(Constant.CUSTOM_CHAR_STATS[this.customStats]);
			}

			var iconCls = Utils.getAsset(Utils.searchClassByPetName(allSwfData, petSwfName), "icon");
			iconCls.scaleX = 1;
			iconCls.scaleY = 1;

			var bodyCls = Utils.getAsset(Utils.searchClassByPetName(allSwfData, petSwfName), "StaticFullBody");
			bodyCls.scaleX = 0.75;
			bodyCls.scaleY = 0.75;

			var char = {
					// "pet": petObj,
					"stats": setupStats(petObj),
					"mc": cls,
					"icon": iconCls,
					"body": bodyCls
				};
			return char;
		}

		public function loadCharacter(e:MouseEvent)
		{
			var id = e.target.parent.name.split("_")[1];
			var petObj = loadPetById(id);
			var newPetObj = new Pet(petObj["stats"], petObj["mc"], petObj["icon"], petObj["body"]);
			// var newPet:Pet = new Pet(petObj["stats"], petObj["mc"], petObj["icon"], petObj["body"]);

			if (this.selectTurn == "p" && this.newPlayerArr.length < this.playerNum)
			{
				this.newPlayerArr.push(newPetObj);
				// playerArr.push(petObj);
			}
			if (this.selectTurn == "e" && this.newEnemyArr.length < this.opponentNum)
			{
				this.newEnemyArr.push(newPetObj);
				// enemyArr.push(petObj);
			}

			this.showSelectedChar();

			if (this.selectTurn == "p" && this.newPlayerArr.length == this.playerNum)
			{
				this.selectTurn = "e";
			}
			if (this.selectTurn == "e" && this.newPlayerArr.length < this.playerNum)
			{
				selectTurn = "p";
			}
		}

		public function showSelectedChar()
		{
			for (var i = 0; i < playerNum; i++)
			{
				if (this["player_" + i]["holder"].numChildren > 0)
				{
					this["player_" + i]["holder"].removeChildAt(0);
				}
				if (i < this.newPlayerArr.length)
				{
					this["player_" + i]["btnRemove"].visible = true;
					this["player_" + i]["holder"].addChild(this.newPlayerArr[i].getBody());
					// this["player_" + i]["btnRemove"].addEventListener(MouseEvent.CLICK, removeSelectedChar);
				}
				else
				{
					this["player_" + i]["btnRemove"].visible = false;
				}
			}
			for (i = 0; i < opponentNum; i++)
			{
				if (this["enemy_" + i]["holder"].numChildren > 0)
				{
					this["enemy_" + i]["holder"].removeChildAt(0);
				}
				if (i < newEnemyArr.length)
				{
					this["enemy_" + i]["btnRemove"].visible = true;
					this["enemy_" + i]["holder"].addChild(this.newEnemyArr[i].getBody());
					// this["enemy_" + i]["btnRemove"].addEventListener(MouseEvent.CLICK, removeSelectedChar);
				}
				else
				{
					this["enemy_" + i]["btnRemove"].visible = false;

				}
			}
		}

		public function removeSelectedChar(e:MouseEvent)
		{
			var targetName = e.target.parent.parent.name.split("_");
			if (targetName[0] == "player")
			{
				this.newPlayerArr.removeAt(int(targetName[1]));
			}
			else
			{
				this.newEnemyArr.removeAt(int(targetName[1]));
			}
			if (this.selectTurn == "e" && this.newPlayerArr.length < this.playerNum)
			{
				this.selectTurn = "p";
			}
			this.showSelectedChar();
		}

		public function hidePet()
		{
			// for (var i = this.charNum; i < Constant.MAX_CHAR_IN_GAME + 1; i++)
			// {
			// this["charMC_" + i].visible = false;
			// }
			var start = (currentPage - 1) * Constant.MAX_CHAR_IN_GAME;
			var end = Math.min(this.charNum, this.currentPage * Constant.MAX_CHAR_IN_GAME);
			for (var i = (end - start - 1); i < Constant.MAX_CHAR_IN_GAME; i++)
			{
				Utils.removeChildIfExistAt(this["charMC_" + i]["holder"], 2);
				this["charMC_" + i].visible = false;
				if (Utils.hasMouseEventClick(this["charMC_" + i]["maskMC"]))
				{
					Utils.removeMouseEventClick(this["charMC_" + i]["maskMC"], loadCharacter);
				}
			}
		}

		// FRAME 3
		public function backtoMenu(e:MouseEvent)
		{
			this["popup"].visible = false;
			petMcVisible(false);
			gotoAndStop("menu");
		}

		public function onPassClicked(e:MouseEvent)
		{

		}

		public function onSpecialClicked(e:MouseEvent)
		{

		}

		public function onInfo()
		{
			this.popupInfo.msgTxt.text = skillNameTxt;
		}

		public function addSpecialEffect(mc:MovieClip)
		{
			Utils.removeParent(mc);
			mc.scaleX = 2;
			mc.scaleY = 2;
			if (this.battleEffectMc.numChildren > 0)
			{
				this.battleEffectMc.removeChildAt(0);
			}
			this.battleEffectMc.addChild(mc);
			mc.gotoAndPlay(2);
			Utils.moveToFront(this.battleEffectMc);
		}

		// sort by big agility
		public function setInitialCharacterTurn(objA, objB)
		{
			if (objA.getAgility() < objB.getAgility())
			{
				return 1;
			}
			else if (objA.getAgility() > objB.getAgility())
			{
				return -1;
			}
			else
			{
				return 0;
			}
		}

		public function addSkillDisplay(petObj:Object)
		{
			hideTarget(false);
			for (var i in petObj.getPet().skillData)
			{
				var skillName = "Skill_" + i;
				var cls = Utils.getAsset(Utils.searchClassByPetName(allSwfData, petObj.getPet().getPetObj()["swfName"]), skillName);
				if (cls != null)
				{
					var temp = cls;
					temp.name = skillName;
					if (this["skillMC_" + i]["holder"].numChildren > 1)
					{
						this["skillMC_" + i]["holder"].removeChildAt(1);
					}
					this["skillMC_" + i]["holder"].addChild(temp);
					this["skillMC_" + i]["maskMC"].addEventListener(MouseEvent.CLICK, selectSkill);
					this["skillMC_" + i]["maskMC"].addEventListener(MouseEvent.ROLL_OVER, infoSkill);
					this["skillMC_" + i]["maskMC"].addEventListener(MouseEvent.ROLL_OUT, function(e:MouseEvent)
						{
							txt.visible = false;
						});
					this["skillMC_" + i].visible = true;
					this["skillMC_" + i]["cdTxt"].text = "";
					this["skillMC_" + i]["cdFilter"].visible = false;
					if (petObj.getPet().getSkillCooldown()[i] > 0)
					{
						this["skillMC_" + i]["cdFilter"].visible = true;
						this["skillMC_" + i]["cdTxt"].text = petObj.getPet().getSkillCooldown()[i];
						if (this["skillMC_" + i]["maskMC"].hasEventListener(MouseEvent.CLICK))
						{
							this["skillMC_" + i]["maskMC"].removeEventListener(MouseEvent.CLICK, selectSkill);
						}
					}
				}
			}
			btnPass.visible = true;
			btnPass.addEventListener(MouseEvent.CLICK, selectSkill);
			btnPass.addEventListener(MouseEvent.ROLL_OVER, infoAction);
			btnPass.addEventListener(MouseEvent.ROLL_OUT, function(e:MouseEvent)
				{
					txt.visible = false;
				});
			/*btnSpecial.visible = true;
			btnSpecial.addEventListener(MouseEvent.CLICK, specialSkill);
			btnSpecial.addEventListener(MouseEvent.ROLL_OVER, infoAction);
			btnSpecial.addEventListener(MouseEvent.ROLL_OUT, function (e: MouseEvent) {
				txt.visible = false;
			});
			if(!(nowTurn == getMaster(attacker) && newPlayerArr.indexOf(attacker) >= 0)){
				btnSpecial.visible = false;
			}*/
		}

		public function infoSkill(e:MouseEvent)
		{

			var id = e.target.parent.name.split("_")[1];
			var baseDmg = attacker.getPet().getDamage();
			var targetName = attacker.getPet().skillData[id]["target"] == "" ? "Enemy" : attacker.getPet().skillData[id]["target"].replace(attacker.getPet().skillData[id]["target"].charAt(0), attacker.getPet().skillData[id]["target"].charAt(0).toUpperCase());
			var skillDamage = attacker.getPet().skillData[id]["hasDamage"] ? Math.round((baseDmg + (baseDmg * attacker.getPet().skillData[id]["damageBonus"]))) : 0;
			Utils.moveToFrontTF(txt);
			txt.visible = true;
			txt.htmlText = "<font size=\"20\" color=\"#FFFFFF\">" + attacker.getPet().skillData[id]["description"] + "</font>";
			txt.htmlText += "<font size=\"20\" color=\"#00FF00\">" + ("Target: " + targetName) + "</font>";
			txt.htmlText += "<font size=\"20\" color=\"#FFDE00\">" + ("Level: " + attacker.getPet().skillData[id]["level"]) + "</font>";
			txt.htmlText += "<font size=\"20\" color=\"#FF0000\">" + ("Damage: " + skillDamage) + "</font>";
			txt.htmlText += "<font size=\"20\" color=\"#00BFFF\">" + ("Chakra: " + attacker.getPet().skillData[id]["skill_cp"]) + "</font>";
			txt.htmlText += "<font size=\"20\">" + ("Cooldown: " + attacker.getPet().skillData[id]["cooldown"]) + "</font>";
			txt.y = 900;
			if ((txt.y + txt.textHeight) > 950)
			{
				txt.y -= txt.y + txt.textHeight + 5 - 950;
			}
			txt.x = mouseX - 200;
			txt.height = txt.textHeight + 5;
			txt.background = true;
			txt.backgroundColor = 0x000000;
			txt.alpha = 0.8;
		}

		public function infoAction(e:MouseEvent)
		{
			if (e.target == btnPass)
			{
				txt.visible = true;
				// txt.htmlText = "<font size=\"20\" color=\"#FFFFFF\"><b>Pass</b><br>Add CP 25%</font>";
				txt.htmlText = "<font size=\"20\" color=\"#FFFFFF\"><b>Pass</b><br>Skip turn</font>";
				// trace("pass");
			}
			/*else if(e.target == btnSpecial){
				var master = getMaster(attacker);
				txt.visible = true;
				txt.htmlText = "<font size=\"20\" color=\"#FFFFFF\"><b>"+PetLibrary.getType(master.getPetInfo()["swfName"])+"Special</b><br>Only once per battle</font>";
				txt.htmlText += "<font size=\"20\" color=\"#00FF00\">" + ("Target: " + "All") + "</font>";
				txt.htmlText += "<font size=\"20\" color=\"#00BFFF\">" + ("Chakra: " + master.getMaxCP()) + "</font>";
			}*/
			txt.y = 900;
			if ((txt.y + txt.textHeight) > 950)
			{
				txt.y -= txt.y + txt.textHeight + 5 - 950;
			}
			txt.x = mouseX - 200;
			txt.height = txt.textHeight + 5;
			txt.background = true;
			txt.backgroundColor = 0x000000;
			txt.alpha = 0.8;
		}

		public function skillDisplay(show:Boolean)
		{
			for (var i = 0; i < 6; i++)
			{
				this["skillMC_" + i].visible = show;
				if (i > attacker.getPet().skillData.length - 1)
				{
					this["skillMC_" + i].visible = false;
				}
			}
			btnPass.visible = show;
			// btnSpecial.visible = show;
		}

		public function getMaster(attackerObj:Pet):Pet
		{
			if (newPlayerArr.indexOf(attackerObj) >= 0)
			{
				return playerMaster;
			}
			else
			{
				return enemyMaster;
			}
		}

		public function specialSkill(e:MouseEvent)
		{
			var master:Pet = getMaster(attacker);
			if (master.getCP() == master.getMaxCP())
			{
				switch (master.getPetType())
				{
					case 0: // balance
						// add effect
						break;
					case 1:
						// add effect all strength 100% 1 turn
						break;
					case 2:
						// add effect all guard 1 turn
						break;
					case 3:
						// add effect all enemy clear buff ???
						break;

				}
				/*if(btnSpecial.hasEventListener(MouseEvent.CLICK)){
					btnSpecial.removeEventListener(MouseEvent.CLICK, specialSkill);
				}*/
				// trace("specialSkill" + master.getPetType());
			}
			else
			{
				// trace("not enough chakra");
			}
		}

		// ACTION////////////////////////////////////////////////////////////////////////////////////////////////////
		public function baseSelectSkill(mc, id, skillTarget)
		{
			if (mc.allActions[id]["hasDamage"] == true)
			{
				handleDamageSkill(mc, id, skillTarget);
			}
			else
			{
				handleNonDamageSkill(mc, id, skillTarget);
			}
		}

		private function handleDamageSkill(mc:Object, id:int, skillTarget:String)
		{
			if (mc.allActions[id]["target"] == "all")
			{
				handleAreaDamageSkill(mc, id, skillTarget);
			}
			else
			{
				handleSingleTargetDamageSkill(mc, id, skillTarget);
			}
		}

		private function handleNonDamageSkill(mc:Object, id:int, skillTarget:String):void
		{
			// Logic for skills without damage
			if (mc.allActions[id]["target"] == "master")
			{
				handleNonDamageSkillMaster(mc, id, skillTarget);
			}
			else if (mc.allActions[id]["target"] == "self")
			{
				handleNonDamageSkillSelf(mc, id, skillTarget);
			}
			else if (mc.allActions[id]["target"] == "team")
			{
				handleAreaTeamSkill(mc, id, skillTarget);
			}
			else
			{
				handleNonDamageSkillEnemy(mc, id, skillTarget);
			}
		}

		private function handleAreaDamageSkill(mc:Object, id:int, skillTarget:String)
		{
			var dmg;
			// var randEffect:int;
			// var skillEffect:Object;
			// var dmgToCp:int;
			// var sereneMind:Object;

			skillTarget = "all";
			var tempArr = nowTurnStr == "p" ? newEnemyArr : newPlayerArr;
			for (var i in tempArr)
			{
				defender = tempArr[i];
				if (defender.getIsDead())
				{
					continue;
				}
				if (BattleUtils.checkHit(attacker, defender))
				{
					dmg = BattleUtils.calcDamage(BattleUtils.getFinalDamage(attacker.getPet().getDamage(), attacker, defender), mc.allActions[id]["damageBonus"]);
					// overheadNumber(true, dmg, skillTarget);
					// var skillEffect = mc.allActions[id]["effect"][0];
					addEffect(mc.allActions[id], attacker, defender, false);
					// 1
					// sereneMind = BattleUtils.hasEffect("serene_mind", defender, true);
					// if (sereneMind["has"])
					// {
					// BattleUtils.updateHP(attacker, -dmg);
					// }
					// else
					// {
					// BattleUtils.updateHP(defender, -dmg);
					// dmgToCp = BattleUtils.hasEffect("pet_damage_to_cp", defender, true);
					// if (dmgToCp["has"])
					// {
					// BattleUtils.updateCP(defender, (dmgToCp["amount"] / 100) * dmg);
					// }
					// }
					// 2
					if (!BattleUtils.checkDamageRebound(dmg, attacker, defender))
					{
						overheadNumber(true, dmg, skillTarget, defender);
					}
					else
					{
						overheadNumber(true, dmg, skillTarget, attacker);
					}
					// defender.setHit("hit");
				}
				else
				{
					onDodgeAttack(defender, false);
					// overheadEffect(true, BattleUtils.DODGE_ACTION_OBJ, BattleUtils.DEBUFF_TYPE, defender);
					// // defender.setHit("dodge");
				}
			}
			// 1
			// point = getPoint(mc.allActions[id], attacker, tempArr[0]);
			// mc.x = point.x;
			// mc.y = point.y;
			// mc.gotoAction(mc.allActions[id]["animation"]);
			// 2
			setAnimationPoint(mc, id, attacker, tempArr[0]);
		}

		private function handleSingleTargetDamageSkill(mc:Object, id:int, skillTarget:String)
		{
			var dmg;
			// var randEffect:int;
			var skillEffect:Object;
			// var dmgToCp:int;
			// var sereneMind:Object;
			// Logic for skill targeting a single enemy
			if (BattleUtils.checkHit(attacker, defender))
			{
				dmg = BattleUtils.calcDamage(BattleUtils.getFinalDamage(attacker.getPet().getDamage(), attacker, defender), mc.allActions[id]["damageBonus"]);
				if (mc.allActions[id]["effect"][0].hasOwnProperty("EffectArray"))
				{
					// 1
					// randEffect = Math.floor(Math.random() * mc.allActions[id]["effect"][0]["EffectArray"].length);
					// skillEffect = {
					// "effect": [ {
					// "type": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["type"],
					// "duration": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["duration"],
					// "amount": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["amount"],
					// "chance": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["chance"]
					// }]
					// };
					// 2
					skillEffect = handleEffectArray(mc, id);
					// overheadNumber(true, dmg, skillTarget);
					addEffect(skillEffect, attacker, defender, false);
				}
				else
				{
					// overheadNumber(true, dmg, skillTarget);
					if (mc.allActions[id]["effect"].length > 0)
					{
						if (mc.allActions[id]["effect"][0]["type"] == "bunny_frenzy")
						{
							// overheadEffect(true, mc.allActions[id]["effect"][0], BattleUtils.BUFF_TYPE);
							addEffect(mc.allActions[id], attacker, attacker, true);
						}
						else
						{
							// overheadEffect(true, mc.allActions[id]["effect"][0], BattleUtils.DEBUFF_TYPE);
							addEffect(mc.allActions[id], attacker, defender, false);
						}
					}
				}
				// 1
				// sereneMind = BattleUtils.hasEffect("serene_mind", defender, true);
				// if (sereneMind["has"])
				// {
				// BattleUtils.updateHP(attacker, -dmg);
				// }
				// else
				// {
				// BattleUtils.updateHP(defender, -dmg);
				// dmgToCp = BattleUtils.hasEffect("pet_damage_to_cp", defender, true);
				// if (dmgToCp["has"])
				// {
				// BattleUtils.updateCP(defender, (dmgToCp["amount"] / 100) * dmg);
				// }
				// }
				// 2
				if (!BattleUtils.checkDamageRebound(dmg, attacker, defender))
				{
					overheadNumber(true, dmg, skillTarget, defender);
				}
				else
				{
					overheadNumber(true, dmg, skillTarget, attacker);
				}
				defender.setHit("hit");
			}
			else
			{
				if (mc.allActions[id]["effect"].length > 0)
				{
					if (mc.allActions[id]["effect"][0]["type"] == "bunny_frenzy")
					{
						// overheadEffect(true, mc.allActions[id]["effect"][0], BattleUtils.BUFF_TYPE);
						addEffect(mc.allActions[id], attacker, attacker, true);
					}
				}
				onDodgeAttack(defender, true);
				// overheadEffect(true, BattleUtils.DODGE_ACTION_OBJ, BattleUtils.DEBUFF_TYPE, defender);
				// defender.setHit("dodge");
			}
			// 1
			// point = getPoint(mc.allActions[id], attacker, defender);
			// mc.x = point.x;
			// mc.y = point.y;
			// mc.gotoAction(mc.allActions[id]["animation"]);
			// 2
			setAnimationPoint(mc, id, attacker, defender);
		}

		private function handleNonDamageSkillMaster(mc:Object, id:int, skillTarget:String):void
		{
			// Logic for skills without damage
			skillTarget = "master";
			defender = getMaster(attacker);
			var skillEffect;
			if (mc.allActions[id]["effect"][0].hasOwnProperty("EffectArray"))
			{
				// 1
				// randEffect = Math.floor(Math.random() * mc.allActions[id]["effect"][0]["EffectArray"].length);
				// skillEffect = {
				// "effect": [ {
				// "type": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["type"],
				// "duration": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["duration"],
				// "amount": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["amount"],
				// "chance": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["chance"]
				// }]
				// };
				// 2
				skillEffect = handleEffectArray(mc, id);
				addEffect(skillEffect, attacker, defender, true);
			}
			else
			{
				addEffect(mc.allActions[id], attacker, defender, true);
			}
			// 1
			// point = getPoint(mc.allActions[id], attacker, defender);
			// mc.x = point.x;
			// mc.y = point.y;
			// mc.gotoAction(mc.allActions[id]["animation"]);
			// 2
			setAnimationPoint(mc, id, attacker, defender);
		}

		private function handleNonDamageSkillSelf(mc:Object, id:int, skillTarget:String):void
		{
			// Logic for skills without damage
			skillTarget = "self";
			defender = attacker;
			addEffect(mc.allActions[id], attacker, defender, true);
			mc.gotoAction(mc.allActions[id]["animation"]);
		}

		private function handleNonDamageSkillEnemy(mc:Object, id:int, skillTarget:String):void
		{
			// Logic for skills without damage
			var skillEffect;
			if (BattleUtils.checkHit(attacker, defender))
			{
				if (mc.allActions[id]["effect"][0].hasOwnProperty("EffectArray"))
				{
					// 1
					// randEffect = Math.floor(Math.random() * mc.allActions[id]["effect"][0]["EffectArray"].length);
					// skillEffect = {
					// "effect": [ {
					// "type": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["type"],
					// "duration": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["duration"],
					// "amount": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["amount"],
					// "chance": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["chance"]
					// }]
					// };
					// 2
					skillEffect = handleEffectArray(mc, id);
					addEffect(skillEffect, attacker, defender, false);

				}
				else
				{
					addEffect(mc.allActions[id], attacker, defender, false);
				}
				defender.setHit("hit");
			}
			else
			{
				onDodgeAttack(defender, true);
				// overheadEffect(true, BattleUtils.DODGE_ACTION_OBJ, BattleUtils.DEBUFF_TYPE, defender);
				// defender.setHit("dodge");
			}
			// 1
			// point = getPoint(mc.allActions[id], attacker, defender);
			// mc.x = point.x;
			// mc.y = point.y;
			// mc.gotoAction(mc.allActions[id]["animation"]);
			// 2
			setAnimationPoint(mc, id, attacker, defender);
		}

		private function handleAreaTeamSkill(mc:Object, id:int, skillTarget:String)
		{
			skillTarget = "team";
			var tempArr = nowTurnStr == "p" ? newPlayerArr : newEnemyArr;
			for (var i in tempArr)
			{
				defender = tempArr[i];
				if (defender.getIsDead())
				{
					continue;
				}
				addEffect(mc.allActions[id], attacker, defender, true);
			}
			setAnimationPoint(mc, id, attacker, tempArr[0]);
		}

		private function handleEffectArray(mc, id):Object
		{
			// TODO
			var randEffect = Math.floor(Math.random() * mc.allActions[id]["effect"][0]["EffectArray"].length);
			var skillEffect = {
					"effect": [ {
							"type": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["type"],
							"duration": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["duration"],
							"amount": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["amount"],
							"chance": mc.allActions[id]["effect"][0]["EffectArray"][randEffect]["chance"]
						}]
				};
			return skillEffect;
		}

		private function handleEffectAnimation(mc, id, skillEffect, attacker, defender, isBuff)
		{
			// TODO

			// // DEBUFF
			// if (mc.allActions[id]["effect"].length > 0)
			// {
			// overheadEffect(true, mc.allActions[id]["effect"][0], BattleUtils.DEBUFF_TYPE);
			// }
			// addEffect(mc.allActions[id], attacker, defender, false);

			// // EFFECT ARRAY
			// if (mc.allActions[id]["effect"].length > 0)
			// {
			// overheadEffect(true, skillEffect["effect"][0], BattleUtils.DEBUFF_TYPE);
			// }
			// addEffect(skillEffect, attacker, defender, false);

			// // BUFF
			// if (mc.allActions[id]["effect"].length > 0)
			// {
			// overheadEffect(true, mc.allActions[id]["effect"][0], BattleUtils.BUFF_TYPE);
			// }
			// addEffect(mc.allActions[id], attacker, defender, true);

			// // EFFECT ARRAY
			// if (mc.allActions[id]["effect"].length > 0)
			// {
			// overheadEffect(true, skillEffect["effect"][0], BattleUtils.BUFF_TYPE);
			// }
			// addEffect(skillEffect, attacker, defender, true);
		}

		private function setAnimationPoint(mc, id, attackerObj, defenderObj)
		{
			var point = getPoint(mc.allActions[id], attackerObj, defenderObj);
			mc.x = point.x;
			mc.y = point.y;
			mc.gotoAction(mc.allActions[id]["animation"]);
		}

		private function onDodgeAttack(obj, animation)
		{
			overheadEffect(true, BattleUtils.DODGE_ACTION_OBJ, BattleUtils.DEBUFF_TYPE, obj);
			if (animation)
			{
				obj.setHit("dodge");
			}
		}

		private function passAction(mc, attacker, defender, skillTarget)
		{
			BattleUtils.charge(attacker);
			mc.gotoAction(skillTarget);
			skillDisplay(false);
			BattleUtils.updateSkillCooldown(attacker.getPet(), -1);
			hideTarget(true);
			battleStatus("0", skillTarget);
		}

		public function AISelectSkill()
		{
			// trace("AI select skill start");
			// attacker = this["enemyPetMc_0"]["charMc"].getChildByName("petMc");
			// defender = this["playerPetMc_0"]["charMc"].getChildByName("petMc");
			var rand = 0;
			if (nowTurnStr == "p")
			{
				rand = Math.floor(Math.random() * newEnemyArr.length);
				defender = BattleUtils.checkTargetIsDead(rand, newEnemyArr); // this["enemyPetMc_" + rand]["charMc"].getChildByName("petMc");
			}
			else
			{
				rand = Math.floor(Math.random() * newPlayerArr.length);
				defender = BattleUtils.checkTargetIsDead(rand, newPlayerArr); // this["playerPetMc_" + rand]["charMc"].getChildByName("petMc");
			}
			var mc = attacker.getPet();
			Utils.moveToFront(mc.parent.parent);
			BattleUtils.setupAvailableSkills(mc);
			var skillTarget = "enemy";
			if (mc.allActions.length == 0)
			{
				defender = attacker;
				skillTarget = "pass";
				// 1
				// BattleUtils.charge(attacker);
				// mc.gotoAction(skillTarget);
				// skillDisplay(false);
				// BattleUtils.updateSkillCooldown(attacker.getPet(), -1);
				// hideTarget(true);
				// battleStatus("0", skillTarget);
				// 2
				passAction(mc, attacker, defender, skillTarget);
				// trace("AI select skill finish pass");
				return;
			}
			// 1
			var dmg = "";
			var randEffect, skillEffect, point;
			var dmgToCp, sereneMind;
			var id = Math.floor(Math.random() * mc.allActions.length);
			// 
			baseSelectSkill(mc, id, skillTarget);
			// 
			skillNameTxt = mc.allActions[id]["name"];
			this.popupInfo.gotoAndPlay("show");
			BattleUtils.updateSkillCooldown(attacker.getPet(), mc.skillData.indexOf(mc.allActions[id]));
			// battleStatus(dmg, skillTarget);
			// trace("AI select skill finish");
		}

		public function selectSkill(e:MouseEvent)
		{
			// trace("Pleayer select skill start");
			defender = newEnemyArr[selectedTarget];
			var mc = attacker.getPet();
			mc.allActions = mc.skillData;
			Utils.moveToFront(mc.parent.parent);
			var skillTarget = "enemy";
			if (e.target.parent.name == "btnPass")
			{
				defender = attacker;
				skillTarget = "pass";
				// 1
				// BattleUtils.charge(attacker);
				// mc.gotoAction(skillTarget);
				// skillDisplay(false);
				// BattleUtils.updateSkillCooldown(attacker.getPet(), -1);
				// hideTarget(true);
				// battleStatus("0", skillTarget);
				// 2
				passAction(mc, attacker, defender, skillTarget);
				// trace("Pleayer select skill finish pass");
				return;
			}
			// 1
			var dmg = "";
			var randEffect, skillEffect, point;
			var dmgToCp, sereneMind;
			var id = int(e.target.parent.name.split("_")[1]);
			// 
			baseSelectSkill(mc, id, skillTarget);
			// 
			skillNameTxt = mc.allActions[id]["name"]; // skillNameTxt = mc.skillData[id]["name"];
			this.popupInfo.gotoAndPlay("show");
			skillDisplay(false);
			BattleUtils.updateSkillCooldown(attacker.getPet(), id);
			hideTarget(true);
			// battleStatus(dmg, skillTarget);
			// trace("Pleayer select skill finish");
		}
		// ////////////////////////////////////////////////////////////////////////////////////////////////////
		public function effectToStr(effect)
		{
			// trace(effect);
			var effType = effect["type"] != "no effect" ? (effect["type"] + " ") : "";
			var amount = effect["amount"] != undefined ? (effect["amount"] + "% ") : "";
			var duration = effect["duration"] != undefined ? ("(" + effect["duration"] + ")") : "";
			// trace(effect["type"] + ":(duration:" + effect["duration"] + ")(amount:" + effect["amount"] + ")");
			// trace(effType + duration);
			// trace(BattleData.displaySpecialText(effect));
			return BattleData.displaySpecialText(effect);
		}
		// ////////////////////////////////////////////////////////////////////////////////////////////////////
		public function petMcVisible(show:Boolean)
		{
			for (var i = 0; i < 3; i++)
			{
				this["playerPetMc_" + i].visible = show;
				this["enemyPetMc_" + i].visible = show;
				turnVisible(show);
			}
		}

		public function turnVisible(show:Boolean)
		{
			for (var i = 0; i < 3; i++)
			{
				Utils.addActiveGlowFilter(this["playerPetMc_" + i]["activeMc"], show);
				Utils.addActiveGlowFilter(this["enemyPetMc_" + i]["activeMc"], show);
			}
		}

		public function onAttackHit()
		{
			updateBar();
			if (defender.getHit() == "hit")
			{
				defender.getPet().gotoHit();
			}
			else if (defender.getHit() == "dodge")
			{
				defender.getPet().gotoAction("dodge");
			}
			defender.setHit("");
		}

		public function initBattle():void
		{
			if (initialized)
			{
				return;
			}
			statusTxt.htmlText = "<font color=\"#00FF00\">Battle Start</font>";
			statusTxt.scrollV = statusTxt.maxScrollV;
			// characterArr = new Vector.<Pet> (playerNum + opponentNum);
			characterArr = new Vector.<Pet>();
			petMcVisible(false);
			hideTarget(false);
			updateBar();
			for (var i = 0; i < newPlayerArr.length; i++)
			{
				newPlayerArr[i].getPet().setAttackHitCB(function()
					{
						onAttackHit();
					});
				newPlayerArr[i].getPet().setActionFinishCB(function()
					{
						this.x = 0;
						this.y = 0;
						updateBar();
						if (this.currentLabel != "hit" && this.currentLabel != "dodge")
						{
							setTimeout(function()
								{
									turn++;
									startBattle();
								}, 300);
						}
						this.gotoStandby();
					});
				this["playerPetMc_" + i]["petType"].gotoAndStop(newPlayerArr[i].getPet().getPetObj()["type"]);
				this["playerPetMc_" + i]["petType"].addEventListener(MouseEvent.ROLL_OVER, showEffectList);
				this["playerPetMc_" + i]["petType"].addEventListener(MouseEvent.ROLL_OUT, hideEffectList);
				if (this["playerPetMc_" + i]["charMc"].numChildren > 0)
				{
					this["playerPetMc_" + i]["charMc"].removeChildAt(0);
				}
				this["playerPetMc_" + i]["charMc"].addChild(newPlayerArr[i].getPet());
				this["playerPetMc_" + i]["nameTxt"].text = newPlayerArr[i].getPet().getPetObj()["name"];
				this["playerPetMc_" + i]["target"].visible = false;
				this["playerPetMc_" + i].visible = true;
				// characterArr[i * 2] = newPlayerArr[i]; //TODO
			}
			for (i = 0; i < newEnemyArr.length; i++)
			{
				newEnemyArr[i].getPet().setAttackHitCB(function()
					{
						onAttackHit();
					});
				newEnemyArr[i].getPet().setActionFinishCB(function()
					{
						this.x = 0;
						this.y = 0;
						updateBar();
						if (this.currentLabel != "hit" && this.currentLabel != "dodge")
						{
							setTimeout(function()
								{
									turn++;
									startBattle();
								}, 300);
						}
						this.gotoStandby();
					});
				this["enemyPetMc_" + i]["petType"].gotoAndStop(newEnemyArr[i].getPet().getPetObj()["type"]);
				this["enemyPetMc_" + i]["petType"].addEventListener(MouseEvent.ROLL_OVER, showEffectList);
				this["enemyPetMc_" + i]["petType"].addEventListener(MouseEvent.ROLL_OUT, hideEffectList);
				if (this["enemyPetMc_" + i]["charMc"].numChildren > 0)
				{
					this["enemyPetMc_" + i]["charMc"].removeChildAt(0);
				}
				this["enemyPetMc_" + i]["charMc"].addChild(newEnemyArr[i].getPet());
				this["enemyPetMc_" + i]["nameTxt"].text = newEnemyArr[i].getPet().getPetObj()["name"];
				this["enemyPetMc_" + i].visible = true;
				// characterArr[i * 2 + 1] = newEnemyArr[i]; //TODO
				this["enemyPetMc_" + i]["maskMC"].addEventListener(MouseEvent.CLICK, onSelectTarget);
			}
			var maxNum = Math.max(playerNum, opponentNum);
			for (i = 0; i < maxNum; i++)
			{
				if (i < playerNum)
				{
					characterArr.push(newPlayerArr[i]);
					// trace("player"+i);
				}
				if (i < opponentNum)
				{
					characterArr.push(newEnemyArr[i]);
					// trace("opponent"+i);
				}
			}

			attacker = characterArr[0];
			if (newPlayerArr.indexOf(attacker))
			{
				defender = newEnemyArr[selectedTarget];
			}
			else
			{
				defender = newPlayerArr[selectedTarget];
			}

			skillDisplay(false);
			initialized = true;
		}

		public function addEffect(skillObj, attacker:Pet, target:Pet, isBuff)
		{
			// trace("add effect start");
			for (var i in skillObj["effect"])
			{
				if (skillObj["effect"][i]["type"] != "no effect")
				{
					var skillEffect = {
							"type": skillObj["effect"][i]["type"],
							"duration": skillObj["effect"][i]["duration"],
							"amount": skillObj["effect"][i]["amount"],
							"chance": skillObj["effect"][i]["chance"]
						};
					// check chance if not true effect not added
					if (!BattleUtils.checkChanceEffect(skillEffect))
					{
						trace("the skill effect not added" + skillObj["name"]);
						return;
					}
					// if (i == 0)
					// {
					// overheadEffect(true, skillEffect, isBuff ? BattleUtils.BUFF_TYPE : BattleUtils.DEBUFF_TYPE);
					// }
					effectToStr(skillEffect);
					if (isBuff)
					{
						overheadEffect(true, skillEffect, BattleUtils.BUFF_TYPE, target);
						if (!BattleUtils.directBuff(skillEffect, target))
						{
							if (!BattleUtils.isDupliEffect(skillEffect, target, isBuff))
							{
								target.getBuffArr()[skillEffect["type"]] = (skillEffect);
							}
						}
					}
					else
					{
						if (BattleUtils.hasEffect("debuff_resist", target, true)["duration"] > 1)
						{
							continue;
						}
						if (BattleUtils.hasEffect("pet_debuff_resist", target, true)["duration"] > 1)
						{
							continue;
						}
						overheadEffect(true, skillEffect, BattleUtils.DEBUFF_TYPE, target);
						if (!BattleUtils.directDebuff(skillEffect, attacker, target, getMaster(attacker)))
						{
							if (!BattleUtils.isDupliEffect(skillEffect, target, isBuff))
							{
								target.getDebuffArr()[skillEffect["type"]] = (skillEffect);
							}
						}
					}

					// if (!BattleUtils.isDupliEffect(skillEffect, target, isBuff))
					// {
					// if (isBuff)
					// {
					// overheadEffect(true, skillEffect, isBuff ? BattleUtils.BUFF_TYPE : BattleUtils.DEBUFF_TYPE, target);
					// if (!BattleUtils.directBuff(skillEffect, target))
					// {
					// target.getBuffArr()[skillEffect["type"]] = (skillEffect);
					// }
					// }
					// else
					// {
					// if (BattleUtils.hasEffect("debuff_resist", target, true)["has"])
					// {
					// continue;
					// }
					// if (BattleUtils.hasEffect("pet_debuff_resist", target, true)["has"])
					// {
					// continue;
					// }
					// overheadEffect(true, skillEffect, isBuff ? BattleUtils.BUFF_TYPE : BattleUtils.DEBUFF_TYPE, target);
					// if (!BattleUtils.directDebuff(skillEffect, attacker, target, getMaster(attacker)))
					// {
					// target.getDebuffArr()[skillEffect["type"]] = (skillEffect);
					// }
					// }
					// }

				}
			}
			// trace("add effect finish");
		}

		public function checkPurify(charObj)
		{
			if (BattleUtils.checkPurify(charObj))
			{
				// var purifyEffect = {"effect":[{"type":"purify", "duration":2}]};
				// addEffect(purifyEffect, charObj, charObj,true);
				overheadEffect(true, BattleUtils.PURIFY_ACTION_OBJ, BattleUtils.BUFF_TYPE, charObj);
				var cooldown = charObj.getPet().getSkillCooldown();
				cooldown[0] = 0;
				charObj.getPet().setSkillCooldown(cooldown);
				charObj.setDebuffArr( {});
			}
			// trace("check purify finish");
		}

		public function checkBuff(obj)
		{
			var buffArr = {};
			for (var i in obj.getBuffArr())
			{
				obj.getBuffArr()[i]["duration"]--;
				if (obj.getBuffArr()[i]["duration"] > 0)
				{
					buffArr[obj.getBuffArr()[i]["type"]] = (obj.getBuffArr()[i]);
				}
				if (obj.getBuffArr()[i]["type"] == "pet_heal" && obj.getBuffArr()[i]["duration"] > 0)
				{
					var recoverHP = Math.round(obj.getMaxHP() * (obj.getBuffArr()[i]["amount"]) / 100);
					if (obj.getIsDead() || BattleUtils.hasEffect("internal_injury", obj, false)["has"])
					{
						recoverHP = 0;
					}
					BattleUtils.updateHP(obj, recoverHP);
				}
				else if (obj.getBuffArr()[i]["type"] == "catalytic_matter" && obj.getBuffArr()[i]["duration"] > 0)
				{
					trace("catalytic_matter side effect");
					var reduceHP = -Math.round(obj.getMaxHP() * 0.02);
					if (obj.getIsDead())
					{
						reduceHP = 0;
					}
					BattleUtils.updateHP(obj, reduceHP);
				}

			}
			obj.setBuffArr(buffArr);
		}

		public function checkDebuff(obj)
		{
			BattleUtils.checkPurify(obj);
			checkBuff(obj);
			var pass = false;
			var debuffArr = {};
			for (var i in obj.getDebuffArr())
			{
				obj.getDebuffArr()[i]["duration"]--;
				if (obj.getDebuffArr()[i]["duration"] > 0)
				{
					debuffArr[obj.getDebuffArr()[i]["type"]] = obj.getDebuffArr()[i];
				}
				if (obj.getDebuffArr()[i]["type"] == "bundle" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					pass = true;
				}
				else if (obj.getDebuffArr()[i]["type"] == "chaos" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					pass = true;
				}
				else if (obj.getDebuffArr()[i]["type"] == "stun" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					pass = true;
				}
				else if (obj.getDebuffArr()[i]["type"] == "stun_random" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					pass = true;
				}
				else if (obj.getDebuffArr()[i]["type"] == "fear" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					pass = true;
				}
				else if (obj.getDebuffArr()[i]["type"] == "pet_freeze" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					pass = true;
				}
				else if (obj.getDebuffArr()[i]["type"] == "pet_burn" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					var burn = Math.round(obj.getMaxHP() * (obj.getDebuffArr()[i]["amount"]) / 100);
					BattleUtils.updateHP(obj, -burn);
				}
				else if (obj.getDebuffArr()[i]["type"] == "dismantle" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					var cooldown = obj.getPet().getSkillCooldown();
					cooldown[0] = (obj.getDebuffArr()[i]["duration"]);
					obj.getPet().setSkillCooldown(cooldown);
				}
				else if (obj.getDebuffArr()[i]["type"] == "coilding_wave" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					var burnHP = Math.round(obj.getMaxHP() * (obj.getDebuffArr()[i]["amount"]) / 100);
					var burnCP = Math.round(obj.getMaxCP() * (obj.getDebuffArr()[i]["amount"]) / 100);
					BattleUtils.updateHP(obj, -burnHP);
					BattleUtils.updateHP(obj, -burnCP);
					pass = true;
				}
				else if (obj.getDebuffArr()[i]["type"] == "poison" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					burnHP = Math.round(obj.getMaxHP() * (obj.getDebuffArr()[i]["amount"]) / 100);
					BattleUtils.updateHP(obj, -burnHP);
				}
				else if (obj.getDebuffArr()[i]["type"] == "sleep" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					pass = true;
				}
				else if (obj.getDebuffArr()[i]["type"] == "random_sleep" && obj.getDebuffArr()[i]["duration"] > 0)
				{
					pass = true;
				}
			}
			obj.setDebuffArr(debuffArr);
			// check Dead
			var isDead = checkAndSetCharDead(obj);
			if (pass || isDead)
			{

				if (newPlayerArr.indexOf(obj) == 0 || (controlParty && (newPlayerArr.indexOf(nowTurn) > 0)))
				{
					skillDisplay(false);
					hideTarget(true);
				}
				BattleUtils.updateSkillCooldown(obj.getPet(), -1);
				if (isDead)
				{
					setTimeout(function()
						{
							turn++;
							startBattle();
						}, 300);
				}else{
					obj.getPet().gotoAction("pass");
				}
			}
			return pass || isDead;
		}

		public function hideTarget(actionFinish:Boolean)
		{
			for (var i = 0; i < 3; i++)
			{
				var isDead = false;
				if (i < opponentNum)
				{
					isDead = newEnemyArr[i].getIsDead();
				}
				if (((controlParty && nowTurnStr == "p") || newPlayerArr.indexOf(nowTurn) == 0) && !isDead && !actionFinish)
				{
					this["enemyPetMc_" + i]["maskMC"].addEventListener(MouseEvent.CLICK, onSelectTarget);
				}
				else
				{
					if (this["enemyPetMc_" + i]["maskMC"].hasEventListener(MouseEvent.CLICK))
					{
						this["enemyPetMc_" + i]["maskMC"].removeEventListener(MouseEvent.CLICK, onSelectTarget);
					}
				}
				this["enemyPetMc_" + i]["target"].visible = false;
			}
		}

		public function onSelectTarget(e:MouseEvent)
		{
			hideTarget(false);
			var targetName = e.target.parent.name.split("_");
			selectedTarget = int(targetName[1]);
			e.target.parent["target"].visible = true;
			defender = newEnemyArr[selectedTarget];
		}

		public function updateBar()
		{
			for (var i = 0; i < opponentNum; i++)
			{
				this["enemyPetMc_" + i].hpTxt.text = newEnemyArr[i].getHP() + "/" + newEnemyArr[i].getMaxHP();
				this["enemyPetMc_" + i]["hpBar"].scaleX = (newEnemyArr[i].getHP() / newEnemyArr[i].getMaxHP());
				this["enemyPetMc_" + i].cpTxt.text = newEnemyArr[i].getCP() + "/" + newEnemyArr[i].getMaxCP();
				this["enemyPetMc_" + i]["cpBar"].scaleX = (newEnemyArr[i].getCP() / newEnemyArr[i].getMaxCP()) * 0.8;
			}
			for (i = 0; i < playerNum; i++)
			{
				this["playerPetMc_" + i].hpTxt.text = newPlayerArr[i].getHP() + "/" + newPlayerArr[i].getMaxHP();
				this["playerPetMc_" + i]["hpBar"].scaleX = (newPlayerArr[i].getHP() / newPlayerArr[i].getMaxHP());
				this["playerPetMc_" + i].cpTxt.text = newPlayerArr[i].getCP() + "/" + newPlayerArr[i].getMaxCP();
				this["playerPetMc_" + i]["cpBar"].scaleX = (newPlayerArr[i].getCP() / newPlayerArr[i].getMaxCP()) * 0.8;
			}
			// refreshEffectList();
		}

		public function checkHpCpZero(charStats:Pet)
		{
			charStats.getHP();
			charStats.getCP();
		}

		public function overheadNumber(show:Boolean, dmg, target, obj)
		{
			// var color = target == "self" || target == "master" ? "#00FF00" : "#FF0000";
			// defender.getPet().parent.parent["ohMc"].gotoAndStop(2);
			// defender.getPet().parent.parent["ohMc"]["dmgMc"]["dmgTxt"].visible = show;
			// defender.getPet().parent.parent["ohMc"]["dmgMc"]["dmgTxt"].htmlText = "<font color=\"" + color + "\">" + dmg + "</font>";
			// defender.getPet().parent.parent["ohMc"].gotoAndPlay("word");
			var color = target == "self" || target == "master" ? "#00FF00" : "#FF0000";
			obj.getPet().parent.parent["ohMc"].gotoAndStop(2);
			obj.getPet().parent.parent["ohMc"]["dmgMc"]["dmgTxt"].visible = show;
			obj.getPet().parent.parent["ohMc"]["dmgMc"]["dmgTxt"].htmlText = "<font color=\"" + color + "\">" + dmg + "</font>";
			obj.getPet().parent.parent["ohMc"].gotoAndPlay("word");
		}

		public function overheadEffect(show:Boolean, effect, typeEffect, obj)
		{
			var color = typeEffect == BattleUtils.BUFF_TYPE ? "#00FF00" : "#FF0000";
			if (typeEffect == BattleUtils.BUFF_TYPE)
			{
				obj.getPet().parent.parent["ohMc"].gotoAndStop(2);
				obj.getPet().parent.parent["ohMc"]["buffMc"]["dmgTxt"].visible = show;
				obj.getPet().parent.parent["ohMc"]["buffMc"]["dmgTxt"].htmlText = "<font size =\"18\" color=\"" + color + "\">" + effectToStr(effect) + "</font>";
				obj.getPet().parent.parent["ohMc"].gotoAndPlay("word");
			}
			else
			{
				obj.getPet().parent.parent["ohMc"].gotoAndStop(2);
				obj.getPet().parent.parent["ohMc"]["debuffMc"]["dmgTxt"].visible = show;
				obj.getPet().parent.parent["ohMc"]["debuffMc"]["dmgTxt"].htmlText = "<font size =\"18\" color=\"" + color + "\">" + effectToStr(effect) + "</font>";
				obj.getPet().parent.parent["ohMc"].gotoAndPlay("word");
			}
			// var color = typeEffect == BattleUtils.BUFF_TYPE ? "#00FF00" : "#FF0000";
			// if (typeEffect == BattleUtils.BUFF_TYPE)
			// {
			// defender.getPet().parent.parent["ohMc"].gotoAndStop(2);
			// defender.getPet().parent.parent["ohMc"]["buffMc"]["dmgTxt"].visible = show;
			// defender.getPet().parent.parent["ohMc"]["buffMc"]["dmgTxt"].htmlText = "<font size =\"18\" color=\"" + color + "\">" + effectToStr(effect) + "</font>";
			// defender.getPet().parent.parent["ohMc"].gotoAndPlay("word");
			// }
			// else
			// {
			// defender.getPet().parent.parent["ohMc"].gotoAndStop(2);
			// defender.getPet().parent.parent["ohMc"]["debuffMc"]["dmgTxt"].visible = show;
			// defender.getPet().parent.parent["ohMc"]["debuffMc"]["dmgTxt"].htmlText = "<font size =\"18\" color=\"" + color + "\">" + effectToStr(effect) + "</font>";
			// defender.getPet().parent.parent["ohMc"].gotoAndPlay("word");
			// }
		}

		public function hideEffectList(e:MouseEvent)
		{
			this.effectListMc.visible = false;
		}

		public function showEffectList(e:MouseEvent)
		{
			this.effectListMc.visible = true;
			getEffectList(e.target.parent);
		}

		public function getEffectList(mc)
		{
			var id = mc.name.split("_")[1];
			var charObj:Pet = mc.name.indexOf("player") >= 0 ? newPlayerArr[id] : newEnemyArr[id];
			var effType, amount, duration;
			effectListMc.txt.htmlText = "Effect: ";
			for (var i in charObj.getBuffArr())
			{
				effType = charObj.getBuffArr()[i]["type"] != "no effect" ? (charObj.getBuffArr()[i]["type"] + " ") : "";
				amount = charObj.getBuffArr()[i]["amount"] != undefined ? (charObj.getBuffArr()[i]["amount"] + "% ") : "";
				duration = charObj.getBuffArr()[i]["duration"] != undefined ? ("(" + charObj.getBuffArr()[i]["duration"] + ")") : "";
				if (charObj.getBuffArr()[i]["duration"] > 0)
				{
					this["effectListMc"]["txt"].htmlText += "<font size =\"20\" color=\"#00FF00\">" + effectToStr(charObj.getBuffArr()[i]) + "</font>";
				}
			}

			for (var j in charObj.getDebuffArr())
			{
				effType = charObj.getDebuffArr()[j]["type"] != "no effect" ? (charObj.getDebuffArr()[j]["type"] + " ") : "";
				amount = charObj.getDebuffArr()[j]["amount"] != undefined ? (charObj.getDebuffArr()[j]["amount"] + "% ") : "";
				duration = charObj.getDebuffArr()[j]["duration"] != undefined ? ("(" + charObj.getDebuffArr()[j]["duration"] + ")") : "";
				if (charObj.getDebuffArr()[j]["duration"] > 0)
				{
					this["effectListMc"]["txt"].htmlText += "<font size =\"20\" color=\"#FF0000\">" + effectToStr(charObj.getDebuffArr()[j]) + "</font>";
				}
			}
			effectListMc.y = mc.y + 15;
			if (mc.x < (1920 / 2))
			{
				effectListMc.x = mc.x - 265;
			}
			else
			{
				effectListMc.x = mc.x + 265;
			}
			Utils.moveToFront(effectListMc);
		}

		public function showAllOverheadEffect(charObj)
		{
			// pake button show or hide
			// var effType, amount, duration;
			// trace("==============" + charObj["mc"].getPetObj()["name"] + "================");
			// trace("------------Buff------------");
			/*for (var i in charObj.getBuffArr()) {
				effType = charObj.getBuffArr()[i]["type"] != "no effect" ? (charObj.getBuffArr()[i]["type"] + " ") : "";
				amount = charObj.getBuffArr()[i]["amount"] != undefined ? (charObj.getBuffArr()[i]["amount"] + "% ") : "";
				duration = charObj.getBuffArr()[i]["duration"] != undefined ? ("(" + charObj.getBuffArr()[i]["duration"] + ")") : "";
				trace(effType + amount + duration);
			}
			trace("------------Debuff------------");
			for (var j in charObj.getDebuffArr()) {
				effType = charObj.getDebuffArr()[j]["type"] != "no effect" ? (charObj.getDebuffArr()[j]["type"] + " ") : "";
				amount = charObj.getDebuffArr()[j]["amount"] != undefined ? (charObj.getDebuffArr()[j]["amount"] + "% ") : "";
				duration = charObj.getDebuffArr()[j]["duration"] != undefined ? ("(" + charObj.getDebuffArr()[j]["duration"] + ")") : "";
				trace(effType + amount + duration);
			}
			trace("==============================");*/
			/*trace("showAllOverheadEffect");
			for (var i in charObj.getBuffArr()) {
				trace(i + " buff");
				trace(charObj.getBuffArr()[i]["type"]);
				charObj["mc"].parent.parent["ohMc"].gotoAndStop(2);
				charObj["mc"].parent.parent["ohMc"]["buffMc"]["dmgTxt"].visible = true;
				charObj["mc"].parent.parent["ohMc"]["buffMc"]["dmgTxt"].htmlText += "<font size =\"18\" color=\"#00FF00\">" + effectToStr(charObj.getBuffArr()[i]) + "</font>";
				charObj["mc"].parent.parent["ohMc"].gotoAndPlay("word");
			}
			if (charObj.getBuffArr().length > 0) {
				charObj["mc"].parent.parent["ohMc"].gotoAndPlay("word");
			}
			for (var j in charObj.getDebuffArr()) {
				trace(j + " debuff");
				trace(charObj.getDebuffArr()[j]["type"]);
				charObj["mc"].parent.parent["ohMc"].gotoAndStop(2);
				charObj["mc"].parent.parent["ohMc"]["debuffMc"]["dmgTxt"].visible = true;
				charObj["mc"].parent.parent["ohMc"]["debuffMc"]["dmgTxt"].htmlText += "<font size =\"18\" color=\"#FF0000\">" + effectToStr(charObj.getDebuffArr()[j]) + "</font>";
				charObj["mc"].parent.parent["ohMc"].gotoAndPlay("word");
			}
			if (charObj.getDebuffArr().length > 0) {
				charObj["mc"].parent.parent["ohMc"].gotoAndPlay("word");
			}*/
		}

		public function startBattle()
		{
			skillNameTxt = "";
			this.popupInfo.gotoAndStop("idle");
			updateBar();
			initBattle();
			checkDead();
			turnVisible(false);
			if (gameFinish)
			{
				updateBar();
				statusTxt.htmlText += "<font color=\"#00FF00\">" + (winner == "p" ? "Player" : "Enemy") + " Win</font><br>";
				Utils.moveToFront(this.popup);
				this.popup.visible = true;
				this.popup.txt.text = (winner == "p" ? "Player" : "Enemy") + " Win";
				statusTxt.scrollV = statusTxt.maxScrollV;
				return;
			}
			nowTurn = characterArr[turn % characterArr.length];
			if (nowTurn.getIsDead())
			{
				turn++;
				while (true)
				{
					nowTurn = characterArr[turn % characterArr.length];
					if (!nowTurn.getIsDead())
					{
						break;
					}
					turn++;
				}
			}
			if ((newPlayerArr.indexOf(nowTurn) == 0) || (controlParty && (newPlayerArr.indexOf(nowTurn) > 0)))
			{
				nowTurnStr = "p";
				if (controlParty)
				{
					var index = newPlayerArr.indexOf(nowTurn);
					Utils.addActiveGlowFilter(this["playerPetMc_" + index]["activeMc"], true);
					attacker = newPlayerArr[index];
					if (!checkDebuff(nowTurn))
					{
						updateBar();
						addSkillDisplay(newPlayerArr[index]);
					}
				}
				else
				{
					Utils.addActiveGlowFilter(this["playerPetMc_0"]["activeMc"], true);
					attacker = newPlayerArr[0];
					if (!checkDebuff(nowTurn))
					{
						updateBar();
						addSkillDisplay(newPlayerArr[0]);
					}
				}
				this["enemyPetMc_" + selectedTarget]["target"].visible = true;
				updateBar();
			}
			else
			{
				hideTarget(true);
				skillDisplay(false);
				index = newEnemyArr.indexOf(nowTurn);
				if (index >= 0)
				{
					Utils.addActiveGlowFilter(this["enemyPetMc_" + index]["activeMc"], true);
					nowTurnStr = "e";
					attacker = newEnemyArr[index];
				}
				else
				{
					nowTurnStr = "p";
					index = newPlayerArr.indexOf(nowTurn);
					Utils.addActiveGlowFilter(this["playerPetMc_" + index]["activeMc"], true);
					attacker = newPlayerArr[index];
				}
				if (!checkDebuff(nowTurn))
				{
					updateBar();
					AISelectSkill();
				}
				updateBar();
			}
		}

		private function checkAndSetCharDead(obj)
		{
			var charType = newPlayerArr.indexOf(obj) >= 0 ? "p" : "e";
			trace("checkAndSetCharDead " + charType);
			if (obj.getHP() <= 0 && !obj.getIsDead())
			{
				numDead[charType] += 1;
				obj.getPet().setActionFinishCB(null);
				obj.setIsDead(true);
				checkHpCpZero(obj);
				obj.getPet().gotoDead();
				if (obj.getPet().parent.parent["maskMC"].hasEventListener(MouseEvent.CLICK))
				{
					obj.getPet().parent.parent["maskMC"].removeEventListener(MouseEvent.CLICK, onSelectTarget);
				}
				return true;
			}
			return false;
		}

		public function checkDead()
		{
			for (var i = 0; i < newPlayerArr.length; i++)
			{
				checkAndSetCharDead(newPlayerArr[i]);
				// if (newPlayerArr[i].getHP() <= 0 && !newPlayerArr[i].getIsDead())
				// {
				// numDead["p"] += 1;
				// newPlayerArr[i].getPet().setActionFinishCB(null);
				// newPlayerArr[i].setIsDead(true);
				// checkHpCpZero(newPlayerArr[i]);
				// newPlayerArr[i].getPet().gotoDead();
				// if (newPlayerArr[i].getPet().parent.parent["maskMC"].hasEventListener(MouseEvent.CLICK))
				// {
				// newPlayerArr[i].getPet().parent.parent["maskMC"].removeEventListener(MouseEvent.CLICK, onSelectTarget);
				// }
				// }
			}
			for (i = 0; i < newEnemyArr.length; i++)
			{
				checkAndSetCharDead(newEnemyArr[i]);
				// if (newEnemyArr[i].getHP() <= 0 && !newEnemyArr[i].getIsDead())
				// {
				// numDead["e"] += 1;
				// newEnemyArr[i].getPet().setActionFinishCB(null);
				// newEnemyArr[i].setIsDead(true);
				// checkHpCpZero(newEnemyArr[i]);
				// newEnemyArr[i].getPet().gotoDead();
				// if (newEnemyArr[i].getPet().parent.parent["maskMC"].hasEventListener(MouseEvent.CLICK))
				// {
				// newEnemyArr[i].getPet().parent.parent["maskMC"].removeEventListener(MouseEvent.CLICK, onSelectTarget);
				// }
				// }
			}
			if (newEnemyArr[selectedTarget].getIsDead())
			{
				for (var j = 0; j < opponentNum; j++)
				{
					if (!newEnemyArr[j].getIsDead())
					{
						selectedTarget = j;
						break;
					}
				}
			}
			updateBar();
			checkGameFinish();
		}

		public function checkGameFinish()
		{
			if (numDead["e"] == opponentNum)
			{
				this["enemyPetMc_" + selectedTarget]["target"].visible = false;
				gameFinish = true;
				winner = "p";
			}
			if (numDead["p"] == playerNum || (controlParty && numDead["p"] == playerNum) || (!controlParty && newPlayerArr[0].getIsDead()))
			{
				gameFinish = true;
				winner = "e";
			}
		}

		public function battleStatus(str:String, target:String):void
		{
			var attackerName = attacker.getPet().getPetObj()["name"];
			var defenderName = defender.getPet().getPetObj()["name"];
			// trace(attackerName + " deals " + str + " damage to " + defenderName + "(" + target + ")" + "\n");
			if (str == null)
			{
				str = "";
			}
			if (nowTurnStr == "p")
			{
				if (target == "pass")
				{
					statusTxt.htmlText += "<font color=\"#0000FF\">" + attackerName + " pass</font>";
				}
				else
				{
					statusTxt.htmlText += "<font color=\"#0000FF\">" + attackerName + " deals " + str + " damage to " + defenderName + " (" + target + ")" + "</font>";
				}
			}
			else
			{
				if (target == "pass")
				{
					statusTxt.htmlText += "<font color=\"#0000FF\">" + attackerName + " pass</font>";
				}
				else
				{
					statusTxt.htmlText += "<font color=\"#FF0000\">" + attackerName + " deals " + str + " damage to " + defenderName + " (" + target + ")" + "</font>";
				}
			}
			if (target != "pass")
			{
				overheadNumber(true, str, target, defender);
			}
			statusTxt.scrollV = statusTxt.maxScrollV;
		}

		public function refreshEffectList()
		{
			for (var i = 0; i < newPlayerArr.length; i++)
			{
				// getEffectList(this["playerPetMc_" + i]);
			}
			for (i = 0; i < newEnemyArr.length; i++)
			{
				// getEffectList(this["enemyPetMc_" + i]);
			}
		}

		public function getPoint(skillObj, attacker:Pet, defender:Pet):*
		{
			var pointXY;
			var attMc = attacker.getPet();
			var defMc = defender.getPet();
			var BATTLE_CHAR_SCALE = attacker.getPet().parent.parent.name.indexOf("player") >= 0 ? 1 : -1;
			var tempX = 0, tempY = 0;
			var pPoint = attMc.localToGlobal(new Point(0, 0));
			var ePoint = defMc.localToGlobal(new Point(0, 0));
			if (skillObj.posType != null)
			{
				switch (skillObj.posType)
				{
					case "melee1":
					case "melee2":
					case "melee3":
					case "melee4":
						tempX = Math.abs(pPoint.x - ePoint.x) / 2 * BATTLE_CHAR_SCALE;
						if (pPoint.y <= ePoint.y)
						{
							tempY = Math.abs(pPoint.y - ePoint.y) / 2;
						}
						else
						{
							tempY = Math.abs(ePoint.y - pPoint.y) / 2 * -1;
						}
						pointXY = new Point(tempX, tempY);
						break;
					case "range1":
						tempX = (Math.abs(pPoint.x - ePoint.x) / 2 - 40) * BATTLE_CHAR_SCALE;
						if (pPoint.y <= ePoint.y)
						{
							tempY = Math.abs(pPoint.y - ePoint.y) / 2;
						}
						else
						{
							tempY = Math.abs(ePoint.y - pPoint.y) / 2 * -1;
						}
						pointXY = new Point(tempX, tempY);
						break;
					case "range2":
						tempX = (Math.abs(pPoint.x - ePoint.x) / 2 - 140) * BATTLE_CHAR_SCALE;
						if (pPoint.y <= ePoint.y)
						{
							tempY = Math.abs(pPoint.y - ePoint.y) / 2;
						}
						else
						{
							tempY = Math.abs(ePoint.y - pPoint.y) / 2 * -1;
						}
						pointXY = new Point(tempX, tempY);
						break;
					case "range3":
						tempX = (Math.abs(pPoint.x - ePoint.x) / 2 - 600) * BATTLE_CHAR_SCALE;
						if (pPoint.y <= ePoint.y)
						{
							tempY = Math.abs(pPoint.y - ePoint.y) / 2;
						}
						else
						{
							tempY = Math.abs(ePoint.y - pPoint.y) / 2 * -1;
						}
						pointXY = new Point(tempX, tempY);
						break;
				}
			}
			return pointXY;
		}
	}
}
