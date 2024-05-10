package
{

    public class BattleUtils
    {
        public static const DAMAGE_RANGE:* = 0.2;

        public static const DODGE_ACTION_OBJ:Object = {"type": "dodge"};

        public static const PURIFY_ACTION_OBJ:Object = {"type": "purify"};

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

        public static function setupAvailableSkills(mc:*, obj:*):void
        {
            mc.allActions = [];
            for (var i:* in mc.skillData)
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
            var cooldown:* = petObj.getSkillCooldown();
            // trace("--------" + petObj.getPetObj()["name"] + "---------");
            for (var i:* in cooldown)
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

        public static function calcDamage(amount:int, damageBonus:*):int
        {
            amount = int(amount + Math.round(amount * damageBonus));
            var constVal:* = DAMAGE_RANGE;
            var minVal:* = amount - amount * constVal;
            var maxVal:* = amount + amount * constVal;
            return Math.round(Math.random() * (maxVal - minVal) + minVal);
        }

        public static function updateHP(obj:*, health:int):void
        {
            obj.setHP((obj.getHP() + health));
        }

        public static function updateCP(obj:*, chakra:int):void
        {
            obj.setCP((obj.getCP() + chakra));
        }

        public static function handleCPCost(chakra:int, obj:*):void
        {
            var cpCost:int = getCPCost(chakra, obj);
            updateCP(obj, -cpCost);
        }

        public static function getCPCost(chakra:int, obj:*):int
        {
            // FUTURE
            var tempChakra:int = chakra;
            var petSaveCP:Object = hasEffect("pet_save_cp", obj, BUFF);
            if (petSaveCP["has"])
            {
                tempChakra = chakra * (petSaveCP["amount"] / 100);
                chakra = chakra - tempChakra;
            }
            return chakra;
            // updateCP(obj, chakra);
        }

        public static function isDupliEffect(effectObj:Object, objStats:*, isBuff:Boolean):Boolean
        {
            var effectArr:* = isBuff ? objStats.getBuffArr() : objStats.getDebuffArr();
            if (effectArr[effectObj["type"]] != undefined)
            {
                trace("dupli effect" + effectObj["type"]);
                // replace with the new effect
                effectArr[effectObj["type"]] = effectObj;
                return true;
            }
            return false;
        }

        public static function charge(target:*):void
        {
            var baseAmount:int = 25;
            var chargeAmount:int = baseAmount;
            var chargeDisable:Object = hasEffect("restrict_charge", target, DEBUFF);
            if (chargeDisable["has"])
            {
                updateCP(target, 0);
                return;
            }
            var chargeBonus:Object = hasEffect("charge_cp_bonus", target, BUFF);
            if (chargeBonus["has"])
            {
                chargeAmount += chargeBonus["amount"];
            }
            var reduceCharge:Object = hasEffect("pet_reduce_charge", target, DEBUFF);
            if (reduceCharge["has"])
            {
                chargeAmount -= reduceCharge["amount"];
            }
            updateCP(target, chargeAmount);
        }

        public static function getFinalDamage(damage:int, attacker:*, defender:*):int
        {
            // trace("getFinalDamage start");
            if (hasEffect("guard", defender, BUFF)["duration"] > 0)
            {
                // trace("getFinalDamage finish guard");
                return 0;
            }
            var tempDamage:int = damage;
            var strength:Object = hasEffect("pet_damage_bonus", attacker, BUFF);
            if (strength["has"])
            {
                tempDamage = damage * (strength["amount"] / 100);
                damage = damage + tempDamage;
                trace(damage + " strength");
            }
            var fearWeaken:Object = hasEffect("fear_weaken", attacker, DEBUFF);
            if (fearWeaken["has"])
            {
                tempDamage = damage * (fearWeaken["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " fear weaken");
            }
            var weaken:Object = hasEffect("pet_weaken", attacker, DEBUFF);
            if (weaken["has"])
            {
                tempDamage = damage * (weaken["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " weaken");
            }
            var protection:Object = hasEffect("damage_reduction", defender, BUFF);
            if (protection["duration"] > 0)
            {
                tempDamage = damage * (protection["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " protection");
            }
            var petProtection:Object = hasEffect("pet_damage_reduction", defender, BUFF);
            if (petProtection["duration"] > 0)
            {
                tempDamage = damage * (petProtection["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " protection");
            }
            var frozen:Object = hasEffect("pet_freeze", attacker, DEBUFF);
            if (frozen["has"])
            {
                tempDamage = damage * (frozen["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " frozen");
            }
            var bleeding:Object = hasEffect("bleeding", defender, DEBUFF);
            if (bleeding["duration"] > 0)
            {
                tempDamage = damage * (bleeding["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " bleeding");
            }
            var petBleeding:Object = hasEffect("pet_bleeding", defender, DEBUFF);
            if (petBleeding["duration"] > 0)
            {
                tempDamage = damage * (petBleeding["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " petBleeding");
            }
            var petBunnyFrenzyDef:Object = hasEffect("bunny_frenzy", defender, BUFF);
            if (petBunnyFrenzyDef["duration"] > 0)
            {
                tempDamage = damage * (20 / 100);
                damage = damage + tempDamage;
                // trace(damage + " bunny_frenzy defender side effect");
            }
            var petBunnyFrenzyAtt:Object = hasEffect("bunny_frenzy", attacker, BUFF);
            if (petBunnyFrenzyAtt["has"])
            {
                tempDamage = damage * 2;
                damage = damage + tempDamage;
                // trace(damage + " bunny_frenzy");
            }
            var battleBunnyFrenzy:Object = hasEffect("battle_bunny_frenzy", attacker, BUFF);
            if (battleBunnyFrenzy["has"])
            {
                tempDamage = damage * 0.25;
                damage = damage + tempDamage;
                // trace(damage + " battleBunnyF");
            }
            var catalyticMatter:Object = hasEffect("catalytic_matter", attacker, BUFF);
            if (catalyticMatter["has"])
            {
                tempDamage = damage * (catalyticMatter["amount"] / 100);
                damage = damage + tempDamage;
                // trace(damage + " catalyticMatter");
            }
            var petLightning:Object = hasEffect("pet_lightning", attacker, BUFF);
            if (petLightning["has"])
            {
                tempDamage = damage * (petLightning["amount"] / 100);
                damage = damage + tempDamage;
                trace(damage + " petLightning");
            }
            var ecstasy:Object = hasEffect("ecstatic_sound", attacker, DEBUFF);
            if (ecstasy["has"])
            {
                tempDamage = damage * (ecstasy["amount"] / 100);
                damage = damage - tempDamage;
                // trace(damage + " ecstasy");
            }
            if (checkCritical(attacker))
            {
                damage = getCriticalDamage(damage, attacker, defender);
            }
            // trace(Math.round(damage));
            // trace("getFinalDamage finish");
            return Math.round(damage);
        }

        public static function getCriticalDamage(damage:int, attacker:*, defender:*):int
        {
            // TEST
            var criticalDamageBase:int = 150;
            var criticalDamageAmount:int = criticalDamageBase;
            var critRate:Object = hasEffect("crit_chance_dmg", attacker, BUFF);
            if (critRate["has"])
            {
                criticalDamageBase += critRate["amount"];
                trace(criticalDamageBase + " crit_chance_dmg");
            }
            var hamstring:Object = hasEffect("hamstring", attacker, BUFF);
            if (hamstring["has"])
            {
                criticalDamageAmount -= 25;
            }
            var lightImpluse:Object = hasEffect("light_impluse", attacker, BUFF);
            if (lightImpluse["has"])
            {
                criticalDamageAmount -= 25;
            }
            damage *= criticalDamageAmount / 100;
            return damage;
        }

        public static function checkDamageRebound(damage:int, attacker:*, defender:*):Boolean
        {
            var sereneMind:Object = hasEffect("serene_mind", defender, BUFF);
            var dmgToCp:Object;
            if (sereneMind["duration"] > 0)
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
                if (dmgToCp["duration"] > 0)
                {
                    updateCP(defender, (dmgToCp["amount"] / 100) * damage);
                }
                return false;
            }
        }

        public static function handleActiveBuffAfterAttack(dmg:int, attacker:*, defender:*):int
        {
            var bloodfeed:Object = hasEffect("pet_drain_hp_kekkai", attacker, BUFF);
            if (bloodfeed["duration"] > 0)
            {
                var hp:int = Math.round((bloodfeed["amount"] / 100) * dmg);
                if (hasEffect("internal_injury", attacker, DEBUFF)["has"])
                {
                    hp = 0;
                }
                StatsUtils.handleHealStats(attacker, hp);
                updateHP(attacker, hp);
                return hp;
            }
            return 0;
        }

        public static function checkChanceEffect(effectObj:*):Boolean
        {
            if (effectObj == undefined) // 
            {
                return true;
            }
            var chanceRandom:int = Math.floor(Math.random() * 100);
            var chance:int = 0;
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

        public static function checkCritical(charObj:*):Boolean
        {
            // trace("checkCritical start");

            var criticalRandom:int = Math.floor(Math.random() * 100);
            var criticalChance:int = charObj.getCritical();
            var critObj:Object = hasEffect("critical_chance_bonus", charObj, BUFF);
            if (critObj["has"])
            {
                criticalChance += critObj["amount"];
                // trace("cc bonus");
            }
            var bunnyFrenzy:Object = hasEffect("bunny_frenzy", charObj, BUFF);
            if (bunnyFrenzy["has"])
            {
                criticalChance += 25;
                // trace("bunny frenzy");
            }
            var battleBunnyFrenzy:Object = hasEffect("battle_bunny_frenzy", charObj, BUFF);
            if (battleBunnyFrenzy["has"])
            {
                criticalChance += 25;
                // trace("bunny frenzy");
            }
            var petEnergize:Object = hasEffect("pet_energize", charObj, BUFF);
            if (petEnergize["has"])
            {
                criticalChance += petEnergize["amount"];
                // trace("energize");
            }
            var petDiso:Object = hasEffect("pet_disoriented", charObj, BUFF);
            if (petDiso["has"])
            {
                criticalChance -= petDiso["amount"];
                // trace("disoriented");
            }
            var critRate:Object = hasEffect("crit_chance_dmg", charObj, BUFF);
            if (critRate["has"])
            {
                criticalChance += 15;
                // trace("crit_chance_dmg");
            }
            var petLightning:Object = hasEffect("pet_lightning", charObj, BUFF);
            if (petLightning["has"])
            {
                criticalChance += petLightning["amount"];
            }
            if (Math.round(criticalChance) >= criticalRandom)
            {
                // trace("checkCritical finish true");
                charObj.isCritical = true;
                return true;
            }
            // trace("checkCritical finish false");
            return false;
        }

        public static function getDodgeChance(attacker:Pet, defender:Pet):int
        {
            var dodgeRandom:int = Math.floor(Math.random() * 100);
            var dodgeChance:int = defender.getDodge();
            var dodgeObj:Object = hasEffect("dodge_bonus", defender, BUFF);
            if (dodgeObj["duration"] > 0)
            {
                dodgeChance += dodgeObj["amount"];
                // trace("dodge bonus");
            }
            var petDodgeObj:Object = hasEffect("pet_dodge_bonus", defender, BUFF);
            if (petDodgeObj["duration"] > 0)
            {
                dodgeChance += petDodgeObj["amount"];
                // trace("pet dodge bonus");
            }
            var dodgeReduce:Object = hasEffect("dodge_reduction", defender, DEBUFF);
            if (dodgeReduce["duration"] > 0)
            {
                dodgeChance -= dodgeReduce["amount"];
                // trace("dodge reduce");
            }
            var blindObj:Object = hasEffect("blind", attacker, DEBUFF);
            if (blindObj["has"])
            {
                dodgeChance += blindObj["amount"];
                // trace("blind attacker");
            }
            var petBlindObj:Object = hasEffect("pet_blind", attacker, DEBUFF);
            if (petBlindObj["has"])
            {
                dodgeChance += petBlindObj["amount"];
                // trace("pet blind attacker");
            }
            var petDiso:Object = hasEffect("pet_disoriented", attacker, DEBUFF);
            if (petDiso["has"])
            {
                dodgeChance -= petDiso["amount"];
                // trace("disoriented");
            }
            var petEnergize:Object = hasEffect("pet_energize", attacker, BUFF);
            if (petEnergize["has"])
            {
                dodgeChance += petEnergize["amount"];
                // trace("energize");
            }
            return dodgeChance;
        }

        public static function checkPurify(charObj:*):Boolean
        {
            // trace("check purify start");
            var purifyRandom:int = Math.floor(Math.random() * 100);
            // trace(purifyRandom);
            var purifyChance:int = charObj.getPurify();
            var petEnergize:Object = hasEffect("pet_energize", charObj, BUFF);
            if (petEnergize["has"])
            {
                purifyChance += petEnergize["amount"];
                // trace("energize");
            }
            var purifyBonus:Object = hasEffect("add_purify_chance", charObj, BUFF);
            if (purifyBonus["has"])
            {
                purifyChance += purifyBonus["amount"];
                // trace("add purify");
            }
            var purifyReduce:Object = hasEffect("reduce_purify_chance", charObj, BUFF);
            if (purifyReduce["has"])
            {
                purifyChance -= purifyReduce["amount"];
                // trace("reduce purify");
            }
            var petDiso:Object = hasEffect("pet_disoriented", charObj, BUFF);
            if (petDiso["has"])
            {
                purifyChance -= petDiso["amount"];
                // trace("disoriented");
            }
            return purifyChance >= purifyRandom;
        }

        public static function checkHit(attacker:Pet, defender:Pet):Boolean
        {
            var accRandom:int = Math.floor(Math.random() * 100);
            var accPoints:int = 100;
            if (hasEffect("sleep", defender, DEBUFF)["has"])
            {
                defender.getDebuffArr()["sleep"]["duration"] = 0;
            }
            if (hasEffect("random_sleep", defender, DEBUFF)["has"])
            {
                defender.getDebuffArr()["random_sleep"]["duration"] = 0;
            }
            var fireWall:Object = hasEffect("pet_reflect_attack", defender, BUFF);
            if (fireWall["has"])
            {
                attacker.getDebuffArr()["pet_burn"] = {
                        "type": "pet_burn",
                        "duration": 2,
                        "amount": fireWall["amount"]
                    };
            }
            if (hasEffect("hundred_percent_attack", attacker, BUFF)["has"])
            {
                return true;
            }
            var accBonus:int = getDodgeChance(attacker, defender);
            accPoints -= accBonus;
            var petAttention:Object = hasEffect("pet_attention", attacker, BUFF);
            if (petAttention["has"])
            {
                accPoints += petAttention["amount"];
            }
            var petLightning:Object = hasEffect("pet_lightning", attacker, BUFF);
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

        public static function hasSkillEffect(skillEffect:Object, effectType:String):int
        {
            for (var i in skillEffect["effect"])
            {
                if (skillEffect["effect"][i]["type"] == effectType)
                {
                    return i;
                }
            }
            return -1;
        }

        public static function hasEffect(effectType:String, obj:*, isBuff:Boolean):Object
        {
            var effectArr:* = isBuff ? obj.getBuffArr() : obj.getDebuffArr();
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

        public function bothEffect(effectObj:Object, attacker:*, target:*):void
        {

        }

        public static function directDebuff(effectObj:Object, attacker:*, target:*, master:*, overheadNumber:Function, overheadEffect:Function):Boolean
        {
            // var targetStats = target["stats"];
            var burnHP:int, burnCP:int, burnHPMaster:int, burnCPMaster:int;
            if (effectObj["type"] == "burn_hp")
            {
                burnHP = Math.round(target.getMaxHP() * (effectObj["amount"]) / 100);
                overheadEffect(true, null, "debuff", target, false, "HP -" + burnHP);
                StatsUtils.handleDamageTakenStats(target, burnHP);
                updateHP(target, -burnHP);
                return true;
            }
            else if (effectObj["type"] == "burn_cp")
            {
                burnCP = Math.round(target.getMaxCP() * (effectObj["amount"]) / 100);
                overheadEffect(true, null, "debuff", target, false, "CP -" + burnCP);
                updateCP(target, -burnCP);
                return true;
            }
            else if (effectObj["type"] == "burn_cp_hp")
            {
                burnHP = Math.round(target.getMaxHP() * (effectObj["amount"]) / 100);
                burnCP = Math.round(target.getMaxCP() * (effectObj["amount"]) / 100);
                overheadEffect(true, null, "debuff", target, false, "HP -" + burnHP + " & CP -" + burnCP);
                StatsUtils.handleDamageTakenStats(target, burnHP);
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
                overheadEffect(true, null, "buff", master, false, "HP +" + burnHPMaster);
                overheadEffect(true, null, "debuff", target, false, "HP -" + burnHP);
                StatsUtils.handleDamageTakenStats(target, burnHP);
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
                overheadEffect(true, null, "buff", master, false, "HP +" + burnHPMaster);
                overheadEffect(true, null, "debuff", target, false, "HP -" + burnHP);
                StatsUtils.handleDamageTakenStats(target, burnHP);
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
                overheadEffect(true, null, "buff", master, false, "CP +" + burnCPMaster);
                overheadEffect(true, null, "debuff", target, false, "CP -" + burnCP);
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
                overheadEffect(true, null, "buff", master, false, "+" + burnCPMaster + " CP");
                overheadEffect(true, null, "debuff", target, false, "-" + burnCP + " CP");
                updateCP(master, burnCPMaster);
                updateCP(target, -burnCP);
                return true;
            }
            else if (effectObj["type"] == "add_cooldown")
            {
                var randomSkill:int = Math.floor(Math.random() * target.getSkillData().length) + 1;
                var cooldownTemp:* = target.getCooldown();
                cooldownTemp[randomSkill] += (effectObj["amount"] - 1);
                target.setCooldown(cooldownTemp);
                return true;
            }
            else if (effectObj["type"] == "flame_eater")
            {
                var hasBurn:Boolean = false;
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
                overheadEffect(true, null, "debuff", target, false, "-" + burnHP + " HP");
                StatsUtils.handleDamageTakenStats(target, burnHP);
                updateHP(target, -burnHP);
                trace("flame_eater HP - " + burnHP);
                return true;
            }
            else if (effectObj["type"] == "add_all_cooldown")
            {
                // TODO
                var cooldownTemp1:* = target.getCooldown();
                for (var i:* in cooldownTemp1)
                {
                    if (i == 0)
                    {
                        continue;
                    }
                    // if(cooldownTemp1[i] > 0){
                    cooldownTemp1[i] += (effectObj["amount"] - 1);
                    // }
                }
                target.setCooldown(cooldownTemp1);
                return true;
            }
            return false;
        }

        public static function directBuff(effectObj:Object, target:*, overheadNumber:Function, overheadEffect:Function):Boolean
        {
            var cooldown:*;
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
                var heal:int = effectObj["amount"];
                if (target.getIsDead() || hasEffect("internal_injury", target, DEBUFF)["has"])
                {
                    heal = 0;
                }
                overheadEffect(true, null, "buff", target, false, "+" + heal + " HP");
                StatsUtils.handleHealStats(target, heal);
                updateHP(target, heal);
                return true;
            }
            else if (effectObj["type"] == "restore_cp")
            {
                // done
                var restoreCP:int = effectObj["amount"];
                if (target.getIsDead())
                {
                    restoreCP = 0;
                }
                overheadEffect(true, null, "buff", target, false, "+" + restoreCP + " CP");
                updateCP(target, restoreCP);
                return true;
            }
            else if (effectObj["type"] == "cooldown_reduction")
            {
                cooldown = target.getPet().getSkillCooldown();
                var reduceCd:int = effectObj["amount"];
                for (var i:* in cooldown)
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
                overheadEffect(true, null, "buff", target, false, "Cooldown -" + reduceCd);
                return true;
            }
            else if (effectObj["type"] == "bloodlust_dedication")
            {
                // done
                target.setDebuffArr( {});
                var heal1:int = Math.round(target.getMaxHP() * (effectObj["amount"]) / 100);
                if (target.getIsDead())
                {
                    heal1 = 0;
                }
                overheadEffect(true, null, "buff", target, false, "+" + heal1 + " HP");
                StatsUtils.handleHealStats(target, heal1);
                updateHP(target, heal1);
                return true;
            }
            else if (effectObj["type"] == "purify")
            {
                cooldown = target.getPet().getSkillCooldown();
                cooldown[0] = 0;
                target.getPet().setSkillCooldown(cooldown);
                target.setDebuffArr( {});
                return true;
            }
            return false;
        }

        // CHECK BUFF
        public static function applyBuffEffects(buff:Object, obj:*, overheadNumber:Function, overheadEffect:Function):void
        {
            if (buff["duration"] <= 0)
            {
                return;
            }
            var recoverHP:int = 0, reduceHP:int = 0;
            switch (buff["type"])
            {
                case "pet_heal":
                    recoverHP = Math.round(obj.getMaxHP() * (buff["amount"] / 100));
                    if (obj.getIsDead() || hasEffect("internal_injury", obj, DEBUFF)["has"])
                    {
                        recoverHP = 0;
                    }
                    overheadNumber(true, "+" + recoverHP, "self", obj);
                    StatsUtils.handleHealStats(obj, recoverHP);
                    updateHP(obj, recoverHP);
                    break;
                case "catalytic_matter":
                    trace("catalytic_matter side effect");
                    reduceHP = Math.round(obj.getMaxHP() * 0.02);
                    if (obj.getIsDead())
                    {
                        reduceHP = 0;
                    }
                    overheadEffect(true, null, "debuff", obj, false, "Catalytic (-" + reduceHP + " HP)");
                    StatsUtils.handleDamageTakenStats(obj, reduceHP);
                    updateHP(obj, -reduceHP);
                    break;

            }
        }

        // CHECK DEBUFF
        public static function shouldPass(debuff:Object):Boolean
        {
            var pass:Boolean = false;
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

        public static function applyDebuffEffects(debuff:Object, obj:*, overheadNumber:Function, overheadEffect:Function):void
        {
            if (debuff["duration"] <= 0)
            {
                return;
            }
            var burn:int = 0, burnHP:int = 0, burnCP:int = 0;
            switch (debuff["type"])
            {
                case "pet_burn":
                    burn = Math.round(obj.getMaxHP() * (debuff["amount"] / 100));
                    // overheadNumber(true, "-" + burn, "", obj);
                    overheadEffect(true, null, "debuff", obj, false, "Burn (-" + burn + ")");
                    StatsUtils.handleDamageTakenStats(obj, burn);
                    updateHP(obj, -burn);
                    break;
                case "dismantle":
                    var cooldown:* = obj.getPet().getSkillCooldown();
                    cooldown[0] = debuff["duration"];
                    obj.getPet().setSkillCooldown(cooldown);
                    break;
                case "coilding_wave":
                    burnHP = Math.round(obj.getMaxHP() * (debuff["amount"] / 100));
                    burnCP = Math.round(obj.getMaxCP() * (debuff["amount"] / 100));
                    overheadEffect(true, null, "debuff", obj, false, "HP -" + burnHP + "  & CP -" + burnCP);
                    StatsUtils.handleDamageTakenStats(obj, burnHP);
                    updateHP(obj, -burnHP);
                    updateCP(obj, -burnCP);
                    break;
                case "poison":
                    burnHP = Math.round(obj.getMaxHP() * (debuff["amount"] / 100));
                    overheadEffect(true, null, "debuff", obj, false, "Poison (-" + burnHP + ")");
                    StatsUtils.handleDamageTakenStats(obj, burnHP);
                    updateHP(obj, -burnHP);
                    break;
            }
        }

        // ADD EFFECT
        public static function createSkillEffectObject(effect:Object):Object
        {
            return {
                    "type": effect["type"],
                    "duration": effect["duration"],
                    "amount": effect["amount"],
                    "chance": effect["chance"],
                    "heal": effect["heal"]
                };
        }

        public static function addBuffEffect(skillEffect:Object, target:*, overheadNumber:Function, overheadEffect:Function):void
        {
            if (!directBuff(skillEffect, target, overheadNumber, overheadEffect) && !isDupliEffect(skillEffect, target, BUFF))
            {
                target.getBuffArr()[skillEffect["type"]] = (skillEffect);
            }
        }

        public static function addDebuffEffect(skillEffect:Object, target:*, attacker:*, master:*, overheadNumber:Function, overheadEffect:Function):void
        {
            if (!directDebuff(skillEffect, attacker, target, master, overheadNumber, overheadEffect) && !isDupliEffect(skillEffect, target, DEBUFF))
            {
                target.getDebuffArr()[skillEffect["type"]] = (skillEffect);
            }
        }

        public static function skipAddBuffEffect(target:*):Boolean
        {
            // FUTURE
            return false;
        }

        public static function skipAddDebuffEffect(target:*):Boolean
        {
            if (hasEffect("debuff_resist", target, BUFF)["duration"] > 0)
            {
                return true;
            }
            if (hasEffect("pet_debuff_resist", target, BUFF)["duration"] > 0)
            {
                return true;
            }
            return false;
        }
    }

}
