package
{

    public class BattleUtils
    {
        public static const DAMAGE_RANGE =  0.2;

        public static function checkTargetIsDead(selected:uint, charArr:Vector.<Pet>):Object
		{
			if (charArr[selected].getIsDead())
			{
				for (var i in charArr)
				{
					if (!charArr[i].getIsDead())
					{
						return charArr[i];
					}
				}
			}
			return charArr[selected];
		}

		public static function setupAvailableSkills(mc)
		{
			mc.allActions = [];
			for (var i in mc.skillData)
			{
				if (mc.getSkillCooldown()[i] <= 0)
				{
					mc.allActions.push(mc.skillData[i]);
				}
			}
		}

        public static function updateSkillCooldown(petObj:Object, skillNo:int)
		{
			// trace("update skill cooldown start");
			var cooldown = petObj.getSkillCooldown();
			// trace("--------" + petObj.getPetObj()["name"] + "---------");
			for (var i in cooldown)
			{
				if (cooldown[i] > 0)
				{
					cooldown[i]--;
				}
				// trace(petObj.skillData[i]["name"] + " :" + cooldown[i]);
			}
			// trace("========================");
			if (skillNo != -1)
			{
				cooldown[skillNo] = petObj.skillData[skillNo]["cooldown"];
			}
			petObj.setSkillCooldown(cooldown);
			// trace("update skill cooldown finish");
		}

        public static function calcDamage(amount:int, damageBonus):int
		{
			amount = int(amount + Math.round(amount * damageBonus));
			var constVal = DAMAGE_RANGE;
			var minVal = amount - amount * constVal;
			var maxVal = amount + amount * constVal;
			return Math.round(Math.random() * (maxVal - minVal) + minVal);
		}

        public static function updateHP(obj, health)
        {
            obj.setHP((obj.getHP() + health));
        }

        public static function updateCP(obj, chakra)
        {
            obj.setCP((obj.getCP() + chakra));
        }

        public static function isDupliEffect(effectObj, objStats, isBuff)
        {
            var effectArr = isBuff ? objStats.getBuffArr() : objStats.getDebuffArr();
            if (effectArr[effectObj["type"]] != undefined)
            {
                effectArr[effectObj["type"]] = effectObj;
                return true;
            }
            return false;
        }

        public static function charge(target)
		{
			var baseAmount = 25;
			var chargeAmount = baseAmount;
			var chargeDisable = hasEffect("restrict_charge", target, false);
			if (chargeDisable["has"])
			{
				updateCP(target, 0);
				return;
			}
			var chargeBonus = hasEffect("charge_cp_bonus", target, true);
			if (chargeBonus["has"])
			{
				chargeAmount += chargeBonus["amount"];
			}
			var reduceCharge = hasEffect("pet_reduce_charge", target, false);
			if (reduceCharge["has"])
			{
				chargeAmount -= reduceCharge["amount"];
			}
			updateCP(target, chargeAmount);
		}

        public static function checkDamage(damage, attacker, defender)
        {
            // trace("checkDamage start");
            if (hasEffect("guard", defender, true)["has"])
            {
                // trace("checkDamage finish guard");
                return 0;
            }
            var strength = hasEffect("pet_damage_bonus", attacker, true);
            var tempDamage = damage;
            if (strength["has"])
            {
                tempDamage = damage * (strength["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " strength");
            }
            var fearWeaken = hasEffect("fear_weaken", attacker, false);
            if (fearWeaken["has"])
            {
                tempDamage = damage * (fearWeaken["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " fear weaken");
            }
            var weaken = hasEffect("pet_weaken", attacker, false);
            if (weaken["has"])
            {
                tempDamage = damage * (weaken["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " weaken");
            }
            var protection = hasEffect("damage_reduction", defender, false);
            if (protection["has"])
            {
                tempDamage = damage * (protection["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " protection");
            }
            var petProtection = hasEffect("pet_damage_reduction", defender, false);
            if (petProtection["has"])
            {
                tempDamage = damage * (petProtection["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " protection");
            }
            var frozen = hasEffect("pet_freeze", attacker, false);
            if (frozen["has"])
            {
                tempDamage = damage * (frozen["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " frozen");
            }

            var bleeding = hasEffect("bleeding", defender, false);
            if (bleeding["has"])
            {
                tempDamage = damage * (bleeding["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " bleeding");
            }

            // TODO chance
            var petBleeding = hasEffect("pet_bleeding", defender, false);
            if (petBleeding["has"])
            {
                tempDamage = damage * (petBleeding["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " petBleeding");
            }
            var petBunnyFrenzyDef = hasEffect("bunny_frenzy", defender, true);
            if (petBunnyFrenzyDef["has"])
            {
                tempDamage = damage * (20 / 100);
                damage = damage + tempDamage;
                // trace(damage + " bunny_frenzy defender side effect");
            }
            var petBunnyFrenzyAtt = hasEffect("bunny_frenzy", attacker, true);
            if (petBunnyFrenzyAtt["has"])
            {
                tempDamage = damage * 2;
                damage = damage + tempDamage;
                // trace(damage + " bunny_frenzy");
            }
            var battleBunnyFrenzy = hasEffect("battle_bunny_frenzy", attacker, true);
            if (battleBunnyFrenzy["has"])
            {
                tempDamage = damage * 0.25;
                damage = damage + tempDamage;
                // trace(damage + " battleBunnyF");
            }
            var catalyticMatter = hasEffect("catalytic_matter", attacker, true);
            if (catalyticMatter["has"])
            {
                tempDamage = damage * (catalyticMatter["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " catalyticMatter");
            }
            var petLightning = hasEffect("pet_lightning", attacker, true);
            if (petLightning["has"])
            {
                tempDamage = damage * (petLightning["amount"] / 100);
                damage = damage + tempDamage;
                trace(damage + " petLightning");
            }
            
            if (checkCritical(attacker))
            {
                var criticalDamageBase = 150;
                var criticalDamageAmount = criticalDamageBase;
                var critRate = hasEffect("crit_chance_dmg", attacker, true);
                if (critRate["has"])
                {
                    criticalDamageBase += critRate["amount"];
                    trace(criticalDamageBase + " crit_chance_dmg");
                }
                var hamstring = hasEffect("hamstring", attacker, true);
                if (hamstring["has"])
                {
                    criticalDamageAmount -= 25;
                }
                damage *= criticalDamageAmount / 100;
                // trace(damage + " critical strike");
            }
            // trace(Math.round(damage));
            // trace("checkDamage finish");
            return Math.round(damage);
        }

        public static function checkCritical(charObj)
        {
            // trace("checkCritical start");

            var criticalRandom = Math.floor(Math.random() * 100);
            var criticalChance = charObj.getCritical();
            var critObj = hasEffect("critical_chance_bonus", charObj, true);
            if (critObj["has"])
            {
                criticalChance += critObj["amount"];
                // trace("cc bonus");
            }
            var bunnyFrenzy = hasEffect("bunny_frenzy", charObj, true);
            if (bunnyFrenzy["has"])
            {
                criticalChance += 25;
                // trace("bunny frenzy");
            }
            var battleBunnyFrenzy = hasEffect("battle_bunny_frenzy", charObj, true);
            if (battleBunnyFrenzy["has"])
            {
                criticalChance += 25;
                // trace("bunny frenzy");
            }
            var petEnergize = hasEffect("pet_energize", charObj, true);
            if (petEnergize["has"])
            {
                criticalChance += petEnergize["amount"];
                // trace("energize");
            }
            var petDiso = hasEffect("pet_disoriented", charObj, true);
            if (petDiso["has"])
            {
                criticalChance -= petDiso["amount"];
                // trace("disoriented");
            }
            var critRate = hasEffect("crit_chance_dmg", charObj, true);
            if (critRate["has"])
            {
                criticalChance += 15;
                // trace("crit_chance_dmg");
            }
            var petLightning = hasEffect("pet_lightning", charObj, true);
            if (petLightning["has"])
            {
                criticalChance += petLightning["amount"];
            }
            if (Math.round(criticalChance) >= criticalRandom)
            {
                // trace("checkCritical finish true");
                return true;
            }
            // trace("checkCritical finish false");
            return false;
        }

        public static function checkDodge(attacker:Pet, defender:Pet)
        {
            var dodgeRandom = Math.floor(Math.random() * 100);
            var dodgeChance = defender.getDodge();
            var dodgeObj = hasEffect("dodge_bonus", defender, true);
            if (dodgeObj["has"])
            {
                dodgeChance += dodgeObj["amount"];
                // trace("dodge bonus");
            }
            var petDodgeObj = hasEffect("pet_dodge_bonus", defender, true);
            if (petDodgeObj["has"])
            {
                dodgeChance += petDodgeObj["amount"];
                // trace("pet dodge bonus");
            }
            var dodgeReduce = hasEffect("dodge_reduction", defender, false);
            if (dodgeReduce["has"])
            {
                dodgeChance -= dodgeReduce["amount"];
                // trace("dodge reduce");
            }
            var blindObj = hasEffect("blind", attacker, false);
            if (blindObj["has"])
            {
                dodgeChance += blindObj["amount"];
                // trace("blind attacker");
            }
            var petBlindObj = hasEffect("pet_blind", attacker, false);
            if (petBlindObj["has"])
            {
                dodgeChance += petBlindObj["amount"];
                // trace("pet blind attacker");
            }
            var petDiso = hasEffect("pet_disoriented", attacker, false);
            if (petDiso["has"])
            {
                dodgeChance -= petDiso["amount"];
                // trace("disoriented");
            }
            var petEnergize = hasEffect("pet_energize", attacker, true);
            if (petEnergize["has"])
            {
                dodgeChance += petEnergize["amount"];
                // trace("energize");
            }
            /*if (dodgeChance >= dodgeRandom) {
				return true;
			}
			return false;*/
            return dodgeChance;
        }

        public static function checkPurify(charObj)
        {
            // trace("check purify start");
            var purifyRandom = Math.floor(Math.random() * 100);
            // trace(purifyRandom);
            var purifyChance = charObj.getPurify();
            var petEnergize = hasEffect("pet_energize", charObj, true);
            if (petEnergize["has"])
            {
                purifyChance += petEnergize["amount"];
                // trace("energize");
            }
            var purifyBonus = hasEffect("add_purify_chance", charObj, true);
            if (purifyBonus["has"])
            {
                purifyChance += purifyBonus["amount"];
                // trace("add purify");
            }
            var purifyReduce = hasEffect("reduce_purify_chance", charObj, true);
            if (purifyReduce["has"])
            {
                purifyChance -= purifyReduce["amount"];
                // trace("reduce purify");
            }
            var petDiso = hasEffect("pet_disoriented", charObj, true);
            if (petDiso["has"])
            {
                purifyChance -= petDiso["amount"];
                // trace("disoriented");
            }
            return purifyChance >= purifyRandom;
        }

        public static function checkHit(attacker:Pet, defender:Pet)
        {
            var accRandom = Math.floor(Math.random() * 100);
            var accPoints = 100;
            if (hasEffect("hundred_percent_attack", attacker, true)["has"])
            {
                return true;
            }
            var accBonus = checkDodge(attacker, defender);
            accPoints -= accBonus;
            var petAttention = hasEffect("pet_attention", attacker, true);
            if (petAttention["has"])
            {
                accPoints += petAttention["amount"];
            }
            var petLightning = hasEffect("pet_lightning", attacker, true);
            if (petLightning["has"])
            {
                 accPoints += petLightning["amount"];
            }
            if (accPoints >= accRandom)
            {
                return true;
            }
            return false;
        }

        public static function hasEffect(effectType, obj, isBuff)
        {
            var effectArr = isBuff ? obj.getBuffArr() : obj.getDebuffArr();
            if (effectArr[effectType] != null)
            {
                return {
                        "has": true,
                        "type": effectArr[effectType]["type"],
                        "amount": effectArr[effectType]["amount"],
                        "duration": effectArr[effectType]["duration"]
                    };
            }
            return {
                    "has": false,
                    "amount": 0,
                    "duration": 0
                };
        }

        public function bothEffect(effectObj, attacker, target)
        {

        }

        public static function directDebuff(effectObj, attacker, target, master, targetType = "self")
        {
            // var targetStats = target["stats"];
            var burnHP, burnCP;
            if (effectObj["type"] == "burn_hp")
            {
                burnHP = Math.round(target.getMaxHP() * (effectObj["amount"]) / 100);
                updateHP(target, -burnHP);
                return true;
            }
            else if (effectObj["type"] == "burn_cp")
            {
                burnCP = Math.round(target.getMaxCP() * (effectObj["amount"]) / 100);
                updateCP(target, -burnCP);
                return true;
            }
            else if (effectObj["type"] == "burn_cp_hp")
            {
                burnHP = Math.round(target.getMaxHP() * (effectObj["amount"]) / 100);
                burnCP = Math.round(target.getMaxCP() * (effectObj["amount"]) / 100);
                updateHP(target, -burnHP);
                updateCP(target, -burnCP);
                return true;
            }
            else if (effectObj["type"] == "clear_buff")
            {
                // TODO chance
                target.setBuffArr( {});
                return true;
            }
            else if (effectObj["type"] == "drain_hp")
            {
                burnHP = Math.round(target.getHP() * (effectObj["amount"]) / 100);
                updateHP(attacker, burnHP);
                updateHP(target, -burnHP);
                return true;
            }
            else if (effectObj["type"] == "pet_drain_hp")
            {
                burnHP = Math.round(target.getHP() * (effectObj["amount"]) / 100);
                updateHP(master, burnHP);
                updateHP(target, -burnHP);
                return true;
            }
            else if (effectObj["type"] == "drain_cp")
            {
                burnCP = Math.round(target.getCP() * (effectObj["amount"]) / 100);
                updateCP(attacker, burnCP);
                updateCP(target, -burnCP);
                return true;

            }
            else if (effectObj["type"] == "pet_drain_cp")
            {
                burnCP = Math.round(target.getCP() * (effectObj["amount"]) / 100);
                updateCP(attacker, burnCP);
                updateCP(target, -burnCP);
                return true;

            }
            else if (effectObj["type"] == "add_cooldown")
            {
                var randomSkill = Math.floor(Math.random() * target.getSkillData().length) + 1;
                var cooldownTemp = target.getCooldown();
                cooldownTemp[randomSkill] += (effectObj["amount"] - 1);
                target.setCooldown(cooldownTemp);
            }
            return false;
        }

        public static function directBuff(effectObj, target)
        {
            var cooldown;
            if (effectObj["type"] == "oil_bottle")
            {
                cooldown = target.getPet().getSkillCooldown();
                cooldown[2] = 0;
                target.getPet().setSkillCooldown(cooldown);
                return true;
            }
            else if (effectObj["type"] == "heal")
            {
                // done
                var heal = effectObj["amount"];
                if (target.getIsDead() || hasEffect("internal_injury", target, false)["has"])
                {
                    heal = 0;
                }
                updateHP(target, heal);
                return true;
            }
            else if (effectObj["type"] == "restore_cp")
            {
                // done
                var restoreCP = effectObj["amount"];
                if (target.getIsDead())
                {
                    restoreCP = 0;
                }
                updateCP(target, restoreCP);
                return true;
            }
            else if (effectObj["type"] == "cooldown_reduction")
            {
                cooldown = target.getPet().getSkillCooldown();
                var reduceCd = effectObj["amount"];
                for (var i in cooldown)
                {
                    if (cooldown[i] - reduceCd < 0)
                    {
                        cooldown[i] = 0;
                    }
                    else
                    {
                        cooldown[i] -= reduceCd;
                    }
                }
                target.getPet().setSkillCooldown(cooldown);
                return true;
            }
            else if (effectObj["type"] == "bloodlust_dedication")
            {
                // done
                target.setDebuffArr( {});
                var heal1 = Math.round(target.getMaxHP() * (effectObj["amount"]) / 100);
                updateHP(target, heal1);
                return true;
            }
            return false;
        }
    }

}
