package
{

	public class PetLibrary
	{
		public static const TYPE_OFFENSIVE:int = 1;
		public static const TYPE_DEFENSIVE:int = 2;
		public static const TYPE_SUPPORTIVE:int = 3;
		public static const TYPE_WIND:String = "wind";
		public static const TYPE_FIRE:String = "fire";
		public static const TYPE_LIGHTNING:String = "lightning";
		public static const TYPE_EARTH:String = "earth";
		public static const TYPE_WATER:String = "water";
		public static const TYPE_ELEMENT:String = "null";

		public static function getSpecialSkill(petType:int):Object
		{
			var skillObj:Object = {};
			switch (petType)
			{
				case TYPE_OFFENSIVE:
					skillObj = {
							"target": "team",
							"effect": [
								{
									"type": "pet_damage_bonus",
									"duration": 2,
									"amount": 100
								}]
						};
					break;
				case TYPE_DEFENSIVE:
					skillObj = {
							"target": "team",
							"effect": [
								{
									"type": "guard",
									"duration": 2
								}]
						};
					break;
				case TYPE_SUPPORTIVE:
					skillObj = {
							"target": "all",
							"effect": [
								{
									"type": "clear_buff"
								}]
						};
					break;
				default:
					skillObj = {
							"target": "self",
							"effect": [
								{
									"type": "no effect"
								}]
						};
			}
			return skillObj;
		}

		public static function getAttributeSkill(attributeType:String):Object
		{
			var skillObj:Object = {};
			switch (attributeType)
			{
				case TYPE_WIND:
					skillObj = {
							"target": "self",
							"effect": [
								{
									"type": "pet_dodge_bonus",
									"duration": 3,
									"amount": 50
								}]
						};
					break;
				case TYPE_FIRE:
					skillObj = {
							"target": "self",
							"effect": [
								{
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 50
								}]
						};
					break;
				case TYPE_LIGHTNING:
					skillObj = {
							"target": "self",
							"effect": [
								{
									"type": "critical_chance_bonus",
									"duration": 3,
									"amount": 50
								}]
						};
					break;
				case TYPE_EARTH:
					skillObj = {
							"target": "self",
							"effect": [
								{
									"type": "damage_reduction",
									"duration": 3,
									"amount": 50
								}]
						};
					break;
				case TYPE_WATER:
					skillObj = {
							"target": "self",
							"effect": [
								{
									"type": "pet_heal",
									"duration": 3,
									"amount": 10
								}]
						};
					break;
				case TYPE_ELEMENT:
					skillObj = {
							"target": "self",
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 2,
									"chance": 25
								}]
						};
					break;
				default:
					skillObj = {
							"target": "self",
							"effect": [
								{
									"type": "no effect"
								}]
						};
			}
			return skillObj;
		}

		public static function getTypeTxt(petType:int):String
		{
			switch (petType)
			{
				case TYPE_OFFENSIVE:
					return "Offensive";
				case TYPE_DEFENSIVE:
					return "Defensive";
				case TYPE_SUPPORTIVE:
					return "Supportive";
				default:
					return "Balance";
			}
		}

		public static function getPetBySwfName(swfName:String):Object
		{
			for (var i:* in PET)
			{
				if (PET[i]["swfName"] == swfName)
				{
					return PET[i];
				}
			}
			return {};
		}

		public static const PET:Object = {
				"pet1": {
					"id": "1",
					"name": "Keiko",
					"description": "Keiko",
					"swfName": "toad_1",
					"clsName": "Toad_1",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 12,
							"target": "",
							"name": "Toad Lick",
							"description": "<b>Toad Lick</b><br>Restrict target for 1 turn.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Fiery Flame",
							"description": "<b>Fiery Flame</b><br>Reduce target's 3% HP for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1.2,
							"cooldown": 10,
							"target": "",
							"name": "Secret: Honorable Sword Strike",
							"description": "<b>Secret: Honorable Sword Strike</b><br>Ultimate taijutsu - Slash target with its sai to disable target from attacking with weapons (2 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dismantle",
									"duration": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Ghost Sonic",
							"description": "<b>Secret: Ghost Sonic</b><br>Ultimate genjutsu - sing the song of ghost to inflict chaos on target (cannot control character and use jutsu) (1 turn)",
							"action": "special",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 2
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "self",
							"name": "Oil Bottle",
							"description": "<b>Oil Bottle</b><br>Intake the energy drink to immediately complete all cooldowns of Keiko's Fiery Flame",
							"action": "special",
							"animation": "attack_06",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "oil_bottle"
								}]
						}]
				},
				"pet2": {
					"id": "2",
					"name": "Chiko",
					"description": "Chiko",
					"swfName": "bird_1",
					"clsName": "Bird_1",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "",
							"name": "Twister",
							"description": "<b>Twister</b><br>Emit wind-based attack from mouth.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 20,
							"damageBonus": 0.6,
							"cooldown": 8,
							"target": "",
							"name": "Flash Combat",
							"description": "<b>Flash Combat</b><br>Decrease 15% dodge rate for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dodge_reduction",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 3,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Mind Reader",
							"description": "<b>Mind Reader</b><br>Increase master's accuracy by 5% (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_attention",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 4,
							"level": 40,
							"damageBonus": 1.5,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Flight Sickle",
							"description": "<b>Secret: Flight Sickle</b><br>Ultimate taijutsu - Slash target swiftly to inflict bleeding (8% extra damage) (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 8,
									"chance": 100
								}]
						}]
				},
				"pet3": {
					"id": "3",
					"name": "Suzu",
					"description": "A cute charming kitten posseses ferocious battle capabilities.",
					"swfName": "cat_1",
					"clsName": "Cat_1",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 100000,
					"token": 0,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "",
							"name": "Claw Scratch",
							"description": "<b>Claw Scratch</b><br>Claw target.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "",
							"name": "Cuty Girl Transformation",
							"description": "<b>Cuty Girl Transformation</b><br>Stun target for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 2
								}
							]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Moon Dance Claw",
							"description": "<b>Moon Dance Claw</b><br>Wield the claws to attack target and reduce target's CP by 5%",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp",
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Ecstasy Transformation",
							"description": "<b>Secret: Ecstasy Transformation</b><br>Ultimate genjutsu - Restrict target and reduce target's attack damage by 100% (1 turn)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "ecstatic_sound",
									"duration": 2,
									"amount": 100
								}
							]
						}
					]
				},
				"pet4": {
					"id": "4",
					"name": "Eriko",
					"description": "A trained hound dog specializes in hunting.",
					"swfName": "dog_1",
					"clsName": "Dog_1",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 0,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 100000,
					"token": 0,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 0.3,
							"cooldown": 6,
							"target": "",
							"name": "Spin Strike",
							"description": "<b>Spin Strike</b><br>Strike target with spinning body.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0.6,
							"cooldown": 8,
							"target": "",
							"name": "Stale Gas",
							"description": "<b>Stale Gas</b><br>Blind target (-15% accuracy) for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "blind",
									"duration": 3,
									"amount": 15
								}
							]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Courage Roar",
							"description": "<b>Courage Roar</b><br>Roar for master - increase master's all attack damage by 5% (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Eliminate Strike",
							"description": "<b>Secret: Eliminate Strike</b><br>Ultimate taijutsu - Strike target fiercely and reduce target's HP by 3%",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_hp",
									"amount": 3
								}
							]
						}
					]
				},
				"pet5": {
					"id": "5",
					"name": "Suki",
					"description": "A loving pig that protects its master from harm.",
					"swfName": "pig_1",
					"clsName": "Pig_1",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 100000,
					"token": 0,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "",
							"name": "Fierce Rush",
							"description": "<b>Fierce Rush</b><br> Crash target with the body.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Master Protect!",
							"description": "<b>Master Protect!</b><br>Reduce master's 30% damage taken for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "damage_reduction",
									"duration": 3,
									"amount": 20
								}
							]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 1.2,
							"cooldown": 10,
							"target": "",
							"name": "One Body Explosive Blast",
							"description": "<b>One Body Explosive Blast</b><br>Strike against target to reduce target's all attack damage by 5% (2 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_weaken",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Secret: Immovable Mind",
							"description": "<b>Secret: Immovable Mind</b><br>Ultimate defense - 50% Guard master and reduce master's damage taken by 100% (1 turn)",
							"action": "special",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "guard",
									"duration": 2,
									// "amount": 100,
									"chance": 50
								}
							]
						}
					]
				},
				"pet6": {
					"id": "6",
					"name": "Leiko",
					"description": "An arrogant snake that might betray its master.",
					"swfName": "snake_1",
					"clsName": "Snake_1",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 100000,
					"token": 0,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 0.1,
							"cooldown": 6,
							"target": "",
							"name": "Fear Sound",
							"description": "<b>Fear Sound</b><br>A sensory sound attack.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0.2,
							"cooldown": 10,
							"target": "",
							"name": "Poison Gas",
							"description": "<b>Poison Gas</b><br>Reduce target's 3% HP for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "poison",
									"duration": 3,
									"amount": 3
								}
							]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Catalytic Matter",
							"description": "<b>Catalytic Matter</b><br>Release special gas that will increase master's all attack damage by 7% (Side effect: Reduce master HP by 2%) (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "catalytic_matter",
									"duration": 3,
									"amount": 7
								}
							]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 0.5,
							"cooldown": 12,
							"target": "all",
							"name": "Secret: Hazy Smoke",
							"description": "<b>Secret: Hazy Smoke</b><br>Ultimate jutsu - Create a misty screens to reduce accuracy of all enemies by 5% (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_blind",
									"duration": 3,
									"amount": 5
								}
							]
						}
					]
				},
				"pet7": {
					"id": "7",
					"name": "Shika",
					"description": "Santa's...Pet?",
					"swfName": "reindeer_1",
					"clsName": "Reindeer_1",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 50,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 0.4,
							"cooldown": 6,
							"target": "",
							"name": "Charge",
							"description": "<b>Charge</b><br> Crash target with the body.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Cleansing",
							"description": "<b>Cleansing</b><br>Remove all negative effects on master.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "purify" // ,
									// "duration": 3,
									// "amount": 20
								}
							]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Frozen Icicle",
							"description": "<b>Frozen Icicle</b><br>Summon icicles to attack target and 50% chance to inflict frozen (stun target but target damage taken will be reduced by 80%) (2 turn)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_freeze",
									"duration": 3,
									"chance": 50
								}
							]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 1.2,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Winter Avalanche",
							"description": "<b>Secret: Winter Avalanche</b><br>Summon a snowslide to inflict frozen (stun target but target damage taken will be reduced by 80%) (1 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_freeze",
									"duration": 2,
									"chance": 100
								}
							]
						},
						{
							"id": 5,
							"level": 50,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "Secret: Smoky Snow Flower",
							"description": "<b>Secret: Smoky Snow Flower</b><br>Create a snowy screens so that master have 50% chance to resist all negative status (1 turns)",
							"action": "special",
							"animation": "attack_06",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 2,
									"chance": 50
								}
							]
						}
					]
				},
				"pet8": {
					"id": "8",
					"name": "Kame",
					"description": "Special pet for someone who has good friends!",
					"swfName": "turtle_1",
					"clsName": "Turtle_1",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 0,
					"token": 0,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "master",
							"name": "Turtle Spirit",
							"description": "<b>Turtle Spirit</b><br>Recover master's HP.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "heal_damage",
									"heal": 0.2, // bonus
									"amount": 10 // minVal
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Rolling Carapace",
							"description": "<b>Rolling Carapace</b><br>Attack target with its carapace.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Sea Veins Badge",
							"description": "<b>Sea Veins Badge</b><br>Seal a sea veins on master to reduce master's damage taken by 15% (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"amount": 15,
									"duration": 3
								}
							]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Secret: Spring Rain",
							"description": "<b>Secret: Spring Rain</b><br>Ultimate jutsu - Recover master's HP by 2% (3 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"amount": 2,
									"duration": 4
								}
							]
						}
					]
				},
				"pet9": {
					"id": "9",
					"name": "Easter Egg",
					"description": "Easter Egg",
					"swfName": "bunny_easter_free",
					"clsName": "BunnyEasterFree",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "",
							"name": "Pierce Attack",
							"description": "<b>Pierce Attack</b><br>Crash target with the body.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Shining Eyes",
							"description": "<b>Shining Eyes</b><br>Charge master with 100CP.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "restore_cp",
									"duration": 0,
									"amount": 100
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Bunny's Gift",
							"description": "<b>Bunny's Gift</b><br>A present from bunny - Recover master's CP after HP reduction. (Amount: 10% of HP reduction) (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_to_cp",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "",
							"name": "Bunny's Surprise",
							"description": "<b>Bunny's Surprise</b><br>Throw eggs to target to reduce target's CP recovery by 10% per charge (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_reduce_charge",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 5,
							"level": 30,
							"damageBonus": 1,
							"cooldown": 14,
							"target": "all",
							"name": "Rocket Bunny",
							"description": "<b>Rocket Bunny</b><br>Strike target like a rocket to reduce target's HP & CP by 4%",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 4
								}]
						}]
				},
				"pet10": {
					"id": "10",
					"name": "Easa",
					"description": "A bunny...with a sword...it's dangerous, watch out!",
					"swfName": "bunny_1",
					"clsName": "Bunny_1",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 400,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 6,
							"target": "",
							"name": "Bunny Quick Strike",
							"description": "<b>Bunny Quick Strike</b><br>Slash target swiftly and have 50% chance to inflict bleeding (5% extra damage) (2 turns)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 50
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1.4,
							"cooldown": 8,
							"target": "",
							"name": "Bunny Triple Kunai",
							"description": "<b>Bunny Triple Kunai</b><br>Throw kunai to target and have 50% chance to inflict bleeding (5% extra damage) (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 50
								}]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 1.4,
							"cooldown": 10,
							"target": "",
							"name": "Secret: Bunny Slash",
							"description": "<b>Secret: Bunny Slash</b><br>Powerful slash that has 25% chance to stun target (1 turn)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun_random",
									"duration": 2,
									"chance": 25
								}]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "self",
							"name": "Frenzy Bunny",
							"description": "<b>Frenzy Bunny</b><br>Bunny is under frenzy status - increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (3 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 4
								}]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "Secret: Mirror of Moon",
							"description": "<b>Secret: Mirror of Moon</b><br>Ultimate jutsu - Hallucinate target for master with mirror-like water so that all attack by target will be rebound (1 turn)",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "serene_mind",
									"duration": 2
								}]
						}]
				},
				"pet11": {
					"id": "11",
					"name": "Tomaru",
					"description": "Active at the volcano area, Tomaru can emit fireball from its mouth.",
					"swfName": "snake_2",
					"clsName": "Snake_2",
					"type": 3,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 400,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "",
							"name": "Fire Ball",
							"description": "<b>Fire Ball</b><br>Burn target to reduce target's HP by 2% (3 turns)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 4,
									"amount": 2
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.4,
							"cooldown": 8,
							"target": "",
							"name": "Dark Touch",
							"description": "<b>Dark Touch</b><br>Reduce target's damage by 8% for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_fear_weaken",
									"duration": 3,
									"amount": 8
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Firebreath",
							"description": "<b>Firebreath</b><br>Emit the breath of fire to reduce master's jutsu CP consumption by 30% (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_save_cp",
									"duration": 3,
									"amount": 30
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0.8,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Hell Flame Eater",
							"description": "<b>Secret: Hell Flame Eater</b><br>Ultimate justu - Swallow the flame on target to deal bigger damage: reduce target's HP by 1% and remove burn status (5% if target is under  burn status)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "flame_eater"
								}
							]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "Secret: Evil Fire Ward",
							"description": "<b>Secret: Evil Fire Ward</b><br>Ultimate jutsu - Form a fiery kekkei to guard master within 2 turns: burn attacker's HP by 3% in 1 turn",
							"action": "special",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_reflect_attack",
									"duration": 3,
									"amount": 3
								}
							]
						}
					]
				},
				"pet12": {
					"id": "12",
					"name": "Raita",
					"description": "It's Ninja Saga Anniversary Carnival!",
					"swfName": "dog_2",
					"clsName": "Dog_2",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 0,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.3,
							"cooldown": 6,
							"target": "",
							"name": "Noise",
							"description": "<b>Noise</b><br>Create noise to reduce target's CP by 5%.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp",
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.7,
							"cooldown": 8,
							"target": "",
							"name": "Lightning Impluse",
							"description": "<b>Lightning Impluse</b><br>Reduce critical damage by target by 25% (3 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "light_impluse",
									"duration": 3
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Military Lightning Roar",
							"description": "<b>Military Lightning Roar</b><br>Increase master's all attack damage, critical chance & accuracy by 5% (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_lightning",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Secret: Lightning Body Wrap",
							"description": "<b>Secret: Lightning Body Wrap</b><br>Ultimate defense - Protect master so that master can fully resist all negative status (1 turn)",
							"action": "special",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 2,
									"chance": 100
								}
							]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 1.5,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Hyper Lightning Chop",
							"description": "<b>Secret: Hyper Lightning Chop</b><br>Ultimate taijutsu - slash target swiftly to increase target's all skills cooldown for 2 extra turns",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "add_all_cooldown",
									"amount": 3
								}
							]
						}
					]
				},
				"pet13": {
					"id": "13",
					"name": "Inokuchi",
					"description": "Inokuchi has received tough training and can move very fast!",
					"swfName": "pig_2",
					"clsName": "Pig_2",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 100000,
					"token": 0,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 10,
							"damageBonus": 0.3,
							"cooldown": 12,
							"target": "",
							"name": "Spin Strike",
							"description": "<b>Spin Strike</b><br>Strike target with spinning body.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 20,
							"damageBonus": 0.6,
							"cooldown": 6,
							"target": "",
							"name": "Earth Strangle",
							"description": "<b>Earth Strangle</b><br>Stun target for 1 turn.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 2
								}]
						}, {
							"id": 3,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Rock Shade",
							"description": "<b>Rock Shade</b><br>Form a kekkei for master so that master can recover HP when attack (Amount: 15% of the attack damage) (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp_kekkai",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 4,
							"level": 40,
							"damageBonus": 1.4,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Rock Death Spear",
							"description": "<b>Secret: Rock Death Spear</b><br>Ultimate jutsu - summon rock spears to inflict bleeding (10% extra damage) (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 10
								}]
						}]
				},
				"pet14": {
					"id": "14",
					"name": "Zoshi",
					"description": "It's Ninja Saga Anniversary Carnival!",
					"swfName": "dummy_pet",
					"clsName": "Dummy_pet",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0.2,
							"cooldown": 0,
							"target": "",
							"name": "Normal Attack",
							"description": "<b>Normal Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.5,
							"cooldown": 6,
							"target": "",
							"name": "Cannon Ball Strike",
							"description": "<b>Cannon Ball Strike</b><br>Punch and kick target.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.8,
							"cooldown": 8,
							"target": "",
							"name": "Swift Kick",
							"description": "<b>Swift Kick</b><br>A quick dash of flying kick.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Dummy Block",
							"description": "<b>Dummy Block</b><br>Block attack for master, 50% chance resist attack damage (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "guard",
									"duration": 3,
									"chance": 50
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1.6,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Aloneness Fist",
							"description": "<b>Secret: Aloneness Fist</b><br>Ultimate taijutsu - Punch on target and have 40% chance to disable target from healing (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "internal_injury", // "internal_injury_random",
									"duration": 3,
									"chance": 40
								}
							]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 1.8,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Two Shadow As One",
							"description": "<b>Secret: Two Shadow As One</b><br>Ultimate taijutsu - Attack target together with its shadow, and have 30% chance to remove all buff from target",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 30
								}
							]
						}
					]
				},
				"pet15": {
					"id": "15",
					"name": "Kisuke",
					"description": "Kisuke",
					"swfName": "pumpkin_1",
					"clsName": "Pumpkin_1",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1.4,
							"cooldown": 8,
							"target": "",
							"name": "Pumpkin Bomb",
							"description": "<b>Pumpkin Bomb</b><br>Pumpkin bombs!",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "master",
							"name": "Treat!",
							"description": "<b>Treat!</b><br>Random chance to recover either HP or CP by 50, or reduce skill cooldown by 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_random_effect_on_master",
									"EffectArray": [ {
											"id": 1,
											// "chance": 0,
											"type": "heal",
											"amount": 50,
											"heal": 50
										}, {
											"id": 2,
											// "chance": 0.33,
											"type": "restore_cp",
											"amount": 50,
											"heal": 50
										}, {
											"id": 3,
											// "chance": 0.66,
											"type": "cooldown_reduction",
											"amount": 1
										}]
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0.4,
							"cooldown": 12,
							"target": "",
							"name": "Hehe! My Cake!",
							"description": "<b>Hehe! My Cake!</b><br>Random chance to Stun, Poison, Burning (1 turn).",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_random_effect_on_defender",
									"EffectArray": [ {
											"id": 1,
											"isDebuff": 1,
											// "chance": 0,
											"type": "stun",
											"duration": 2
										}, {
											"id": 2,
											"isDebuff": 1,
											// "chance": 0.33,
											"type": "poison",
											"duration": 2,
											"amount": 5
										}, {
											"id": 3,
											"isDebuff": 1,
											// "chance": 0.66,
											"type": "pet_burn",
											"duration": 2,
											"amount": 5
										}]
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0.6,
							"cooldown": 12,
							"target": "",
							"name": "Where Is My Head?",
							"description": "<b>Where Is My Head?</b><br>Random chance to Stun, Numb, Restriction or Weaken  target (1 turn).",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_random_effect_on_defender",
									"EffectArray": [ {
											"id": 1,
											"isDebuff": 1,
											// "chance": 0,
											"type": "stun",
											"duration": 2
										}, {
											"id": 2,
											"isDebuff": 1,
											// "chance": 0.25,
											"type": "bundle",
											"duration": 2,
											"amount": 20
										}, {
											"id": 3,
											"isDebuff": 1,
											// "chance": 0.5,
											"type": "dodge_reduction",
											"duration": 2,
											"amount": 5
										}, {
											"id": 4,
											"isDebuff": 1,
											// "chance": 0.75,
											"type": "fear_weaken",
											"duration": 2,
											"amount": 5
										}]
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0.8,
							"cooldown": 12,
							"target": "",
							"name": "Eat the Dust!",
							"description": "<b>Eat the Dust!</b><br>Random chance to Prison, Hamstring, Internal Injury or Blind target (1 turn).",
							"action": "special",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_random_effect_on_defender",
									"EffectArray": [ {
											"id": 1,
											"isDebuff": 1,
											// "chance": 0,
											"type": "coilding_wave",
											"duration": 2,
											"amount": 2
										}, {
											"id": 2,
											"isDebuff": 1,
											// "chance": 0.25,
											"type": "hamstring",
											"duration": 2,
											"amount": 5
										}, {
											"id": 3,
											"isDebuff": 1,
											// "chance": 0.5,
											"type": "internal_injury",
											"duration": 2
										}, {
											"id": 4,
											"isDebuff": 1,
											// "chance": 0.75,
											"type": "blind",
											"duration": 2,
											"amount": 5
										}]
								}]
						}]
				},
				"pet16": {
					"id": "16",
					"name": "Yamaru",
					"description": "Yamaru",
					"swfName": "bat_1",
					"clsName": "Bat_1",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 50,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 10,
							"damageBonus": 1.3,
							"cooldown": 8,
							"target": "",
							"name": "Bite",
							"description": "<b>Bite</b><br>Bite target fiercely",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 20,
							"damageBonus": 1.1,
							"cooldown": 10,
							"target": "",
							"name": "Vampiric Spirit",
							"description": "<b>Vampiric Spirit</b><br>Drain 10% CP from target and recover to master.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_cp",
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 30,
							"damageBonus": 1.1,
							"cooldown": 12,
							"target": "",
							"name": "Vampiric Attack",
							"description": "<b>Vampiric Attack</b><br>Drain 5% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 5
								}]
						}, {
							"id": 4,
							"level": 40,
							"damageBonus": 1.4,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Shackles of Heart",
							"description": "<b>Secret: Shackles of Heart</b><br>Increase target's 1 random skill cooldown for 4 extra turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 5
								}]
						}, {
							"id": 5,
							"level": 50,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Secret: Bloodlust Dedication",
							"description": "<b>Secret: Bloodlust Dedication</b><br>Heal master 5% HP and remove all negative status effect",
							"action": "special",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bloodlust_dedication",
									"amount": 5
								}]
						}]
				},
				"pet17": {
					"id": "17",
					"name": "Yajiro",
					"description": "Yajiro",
					"swfName": "bat_2",
					"clsName": "Bat_2",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 10,
							"damageBonus": 1.2,
							"cooldown": 8,
							"target": "",
							"name": "Bite",
							"description": "<b>Bite</b><br>Bite target fiercely",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Vampiric Spirit",
							"description": "<b>Vampiric Spirit</b><br>Drain 5% CP from target and recover to master.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_cp",
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 30,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Vampiric Attack",
							"description": "<b>Vampiric Attack</b><br>Drain 2% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 2
								}]
						}, {
							"id": 4,
							"level": 40,
							"damageBonus": 1.2,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Shackles of Heart",
							"description": "<b>Secret: Shackles of Heart</b><br>Increase target's 1 random skill cooldown for 3 extra turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 4
								}]
						}]
				},
				"pet19": {
					"id": "19",
					"name": "Yukidaruma",
					"description": "A snowman built by ninja is infused with the ninja spirit too!",
					"swfName": "snowman_1",
					"clsName": "Snowman_1",
					"type": 2,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 8,
							"target": "",
							"name": "Pitch Snowball",
							"description": "<b>Pitch Snowball</b><br>Reduce target's attack damage by 4% (1 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_fear_weaken",
									"duration": 2,
									"amount": 4
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 14,
							"target": "",
							"name": "Snow Bullet Tank",
							"description": "<b>Snow Bullet Tank</b><br>50% chance to stun target (1 turn)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun_random",
									"duration": 2,
									"chance": 50
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "",
							"name": "Snowball Combo",
							"description": "<b>Snowball Combo</b><br>Reduce target's attack damage by 10% (1 turn)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_fear_weaken",
									"duration": 2,
									"amount": 10
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0.4,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Clone Snow Tank",
							"description": "<b>Secret: Clone Snow Tank</b><br>Ultimate jutsu - 80% chance to stun target (1 turn)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun_random",
									"duration": 2,
									"chance": 80
								}
							]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 0.6,
							"cooldown": 16,
							"target": "",
							"name": "Secret: Snowman Breaker Tank",
							"description": "<b>Secret: Snowman Breaker Tank</b><br>Ultimate jutsu - Freeze target (2 turns) (Frozen target cannot move but damage taken is reduced by 80%)",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_freeze",
									"duration": 3,
									"chance": 100
								}
							]
						}
					]
				},
				"pet20": {
					"id": "20",
					"name": "Kumayoshi",
					"description": "",
					"swfName": "festival_1",
					"clsName": "Festival_1",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "",
							"name": "Claw Scratch",
							"description": "<b>Claw Scratch</b><br>A scratching  attack which uses both claws",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Blue Ocean Star",
							"description": "<b>Blue Ocean Star</b><br>Sprinkle ocean star blessings - master recover CP by extra 10% per charge (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "effect_extra_cp_recover",
									"duration": 3,
									"amount": 10
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Fate Light Star",
							"description": "<b>Fate Light Star</b><br>Sprinkle fate light stars to remove all negative status from master.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "purify"
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0.8,
							"cooldown": 12,
							"target": "",
							"name": "Dark Moon Star",
							"description": "<b>Dark Moon Star</b><br>Absorb power of dark moon stars and give target a hard crash - reduce target's HP by 2 %.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_hp",
									"amount": 2
								}
							]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "White Sky Star",
							"description": "<b>White Sky Star</b><br>Sprinkle white star blessings - reduce master's jutsu CP consumption by 40% (4 turns).",
							"action": "special",
							"animation": "attack_06",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_save_cp",
									"duration": 5,
									"amount": 40
								}
							]
						}
					]
				},
				"pet23": {
					"id": "23",
					"name": "Takachi",
					"description": "Takachi",
					"swfName": "bird_4",
					"clsName": "Bird_4",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 6,
							"target": "",
							"name": "Thunder Strike",
							"description": "<b>Thunder Strike</b><br>A quick dash strike.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Thunder Bolt",
							"description": "<b>Thunder Bolt</b><br>Takachi launches a thunder bolt to attack the enemy.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Thunder Scream",
							"description": "<b>Thunder Scream</b><br>Takachi's scream will increase master 5% damage.(5 turn)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus",
									"amount": 5,
									"duration": 6
								}
							]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 1.1,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Thunder Shadow",
							"description": "<b>Secret: Thunder Shadow</b><br>Takachi strikes the enemy with his thunder shadow.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "blind",
									"amount": 5,
									"duration": 6
								}
							]
						}
					]
				},
				"pet26": {
					"id": "26",
					"name": "Haru",
					"description": "Haru",
					"swfName": "cat_4",
					"clsName": "Cat_4",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 0,
					"attribute_type": "fire",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 12,
							"target": "",
							"name": "Fire Rush",
							"description": "<b>Fire Strike</b><br>Crash target with the fiery body.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0.5,
							"cooldown": 10,
							"target": "",
							"name": "Fiery Spinning Strike",
							"description": "<b>Fiery Spinning Strike</b><br>Strike target with spinning fiery body.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Flaming World",
							"description": "<b>Flaming World</b><br>Strengthen 15% 2 turns",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "",
							"name": "Flame Bombing Strike",
							"description": "<b>Flame Bombing Strike</b><br>Burn 2% for 1 turn",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 2,
									"amount": 2
								}]
						}]
				},
				"pet32": {
					"id": "32",
					"name": "Yuki",
					"description": "Yuki",
					"swfName": "hedgehog_1",
					"clsName": "Hedgehog_1",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 0,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 12,
							"target": "",
							"name": "Spin Strike",
							"description": "<b>Spin Strike</b><br>Strike target with spinning body.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Hardening",
							"description": "<b>Hardening</b><br>Bleed enemy (10%) for 2 turns",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Thorn Guard",
							"description": "<b>Thorn Guard</b><br>Guard 1 turn",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard",
									"duration": 2
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0.5,
							"cooldown": 12,
							"target": "",
							"name": "Vortex",
							"description": "<b>Vortex</b><br>Blind enemy 10% for 2 turns",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_blind",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 1.5,
							"cooldown": 14,
							"target": "all",
							"name": "Thorn Throw",
							"description": "<b>Thorn Throw</b><br>Attack all target",
							"action": "attack",
							"animation": "attack_06",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}]
				},

				"pet32": {
					"id": "32",
					"name": "Yuma",
					"description": "Yuma",
					"swfName": "hedgehog_2",
					"clsName": "Hedgehog_2",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 0,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 12,
							"target": "",
							"name": "Spin Strike",
							"description": "<b>Spin Strike</b><br>Strike target with spinning body.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Hardening",
							"description": "<b>Hardening</b><br>Bleed",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Thorn Guard",
							"description": "<b>Thorn Guard</b><br>Guard",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard",
									"duration": 2
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0.5,
							"cooldown": 12,
							"target": "",
							"name": "Vortex",
							"description": "<b>Vortex</b><br>Blind",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 1.5,
							"cooldown": 14,
							"target": "all",
							"name": "Thorn Throw",
							"description": "<b>Thorn Throw</b><br>Bleed",
							"action": "attack",
							"animation": "attack_06",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}]
				},

				"pet33": {
					"id": "33",
					"name": "Ponpoco",
					"description": "Ponpoco",
					"swfName": "raccoon_1",
					"clsName": "Raccoon_1",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "",
							"name": "Umbrella Strike",
							"description": "<b>Umbrella Strike</b><br>Throw target a spinning umbrella.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0.7,
							"cooldown": 8,
							"target": "",
							"name": "Hibuki Shower",
							"description": "<b>Hibuki Shower</b><br>Eject weapons from the umbrella and reduce target's CP by 10%.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp",
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Start! Guard!",
							"description": "<b>Start! Guard!</b><br>50% chance to guard master (2 turns).",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard",
									"duration": 3,
									"chance": 50
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1.3,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Kasatanuki",
							"description": "<b>Secret: Kasatanuki</b><br>Transform into giant umbrella and stun target (1 turn).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun_random",
									"duration": 2,
									"chance": 100
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "Secret: Sakura Scatter",
							"description": "<b>Secret: Sakura Scatter</b><br>Rain sakura petals to increase master's attack damage by 8% (2 turns).",
							"action": "special",
							"animation": "attack_06",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 8
								}]
						}]
				},
				"pet56": {
					"id": "56",
					"name": "Katsura",
					"description": "",
					"swfName": "pig_3",
					"clsName": "Pig_3",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 15,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 3,
							"damageBonus": 0.2,
							"cooldown": 6,
							"target": "",
							"name": "Fierce Rush",
							"description": "<b>Fierce Rush</b><br>An attack that uses full body force",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Attention",
							"description": "<b>Attention!</b><br>Master's attack ignore 3% of target's dodge (2 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 3,
									"amount": 3
								}
							]
						},
						{
							"id": 3,
							"level": 7,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Defense!",
							"description": "<b>Defense!</b><br>Reduce 5% damage to master (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"amount": 5,
									"duration": 3
								}
							]
						},
						{
							"id": 4,
							"level": 8,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Attack!",
							"description": "<b>Attack!</b><br>Increase 3% master's damage to enemy (2 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus",
									"amount": 3,
									"duration": 3
								}
							]
						},
						{
							"id": 5,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Healing!",
							"description": "<b>Healing!</b><br>Heal master's HP by 2% in each turn (3 turns)",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"amount": 2,
									"duration": 4
								}
							]
						}
					]
				},
				"pet57": {
					"id": "57",
					"name": "Zen",
					"description": "",
					"swfName": "bunny_2",
					"clsName": "Bunny_2",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.<br>",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 6,
							"target": "",
							"name": "Bunny Quick Strike",
							"description": "<b>Bunny Quick Strike</b><br>Slash target swiftly and have 50% chance to inflict bleeding (5% extra damage) (2 turns)<br>",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 100
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1.2,
							"cooldown": 8,
							"target": "",
							"name": "Bunny Triple Kunai",
							"description": "<b>Bunny Triple Kunai</b><br>Throw kunai to target and have 50% chance to inflict bleeding (5% extra damage) (2 turns)<br>",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 100
								}]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 1.4,
							"cooldown": 10,
							"target": "",
							"name": "Bunny Up Slash",
							"description": "<b>Bunny Up Slash</b><br>Perform a Up Slash, 50% chance produce bleeding effect. (2 turns) (Character will take extra 5% damage under bleeding effect.)<br>",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 100
								}]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "self",
							"name": "Frenzy Zen",
							"description": "<b>Frenzy Zen</b><br>Bunny is under frenzy status - increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (3 turns)<br>",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 4
								}]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 1.9,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Smoky Ansatsu",
							"description": "<b>Secret: Smoky Ansatsu</b><br>Assassinate Skill invented by Zen. Use smoke bomb assassinate target. Target reduce 6% HP.<br>",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_hp",
									"amount": 6,
									"chance": 100
								}]
						}
					]
				},
				"pet58": {
					"id": "58",
					"name": "Zenitsu",
					"description": "",
					"swfName": "bunny_3",
					"clsName": "Bunny_3",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.<br>",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 6,
							"target": "",
							"name": "Bunny Quick Strike",
							"description": "<b>Bunny Quick Strike</b><br>Slash target swiftly and have 50% chance to inflict bleeding (5% extra damage) (2 turns)<br>",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 50
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1.2,
							"cooldown": 8,
							"target": "",
							"name": "Bunny Triple Kunai",
							"description": "<b>Bunny Triple Kunai</b><br>Throw kunai to target and have 50% chance to inflict bleeding (5% extra damage) (2 turns)<br>",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 50
								}]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 1.4,
							"cooldown": 10,
							"target": "",
							"name": "Bunny Sound Illusion",
							"description": "<b>Bunny Sound Illusion</b><br>Chaos target (2 turns)<br>",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "self",
							"name": "Frenzy Zenitsu",
							"description": "<b>Frenzy Zenitsu</b><br>Bunny is under frenzy status - increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (3 turns)<br>",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 4
								}]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 1.4,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Bunny Weapon Technique",
							"description": "<b>Secret: Bunny Weapon Technique</b><br>Throw weapon to target and inflict bleeding (20% extra damage) (2 turns)<br>",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 20,
									"chance": 100
								}]
						}]
				},
				"pet59": {
					"id": "59",
					"name": "Zetsu",
					"description": "",
					"swfName": "bunny_4",
					"clsName": "Bunny_4",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.<br>",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 6,
							"target": "",
							"name": "Bunny Quick Strike",
							"description": "<b>Bunny Quick Strike</b><br>Slash target swiftly and have 50% chance to inflict bleeding (5% extra damage) (2 turns)<br>",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 50
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 8,
							"target": "",
							"name": "Toxic Bottle",
							"description": "<b>Toxic Bottle</b><br>Throw poison to enemy, target reduce 2%HP each turn. (2 turns)<br>",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "poison",
									"duration": 3,
									"amount": 2
								}]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 1.4,
							"cooldown": 10,
							"target": "",
							"name": "Bunny Up Slash",
							"description": "<b>Bunny Up Slash</b><br>Perform a Up Slash, 50% chance produce bleeding effect. (2 turns) (Character will take extra 5% damage under bleeding effect.)<br>",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 50
								}]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "self",
							"name": "Frenzy Zetsu",
							"description": "<b>Frenzy Zetsu</b><br>Bunny is under frenzy status - increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (3 turns)<br>",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 4
								}]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 1.9,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Zetsu Toxic Slash",
							"description": "<b>Secret: Zetsu Toxic Slash</b><br>Put poison on weapon, and preform a slash to poison target. Reduce 3% HP in each turn (2 turns)<br>",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "poison",
									"duration": 3,
									"amount": 3
								}]
						}]
				},
				"pet63": {
					"id": "63",
					"name": "Itikura",
					"description": "Itikura",
					"swfName": "bunny_5",
					"clsName": "Bunny_5",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 0,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 6,
							"target": "",
							"name": "Swift Kick",
							"description": "<b>Swift Kick</b><br>A quick dash of flying kick.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Chakra Bullet",
							"description": "<b>Chakra Bullet</b><br>Shoot chakra bullets to disable target from charging (1 turn).",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "restrict_charge",
									"duration": 2
								}]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Weak Point Focus",
							"description": "<b>Weak Point Focus</b><br>Increase critical rate by 15% and critical damage by 30% (2 turns).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "crit_chance_dmg",
									"amount": 30,
									"duration": 3
								}]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1.4,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Absolute Chakra Shield",
							"description": "<b>Secret: Absolute Chakra Shield</b><br>Emit a lot of chakra to crash target - 50% chance to stun target for 1 turn.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun_random",
									"duration": 2,
									"chance": 50
								}]
						}]
				},
				"pet64": {
					"id": "64",
					"name": "Rakura",
					"description": "Rakura",
					"swfName": "bunny_6",
					"clsName": "Bunny_6",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 0,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 6,
							"target": "",
							"name": "Swift Kick",
							"description": "<b>Swift Kick</b><br>A quick dash of flying kick.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Chakra Bullet",
							"description": "<b>Chakra Bullet</b><br>Shoot chakra bullets to disable target from charging (2 turns).",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "restrict_charge",
									"duration": 3
								}]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Weak Point Focus",
							"description": "<b>Weak Point Focus</b><br>Increase critical rate by 15% and critical damage by 30% (3 turns).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "crit_chance_dmg",
									"amount": 30,
									"duration": 4
								}]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1.4,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Absolute Chakra Shield",
							"description": "<b>Secret: Absolute Chakra Shield</b><br>Emit a lot of chakra to to stun target (1 turn).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 2
								}]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 1.9,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Absolute Chakra Strike",
							"description": "<b>Secret: Absolute Chakra Strike</b><br>Emit huge amount of chakra - 30% chance to remove all buffs from target.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 30
								}]
						}]
				},
				"pet65": {
					"id": "65",
					"name": "Kyubi",
					"description": "The legendary nine-tailed demon fox who good at using Fire Release & Gedo Cannon.",
					"swfName": "fox_1",
					"clsName": "Fox_1",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 6500,
					"skill": []
				},
				"pet66": {
					"id": "66",
					"name": "Dorimaru",
					"description": "",
					"swfName": "bird_8",
					"clsName": "Bird_8",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 1.2,
							"cooldown": 6,
							"target": "",
							"name": "Multi Fireball Flash",
							"description": "<b>Multi Fireball Flash</b><br>Blow fire balls out, target's HP will be burnt down by 2% in each turn. (2 turns)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 2
								}]
						}, {
							"id": 2,
							"level": 20,
							"damageBonus": 1.2,
							"cooldown": 8,
							"target": "",
							"name": "Fiery Flame",
							"description": "<b>Fiery Flame</b><br>A fire based attack that comes out from the pet's mouth, target's HP will be burnt down by 2% in each turn (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 2
								}]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 1.6,
							"cooldown": 8,
							"target": "",
							"name": "Flame Burst",
							"description": "<b>Flame Burst</b><br>Attack target with a fire storm, target HP will be burnt down by 2% in each turn. (3 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 4,
									"amount": 2
								}]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "self",
							"name": "Secret: Burning Feather",
							"description": "<b>Secret: Burning Feather</b><br>Put fire on itself, attack damage increased by 100% (3 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"amount": 100,
									"duration": 4
								}]
						}]
				},
				"pet67": {
					"id": "67",
					"name": "Kabocha Samurai",
					"description": "Kabocha Samurai",
					"swfName": "pumpkin_2",
					"clsName": "Pumpkin_2",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Kabocha Juumonji",
							"description": "<b>Kabocha Juumonji</b><br>Quick dash toward to target and attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.3,
							"cooldown": 2,
							"target": "",
							"name": "Kabocha Kiri",
							"description": "<b>Kabocha Kiri</b><br>Insert Chakra into his samurai sword and throw it to enemy<br>",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 4,
							"target": "",
							"name": "Kabocha Kaiten Kiri",
							"description": "<b>Kabocha Kaiten Kiri</b><br>Jump behind the target and perform a critical attack<br>",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 25,
							"target": "",
							"name": "Kabocha Ikari",
							"description": "<b>Kabocha Ikari</b><br>Using his anger to burn target into dust,  target HP will be burnt down by 5% in each turn. (4 turns)<br>",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 5,
									"amount": 5
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1.9,
							"cooldown": 12,
							"target": "all",
							"name": "Kinjutsu: Kabocha Hedda",
							"description": "<b>Kinjutsu: Kabocha Hedda</b><br>Kinjutsu: Focus all the Pumpkin Power into his head and headbutt all the enemies<br>",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 5,
							"level": 30,
							"damageBonus": 1.9,
							"cooldown": 5,
							"target": "",
							"name": "Kinjutsu: Kabocha Issen",
							"description": "<b>Kinjutsu: Kabocha Issen</b><br>Focus the Pumpkin Power on a slash, after perform increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (4 turns)<br>",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 5
								}]
						}]
				},
				"pet68": {
					"id": "68",
					"name": "Hachibi",
					"description": "",
					"swfName": "snake_0",
					"clsName": "Snake_0",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 6500,
					"skill": []
				},
				"pet69": {
					"id": "69",
					"name": "Shika",
					"description": "Santa's...Pet?",
					"swfName": "reindeer_2",
					"clsName": "Reindeer_2",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 50,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 10,
							"damageBonus": 0.4,
							"cooldown": 6,
							"target": "",
							"name": "Charge",
							"description": "<b>Charge</b><br> Crash target with the body.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Cleansing",
							"description": "<b>Cleansing</b><br>Remove all negative effects on master.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "purify" // ,
									// "duration": 3,
									// "amount": 20
								}
							]
						},
						{
							"id": 3,
							"level": 30,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Frozen Icicle",
							"description": "<b>Frozen Icicle</b><br>Summon icicles to attack target and 50% chance to inflict frozen (stun target but target damage taken will be reduced by 80%) (2 turn)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_freeze",
									"duration": 3,
									"chance": 50
								}
							]
						},
						{
							"id": 4,
							"level": 40,
							"damageBonus": 1.2,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Winter Avalanche",
							"description": "<b>Secret: Winter Avalanche</b><br>Summon a snowslide to inflict frozen (stun target but target damage taken will be reduced by 80%) (1 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_freeze",
									"duration": 2,
									"chance": 100
								}
							]
						},
						{
							"id": 5,
							"level": 50,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "Secret: Smoky Snow Flower",
							"description": "<b>Secret: Smoky Snow Flower</b><br>Create a snowy screens so that master have 50% chance to resist all negative status (1 turns)",
							"action": "special",
							"animation": "attack_06",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 2,
									"chance": 50
								}
							]
						}
					]
				},
				"pet71": {
					"id": "71",
					"name": "Nanabi",
					"description": "",
					"swfName": "tail_7",
					"clsName": "Tail_7",
					"type": 2,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 6500,
					"skill": []
				},
				"pet72": {
					"id": "72",
					"name": "Kumanosuke",
					"description": "",
					"swfName": "valentinebear",
					"clsName": "Valentinebear",
					"type": 2,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.<br>",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.1,
							"cooldown": 4,
							"target": "",
							"name": "Kuma Kick",
							"description": "<b>Kuma Kick</b><br>Kumanosuke Kick Combo<br>",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.4,
							"cooldown": 10,
							"target": "",
							"name": "Baku shinjutsu",
							"description": "<b>Baku shinjutsu</b><br>Kumanosuke uses his inner power to dash into enemy<br>",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						}
					]
				},
				"pet73": {
					"id": "73",
					"name": "Rokubi",
					"description": "",
					"swfName": "tail_6",
					"clsName": "Tail_6",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 6500,
					"skill": []
				},
				"pet74": {
					"id": "74",
					"name": "Gobi",
					"description": "",
					"swfName": "tail_5",
					"clsName": "Tail_5",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 6500,
					"skill": []
				},
				"pet75": {
					"id": "75",
					"name": "Eashin",
					"description": "",
					"swfName": "bunny_7",
					"clsName": "Bunny_7",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 15,
					"gold": 0,
					"token": 0,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 6,
							"target": "",
							"name": "Bunny Quick Strike",
							"description": "<b>Bunny Quick Strike</b><br>Slash target swiftly and have 50% chance to inflict bleeding (5% extra damage) (2 turns)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 50
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1.4,
							"cooldown": 8,
							"target": "",
							"name": "Bunny Triple Sword",
							"description": "<b>Bunny Triple Sword</b><br>Throw sword to target and inflict bleeding (15% extra damage) (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 15,
									"chance": 100
								}]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 1.4,
							"cooldown": 10,
							"target": "",
							"name": "Secret: Bunny Slash",
							"description": "<b>Secret: Bunny Slash</b><br>Powerful slash that has 50% chance to stun target (2 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun_random",
									"duration": 3,
									"chance": 50
								}]
						}
					]
				},
				"pet85": {
					"id": "85",
					"name": "Football Player Rakura",
					"description": "Football Player Rakura",
					"swfName": "dog_7",
					"clsName": "Dog_7",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 0,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 6,
							"target": "",
							"name": "Swift Kick",
							"description": "<b>Swift Kick</b><br>A quick dash of flying kick.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Chakra Bullet",
							"description": "<b>Chakra Bullet</b><br>Shoot chakra bullets to disable target from charging (2 turns).",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "restrict_charge",
									"duration": 3
								}]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Weak Point Focus",
							"description": "<b>Weak Point Focus</b><br>Increase critical rate by 15% and critical damage by 30% (3 turns).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "crit_chance_dmg",
									"amount": 30,
									"duration": 4
								}]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1.4,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Absolute Chakra Shield",
							"description": "<b>Secret: Absolute Chakra Shield</b><br>Emit a lot of chakra to to stun target (1 turn).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 2
								}]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 1.9,
							"cooldown": 14,
							"target": "",
							"name": "Secret: Absolute Chakra Strike",
							"description": "<b>Secret: Absolute Chakra Strike</b><br>Emit huge amount of chakra - 30% chance to remove all buffs from target.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 30
								}]
						}]
				},
				"pet86": {
					"id": "86",
					"name": "Yobi",
					"description": "",
					"swfName": "tail_4_3",
					"clsName": "Tail_4_3",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 6500,
					"skill": []
				},
				"pet87": {
					"id": "87",
					"name": "Rainbow Bird",
					"description": "",
					"swfName": "tail_4_2",
					"clsName": "Tail_4_2",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 10000,
					"skill": []
				},
				"pet88": {
					"id": "88",
					"name": "Little Rainbow Bird",
					"description": "",
					"swfName": "tail_4",
					"clsName": "Tail_4",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 10000,
					"skill": []
				},
				"pet89": {
					"id": "89",
					"name": "Honoo",
					"description": "Honoo",
					"swfName": "wolf_0",
					"clsName": "Wolf_0",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 12,
							"target": "",
							"name": "Fire Rush",
							"description": "<b>Fire Rush</b><br>Rush to target",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "master",
							"name": "Red Moon",
							"description": "<b>Red Moon</b><br>Increase master damage 8% for 2 turns",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 8
								}]

						}]
				},
				"pet91": {
					"id": "91",
					"name": "Tamadama Dragon",
					"description": "The legendary Tamadama Dragon.",
					"swfName": "dragon_2",
					"clsName": "Dragon_2",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Violent Horn",
							"description": "<b>Violent Horn</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.1,
							"cooldown": 8,
							"target": "",
							"name": "Air Bozooka",
							"description": "<b>Air Bozooka</b><br>Using air flow to create cannon ball. Produce bleeding effect. (1 turns)(Character will take extra 6% damage under bleeding effect.)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"amount": 6,
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0.4,
							"cooldown": 10,
							"target": "all",
							"name": "Spinning Slash",
							"description": "<b>Spinning Slash</b><br>Using air flow to create a wind blade. 80% chance to produce bleeding effect. (3 turns) (Character will take extra 6% damage under bleeding effect.)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"amount": 5,
									"duration": 2,
									"chance": 80
								}]
						}]
				},
				"pet92": {
					"id": "92",
					"name": "Origami Panda",
					"description": "A very helpful supportive panda.",
					"swfName": "panda_1",
					"clsName": "Panda_1",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Attack",
							"description": "<b>Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 3,
							"target": "master",
							"name": "Yun & Yang",
							"description": "<b>Yun & Yang</b><br>Recover master 4% HP. (2 turns)",
							"action": "special",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"amount": 4,
									"duration": 3
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 4,
							"target": "master",
							"name": "Chakra Harmony",
							"description": "<b>Chakra Harmony</b><br>Recover master 300 CP.",
							"action": "special",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "restore_cp",
									"amount": 300
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Nayami Soujiki",
							"description": "<b>Nayami Soujiki</b><br>Remove all negative effects on master.",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "purify"
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Gourd Protector",
							"description": "<b>Gourd Protector</b><br>Reduce 5% damage to master. (3 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"duration": 4,
									"amount": 5
								}
							]
						},
						{
							"id": 5,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "O-Daiko",
							"description": "<b>O-Daiko</b><br>Increase master's attack damage by 6%. (3 turns)",
							"action": "special",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 6
								}
							]
						}
					]
				},
				"pet93": {
					"id": "93",
					"name": "Chick",
					"description": "Chick",
					"swfName": "egg_01",
					"clsName": "Egg_01",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Mace Attack",
							"description": "<b>Mace Attack</b><br>50% chance produce bleeding effect. (2 turns) (Character will take extra 5% damage under bleeding effect.)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"amount": 5,
									"duration": 3,
									"chance": 50
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "",
							"name": "Frenzy Egg",
							"description": "<b>Frenzy Egg</b><br>Becomes ball to attack, produce chaos. (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]

						}]
				},
				"pet94": {
					"id": "94",
					"name": "Little Jyubi",
					"description": "Little Jyubi",
					"swfName": "tail_10",
					"clsName": "Tail_10",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 2500,
					"skill": []
				},
				"pet95": {
					"id": "95",
					"name": "Rookie Jyubi",
					"description": "Rookie Jyubi",
					"swfName": "tail_10_2",
					"clsName": "Tail_10_2",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 1000000,
					"skill": []
				},
				"pet96": {
					"id": "96",
					"name": "Jyubi",
					"description": "Jyubi",
					"swfName": "tail_10_3",
					"clsName": "Tail_10_3",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 0,
					"gold": 0,
					"token": 1000000,
					"skill": []
				},
				"pet97": {
					"id": "97",
					"name": "Baby Bird",
					"description": "Baby Bird",
					"swfName": "egg_02",
					"clsName": "Egg_02",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 30,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Mace Attack II",
							"description": "<b>Mace Attack II</b><br>Produce bleeding effect. (2 turns) (Character will take extra 15% damage under bleeding effect.)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"amount": 15,
									"duration": 3,
									"chance": 100
								}]
						}, {
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Frenzy Egg II",
							"description": "<b>Frenzy Egg II</b><br>Becomes ball to attack, produce chaos. (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]

						},
						{
							"id": 3,
							"level": 25,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Delphinium Chop",
							"description": "<b>Delphinium Chop</b><br>To reduce target's HP & CP by 5%.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 5
								}]

						},
						{
							"id": 4,
							"level": 30,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "Rebound Wall",
							"description": "<b>Rebound Wall</b><br>All attack by target will be rebound. (1 turn)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "serene_mind",
									"duration": 2
								}]

						}]
				},
				"pet98": {
					"id": "98",
					"name": "Red Fox",
					"description": "Red Fox",
					"swfName": "fox_2",
					"clsName": "Fox_02",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 35,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 6,
							"target": "",
							"name": "Candy Rain",
							"description": "<b>Candy Rain</b><br>40% chance to remove all buff from target",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 40
								}]
						}, {
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "",
							"name": "Red's Voice",
							"description": "<b>Red's Voice</b><br>70% to inflict sleep on target (2 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "random_sleep",
									"duration": 3,
									"chance": 70
								}]
						}, {
							"id": 3,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Holy Light",
							"description": "<b>Holy Light</b><br>Reduce master's damage taken by 15% (3 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_reduction",
									"duration": 4,
									"amount": 15
								}]
						}, {
							"id": 4,
							"level": 35,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "Dome of Sugar House",
							"description": "<b>Dome of Sugar House</b><br>Guard master and reduce master's damage taken by 100% (2 turn)",
							"action": "special",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard",
									"duration": 3,
									"amount": 100
								}]
						}]
				},
				"pet99": {
					"id": "99",
					"name": "Yajiromaru",
					"description": "Yajiromaru",
					"swfName": "bat_3",
					"clsName": "Bat_3",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 40,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 10,
							"damageBonus": 1.2,
							"cooldown": 8,
							"target": "",
							"name": "Bite",
							"description": "<b>Bite</b><br>Bite target fiercely",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 2,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Vampiric Spirit",
							"description": "<b>Vampiric Spirit</b><br>Drain 5% CP from target and recover to master.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_cp",
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 30,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Vampiric Attack",
							"description": "<b>Vampiric Attack</b><br>Drain 2% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 2
								}]
						}, {
							"id": 4,
							"level": 40,
							"damageBonus": 1.2,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Shackles of Heart",
							"description": "<b>Secret: Shackles of Heart</b><br>Increase target's 1 random skill cooldown for 3 extra turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 4
								}]
						}]
				},
				"pet100": {
					"id": "100",
					"name": "Totem Bird",
					"description": "Totem Bird",
					"swfName": "totem_bird",
					"clsName": "Totem_bird",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 35,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Pecking Skill",
							"description": "<b>Pecking Skill</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Bird Throw",
							"description": "<b>Bird Throw</b><br>Decrease hit rate by 15%, lasts for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_blind",
									"duration": 3,
									"amount": 15
								}
							]
						},
						{
							"id": 2,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Tarzan Falls",
							"description": "<b>Tarzan Falls</b><br>With 50% chance to inflict bleeding (5% extra damage) (2 turns).",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 50
								}
							]
						},
						{
							"id": 3,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "",
							"name": "Totem Shock",
							"description": "<b>Totem Shock</b><br>Electric current given from Totem, decrease target's dodge rate by 10% (2 turns).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "dodge_reduction",
									"duration": 3,
									"amount": 10
								}
							]
						},
						{
							"id": 4,
							"level": 35,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "",
							"name": "Totem Collapse",
							"description": "<b>Totem Collapse</b><br>Dizzy condition occurs and stun target (1 turn).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 2
								}
							]
						}
					]
				},
				"pet101": {
					"id": "101",
					"name": "Christmas Angel",
					"description": "Christmas Angel",
					"swfName": "pet_101",
					"clsName": "Pet_101",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 5,
							"target": "",
							"name": "Stomp",
							"description": "<b>Stomp</b><br>Strikes the enemy with the heel of the foot.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Holy Blessing",
							"description": "<b>Holy Blessing</b><br>Defense up, reduces Master's received damage by 15% (3 turns).",
							"action": "special",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"duration": 4,
									"amount": 15
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Passion Healing",
							"description": "<b>Passion Healing</b><br>Recover Master's 5% HP.(3 turns).",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 4,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Divine Zeal",
							"description": "<b>Divine Zeal</b><br>Reduce Master's skill Cool Down by 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "cooldown_reduction",
									"amount": 2
								}
							]
						}
					]
				},
				"pet102": {
					"id": "102",
					"name": "Ninja Gingerbread",
					"description": "Ninja Gingerbread",
					"swfName": "pet_102",
					"clsName": "Pet_102",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.3,
							"cooldown": 5,
							"target": "",
							"name": "Gingerly Punch",
							"description": "<b>Gingerly Punch</b><br>Strike with the fist.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 7,
							"target": "",
							"name": "You can't catch me!",
							"description": "<b>You can't catch me!</b><br>Quickly runs, leaving a trail of dust to distract the enemy reducing their accuracy by 15% (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_blind",
									"duration": 3,
									"amount": 15
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "self",
							"name": "Add Flavor",
							"description": "<b>Add Flavor</b><br>Increase self attack damage by 80% (3 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 80
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 11,
							"target": "",
							"name": "Get Excited",
							"description": "<b>Get Excited</b><br>Performs his finishing move! Inflicts \"Bleeding\" status for 3 turns. (Character will take extra 15% damage under bleeding effect)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_bleeding",
									"duration": 4,
									"amount": 15,
									"chance": 100
								}
							]
						}
					]
				},
				"pet103": {
					"id": "103",
					"name": "Devil Angel",
					"description": "Devil Angel",
					"swfName": "pet_103",
					"clsName": "Pet_103",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Mint Chocolate Fire Shoot",
							"description": "<b>Mint Chocolate Fire Shoot</b><br>Create a green fire ball and shoot to the enemy, target's HP will be burnt down by 2% in each turn. (3 turns)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 4,
									"amount": 2
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Dark Love Damnation",
							"description": "<b>Dark Love Damnation</b><br>Using extraordinary incantation, target will not allow to use any jutsu. (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bundle",
									"duration": 3
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Bloody Valentine Magic",
							"description": "<b>Bloody Valentine Magic</b><br>Summoning magic which bases on its blood  heals master's HP by 6% in each turn. (3 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 4,
									"amount": 6
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Dark Souls Domination",
							"description": "<b>Dark Souls Domination</b><br>Burgundy Chocolate Angel incarnates to the evil souls and affects the enemy's willpower and inflicts chaos on target. (cannot control character and use jutsu) (2 turn)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "chaos",
									"duration": 3
								}
							]
						}
					]
				},
				"pet104": {
					"id": "104",
					"name": "Clown Dragon (I)",
					"description": "Clown Dragon (I)",
					"swfName": "pet_104",
					"clsName": "Pet_104",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Poisonous Fog Attack",
							"description": "<b>Poisonous Fog Attack</b><br>Spit poisonous fog to the enemy. Reduce enemy 2%HP each turn. (for 3 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "poison",
									"duration": 4,
									"amount": 2
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Colorful Combo",
							"description": "<b>Colorful Combo</b><br>Cause bleeding effect. (for 2 turns) (Enemy will suffer an extra 5% damage under bleeding effect)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 5,
									"chance": 100
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Star Slinky Fist",
							"description": "<b>Star Slinky Fist</b><br>Reduce target's 5% damage. (for 2 turns)",
							"action": "attack",
							"animation": "attack_07",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_weaken",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 11,
							"target": "all",
							"name": "Infinite Poisonous Needles",
							"description": "<b>Infinite Poisonous Needles</b><br>Jet many Poison Needles to all targets. All target's damage reduces 10%. (2 turns)",
							"action": "attack",
							"animation": "attack_08",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_weaken",
									"duration": 3,
									"amount": 10
								}
							]
						}
					]
				},
				"pet105": {
					"id": "105",
					"name": "Little Blue Dragon (I)",
					"description": "Little Blue Dragon (I)",
					"swfName": "pet_105",
					"clsName": "Pet_105",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Winter Jet",
							"description": "<b>Winter Jet</b><br>Reduce enemy's 5%CP.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp",
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Freezing Glacier",
							"description": "<b>Freezing Glacier</b><br>Create glacier to attack target and block target's healing (for 2 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 3
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Ice Armor Wall",
							"description": "<b>Ice Armor Wall</b><br>Build ice wall to protect master and reduce  enemy's 5% damage(for 3 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "damage_reduction",
									"duration": 4,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "self",
							"name": "Blue Dragon's Power",
							"description": "<b>Blue Dragon's Power</b><br>Summon Blue Dragon's power. Increase 100 % pet's attack damage and 25% critical chance (Side effect: suffer 20 % extra damage for 2 turns)",
							"action": "special",
							"animation": "attack_08",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bunny_frenzy",
									"duration": 3
								}
							]
						}
					]
				},
				"pet106": {
					"id": "106",
					"name": "Fossil Dragon (I)",
					"description": "Fossil Dragon (I)",
					"swfName": "pet_106",
					"clsName": "Pet_106",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 4,
							"target": "",
							"name": "Hell of Needle",
							"description": "<b>Hell of Needle</b><br>Cause bleeding effect. (for 2 turns) (Enemy will suffer an extra 5% damage under bleeding effect.)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bleeding",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 6,
							"target": "",
							"name": "Evil Beam",
							"description": "<b>Evil Beam</b><br>Powerful beam shooting, cause chaos effect( for 1 turn)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "chaos",
									"duration": 2
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Dark Destructive Fire",
							"description": "<b>Dark Destructive Fire</b><br>Increase master's critical, dodge, combustion, purify or reactive force chance by 4% (for 2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_energize",
									"duration": 3,
									"amount": 4
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 11,
							"target": "",
							"name": "Dark Destructive Fire",
							"description": "<b>Dark Destructive Fire</b><br>Spit considerable dark fire, enemy's HP will be burnt down by 2% in each turn (for 2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 3,
									"amount": 2
								}
							]
						}
					]
				},
				"pet107": {
					"id": "107",
					"name": "Golden Triple Dragon (I)",
					"description": "Golden Triple Dragon (I)",
					"swfName": "pet_107",
					"clsName": "Pet_107",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 5,
							"target": "",
							"name": "Flashbang Bomb",
							"description": "<b>Flashbang Bomb</b><br>The Dragon spurts out a blinding flashbang from its mouth, causing a target to have reduced accuracy by 5% each turn. ( For 2 turns)",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_blind",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Plasma Cage",
							"description": "<b>Plasma Cage</b><br>Generates a plasma field which can dissipate the target's chakra. Burns the target's CP by 5%.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp",
									"amount": 5
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Storm's Blessing",
							"description": "<b>Storm's Blessing</b><br>Hyper charges its master granting bonus effect. Increases its master's attack damage, critical chance & accuracy by 5% for 2 turns.",
							"action": "special",
							"animation": "attack_07",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_lightning",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Ultimate Hyper Charged Combo",
							"description": "<b>Ultimate Hyper Charged Combo</b><br>Overloads the body with the ultimate hyper charged lightning and releases it to the target. Stuns the target for 2 turns.",
							"action": "attack",
							"animation": "attack_08",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						}
					]
				},
				"pet108": {
					"id": "108",
					"name": "Windstorm Dragon Turtle (I)",
					"description": "Windstorm Dragon Turtle (I)",
					"swfName": "pet_108",
					"clsName": "Pet_108",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 6,
							"target": "",
							"name": "Photon Blast",
							"description": "<b>Photon Blast</b><br>Bursts the target with a quick photon blast. Reduces the target's overall damage by 5% for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_weaken",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Osmosis Bomb",
							"description": "<b>Osmosis Bomb</b><br>Bombards the target with water which hinders them to use any skills. Restricts the target for 1 turn.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bundle",
									"duration": 2
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 6,
							"target": "master",
							"name": "Leaf Guard",
							"description": "<b>Leaf Guard</b><br>Completely cover its master with reinforced leaves which blocks damage. Negates all incoming damage for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "guard", // "complete_guard",
									"duration": 2,
									"amount": 4
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Solar Particle Beam",
							"description": "<b>Solar Particle Beam</b><br>Gathers a vast amount of life energy focusing it all in one shot and fires at the enemy. This attack destroys the target's chakra pressure points making them unable to charge their CP. Disables CP charge for 1 turn.",
							"action": "attack",
							"animation": "attack_08",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "restrict_charge",
									"duration": 2
								}
							]
						}
					]
				},
				"pet109": {
					"id": "109",
					"name": "Celebration Clown Dragon (II)",
					"description": "Celebration Clown Dragon (II)",
					"swfName": "pet_109",
					"clsName": "Pet_109",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "master",
							"name": "Wind Power",
							"description": "<b>Wind Power</b><br>Uses the power of the wind to boost dexterity.Increases the master accuracy by 10% for 1 turn.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 3,
									"amount": 10
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Icy Breath",
							"description": "<b>Icy Breath</b><br>Bursts the target with cryo force making them susceptible to attacks. Has 50% chance to inflict bleeding status for 2 turns (15% damage amplification).",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_bleeding",
									"duration": 3,
									"amount": 15,
									"chance": 50
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "",
							"name": "Flash Sphere",
							"description": "<b>Flash Sphere</b><br>Encircles the target with blinding bolt. Blinds the target for 1 turn (10% accuracy reduction).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "blind",
									"duration": 2,
									"amount": 10
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Chaos Flame",
							"description": "<b>Chaos Flame</b><br>Unleashes a burst of black fire. Inflicts the target with chaos status for 1 turn.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "chaos",
									"duration": 2
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "all",
							"name": "Omni-Blast",
							"description": "<b>Omni-Blast</b><br>A wild barrage of air bullets in all directions. Inflicts weaken status for 2 turns (15% damage reduction).",
							"action": "attack",
							"animation": "attack_08",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_weaken",
									"duration": 3,
									"amount": 15
								}
							]
						}
					]
				},
				"pet110": {
					"id": "110",
					"name": "Dark Clown Dragon (III)",
					"description": "Dark Clown Dragon (III)",
					"swfName": "pet_110",
					"clsName": "Pet_110",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Dark Chain Ritual",
							"description": "<b>Dark Chain Ritual</b><br>Summons magical chains to bind all positive status and take it away. Has 35% chance to remove all positive status to the target.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 35
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 6,
							"target": "",
							"name": "Apparition’s Curse",
							"description": "<b>Apparition’s Curse</b><br>Calls the power of the dead to haunt the target. Inflicts chaos status for 1 turn.",
							"action": "attack",
							"animation": "attack_07",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "chaos",
									"duration": 2
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Sunset Breeze",
							"description": "<b>Sunset Breeze</b><br>Creates a chilling wind barrier which protects the master from any ominous threat. Applies debuff resist status for 3 turns (has 50% chance to resist debuffs).",
							"action": "special",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 4,
									"amount": 50
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Earth Spike",
							"description": "<b>Earth Spike</b><br>Impales the target with rock spikes leaving them wounded. Inflicts weaken status to the target for 3 turns. (15% damage reduction).",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_weaken",
									"duration": 4,
									"amount": 15
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 1,
							"cooldown": 11,
							"target": "",
							"name": "Fiery Fire",
							"description": "<b>Fiery Fire</b><br>Burn to reduce enemy's 7% HP. (2 turns)",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burning",
									"duration": 3,
									"amount": 7
								}
							]
						}
					]
				},
				"pet111": {
					"id": "111",
					"name": "Ice Blue Dragon (II)",
					"description": "Ice Blue Dragon (II)",
					"swfName": "pet_111",
					"clsName": "Pet_111",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 4,
							"target": "",
							"name": "Wild Assault",
							"description": "<b>Wild Assault</b><br>Attacks the target continuously making them lose balance. ",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect" // ,
									// "duration": 3
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "all",
							"name": "Black Fire",
							"description": "<b>Black Fire</b><br>Summons the fire from the abyss to incinerate the enemies.Inflicts chaos status for 1 turn.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "chaos",
									"duration": 2,
									"amount": 7
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Glacial Dome",
							"description": "<b>Glacial Dome</b><br>Protects the master with glaciers. Reduces master’s damage taken by 5% for 6 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"duration": 7,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 9,
							"target": "",
							"name": "Plasma Burst",
							"description": "<b>Plasma Burst</b><br>Encloses the target with plasma charges making their weapon useless. Disables target’s weapon attack for 2 turns. ",
							"action": "attack",
							"animation": "attack_07",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "dismantle",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Hydro Bomb",
							"description": "<b>Hydro Bomb</b><br>Blasts an area with hyper pressurized water. Inflicts frozen status for 2 turns. ",
							"action": "attack",
							"animation": "attack_08",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_freeze",
									"duration": 3,
									"chance": 100
								}
							]
						}
					]
				},
				"pet112": {
					"id": "112",
					"name": "Lightning Drake (II)",
					"description": "Lightning Drake (II)",
					"swfName": "pet_112",
					"clsName": "Pet_112",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack ",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Lightning Flash Combo",
							"description": "<b>Lightning Flash Combo</b><br>Strikes the target multiple times with lightning speed. ",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Thunder Beam",
							"description": "<b>Thunder Beam</b><br>Use Lightning power to attack enemy.Stun target (1 turn).",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 2
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Ice Shield",
							"description": "<b>Ice Shield</b><br>Creates a magical shield to fortify the master’s vitality. Applies debuff resist status for 2 turn (has 50% chance to resist debuffs).",
							"action": "special",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 3,
									"amount": 50
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Dragon Rage",
							"description": "<b>Dragon Rage</b><br>An aerial lightning bolt assault that cripples the target.Reduces target CP by 15%.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp",
									"amount": 15
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "",
							"name": "Plasma Prison",
							"description": "<b>Plasma Prison</b><br>Drain 6% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_07",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_hp",
									"amount": 6
								}
							]
						}
					]
				},
				"pet113": {
					"id": "113",
					"name": "Undead Chain Dragon (II)",
					"description": "Undead Chain Dragon (II)",
					"swfName": "pet_113",
					"clsName": "Pet_113",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack ",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Unholy Impact",
							"description": "<b>Unholy Impact</b><br>Blasts the target with unholy power.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Hell’s Chain Binding",
							"description": "<b>Hell’s Chain Binding</b><br>Summon’s the power of the hell’s chain warden to bind the target. Restricts the target for 2 turns.",
							"action": "attack",
							"animation": "attack_07",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bundle",
									"duration": 3
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Eternal Flame",
							"description": "<b>Eternal Flame</b><br>Unleashes a black fire that consumes the target’s sanity. Target's HP will be burnt down by 6% in each turn (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burning",
									"duration": 3,
									"amount": 6
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Dragon Blessing",
							"description": "<b>Dragon Blessing</b><br>Imbues the master with the power of dragon souls. Increases master’s CP charge recovery by 50% for 2 turns.",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "effect_extra_cp_recover",
									"duration": 3,
									"amount": 50
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Evil Vines",
							"description": "<b>Evil Vines</b><br>Summons the power of the vines to constrict the target and remove their energies. Reduces the target’s HP and CP by 5%",
							"action": "attack",
							"animation": "attack_08",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp_hp",
									"amount": 5
								}
							]
						}
					]
				},
				"pet114": {
					"id": "114",
					"name": "Dark Thunder Triple Dragon (II)",
					"description": "Dark Thunder Triple Dragon (II)",
					"swfName": "pet_114",
					"clsName": "Pet_114",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack ",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 3,
							"target": "",
							"name": "Cyclone Miasma",
							"description": "<b>Cyclone Miasma</b><br>Generates a whirling miasma to lower the target’s efficiency. Reduces the target’s critical damage by 25% for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "light_impluse",
									"duration": 3
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Disintegration Bolt",
							"description": "<b>Disintegration Bolt</b><br>Fires a highly concentrated electrical discharge to disintegrate the target. Reduces the target’s CP charge recovery by 50% for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_reduce_charge",
									"duration": 3,
									"amount": 50
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Tempest Excitation",
							"description": "<b>Tempest Excitation</b><br>Absorbs the power of the wind, granting dexterity boost. Increases pet's accuracy by 8% for 2 turns.",
							"action": "special",
							"animation": "attack_07",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 3,
									"amount": 8
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Shock Boost",
							"description": "<b>Shock Boost</b><br>Releases a hyper charged plasma and assimilate it to the master’s body. Reduces cooldown by 1.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "cooldown_reduction",
									"amount": 1
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Proton Heal",
							"description": "<b>Proton Heal</b><br>Heals the master’s overall damage by fusing electric currents to the body. Recover master’s HP by 5% for 2 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 3,
									"amount": 5
								}
							]
						}
					]
				},
				"pet115": {
					"id": "115",
					"name": "Dual Cannon Triple Dragon (II)",
					"description": "Dual Cannon Triple Dragon (II)",
					"swfName": "pet_115",
					"clsName": "Pet_115",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack ",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 9,
							"target": "",
							"name": "Terra Spear",
							"description": "<b>Terra Spear</b><br>Stomps the ground with force to form a rock spear and stab the target making them lose balance. Reduces critical chance, dodge chance, combustion chance, purify chance and reactive force chance of target by 5% for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_disoriented",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Leech Vine",
							"description": "<b>Leech Vine</b><br>Entangles the target with leeching vines that absorbs its energy. Weakens the target for 2 turns (5% damage reduction).",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_fear_weaken",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Vaccum Blast",
							"description": "<b>Vaccum Blast</b><br>Fires a highly condensed air bullet to disrupt the target. Blinds the target for 2 turns (8% accuracy reduction).",
							"action": "attack",
							"animation": "attack_07",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_blind",
									"duration": 3,
									"amount": 8
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Thunder",
							"description": "<b>Thunder</b><br>Attacks the target with fierce lightning charges which makes healing useless. Inflicts internal injury for 3 turns.",
							"action": "attack",
							"animation": "attack_08",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 4
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "self",
							"name": "Wind Up",
							"description": "<b>Wind Up</b><br>Focuses in the battle and kick it up a notch. Increases pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) for 7 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bunny_frenzy",
									"duration": 8
								}
							]
						}
					]
				},
				"pet116": {
					"id": "116",
					"name": "Earth Lava Dragon Turtle (II)",
					"description": "Earth Lava Dragon Turtle (II)",
					"swfName": "pet_116",
					"clsName": "Pet_116",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Shell attack ",
							"description": "<b>Shell attack </b><br>Rushes towards the target and slams with force. ",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Fiery Will",
							"description": "<b>Fiery Will</b><br>Boosts the master’s metabolism by igniting its hidden potential. Reduces master’s skill cooldown by 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "cooldown_reduction",
									"amount": 1
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "",
							"name": "Ominous Black Chain",
							"description": "<b>Ominous Black Chain</b><br>Unleashes a torrent of black chains to bind the target. Weakens the target for 1 turn (10% damage reduction).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_weaken",
									"duration": 2,
									"amount": 10
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 9,
							"target": "",
							"name": "Lightning Bolt",
							"description": "<b>Lightning Bolt</b><br>Attacks the target with fully charged lightning. Stuns the target for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 11,
							"target": "",
							"name": "Solar Vacuum Beam",
							"description": "<b>Solar Vacuum Beam</b><br>Gains power by using solar energy as source and concentrates a large amount of air to create a massive blast. Inflicts internal injury status for 5 turns.",
							"action": "attack",
							"animation": "attack_08",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 6
								}
							]
						}
					]
				},
				"pet117": {
					"id": "117",
					"name": "Gold Clown Dragon (II)",
					"description": "Gold Clown Dragon (II)",
					"swfName": "pet_117",
					"clsName": "Pet_117",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Hypnotic Gust",
							"description": "<b>Hypnotic Gust</b><br>Creates a powerful spinning wind to decrease the target’s battle efficiency.Reduces critical chance, dodge chance, combustion chance, purify chance and reactive force chance of target by 7% for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_disoriented",
									"duration": 3,
									"amount": 7
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 13,
							"target": "master",
							"name": "Energy Guardian",
							"description": "<b>Energy Guardian</b><br>Marks the master with cross seal that helps reduce chakra consumption. Reduces master’s CP consumption when using skills by 10% for 4 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_save_cp",
									"duration": 5,
									"amount": 10
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "S Strike",
							"description": "<b>S Strike</b><br>A high-speed downward attack that renders the target incapacitated. Weakens the target for 2 turns (5% damage reduction).",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_weaken",
									"duration": 3,
									"amount": 8
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Burning Passion",
							"description": "<b>Burning Passion</b><br>Rekindles the master’s inner fire to increase damage output. Increases master’s damage by 10% for 2 turns.",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 10
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Flash Spark",
							"description": "<b>Flash Spark</b><br>A heavy attack of electrical surge that creates a blinding light. Blinds the target for 2 turns (10% accuracy reduction).",
							"action": "attack",
							"animation": "attack_07",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_blind",
									"duration": 3,
									"amount": 10
								}
							]
						}
					]
				},
				"pet118": {
					"id": "118",
					"name": "Jade Cosmic Dragon(III)",
					"description": "Jade Cosmic Dragon(III)",
					"swfName": "pet_118",
					"clsName": "Pet_118",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 6,
							"target": "master",
							"name": "Echo Vibration",
							"description": "<b>Echo Vibration</b><br>Sends out a high frequency sound that coats the master and echoes back damage. Applies serene mind buff for 1 turn.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "serene_mind",
									"duration": 2
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "master",
							"name": "Dispel Magic",
							"description": "<b>Dispel Magic</b><br>Clears any harmful magic to the master by using absorbing it. Heals 6% of master's max HP and removes all negative status.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bloodlust_dedication",
									"amount": 6
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Tempest Enchantment",
							"description": "<b>Tempest Enchantment</b><br>Strengthens the master's physical abilities by using wind force. Increases damage by 13% for 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus", // "damage_bonus",
									"duration": 3,
									"amount": 13
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 9,
							"target": "",
							"name": "Thunder Tail Lash",
							"description": "<b>Thunder Tail Lash</b><br>A high speed attack that strikes the target using its tail fused with electricity. Drains 15% CP to the target and transfer it to the master.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_cp",
									"amount": 15
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Vampiric Laceration",
							"description": "<b>Vampiric Laceration</b><br>Absorbs the target's life force by performing a powerful bite. Drains 7% HP to the target and transfer it to the master.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_hp",
									"amount": 7
								}
							]
						}
					]
				},
				"pet119": {
					"id": "119",
					"name": "Sakura Tori",
					"description": "Sakura Tori",
					"swfName": "pet_119",
					"clsName": "Pet_119",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1.5,
							"cooldown": 5,
							"target": "",
							"name": "Crazy Peck",
							"description": "<b>Crazy Peck</b><br>Sakura Tori 's madly attack in a high speed.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 6,
							"target": "master",
							"name": "Sakura Rain",
							"description": "<b>Sakura Rain</b><br>Increase master's accuracy by 10% for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_attention",
									"duration": 2,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Sakura Tornado",
							"description": "<b>Sakura Tornado</b><br>Tornado is formed by spinning rapidly to inflict chaos on target. (cannot control character and use jutsu) (2 turn)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Air Blast",
							"description": "<b>Air Blast</b><br>Swiftly impact on the target to produce explosion to reduce 5% target's Attack Damage (3 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 4,
									"amount": 5
								}]
						}]
				},
				"pet121": {
					"id": "121",
					"name": "Ace Striker",
					"description": "Ace Striker",
					"swfName": "pet_121",
					"clsName": "Pet_121",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 0,
					"support_rate": 0,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Red Card",
							"description": "<b>Red Card</b><br>Prevents the target from using skills with the power of the red card. Restricts the target for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Dual Tearing Slash",
							"description": "<b>Dual Tearing Slash</b><br>A consecutive claw strike that disables the target's attack ability. Prevents the target from using weapon attack for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dismantle",
									"duration": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Obnoxious Call",
							"description": "<b>Obnoxious Call</b><br>A surprise attack from behind that always caught the target off guard. Weakens the target's damage by 15% for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 9,
							"target": "",
							"name": "Ace Shot",
							"description": "<b>Ace Shot</b><br>A devastating shot that crushes the target's awareness. Inflicts chaos status for 1 turn.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 2
								}]
						}]
				},
				"pet122": {
					"id": "122",
					"name": "Golden Skeletal Dragon(III)",
					"description": "Golden Skeletal Dragon(III)",
					"swfName": "pet_122",
					"clsName": "Pet_122",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Light Vein",
							"description": "<b>Light Vein</b><br>Sends out multiple light rays to reduce the target's vision. Blinds the target for 2 turns. (15% accuracy reduction)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_blind",
									"duration": 3,
									"amount": 15
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Cleansing Wind",
							"description": "<b>Cleansing Wind</b><br>Blows out a purifying wind to aid the master. Removes all negative status to the master.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "purify"
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Cursed Breath",
							"description": "<b>Cursed Breath</b><br>Conjures evil energy to attack the target. Reduce 15% target's dodge rate (2 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "dodge_reduction",
									"duration": 3,
									"amount": 15
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Heaven's Guidance",
							"description": "<b>Heaven's Guidance</b><br>Calls upon the power of the heavens to help in battle. Has a 50% chance to cast 'Debuff Resist' to the master for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 3,
									"amount": 50
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 13,
							"target": "master",
							"name": "Fiery Will",
							"description": "<b>Fiery Will</b><br>Boosts the master's will by igniting its sleeping potential. Completely blocks all incoming damage to the master for 2 turns",
							"action": "special",
							"animation": "attack_06",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "guard", // "complete_guard",
									"duration": 3
								}
							]
						}
					]
				},
				"pet123": {
					"id": "123",
					"name": "Daruma Family",
					"description": "Daruma Family",
					"swfName": "pet_123",
					"clsName": "Pet_123",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Shield Wall",
							"description": "<b>Shield Wall</b><br>Creates a magic barrier to protect the master. Increases master's defense by 10% for 3 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_reduction",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Damage Boost",
							"description": "<b>Damage Boost</b><br>Inspires the master through magic. Increases master's damage by 5% for 6 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 7,
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Treat Wounds",
							"description": "<b>Treat Wounds</b><br>Casts a rejuvenation spell to heal the master. Recovers 8% of the master's max HP for 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 8
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Tower Slam",
							"description": "<b>Tower Slam</b><br>A full body assault. Reduces critical chance, dodge chance, combustion chance, purify chance and reactive force chance of target by 6% for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 3,
									"amount": 6
								}]
						}]
				},
				"pet124": {
					"id": "124",
					"name": "Blue Cybot",
					"description": "Blue Cybot",
					"swfName": "pet_124",
					"clsName": "Pet_124",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.3,
							"cooldown": 9,
							"target": "",
							"name": "Buster Drive",
							"description": "<b>Buster Drive</b><br>Increase target's 1 random skill cooldown for 1 extra turn.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0.5,
							"cooldown": 12,
							"target": "",
							"name": "Kinetic Cog",
							"description": "<b>Kinetic Cog</b><br>Reduces target's CP by 7%.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp",
									"amount": 7
								}]
						}]
				},
				"pet125": {
					"id": "125",
					"name": "Chibi Tyrannzord",
					"description": "Chibi Tyrannzord",
					"swfName": "pet_125",
					"clsName": "Pet_125",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 9,
							"target": "",
							"name": "Deep Bite ",
							"description": "<b>Deep Bite </b><br>Inflicts 15% bleeding status for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "self",
							"name": "Anger",
							"description": "<b>Anger</b><br>Increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (2 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Mega beam",
							"description": "<b>Mega beam</b><br>Inflicts blind status for 1 turn. (10% accuracy reduction)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "blind",
									"duration": 2,
									"amount": 10
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 15,
							"target": "master",
							"name": "Zord power",
							"description": "<b>Zord power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 4% for 3 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 4,
									"amount": 4
								}]
						}]
				},
				"pet126": {
					"id": "126",
					"name": "Chibi Tricerzord",
					"description": "Chibi Tricerzord",
					"swfName": "pet_126",
					"clsName": "Pet_126",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Tricer protection",
							"description": "<b>Tricer protection</b><br>Reducing 10% damage to master for 3 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_reduction",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord power",
							"description": "<b>Zord power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 4% for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 3,
									"amount": 4
								}]
						}]
				},
				"pet127": {
					"id": "127",
					"name": "Chibi Sabertooth Tigerzord",
					"description": "Chibi Sabertooth Tigerzord",
					"swfName": "pet_127",
					"clsName": "Pet_127",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.4,
							"cooldown": 8,
							"target": "",
							"name": "Crab",
							"description": "<b>Crab</b><br>Inflicts 10% bleeding status for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord Power",
							"description": "<b>Zord Power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 4% for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 3,
									"amount": 4
								}]
						}]
				},
				"pet128": {
					"id": "128",
					"name": "Chibi Mastodonzord",
					"description": "Chibi Mastodonzord",
					"swfName": "pet_128",
					"clsName": "Pet_128",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Canon Machine Gun",
							"description": "<b>Canon Machine Gun</b><br>Stun 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord Power",
							"description": "<b>Zord Power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 4% for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 3,
									"amount": 4
								}]
						}]
				},
				"pet129": {
					"id": "129",
					"name": "Chibi Pterodactylzord",
					"description": "Chibi Pterodactylzord",
					"swfName": "pet_129",
					"clsName": "Pet_129",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Metor Missiles",
							"description": "<b>Metor Missiles</b><br>Reduce target's 4% hp for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 4
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord Power",
							"description": "<b>Zord Power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 4% for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 3,
									"amount": 4
								}]
						}]
				},
				"pet130": {
					"id": "130",
					"name": "Gold Cybot",
					"description": "Gold Cybot",
					"swfName": "pet_130",
					"clsName": "Pet_130",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Energize!",
							"description": "<b>Energize!</b><br>Increases master's attack damage by 10% for 2 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Kinetic Cog",
							"description": "<b>Kinetic Cog</b><br>Reduces target's CP by 8%.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp",
									"amount": 8
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "",
							"name": "Buster Drive",
							"description": "<b>Buster Drive</b><br>Increase target's 1 random skill cooldown for 2 extra turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 14,
							"target": "master",
							"name": "Tronic filling",
							"description": "<b>Tronic filling</b><br>Removes all negative status to the master.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {"type": "purify"}]
						}]
				},
				"pet131": {
					"id": "131",
					"name": "Sanbi",
					"description": "Sanbi",
					"swfName": "pet_131",
					"clsName": "Pet_131",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 6500,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Aqua Bash",
							"description": "<b>Aqua Bash</b><br>Drain 1% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 1
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Water Guardian",
							"description": "<b>Water Guardian</b><br>Guard master and reduce master's damage taken by 100% (1 turn)",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard", // "complete_guard",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Secret: The Mist",
							"description": "<b>Secret: The Mist</b><br>75% chance to resist negative status (3 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_debuff_resist",
									"duration": 4,
									"amount": 75
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Secret: Water Explosive",
							"description": "<b>Secret: Water Explosive</b><br>Applies 'Restriction' to the target for 3 turns",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 4
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Ocean Armor",
							"description": "<b>Ocean Armor</b><br>Increase master's attack damage by 25% and critical chance by 25%. (2 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "battle_bunny_frenzy",
									"duration": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0.5,
							"cooldown": 13,
							"target": "",
							"name": "Secret: Darkness Ball",
							"description": "<b>Secret: Darkness Ball</b><br>Blows out a darkness ball from its mouth. Reduce target's HP & CP by 10%",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 10
								}]
						}]
				},
				"pet132": {
					"id": "132",
					"name": "Chibi Intel Tricerzord",
					"description": "Chibi Intel Tricerzord",
					"swfName": "pet_132",
					"clsName": "Pet_132",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Tricer Protection",
							"description": "<b>Tricer Protection</b><br>Reducing 10% damage to master for 3 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_reduction",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord power",
							"description": "<b>Zord power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 5% for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 4,
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Rejuvenation",
							"description": "<b>Rejuvenation</b><br>Heals 5% of master's HP.(2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 13,
							"target": "master",
							"name": "Intel Shield",
							"description": "<b>Intel Shield</b><br>Guards its master from all attacks for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard",
									"duration": 3
								}]
						}]
				},
				"pet133": {
					"id": "133",
					"name": "Chibi Intel Sabertooth Tigerzord",
					"description": "Chibi Intel Sabertooth Tigerzord",
					"swfName": "pet_133",
					"clsName": "Pet_133",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.5,
							"cooldown": 8,
							"target": "",
							"name": "Crab",
							"description": "<b>Crab</b><br>Inflicts 10% bleeding status for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord Power",
							"description": "<b>Zord Power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 5% for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 4,
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Battery Charge",
							"description": "<b>Battery Charge</b><br>Increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (5 turns) ",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 6
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2.1,
							"cooldown": 6,
							"target": "",
							"name": "Thunder Pounce",
							"description": "<b>Thunder Pounce</b><br>Electrocutes the target with powerful lightning strikes.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}]
				},
				"pet134": {
					"id": "134",
					"name": "Chibi Intel Mastodonzord",
					"description": "Chibi Intel Mastodonzord",
					"swfName": "pet_134",
					"clsName": "Pet_134",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Canon Machine Gun",
							"description": "<b>Canon Machine Gun</b><br>Stun 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord Power",
							"description": "<b>Zord Power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 5% for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 4,
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0.5,
							"cooldown": 9,
							"target": "",
							"name": "Torrential Blast",
							"description": "<b>Torrential Blast</b><br>Blinds the target for 3 turns. (10% accuracy reduction)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_blind",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0.5,
							"cooldown": 10,
							"target": "",
							"name": "Slipstream",
							"description": "<b>Slipstream</b><br>Reduces target's dodge by 10% for 3 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dodge_reduction",
									"duration": 4,
									"amount": 10
								}]
						}]
				},
				"pet135": {
					"id": "135",
					"name": "Chibi Intel Pterodactylzord",
					"description": "Chibi Intel Pterodactylzord",
					"swfName": "pet_135",
					"clsName": "Pet_135",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Metor Missiles",
							"description": "<b>Metor Missiles</b><br>Reduce target's 4% hp for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 4
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord Power",
							"description": "<b>Zord Power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 5% for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 4,
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0.4,
							"cooldown": 11,
							"target": "",
							"name": "Energy Siphon",
							"description": "<b>Energy Siphon</b><br>Drains 6% of the target's HP and recover it to its master.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 6
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Flutter of Negation",
							"description": "<b>Flutter of Negation</b><br>Removes all negative effects of its master.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {"type": "purify"}]
						}]
				},
				"pet136": {
					"id": "136",
					"name": "Chibi Intel Tyrannzord",
					"description": "Chibi Intel Tyrannzord",
					"swfName": "pet_136",
					"clsName": "Pet_136",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.6,
							"cooldown": 9,
							"target": "",
							"name": "Deep Bite",
							"description": "<b>Deep Bite</b><br>Inflicts 15% bleeding status for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 4,
									"amount": 15
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "self",
							"name": "Anger",
							"description": "<b>Anger</b><br>Increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (4 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Mega beam",
							"description": "<b>Mega beam</b><br>Inflicts blind status for 2 turns. (10% accuracy reduction)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "blind",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Zord power",
							"description": "<b>Zord power</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 5% for 3 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 4,
									"amount": 5
								}]
						}]
				},
				"pet137": {
					"id": "137",
					"name": "Snow Wolf",
					"description": "Snow Wolf",
					"swfName": "pet_137",
					"clsName": "Pet_137",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1111,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "",
							"name": "Wag Tail",
							"description": "<b>Wag Tail</b><br>Summons a snowstorm.Applies 'Sleep' to the target for 2 turns. ",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "random_sleep",
									"duration": 3,
									"chance": 100
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Storm Howlring",
							"description": "<b>Storm Howlring</b><br>Sends out a howling wave.Increase master's attack damage 10% for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Ice Wall",
							"description": "<b>Ice Wall</b><br>Creates an 'Ice Dome' to protect its master. Reduce master's damage taken by 15%. (3 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "damage_reduction",
									"duration": 4,
									"amount": 15
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 11,
							"target": "",
							"name": "Geyser Shooting",
							"description": "<b>Geyser Shooting</b><br>Shoots out a powerful geyser disable target from attacking with weapons 3 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dismantle",
									"duration": 4
								}]
						}]
				},
				"pet138": {
					"id": "138",
					"name": "Christmas Dragon (III)",
					"description": "Christmas Dragon (III)",
					"swfName": "pet_138",
					"clsName": "Pet_138",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack.",
							"description": "<b>Basic attack.</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Golden Star Shooting",
							"description": "<b>Golden Star Shooting</b><br>Shoots out a golden star to stun target for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 2
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Rainbow Beam",
							"description": "<b>Rainbow Beam</b><br>Fires a rainbow beam. Reduce target's HP & CP by 7%",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp_hp",
									"amount": 7
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0.4,
							"cooldown": 9,
							"target": "",
							"name": "Bunky Gift Box",
							"description": "<b>Bunky Gift Box</b><br>Throws out a 'Jack in the Box'. Applies 'Restriction' to the target for 2 turns. ",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bundle",
									"duration": 3
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 11,
							"target": "",
							"name": "Snow Prison",
							"description": "<b>Snow Prison</b><br>Conjures an 'Ice Barrier' to freeze the target. Inflicts frozen status for 2 turns. (Frozen target cannot move but damage taken is reduced by 80%)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_freeze",
									"duration": 3,
									"chance": 100
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Frozen Wish",
							"description": "<b>Frozen Wish</b><br>Uses the power of snow to empower its master. Increase master's attack damage by 15% for 2 turns.",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus",
									"duration": 3,
									"amount": 15
								}
							]
						}
					]
				},
				"pet139": {
					"id": "139",
					"name": "Kagami Mochi",
					"description": "Kagami Mochi",
					"swfName": "pet_139",
					"clsName": "Pet_139",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.3,
							"cooldown": 7,
							"target": "",
							"name": "Aroma Gust",
							"description": "<b>Aroma Gust</b><br>Uses its fan to send out a powerful aroma. Inflicts 13% 'Bleeding' status for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 13
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0.4,
							"cooldown": 8,
							"target": "",
							"name": "Ricecake Throw",
							"description": "<b>Ricecake Throw</b><br>Throws mochi to hinder the target. Reduces damage by 80% for 1 turn.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 2,
									"amount": 80
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Orange Blessing",
							"description": "<b>Orange Blessing</b><br>Conjures the power of its plum to protect its master. Reduces damage taken by 25% for 3 turns",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_reduction",
									"duration": 4,
									"amount": 25
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0.2,
							"cooldown": 11,
							"target": "",
							"name": "Flying Glide",
							"description": "<b>Flying Glide</b><br>Rides a strong Glide Fan current to knock the target and tries remove the positive status of the target. (35% chance)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 35
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0.3,
							"cooldown": 10,
							"target": "",
							"name": "Batter Gush",
							"description": "<b>Batter Gush</b><br>Transforms into liquid form and stuns the target for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}]
				},
				"pet140": {
					"id": "140",
					"name": "White Dragon (II)",
					"description": "White Dragon (II)",
					"swfName": "pet_140",
					"clsName": "Pet_140",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 5,
							"target": "",
							"name": "Small Firecrackers",
							"description": "<b>Small Firecrackers</b><br>Tosses a miniature bomb that incinerates the target. Burns target HP by 1% for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 3,
									"amount": 1
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.4,
							"cooldown": 8,
							"target": "",
							"name": "Rotate Firecrackers",
							"description": "<b>Rotate Firecrackers</b><br>Hurls a miniature bomb that produces intense light. Blinds target by 10% for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "blind",
									"duration": 3,
									"amount": 10
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0.2,
							"cooldown": 7,
							"target": "",
							"name": "Firework",
							"description": "<b>Firework</b><br>Shoot outs a firework that continuouly burns. Burns target HP by 3% for 1 turn.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 2,
									"amount": 3
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Happy New Year",
							"description": "<b>Happy New Year</b><br>Set ups a beautiful firework that shoots upward to motivate its master. Increase critical, dodge, combustion, purify & reactive force chance by 3% for 5 turns",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_energize",
									"duration": 6,
									"amount": 3
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0.3,
							"cooldown": 11,
							"target": "",
							"name": "New Year Big Cannon",
							"description": "<b>New Year Big Cannon</b><br>Brings out its ultimate firework to bring forth destruction. Burns target HP by 5% for 1 turn.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 2,
									"amount": 5
								}
							]
						}
					]
				},
				"pet141": {
					"id": "141",
					"name": "Nibi",
					"description": "Nibi",
					"swfName": "pet_141",
					"clsName": "Pet_141",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 6500,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.2,
							"cooldown": 0,
							"target": "",
							"name": "Spirit Slash",
							"description": "<b>Spirit Slash</b><br>Lashes the target using its powerful tails. Reduce target's HP & CP by 1.5%",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 1.5
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 5,
							"target": "master",
							"name": "Secret: Nekomata Torii",
							"description": "<b>Secret: Nekomata Torii</b><br>Protects its master by conjuring a magical gate. Applies 'Guard' status for 1 turn.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard", // "complete_guard",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Secret: Counterforce Barrier",
							"description": "<b>Secret: Counterforce Barrier</b><br>Forms up a barrier with its tails to reflect incoming damage. Applies 'Serene Mind' status for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "serene_mind",
									"duration": 2
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0.4,
							"cooldown": 8,
							"target": "",
							"name": "Secret: Black Coffin",
							"description": "<b>Secret: Black Coffin</b><br>Materializes a box of dark energy to raze the target. Inflicts 'Chaos' status for 2 turns. ",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Dark Heretic Armor",
							"description": "<b>Dark Heretic Armor</b><br>Nibi transforms into pure energy and empower its master. Increases damage & critical chance by 20%. Ignores 20% of target's dodge rate for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_lightning",
									"duration": 3,
									"amount": 20
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Secret: Soul Liberation",
							"description": "<b>Secret: Soul Liberation</b><br>Nibi achieves its ultimate technique after creating an unbreakable bond to its master. Heals 10% of master's HP and remove all negative status effect.",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bloodlust_dedication",
									"amount": 10
								}]
						}]
				},
				"pet142": {
					"id": "142",
					"name": "Chocolate Dragon Egg (I)",
					"description": "Chocolate Dragon Egg (I)",
					"swfName": "pet_142",
					"clsName": "Pet_142",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Bite",
							"description": "<b>Bite</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 8,
							"target": "",
							"name": "Glaze Fire",
							"description": "<b>Glaze Fire</b><br>Spews out fire to glaze the target. Burns target HP by 5% for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burning",
									"duration": 2,
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 7,
							"target": "",
							"name": "Essence Breath",
							"description": "<b>Essence Breath</b><br>Expels large quantity of its own natural essence to the target. Reduces target CP by 7%.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp",
									"amount": 7
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0.3,
							"cooldown": 9,
							"target": "",
							"name": "Cocoa Egg Roll",
							"description": "<b>Cocoa Egg Roll</b><br>Encloses itself inside its egg shell to attack. Stuns the target for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Chocolate Barricade",
							"description": "<b>Chocolate Barricade</b><br>Creates a chocolate wall to reduce incoming damage. Reduces damage taken by 10% for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"duration": 3,
									"amount": 10
								}
							]
						}
					]
				},
				"pet143": {
					"id": "143",
					"name": "Rose Dragon (III)",
					"description": "Rose Dragon (III)",
					"swfName": "pet_143",
					"clsName": "Pet_143",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Bite",
							"description": "<b>Bite</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.3,
							"cooldown": 8,
							"target": "",
							"name": "Rose Tornado",
							"description": "<b>Rose Tornado</b><br>Exhales powerful wind to purge the target. 35% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 35
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 6,
							"target": "master",
							"name": "Vine Shield",
							"description": "<b>Vine Shield</b><br>Summons thick vines to protect its master. Guards the target for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "guard", // "complete_guard",
									"duration": 3
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0.2,
							"cooldown": 10,
							"target": "",
							"name": "Hail of Thorns",
							"description": "<b>Hail of Thorns</b><br>Sprouts a gigantic rose vine to shoot thorns to the target. Inflicts ‘Bleeding’ status for 3 turns, 30% damage taken increase.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bleeding",
									"duration": 4,
									"amount": 30
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0.5,
							"cooldown": 11,
							"target": "",
							"name": "Wild Grip",
							"description": "<b>Wild Grip</b><br>Constricts the target using a thorny vine. Restricts target for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bundle",
									"duration": 3
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0.5,
							"cooldown": 12,
							"target": "",
							"name": "Rampant Rage",
							"description": "<b>Rampant Rage</b><br>Unleashes its wild state and strikes the target with huge sharp biotic vines. Drains 7% of the target’s HP and recover it to its master.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_hp",
									"amount": 7
								}
							]
						}
					]
				},
				"pet144": {
					"id": "144",
					"name": "Origami Butterfly",
					"description": "Origami Butterfly",
					"swfName": "pet_144",
					"clsName": "Pet_144",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1111111,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0.2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Sakura Rain",
							"description": "<b>Sakura Rain</b><br>Releases healing pollen to restore 5% of master's HP for 1 turn.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 2,
									"amount": 5
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Fortify",
							"description": "<b>Fortify</b><br>Creates a wall of butterfly illusion to reduce incoming damage by 15% for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_reduction",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0.5,
							"cooldown": 12,
							"target": "",
							"name": "Dazzling Dance",
							"description": "<b>Dazzling Dance</b><br>Performs a magical dance that stuns target for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Invigorating Dance",
							"description": "<b>Invigorating Dance</b><br>Performs a battle dance to increase master's damage by 15% for 3 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 15
								}]
						}]
				},
				"pet145": {
					"id": "145",
					"name": "Little Sleipnir",
					"description": "Little Sleipnir",
					"swfName": "pet_145",
					"clsName": "Pet_145",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0.3,
							"cooldown": 5,
							"target": "",
							"name": "Black Tornado",
							"description": "<b>Black Tornado</b><br>Evoke black tornado tears to bleeding 10% for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0.3,
							"cooldown": 8,
							"target": "",
							"name": "Thunderstruck",
							"description": "<b>Thunderstruck</b><br>Fall Large thunder to weaken target by 10% for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0.2,
							"cooldown": 8,
							"target": "",
							"name": "Smoggy",
							"description": "<b>Smoggy</b><br>Raise smog to hinder vision, blind target 100% for 1 turn.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "blind",
									"duration": 2,
									"amount": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Wind Wall",
							"description": "<b>Wind Wall</b><br>Create wind wall to protect master, reduce incoming damage by 20% for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_reduction",
									"duration": 3,
									"amount": 20
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0.4,
							"cooldown": 10,
							"target": "",
							"name": "Meteor Dash",
							"description": "<b>Meteor Dash</b><br>Sprint as meteor to attack target, reduce target's HP & CP by 6%.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 6
								}]
						}]
				},
				"pet146": {
					"id": "146",
					"name": "Ichibi",
					"description": "Ichibi",
					"swfName": "pet_146",
					"clsName": "Pet_146",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 6500,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1.8,
							"cooldown": 0,
							"target": "",
							"name": "Flash Thorn",
							"description": "<b>Flash Thorn</b><br>A quick strike to the core to make the target more susceptible to attacks. Inflicts 25% 'Bleeding' status for 1 turn.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 2,
									"amount": 25
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 2,
							"target": "",
							"name": "Splinter Clash",
							"description": "<b>Splinter Clash</b><br>Bombards the target using its armor as projectiles to deal continuous damage. Restricts target for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 8,
							"target": "master",
							"name": "Super Recover",
							"description": "<b>Super Recover</b><br>Ichibi releases the stored energy from its orb to heal 8% of its master's max HP and remove all negative status.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bloodlust_dedication",
									"amount": 8
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Holy Lance",
							"description": "<b>Holy Lance</b><br>Impales the target with a spearhead made of crystals that ignites in flight. Has 45% chance to remove all target's positive status.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 45
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Holy Shield",
							"description": "<b>Holy Shield</b><br>Ichibi flourishes its armor with radiance to completely guard its master for 1 turn.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard", // "complete_guard",
									"duration": 2
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 3,
							"cooldown": 11,
							"target": "",
							"name": "Excalibur",
							"description": "<b>Excalibur</b><br>Executes the target by bringing out its ultimate attack by combining both its armor, forming up a giant sword-projectile infused with thunder. Stuns the target for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}]
				},
				"pet147": {
					"id": "147",
					"name": "Tanuki",
					"description": "Tanuki",
					"swfName": "pet_147",
					"clsName": "Pet_147",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Amazing Drums",
							"description": "<b>Amazing Drums</b><br>Removes all negative status to the master.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {"type": "purify"}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Fairy Wine",
							"description": "<b>Fairy Wine</b><br>Increase master's attack damage by 15% (3 turns).",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 15
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Teapot Transfiguration",
							"description": "<b>Teapot Transfiguration</b><br>Hallucinate target with ecstatic sound to restrict target and reduce attack damage by 100% for 2 turns",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "ecstatic_sound",
									"duration": 3,
									"amount": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Tanuki Strange Noise",
							"description": "<b>Tanuki Strange Noise</b><br>Inflicts 'Chaos' status for 1 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 2
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Triple Tanuki",
							"description": "<b>Triple Tanuki</b><br>Inflicts 20% 'Bleeding' status for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 20
								}]
						}]
				},
				"pet148": {
					"id": "148",
					"name": "Mini Taiko",
					"description": "Mini Taiko",
					"swfName": "pet_148",
					"clsName": "Pet_148",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Sound of Sorrow",
							"description": "<b>Sound of Sorrow</b><br>Channels all the suffering and agony on its surrounding. Inflicts 'Chaos' status for 2 turns. ",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Invigorating Tune!",
							"description": "<b>Invigorating Tune!</b><br>Inspires its master with an upbeat tune. Increases master's attack damage by 15% for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 15
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Aimed Melody",
							"description": "<b>Aimed Melody</b><br>Makes a target vulnerable by dedicating it a certain music. Increases target's damage taken by 25% for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 25
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Ultimate Ensemble",
							"description": "<b>Ultimate Ensemble</b><br>Performs its most spectacular piece. Has a 100% chance to cast 'Debuff Resist' to the master for 1 turn.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_debuff_resist",
									"duration": 2,
									"chance": 100
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "all",
							"name": "Taiko Earthquake",
							"description": "<b>Taiko Earthquake</b><br>Keep hitting the taiko and earn energy and create earthquake attack target. Reduces critical chance, dodge chance, combustion chance, purify chance and reactive force chance of target by 5% for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee4",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 3,
									"amount": 5
								}]
						}]
				},
				"pet149": {
					"id": "149",
					"name": "Inari Fox",
					"description": "Inari Fox",
					"swfName": "pet_149",
					"clsName": "Pet_149",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 4,
							"target": "",
							"name": "Fox Beat",
							"description": "<b>Fox Beat</b><br>Attacks the target with fury using its hind legs. Blinds the target for 2 turn (10% accuracy reduction).",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_blind",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Foxfire",
							"description": "<b>Foxfire</b><br>Purifies its master using Fairy Fire. Remove all negative effects on master.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {"type": "purify"}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Leaping Assault",
							"description": "<b>Leaping Assault</b><br>Attacks the target with body strike. Stuns target for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Fox Reincarnation",
							"description": "<b>Fox Reincarnation</b><br>Inject fox's soul to master. Recover Master's 7% HP.(2 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 7
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Giant Technique",
							"description": "<b>Giant Technique</b><br>Become a giant fox attack target. Increase target's 1 random skill cooldown for 2 extra turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee4",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 2
								}]
						}]
				},
				"pet150": {
					"id": "150",
					"name": "Takoyaki Master",
					"description": "Takoyaki Master",
					"swfName": "pet_150",
					"clsName": "Pet_150",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 5,
							"target": "",
							"name": "Tentacle Combo",
							"description": "<b>Tentacle Combo</b><br>A fierce combination attack using its very strong tentacles. Inflicts internal injury status for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Takoyaki Recover",
							"description": "<b>Takoyaki Recover</b><br>Gives its master a very tasty takoyaki! Recovers 1% of the master's max HP for 10 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 11,
									"amount": 1
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Devastating Cyclone",
							"description": "<b>Devastating Cyclone</b><br>Assaults the target while spinning with unparalleled speed. Drain 4% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 4
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Ink Prison",
							"description": "<b>Ink Prison</b><br>Confines the target with its magical ink. Reduce target HP & CP by 2% and stun target for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "coilding_wave",
									"duration": 3,
									"amount": 2
								}]
						}]
				},
				"pet151": {
					"id": "151",
					"name": "Six Head Dragon (III)",
					"description": "Six Head Dragon (III)",
					"swfName": "pet_151",
					"clsName": "Pet_151",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 6,
							"target": "",
							"name": "Lava Meteor",
							"description": "<b>Lava Meteor</b><br>Launches a molten boulder with great force. 'Stuns' the target for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Glacial Immunity",
							"description": "<b>Glacial Immunity</b><br>Creates a protective layer of ice to its master. Has 60% chance to cast 'Debuff Resist' status for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 4,
									"amount": 60
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Floral Boon",
							"description": "<b>Floral Boon</b><br>Harnesses the power of the earth. Heals 5% of master's max HP for 3 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 4,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Positive Discharge",
							"description": "<b>Positive Discharge</b><br>Sends out a powerful electric dischage to purge all positive status to the target. Has 50% chance to remove all positive status.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 50
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 12,
							"target": "",
							"name": "Void Barrage",
							"description": "<b>Void Barrage</b><br>Fires a barrage of dark energy to debilitate its target. Reduces target's critical, dodge, combustion, purify and reactive force chance by 12% for 3 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_disoriented",
									"duration": 4,
									"amount": 12
								}
							]
						}
					]
				},
				"pet152": {
					"id": "152",
					"name": "Flare Dragon (III)",
					"description": "Flare Dragon (III)",
					"swfName": "pet_152",
					"clsName": "Pet_152",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Radiant Barrier",
							"description": "<b>Radiant Barrier</b><br>Reduce 20% damage to master. (3 turns)",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "damage_reduction",
									"duration": 4,
									"amount": 20
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Celestial Blessing",
							"description": "<b>Celestial Blessing</b><br>Recover Master's 5% HP.(1 turn)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 2,
									"amount": 5
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 15,
							"target": "",
							"name": "Light Resonance",
							"description": "<b>Light Resonance</b><br>Applies 'Sleep' to the target for 3 turns. ",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "sleep",
									"duration": 4
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Luminescence",
							"description": "<b>Luminescence</b><br>Restore 5% of master's HP for 3 turn.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 4,
									"amount": 5
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 12,
							"target": "",
							"name": "Zenith Solar Wave",
							"description": "<b>Zenith Solar Wave</b><br>Stuns target for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						}
					]
				},
				"pet153": {
					"id": "153",
					"name": "Shadow Dragon (III)",
					"description": "Shadow Dragon (III)",
					"swfName": "pet_153",
					"clsName": "Pet_153",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Nether Breath",
							"description": "<b>Nether Breath</b><br>Burns target HP by 10% for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 2,
									"amount": 10
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Black Tower",
							"description": "<b>Black Tower</b><br>Has 100% chance to cast 'Debuff Resist' status for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 2,
									"amount": 100
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 6,
							"target": "",
							"name": "Floating Strike",
							"description": "<b>Floating Strike</b><br>Drain 3% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_hp",
									"amount": 3
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Dark Blaze",
							"description": "<b>Dark Blaze</b><br>Increase master's attack damage by 15% (3 turns).",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 15
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Void Dragon Assault",
							"description": "<b>Void Dragon Assault</b><br>Drain 8%HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_hp",
									"amount": 8
								}
							]
						}
					]
				},
				"pet154": {
					"id": "154",
					"name": "Mini Pumpkin",
					"description": "Mini Pumpkin",
					"swfName": "pet_154",
					"clsName": "Pet_154",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 11,
							"target": "",
							"name": "bleed",
							"description": "<b>bleed</b><br>Inflicts ‘Bleeding’ status for 3 turns, 20% damage taken increase.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 4,
									"amount": 20,
									"chance": 100
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "BURNING",
							"description": "<b>BURNING</b><br>Spews out fire to glaze the target. Burns target HP by 5% for 2 turn.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 15,
							"target": "master",
							"name": "ENERGIZE",
							"description": "<b>ENERGIZE</b><br>Set ups a beautiful firework that shoots upward to motivate its master. Increase critical, dodge, combustion, purify & reactive force chance by 10% for 3 turns",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "CHAOS",
							"description": "<b>CHAOS</b><br>produce chaos(2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}]

				},
				"pet155": {
					"id": "155",
					"name": "Mini Treefolk",
					"description": "Mini Treefolk",
					"swfName": "pet_155",
					"clsName": "Pet_155",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "basic attack",
							"description": "<b>basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 11,
							"target": "",
							"name": "BLIND",
							"description": "<b>BLIND</b><br>Decrease hit rate by 20%, lasts for 3 turns",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "blind",
									"duration": 4,
									"amount": 20
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "RANDOM EFFECT to master",
							"description": "<b>RANDOM EFFECT to master</b><br>Add random effect on master (Heal or Strengthen or Protection) for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_random_effect_on_master",
									"EffectArray": [ {
											"id": 1,
											// "chance": 0,
											"type": "pet_heal",
											"amount": 2,
											"duration": 4
										}, {
											"id": 2,
											// "chance": 0.33,
											"type": "pet_damage_bonus",
											"amount": 5,
											"duration": 4
										}, {
											"id": 3,
											// "chance": 0.66,
											"type": "pet_damage_reduction",
											"amount": 10,
											"duration": 4
										}]
								}]
							// [ {"type": "no effect"}]
							// [ {
							// "type": "pet_random_effect_on_master",
							// "duration": 4
							// }]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 15,
							"target": "",
							"name": "RANDOM EFFECT to defender",
							"description": "<b>RANDOM EFFECT to defender</b><br>Add random effect on defender (Stun or Poison or Burn) for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_random_effect_on_defender",
									"EffectArray": [ {
											"id": 1,
											"isDebuff": 1,
											// "chance": 0,
											"type": "stun",
											"duration": 3
										}, {
											"id": 2,
											"isDebuff": 1,
											// "chance": 0.33,
											"type": "poison",
											"duration": 3,
											"amount": 5
										}, {
											"id": 3,
											"isDebuff": 1,
											// "chance": 0.66,
											"type": "pet_burn",
											"duration": 3,
											"amount": 5
										}]
								}]
							// [ {"type": "no effect"}]
							// [ {
							// "type": "pet_random_effect_on_defender",
							// "duration": 3
							// }]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "HEAL",
							"description": "<b>HEAL</b><br>Recover master 10% HP, 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 10
								}]
						}]
				},
				"pet156": {
					"id": "156",
					"name": "Mini Wishing Tree",
					"description": "Mini Wishing Tree",
					"swfName": "pet_156",
					"clsName": "Pet_156",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 21,
							"target": "master",
							"name": "Wishing Leaves",
							"description": "<b>Wishing Leaves</b><br>Recover master 1% HP for 20 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 21,
									"amount": 1
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Gold Fall",
							"description": "<b>Gold Fall</b><br>Reduce target's 25% damage. (for 2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 3,
									"amount": 25
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Token Throw",
							"description": "<b>Token Throw</b><br>Dizzy condition occurs and stun target (1 turn).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 2
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Secret Scroll of Wisdom",
							"description": "<b>Secret Scroll of Wisdom</b><br>Restricts the target for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 3
								}]
						}]
				},
				"pet157": {
					"id": "157",
					"name": "Mini Bat",
					"description": "Mini Bat",
					"swfName": "pet_157",
					"clsName": "Pet_157",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "basic attack",
							"description": "<b>basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Scratch",
							"description": "<b>Scratch</b><br>Has 70% chance to blinds the target for 2 turns (15% accuracy reduction).",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "blind",
									"duration": 3,
									"amount": 15,
									"chance": 70
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "",
							"name": "Feast of the Bats",
							"description": "<b>Feast of the Bats</b><br>Reduce enemy's 10% CP.",
							"action": "special",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp",
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 6,
							"target": "",
							"name": "Life Drain",
							"description": "<b>Life Drain</b><br>Drain 4% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 4
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Essence Shift",
							"description": "<b>Essence Shift</b><br>Restore 10% of master's HP for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Screech",
							"description": "<b>Screech</b><br>Reduce target's 7% damage for 3 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 4,
									"amount": 7
								}]
						}]
				},
				"pet158": {
					"id": "158",
					"name": "Yin Yang Dragon (III)",
					"description": "Yin Yang Dragon (III)",
					"swfName": "pet_158",
					"clsName": "Pet_158",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Light Shining",
							"description": "<b>Light Shining</b><br>Blinds the target for 1 turn (5% accuracy reduction).",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "blind",
									"duration": 2,
									"amount": 5
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Passage of Time",
							"description": "<b>Passage of Time</b><br>Increase master's accuracy by 20% for 2 turn.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 3,
									"amount": 20
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Taiji Yin Yang Array",
							"description": "<b>Taiji Yin Yang Array</b><br>Applies serene mind buff to master for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "serene_mind",
									"duration": 2
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Yin Yang Break",
							"description": "<b>Yin Yang Break</b><br>Inflicts 'Chaos' status for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "chaos",
									"duration": 3
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Black White Power",
							"description": "<b>Black White Power</b><br>Increases master’s CP charge recovery by 150% for 2 turn.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "effect_extra_cp_recover",
									"duration": 3,
									"amount": 150
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Reincarnation",
							"description": "<b>Reincarnation</b><br>Drains 15% CP to the target and transfer it to the master.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_cp",
									"amount": 15
								}
							]
						}
					]
				},
				"pet159": {
					"id": "159",
					"name": "Mercenary Turkey",
					"description": "Mercenary Turkey",
					"swfName": "pet_159",
					"clsName": "Pet_159",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Grenade",
							"description": "<b>Grenade</b><br>Burns target HP by 3% for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Gun Sight",
							"description": "<b>Gun Sight</b><br>Increase master's accuracy by 8% (2 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_attention",
									"duration": 3,
									"amount": 8
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Flash Bang",
							"description": "<b>Flash Bang</b><br>Blinds the target for 3 turn (30% accuracy reduction).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "blind",
									"duration": 4,
									"amount": 30
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Rocket Launcher",
							"description": "<b>Rocket Launcher</b><br>Burns target HP by 3% for 3 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 4,
									"amount": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 17,
							"target": "self",
							"name": "Reloading",
							"description": "<b>Reloading</b><br>Increase attack damage itself by 300% (3 turns).",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 300
								}]
						}]
				},
				"pet160": {
					"id": "160",
					"name": "Ninja Turkey",
					"description": "Ninja Turkey",
					"swfName": "pet_160",
					"clsName": "Pet_160",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "basic attack",
							"description": "<b>basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 6,
							"target": "",
							"name": "Multiple Shuriken",
							"description": "<b>Multiple Shuriken</b><br>Bleeding effect occur which will increase 15% extra damage (3 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 4,
									"amount": 15,
									"chance": 100
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Assassination",
							"description": "<b>Assassination</b><br>Has 20% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 20
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Ice Ball",
							"description": "<b>Ice Ball</b><br>Inflicts frozen status for 2 turns. (Frozen target cannot move but damage taken is reduced by 80%)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_freeze",
									"duration": 3,
									"chance": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Fire Ball",
							"description": "<b>Fire Ball</b><br>Burns target HP by 3% for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 3
								}]
						}]
				},
				"pet161": {
					"id": "161",
					"name": "The Gingerbread Man",
					"description": "The Gingerbread Man",
					"swfName": "pet_161",
					"clsName": "Pet_161",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Candy Cane Shower",
							"description": "<b>Candy Cane Shower</b><br>Restricts target for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "master",
							"name": "Sugary Block",
							"description": "<b>Sugary Block</b><br>Increase master's critical, dodge, combustion, purify or reactive force chance by 5% (for 2 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "master",
							"name": "Sweet Glaze",
							"description": "<b>Sweet Glaze</b><br>Reduce 15% damage to master. (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_reduction",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 9,
							"target": "",
							"name": "Searing Cream",
							"description": "<b>Searing Cream</b><br>Burn target's 5% hp for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burning",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Surprise Gift",
							"description": "<b>Surprise Gift</b><br>Stun target (2 turns).",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}]
				},
				"pet162": {
					"id": "162",
					"name": "Mini Polar Bear",
					"description": "Mini Polar Bear",
					"swfName": "pet_162",
					"clsName": "Pet_162",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Ferocious Claw",
							"description": "<b>Ferocious Claw</b><br>Inflict bleeding status for 2 turns (20% damage amplification).",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 20
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "master",
							"name": "Polar Aegis",
							"description": "<b>Polar Aegis</b><br>Guard master and reduce master's damage taken by 100% (1 turn).",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard", // complete_guard
									"duration": 2
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Enfeebling Roar",
							"description": "<b>Enfeebling Roar</b><br>Weakens the target for 2 turns (5% damage reduction).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_fear_weaken",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 9,
							"target": "",
							"name": "Rolling Assault",
							"description": "<b>Rolling Assault</b><br>Reduce target's HP & CP by 4%.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 4
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Snowball Hurl",
							"description": "<b>Snowball Hurl</b><br>Has 45% chance to inflicts stun status for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun_random",
									"duration": 3,
									"chance": 45
								}]
						}]
				},
				"pet163": {
					"id": "163",
					"name": "Christmas Penguin",
					"description": "Christmas Penguin",
					"swfName": "pet_163",
					"clsName": "Pet_163",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Ice Drop",
							"description": "<b>Ice Drop</b><br>Restricts target for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Winter's Blessing",
							"description": "<b>Winter's Blessing</b><br>Increase master's critical, dodge, combustion, purify or reactive force chance by 8% (for 2 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 3,
									"amount": 8
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Sapping Blizzard",
							"description": "<b>Sapping Blizzard</b><br>Drain 4%HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 4
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 9,
							"target": "",
							"name": "Glacial Spike",
							"description": "<b>Glacial Spike</b><br>Inflict bleeding status for 1 turn (30% damage amplification).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 2,
									"amount": 30
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "master",
							"name": "Hoarfrost Shield",
							"description": "<b>Hoarfrost Shield</b><br>All attack by target will be rebound (1 turn).",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "serene_mind",
									"duration": 2
								}]
						}]
				},
				"pet164": {
					"id": "164",
					"name": "Origami Kirin",
					"description": "Origami Kirin",
					"swfName": "pet_164",
					"clsName": "Pet_164",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Blinds the target for 1 turn (5% accuracy reduction).",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_blind",
									"duration": 2,
									"amount": 5
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Focus",
							"description": "<b>Focus</b><br>Increase master's accuracy by 15% for 2 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_attention",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Life Extraction Hurricane",
							"description": "<b>Life Extraction Hurricane</b><br>Drain 5%HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "master",
							"name": "Blessing",
							"description": "<b>Blessing</b><br>Restore 7% of master's HP for 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 7
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "",
							"name": "Swift Snooze",
							"description": "<b>Swift Snooze</b><br>Sleep the target for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "sleep",
									"duration": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Hyper Jolt",
							"description": "<b>Hyper Jolt</b><br>Stun target (2 turns).",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}]
				},
				"pet165": {
					"id": "165",
					"name": "The Ghost lights",
					"description": "The Ghost lights",
					"swfName": "pet_165",
					"clsName": "Pet_165",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Bulwark of Gloom",
							"description": "<b>Bulwark of Gloom</b><br>Reduce 10% damage to master. (3 turns)",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "damage_reduction",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Effervesce",
							"description": "<b>Effervesce</b><br>Applies serene mind buff for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "serene_mind",
									"duration": 2
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Memento Mori",
							"description": "<b>Memento Mori</b><br>To inflicts target 'chaos' status for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Dark Reinforce",
							"description": "<b>Dark Reinforce</b><br>Resist negative status (1 turns).",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_debuff_resist",
									"duration": 2,
									"chance": 100
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Black Fire Ritual",
							"description": "<b>Black Fire Ritual</b><br>Increase master's attack damage by 10% (3 turns).",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 10
								}]
						}]
				},
				"pet178": {
					"id": "178",
					"name": "Sacred Dragon (III)",
					"description": "Sacred Dragon (III)",
					"swfName": "pet_178",
					"clsName": "Pet_178",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Holy Bubble",
							"description": "<b>Holy Bubble</b><br>Spit some yellow bubbles attack target. Reduce enemy's accuracy by 5% for 1 turn.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_blind",
									"duration": 2,
									"amount": 5
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Wings of Dragon",
							"description": "<b>Wings of Dragon</b><br>Create light of dragon wings to master. Increase master's accuracy by 20% (2 turns)",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 3,
									"amount": 20
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Return Sound Wave",
							"description": "<b>Return Sound Wave</b><br>Create sound wave attack target and send it back. Drain 10% CP from target and recover to master.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_cp",
									"amount": 10
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Heal of Dragon",
							"description": "<b>Heal of Dragon</b><br>Spit a light ball to heal master. Recover Master's HP by 5%. (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 3,
									"amount": 5
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 15,
							"target": "",
							"name": "Sweet Song",
							"description": "<b>Sweet Song</b><br>Singing and create music symbol attack target. Hallucinate target with ecstatic sound to restrict target and reduce attack damage by 60% for 3 turns",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "ecstatic_sound",
									"duration": 4,
									"amount": 60
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 12,
							"target": "",
							"name": "Light Rising",
							"description": "<b>Light Rising</b><br>Transform to light and rise up, fall from the sky attack target. Has 45% chance to remove all positive status.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 45
								}
							]
						}
					]
				},
				"pet179": {
					"id": "179",
					"name": "Shark Ninja",
					"description": "Shark Ninja",
					"swfName": "pet_179",
					"clsName": "Pet_179",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Fin Blade",
							"description": "<b>Fin Blade</b><br>Increases target's damage taken by 45% for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 45
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "",
							"name": "Ocean Cannon",
							"description": "<b>Ocean Cannon</b><br>Reduce target's 30% damage. (for 5 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 6,
									"amount": 30
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "",
							"name": "Diving Rush",
							"description": "<b>Diving Rush</b><br>Has 45% chance to remove positive status to the target.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 45
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "",
							"name": "Ocean Slash",
							"description": "<b>Ocean Slash</b><br>Reduces target CP by 15%.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp",
									"amount": 15
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 12,
							"target": "",
							"name": "Shark Bomb",
							"description": "<b>Shark Bomb</b><br>Inflicts 'Chaos' status for 2 turn.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}]
				},
				"pet180": {
					"id": "180",
					"name": "Shishimai Monkey",
					"description": "Shishimai Monkey",
					"swfName": "pet_180",
					"clsName": "Pet_180",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Raging Flame",
							"description": "<b>Raging Flame</b><br>Burns target HP by 1% for 1 turn.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 2,
									"amount": 1
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Firecracker",
							"description": "<b>Firecracker</b><br>Burns target HP by 7% for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 2,
									"amount": 7
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Rotten Banana",
							"description": "<b>Rotten Banana</b><br>Inflicts 'Chaos' status for 1 turn.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 2
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Shishimai",
							"description": "<b>Shishimai</b><br>Increase master's accuracy by 20% for 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_attention",
									"duration": 3,
									"amount": 20
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Make a Fortune",
							"description": "<b>Make a Fortune</b><br>Inflicts internal injury for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Super Shishimai",
							"description": "<b>Super Shishimai</b><br>Stuns target for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}]
				},
				"pet181": {
					"id": "181",
					"name": "Heart Monster",
					"description": "Heart Monster",
					"swfName": "pet_181",
					"clsName": "Pet_181",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 6,
							"target": "",
							"name": "Fart Attack",
							"description": "<b>Fart Attack</b><br>Target's damage reduces 10%. (1 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 2,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Lovely Recover",
							"description": "<b>Lovely Recover</b><br>Recover master 3% HP for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 4,
									"amount": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Weird Sound",
							"description": "<b>Weird Sound</b><br>Inflicts chaos on target for 1 turn. (cannot control character and use jutsu)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 2
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 12,
							"target": "",
							"name": "Monkey Business",
							"description": "<b>Monkey Business</b><br>Burns target HP by 3% for 3 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 4,
									"amount": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Big Tongue",
							"description": "<b>Big Tongue</b><br>Heals 3% of master's max HP and removes all negative status.",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bloodlust_dedication",
									"amount": 3
								}]
						}]
				},
				"pet182": {
					"id": "182",
					"name": "Sonic Bunny",
					"description": "Sonic Bunny",
					"swfName": "pet_182",
					"clsName": "Pet_182",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Thunder Shoot",
							"description": "<b>Thunder Shoot</b><br>Reduce enemy's accuracy by 20%. (1 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_blind",
									"duration": 2,
									"amount": 20
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Lightning Rod",
							"description": "<b>Lightning Rod</b><br>Increases its master's attack damage, critical chance & accuracy by 10% for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_lightning",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Thunder Kunai",
							"description": "<b>Thunder Kunai</b><br>Reduce target's HP & CP by 5%",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 5
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Lighting Circle",
							"description": "<b>Lighting Circle</b><br>Has 100% chance to cast 'Debuff Resist' status for 1 turn.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_debuff_resist",
									"duration": 2,
									"chance": 100
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Thunder Beast",
							"description": "<b>Thunder Beast</b><br>Increase target's 1 random skill cooldown for 2 extra turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 3
								}]
						}]
				},
				"pet183": {
					"id": "183",
					"name": "Earth Turtle",
					"description": "Earth Turtle",
					"swfName": "pet_183",
					"clsName": "Pet_183",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Earth Hill",
							"description": "<b>Earth Hill</b><br>Stuns target for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Wood Tentacle",
							"description": "<b>Wood Tentacle</b><br>Restricts the target for 1 turn.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 2
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Water Penetrate",
							"description": "<b>Water Penetrate</b><br>Reduce target HP & CP by 2% and stun target for 1 turn.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									// "type": "colliding_wave",
									"type": "coilding_wave",
									"duration": 2,
									"amount": 2
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Ocean Atmosphere",
							"description": "<b>Ocean Atmosphere</b><br>Reduces master’s CP consumption when using skills by 25% for 1 turn.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_save_cp",
									"duration": 2,
									"amount": 25
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 12,
							"target": "",
							"name": "Iron Head",
							"description": "<b>Iron Head</b><br>Has 30% chance to remove all target's positive status.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 30
								}]
						}]
				},
				"pet184": {
					"id": "184",
					"name": "Soul of Holy Beast (I)",
					"description": "Soul of Holy Beast (I)",
					"swfName": "pet_184",
					"clsName": "Pet_184",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 1,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Burns target HP by 1% for 1 turn.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 2,
									"amount": 1
								}
							]
						}
					]
				},
				"pet185": {
					"id": "185",
					"name": "Mini Kirin (II)",
					"description": "Mini Kirin (II)",
					"swfName": "pet_185",
					"clsName": "Pet_185",
					"type": 3,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's Basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 5,
							"target": "",
							"name": "Glare Bullet",
							"description": "<b>Glare Bullet</b><br>Stun target (1 turn).",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 2
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Kirin Prestige",
							"description": "<b>Kirin Prestige</b><br>Recover master’s HP by 3% for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 4,
									"amount": 3
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 8,
							"cooldown": 8,
							"target": "master",
							"name": "Tai Chi Array",
							"description": "<b>Tai Chi Array</b><br>All attack by target will be rebound. Applies 'Serene Mind' status for 1 turn.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "serene_mind",
									"duration": 2
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Kirin Scurry",
							"description": "<b>Kirin Scurry</b><br>Has 25% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 25
								}
							]
						}
					]
				},
				"pet186": {
					"id": "186",
					"name": "Mini Dark Kirin (III)",
					"description": "Mini Dark Kirin (III)",
					"swfName": "pet_186",
					"clsName": "Pet_186",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 3,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Black Flares",
							"description": "<b>Black Flares</b><br>Reduce target's HP & CP by 7%.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp_hp",
									"amount": 7
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Purple Inflammation Shield",
							"description": "<b>Purple Inflammation Shield</b><br>Applies 'Guard' status for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "guard", // "complete_guard",
									"duration": 2
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Evil Flame Falling ",
							"description": "<b>Evil Flame Falling </b><br>Inflicts 'Chaos' status for 1 turn.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "chaos",
									"duration": 2
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Kirin Bagger Technique",
							"description": "<b>Kirin Bagger Technique</b><br>Increase master's accuracy by 35% for 3 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 4,
									"amount": 35
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Evil Flame Scurry",
							"description": "<b>Evil Flame Scurry</b><br>Has 40% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 40
								}
							]
						}
					]
				},
				"pet187": {
					"id": "187",
					"name": "Ultimate Kirin (IV)",
					"description": "Ultimate Kirin (IV)",
					"swfName": "pet_187",
					"clsName": "Pet_187",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Glare Bundle Ring",
							"description": "<b>Glare Bundle Ring</b><br>Inflicts 'stun' status for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Super Tai Chi Array",
							"description": "<b>Super Tai Chi Array</b><br>All attack by target will be rebound. Applies 'Serene Mind' status for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "serene_mind",
									"duration": 3
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Super Kirin Bagger Technique",
							"description": "<b>Super Kirin Bagger Technique</b><br>Increase master's accuracy by 50% for 3 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 4,
									"amount": 50
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Golden Wind",
							"description": "<b>Golden Wind</b><br>Has a 100% chance to cast 'Debuff Resist' to the master for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 3,
									"amount": 100
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Ultimate Kirin Scurry",
							"description": "<b>Ultimate Kirin Scurry</b><br>Has 50% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 50
								}
							]
						}
					]
				},
				"pet188": {
					"id": "188",
					"name": "Origami Pegasus",
					"description": "Origami Pegasus",
					"swfName": "pet_188",
					"clsName": "Pet_188",
					"type": 2,
					"attack_rate": 2,
					"defend_rate": 3,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Carved Hoof",
							"description": "<b>Carved Hoof</b><br>Inflicts internal injury status for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Blessing From Sky",
							"description": "<b>Blessing From Sky</b><br>Recover master 3% HP for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 4,
									"amount": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Faerie Wind",
							"description": "<b>Faerie Wind</b><br>Reduces master’s skill cooldown by 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "cooldown_reduction",
									"amount": 2
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 10,
							"target": "",
							"name": "Spiral Onrush",
							"description": "<b>Spiral Onrush</b><br>Has 35% chance to remove all target's positive status.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 35
								}]
						}]
				},
				"pet189": {
					"id": "189",
					"name": "Helianthus Dragon (III)",
					"description": "Helianthus Dragon (III)",
					"swfName": "pet_189",
					"clsName": "Pet_189",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Sun Pollen",
							"description": "<b>Sun Pollen</b><br>Recover Master's 7% HP.(2 turns)",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_heal",
									"duration": 3,
									"amount": 7
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Sunflower Shield",
							"description": "<b>Sunflower Shield</b><br>Reduce master's damage taken by 80%. (2 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"duration": 3,
									"amount": 80
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Vines Tying",
							"description": "<b>Vines Tying</b><br>Restricts target for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bundle",
									"duration": 3
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 15,
							"target": "all",
							"name": "Sun Power Laser",
							"description": "<b>Sun Power Laser</b><br>To reduce all target's HP & CP by 9%.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee4",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp_hp",
									"amount": 9
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Sunshine",
							"description": "<b>Sunshine</b><br>Has 70% chance to cast 'Debuff Resist' status for 2 turns.",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 3,
									"amount": 70
								}
							]
						}
					]
				},
				"pet190": {
					"id": "190",
					"name": "Monkey Keeper",
					"description": "Monkey Keeper",
					"swfName": "pet_190",
					"clsName": "Pet_190",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Palm of Keeper",
							"description": "<b>Palm of Keeper</b><br>Stun target (1 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Goal Kick",
							"description": "<b>Goal Kick</b><br>Inflicts internal injury for 2 turn.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury",
									"duration": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Summon Goal",
							"description": "<b>Summon Goal</b><br>Increases master's defense by 40% for 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "damage_reduction",
									"duration": 3,
									"amount": 40
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Soccer Bomb",
							"description": "<b>Soccer Bomb</b><br>Burns target HP by 3% for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Soaring Header",
							"description": "<b>Soaring Header</b><br>Has 30% chance to remove all buff from target.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 30
								}]
						}]
				},
				"pet191": {
					"id": "191",
					"name": "Little Minotaur",
					"description": "Little Minotaur",
					"swfName": "pet_191",
					"clsName": "Pet_191",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 1000,
					"token": 0,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Demon Fireball",
							"description": "<b>Demon Fireball</b><br>Burns target HP by 2% for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 4,
									"amount": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Claw Combo",
							"description": "<b>Claw Combo</b><br>Bleeding effect occur which will increase 25% extra damage (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 25
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 3,
							"cooldown": 7,
							"target": "",
							"name": "Mini Dark Jade",
							"description": "<b>Mini Dark Jade</b><br>Inflicts chaos on target. (cannot control character and use jutsu) (1 turn)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 2
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 3,
							"cooldown": 9,
							"target": "",
							"name": "Eyes Flame",
							"description": "<b>Eyes Flame</b><br>Reduce target's 35% damage. (for 2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 3,
									"amount": 35
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 4,
							"cooldown": 11,
							"target": "",
							"name": "Furious",
							"description": "<b>Furious</b><br>Drain 4%HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 4
								}]
						}]
				},
				"pet192": {
					"id": "192",
					"name": "Gold War Dragon (IV)",
					"description": "Gold War Dragon (IV)",
					"swfName": "pet_192",
					"clsName": "Pet_192",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Dragon Claw",
							"description": "<b>Dragon Claw</b><br>Bleeding effect occur which will increase 7% extra damage (1 turn)",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bleeding",
									"duration": 2,
									"amount": 7
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 3,
							"cooldown": 9,
							"target": "",
							"name": "Dragon Laser",
							"description": "<b>Dragon Laser</b><br>To reduce target's HP & CP by 10%",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp_hp",
									"amount": 10
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Sun Ball",
							"description": "<b>Sun Ball</b><br>Burns target HP by 8% for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 3,
									"amount": 8
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Freedom Wings",
							"description": "<b>Freedom Wings</b><br>Increase accuracy by 70% (7 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 8,
									"amount": 70
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 4,
							"cooldown": 8,
							"target": "",
							"name": "Fly Dragon Falling",
							"description": "<b>Fly Dragon Falling</b><br>Stun target (2 turns).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 5,
							"cooldown": 10,
							"target": "",
							"name": "Fly Dragon Pulse",
							"description": "<b>Fly Dragon Pulse</b><br>Has 60% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 60
								}
							]
						}
					]
				},
				"pet193": {
					"id": "193",
					"name": "Felinia",
					"description": "Felinia",
					"swfName": "pet_193",
					"clsName": "Pet_193",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 10,
					"gold": 0,
					"token": 100,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Cheer Horn",
							"description": "<b>Cheer Horn</b><br>Recovers 5% of its master's max HP for 3 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 4,
									"amount": 5
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Happy Dance",
							"description": "<b>Happy Dance</b><br>Applies a 30% chance to resist negative status buff for 2 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_debuff_resist",
									"duration": 3,
									"chance": 30
								}]
						}]
				},
				"pet194": {
					"id": "194",
					"name": "Pumpkin Raider",
					"description": "Pumpkin Raider",
					"swfName": "pet_194",
					"clsName": "Pet_194",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Fire Direct",
							"description": "<b>Fire Direct</b><br>Reduce target's 3% hp for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn", // burning
									"duration": 3,
									"amount": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Blood Blast",
							"description": "<b>Blood Blast</b><br>To reduce target's HP by 4%.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_hp",
									"amount": 4
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 2,
							"cooldown": 11,
							"target": "",
							"name": "Night Strike",
							"description": "<b>Night Strike</b><br>Inflicts internal injury status for 3 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury", // battle_internal_injury
									"duration": 4
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 13,
							"target": "master",
							"name": "Sparkling Pumpkin",
							"description": "<b>Sparkling Pumpkin</b><br>Recover Master's 3% HP.(2 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 3
								}]
						}]
				},
				"pet195": {
					"id": "195",
					"name": "Little Cerberus",
					"description": "Little Cerberus",
					"swfName": "pet_195",
					"clsName": "Pet_195",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Blood Claws",
							"description": "<b>Blood Claws</b><br>Bleeding effect occur which will increase 15% extra damage (3 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 4,
									"amount": 15
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 3,
							"cooldown": 9,
							"target": "",
							"name": "Dark Chain",
							"description": "<b>Dark Chain</b><br>Restricts target for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 4,
							"cooldown": 9,
							"target": "",
							"name": "Hell Bomb",
							"description": "<b>Hell Bomb</b><br>Burns target HP by 3% for 3 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 4,
									"amount": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Wall of Bone",
							"description": "<b>Wall of Bone</b><br>Applies serene mind buff for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "serene_mind",
									"duration": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "self",
							"name": "Inferno Burning",
							"description": "<b>Inferno Burning</b><br>Increase pet's attack damage by 100% and critical chance by 25% (Side effect: take extra damage by 20%) (4 turns)",
							"action": "special",
							"animation": "attack_06",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bunny_frenzy",
									"duration": 5
								}]
						}]
				},
				"pet196": {
					"id": "196",
					"name": "Christmas Fairy",
					"description": "Christmas Fairy",
					"swfName": "pet_196",
					"clsName": "Pet_196",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 20,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Fairy Blessing",
							"description": "<b>Fairy Blessing</b><br>Recover master 5% HP, 2 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "",
							"name": "Spells Bullet",
							"description": "<b>Spells Bullet</b><br>Burns target HP by 2% for 4 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 5,
									"amount": 2
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 3,
							"cooldown": 11,
							"target": "",
							"name": "Christmas Tornado",
							"description": "<b>Christmas Tornado</b><br>Cause bleeding effect. (for 1 turn) (Enemy will suffer an extra 33% damage under bleeding effect.)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 2,
									"amount": 33
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 4,
							"cooldown": 15,
							"target": "",
							"name": "Christmas Beam",
							"description": "<b>Christmas Beam</b><br>Reduces the target’s HP and CP by 6%",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 6
								}]
						}]
				},
				"pet197": {
					"id": "197",
					"name": "Christmas Nutcracker",
					"description": "Christmas Nutcracker",
					"swfName": "pet_197",
					"clsName": "Pet_197",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 3,
							"cooldown": 7,
							"target": "",
							"name": "Nutcracker!",
							"description": "<b>Nutcracker!</b><br>Disables target’s weapon attack for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dismantle",
									"duration": 4
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 4,
							"cooldown": 8,
							"target": "",
							"name": "Flying Fist",
							"description": "<b>Flying Fist</b><br>Burns target HP by 3% for 3 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 4,
									"amount": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 5,
							"cooldown": 11,
							"target": "",
							"name": "Jump Slash",
							"description": "<b>Jump Slash</b><br>Reduce target's damage by 25% (2 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_fear_weaken",
									"duration": 3,
									"amount": 25
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 5,
							"cooldown": 13,
							"target": "",
							"name": "Crazy Shooting",
							"description": "<b>Crazy Shooting</b><br>Reduce enemy's accuracy by 60%. (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_blind",
									"duration": 3,
									"amount": 60
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 6,
							"cooldown": 13,
							"target": "",
							"name": "Christmas Missile",
							"description": "<b>Christmas Missile</b><br>Burns target HP by 6% for 3 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 4,
									"amount": 6
								}]
						}]
				},
				"pet198": {
					"id": "198",
					"name": "Voodoo Dragon (IV)",
					"description": "Voodoo Dragon (IV)",
					"swfName": "pet_198",
					"clsName": "Pet_198",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 5,
							"cooldown": 0,
							"target": "",
							"name": "Toxic Fog",
							"description": "<b>Toxic Fog</b><br>Poison target. Reduce 1% HP in each turn (2 turns)",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "poison",
									"duration": 3,
									"amount": 1
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 6,
							"cooldown": 7,
							"target": "",
							"name": "Bone of Corrosion",
							"description": "<b>Bone of Corrosion</b><br>Restricts target for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bundle",
									"duration": 4
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "self",
							"name": "Venom Force",
							"description": "<b>Venom Force</b><br>Increase self accuracy by 100% (3 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 4,
									"amount": 100
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Poison Sacrifice",
							"description": "<b>Poison Sacrifice</b><br>Resist negative status (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_debuff_resist",
									"duration": 3,
									"amount": 100
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 7,
							"cooldown": 8,
							"target": "",
							"name": "Poison Cyclone",
							"description": "<b>Poison Cyclone</b><br>Poison target. Reduce 7% HP in each turn (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "poison",
									"duration": 3,
									"amount": 7
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 8,
							"cooldown": 10,
							"target": "all",
							"name": "Poison Spread",
							"description": "<b>Poison Spread</b><br>To reduce all target's HP & CP by 10%.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp_hp",
									"amount": 10
								}
							]
						}
					]
				},
				"pet199": {
					"id": "199",
					"name": "Crystal Dragon (IV)",
					"description": "Crystal Dragon (IV)",
					"swfName": "pet_199",
					"clsName": "Pet_199",
					"type": 2,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 4,
							"cooldown": 0,
							"target": "",
							"name": "Ultrasonic Wave",
							"description": "<b>Ultrasonic Wave</b><br>Blinds the target for 2 turns (15% accuracy reduction).",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "blind",
									"duration": 3,
									"amount": 15
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 6,
							"target": "",
							"name": "Flash Lightning",
							"description": "<b>Flash Lightning</b><br>Reduces target's critical, dodge, combustion, purify and reactive force chance by 25% for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_disoriented",
									"duration": 4,
									"amount": 25
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 6,
							"cooldown": 7,
							"target": "",
							"name": "Crystal Creation",
							"description": "<b>Crystal Creation</b><br>Stuns target for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Crystal Wall",
							"description": "<b>Crystal Wall</b><br>Guard master and reduce master's damage taken by 100% (3 turns).",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "guard", // "complete_guard",
									"duration": 4
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 6,
							"cooldown": 11,
							"target": "",
							"name": "Crystal Flame",
							"description": "<b>Crystal Flame</b><br>Burns target's HP by 6% for 3 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 4,
									"amount": 6
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 7,
							"cooldown": 9,
							"target": "all",
							"name": "Crystal Light",
							"description": "<b>Crystal Light</b><br>Weakens all the targets for 3 turns (100% damage reduction).",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee4",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_fear_weaken",
									"duration": 4,
									"amount": 100
								}
							]
						}
					]
				},
				"pet200": {
					"id": "200",
					"name": "Little Griffin",
					"description": "Little Griffin",
					"swfName": "pet_200",
					"clsName": "Pet_200",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 3,
							"cooldown": 8,
							"target": "",
							"name": "Feather Arrow ",
							"description": "<b>Feather Arrow </b><br>Restricts target for 2 turns. (target will not allow to use any ninjutsu.)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 3,
							"cooldown": 9,
							"target": "",
							"name": "Rotated Tornado",
							"description": "<b>Rotated Tornado</b><br>Inflicts internal injury status for 3 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 4
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 3,
							"cooldown": 11,
							"target": "",
							"name": "Claw Blast",
							"description": "<b>Claw Blast</b><br>Reduce target's HP & CP by 7%.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 7
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 5,
							"cooldown": 12,
							"target": "all",
							"name": "Lightning Swirl",
							"description": "<b>Lightning Swirl</b><br>Inflicts chaos status to all targets for 2 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}]
				},
				"pet201": {
					"id": "201",
					"name": "Love Fairy",
					"description": "Love Fairy",
					"swfName": "pet_201",
					"clsName": "Pet_201",
					"type": 3,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 1000,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 7,
							"target": "",
							"name": "Heart Bomb",
							"description": "<b>Heart Bomb</b><br>Burns target HP by 5% for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 2,
									"amount": 5
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Fascinate Arrow",
							"description": "<b>Fascinate Arrow</b><br>Inflicts chaos on target. (cannot control character and use jutsu) (1 turn)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 2
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Love Charge",
							"description": "<b>Love Charge</b><br>Recover master 10% HP.(2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 10
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 11,
							"target": "master",
							"name": "Love Pentagram",
							"description": "<b>Love Pentagram</b><br>Increase master's attack damage by 20% (1 turn).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 2,
									"amount": 20
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 20,
							"cooldown": 13,
							"target": "",
							"name": "Lovelorn Arrow",
							"description": "<b>Lovelorn Arrow</b><br>This pet skill contain higher damage.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}]
				},
				"pet202": {
					"id": "202",
					"name": "Aomaru",
					"description": "Aomaru",
					"swfName": "pet_202",
					"clsName": "Pet_202",
					"type": 1,
					"attack_rate": 0,
					"defend_rate": 0,
					"support_rate": 0,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 4,
							"target": "",
							"name": "Blue Flame Shoot",
							"description": "<b>Blue Flame Shoot</b><br>Burns target's HP by 2% for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 3,
							"cooldown": 6,
							"target": "",
							"name": "Fire Steps",
							"description": "<b>Fire Steps</b><br>Reduce target's CP by 10%",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp",
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 3.5,
							"cooldown": 8,
							"target": "",
							"name": "Double Claw",
							"description": "<b>Double Claw</b><br>Burns target's HP by 4% for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 4
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 4,
							"cooldown": 8,
							"target": "all",
							"name": "Blue Flame Sky Return",
							"description": "<b>Blue Flame Sky Return</b><br>To reduce all target's HP & CP by 5%.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 5
								}]
						}]
				},
				"pet203": {
					"id": "203",
					"name": "Kyozan",
					"description": "Kyozan",
					"swfName": "pet_203",
					"clsName": "Pet_203",
					"type": 1,
					"attack_rate": 0,
					"defend_rate": 0,
					"support_rate": 0,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Bunshin Attack",
							"description": "<b>Bunshin Attack</b><br>Reduces critical chance, dodge chance, combustion chance, purify chance and reactive force chance of target by 10% for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "self",
							"name": "Dogs Fighting Spirit",
							"description": "<b>Dogs Fighting Spirit</b><br>Increase attack damage itself by 100% (4 turns).",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 5,
									"amount": 100
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Earth Wall",
							"description": "<b>Earth Wall</b><br>Reduce 30% damage to master. (3 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "damage_reduction",
									"duration": 4,
									"amount": 30
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 4,
							"cooldown": 9,
							"target": "",
							"name": "Kinjutsu: Dogs Calling",
							"description": "<b>Kinjutsu: Dogs Calling</b><br>Inflicts chaos on target. (cannot control character and use jutsu) (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}]
				},
				"pet204": {
					"id": "204",
					"name": "Silver Monkey King",
					"description": "Silver Monkey King",
					"swfName": "pet_204",
					"clsName": "Pet_204",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 3,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Basic Attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 3,
							"cooldown": 3,
							"target": "",
							"name": "Claw Onslaught",
							"description": "<b>Claw Onslaught</b><br>Target's damage reduces 10% (3 turns)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 4,
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "self",
							"name": "Transfiguration!",
							"description": "<b>Transfiguration!</b><br>Increase self accuracy by 50% (4 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_attention",
									"duration": 5,
									"amount": 50
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 3.5,
							"cooldown": 5,
							"target": "",
							"name": "Transfiguration! Stretch!",
							"description": "<b>Transfiguration! Stretch!</b><br>Has 50% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 50
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 5,
							"cooldown": 7,
							"target": "all",
							"name": "Transfiguration! Rotate!",
							"description": "<b>Transfiguration! Rotate!</b><br>Stun all targets (2 turns).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Adamantine Cage",
							"description": "<b>Adamantine Cage</b><br>Guard master and reduce master's damage taken by 100% (2 turns).",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard",
									"duration": 3
								}]
						}]
				},
				"pet205": {
					"id": "205",
					"name": "Ninja Falcon",
					"description": "Ninja Falcon",
					"swfName": "pet_205",
					"clsName": "Pet_205",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 3,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 6,
							"target": "",
							"name": "Double Falcon Claw",
							"description": "<b>Double Falcon Claw</b><br>Bleeding effect occur which will increase 25% extra damage (2 turns)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 25
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 6,
							"cooldown": 5,
							"target": "",
							"name": "Flash Shuriken",
							"description": "<b>Flash Shuriken</b><br>Strike of ultra-high accuracy.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "hundred_percent_attack",
									"amount": 100
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Simple Evasion",
							"description": "<b>Simple Evasion</b><br>Increase master's dodge chance by 20% for 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_dodge_bonus",
									"duration": 3,
									"amount": 20
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 5,
							"cooldown": 8,
							"target": "",
							"name": "Tornado",
							"description": "<b>Tornado</b><br>Has 15% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 15
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 7,
							"cooldown": 8,
							"target": "",
							"name": "Kinjutsu: Whirlwind Spin",
							"description": "<b>Kinjutsu: Whirlwind Spin</b><br>Stun target (2 turns).",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}]
				},
				"pet206": {
					"id": "206",
					"name": "Miko Cat",
					"description": "Miko Cat",
					"swfName": "pet_206",
					"clsName": "Pet_206",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Divine bomb",
							"description": "<b>Divine bomb</b><br>Inflicts chaos on target. (cannot control character and use jutsu) (1 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Defense Barrier",
							"description": "<b>Defense Barrier</b><br>Reduce 50% damage to master. (2 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "damage_reduction",
									"duration": 3,
									"amount": 50
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 3,
							"cooldown": 8,
							"target": "",
							"name": "Sky Flame",
							"description": "<b>Sky Flame</b><br>Burns target HP by 3% for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 3,
							"cooldown": 7,
							"target": "",
							"name": "Shrine Maiden Fire",
							"description": "<b>Shrine Maiden Fire</b><br>Target reduce 5% HP.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_hp",
									"amount": 5
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Sacred Fire Dance",
							"description": "<b>Sacred Fire Dance</b><br>Increase attack damage by 45% (3 turns).",
							"action": "special",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 45
								}]
						}]
				},
				"pet208": {
					"id": "208",
					"name": "Dark Bee",
					"description": "Dark Bee",
					"swfName": "pet_208",
					"clsName": "Pet_208",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Baisc Attack",
							"description": "<b>Baisc Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2,
							"cooldown": 6,
							"target": "",
							"name": "Poison Jet",
							"description": "<b>Poison Jet</b><br>Inflict poison status for 2 turns. (Poison: Reduce 2%HP every turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "poison",
									"duration": 3,
									"amount": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 3,
							"cooldown": 10,
							"target": "",
							"name": "Ultrasonic Wave",
							"description": "<b>Ultrasonic Wave</b><br>Stun target (2 turns).",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 17,
							"cooldown": 7,
							"target": "",
							"name": "Lightning Gun",
							"description": "<b>Lightning Gun</b><br>This pet skill contain higher damage.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Honey Shield",
							"description": "<b>Honey Shield</b><br>Increase master's all attack damage by 15% but reduce master HP by 2% (2 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "catalytic_matter",
									"duration": 3,
									"amount": 15
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 4,
							"cooldown": 12,
							"target": "",
							"name": "Venom Onslaught",
							"description": "<b>Venom Onslaught</b><br>Inflict poison status for 2 turns. (Poison: Reduce 5%HP every turn)",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "poison",
									"duration": 3,
									"amount": 5
								}]
						}]
				},
				"pet210": {
					"id": "210",
					"name": "Light Shadow",
					"description": "Light Shadow",
					"swfName": "pet_210",
					"clsName": "Pet_210",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 3,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "no effect"
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 4,
							"cooldown": 4,
							"target": "",
							"name": "Flash",
							"description": "<b>Flash</b><br>Target's damage reduces 20%. (2 turns)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 3,
									"amount": 20
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 4,
							"cooldown": 8,
							"target": "",
							"name": "Shadow Cyclone",
							"description": "<b>Shadow Cyclone</b><br>Inflicts 10% 'Bleeding' status for 5 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 6,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 4,
							"cooldown": 5,
							"target": "",
							"name": "Shadow Moon",
							"description": "<b>Shadow Moon</b><br>Inflicts 50% 'Bleeding' status for 1 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 2,
									"amount": 50
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 5,
							"cooldown": 8,
							"target": "",
							"name": "Shadow Whirlwind",
							"description": "<b>Shadow Whirlwind</b><br>Reduces critical chance, dodge chance, combustion chance, purify chance and reactive force chance of target by 30% for 4 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 5,
									"amount": 30
								}]
						}]
				},
				"pet211": {
					"id": "211",
					"name": "Evil Shadow",
					"description": "Evil Shadow",
					"swfName": "pet_211",
					"clsName": "Pet_211",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 5,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Pet's basic attack ",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 4,
							"target": "",
							"name": "Shadow Cut",
							"description": "<b>Shadow Cut</b><br>Inflicts internal injury status for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Shadow Recover",
							"description": "<b>Shadow Recover</b><br>Restore 10% of master's HP for 1 turn.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 2,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 6,
							"cooldown": 7,
							"target": "",
							"name": "Shadow Inflammation",
							"description": "<b>Shadow Inflammation</b><br>Burn to reduce enemy's 4% HP. (2 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 4
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 5,
							"cooldown": 8,
							"target": "",
							"name": "Shadow Turbulence",
							"description": "<b>Shadow Turbulence</b><br>Drain 5% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 5
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 6,
							"cooldown": 7,
							"target": "all",
							"name": "Shadow Demon Hand",
							"description": "<b>Shadow Demon Hand</b><br>To reduce all target's HP & CP by 5%.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 5
								}]
						}]
				},
				"pet212": {
					"id": "212",
					"name": "Little Wanyudo",
					"description": "Little Wanyudo",
					"swfName": "pet_212",
					"clsName": "Pet_212",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Fire Throw",
							"description": "<b>Fire Throw</b><br>Burn to reduce enemy's 1% HP. (2 turns)",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn", // "burning",
									"duration": 3,
									"amount": 1
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 8,
							"target": "",
							"name": "Fire Hug",
							"description": "<b>Fire Hug</b><br>Inflicts internal injury status for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury",
									"duration": 4
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Blue Ghost Flame",
							"description": "<b>Blue Ghost Flame</b><br>Increase attack damage itself by 30% (3 turns).",
							"action": "special",
							"animation": "attack_03",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 30
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 6,
							"target": "",
							"name": "Ghost Fire Spell",
							"description": "<b>Ghost Fire Spell</b><br>Reduces target's critical, dodge, combustion, purify and reactive force chance by 25% for 3 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 4,
									"amount": 25
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 10,
							"cooldown": 10,
							"target": "all",
							"name": "Ghost Fire Impact",
							"description": "<b>Ghost Fire Impact</b><br>Ghost Fire Impact",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}]
				},
				"pet213": {
					"id": "213",
					"name": "Maple Fox",
					"description": "Maple Fox",
					"swfName": "pet_213",
					"clsName": "Pet_213",
					"type": 1,
					"attribute_type": "fire",
					"max_level": 25,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 3,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 5,
							"target": "",
							"name": "Maple Cannon",
							"description": "<b>Maple Cannon</b><br>Sleep the target for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "sleep",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 3.5,
							"cooldown": 7,
							"target": "",
							"name": "Maple Blade Combat",
							"description": "<b>Maple Blade Combat</b><br>Reduce target's 80% damage. (for 1 turn)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 2,
									"amount": 80
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 4,
							"cooldown": 10,
							"target": "",
							"name": "Maple Step",
							"description": "<b>Maple Step</b><br>Increase target's 1 random skill cooldown for 4 extra turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 5
								}]
						}, {
							"id": 4,
							"level": 25,
							"damageBonus": 4,
							"cooldown": 10,
							"target": "",
							"name": "Maple Kick",
							"description": "<b>Maple Kick</b><br>Inflicts chaos on target. (cannot control character and use jutsu) (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}]
				},
				"pet214": {
					"id": "214",
					"name": "Karasu Tengu",
					"description": "Karasu Tengu",
					"swfName": "pet_214",
					"clsName": "Pet_214",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "fire",
					"max_level": 20,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack ",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 3,
							"cooldown": 5,
							"target": "",
							"name": "Evil Break",
							"description": "<b>Evil Break</b><br>Target will not allow to use any Ninjutsu. (1 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Blessing",
							"description": "<b>Blessing</b><br>Recover master’s HP by 3% for 3 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 4,
									"amount": 3
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 3,
							"cooldown": 6,
							"target": "",
							"name": "Triple Cyclone",
							"description": "<b>Triple Cyclone</b><br>Bleeding effect occur which will increase 15% extra damage (3 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_bleeding",
									"duration": 4,
									"amount": 15,
									"chance": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 4,
							"cooldown": 8,
							"target": "",
							"name": "Penalty",
							"description": "<b>Penalty</b><br>Stun target (2 turns).",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}]
				},
				"pet215": {
					"id": "215",
					"name": "Black Feather Dragon (IV)",
					"description": "Black Feather Dragon (IV)",
					"swfName": "pet_215",
					"clsName": "Pet_215",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 2.5,
							"cooldown": 0,
							"target": "",
							"name": "Feather Attack",
							"description": "<b>Feather Attack</b><br>Decrease target's dodge rate by 8% (1 turn).",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "dodge_reduction",
									"duration": 2,
									"amount": 8
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 3,
							"cooldown": 5,
							"target": "",
							"name": "Thunder Shoot",
							"description": "<b>Thunder Shoot</b><br>Inflicts internal injury status for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 3
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "master",
							"name": "Dance of Feather",
							"description": "<b>Dance of Feather</b><br>Increase master's dodge chance by 35% for 3 turns.",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_dodge_bonus",
									"duration": 4,
									"amount": 35
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 4,
							"cooldown": 8,
							"target": "",
							"name": "Sky Raid",
							"description": "<b>Sky Raid</b><br>Has 50% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "clear_buff",
									"chance": 50
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "self",
							"name": "Spread Wings",
							"description": "<b>Spread Wings</b><br>Increase self accuracy by 30% (7 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_attention",
									"duration": 8,
									"amount": 30
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 4.5,
							"cooldown": 10,
							"target": "all",
							"name": "Lightning Feathers",
							"description": "<b>Lightning Feathers</b><br>Stun all the targets for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						}
					]
				},
				"pet216": {
					"id": "216",
					"name": "Christmas Kyubi",
					"description": "Christmas Kyubi",
					"swfName": "pet_216",
					"clsName": "Pet_216",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 3,
					"support_rate": 3,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 5,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 6,
							"cooldown": 5,
							"target": "",
							"name": "Light Snowball",
							"description": "<b>Light Snowball</b><br>Blow out a small snowball from pet's month which stun target for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 2
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 7,
							"cooldown": 7,
							"target": "",
							"name": "Frozen Gedo Cannon",
							"description": "<b>Frozen Gedo Cannon</b><br>Shoot out a Chakra ice beam, 80% chance to remove all buffs from target.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 80
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "self",
							"name": "Snow Gedo Armor",
							"description": "<b>Snow Gedo Armor</b><br>Increase accuracy by 100% (4 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_attention",
									"duration": 5,
									"amount": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 8,
							"cooldown": 8,
							"target": "all",
							"name": "Secret: Snow Bullet Combo",
							"description": "<b>Secret: Snow Bullet Combo</b><br>Throw a giant snowball out, and split into many small snowballs. Stun all targets. (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 10,
							"cooldown": 10,
							"target": "all",
							"name": "Secret: Frozen Gedo World",
							"description": "<b>Secret: Frozen Gedo World</b><br>Shoot out a Chakra ice beam to a whole area, reduce all target's HP & CP by 10%.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 10
								}]
						}]
				},
				"pet217": {
					"id": "217",
					"name": "Christmas Hachibi",
					"description": "Christmas Hachibi",
					"swfName": "pet_217",
					"clsName": "Pet_217",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 2,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 5,
							"target": "",
							"name": "Dark Snowball",
							"description": "<b>Dark Snowball</b><br>Transform Chakra into Snowball attack. Reduces critical chance, dodge chance, combustion chance, purify chance and reactive force chance of target by 20% for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 4,
									"amount": 20
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 5,
							"cooldown": 7,
							"target": "",
							"name": "Ice Bite",
							"description": "<b>Ice Bite</b><br>Use Ice power to tear enemy into pieces. Inflicts 50% 'Bleeding' status for 2 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 50
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "self",
							"name": "Snow Gedo Armor",
							"description": "<b>Snow Gedo Armor</b><br>Increase accuracy by 100% (4 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_attention",
									"duration": 5,
									"amount": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 6,
							"cooldown": 8,
							"target": "all",
							"name": "Secret: Blowing Snow Doppelganger Impulse",
							"description": "<b>Secret: Blowing Snow Doppelganger Impulse</b><br>Blowing snow to produce phantom and attack all target. Inflicts chaos on all targets. (cannot control character and use jutsu) (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 3
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 7,
							"cooldown": 8,
							"target": "all",
							"name": "Secret: Wave of Haze Snow",
							"description": "<b>Secret: Wave of Haze Snow</b><br>Focus all the Snow Power in a seal, and attack all targets. Reduce all target's HP & CP by 10%.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 10
								}]
						}]
				},
				"pet218": {
					"id": "218",
					"name": "Christmas Nanabi",
					"description": "Christmas Nanabi",
					"swfName": "pet_218",
					"clsName": "Pet_218",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 3,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 5,
							"target": "",
							"name": "Snow Smash Fist",
							"description": "<b>Snow Smash Fist</b><br>Lose target's balance by attacking the snow. Disables target’s weapon attack for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dismantle",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 5,
							"cooldown": 7,
							"target": "",
							"name": "Snow Bomb",
							"description": "<b>Snow Bomb</b><br>Throw a giant snowball toward target, a random skill will enter Cool Down for 6 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "add_cooldown",
									"amount": 7
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 5,
							"cooldown": 8,
							"target": "",
							"name": "Underground Snow Pit Strike",
							"description": "<b>Underground Snow Pit Strike</b><br>Dive into the snow and summon snow pit to trap target. Reduce 100% target's dodge rate (2 turns)",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dodge_reduction",
									"duration": 3,
									"amount": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 6,
							"cooldown": 8,
							"target": "",
							"name": "Secret: Snow Ferret Fist",
							"description": "<b>Secret: Snow Ferret Fist</b><br>Dive into and assimilate the snow. Attack target with a large fist. Inflicts frozen status for 3 turns. (Frozen target cannot move but damage taken is reduced by 80%)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_freeze",
									"duration": 4,
									"chance": 100
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 7,
							"cooldown": 8,
							"target": "all",
							"name": "Secret: Iceberg Break Strike",
							"description": "<b>Secret: Iceberg Break Strike</b><br>Use combo attack to destroy the iceberg. Reduce all target's HP &amp; CP by 10%.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 10
								}]
						}]
				},
				"pet219": {
					"id": "219",
					"name": "Chocolate Dragon (IV)",
					"description": "Chocolate Dragon (IV)",
					"swfName": "pet_219",
					"clsName": "Pet_219",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 100000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 3,
							"cooldown": 0,
							"target": "",
							"name": "Chocolate Sauce",
							"description": "<b>Chocolate Sauce</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 4,
							"cooldown": 6,
							"target": "",
							"name": "Chocolate Flame",
							"description": "<b>Chocolate Flame</b><br>Burns target HP by 3% for 2 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_burn",
									"duration": 3,
									"amount": 3
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 5,
							"cooldown": 8,
							"target": "",
							"name": "Eyes Laser",
							"description": "<b>Eyes Laser</b><br>Target reduce 8% HP.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_hp",
									"amount": 8
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 9,
							"target": "self",
							"name": "Chocolate Snack",
							"description": "<b>Chocolate Snack</b><br>Increase damage by 100% for 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_bonus", // "damage_bonus",
									"duration": 3,
									"amount": 100
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 5,
							"cooldown": 9,
							"target": "all",
							"name": "Chocolate Storm",
							"description": "<b>Chocolate Storm</b><br>Bleeding effect occur which will increase 100% extra damage (1 turn)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "bleeding",
									"duration": 2,
									"amount": 100
								}
							]
						},
						{
							"id": 5,
							"level": 25,
							"damageBonus": 5,
							"cooldown": 7,
							"target": "",
							"name": "Secret: Sneak",
							"description": "<b>Secret: Sneak</b><br>Drain 6% HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_drain_hp",
									"amount": 6
								}
							]
						}
					]
				},
				"pet220": {
					"id": "220",
					"name": "Sakura Dragon Girl",
					"description": "Sakura Dragon Girl",
					"swfName": "pet_220",
					"clsName": "Pet_220",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 2,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 25,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 2.5,
							"cooldown": 7,
							"target": "",
							"name": "Flame of Sakura",
							"description": "<b>Flame of Sakura</b><br>Burns target HP by 3% for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 4
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 3,
							"cooldown": 7,
							"target": "",
							"name": "Sakura Breeze",
							"description": "<b>Sakura Breeze</b><br>Has 35% chance to remove positive status.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 35
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 6,
							"target": "master",
							"name": "Blessed Sakura",
							"description": "<b>Blessed Sakura</b><br>Recover master 5% HP, 2 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 3,
							"cooldown": 9,
							"target": "",
							"name": "Sakura Claw Marks",
							"description": "<b>Sakura Claw Marks</b><br>Drain 5%HP from target and recover to master.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 5
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 3,
							"cooldown": 9,
							"target": "all",
							"name": "Secret: Sakura Darts",
							"description": "<b>Secret: Sakura Darts</b><br>Stun all targets (2 turns).",
							"action": "attack",
							"animation": "attack_06",
							"posType": "range2",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}]
				},
				"pet221": {
					"id": "221",
					"name": "Easter Rokubi",
					"description": "Easter Rokubi",
					"swfName": "pet_221",
					"clsName": "Pet_221",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"gold": 0,
					"token": 10000,
					"attribute_type": "fire",
					"max_level": 25,
					"premium": false,
					"vendor": false,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 4,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 4,
							"target": "",
							"name": "Strong Blade",
							"description": "<b>Strong Blade</b><br>Use strong tornado to make a sharp blade and attack target. Weaken target by 90% for 1 turn",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 2,
									"amount": 90
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 5,
							"cooldown": 7,
							"target": "",
							"name": "Lightning Tornado",
							"description": "<b>Lightning Tornado</b><br>Combine Lightning and Tornado together to restricts target for 3 turns (Target cannot use the ninjutsu)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 4
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Tenarashi Armor",
							"description": "<b>Tenarashi Armor</b><br>Inject Chakra into owner, Heal master 8% HP and remove all negative status effect",
							"action": "special",
							"animation": "attack_04",
							"posType": "range3",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "bloodlust_dedication",
									"amount": 8
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 6,
							"cooldown": 8,
							"target": "all",
							"name": "Secret: Crack Space",
							"description": "<b>Secret: Crack Space</b><br>Trigger an explosion and create a cracking atmosphere. Reduces critical chance, dodge chance, combustion chance, purify chance and reactive force chance of all targets by 30% for 3 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 4,
									"amount": 30
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 7,
							"cooldown": 8,
							"target": "all",
							"name": "Secret: Dance of Gale World",
							"description": "<b>Secret: Dance of Gale World</b><br>Summon gale force to attack all targets. Reduce all target's HP & CP by 10%.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 10
								}]
						}]
				},
				"pet222": {
					"id": "222",
					"name": "Easter Gobi",
					"description": "Easter Gobi",
					"swfName": "pet_222",
					"clsName": "Pet_222",
					"type": 1,
					"attack_rate": 3,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 25,
					"gold": 0,
					"token": 10000,
					"premium": false,
					"vendor": false,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 4,
							"cooldown": 0,
							"target": "",
							"name": "Wind Tag: Hot Wind",
							"description": "<b>Wind Tag: Hot Wind</b><br>Hot wind attack. Reduce 10% target's dodge rate (1 turn)",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "dodge_reduction",
									"duration": 2,
									"amount": 10
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 5,
							"target": "",
							"name": "Lightning Tag: Red Thunder",
							"description": "<b>Lightning Tag: Red Thunder</b><br>Red Lightning which make enemy unable to move. Stun target for 2 turns",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 3
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 5,
							"cooldown": 7,
							"target": "",
							"name": "Fire Tag: Explosive Flame",
							"description": "<b>Fire Tag: Explosive Flame</b><br>Burn to reduce enemy's 5% HP. (2 turns)",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_burn",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Earth Tag: Red Earth",
							"description": "<b>Earth Tag: Red Earth</b><br>Protect master from all attacks. (2 turns)",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "guard", // "complete_guard",
									"duration": 3
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 6,
							"cooldown": 8,
							"target": "",
							"name": "Water Tag: Aqua Regia",
							"description": "<b>Water Tag: Aqua Regia</b><br>Corrode enemy with aqua regia. Poison to enemy, target reduce 2%HP each turn. (2 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "poison",
									"duration": 3,
									"amount": 5
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 7,
							"cooldown": 8,
							"target": "all",
							"name": "Secret: Five Tag Infinity",
							"description": "<b>Secret: Five Tag Infinity</b><br>Attack all enemies with different elements. Reduce all target's HP & CP by 10%",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 10
								}]
						}]
				},
				"pet227": {
					"id": "227",
					"name": "Striker Wolf",
					"description": "Striker Wolf",
					"swfName": "pet_227",
					"clsName": "Pet_227",
					"type": 1,
					"attack_rate": 1,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "water",
					"max_level": 25,
					"gold": 0,
					"token": 1000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 1,
							"cooldown": 0,
							"target": "",
							"name": "Basic Attack",
							"description": "<b>Basic Attack</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 1,
							"cooldown": 8,
							"target": "",
							"name": "Vacuum Shoot",
							"description": "<b>Vacuum Shoot</b><br>Bleeding effect occur which will increase 20% extra damage (2 turn)",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bleeding",
									"duration": 3,
									"amount": 20
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 1,
							"cooldown": 7,
							"target": "",
							"name": "Diving Header Attack",
							"description": "<b>Diving Header Attack</b><br>Stun target (1 turn).",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "stun",
									"duration": 2
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 1,
							"cooldown": 10,
							"target": "",
							"name": "Lightning Long Shot",
							"description": "<b>Lightning Long Shot</b><br>To blinds the target for 2 turns (30% accuracy reduction).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "blind",
									"duration": 3,
									"amount": 30
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 8,
							"target": "master",
							"name": "Musical Whistle",
							"description": "<b>Musical Whistle</b><br>Increase master's all attack damage, critical chance & accuracy by 25% (2 turns)",
							"action": "special",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_lightning",
									"duration": 3,
									"amount": 25
								}]
						}, {
							"id": 5,
							"level": 25,
							"damageBonus": 1,
							"cooldown": 12,
							"target": "",
							"name": "Blind Spot Corner Ball",
							"description": "<b>Blind Spot Corner Ball</b><br>Inflicts internal injury status for 2 turns.",
							"action": "attack",
							"animation": "attack_06",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "internal_injury", // "battle_internal_injury",
									"duration": 3
								}]
						}]
				},
				"pet228": {
					"id": "228",
					"name": "Mini Gashadokuro",
					"description": "Mini Gashadokuro",
					"swfName": "pet_228",
					"clsName": "Pet_228",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 2,
							"cooldown": 0,
							"target": "",
							"name": "Basic attack",
							"description": "<b>Basic attack</b><br>Basic attack",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {"type": "no effect"}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 0,
							"cooldown": 10,
							"target": "master",
							"name": "Soul of Blade",
							"description": "<b>Soul of Blade</b><br>Increases master's damage by 20% for 4 turns.",
							"action": "special",
							"animation": "attack_02",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_damage_bonus",
									"duration": 4,
									"amount": 20
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "",
							"name": "Blade Attack",
							"description": "<b>Blade Attack</b><br>Has 40% chance to remove all positive status to the target.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "clear_buff",
									"chance": 40
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Power of Hungry Soul",
							"description": "<b>Power of Hungry Soul</b><br>Increases master's critical, dodge, combustion, purify and reactive force chance by 12% for 4 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range1",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_energize",
									"duration": 4,
									"amount": 12
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 2,
							"cooldown": 5,
							"target": "",
							"name": "Soul of Blade",
							"description": "<b>Soul of Blade</b><br>Target's damage reduces 15% (3 turns)",
							"action": "attack",
							"animation": "attack_05",
							"posType": "range3",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_weaken",
									"duration": 3,
									"amount": 15
								}]
						}]
				},
				"pet230": {
					"id": "230",
					"name": "White Choco Dragon Egg (I)",
					"description": "White Choco Dragon Egg (I)",
					"swfName": "pet_230",
					"clsName": "Pet_230",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Bite",
							"description": "<b>Bite</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 8,
							"target": "",
							"name": "Glaze Fire",
							"description": "<b>Glaze Fire</b><br>Spews out fire to glaze the target. Burns target HP by 5% for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burning",
									"duration": 2,
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 7,
							"target": "",
							"name": "Essence Breath",
							"description": "<b>Essence Breath</b><br>Expels large quantity of its own natural essence to the target. Reduces target CP by 7%.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp",
									"amount": 7
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0.3,
							"cooldown": 9,
							"target": "",
							"name": "Cocoa Egg Roll",
							"description": "<b>Cocoa Egg Roll</b><br>Encloses itself inside its egg shell to attack. Stuns the target for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Chocolate Barricade",
							"description": "<b>Chocolate Barricade</b><br>Creates a chocolate wall to reduce incoming damage. Reduces damage taken by 10% for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"duration": 3,
									"amount": 10
								}
							]
						}
					]
				},
				"pet231": {
					"id": "231",
					"name": "Pink Choco Dragon Egg (I)",
					"description": "Pink Choco Dragon Egg (I)",
					"swfName": "pet_231",
					"clsName": "Pet_231",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 1,
					"attribute_type": "null",
					"max_level": 20,
					"gold": 0,
					"token": 10000,
					"skill": [
						{
							"id": 0,
							"level": 1,
							"damageBonus": 0,
							"cooldown": 0,
							"target": "",
							"name": "Bite",
							"description": "<b>Bite</b><br>Pet's basic attack.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "no effect"
								}
							]
						},
						{
							"id": 1,
							"level": 5,
							"damageBonus": 0.2,
							"cooldown": 8,
							"target": "",
							"name": "Glaze Fire",
							"description": "<b>Glaze Fire</b><br>Spews out fire to glaze the target. Burns target HP by 5% for 1 turn.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burning",
									"duration": 2,
									"amount": 5
								}
							]
						},
						{
							"id": 2,
							"level": 10,
							"damageBonus": 0.2,
							"cooldown": 7,
							"target": "",
							"name": "Essence Breath",
							"description": "<b>Essence Breath</b><br>Expels large quantity of its own natural essence to the target. Reduces target CP by 7%.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "burn_cp",
									"amount": 7
								}
							]
						},
						{
							"id": 3,
							"level": 15,
							"damageBonus": 0.3,
							"cooldown": 9,
							"target": "",
							"name": "Cocoa Egg Roll",
							"description": "<b>Cocoa Egg Roll</b><br>Encloses itself inside its egg shell to attack. Stuns the target for 2 turns.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [
								{
									"type": "stun",
									"duration": 3
								}
							]
						},
						{
							"id": 4,
							"level": 20,
							"damageBonus": 0,
							"cooldown": 12,
							"target": "master",
							"name": "Chocolate Barricade",
							"description": "<b>Chocolate Barricade</b><br>Creates a chocolate wall to reduce incoming damage. Reduces damage taken by 10% for 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [
								{
									"type": "pet_damage_reduction",
									"duration": 3,
									"amount": 10
								}
							]
						}
					]
				},
				"pet232": {
					"id": "232",
					"name": "Ryujin",
					"description": "An ancient mythical creature that is very intelligent. Some say it is the herald of an upcoming apocalypse.",
					"swfName": "pet_232",
					"clsName": "Pet_232",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "water",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 3,
							"cooldown": 0,
							"target": "all",
							"name": "Slithering Cleave",
							"description": "<b>Slithering Cleave</b><br>A wide cleaving attack. Reduces targets’ Critical, Dodge, ‘Combustion’, ‘Purify’ and ‘Reactive Force’ chance by 20% for 2 turns.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 3,
									"amount": 20
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 5,
							"cooldown": 5,
							"target": "all",
							"name": "Vitality Shift",
							"description": "<b>Vitality Shift</b><br>Absorbs the life force of the targets. Drains 10% of the targets’ max HP and recover it to the master.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_drain_hp",
									"amount": 10
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 5,
							"cooldown": 7,
							"target": "all",
							"name": "Serpent Scourge",
							"description": "<b>Serpent Scourge</b><br>A quick and strong lashing. Inflicts ‘Chaos’ status for 3 turns.",
							"action": "attack",
							"animation": "attack_03",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "chaos",
									"duration": 4
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 0,
							"cooldown": 7,
							"target": "master",
							"name": "Magic Transfer",
							"description": "<b>Magic Transfer</b><br>Super charges itself to provide support. Applies ‘Debuff Resist’ for 3 turns.",
							"action": "special",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_debuff_resist",
									"duration": 4,
									"amount": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 7,
							"cooldown": 7,
							"target": "all",
							"name": "Great Serpent Blast",
							"description": "<b>Great Serpent Blast</b><br>An all-out attack! Reduces targets’ max HP and CP by 15% ",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "burn_cp_hp",
									"amount": 15
								}]
						}]
				},
				"pet233": {
					"id": "233",
					"name": "Noppera",
					"description": "A mysterious yokai that is very docile and friendly. It spreads luck if it is happy.",
					"swfName": "pet_233",
					"clsName": "Pet_233",
					"type": 1,
					"attack_rate": 2,
					"defend_rate": 1,
					"support_rate": 2,
					"attribute_type": "fire",
					"max_level": 20,
					"gold": 0,
					"token": 100000,
					"skill": [ {
							"id": 0,
							"level": 1,
							"damageBonus": 4,
							"cooldown": 0,
							"target": "",
							"name": "Black Spear",
							"description": "<b>Black Spear</b><br>A Black Spear that pierces anything. Has a 100% chance to ‘Restrict’ target for 1 turn.",
							"action": "attack",
							"animation": "attack_01",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "bundle",
									"duration": 2
								}]
						}, {
							"id": 1,
							"level": 5,
							"damageBonus": 6,
							"cooldown": 5,
							"target": "all",
							"name": "Cursing Masks",
							"description": "<b>Cursing Masks</b><br>Summons several magic masks to curse targets. Reduce critical, dodge, combustion, purify and reactive force chance of all targets by 20% for 3 turns.",
							"action": "attack",
							"animation": "attack_02",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_disoriented",
									"duration": 4,
									"amount": 20
								}]
						}, {
							"id": 2,
							"level": 10,
							"damageBonus": 0,
							"cooldown": 6,
							"target": "master",
							"name": "Dark Copy",
							"description": "<b>Dark Copy</b><br>Creates a copy of itself to protect its master. Recover master's HP by 10% (1 turns)",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 2,
									"amount": 10
								}]
						}, {
							"id": 3,
							"level": 15,
							"damageBonus": 15,
							"cooldown": 7,
							"target": "all",
							"name": "Murder of Crows",
							"description": "<b>Murder of Crows</b><br>A murder of crows. This skill has high damage and accuracy.",
							"action": "attack",
							"animation": "attack_04",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "hundred_percent_attack",
									"amount": 100
								}]
						}, {
							"id": 4,
							"level": 20,
							"damageBonus": 8,
							"cooldown": 7,
							"target": "all",
							"name": "Void World",
							"description": "<b>Void World</b><br>Releases overflowing void energy from its body. Reduces all targets’ max HP & CP by 8% and applies ‘Stun’ status for 3 turns.",
							"action": "attack",
							"animation": "attack_05",
							"posType": "melee1",
							"hasDamage": true,
							"skill_cp": 0,
							"effect": [ {
									"type": "coilding_wave", // "colliding_wave",
									"duration": 4,
									"amount": 8
								}]
						}]
				}
			};

		public function PetLibrary()
		{
			super();
		}
	}

}