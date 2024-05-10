﻿package
{

	public class Pet extends Character
	{

		private var damage:int = 0;
		private var skillData:Array = [];
		private var allActions:Array = [];
		private var petInfo:Object = {};
		private var cooldown:Object = {};
		public var isHit:String = "";
		public var isCritical:Boolean = false;
		public var hasUseSpecial:Boolean = false;
		public var battleStats:Object = {};

		public function Pet(statsObj:Object, petMc:*, iconMc:*, bodyMc:*)
		{
			super(statsObj, petMc, iconMc, bodyMc);
			this.setDefaultBattleSTats();
		}

		public function setDefaultBattleSTats():void{
			this.battleStats =  {
				"totalTurn": 0,
				"missedTurn": 0,
				"totalDamage": 0,
				"totalDamageTaken": 0,
				"totalHeal": 0,
				"totalCriticalHit": 0,
				"totalHit": 0,
				"totalDodge": 0,
				"totalPurify": 0,
				"totalPass": 0
			};
		}

		public function setHit(hitVal:String):void
		{
			this.isHit = hitVal;
		}

		public function getHit():String
		{
			return this.isHit;
		}

		public function setPetInfo(petInfo:*):void
		{
			this.getPet().setPetObj(petInfo);
		}

		public function setSkillData(skills:*):void
		{
			this.getPet().skillData = skills;
		}

		public function setAllActions(actions:*):void
		{
			this.getPet().allActions = actions;
		}

		public function setCooldown(cooldowns:*):void
		{
			this.getPet().setSkillCooldown(cooldowns);
		}

		public function getDamage():int
		{
			return this.getPet().getDamage();
		}

		public function getPetInfo():*
		{
			return this.getPet().getPetObj();
		}

		public function getPetSwfName():*
		{
			return this.getPet().getPetObj()["swfName"];
		}

		public function getPetType():*
		{
			return this.getPet().getPetObj()["type"];
		}

		public function getPetAttributeType():*
		{
			return this.getPet().getPetObj()["attribute_type"];
		}

		public function getSkillData():*
		{
			return this.getPet().skillData;
		}

		public function getAllActions():*
		{
			return this.getPet().allActions;
		}

		public function getCooldown():*
		{
			return this.getPet().getSkillCooldown();
		}

	}

}