package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.filters.GlowFilter;
	import flash.utils.setTimeout;
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;

	public class Main extends MovieClip
	{
		// FRAME 1
		public var mode:int = 1;
		public var playerNum:int = 1;
		public var opponentNum:int = 1;
		public var customStats:int = 0;
		public var gameMode:String;
		public var winCondition:String;
		public var winConditionNum:int = 0;
		public var limitTurn:int = 0;
		public var allSwfData:Object;
		public var back:*;
		public var messageTxt:String = "";
		// FRAME 2
		public var petLib;
		public var petList:Array;
		public var bg = [
				background13,
				background0,
				background11,
				background1,
				background3,
				background12,
				background2,
				background5,
				background6,
				background4,
				background17,
				background15,
				background7,
				background9,
				background8,
				background10,
				// background14,
				// background19,
				// background18,
				// background16,
				// background20,
			];
		public var mapIndex:int = 0;
		public var mapId:int = 0;
		public var bg_map:*;
		public var controlParty:Boolean = false;
		public var atbMode:Boolean = false;
		public var useMapEffect:Boolean = true;
		public var useMapEffectResistance:Boolean = true;
		public var watchMode:Boolean = false;
		public var isTestMode:Boolean = false;
		public var specialSkillSystem:Boolean = false;
		public var attributeSkillSystem:Boolean = false;
		// FRAME 2 - SELECT CHARACTER
		public var newPlayerArr:Vector.<Pet> = new Vector.<Pet>();
		public var newEnemyArr:Vector.<Pet> = new Vector.<Pet>();
		public var charListNum:int;
		public var playerMaster;
		public var enemyMaster;
		public var selectedChar;
		public var selectedOpponent;
		public var selectTurn;
		// FRAME 2 - CHARACTER PAGE
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
		public var selectedTargetPlayer:uint = 0;
		public var selectedTargetEnemy:uint = 0;
		public var gameFinish:Boolean = false;
		public var skillNameTxt:String = "";
		public var numDead:Object;
		public var winner;

		public function Main()
		{
			this.allSwfData = {};
			this.allSwfData["length"] = 0;
			this.gameMode = Constant.GAME_MODE_PVE;
			this.petLib = PetLibrary.PET;
			this.petList = Constant.PET_LIST;
			this.charListNum = petList.length;
			this.selectTurn = "p";
			loadPetSwf();
			stage.addEventListener(Event.ACTIVATE, fl_Activate);
			stage.addEventListener(Event.DEACTIVATE, fl_Deactivate);
			addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3);
		}

		internal function frame1()
		{
			stop();
			this.mode = 1;
			this.playerNum = 1;
			this.opponentNum = 1;
			this.customStats = 0;
			this.gameMode = Constant.GAME_MODE_PVE;
			this.winConditionNum = 0;
			this.limitTurn = 0;
			this.winCondition = Constant.WIN_CONDITION_DEFAULT;
			this.winner = "";

			Central.battle = this;
			this.back;
			if (back != undefined)
			{
				if (stage.contains(back))
				{
					stage.removeChild(back);
				}
			}

			Utils.initButton(this["btnCustom"], this.onBattleMode, "Custom", true);
			Utils.initButton(this["btnBattleMode"], this.onShowBattleModeClicked, "Battle", true);
		}

		internal function frame2()
		{
			// var selectChar = new SelectCharacter(this.mode, playerNum, opponentNum);
			this.mapIndex = 0;
			this.bg_map = new bg[this.mapIndex]();
			this.mapId = getMapIndexByLinkageName(this.bg_map);
			this.bg_map.scaleX = 0.9;
			this.bg_map.scaleY = 0.9;
			this["popupMap"]["map"]["holder"].addChild(bg_map);

			Utils.initSwitchButton(this["popupMap"]["btnEffect"], this.onMapEffectSwitch, "Map Effect", this.useMapEffect, true);
			Utils.initSwitchButton(this["popupMap"]["btnResistance"], this.onMapResistanceEffectSwitch, "Resistance", this.useMapEffectResistance, true);
			Utils.addMouseEventClickIfNotExist(this["popupMap"]["btnNext"], this.changeBg);
			Utils.addMouseEventClickIfNotExist(this["popupMap"]["btnPrev"], this.changeBg);
			this.showMapEffectList(this.mapId);
			this["popupMap"].visible = false;

			this.newPlayerArr = new Vector.<Pet>();
			this.newEnemyArr = new Vector.<Pet>();
			this.selectTurn = "p";
			this.currentPage = 1;
			this.maxPage = Math.ceil(petList.length / Constant.MAX_CHAR_IN_GAME);
			this.controlParty = false;
			this.atbMode = false;
			this.useMapEffect = true;
			this.useMapEffectResistance = true;
			this.watchMode = false;

			this["btnHelp"].visible = false;

			Utils.addMouseEventClick(this["btnPrev"], this.changeCharPage);
			Utils.addMouseEventClick(this["btnNext"], this.changeCharPage);

			Utils.initSwitchButton(this["btnWatchMode"], this.onWatchMode, "Watch Mode", this.watchMode, this.isTestMode);
			Utils.initSwitchButton(this["btnControl"], this.onControlMode, "Control Party", this.controlParty, true);
			Utils.initSwitchButton(this["btnATB"], this.onATBMode, "Agility System", this.atbMode, true);
			this.loadAllPet();
			if ((this.playerNum == 1 && this.gameMode == Constant.GAME_MODE_PVE) || (this.playerNum == 1 && this.opponentNum == 1 && this.gameMode == Constant.GAME_MODE_PVP))
			{
				this["btnControl"].visible = false;
			}
			this["player_0"]["iconMc"].gotoAndStop(2);
			for (var i = 2; i >= playerNum; i--)
			{
				this["player_" + i].visible = false;
			}
			this["enemy_0"]["iconMc"].gotoAndStop(2);
			for (i = 2; i >= opponentNum; i--)
			{
				this["enemy_" + i].visible = false;
			}

			Utils.addMouseEventClickIfNotExist(this["btnBack"], this.gotoMenu);
			Utils.initButton(this["btnBattle"], this.onStartBattle, "Start", true);
			Utils.initButton(this["btnClear"], this.onClearSelectedChar, "Clear", true);
			Utils.initButton(this["btnRandom"], this.onSelectRandomChar, "Random", true);

			showPopupMessage("Player Turn", true);
		}

		internal function frame3()
		{
			this.initialized = false;
			this.nowTurnStr = "p";
			this.turn = 0;
			this.selectedTargetPlayer = 0;
			this.selectedTargetEnemy = 0;
			this.gameFinish = false;
			this.skillNameTxt = "";
			this.numDead = {
					"p": 0,
					"e": 0
				};

			this["effectListMc"].visible = false;
			this["statusTxt"].visible = false;
			this["popup"].visible = false;
			this["battleStats"].visible = false;
			this["statsCharMc"].visible = false;

			Utils.addMouseEventClick(this["statsCharMc"]["btnExit"], function(e:MouseEvent):void
				{
					statsCharMc.visible = false;
				});

			Utils.initButton(this["popup"]["btnBack"], this.backtoMenu, "Back to Menu", true);
			Utils.initButton(this["btnSpecial"], this.onSpecialClicked, "Special", true);
			Utils.initButton(this["btnPass"], this.onPassClicked, "Pass", true);
			Utils.initButton(this["btnRun"], this.onRunClicked, "Run", true);

			this["txt"].visible = false;

			this.back = bg_map;
			this.back.scaleX = 2;
			this.back.scaleY = 2;
			stage.addChildAt(back, 0);
			this["overlay"].visible = true;
			setTimeout(this.startBattle, 500);
			// this.startBattle();
		}

		private function fl_Activate(event:Event = null):void
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
		}

		private function fl_Deactivate(event:Event):void
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.NORMAL;
		}

		// NAVIGATION
		public function duplicateAssetMc(petSwfName:String, type:String, scaleX:Number = 1, scaleY:Number = 1, mcX:Number = 0, mcY:Number = 0):*
		{
			var cls = Utils.getAsset(Utils.searchClassBySwfName(this.allSwfData, petSwfName), type);
			if (cls != null)
			{
				cls.scaleX = scaleX;
				cls.scaleY = scaleY;
				cls.x = mcX;
				cls.y = mcY;
			}
			return cls;
		}
		public function gotoSelectChar(e:MouseEvent):void
		{
			this.gotoAndStop("selectChar");
		}

		public function gotoMenu(e:MouseEvent):void
		{
			this.gotoAndStop("menu");
		}

		public function gotoBattle(e:MouseEvent):void
		{
			this.gotoAndStop("battle");
		}

		public function showPopupBattleMode(title:String = "Battle"):void
		{
			var popupBattleMode = new PopupBattleMode();
			this.gameMode = Constant.GAME_MODE_PVE;
			this.winConditionNum = 0;
			this.limitTurn = 0;
			this.winCondition = Constant.WIN_CONDITION_DEFAULT;
			popupBattleMode["txt"].text = title;
			popupBattleMode["btnV1"]["txt"].text = "1 vs 1";
			popupBattleMode["btnV2"]["txt"].text = "2 vs 2";
			popupBattleMode["btnV3"]["txt"].text = "3 vs 3";
			popupBattleMode["txtGameMode"].text = this.gameMode.toString();
			for (var i:int = 1; i <= 3; i++)
			{
				popupBattleMode["btnV" + i].gotoAndStop("mode_" + i);
				Utils.initButton(popupBattleMode["btnV" + i]["modeBtn"], function(e:MouseEvent):void
					{
						if (stage.contains(popupBattleMode))
						{
							stage.removeChild(popupBattleMode);
						}
						onBattleMode(e);
					}, "Battle", true);
			}
			Utils.addMouseEventClickIfNotExist(popupBattleMode["btnExit"], function(e:MouseEvent)
				{
					if (stage.contains(popupBattleMode))
					{
						stage.removeChild(popupBattleMode);
					}
				});
			Utils.addMouseEventClickIfNotExist(popupBattleMode["btnModePrev"], function(e:MouseEvent):void
				{
					if (gameMode == Constant.GAME_MODE_PVP)
					{
						gameMode = Constant.GAME_MODE_PVE;
					}
					else if (gameMode == Constant.GAME_MODE_PVE)
					{
						gameMode = Constant.GAME_MODE_PVP;
					}
					popupBattleMode["txtGameMode"].text = gameMode.toString();
				});
			Utils.addMouseEventClickIfNotExist(popupBattleMode["btnModeNext"], function(e:MouseEvent):void
				{
					if (gameMode == Constant.GAME_MODE_PVP)
					{
						gameMode = Constant.GAME_MODE_PVE;
					}
					else if (gameMode == Constant.GAME_MODE_PVE)
					{
						gameMode = Constant.GAME_MODE_PVP;
					}
					popupBattleMode["txtGameMode"].text = gameMode.toString();
				});
			stage.addChild(popupBattleMode);
		}

		public function showConfirmationDialog(message:String, callback:Function):void
		{
			var confirmationDialog = new ConfirmationDialog();
			confirmationDialog["txt"].text = message;
			Utils.addMouseEventClickIfNotExist(confirmationDialog["btnOk"], function(e:MouseEvent)
				{
					if (stage.contains(confirmationDialog))
					{
						stage.removeChild(confirmationDialog);
					}
					callback();
				});
			Utils.addMouseEventClickIfNotExist(confirmationDialog["btnCancel"], function(e:MouseEvent)
				{
					if (stage.contains(confirmationDialog))
					{
						stage.removeChild(confirmationDialog);
					}
				});
			stage.addChild(confirmationDialog);
		}

		// FRAME 1
		public function onShowBattleModeClicked(e:MouseEvent):void
		{
			showPopupBattleMode("Battle");
		}
		public function onBattleMode(e:MouseEvent):void
		{
			// this.mode = e.target.parent.name.substr(-1, 1);
			this.mode = e.target.parent.parent.name.substr(-1, 1);
			if (e.target.parent.name == "btnCustom") // Custom Game
			{
				// show popup
				// this["popupCustom"].visible = true;
				this.playerNum = 1;
				this.opponentNum = 1;
				this.showCustomPopup(e);
				// this.initCustomPopup();
			}
			else
			{
				this.playerNum = mode;
				this.opponentNum = mode;
				this.gotoAndStop("selectChar");
			}
		}

		public function loadPetSwf():void
		{
			for (var i in petList)
			{
				Utils.loadSwf(Utils.genPetSwfFilePath(petList[i]), this.onLoadFinish);
			}
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
		}

		public function showCustomPopup(e:MouseEvent):void
		{
			var customPopup = new CustomPopup();
			this.gameMode = Constant.GAME_MODE_PVE;
			customPopup["txtPlayerNum"].text = playerNum.toString();
			customPopup["txtOpponentNum"].text = opponentNum.toString();
			customPopup["txtStats"].text = Constant.CUSTOM_CHAR_STATS[0];
			customPopup["txtGameMode"].text = this.gameMode.toString();
			customPopup["txtWinCondition"].text = this.winCondition.toString();
			customPopup["txtLimitTurn"].text = this.limitTurn == 0 ? "No" : this.limitTurn.toString();

			customPopup["playerNumMC"].gotoAndStop("v" + playerNum);
			customPopup["opponentNumMC"].gotoAndStop("v" + opponentNum);

			Utils.initButton(customPopup["btnStart"],
					function(e:MouseEvent):void
					{
						if (stage.contains(customPopup))
						{
							stage.removeChild(customPopup);
						}
						gotoSelectChar(e);
					}
					, "Start", true);
			Utils.addMouseEventClickIfNotExist(customPopup["btnExit"], function(e:MouseEvent):void
				{
					if (stage.contains(customPopup))
					{
						stage.removeChild(customPopup);
					}
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnMinP"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnMinO"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnPlusP"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnPlusO"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});

			Utils.addMouseEventClickIfNotExist(customPopup["btnStatsPrev"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnStatsNext"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});

			Utils.addMouseEventClickIfNotExist(customPopup["btnModePrev"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnModeNext"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnWinPrev"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnWinNext"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnLimitPrev"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			Utils.addMouseEventClickIfNotExist(customPopup["btnLimitNext"], function(e:MouseEvent):void
				{
					changeNum(e, customPopup);
				});
			stage.addChild(customPopup);
		}

		public function changeNum(e:MouseEvent, customPopup:*):void
		{
			if (e.target == customPopup["btnPlusO"])
			{
				if (this.opponentNum < 3)
				{
					this.opponentNum += 1;
				}
			}
			else if (e.target == customPopup["btnPlusP"])
			{
				if (this.playerNum < 3)
				{
					this.playerNum += 1;
				}
			}
			else if (e.target == customPopup["btnMinP"])
			{
				if (this.playerNum > 1)
				{
					this.playerNum -= 1;
				}
			}
			else if (e.target == customPopup["btnMinO"])
			{
				if (this.opponentNum > 1)
				{
					this.opponentNum -= 1;
				}
			}
			else if (e.target == customPopup["btnStatsPrev"])
			{
				this.customStats--;
				if (this.customStats < 0)
				{
					this.customStats = Constant.CUSTOM_CHAR_STATS.length - 1;
				}
			}
			else if (e.target == customPopup["btnStatsNext"])
			{
				this.customStats++;
				if (this.customStats > Constant.CUSTOM_CHAR_STATS.length - 1)
				{
					this.customStats = 0;
				}
			}
			else if (e.target == customPopup["btnModeNext"] || e.target == customPopup["btnModePrev"])
			{
				if (this.gameMode == Constant.GAME_MODE_PVP)
				{
					this.gameMode = Constant.GAME_MODE_PVE;
				}
				else if (this.gameMode == Constant.GAME_MODE_PVE)
				{
					this.gameMode = Constant.GAME_MODE_PVP;
				}
			}
			else if (e.target == customPopup["btnWinPrev"])
			{
				this.winConditionNum--;
				if (this.winConditionNum < 0)
				{
					this.winConditionNum = Constant.WIN_CONDITION_ARR.length - 1;
				}
			}
			else if (e.target == customPopup["btnWinNext"])
			{
				this.winConditionNum++;
				if (this.winConditionNum > Constant.WIN_CONDITION_ARR.length - 1)
				{
					this.winConditionNum = 0;
				}
			}
			else if (e.target == customPopup["btnLimitNext"])
			{
				if (this.limitTurn < 100)
				{
					this.limitTurn += 1;
				}
			}
			else if (e.target == customPopup["btnLimitPrev"])
			{
				if (this.limitTurn > 0)
				{
					this.limitTurn -= 1;
				}
			}
			customPopup["txtOpponentNum"].text = this.opponentNum.toString();
			customPopup["txtPlayerNum"].text = this.playerNum.toString();
			customPopup["playerNumMC"].gotoAndStop("v" + playerNum);
			customPopup["opponentNumMC"].gotoAndStop("v" + opponentNum);
			if (this.customStats == 0)
			{
				customPopup["txtStats"].text = Constant.CUSTOM_CHAR_STATS[this.customStats].toString();
			}
			else
			{
				customPopup["txtStats"].text = "Lv " + Constant.CUSTOM_CHAR_STATS[this.customStats].toString();
			}
			customPopup["txtGameMode"].text = this.gameMode.toString();
			this.winCondition = Constant.WIN_CONDITION_ARR[this.winConditionNum].toString();
			customPopup["txtWinCondition"].text = this.winCondition;
			customPopup["txtLimitTurn"].text = this.limitTurn == 0 ? "No" : this.limitTurn.toString();
		}

		// FRAME 2
		public function onWatchMode(e:MouseEvent):void
		{
			// SWITCH TEST
			this.watchMode = !watchMode;
			Utils.switchButtonBaseFunction(this.watchMode, this["btnWatchMode"]);
		}

		public function changeBg(e:MouseEvent):void
		{
			if (this["popupMap"]["map"]["holder"].numChildren > 0)
			{
				this["popupMap"]["map"]["holder"].removeChildAt(0);
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
			this.mapId = getMapIndexByLinkageName(this.bg_map);
			this.bg_map.scaleX = 0.9;
			this.bg_map.scaleY = 0.9;
			this["popupMap"]["map"]["holder"].addChild(this.bg_map);
			this.showMapEffectList(this.mapId);
		}

		private function getMapIndexByLinkageName(mc:*):int
		{
			var linkageName = Utils.getLinkageName(mc);
			return int(linkageName.replace("background", ""));
		}

		public function showMapEffectList(mapIndex:int):void
		{
			this["popupMap"]["buffTxt"].htmlText = "Map Buff:";
			this["popupMap"]["debuffTxt"].htmlText = "Map Debuff:";
			this["popupMap"]["resistanceTxt"].htmlText = "Map Resistance:";
			var mapEffect = MapEffect.getMapByIndex(mapIndex);
			this["popupMap"]["nameTxt"].htmlText = mapEffect["name"];
			var chance = mapEffect["chance"];
			var resistanceChance = mapEffect["resistanceChance"];
			if (useMapEffect == false)
			{
				chance = 0;
			}
			this.setChanceDescription("Effect Chance", this["popupMap"]["chanceTxt"], chance);
			// BUFF
			for (var i in mapEffect["buff"])
			{
				this["popupMap"]["buffTxt"].htmlText += "<font size =\"12\" color=\"#00FF00\">" + effectToStr(mapEffect["buff"][i]) + "</font>";
			}
			if (mapEffect["buff"].length == 0)
			{
				this["popupMap"]["buffTxt"].htmlText += "<font size =\"12\" color=\"#FFFFFF\">-</font>";
			}
			// DEBUFF
			for (var j in mapEffect["debuff"])
			{
				this["popupMap"]["debuffTxt"].htmlText += "<font size =\"12\" color=\"#FF0000\">" + effectToStr(mapEffect["debuff"][j]) + "</font>";
			}
			if (mapEffect["debuff"].length == 0)
			{
				this["popupMap"]["debuffTxt"].htmlText += "<font size =\"12\" color=\"#FFFFFF\">-</font>";
			}
			if (mapEffect["buff"].length == 0 && mapEffect["debuff"].length == 0)
			{
				this["popupMap"]["backEffect"].visible = false;
				this["popupMap"]["buffTxt"].visible = false;
				this["popupMap"]["debuffTxt"].visible = false;
				this["popupMap"]["chanceTxt"].visible = false;
				this["popupMap"]["btnEffect"].visible = false;
			}
			else
			{
				this["popupMap"]["backEffect"].visible = true;
				this["popupMap"]["buffTxt"].visible = true;
				this["popupMap"]["debuffTxt"].visible = true;
				this["popupMap"]["chanceTxt"].visible = true;
				this["popupMap"]["btnEffect"].visible = true;
			}

			if (useMapEffectResistance == false)
			{
				resistanceChance = 0;
			}
			this.setChanceDescription("Resistance Chance", this["popupMap"]["resistanceChanceTxt"], resistanceChance);
			// RESISTANCE LIST
			var resistanceList = [];
			for (var k in mapEffect["resistance"])
			{
				var effectName = EffectData.getText(mapEffect["resistance"][k]);
				if (resistanceList.indexOf(effectName) < 0)
				{
					this["popupMap"]["resistanceTxt"].htmlText += "<font size =\"14\" color=\"#FFFF00\">" + effectName + "</font>";
					resistanceList.push(effectName);
				}
			}
			if (resistanceList.length == 0)
			{
				this["popupMap"]["resistanceTxt"].htmlText += "<font size =\"14\" color=\"#FFFFFF\">-</font>";
				this["popupMap"]["backResistance"].visible = false;
				this["popupMap"]["resistanceTxt"].visible = false;
				this["popupMap"]["resistanceChanceTxt"].visible = false;
				this["popupMap"]["btnResistance"].visible = false;
			}
			else
			{
				this["popupMap"]["backResistance"].visible = true;
				this["popupMap"]["resistanceTxt"].visible = true;
				this["popupMap"]["resistanceChanceTxt"].visible = true;
				this["popupMap"]["btnResistance"].visible = true;
			}
		}

		private function setChanceDescription(title:String, txtMc:*, chance:int):void
		{
			if (chance <= 0)
			{
				txtMc.htmlText = title + ": -";
			}
			else if (chance < 35)
			{
				txtMc.htmlText = title + ": <font size =\"18\" color=\"#FF0000\">Low</font>";
			}
			else if (chance < 70)
			{
				txtMc.htmlText = title + ": <font size =\"18\" color=\"#FFFF00\">Medium</font>";
			}
			else
			{
				txtMc.htmlText = title + ": <font size =\"18\" color=\"#00FF00\">High</font>";
			}
		}

		public function onMapResistanceEffectSwitch(e:MouseEvent):void
		{
			this.useMapEffectResistance = !useMapEffectResistance;
			Utils.switchButtonBaseFunction(this.useMapEffectResistance, this["popupMap"]["btnResistance"]);
			this.showMapEffectList(this.mapId);
		}

		public function onMapEffectSwitch(e:MouseEvent):void
		{
			this.useMapEffect = !useMapEffect;
			Utils.switchButtonBaseFunction(this.useMapEffect, this["popupMap"]["btnEffect"]);
			this.showMapEffectList(this.mapId);
		}

		public function onControlMode(e:MouseEvent):void
		{
			this.controlParty = !controlParty;
			Utils.switchButtonBaseFunction(this.controlParty, this["btnControl"]);
		}

		public function onATBMode(e:MouseEvent):void
		{
			this.atbMode = !atbMode;
			Utils.switchButtonBaseFunction(this.atbMode, this["btnATB"]);
		}

		public function hidePopupMap(e:MouseEvent):void
		{
			this["popupMap"].visible = false;
		}

		public function onStartBattle(e:MouseEvent):void
		{
			if (this.newPlayerArr.length == this.playerNum && this.newEnemyArr.length == this.opponentNum)
			{
				this.playerMaster = this.newPlayerArr[0];
				this.enemyMaster = this.newEnemyArr[0];
				this["popupMap"].visible = true;
			}
			else
			{
				showPopupMessage("Please Choose Character", true);
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
		// FRAME 2 - CHARACTER STATS - START
		public function setupStats(petObj:Object):*
		{
			var charLevel = petObj["max_level"]; // 1
			if (this.customStats > 0)
			{
				charLevel = Constant.CUSTOM_CHAR_STATS[this.customStats];
			}
			var stats = {
					// "dmg": setupDamage(charLevel, petObj["type"]),
					"name": petObj["name"],
					"level": charLevel,
					"hp": charLevel * 20 + 80, // 40 + 60,
					"cp": charLevel * 20 + 80, // 100
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

		public function setupAttributeType(attrType:String)
		{
			var attrStats = {
					"dmg": 0,
					"hp": 0,
					"cp": 0,
					"agility": 0
				};
			if (attrType == "wind")
			{
				attrStats = {
						"dmg": 8,
						"hp": 0,
						"cp": 0,
						"agility": 10
					};
			}
			else if (attrType == "fire")
			{
				attrStats = {
						"dmg": 12,
						"hp": 0,
						"cp": 0,
						"agility": 0
					};
			}
			else if (attrType == "lightning")
			{
				attrStats = {
						"dmg": 11,
						"hp": 0,
						"cp": 0,
						"agility": 0
					};
			}
			else if (attrType == "earth")
			{
				attrStats = {
						"dmg": 10,
						"hp": 10,
						"cp": 0,
						"agility": 0
					};
			}
			else if (attrType == "water")
			{
				attrStats = {
						"dmg": 9,
						"hp": 0,
						"cp": 10,
						"agility": 0
					};
			}
			return attrStats;
		}

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
		// FRAME 2 - CHARACTER STATS - FINISH

		public function loadAllPet():void
		{
			Utils.initButton(this["popupMap"]["btnBattle"], onStartBattle, "Battle", true);
			Utils.addMouseEventClickIfNotExist(this["popupMap"]["btnExit"], this.hidePopupMap);
			for (var j = 0; j < playerNum; j++)
			{
				initSelectedCharUI(this["player_" + j]);
			}
			for (j = 0; j < opponentNum; j++)
			{
				initSelectedCharUI(this["enemy_" + j]);
			}

			this.hidePetList();
			if (this.allSwfData["length"] == this.petList.length)
			{
				this.refreshSelectedChar();
				this.showPetList();
				return;
			}
		}

		private function initSelectedCharUI(mc:*):void
		{
			mc["btnRemove"].visible = false;
			mc["btnInfo"].visible = false;
			Utils.addMouseEventClick(mc["btnRemove"], removeSelectedChar);
			Utils.addMouseEventClickIfNotExist(mc["btnInfo"], infoSelectedChar);
		}

		public function buttonVisibility():void
		{
			this["btnPrev"].visible = this.currentPage > 1;
			this["btnNext"].visible = this.currentPage < this.maxPage;
		}

		public function changeCharPage(e:MouseEvent):void
		{
			if (e.target == this["btnNext"])
			{
				if (this.currentPage < this.maxPage)
				{
					this.currentPage += 1;
					this.hidePetList();
					this.showPetList();
				}
			}
			else if (e.target == this["btnPrev"])
			{
				if (this.currentPage > 1)
				{
					this.currentPage -= 1;
					this.hidePetList();
					this.showPetList();
				}
			}
			this.buttonVisibility();
		}

		public function showPetList():void
		{
			this.buttonVisibility();
			var start = (currentPage - 1) * Constant.MAX_CHAR_IN_GAME;
			var end = Math.min(petList.length, this.currentPage * Constant.MAX_CHAR_IN_GAME);
			var index = 0;
			for (var i = start; i < end; i++)
			{
				var cls = duplicateAssetMc(petList[i], "StaticFullBody", 0.35, 0.35, 25, 32);
				var petObj = PetLibrary.getPetBySwfName(petList[i]);
				this["charMC_" + index]["petType"].gotoAndStop(petObj["type"]);
				this["charMC_" + index]["attributeType"].gotoAndStop(petObj["attribute_type"]);
				this["charMC_" + index]["petType"].visible = false;
				this["charMC_" + index]["attributeType"].visible = false;
				this["charMC_" + index].gotoAndStop(PetLibrary.getTypeTxt(petObj["type"]));
				this["charMC_" + index].visible = true;
				Utils.removeChildIfExistAt(this["charMC_" + index]["holder"], 2);
				this["charMC_" + index]["holder"].addChild(cls);
				if (Utils.hasMouseEventClick(this["charMC_" + index]["maskMC"]))
				{
					Utils.removeMouseEventClick(this["charMC_" + index]["maskMC"], loadCharacter);
				}
				Utils.addMouseEventClick(this["charMC_" + index]["maskMC"], loadCharacter);
				index++;
			}
		}

		public function loadPetById(id:int):Object
		{
			var newId = ((currentPage - 1) * Constant.MAX_CHAR_IN_GAME) + id;
			var petSwfName = petList[newId];
			return createPetObject(petSwfName);
		}

		private function createPetObject(petSwfName:String):Object
		{
			var petObj = PetLibrary.getPetBySwfName(petSwfName);
			var clsName = petObj["clsName"];

			var cls = duplicateAssetMc(petSwfName, clsName, 0.6, 0.6);
			cls.name = "petMc";
			cls.scaleX = -0.6;
			if (selectTurn == "e")
			{
				cls.scaleX = 0.6;
			}
			// cls.scaleY = 0.6;
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

			var iconCls = duplicateAssetMc(petSwfName, "icon", 0.75, 0.75, 0, 36);

			var bodyCls = duplicateAssetMc(petSwfName, "StaticFullBody", 0.75, 0.75);

			var char = {
					// "pet": petObj,
					"stats": setupStats(petObj),
					"mc": cls,
					"icon": iconCls,
					"body": bodyCls
				};
			return char;
		}

		public function loadCharacter(e:MouseEvent):void
		{
			if (this.newPlayerArr.length == this.playerNum && this.newEnemyArr.length == this.opponentNum)
			{
				showPopupMessage("Click Start to Begin the Battle", true);
			}
			var id = e.target.parent.name.split("_")[1];
			var petObj = loadPetById(id);
			var newPetObj = new Pet(petObj["stats"], petObj["mc"], petObj["icon"], petObj["body"]);

			if (this.selectTurn == "p" && this.newPlayerArr.length < this.playerNum)
			{
				this.newPlayerArr.push(newPetObj);
			}
			if (this.selectTurn == "e" && this.newEnemyArr.length < this.opponentNum)
			{
				this.newEnemyArr.push(newPetObj);
			}

			this.showSelectedChar();

			if (this.selectTurn == "p" && this.newPlayerArr.length == this.playerNum)
			{
				this.selectTurn = "e";
				if (this.newEnemyArr.length < this.opponentNum)
				{
					showPopupMessage("Opponent Turn", true);
				}
			}
			if (this.selectTurn == "e" && this.newPlayerArr.length < this.playerNum)
			{
				this.selectTurn = "p";
				showPopupMessage("Player Turn", true);
			}
		}

		private function setSelectedCharCard(charMc:*, charObj:Pet, isAdd:Boolean = true):void
		{
			if (isAdd)
			{
				var attributeType = charObj.getPetAttributeType();
				charMc["nameTxt"].text = charObj.getName();
				charMc["lvTxt"].text = charObj.getLevel();
				charMc["hpTxt"].text = charObj.getHP() + "/" + charObj.getMaxHP();
				charMc["cpTxt"].text = charObj.getCP() + "/" + charObj.getMaxCP();
				charMc["btnRemove"].visible = true;
				charMc["btnInfo"].visible = true;
				charMc["typeTxt"].text = PetLibrary.getTypeTxt(charObj.getPetType());
				if (attributeType != "null")
				{
					charMc["attributeTxt"].text = attributeType.replace(attributeType.substring(0, 1), attributeType.substring(0, 1).toUpperCase());
				}
				charMc["petType"].gotoAndStop(charObj.getPetType());
				charMc["attributeType"].gotoAndStop(attributeType);
				charMc["iconMc"]["holder"].addChild(charObj.getIcon());
			}
			else
			{
				var id = charMc.name.split("_");
				charMc["nameTxt"].text = (id[0].indexOf("player") >= 0 ? "Player " : "Opponent ") + (int(id[1]) + 1);
				charMc["lvTxt"].text = "1";
				charMc["hpTxt"].text = "100/100";
				charMc["cpTxt"].text = "100/100";
				charMc["typeTxt"].text = "Balance";
				charMc["attributeTxt"].text = "";
				charMc["petType"].gotoAndStop(4);
				charMc["attributeType"].gotoAndStop("null");
			}
		}

		public function showSelectedChar():void
		{
			for (var i = 0; i < playerNum; i++)
			{
				Utils.removeChildIfExistAt(this["player_" + i]["iconMc"]["holder"], 0);
				if (i < this.newPlayerArr.length)
				{
					setSelectedCharCard(this["player_" + i], this.newPlayerArr[i]);
				}
				else
				{
					this["player_" + i]["btnRemove"].visible = false;
					this["player_" + i]["btnInfo"].visible = false;
				}
			}
			for (i = 0; i < opponentNum; i++)
			{
				Utils.removeChildIfExistAt(this["enemy_" + i]["iconMc"]["holder"], 0);
				if (i < newEnemyArr.length)
				{
					setSelectedCharCard(this["enemy_" + i], this.newEnemyArr[i]);
				}
				else
				{
					this["enemy_" + i]["btnRemove"].visible = false;
					this["enemy_" + i]["btnInfo"].visible = false;
				}
			}
		}

		public function onClearSelectedChar(e:MouseEvent):void
		{
			this.refreshSelectedChar();
			this.newPlayerArr = new Vector.<Pet>();
			this.newEnemyArr = new Vector.<Pet>();
			this.showSelectedChar();
			this.selectTurn = "p";
		}

		private function refreshSelectedChar()
		{
			for (var i = 0; i < playerNum; i++)
			{
				this.setSelectedCharCard(this["player_" + i], null, false);
			}
			for (i = 0; i < opponentNum; i++)
			{
				this.setSelectedCharCard(this["enemy_" + i], null, false);
			}
		}

		public function onSelectRandomChar(e:MouseEvent):void
		{
			var newPetObj:Pet;
			for (var i = newPlayerArr.length; i < this.playerNum; i++)
			{
				this.selectTurn = "p";
				newPetObj = getRandomChar();
				this.newPlayerArr.push(newPetObj);
			}
			for (i = newEnemyArr.length; i < this.opponentNum; i++)
			{
				this.selectTurn = "e";
				newPetObj = getRandomChar();
				this.newEnemyArr.push(newPetObj);
			}
			this.showSelectedChar();
		}

		private function getRandomChar():Pet
		{
			var randomId = Math.floor(Math.random() * petList.length);
			var petObj = createPetObject(petList[randomId]);
			var newPetObj = new Pet(petObj["stats"], petObj["mc"], petObj["icon"], petObj["body"]);
			return newPetObj;
		}

		public function removeSelectedChar(e:MouseEvent):void
		{
			var targetName = e.target.parent.name.split("_");
			if (targetName[0] == "player")
			{
				this.setSelectedCharCard(e.target.parent, null, false);
				this.newPlayerArr.removeAt(int(targetName[1]));
			}
			else
			{
				this.setSelectedCharCard(e.target.parent, null, false);
				this.newEnemyArr.removeAt(int(targetName[1]));
			}
			if (this.selectTurn == "e" && this.newPlayerArr.length < this.playerNum)
			{
				this.selectTurn = "p";
				showPopupMessage("Player Turn", true);
			}
			this.refreshSelectedChar();
			this.showSelectedChar();
		}

		public function infoSelectedChar(e:MouseEvent):void
		{
			var targetName = e.target.parent.name.split("_");
			if (targetName[0] == "player")
			{
				this.showPetInfoDialog(newPlayerArr[int(targetName[1])]);
			}
			else
			{
				this.showPetInfoDialog(newEnemyArr[int(targetName[1])]);
			}
		}

		public function hidePetList()
		{
			var start = (currentPage - 1) * Constant.MAX_CHAR_IN_GAME;
			var end = Math.min(this.charListNum, this.currentPage * Constant.MAX_CHAR_IN_GAME);
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

		public function showPetInfoDialog(charObj:Pet):void
		{
			var dialog = new DialogPetInfo();
			var attributeType = charObj.getPetAttributeType();
			// dialog["nameTxt"].text = charObj.getName();
			// dialog["lvTxt"].text = charObj.getLevel();
			// dialog["hpTxt"].text = charObj.getHP() + "/" + charObj.getMaxHP();
			// dialog["cpTxt"].text = charObj.getCP() + "/" + charObj.getMaxCP();
			dialog["typeTxt"].text = PetLibrary.getTypeTxt(charObj.getPetType());
			// if (attributeType != "null")
			// {
			// dialog["attributeTxt"].text = attributeType.replace(attributeType.substring(0, 1), attributeType.substring(0, 1).toUpperCase());
			// }
			dialog["petType"].gotoAndStop(charObj.getPetType());
			dialog["attributeType"].gotoAndStop(attributeType);
			// Other Stats
			dialog["lbl_damage"].text = "Damage: ";
			dialog["damageTxt"].text = charObj.getDamage();
			dialog["lbl_agility"].text = "Agility: ";
			dialog["agilityTxt"].text = charObj.getAgility();
			dialog["lbl_dodge"].text = "Dodge: ";
			dialog["dodgeTxt"].text = charObj.getDodge() + "%";
			dialog["lbl_critical"].text = "Critical: ";
			dialog["criticalTxt"].text = charObj.getCritical() + "%";
			dialog["lbl_purify"].text = "Purify: ";
			dialog["purifyTxt"].text = charObj.getPurify() + "%";
			// Profile
			dialog["profile"]["nameTxt"].text = charObj.getName();
			var iconCls = duplicateAssetMc(charObj.getPetSwfName(), "icon", 0.4, 0.4);
			if (iconCls != null)
			{
				dialog["profile"]["petIcon"].addChild(iconCls);
				dialog["profile"]["icon"].visible = false;
			}
			dialog["profile"]["lvTxt"].text = charObj.getLevel();
			dialog["profile"]["hpTxt"].text = charObj.getHP() + "/" + charObj.getMaxHP();
			dialog["profile"]["cpTxt"].text = charObj.getCP() + "/" + charObj.getMaxCP();
			// Body
			var bodyCls = duplicateAssetMc(charObj.getPetSwfName(), "StaticFullBody");
			if (bodyCls != null)
			{
				dialog["charMc"].addChild(bodyCls);
			}

			// Skill
			for (var i = 0; i < 6; i++) // in charObj.getPet().skillData)
			{
				if (i > charObj.getPet().skillData.length - 1)
				{
					// dialog["skill_" + i].visible = false;
					Utils.removeChildIfExistAt(dialog["skill_" + i]["holder"], 1);
					dialog["skill_" + i].gotoAndStop(2);
					dialog["skill_" + i].visible = true;
					dialog["skill_" + i]["cdTxt"].text = "";
					dialog["skill_" + i]["cdFilter"].visible = false;
					Utils.removeMouseEventRollOver(dialog["skill_" + i]["maskMC"], function(e:MouseEvent):void
						{
							var id = e.target.parent.name.split("_")[1];
							infoPetSkill(id, dialog, charObj);
						});
					Utils.removeMouseEventRollOut(dialog["skill_" + i]["maskMC"], function(e:MouseEvent):void
						{
							dialog["txt"].visible = false;
						});
					continue;
				}
				var skillName:String = "Skill_" + i;
				var cls = duplicateAssetMc(charObj.getPetSwfName(), skillName);
				if (cls != null)
				{
					var temp = cls;
					temp.name = skillName;
					Utils.removeChildIfExistAt(dialog["skill_" + i]["holder"], 1);
					dialog["skill_" + i]["holder"].addChild(temp);
					Utils.addMouseEventRollOver(dialog["skill_" + i]["maskMC"], function(e:MouseEvent):void
						{
							var id = e.target.parent.name.split("_")[1];
							infoPetSkill(id, dialog, charObj);
						});
					Utils.addMouseEventRollOutIfNotExist(dialog["skill_" + i]["maskMC"], function(e:MouseEvent):void
						{
							dialog["txt"].visible = false;
						});
					dialog["skill_" + i].gotoAndStop(1);
					dialog["skill_" + i].visible = true;
					dialog["skill_" + i]["cdTxt"].text = "";
					dialog["skill_" + i]["cdFilter"].visible = false;
				}
			}
			Utils.addMouseEventClickIfNotExist(dialog["btnCancel"], function(e:MouseEvent)
				{
					if (stage.contains(dialog))
					{
						stage.removeChild(dialog);
					}
				});
			stage.addChild(dialog);
		}

		private function infoPetSkill(id, dialog, charObj):void
		{
			var baseDmg = charObj.getPet().getDamage();
			var targetName = charObj.getPet().skillData[id]["target"] == "" ? "Enemy" : charObj.getPet().skillData[id]["target"].replace(charObj.getPet().skillData[id]["target"].charAt(0), charObj.getPet().skillData[id]["target"].charAt(0).toUpperCase());
			var skillDamage = charObj.getPet().skillData[id]["hasDamage"] ? Math.round((baseDmg + (baseDmg * charObj.getPet().skillData[id]["damageBonus"]))) : 0;
			Utils.moveToFrontTF(dialog["txt"]);
			dialog["txt"].visible = true;
			dialog["txt"].htmlText = "<font size=\"20\" color=\"#FFFFFF\">" + charObj.getPet().skillData[id]["description"] + "</font>";
			dialog["txt"].htmlText += "<font size=\"20\" color=\"#00FF00\">" + ("Target: " + targetName) + "</font>";
			dialog["txt"].htmlText += "<font size=\"20\" color=\"#FFDE00\">" + ("Level: " + charObj.getPet().skillData[id]["level"]) + "</font>";
			dialog["txt"].htmlText += "<font size=\"20\" color=\"#FF0000\">" + ("Damage: " + skillDamage) + "</font>";
			dialog["txt"].htmlText += "<font size=\"20\" color=\"#00BFFF\">" + ("Chakra: " + charObj.getPet().skillData[id]["skill_cp"]) + "</font>";
			dialog["txt"].htmlText += "<font size=\"20\">" + ("Cooldown: " + charObj.getPet().skillData[id]["cooldown"]) + "</font>";
			dialog["txt"].y = 730;
			if ((dialog["txt"].y + dialog["txt"].textHeight) > 780)
			{
				dialog["txt"].y -= dialog["txt"].y + dialog["txt"].textHeight + 5 - 780;
			}
			dialog["txt"].x = mouseX - 200;
			if (dialog["txt"].x < 450)
			{
				dialog["txt"].x += 150;
			}
			if (dialog["txt"].x > 990)
			{
				dialog["txt"].x -= 175;
			}
			dialog["txt"].height = dialog["txt"].textHeight + 5;
			dialog["txt"].background = true;
			dialog["txt"].backgroundColor = 0x000000;
			dialog["txt"].alpha = 0.8;
		}

		// FRAME 3
		public function backtoMenu(e:MouseEvent):void
		{
			this["popup"].visible = false;
			this["battleStats"].visible = false;
			this["statsCharMc"].visible = false;
			petMcVisible(false);
			gotoAndStop("menu");
		}

		public function onInfo()
		{
			if (messageTxt == "")
			{
				this["popupInfo"].msgTxt.text = skillNameTxt;
			}
			else
			{
				this["popupInfo"].msgTxt.text = messageTxt;
				messageTxt = "";
			}
		}

		public function showPopupMessage(strTxt:String, message:Boolean = false):void
		{
			if (message)
			{
				messageTxt = strTxt;
			}
			else
			{
				skillNameTxt = strTxt;
			}
			this["popupInfo"].gotoAndPlay("show");
		}

		public function hidePopupMessage():void
		{
			skillNameTxt = "";
			this["popupInfo"].gotoAndPlay("idle");
		}

		public function showOverheadText(param1:String, param2:String, obj):void
		{
			var _loc3_:MovieClip = obj.getPet().parent.parent;
			_loc3_["ohNumber"].showNumber(param1, param2);
			// if (param1 == "NORMAL")
			// {
			// if (obj.getPet().scaleX > 0)
			// {

			// _loc3_["ohNumber"].x = _loc3_.x + 20;
			// }
			// else
			// {
			// _loc3_["ohNumber"].x = _loc3_.x - 500;
			// }
			// trace(_loc3_.x);
			// }
			/*var _loc4_:Object = this.getHitArea();
			if (this.swf.scaleX > 0)
			{
				_loc3_["ohNumber"].x = this.charMc.x - _loc4_.width * Data.BATTLE_CHAR_SCALE / 2;
			}
			else
			{
				_loc3_["ohNumber"].x = this.charMc.x + _loc4_.width * Data.BATTLE_CHAR_SCALE / 2;
			}
			_loc3_["ohNumber"].y = this.charMc.y - _loc4_.height * Data.BATTLE_CHAR_SCALE;*/
		}

		public function addSpecialEffect(mc:MovieClip):void
		{
			Utils.removeParent(mc);
			mc.scaleX = 2;
			mc.scaleY = 2;
			if (this["battleEffectMc"].numChildren > 0)
			{
				this["battleEffectMc"].removeChildAt(0);
			}
			this["battleEffectMc"].addChild(mc);
			mc.gotoAndPlay(2);
			Utils.moveToFront(this["battleEffectMc"]);
		}

		public function addSkillDisplay(petObj:Object)
		{
			hideTarget(false);
			// for (var i in petObj.getPet().skillData)
			for (var i = 0; i < 6; i++)
			{
				if (i > petObj.getPet().skillData.length - 1)
				{
					Utils.removeChildIfExistAt(this["skillMC_" + i]["holder"], 1);
					this["skillMC_" + i].gotoAndStop(2);
					this["skillMC_" + i].visible = true;
					this["skillMC_" + i]["cdTxt"].text = "";
					this["skillMC_" + i]["cdFilter"].visible = false;
					Utils.removeMouseClickIfExist(this["skillMC_" + i]["maskMC"], this.selectSkill);
					Utils.removeMouseEventRollOver(this["skillMC_" + i]["maskMC"], this.infoSkill);
					Utils.removeMouseEventRollOut(this["skillMC_" + i]["maskMC"], function(e:MouseEvent):void
						{
							txt.visible = false;
						});
					continue;
				}
				var skillName:String = "Skill_" + i;
				var cls = duplicateAssetMc(petObj.getPetSwfName(), skillName);
				if (cls != null)
				{
					var temp = cls;
					temp.name = skillName;
					Utils.removeChildIfExistAt(this["skillMC_" + i]["holder"], 1);
					this["skillMC_" + i]["holder"].addChild(temp);
					Utils.addMouseEventClickIfNotExist(this["skillMC_" + i]["maskMC"], this.selectSkill);
					Utils.addMouseEventRollOver(this["skillMC_" + i]["maskMC"], this.infoSkill);
					Utils.addMouseEventRollOutIfNotExist(this["skillMC_" + i]["maskMC"], function(e:MouseEvent):void
						{
							txt.visible = false;
						});
					this["skillMC_" + i].gotoAndStop(1);
					this["skillMC_" + i].visible = true;
					this["skillMC_" + i]["cdTxt"].text = "";
					this["skillMC_" + i]["cdFilter"].visible = false;
					// TODO Chakra
					var cpCost = BattleUtils.getCPCost(petObj.getPet().skillData[i]["skill_cp"], petObj);
					if (petObj.getCP() < cpCost)
					{
						trace("not enough chakra" + skillName);
						this["skillMC_" + i]["cdFilter"].visible = true;
						Utils.removeMouseClickIfExist(this["skillMC_" + i]["maskMC"], this.selectSkill);

					}
					if (petObj.getPet().getSkillCooldown()[i] > 0)
					{
						trace("The skill still cooldown" + skillName);
						this["skillMC_" + i]["cdFilter"].visible = true;
						this["skillMC_" + i]["cdTxt"].text = petObj.getPet().getSkillCooldown()[i];
						Utils.removeMouseClickIfExist(this["skillMC_" + i]["maskMC"], this.selectSkill);
					}
				}
			}
			this["btnPass"].visible = true;
			Utils.addMouseEventRollOverIfNotExist(this["btnPass"], this.infoAction);
			Utils.addMouseEventRollOutIfNotExist(this["btnPass"], function(e:MouseEvent):void
				{
					txt.visible = false;
				});
			this["btnSpecial"].visible = false;
			this["btnRun"].visible = true;
			this.showSpecialButton(petObj.getPetType());
			this.showAttributeButton(petObj.getPetAttributeType());
		}

		private function showSpecialButton(type:int):void
		{
			this["btnOffensiveSpecial"].visible = false;
			this["btnDefensiveSpecial"].visible = false;
			this["btnSupportiveSpecial"].visible = false;
			if (this.specialSkillSystem && (nowTurn == getMaster(attacker) || nowTurn == getMaster(defender)) && !nowTurn.hasUseSpecial)
			{
				switch (type)
				{
					case 1:
						this["btnOffensiveSpecial"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnOffensiveSpecial"], this.onSpecialClicked);
						break;
					case 2:
						this["btnDefensiveSpecial"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnDefensiveSpecial"], this.onSpecialClicked);
						break;
					case 3:
						this["btnSupportiveSpecial"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnSupportiveSpecial"], this.onSpecialClicked);
						break;
					default:
						break;
				}
			}
		}
		private function showAttributeButton(type:String)
		{
			this["btnWind"].visible = false;
			this["btnFire"].visible = false;
			this["btnLightning"].visible = false;
			this["btnEarth"].visible = false;
			this["btnWater"].visible = false;
			this["btnElement"].visible = false;
			if (this.attributeSkillSystem && (nowTurn.getCP() == nowTurn.getMaxCP()))
			{
				switch (type)
				{
					case "wind":
						this["btnWind"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnWind"], this.onAttributeSpecialClicked);
						break;
					case "fire":
						this["btnFire"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnFire"], this.onAttributeSpecialClicked);
						break;
					case "lightning":
						this["btnLightning"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnLightning"], this.onAttributeSpecialClicked);
						break;
					case "earth":
						this["btnEarth"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnEarth"], this.onAttributeSpecialClicked);
						break;
					case "water":
						this["btnWater"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnWater"], this.onAttributeSpecialClicked);
						break;
					case "null":
						this["btnElement"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnElement"], this.onAttributeSpecialClicked);
						break;
					default:
						this["btnElement"].visible = true;
						Utils.addMouseEventClickIfNotExist(this["btnElement"], this.onAttributeSpecialClicked);
						break;
				}
			}
		}

		public function infoSkill(e:MouseEvent):void
		{

			var id = e.target.parent.name.split("_")[1];
			var baseDmg = attacker.getPet().getDamage();
			var targetName = attacker.getPet().skillData[id]["target"] == "" ? "Enemy" : attacker.getPet().skillData[id]["target"].replace(attacker.getPet().skillData[id]["target"].charAt(0), attacker.getPet().skillData[id]["target"].charAt(0).toUpperCase());
			var skillDamage = attacker.getPet().skillData[id]["hasDamage"] ? Math.round((baseDmg + (baseDmg * attacker.getPet().skillData[id]["damageBonus"]))) : 0;
			Utils.moveToFrontTF(this["txt"]);
			this["txt"].visible = true;
			this["txt"].htmlText = "<font size=\"20\" color=\"#FFFFFF\">" + attacker.getPet().skillData[id]["description"] + "</font>";
			this["txt"].htmlText += "<font size=\"20\" color=\"#00FF00\">" + ("Target: " + targetName) + "</font>";
			this["txt"].htmlText += "<font size=\"20\" color=\"#FFDE00\">" + ("Level: " + attacker.getPet().skillData[id]["level"]) + "</font>";
			this["txt"].htmlText += "<font size=\"20\" color=\"#FF0000\">" + ("Damage: " + skillDamage) + "</font>";
			this["txt"].htmlText += "<font size=\"20\" color=\"#00BFFF\">" + ("Chakra: " + attacker.getPet().skillData[id]["skill_cp"]) + "</font>";
			this["txt"].htmlText += "<font size=\"20\">" + ("Cooldown: " + attacker.getPet().skillData[id]["cooldown"]) + "</font>";
			this["txt"].y = 900;
			if ((this["txt"].y + this["txt"].textHeight) > 950)
			{
				this["txt"].y -= this["txt"].y + this["txt"].textHeight + 5 - 950;
			}
			this["txt"].x = mouseX - 200;
			this["txt"].height = this["txt"].textHeight + 5;
			this["txt"].background = true;
			this["txt"].backgroundColor = 0x000000;
			this["txt"].alpha = 0.8;
		}

		public function infoAction(e:MouseEvent):void
		{
			if (e.target == this["btnPass"])
			{
				this["txt"].visible = true;
				this["txt"].htmlText = "<font size=\"20\" color=\"#FFFFFF\"><b>Pass</b><br>Skip turn</font>";
				// this["txt"].htmlText = "<font size=\"20\" color=\"#FFFFFF\"><b>Pass</b><br>Skip turn and Recover CP 25%</font>";
				// trace("pass");
			}
			/*else if(e.target == btnSpecial){
				var master = getMaster(attacker);
				this["txt"].visible = true;
				this["txt"].htmlText = "<font size=\"20\" color=\"#FFFFFF\"><b>"+PetLibrary.getTypeTxt(master.getPetType())+"Special</b><br>Only once per battle</font>";
				this["txt"].htmlText += "<font size=\"20\" color=\"#00FF00\">" + ("Target: " + "All") + "</font>";
				this["txt"].htmlText += "<font size=\"20\" color=\"#00BFFF\">" + ("Chakra: " + master.getMaxCP()) + "</font>";
			}*/
			this["txt"].y = 900;
			if ((this["txt"].y + this["txt"].textHeight) > 950)
			{
				this["txt"].y -= this["txt"].y + this["txt"].textHeight + 5 - 950;
			}
			this["txt"].x = mouseX - 200;
			this["txt"].height = this["txt"].textHeight + 5;
			this["txt"].background = true;
			this["txt"].backgroundColor = 0x000000;
			this["txt"].alpha = 0.8;
		}

		public function skillDisplay(show:Boolean, charObj:* = null)
		{
			var skillLength = -1;
			if (charObj != null)
			{
				skillLength = charObj.getPet().skillData.length - 1;
			}
			for (var i = 0; i < 6; i++)
			{
				this["skillMC_" + i].visible = show;
				if (i > skillLength)
				{
					this["skillMC_" + i].visible = false;
				}
			}
			this["btnPass"].visible = show;
			this["btnOffensiveSpecial"].visible = show;
			this["btnDefensiveSpecial"].visible = show;
			this["btnSupportiveSpecial"].visible = show;
			this["btnSpecial"].visible = show;
			this["btnRun"].visible = show;
			this["btnWind"].visible = show;
			this["btnFire"].visible = show;
			this["btnLightning"].visible = show;
			this["btnEarth"].visible = show;
			this["btnWater"].visible = show;
			this["btnElement"].visible = show;
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

		public function onPassClicked(e:MouseEvent):void
		{
			defender = attacker;
			passAction(attacker.getPet(), attacker, defender, "pass");
		}

		public function onSpecialClicked(e:MouseEvent):void
		{
			var master:Pet = getMaster(attacker);
			if (master.getCP() == master.getMaxCP())
			{
				specialSkillAction(master);
			}
			else
			{
				showPopupMessage("Not Enough Chakra");
			}
		}

		public function onRunClicked(e:MouseEvent):void
		{
			showConfirmationDialog("Are you sure want to run?", function():void
				{
					trace("onRun");
					disposeBattle();
					gotoAndStop("menu");
				});
		}

		public function onAttributeSpecialClicked(e:MouseEvent):void
		{
			if (attacker.getCP() == attacker.getMaxCP())
			{
				atrributeSkillAction();
			}
			else
			{
				showPopupMessage("Not Enough Chakra");
			}
		}

		private function atrributeSkillAction():void
		{
			var skillEffect = PetLibrary.getAttributeSkill(attacker.getPetAttributeType());
			var isBuff = skillEffect["target"] == "self" ? true : false;
			defender = attacker;
			// TODO Attribute Skilll Logic
			addEffect(skillEffect, defender, defender, isBuff);
			var attributeName = attacker.getPetAttributeType();
			attributeName = attributeName.replace(attributeName.substring(0, 1), attributeName.substring(0, 1).toUpperCase());
			if (attributeName == "Null")
			{
				attributeName = "Elemental";
			}
			BattleUtils.updateCP(attacker, -attacker.getMaxCP());
			attacker.getPet().gotoAction("pass");
			showPopupMessage(attributeName + " Attribute Skill");
			skillDisplay(false);
			BattleUtils.updateSkillCooldown(attacker.getPet(), -1);
			hideTarget(true);
			// battleStatus("0", "pass");
		}

		private function specialSkillAction(master):void
		{
			var teamArr = newPlayerArr.indexOf(attacker) >= 0 ? newPlayerArr : newEnemyArr;
			var opponentArr = newPlayerArr.indexOf(attacker) >= 0 ? newEnemyArr : newPlayerArr;
			var skillEffect = PetLibrary.getSpecialSkill(master.getPetType());
			var targetArr = skillEffect["target"] == "all" ? opponentArr : teamArr;
			var isBuff = skillEffect["target"] == "all" ? false : true;
			for (var i in targetArr)
			{
				defender = targetArr[i];
				addEffect(skillEffect, master, defender, isBuff);
			}
			master.hasUseSpecial = true;
			BattleUtils.updateCP(master, -master.getMaxCP());
			attacker.getPet().gotoAction("pass");
			showPopupMessage(PetLibrary.getTypeTxt(master.getPetType()) + " Special Skill");
			skillDisplay(false);
			BattleUtils.updateSkillCooldown(attacker.getPet(), -1);
			hideTarget(true);
			// battleStatus("0", "pass");
		}

		// ACTION////////////////////////////////////////////////////////////////////////////////////////////////////
		private function baseSelectSkill(mc, id, skillTarget):void
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

		private function handleDamageSkill(mc:Object, id:int, skillTarget:String):void
		{
			if (mc.allActions[id]["target"] == "all")
			{
				handleDamageSkillArea(mc, id, skillTarget);
			}
			else
			{
				handleDamageSkillSingle(mc, id, skillTarget);
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
				handleNonDamageSkillTeam(mc, id, skillTarget);
			}
			else
			{
				handleNonDamageSkillEnemy(mc, id, skillTarget);
			}
		}

		private function handleDamageSkillArea(mc:Object, id:int, skillTarget:String):void
		{
			var dmg;
			skillTarget = "all";
			var tempArr = nowTurnStr == "p" ? newEnemyArr : newPlayerArr;
			for (var i in tempArr)
			{
				defender = tempArr[i];
				if (defender.getIsDead())
				{
					continue;
				}
				if (BattleUtils.checkHit(attacker, defender) || checkHundredPercentAttack(mc.allActions[id]))
				{
					dmg = BattleUtils.calcDamage(BattleUtils.getFinalDamage(attacker.getPet().getDamage(), attacker, defender), mc.allActions[id]["damageBonus"]);
					addEffect(mc.allActions[id], attacker, defender, false);
					if (!BattleUtils.checkDamageRebound(dmg, attacker, defender))
					{
						overheadNumber(true, dmg, skillTarget, defender, attacker.isCritical);
						StatsUtils.handleDamageStats(attacker, defender, dmg);
						var activeBuff = BattleUtils.handleActiveBuffAfterAttack(dmg, attacker, defender);
						if (activeBuff > 0)
						{
							overheadNumber(true, activeBuff, "self", attacker);
						}
					}
					else
					{
						overheadEffect(true, null, "debuff", attacker, false, "HP -" + dmg);
						StatsUtils.handleDamageTakenStats(attacker, dmg);
					}
				}
				else
				{
					onDodgeAttack(defender, false);
				}
			}
			setAnimationPoint(mc, id, attacker, tempArr[0]);
		}

		private function handleDamageSkillSingle(mc:Object, id:int, skillTarget:String):void
		{
			var dmg;
			// var skillEffect:Object;
			// Logic for skill targeting a single enemy
			if (BattleUtils.checkHit(attacker, defender) || checkHundredPercentAttack(mc.allActions[id]))
			{
				dmg = BattleUtils.calcDamage(BattleUtils.getFinalDamage(attacker.getPet().getDamage(), attacker, defender), mc.allActions[id]["damageBonus"]);
				if (mc.allActions[id]["effect"].length > 0)
				{
					if (mc.allActions[id]["effect"][0]["type"] == "bunny_frenzy")
					{
						addEffect(mc.allActions[id], attacker, attacker, true);
					}
					else
					{
						addEffect(mc.allActions[id], attacker, defender, false);
					}
				}
				if (!BattleUtils.checkDamageRebound(dmg, attacker, defender))
				{
					overheadNumber(true, dmg, skillTarget, defender, attacker.isCritical);
					StatsUtils.handleDamageStats(attacker, defender, dmg);
					var activeBuff = BattleUtils.handleActiveBuffAfterAttack(dmg, attacker, defender);
					if (activeBuff > 0)
					{
						overheadNumber(true, activeBuff, "self", attacker);
					}
				}
				else
				{
					overheadEffect(true, null, "debuff", attacker, false, "HP -" + dmg);
					StatsUtils.handleDamageTakenStats(attacker, dmg);
				}
				defender.setHit("hit");
			}
			else
			{
				if (mc.allActions[id]["effect"].length > 0)
				{
					var bunnyFrenzy = BattleUtils.hasSkillEffect(mc.allActions[id], "bunny_frenzy");
					if (bunnyFrenzy != -1)
					{
						addEffect(mc.allActions[id], attacker, attacker, true);
					}
				}
				onDodgeAttack(defender, true);
			}
			setAnimationPoint(mc, id, attacker, defender);
		}

		private function handleNonDamageSkillMaster(mc:Object, id:int, skillTarget:String):void
		{
			// Logic for skills without damage
			skillTarget = "master";
			defender = getMaster(attacker);
			addEffect(mc.allActions[id], attacker, defender, true);
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
			if (BattleUtils.checkHit(attacker, defender) || checkHundredPercentAttack(mc.allActions[id]))
			{
				StatsUtils.handleHitStats(attacker);
				addEffect(mc.allActions[id], attacker, defender, false);
				defender.setHit("hit");
			}
			else
			{
				onDodgeAttack(defender, true);
			}
			setAnimationPoint(mc, id, attacker, defender);
		}

		private function handleNonDamageSkillTeam(mc:Object, id:int, skillTarget:String):void
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

		private function checkHundredPercentAttack(skillEffect:Object):Boolean
		{
			return BattleUtils.hasSkillEffect(skillEffect, "hundred_percent_attack") >= 0;
		}

		private function handleAddEffectAction(mc, id, skillEffect, attacker, defender, isBuff):void
		{
		}

		private function setAnimationPoint(mc, id, attackerObj, defenderObj):void
		{
			var point = getPoint(mc.allActions[id], attackerObj, defenderObj);
			mc.x = point.x;
			mc.y = point.y;
			mc.gotoAction(mc.allActions[id]["animation"]);
		}

		private function onDodgeAttack(obj, animation):void
		{
			StatsUtils.handleDodgeStats(obj);
			overheadEffect(true, BattleUtils.DODGE_ACTION_OBJ, BattleUtils.DEBUFF_TYPE, obj);
			if (animation)
			{
				obj.setHit("dodge");
			}
		}

		public function AISelectSkill():void
		{
			var rand:int = 0;
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
			var mc:* = attacker.getPet();
			Utils.moveToFront(mc.parent.parent);
			BattleUtils.setupAvailableSkills(mc, attacker);
			var skillTarget:String = "enemy";
			// TODO Special/Attribute Logic
			if (mc.allActions.length == 0)
			{
				defender = attacker;
				skillTarget = "pass";
				passAction(mc, attacker, defender, skillTarget);
				return;
			}

			var id:int = Math.floor(Math.random() * mc.allActions.length);
			handleAfterSelectSkill(id, attacker, skillTarget);
		}

		public function selectSkill(e:MouseEvent):void
		{
			if (nowTurnStr == "p")
			{
				defender = newEnemyArr[selectedTargetPlayer];
			}
			else
			{
				defender = newPlayerArr[selectedTargetEnemy];
			}
			var mc:* = attacker.getPet();
			Utils.moveToFront(mc.parent.parent);
			mc.allActions = mc.skillData;
			var skillTarget:String = "enemy";

			var id:int = int(e.target.parent.name.split("_")[1]);
			handleAfterSelectSkill(id, attacker, skillTarget);

			skillDisplay(false);
			hideTarget(true);
		}

		private function passAction(mc, attacker, defender, skillTarget):void
		{
			StatsUtils.handlePassStats(attacker);
			BattleUtils.charge(attacker);
			mc.gotoAction(skillTarget);
			showPopupMessage("Pass");
			skillDisplay(false);
			BattleUtils.updateSkillCooldown(attacker.getPet(), -1);
			hideTarget(true);
			// battleStatus("0", skillTarget);
		}

		private function handleAfterSelectSkill(id, attacker, skillTarget):void
		{
			var mc = attacker.getPet();

			baseSelectSkill(mc, id, skillTarget);

			BattleUtils.handleCPCost(mc.allActions[id]["skill_cp"], attacker);
			showPopupMessage(mc.allActions[id]["name"]);
			BattleUtils.updateSkillCooldown(mc, mc.skillData.indexOf(mc.allActions[id]));
			attacker.isCritical = false;
			// Add Map Effect
			if (useMapEffect)
			{
				MapEffectUtils.addRandomEffect(this.mapId, attacker, overheadEffect);
			}
		}
		// ////////////////////////////////////////////////////////////////////////////////////////////////////
		public function effectToStr(effect, mapEffect:Boolean = false, resist:Boolean = false)
		{
			return EffectData.displaySpecialText(effect, mapEffect, resist);
		}
		// ////////////////////////////////////////////////////////////////////////////////////////////////////
		public function petMcVisible(show:Boolean):void
		{
			for (var i = 0; i < 3; i++)
			{
				this["playerPetMc_" + i].visible = show;
				this["enemyPetMc_" + i].visible = show;
				turnVisible(show);
			}
		}

		public function turnVisible(show:Boolean):void
		{
			for (var i = 0; i < 3; i++)
			{
				Utils.addGlowFilter(this["playerPetMc_" + i]["activeMc"], show);
				Utils.addGlowFilter(this["enemyPetMc_" + i]["activeMc"], show);
			}
		}

		public function onAttackHit():void
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
			this["statusTxt"].htmlText = "<font color=\"#00FF00\">Battle Start</font>";
			this["statusTxt"].scrollV = this["statusTxt"].maxScrollV;
			characterArr = new Vector.<Pet>();
			petMcVisible(false);
			hideTarget(false);
			initCharacterDisplayUI(newPlayerArr, "playerPetMc");
			initCharacterDisplayUI(newEnemyArr, "enemyPetMc");
			updateBar();

			var maxNum:int = Math.max(playerNum, opponentNum);
			for (var i = 0; i < maxNum; i++)
			{
				if (i < playerNum)
				{
					characterArr.push(newPlayerArr[i]);
				}
				if (i < opponentNum)
				{
					characterArr.push(newEnemyArr[i]);
				}
			}

			skillDisplay(false);
			initialized = true;
		}

		private function initActionBar(char):void
		{
			var petBody;
			if (this.atbMode)
			{
				this["actionBar"]["actionMc"].visible = true;
				petBody = char.getBody();
				petBody.name = char.getPet().parent.parent.name;
				// trace(petBody.name);
				petBody.scaleX = -0.4;
				petBody.scaleY = 0.4;
				this["actionBar"].addChild(petBody);
			}
			else
			{
				// this["actionBar"].visible = false;
				this["actionBar"]["actionMc"].visible = false;
				petBody = char.getBody();
				petBody.name = char.getPet().parent.parent.name;
				// trace(petBody.name);
				petBody.scaleX = -0.4;
				petBody.scaleY = 0.4;
				this["actionBar"].addChild(petBody);
			}
		}

		private function updateActionBar(char)
		{
			var mcName:String;
			if (this.atbMode)
			{
				mcName = char.getMcId();
				var value:int = char.getATB();
				if (value > Constant.ATB_MAX_VALUE)
				{
					value = Constant.ATB_MAX_VALUE;
				}
				this["actionBar"].getChildByName(mcName).x = (value / Constant.ATB_MAX_VALUE) * 595;
			}
			else
			{
				mcName = char.getMcId();
				this["actionBar"].getChildByName(mcName).x = characterArr.indexOf(char) * 100 + 50;
				this["actionBar"].getChildByName(mcName).y = -25;
				Utils.addGlowFilter(this["actionBar"].getChildByName(mcName), char == nowTurn, char.getIsDead());
			}
		}

		private function removeActionBar(char)
		{
			if (this.atbMode)
			{
				var mcName:String = char.getMcId();
				this["actionBar"].getChildByName(mcName).visible = false;
			}
		}

		private function initCharacterDisplayUI(characterArr:*, mcName:String)
		{
			for (var i = 0; i < characterArr.length; i++)
			{
				characterArr[i].setMcId(mcName + "_" + i);
				characterArr[i].getPet().setAttackHitCB(function():void
					{
						onAttackHit();
					});
				characterArr[i].getPet().setActionFinishCB(function():void
					{
						this.x = 0;
						this.y = 0;
						updateBar();
						if (this.currentLabel != "hit" && this.currentLabel != "dodge")
						{
							setTimeout(function():void
								{
									turn++;
									startBattle();
								}, 300);
						}
						this.gotoStandby();
					});
				this[mcName + "_" + i]["petType"].gotoAndStop(characterArr[i].getPetInfo()["type"]);
				Utils.addMouseEventRollOverIfNotExist(this[mcName + "_" + i]["petType"], this.showEffectList);
				Utils.addMouseEventRollOutIfNotExist(this[mcName + "_" + i]["petType"], this.hideEffectList);
				if (this[mcName + "_" + i]["charMc"].numChildren > 0)
				{
					this[mcName + "_" + i]["charMc"].removeChildAt(0);
				}
				this[mcName + "_" + i]["charMc"].addChild(characterArr[i].getPet());
				this[mcName + "_" + i]["nameTxt"].text = characterArr[i].getPetInfo()["name"];
				this[mcName + "_" + i]["target"].visible = false;
				this[mcName + "_" + i].visible = true;
				initActionBar(characterArr[i]);
			}
		}

		private function disposeCharacterDisplayUI(characterArr:*, mcName:String)
		{
			for (var i = 0; i < characterArr.length; i++)
			{
				characterArr[i].getPet().setAttackHitCB(null);
				characterArr[i].getPet().setActionFinishCB(null);
				Utils.removeMouseEventRollOver(this[mcName + "_" + i]["petType"], this.showEffectList);
				Utils.removeMouseEventRollOut(this[mcName + "_" + i]["petType"], this.hideEffectList);
				if (this[mcName + "_" + i]["charMc"].numChildren > 0)
				{
					this[mcName + "_" + i]["charMc"].removeChildAt(0);
				}
				this[mcName + "_" + i].visible = false;
			}
		}

		public function disposeBattle():void
		{
			petMcVisible(false);
			hideTarget(false);
			skillDisplay(false);
			disposeCharacterDisplayUI(newPlayerArr, "playerPetMc");
			disposeCharacterDisplayUI(newEnemyArr, "enemyPetMc");
			Utils.removeAllChild(this["actionBar"]);
		}

		// FRAME 3 - EFFECT BUFF DEBUFF - START
		public function addEffect(skillObj, attacker:Pet, target:Pet, isBuff)
		{
			trace("add effect - start");
			for (var i in skillObj["effect"])
			{
				if (skillObj["effect"][i]["type"] == "no effect")
				{
					continue;
				}
				var skillEffect:Object;
				if (skillObj["effect"][i].hasOwnProperty("EffectArray"))
				{
					skillEffect = getEffectArray(skillObj["effect"][i]);
				}
				else
				{
					skillEffect = BattleUtils.createSkillEffectObject(skillObj["effect"][i]);
				}

				if (useMapEffectResistance && MapEffectUtils.checkEffectResistance(this.mapId, skillEffect))
				{
					// Map Effect Resistance
					overheadEffect(true, skillEffect, isBuff ? BattleUtils.BUFF_TYPE : BattleUtils.DEBUFF_TYPE, target, false, null, true);
					continue;
				}
				// check chance if not true effect not added
				if (!BattleUtils.checkChanceEffect(skillEffect))
				{
					trace("the skill effect not added" + skillObj["name"]);
					// overheadEffect(true, skillEffect, isBuff ? BattleUtils.BUFF_TYPE : BattleUtils.DEBUFF_TYPE, target, false, null, true);
					continue;
				}
				// effectToStr(skillEffect);
				if (isBuff)
				{
					if (skillEffect["type"] == "heal_damage")
					{
						skillEffect["amount"] = skillEffect["amount"] + BattleUtils.calcDamage(Math.round(attacker.getPet().getDamage() * 10), skillEffect["heal"]);
					}
					overheadEffect(true, skillEffect, BattleUtils.BUFF_TYPE, target);
					BattleUtils.addBuffEffect(skillEffect, target, overheadNumber, overheadEffect);
				}
				else
				{
					if (BattleUtils.skipAddDebuffEffect(target))
					{
						overheadEffect(true, skillEffect, BattleUtils.DEBUFF_TYPE, target, false, null, true);
						continue;
					}
					overheadEffect(true, skillEffect, BattleUtils.DEBUFF_TYPE, target);
					BattleUtils.addDebuffEffect(skillEffect, target, attacker, getMaster(attacker), overheadNumber, overheadEffect);
				}
			}
			trace("add effect - finish");
		}

		private function getEffectArray(skillEffect:Object):Object
		{
			var randEffect = Math.floor(Math.random() * skillEffect["EffectArray"].length);
			return BattleUtils.createSkillEffectObject(skillEffect["EffectArray"][randEffect]);
		}

		public function checkPurify(charObj)
		{
			trace("checkPurify - start");
			if (useMapEffectResistance && MapEffectUtils.checkEffectResistance(this.mapId, BattleUtils.PURIFY_ACTION_OBJ))
			{
				trace("checkPurify - finish");
				return;
			}
			if (BattleUtils.checkPurify(charObj))
			{
				StatsUtils.handlePurifyStats(charObj);
				overheadEffect(true, BattleUtils.PURIFY_ACTION_OBJ, BattleUtils.BUFF_TYPE, charObj);
				var cooldown = charObj.getPet().getSkillCooldown();
				cooldown[0] = 0;
				charObj.getPet().setSkillCooldown(cooldown);
				charObj.setDebuffArr( {});
			}
			trace("checkPurify - finish");
		}

		private function updateEffectDuration(effect, effectArr):Object
		{
			effect["duration"]--;
			if (effect["duration"] > 0)
			{
				effectArr[effect["type"]] = effect;
			}
			return effectArr;
		}

		public function checkBuff(obj)
		{
			showAllOverheadEffect(obj);
			trace("checkBuff - start");
			var buffArr = {};
			for (var i in obj.getBuffArr())
			{
				buffArr = updateEffectDuration(obj.getBuffArr()[i], buffArr);
				BattleUtils.applyBuffEffects(obj.getBuffArr()[i], obj, overheadNumber, overheadEffect);
			}
			obj.setBuffArr(buffArr);
			trace("checkBuff - finish");
		}

		public function checkDebuff(obj)
		{
			checkPurify(obj);
			checkBuff(obj);
			trace("checkDebuff - start");
			var pass = false;
			var debuffArr = {};
			for (var i in obj.getDebuffArr())
			{
				debuffArr = updateEffectDuration(obj.getDebuffArr()[i], debuffArr);
				pass = pass || BattleUtils.shouldPass(obj.getDebuffArr()[i]);
				BattleUtils.applyDebuffEffects(obj.getDebuffArr()[i], obj, overheadNumber, overheadEffect);
			}
			obj.setDebuffArr(debuffArr);
			trace("checkDebuff - finish");
			// check Dead
			var isDead = checkAndSetCharDead(obj);
			// TODO TEST
			if (this.limitTurn > 0 && (obj.battleStats["totalTurn"] >= (this.limitTurn)))
			{
				overheadEffect(true, null, "debuff", obj, false, "Limit Turn Reached");
				if (isDead)
				{
					setTimeout(function()
						{
							turn++;
							startBattle();
						}, 300);
					return pass || isDead;
				}
				else
				{
					obj.getPet().gotoAction("pass");
					return obj.battleStats["totalTurn"] >= (this.limitTurn);
				}
			}
			if (pass || isDead)
			{
				BattleUtils.updateSkillCooldown(obj.getPet(), -1);
				if (isDead)
				{
					setTimeout(function()
						{
							turn++;
							startBattle();
						}, 300);
				}
				else
				{
					StatsUtils.handleTurnStats(nowTurn);
					StatsUtils.handleMissTurnStats(nowTurn);
					obj.getPet().gotoAction("pass");
				}
			}
			return pass || isDead;
		}
		// FRAME 3 - EFFECT BUFF DEBUFF - FINISH

		// FRAME 3 - TARGET FUNCTION - START
		public function hideTarget(actionFinish:Boolean)
		{
			hideTargetUI(opponentNum, newEnemyArr, newPlayerArr, "enemyPetMc", actionFinish, "p");
			hideTargetUI(playerNum, newPlayerArr, newEnemyArr, "playerPetMc", actionFinish, "e");
		}

		private function hideTargetUI(opponentTeamNum, defenderTeamArr, attackerTeamArr, opponentMCStr, actionFinish, turnStr):void
		{
			for (var i = 0; i < 3; i++)
			{
				var isDead = false;
				if (i < opponentTeamNum)
				{
					isDead = defenderTeamArr[i].getIsDead();
				}
				if (((controlParty && nowTurnStr == turnStr) || attackerTeamArr.indexOf(nowTurn) == 0) && !isDead && !actionFinish)
				{
					Utils.addMouseEventClick(this[opponentMCStr + "_" + i]["maskMC"], onSelectTarget);
				}
				else
				{
					Utils.removeMouseClickIfExist(this[opponentMCStr + "_" + i]["maskMC"], onSelectTarget);
				}
				this[opponentMCStr + "_" + i]["target"].visible = false;
			}
		}

		public function onSelectTarget(e:MouseEvent):void
		{
			hideTarget(false);
			var targetName = e.target.parent.name.split("_");
			if (nowTurnStr == "p")
			{
				selectedTargetPlayer = int(targetName[1]);
				e.target.parent["target"].visible = true;
				defender = newEnemyArr[selectedTargetPlayer];
			}
			else
			{
				selectedTargetEnemy = int(targetName[1]);
				e.target.parent["target"].visible = true;
				defender = newPlayerArr[selectedTargetEnemy];
			}
		}
		// FRAME 3 - TARGET FUNCTION - FINISH

		public function updateBar()
		{
			var totalDamagePlayer = 0;
			var totalDamageOpponent = 0;
			var totalTurnPlayer = 0;
			var missedTurnPlayer = 0;
			var totalTurnOpponent = 0;
			var missedTurnOpponent = 0;
			for (var i = 0; i < opponentNum; i++)
			{
				updateCharInfoUI(this["enemyPetMc_" + i], newEnemyArr[i]);
				totalDamageOpponent += newEnemyArr[i].battleStats["totalDamage"];
				totalTurnOpponent += newEnemyArr[i].battleStats["totalTurn"];
				missedTurnOpponent += newEnemyArr[i].battleStats["missedTurn"];
				// Utils.printObject(newEnemyArr[i].battleStats);
			}
			for (i = 0; i < playerNum; i++)
			{
				updateCharInfoUI(this["playerPetMc_" + i], newPlayerArr[i]);
				totalDamagePlayer += newPlayerArr[i].battleStats["totalDamage"];
				totalTurnPlayer += newPlayerArr[i].battleStats["totalTurn"];
				missedTurnPlayer += newPlayerArr[i].battleStats["missedTurn"];
				// Utils.printObject(newPlayerArr[i].battleStats);
			}
			this["totalDamage1Txt"].text = totalDamagePlayer.toString();
			this["totalDamage2Txt"].text = totalDamageOpponent.toString();
			this["totalTurn1Txt"].text = (totalTurnPlayer - missedTurnPlayer) + "/" + totalTurnPlayer;
			this["totalTurn2Txt"].text = (totalTurnOpponent - missedTurnOpponent) + "/" + totalTurnOpponent;
			// refreshEffectList();
		}

		private function updateCharInfoUI(mc:*, char:*):void
		{
			mc["hpTxt"].text = char.getHP() + "/" + char.getMaxHP();
			mc["hpBar"].scaleX = (char.getHP() / char.getMaxHP());
			mc["cpTxt"].text = char.getCP() + "/" + char.getMaxCP();
			mc["cpBar"].scaleX = (char.getCP() / char.getMaxCP()) * 0.8;
			mc["turnTxt"].text = (char.battleStats["totalTurn"] - char.battleStats["missedTurn"]).toString() + "/" + char.battleStats["totalTurn"].toString();
			updateActionBar(char);
		}

		public function checkHpCpZero(charStats:Pet):void
		{
			charStats.getHP();
			charStats.getCP();
		}

		// FRAME 3 - OVERHEAD - START
		public function overheadNumber(show:Boolean, dmg, target, obj, isCritical = false):void
		{
			if (target == "self" || target == "master")
			{
				showOverheadText("HEAL", dmg, obj);
			}
			else
			{
				if (isCritical)
				{
					showOverheadText("CRITICAL", dmg, obj);
				}
				else
				{
					showOverheadText("NORMAL", dmg, obj);
				}
			}
		}

		public function overheadEffect(show:Boolean, effect, typeEffect, obj, mapEffect:Boolean = false, txt:String = null, resist:Boolean = false):void
		{
			if (txt != null)
			{
				showOverheadText(typeEffect.toUpperCase(), txt, obj);
			}
			else
			{
				showOverheadText(typeEffect.toUpperCase(), effectToStr(effect, mapEffect, resist), obj);
			}
		}

		private function showOverheadEffectList(effectType, effectArr, charObj):void
		{
			for (var i in effectArr)
			{
				if (effectArr[i]["duration"] > 0)
				{
					showOverheadText(effectType, effectToStr(effectArr[i]), charObj);
				}
			}
		}

		public function showAllOverheadEffect(charObj):void
		{
			showOverheadEffectList("BUFF", charObj.getBuffArr(), charObj);
			showOverheadEffectList("DEBUFF", charObj.getDebuffArr(), charObj);
		}
		// FRAME 3 - OVERHEAD - FINISH

		// FRAME 3 - EFFECT LIST - START
		public function hideEffectList(e:MouseEvent):void
		{
			this["effectListMc"].visible = false;
		}

		public function showEffectList(e:MouseEvent):void
		{
			this["effectListMc"].visible = true;
			getEffectList(e.target.parent);
		}

		public function getEffectList(mc):void
		{
			var id = mc.name.split("_")[1];
			var charObj:Pet = mc.name.indexOf("player") >= 0 ? newPlayerArr[id] : newEnemyArr[id];
			this["effectListMc"].txt.htmlText = "Effect: ";
			setEffectListUI(charObj.getBuffArr(), true);
			setEffectListUI(charObj.getDebuffArr(), false);

			this["effectListMc"].y = mc.y + 15;
			if (mc.x < (1920 / 2))
			{
				this["effectListMc"].x = mc.x - 265;
			}
			else
			{
				this["effectListMc"].x = mc.x + 265;
			}
			Utils.moveToFront(this["effectListMc"]);
		}

		private function setEffectListUI(effectArr, isBuff):void
		{
			var effType, amount, duration;
			for (var i in effectArr)
			{
				effType = effectArr[i]["type"] != "no effect" ? (effectArr[i]["type"] + " ") : "";
				amount = effectArr[i]["amount"] != undefined ? (effectArr[i]["amount"] + "% ") : "";
				duration = effectArr[i]["duration"] != undefined ? ("(" + effectArr[i]["duration"] + ")") : "";
				if (effectArr[i]["duration"] > 0)
				{
					if (isBuff)
					{
						this["effectListMc"]["txt"].htmlText += "<font size =\"20\" color=\"#00FF00\">" + effectToStr(effectArr[i]) + "</font>";
					}
					else
					{
						this["effectListMc"]["txt"].htmlText += "<font size =\"20\" color=\"#FF0000\">" + effectToStr(effectArr[i]) + "</font>";
					}
				}
			}
		}

		public function refreshEffectList():void
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
		// FRAME 3 - EFFECT LIST - FINISH

		public function startBattle():void
		{
			initBattle();
			this["overlay"].visible = false;
			updateBar();
			checkDead();
			turnVisible(false);
			if (gameFinish)
			{
				updateBar();
				setTimeout(function():void
					{
						onGameFinish();
					}, 2500);
				return;
			}

			if (atbMode)
			{
				// ATB
				updateCharacterATB();
				handleATBTurn();
			}
			else
			{
				// Old (Player -> Enemy)
				getAliveCharTurn();
				// trace("getAliveCharTurn - startBattle");
				controlCharacter();
				// trace("controlCharacter - startBattle");
			}
		}

		private function onCharShowStats(e:MouseEvent):void
		{
			var mcName = e.target.parent.parent.parent.name.split("_");
			var char;
			if (mcName[0].indexOf("player") >= 0)
			{
				char = newPlayerArr[int(mcName[1])];
			}
			else
			{
				char = newEnemyArr[int(mcName[1])];
			}
			this["statsCharMc"].visible = true;
			Utils.moveToFront(this["statsCharMc"]);
			Utils.removeChildIfExistAt(this["statsCharMc"]["icon"]["holder"], 0);
			var iconCls = duplicateAssetMc(char.getPetSwfName(), "icon", 0.75, 0.75, 0, 36);

			this["statsCharMc"]["icon"]["holder"].addChild(iconCls);
			this["statsCharMc"]["mcIdTxt"].text = (mcName[0].indexOf("player") >= 0 ? "Player " : "Opponent ") + (int(mcName[1]) + 1);
			this["statsCharMc"]["nameTxt"].text = char.getName();
			this["statsCharMc"]["hpTxt"].text = "HP: " + char.getHP() + "/" + char.getMaxHP();
			this["statsCharMc"]["cpTxt"].text = "CP: " + char.getCP() + "/" + char.getMaxCP();
			this["statsCharMc"]["damageTxt"].text = "Damage Dealt: " + char.battleStats["totalDamage"];
			this["statsCharMc"]["damageTakenTxt"].text = "Damage Taken: " + char.battleStats["totalDamageTaken"];
			this["statsCharMc"]["hitTxt"].text = "Attack Hit: " + char.battleStats["totalHit"];
			this["statsCharMc"]["criticalTxt"].text = "Critical Hit: " + char.battleStats["totalCriticalHit"];
			this["statsCharMc"]["healTxt"].text = "Total Heal: " + char.battleStats["totalHeal"];
			this["statsCharMc"]["totalTurnTxt"].text = "Total Turn: " + char.battleStats["totalTurn"];
			this["statsCharMc"]["missTurnTxt"].text = "Miss Turn: " + char.battleStats["missedTurn"];
			this["statsCharMc"]["dodgeTxt"].text = "Total Dodge: " + char.battleStats["totalDodge"];
			this["statsCharMc"]["purifyTxt"].text = "Total Purify: " + char.battleStats["totalPurify"];
			this["statsCharMc"]["passTxt"].text = "Total Pass: " + char.battleStats["totalPass"];
		}

		private function initCharStats(battleStatsCharMc:*, obj:*, isPlayer:Boolean):void
		{
			battleStatsCharMc.visible = true;
			var icon = obj.getIcon();
			icon.name = obj.getMcId();
			icon.y = 150;
			if (!isPlayer)
			{
				icon.scaleX = 1.25;
				if (icon.name.indexOf("0") >= 0)
				{
					icon.x = 220;
				}
				else if (icon.name.indexOf("1") >= 0)
				{
					icon.x = 270;
				}
				else if (icon.name.indexOf("2") >= 0)
				{
					icon.x = 165;
				}
			}
			else
			{
				icon.scaleX = -1.25;
				icon.x = 300;

			}
			icon.scaleY = 1.25;
			battleStatsCharMc.addChildAt(icon, 1);
			battleStatsCharMc["noPlayer"].visible = false;
			battleStatsCharMc["readyTxt"].text = obj.getIsDead() ? "DEAD" : "ALIVE";
			battleStatsCharMc["userInfoMc"]["char_name"].text = obj.getName();
			battleStatsCharMc["userInfoMc"]["petType"].gotoAndStop(obj.getPetType());
			battleStatsCharMc["userInfoMc"]["attributeType"].gotoAndStop(obj.getPetAttributeType());
			battleStatsCharMc["userInfoMc"]["charLevelMC"]["levelTxt"].text = obj.getLevel();
		}

		private function initBattleStatsUI():void
		{
			Utils.moveToFront(this["battleStats"]);
			this["battleStats"].visible = true;
			for (var i = 0; i < 3; i++)
			{
				this["battleStats"]["player_" + i].visible = false;
				Utils.initButton(this["battleStats"]["player_" + i]["userInfoMc"]["statsBtn"], this.onCharShowStats, "Show Stats", true);
				this["battleStats"]["player_" + i]["readyTxt"].text = "";

				this["battleStats"]["enemy_" + i].visible = false;
				Utils.initButton(this["battleStats"]["enemy_" + i]["userInfoMc"]["statsBtn"], this.onCharShowStats, "Show Stats", true);
				this["battleStats"]["enemy_" + i]["readyTxt"].text = "";
			}
			for (i = 0; i < playerNum; i++)
			{
				initCharStats(this["battleStats"]["player_" + i], newPlayerArr[i], true);
			}
			for (i = 0; i < opponentNum; i++)
			{
				initCharStats(this["battleStats"]["enemy_" + i], newEnemyArr[i], false);
			}
		}

		private function onGameFinish():void
		{
			// if (this.gameMode == Constant.GAME_MODE_PVP)
			// {
			// this["statusTxt"].htmlText += "<font color=\"#00FF00\">" + (winner == "p" ? "Player 1" : "Player 2") + " Win</font><br>";
			// }
			// else
			// {
			// this["statusTxt"].htmlText += "<font color=\"#00FF00\">" + (winner == "p" ? "Player" : "Enemy") + " Win</font><br>";
			// }
			this["statusTxt"].htmlText += "<font color=\"#00FF00\">" + getWinnerTxt() + "</font><br>";
			this["statusTxt"].scrollV = this["statusTxt"].maxScrollV;
			Utils.moveToFront(this["popup"]);
			this["popup"].visible = true;
			// if (this.gameMode == Constant.GAME_MODE_PVP)
			// {
			// winnerTxt = (winner == "p" ? "P1" : "P2") + "\nWin";
			// }
			// else
			// {
			// winnerTxt = (winner == "p" ? "Player" : "Enemy") + " Win";
			// }
			this["popup"]["titleTxt"].text = this.winCondition == Constant.WIN_CONDITION_DEFAULT ? "Result" : this.winCondition;
			this["popup"]["txt"].text = getWinnerTxt();
			disposeBattle();
			initBattleStatsUI();
		}

		private function getWinnerTxt():String
		{
			if (winner == "p")
			{
				return this.gameMode == Constant.GAME_MODE_PVP ? "P1\nWin" : "Player\nWin";
			}
			else if (winner == "e")
			{
				return this.gameMode == Constant.GAME_MODE_PVP ? "P2\nWin" : "Enemy\nWin";
			}
			else if (winner == "d")
			{
				return "Draw";
			}
			return "";
		}

		private function updateCharacterATB():void
		{
			var atbConst = 1;
			var isFull = false;
			while (true)
			{
				for each (var character in characterArr)
				{
					character.updateATB(atbConst); // Assuming there's a method to update character ATB based on their agility
					trace(character.getLevel() + "-" + character.getATB());
					if (character.isATBFull() && !character.getIsDead())
					{
						isFull = true;
					}
					// updateActionBar(character);
					updateBar();
				}
				if (isFull)
				{
					break;
				}
			}
		}

		private function handleATBTurn():void
		{
			// Sort characters by ATB
			characterArr.sort(compareByATB);

			// Select the next character whose ATB is full
			for each (var character in characterArr)
			{
				// updateActionBar(character);
				updateBar();
				if (character.isATBFull() && !character.getIsDead())
				{
					character.resetATB();
					// updateActionBar(character);
					updateBar();
					nowTurn = character;
					controlCharacter();
					return; // Exit loop after handling one character's turn
				}
			}
		}

		private function compareByATB(characterA, characterB)
		{
			return characterB.getATB() - characterA.getATB(); // Sort in descending order of ATB
		}

		private function getAliveCharTurn():void
		{
			trace("getAliveCharTurn - start");
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
			trace("getAliveCharTurn - finish");
		}

		private function showSkillDisplay(char, charArr, checkPvp:Boolean = false):Boolean
		{
			var result = true;
			var isFirstChar = charArr.indexOf(char) == 0;
			var isCharControl = this.controlParty && charArr.indexOf(char) > 0;
			if (checkPvp)
			{
				var isPvp = this.gameMode == Constant.GAME_MODE_PVP;
				result = isPvp && (isFirstChar || isCharControl);
			}
			else
			{
				result = isFirstChar || isCharControl;
			}
			return result;
		}

		private function controlCharacter():void
		{
			trace("controlCharacter - start");
			nowTurnStr = newPlayerArr.indexOf(nowTurn) >= 0 ? "p" : "e";
			var isPlayerTurn:Boolean = nowTurnStr == "p";
			var index:int;

			var isPlayerControl = showSkillDisplay(nowTurn, newPlayerArr, false);
			var isEnemyControl = showSkillDisplay(nowTurn, newEnemyArr, true);

			index = isPlayerTurn ? newPlayerArr.indexOf(nowTurn) : newEnemyArr.indexOf(nowTurn);
			Utils.addGlowFilter(this[(isPlayerTurn ? "playerPetMc_" : "enemyPetMc_") + index]["activeMc"], true);
			attacker = nowTurn;
			hideTarget(true);
			skillDisplay(false);
			if (!checkDebuff(nowTurn))
			{
				StatsUtils.handleTurnStats(nowTurn);
				updateBar();
				if (!this.watchMode && (isPlayerControl || isEnemyControl))
				{
					trace("Player Skill Display");
					addSkillDisplay(nowTurn);
					if (isPlayerTurn)
					{
						this["enemyPetMc_" + selectedTargetPlayer]["target"].visible = true;
					}
					else
					{
						this["playerPetMc_" + selectedTargetEnemy]["target"].visible = true;
					}
				}
				else
				{
					trace("AI Select Skill");
					AISelectSkill();
				}
			}
			// else
			// {
			// StatsUtils.handleMissTurnStats(nowTurn);
			// }
			updateBar();
			trace("controlCharacter - finish");
		}

		private function checkAndSetCharDead(obj)
		{
			trace("checkAndSetCharDead - start");
			var charType = newPlayerArr.indexOf(obj) >= 0 ? "p" : "e";
			trace("checkAndSetCharDead " + charType);
			if (obj.getHP() <= 0 && !obj.getIsDead())
			{
				numDead[charType] += 1;
				obj.getPet().setActionFinishCB(null);
				obj.setIsDead(true);
				checkHpCpZero(obj);
				obj.getPet().gotoDead();
				removeActionBar(obj);
				if (obj.getPet().parent.parent["maskMC"].hasEventListener(MouseEvent.CLICK))
				{
					obj.getPet().parent.parent["maskMC"].removeEventListener(MouseEvent.CLICK, onSelectTarget);
				}
				trace("checkAndSetCharDead - finish");
				return true;
			}
			trace("checkAndSetCharDead - finish");
			return false;
		}

		public function checkDead():void
		{
			for (var i = 0; i < newPlayerArr.length; i++)
			{
				checkAndSetCharDead(newPlayerArr[i]);
			}
			for (i = 0; i < newEnemyArr.length; i++)
			{
				checkAndSetCharDead(newEnemyArr[i]);
			}
			if (newEnemyArr[selectedTargetPlayer].getIsDead())
			{
				selectedTargetPlayer = getAliveTarget(opponentNum, newEnemyArr);
			}
			if (newPlayerArr[selectedTargetEnemy].getIsDead())
			{
				selectedTargetEnemy = getAliveTarget(playerNum, newPlayerArr);
			}
			updateBar();
			checkGameFinish();
		}

		private function getAliveTarget(charArrNum, charArr):int
		{
			for (var i = 0; i < charArrNum; i++)
			{
				if (!charArr[i].getIsDead())
				{
					return i;
				}
			}
			return 0;
		}

		private function checkLimitFinishBattle():Boolean
		{
			if (this.limitTurn > 0)
			{
				var checkFinish = 0;
				for (var j in characterArr)
				{
					if (characterArr[j].battleStats["totalTurn"] >= this.limitTurn || characterArr[j].getIsDead())
					{
						checkFinish += 1;
					}
				}
				return checkFinish == characterArr.length;
			}
			return false;
		}

		public function checkGameFinish():void
		{

			if (this.winCondition == Constant.WIN_CONDITION_DEFAULT || this.winCondition == Constant.WIN_CONDITION_MOST_DAMAGE)
			{
				var draw1 = false, draw2 = false;
				if (this.watchMode)
				{
					if (checkLimitFinishBattle())
					{
						gameFinish = true;
						winner = "d";
					}
					if (numDead["e"] == opponentNum)
					{
						gameFinish = true;
						winner = "p";
						draw1 = true;
					}
					if (numDead["p"] == playerNum)
					{
						gameFinish = true;
						winner = "e";
						draw2 = true;
					}
					if (draw1 && draw2)
					{
						winner = "d";
					}
				}
				else if (this.gameMode == Constant.GAME_MODE_PVP)
				{
					if (checkLimitFinishBattle())
					{
						gameFinish = true;
						winner = "d";
					}
					if (numDead["e"] == opponentNum || (controlParty && numDead["e"] == opponentNum) || (!controlParty && newEnemyArr[0].getIsDead()))
					{
						this["enemyPetMc_" + selectedTargetPlayer]["target"].visible = false;
						gameFinish = true;
						winner = "p";
						draw1 = true;
					}
					if (numDead["p"] == playerNum || (controlParty && numDead["p"] == playerNum) || (!controlParty && newPlayerArr[0].getIsDead()))
					{
						this["playerPetMc_" + selectedTargetEnemy]["target"].visible = false;
						gameFinish = true;
						winner = "e";
						draw2 = true;
					}
					if (draw1 && draw2)
					{
						winner = "d";
					}
				}
				else if (this.gameMode == Constant.GAME_MODE_PVE)
				{
					if (checkLimitFinishBattle())
					{
						gameFinish = true;
						winner = "d";
					}
					if (numDead["e"] == opponentNum)
					{
						this["enemyPetMc_" + selectedTargetPlayer]["target"].visible = false;
						gameFinish = true;
						winner = "p";
						draw1 = true;
					}
					if (numDead["p"] == playerNum || (controlParty && numDead["p"] == playerNum) || (!controlParty && newPlayerArr[0].getIsDead()))
					{
						gameFinish = true;
						winner = "e";
						draw2 = true;
					}
					if (draw1 && draw2)
					{
						winner = "d";
					}
				}
				if (this.winCondition == Constant.WIN_CONDITION_MOST_DAMAGE)
				{
					if (checkLimitFinishBattle())
					{
						gameFinish = true;
						winner = "d";
					}
					if (gameFinish)
					{
						var totalDamagePlayer = StatsUtils.handleTotalDamageArr(newPlayerArr);
						var totalDamageEnemy = StatsUtils.handleTotalDamageArr(newEnemyArr);
						if (totalDamagePlayer == totalDamageEnemy)
						{
							winner = "d";
						}
						else
						{
							winner = totalDamagePlayer < totalDamageEnemy ? "e" : "p";
						}
					}
				}
			}
			else if (this.winCondition == Constant.WIN_CONDITION_FIRST_DEFEAT)
			{
				if (checkLimitFinishBattle())
				{
					gameFinish = true;
					winner = "d";
				}
				if (numDead["e"] == 1)
				{
					this["enemyPetMc_" + selectedTargetPlayer]["target"].visible = false;
					gameFinish = true;
					winner = "p";
				}
				if (numDead["p"] == 1)
				{
					this["playerPetMc_" + selectedTargetEnemy]["target"].visible = false;
					gameFinish = true;
					winner = "e";
				}
			}
			else if (this.winCondition == Constant.WIN_CONDITION_DEFEAT_MASTER)
			{
				if (checkLimitFinishBattle())
				{
					gameFinish = true;
					winner = "d";
				}
				if (newEnemyArr[0].getIsDead())
				{
					this["enemyPetMc_" + selectedTargetPlayer]["target"].visible = false;
					gameFinish = true;
					winner = "p";
				}
				if (newPlayerArr[0].getIsDead())
				{
					this["playerPetMc_" + selectedTargetEnemy]["target"].visible = false;
					gameFinish = true;
					winner = "e";
				}
			}
		}

		public function battleStatus(str:String, target:String):void
		{
			var attackerName:String = attacker.getPetInfo()["name"];
			var defenderName:String = defender.getPetInfo()["name"];
			// trace(attackerName + " deals " + str + " damage to " + defenderName + "(" + target + ")" + "\n");
			if (str == null)
			{
				str = "";
			}
			if (nowTurnStr == "p")
			{
				if (target == "pass")
				{
					this["statusTxt"].htmlText += "<font color=\"#0000FF\">" + attackerName + " pass</font>";
				}
				else
				{
					this["statusTxt"].htmlText += "<font color=\"#0000FF\">" + attackerName + " deals " + str + " damage to " + defenderName + " (" + target + ")" + "</font>";
				}
			}
			else
			{
				if (target == "pass")
				{
					this["statusTxt"].htmlText += "<font color=\"#0000FF\">" + attackerName + " pass</font>";
				}
				else
				{
					this["statusTxt"].htmlText += "<font color=\"#FF0000\">" + attackerName + " deals " + str + " damage to " + defenderName + " (" + target + ")" + "</font>";
				}
			}
			if (target != "pass")
			{
				overheadNumber(true, str, target, defender);
			}
			this["statusTxt"].scrollV = this["statusTxt"].maxScrollV;
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
					case "melee4":
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
