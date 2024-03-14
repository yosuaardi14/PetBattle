package
{

	public class PetLibrary
	{
		public static const TYPE_OFFENSIVE = 1;
		public static const TYPE_DEFENSIVE = 2;
		public static const TYPE_SUPPORTIVE = 3;

		public static function getType(swfName:String):String
		{
			switch (getPetBySwfName(swfName)["type"])
			{
				case 1:
					return "Offensive";
				case 2:
					return "Defensive";
				case 3:
					return "Supportive";
				default:
					return "Balance";
			}
		}

		public static function getPetBySwfName(swfName:String):Object
		{
			for (var i in PET)
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
							"posType": "range2",
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
											"chance": 0,
											"type": "heal",
											"amount": 50,
											"heal": 50
										}, {
											"id": 2,
											"chance": 0.33,
											"type": "restore_cp",
											"amount": 50,
											"heal": 50
										}, {
											"id": 3,
											"chance": 0.66,
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
											"chance": 0,
											"type": "stun",
											"duration": 2
										}, {
											"id": 2,
											"isDebuff": 1,
											"chance": 0.33,
											"type": "poison",
											"duration": 2,
											"amount": 5
										}, {
											"id": 3,
											"isDebuff": 1,
											"chance": 0.66,
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
											"chance": 0,
											"type": "stun",
											"duration": 2
										}, {
											"id": 2,
											"isDebuff": 1,
											"chance": 0.25,
											"type": "bundle",
											"duration": 2,
											"amount": 20
										}, {
											"id": 3,
											"isDebuff": 1,
											"chance": 0.5,
											"type": "dodge_reduction",
											"duration": 2,
											"amount": 5
										}, {
											"id": 4,
											"isDebuff": 1,
											"chance": 0.75,
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
											"chance": 0,
											"type": "coilding_wave",
											"duration": 2,
											"amount": 2
										}, {
											"id": 2,
											"isDebuff": 1,
											"chance": 0.25,
											"type": "hamstring",
											"duration": 2,
											"amount": 5
										}, {
											"id": 3,
											"isDebuff": 1,
											"chance": 0.5,
											"type": "internal_injury",
											"duration": 2
										}, {
											"id": 4,
											"isDebuff": 1,
											"chance": 0.75,
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
									"duration": "3",
									"amount": "15"
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
									"duration": "2",
									"amount": "2"
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
							"target": "self",
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
							"target": "self",
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
							"posType": "range3",
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
							"posType": "range3",
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
							"level": 10,
							"damageBonus": 2,
							"cooldown": 8,
							"target": "master",
							"name": "RANDOM EFFECT to master",
							"description": "<b>RANDOM EFFECT to master</b><br>Add random effect on master (Heal or Recover CP or Reduce Skill Cooldown).",
							"action": "special",
							"animation": "attack_03",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_random_effect_on_master",
									"EffectArray": [ {
											"id": 1,
											"chance": 0,
											"type": "heal",
											"amount": 50,
											"heal": 50
										}, {
											"id": 2,
											"chance": 0.33,
											"type": "restore_cp",
											"amount": 50,
											"heal": 50
										}, {
											"id": 3,
											"chance": 0.66,
											"type": "cooldown_reduction",
											"amount": 1
										}]
								}]
							// [ {"type": "no effect"}]
							// [ {
							// "type": "pet_random_effect_on_master",
							// "duration": 4
							// }]
						}, {
							"level": 15,
							"damageBonus": 0,
							"cooldown": 15,
							"target": "",
							"name": "RANDOM EFFECT to defender",
							"description": "<b>RANDOM EFFECT to defender</b><br>Add random effect on defender (Stun or Poison or Burn).",
							"action": "attack",
							"animation": "attack_04",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_random_effect_on_defender",
									"EffectArray": [ {
											"id": 1,
											"isDebuff": 1,
											"chance": 0,
											"type": "stun",
											"duration": 2
										}, {
											"id": 2,
											"isDebuff": 1,
											"chance": 0.33,
											"type": "poison",
											"duration": 2,
											"amount": 5
										}, {
											"id": 3,
											"isDebuff": 1,
											"chance": 0.66,
											"type": "pet_burn",
											"duration": 2,
											"amount": 5
										}]
								}]
							// [ {"type": "no effect"}]
							// [ {
							// "type": "pet_random_effect_on_defender",
							// "duration": 3
							// }]
						}, {
							"level": 20,
							"damageBonus": 2,
							"cooldown": 9,
							"target": "master",
							"name": "HEAL",
							"description": "<b>HEAL</b><br>Recover master 10% HP, 2 turns.",
							"action": "special",
							"animation": "attack_05",
							"posType": "range2",
							"hasDamage": false,
							"skill_cp": 0,
							"effect": [ {
									"type": "pet_heal",
									"duration": 3,
									"amount": 10
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
							"posType": "range2",
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
									"type": "battle_internal_injury",
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
				}
			};

		public function PetLibrary()
		{
			super();
		}
	}

}