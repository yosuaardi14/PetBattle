package
{

    public class BattleUtils
    {
        public static const DAMAGE_RANGE = 0.2;

        public static const DODGE_ACTION_OBJ = {"type": "dodge"};

        public static const PURIFY_ACTION_OBJ = {"type": "purify"};

        public static const BUFF_TYPE:String = "buff";

        public static const DEBUFF_TYPE:String = "debuff";

        public static const TARGET_MASTER:String = "master";

        public static const TARGET_SELF:String = "self";

        public static const TARGET_ALL:String = "all";
        // new
        public static const TARGET_TEAM:String = "team";

        public static const BUFF:Boolean = true;

        public static const DEBUFF:Boolean = false;

        public static function checkTargetIsDead(selected:uint, charArr:Vector.<Pet>):*
        {
            if (charArr[selected].getIsDead())
            {
                for (var i:* in charArr)
                {
                    if (!charArr[i].getIsDead())
                    {
                        return charArr[i];
                    }
                }
            }
            return charArr[selected];
        }

        public static function setupAvailableSkills(mc, obj):void
        {
            mc.allActions = [];
            for (var i in mc.skillData)
            {
                // TODO
                var cpCost:int = BattleUtils.getCPCost(mc.skillData[i]["skill_cp"], obj);
                if (obj.getCP() < cpCost)
                {
                    trace(mc.skillData[i]["name"] + "CP: " + cpCost);
                    continue;
                }
                if (mc.getSkillCooldown()[i] <= 0)
                {
                    mc.allActions.push(mc.skillData[i]);
                }
            }
        }

        public static function updateSkillCooldown(petObj:Object, skillNo:int):void
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

        public static function updateHP(obj, health):void
        {
            obj.setHP((obj.getHP() + health));
        }

        public static function updateCP(obj, chakra):void
        {
            obj.setCP((obj.getCP() + chakra));
        }

        public static function handleCPCost(chakra, obj):void
        {
            var cpCost = getCPCost(chakra, obj);
            updateCP(obj, -cpCost);
        }

        public static function getCPCost(chakra, obj)
        {
            // FUTURE
            var tempChakra = chakra;
            var petSaveCP = hasEffect("pet_save_cp", obj, BUFF);
            if (petSaveCP["has"])
            {
                tempChakra = chakra * (petSaveCP["amount"] / 100);
                chakra = chakra - tempChakra;
            }
            return chakra;
            // updateCP(obj, chakra);
        }

        public static function isDupliEffect(effectObj, objStats, isBuff)
        {
            var effectArr = isBuff ? objStats.getBuffArr() : objStats.getDebuffArr();
            if (effectArr[effectObj["type"]] != undefined)
            {
                trace("dupli effect" + effectObj["type"]);
                // replace with the new effect
                effectArr[effectObj["type"]] = effectObj;
                return true;
            }
            return false;
        }

        public static function charge(target)
        {
            var baseAmount = 25;
            var chargeAmount = baseAmount;
            var chargeDisable = hasEffect("restrict_charge", target, DEBUFF);
            if (chargeDisable["has"])
            {
                updateCP(target, 0);
                return;
            }
            var chargeBonus = hasEffect("charge_cp_bonus", target, BUFF);
            if (chargeBonus["has"])
            {
                chargeAmount += chargeBonus["amount"];
            }
            var reduceCharge = hasEffect("pet_reduce_charge", target, DEBUFF);
            if (reduceCharge["has"])
            {
                chargeAmount -= reduceCharge["amount"];
            }
            updateCP(target, chargeAmount);
        }

        public static function getFinalDamage(damage, attacker, defender)
        {
            // trace("getFinalDamage start");
            if (hasEffect("guard", defender, BUFF)["duration"] > 1)
            {
                // trace("getFinalDamage finish guard");
                return 0;
            }
            var strength = hasEffect("pet_damage_bonus", attacker, BUFF);
            var tempDamage = damage;
            if (strength["has"])
            {
                tempDamage = damage * (strength["amount"] / 100);
                damage = damage + tempDamage;
                trace(damage + " strength");
            }
            var fearWeaken = hasEffect("fear_weaken", attacker, DEBUFF);
            if (fearWeaken["has"])
            {
                tempDamage = damage * (fearWeaken["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " fear weaken");
            }
            var weaken = hasEffect("pet_weaken", attacker, DEBUFF);
            if (weaken["has"])
            {
                tempDamage = damage * (weaken["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " weaken");
            }
            var protection = hasEffect("damage_reduction", defender, BUFF);
            if (protection["duration"] > 1)
            {
                tempDamage = damage * (protection["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " protection");
            }
            var petProtection = hasEffect("pet_damage_reduction", defender, BUFF);
            if (petProtection["duration"] > 1)
            {
                tempDamage = damage * (petProtection["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " protection");
            }
            var frozen = hasEffect("pet_freeze", attacker, DEBUFF);
            if (frozen["has"])
            {
                tempDamage = damage * (frozen["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " frozen");
            }
            var bleeding = hasEffect("bleeding", defender, DEBUFF);
            if (bleeding["duration"] > 1)
            {
                tempDamage = damage * (bleeding["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " bleeding");
            }
            var petBleeding = hasEffect("pet_bleeding", defender, DEBUFF);
            if (petBleeding["duration"] > 1)
            {
                tempDamage = damage * (petBleeding["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " petBleeding");
            }
            var petBunnyFrenzyDef = hasEffect("bunny_frenzy", defender, BUFF);
            if (petBunnyFrenzyDef["duration"] > 1)
            {
                tempDamage = damage * (20 / 100);
                damage = damage + tempDamage;
                // trace(damage + " bunny_frenzy defender side effect");
            }
            var petBunnyFrenzyAtt = hasEffect("bunny_frenzy", attacker, BUFF);
            if (petBunnyFrenzyAtt["has"])
            {
                tempDamage = damage * 2;
                damage = damage + tempDamage;
                // trace(damage + " bunny_frenzy");
            }
            var battleBunnyFrenzy = hasEffect("battle_bunny_frenzy", attacker, BUFF);
            if (battleBunnyFrenzy["has"])
            {
                tempDamage = damage * 0.25;
                damage = damage + tempDamage;
                // trace(damage + " battleBunnyF");
            }
            var catalyticMatter = hasEffect("catalytic_matter", attacker, BUFF);
            if (catalyticMatter["has"])
            {
                tempDamage = damage * (catalyticMatter["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " catalyticMatter");
            }
            var petLightning = hasEffect("pet_lightning", attacker, BUFF);
            if (petLightning["has"])
            {
                tempDamage = damage * (petLightning["amount"] / 100);
                damage = damage + tempDamage;
                trace(damage + " petLightning");
            }
            var ecstasy = hasEffect("ecstatic_sound", attacker, DEBUFF);
            if (ecstasy["has"])
            {
                tempDamage = damage * (ecstasy["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " ecstasy");
            }
            if (checkCritical(attacker))
            {
                damage = getCriticalDamage(damage, attacker, defender);
                // var criticalDamageBase = 150;
                // var criticalDamageAmount = criticalDamageBase;
                // var critRate = hasEffect("crit_chance_dmg", attacker, true);
                // if (critRate["has"])
                // {
                // criticalDamageBase += critRate["amount"];
                // trace(criticalDamageBase + " crit_chance_dmg");
                // }
                // var hamstring = hasEffect("hamstring", attacker, true);
                // if (hamstring["has"])
                // {
                // criticalDamageAmount -= 25;
                // }
                // damage *= criticalDamageAmount / 100;
                // trace(damage + " critical strike");
            }
            // trace(Math.round(damage));
            // trace("getFinalDamage finish");
            return Math.round(damage);
        }

        public static function getCriticalDamage(damage, attacker, defender)
        {
            // TEST
            var criticalDamageBase = 150;
            var criticalDamageAmount = criticalDamageBase;
            var critRate = hasEffect("crit_chance_dmg", attacker, BUFF);
            if (critRate["has"])
            {
                criticalDamageBase += critRate["amount"];
                trace(criticalDamageBase + " crit_chance_dmg");
            }
            var hamstring = hasEffect("hamstring", attacker, BUFF);
            if (hamstring["has"])
            {
                criticalDamageAmount -= 25;
            }
            var lightImpluse = hasEffect("light_impluse", attacker, BUFF);
            if (lightImpluse["has"])
            {
                criticalDamageAmount -= 25;
            }
            damage *= criticalDamageAmount / 100;
            return damage;
        }

        public static function checkDamageRebound(damage, attacker, defender)
        {
            var sereneMind = hasEffect("serene_mind", defender, BUFF);
            var dmgToCp;
            if (sereneMind["duration"] > 1)
            {
                trace(sereneMind["duration"]);
                updateHP(attacker, -damage);
                dmgToCp = hasEffect("pet_damage_to_cp", attacker, BUFF);
                if (dmgToCp["has"])
                {
                    updateCP(attacker, (dmgToCp["amount"] / 100) * damage);
                }
                return true;
            }
            else
            {
                updateHP(defender, -damage);
                dmgToCp = hasEffect("pet_damage_to_cp", defender, BUFF);
                if (dmgToCp["duration"] > 1)
                {
                    updateCP(defender, (dmgToCp["amount"] / 100) * damage);
                }
                return false;
            }
        }

        public static function handleActiveBuffAfterAttack(dmg, attacker, defender):int
        {
            var bloodfeed = hasEffect("pet_drain_hp_kekkai", attacker, BUFF);
            if (bloodfeed["duration"] > 0)
            {
                var hp = Math.round((bloodfeed["amount"] / 100) * dmg);
                updateHP(attacker, hp);
                return hp;
            }
            return 0;
        }

        public static function checkChanceEffect(effectObj)
        {
            if (effectObj == undefined) // 
            {
                return true;
            }
            var chanceRandom = Math.floor(Math.random() * 100);
            var chance = 0;
            if (effectObj["chance"] == undefined) // if no chance property
            {
                chance = 100;
            }
            else
            {
                chance = effectObj["chance"];
            }
            if (chance < 1) // if the EffectArray chance
            {
                chance = 100;
            }
            if (chance >= chanceRandom)
            {
                trace("check chance finish true" + chance + ">=" + chanceRandom);
                return true;
            }
            trace("check chance finish false" + chance + ">=" + chanceRandom);
            return false;
        }

        public static function checkCritical(charObj)
        {
            // trace("checkCritical start");

            var criticalRandom = Math.floor(Math.random() * 100);
            var criticalChance = charObj.getCritical();
            var critObj = hasEffect("critical_chance_bonus", charObj, BUFF);
            if (critObj["has"])
            {
                criticalChance += critObj["amount"];
                // trace("cc bonus");
            }
            var bunnyFrenzy = hasEffect("bunny_frenzy", charObj, BUFF);
            if (bunnyFrenzy["has"])
            {
                criticalChance += 25;
                // trace("bunny frenzy");
            }
            var battleBunnyFrenzy = hasEffect("battle_bunny_frenzy", charObj, BUFF);
            if (battleBunnyFrenzy["has"])
            {
                criticalChance += 25;
                // trace("bunny frenzy");
            }
            var petEnergize = hasEffect("pet_energize", charObj, BUFF);
            if (petEnergize["has"])
            {
                criticalChance += petEnergize["amount"];
                // trace("energize");
            }
            var petDiso = hasEffect("pet_disoriented", charObj, BUFF);
            if (petDiso["has"])
            {
                criticalChance -= petDiso["amount"];
                // trace("disoriented");
            }
            var critRate = hasEffect("crit_chance_dmg", charObj, BUFF);
            if (critRate["has"])
            {
                criticalChance += 15;
                // trace("crit_chance_dmg");
            }
            var petLightning = hasEffect("pet_lightning", charObj, BUFF);
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

        public static function getDodgeChance(attacker:Pet, defender:Pet)
        {
            var dodgeRandom = Math.floor(Math.random() * 100);
            var dodgeChance = defender.getDodge();
            var dodgeObj = hasEffect("dodge_bonus", defender, BUFF);
            if (dodgeObj["duration"] > 1)
            {
                dodgeChance += dodgeObj["amount"];
                // trace("dodge bonus");
            }
            var petDodgeObj = hasEffect("pet_dodge_bonus", defender, BUFF);
            if (petDodgeObj["duration"] > 1)
            {
                dodgeChance += petDodgeObj["amount"];
                // trace("pet dodge bonus");
            }
            var dodgeReduce = hasEffect("dodge_reduction", defender, DEBUFF);
            if (dodgeReduce["duration"] > 1)
            {
                dodgeChance -= dodgeReduce["amount"];
                // trace("dodge reduce");
            }
            var blindObj = hasEffect("blind", attacker, DEBUFF);
            if (blindObj["has"])
            {
                dodgeChance += blindObj["amount"];
                // trace("blind attacker");
            }
            var petBlindObj = hasEffect("pet_blind", attacker, DEBUFF);
            if (petBlindObj["has"])
            {
                dodgeChance += petBlindObj["amount"];
                // trace("pet blind attacker");
            }
            var petDiso = hasEffect("pet_disoriented", attacker, DEBUFF);
            if (petDiso["has"])
            {
                dodgeChance -= petDiso["amount"];
                // trace("disoriented");
            }
            var petEnergize = hasEffect("pet_energize", attacker, BUFF);
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
            var petEnergize = hasEffect("pet_energize", charObj, BUFF);
            if (petEnergize["has"])
            {
                purifyChance += petEnergize["amount"];
                // trace("energize");
            }
            var purifyBonus = hasEffect("add_purify_chance", charObj, BUFF);
            if (purifyBonus["has"])
            {
                purifyChance += purifyBonus["amount"];
                // trace("add purify");
            }
            var purifyReduce = hasEffect("reduce_purify_chance", charObj, BUFF);
            if (purifyReduce["has"])
            {
                purifyChance -= purifyReduce["amount"];
                // trace("reduce purify");
            }
            var petDiso = hasEffect("pet_disoriented", charObj, BUFF);
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
            if (hasEffect("sleep", defender, DEBUFF)["has"])
            {
                defender.getDebuffArr()["sleep"]["duration"] = 0;
            }
            if (hasEffect("random_sleep", defender, DEBUFF)["has"])
            {
                defender.getDebuffArr()["random_sleep"]["duration"] = 0;
            }
            var fireWall = hasEffect("pet_reflect_attack", defender, BUFF);
            if (fireWall["has"])
            {
                attacker.getDebuffArr()["pet_burn"] = {
                        "type": "pet_burn",
                        "duration": 1,
                        "amount": fireWall["amount"]
                    };
            }
            if (hasEffect("hundred_percent_attack", attacker, BUFF)["has"])
            {
                return true;
            }
            var accBonus = getDodgeChance(attacker, defender);
            accPoints -= accBonus;
            var petAttention = hasEffect("pet_attention", attacker, BUFF);
            if (petAttention["has"])
            {
                accPoints += petAttention["amount"];
            }
            var petLightning = hasEffect("pet_lightning", attacker, BUFF);
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
                        "duration": effectArr[effectType]["duration"],
                        "heal": effectArr[effectType]["heal"]
                    };
            }
            return {
                    "has": false,
                    "amount": 0,
                    "duration": 0,
                    "heal": 0
                };
        }

        public function bothEffect(effectObj, attacker, target)
        {

        }

        public static function directDebuff(effectObj, attacker, target, master, overheadNumber)
        {
            // var targetStats = target["stats"];
            var burnHP, burnCP, burnHPMaster, burnCPMaster;
            if (effectObj["type"] == "burn_hp")
            {
                burnHP = Math.round(target.getMaxHP() * (effectObj["amount"]) / 100);
                overheadNumber(true, "-" + burnHP, "", target);
                updateHP(target, -burnHP);
                return true;
            }
            else if (effectObj["type"] == "burn_cp")
            {
                burnCP = Math.round(target.getMaxCP() * (effectObj["amount"]) / 100);
                overheadNumber(true, "-" + burnCP + " CP", "", target);
                updateCP(target, -burnCP);
                return true;
            }
            else if (effectObj["type"] == "burn_cp_hp")
            {
                burnHP = Math.round(target.getMaxHP() * (effectObj["amount"]) / 100);
                burnCP = Math.round(target.getMaxCP() * (effectObj["amount"]) / 100);
                overheadNumber(true, "-" + burnHP + " HP & -" + burnCP + " CP", "", target);
                updateHP(target, -burnHP);
                updateCP(target, -burnCP);
                return true;
            }
            else if (effectObj["type"] == "clear_buff")
            {
                target.setBuffArr( {});
                return true;
            }
            else if (effectObj["type"] == "drain_hp")
            {
                burnHP = Math.round(target.getHP() * (effectObj["amount"]) / 100);
                burnHPMaster = burnHP;
                if (master.getIsDead())
                {
                    burnHPMaster = 0;
                }
                overheadNumber(true, "+" + burnHPMaster, "self", master);
                overheadNumber(true, "-" + burnHP, "", target);
                updateHP(master, burnHPMaster);
                updateHP(target, -burnHP);
                return true;
            }
            else if (effectObj["type"] == "pet_drain_hp")
            {
                burnHP = Math.round(target.getHP() * (effectObj["amount"]) / 100);
                burnHPMaster = burnHP;
                if (master.getIsDead())
                {
                    burnHPMaster = 0;
                }
                overheadNumber(true, "+" + burnHPMaster, "self", master);
                overheadNumber(true, "-" + burnHP, "", target);
                updateHP(master, burnHPMaster);
                updateHP(target, -burnHP);
                return true;
            }
            else if (effectObj["type"] == "drain_cp")
            {
                burnCP = Math.round(target.getCP() * (effectObj["amount"]) / 100);
                burnCPMaster = burnCP;
                if (master.getIsDead())
                {
                    burnCPMaster = 0;
                }
                overheadNumber(true, "+" + burnCPMaster + " CP", "self", master);
                overheadNumber(true, "-" + burnCP + " CP", "", target);
                updateCP(master, burnCPMaster);
                updateCP(target, -burnCP);
                return true;

            }
            else if (effectObj["type"] == "pet_drain_cp")
            {
                burnCP = Math.round(target.getCP() * (effectObj["amount"]) / 100);
                burnCPMaster = burnCP;
                if (master.getIsDead())
                {
                    burnCPMaster = 0;
                }
                overheadNumber(true, "+" + burnCPMaster + " CP", "self", master);
                overheadNumber(true, "-" + burnCP + " CP", "", target);
                updateCP(master, burnCPMaster);
                updateCP(target, -burnCP);
                return true;
            }
            else if (effectObj["type"] == "add_cooldown")
            {
                var randomSkill = Math.floor(Math.random() * target.getSkillData().length) + 1;
                var cooldownTemp = target.getCooldown();
                cooldownTemp[randomSkill] += (effectObj["amount"] - 1);
                target.setCooldown(cooldownTemp);
                return true;
            }
            else if (effectObj["type"] == "flame_eater")
            {
                var hasBurn = false;
                if (hasEffect("burn", target, DEBUFF)["has"])
                {
                    target.getDebuffArr()["burn"]["duration"] = 0;
                    hasBurn = true;
                }
                if (hasEffect("pet_burn", target, DEBUFF)["has"])
                {
                    target.getDebuffArr()["pet_burn"]["duration"] = 0;
                    hasBurn = true;
                }
                if (hasBurn)
                {
                    burnHP = Math.round(target.getMaxHP() * (5 / 100));
                }
                else
                {
                    burnHP = Math.round(target.getMaxHP() * (1 / 100));
                }
                overheadNumber(true, "-" + burnHP, "", target);
                updateHP(target, -burnHP);
                trace("flame_eater HP - " + burnHP);
                return true;
            }
            else if (effectObj["type"] == "add_all_cooldown")
            {
                // TODO
                var cooldownTemp1 = target.getCooldown();
                for (var i in cooldownTemp1)
                {
                    // if(cooldownTemp1[i] > 0){
                        cooldownTemp1[i] += (effectObj["amount"] - 1);
                    // }
                }
                target.setCooldown(cooldownTemp1);
                return true;
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
            else if (effectObj["type"] == "heal" || effectObj["type"] == "heal_damage")
            {
                // done
                var heal = effectObj["amount"];
                if (target.getIsDead() || hasEffect("internal_injury", target, DEBUFF)["has"])
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

        // CHECK BUFF
        public static function applyBuffEffects(buff, obj, overheadNumber):void
        {
            if (buff["duration"] <= 0)
            {
                return;
            }
            var recoverHP = 0, reduceHP = 0;
            switch (buff["type"])
            {
                case "pet_heal":
                    recoverHP = Math.round(obj.getMaxHP() * (buff["amount"] / 100));
                    if (obj.getIsDead() || hasEffect("internal_injury", obj, DEBUFF)["has"])
                    {
                        recoverHP = 0;
                    }
                    overheadNumber(true, "+" + recoverHP, "self", obj);
                    updateHP(obj, recoverHP);
                    break;
                case "catalytic_matter":
                    trace("catalytic_matter side effect");
                    reduceHP = -Math.round(obj.getMaxHP() * 0.02);
                    if (obj.getIsDead())
                    {
                        reduceHP = 0;
                    }
                    overheadNumber(true, "-" + reduceHP, "", obj);
                    updateHP(obj, reduceHP);
                    break;

            }
        }

        // CHECK DEBUFF
        public static function shouldPass(debuff):Boolean
        {
            var pass = false;
            switch (debuff["type"])
            {
                case "bundle":
                case "chaos":
                case "stun":
                case "stun_random":
                case "fear":
                case "pet_freeze":
                case "coilding_wave":
                case "sleep":
                case "random_sleep":
                case "ecstatic_sound":
                    pass = debuff["duration"] > 0;
                    break;
            }
            return pass;
        }

        public static function applyDebuffEffects(debuff, obj, overheadNumber):void
        {
            if (debuff["duration"] <= 0)
            {
                return;
            }
            var burn = 0, burnHP = 0, burnCP = 0;
            switch (debuff["type"])
            {
                case "pet_burn":
                    burn = Math.round(obj.getMaxHP() * (debuff["amount"] / 100));
                    overheadNumber(true, "-" + burn, "", obj);
                    updateHP(obj, -burn);
                    break;
                case "dismantle":
                    var cooldown = obj.getPet().getSkillCooldown();
                    cooldown[0] = debuff["duration"];
                    obj.getPet().setSkillCooldown(cooldown);
                    break;
                case "coilding_wave":
                    burnHP = Math.round(obj.getMaxHP() * (debuff["amount"] / 100));
                    burnCP = Math.round(obj.getMaxCP() * (debuff["amount"] / 100));
                    overheadNumber(true, "-" + burnHP + " HP & -" + burnCP + " CP", "", obj);
                    updateHP(obj, -burnHP);
                    updateCP(obj, -burnCP);
                    break;
                case "poison":
                    burnHP = Math.round(obj.getMaxHP() * (debuff["amount"] / 100));
                    overheadNumber(true, "-" + burnHP, "", obj);
                    updateHP(obj, -burnHP);
                    break;
            }
        }

        // ADD EFFECT
        public static function createSkillEffectObject(effect)
        {
            return {
                    "type": effect["type"],
                    "duration": effect["duration"],
                    "amount": effect["amount"],
                    "chance": effect["chance"],
                    "heal": effect["heal"]
                };
        }

        public static function addBuffEffect(skillEffect, target)
        {
            if (!directBuff(skillEffect, target) && !isDupliEffect(skillEffect, target, BUFF))
            {
                target.getBuffArr()[skillEffect["type"]] = (skillEffect);
            }
        }

        public static function addDebuffEffect(skillEffect, target, attacker, master, overheadNumber)
        {
            if (!directDebuff(skillEffect, attacker, target, master, overheadNumber) && !isDupliEffect(skillEffect, target, DEBUFF))
            {
                target.getDebuffArr()[skillEffect["type"]] = (skillEffect);
            }
        }

        public static function skipAddBuffEffect(target):Boolean
        {
            // FUTURE
            return false;
        }

        public static function skipAddDebuffEffect(target):Boolean
        {
            if (hasEffect("debuff_resist", target, BUFF)["duration"] > 1)
            {
                return true;
            }
            if (hasEffect("pet_debuff_resist", target, BUFF)["duration"] > 1)
            {
                return true;
            }
            return false;
        }
    }

}
