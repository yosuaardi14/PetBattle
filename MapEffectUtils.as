package
{
    public class MapEffectUtils
    {
        private static function getRandomEffect(mapIndex:int):Object
        {
            // Random
            var mapObj:Object = MapEffect.MAP["map" + mapIndex];
            if (mapObj["chance"] == 0)
            {
                return null;
            }
            var chance:int = Math.floor(Math.random() * 100);
            trace("map_effect chance:" + chance);
            if (chance <= mapObj["chance"])
            {
                var effect:Object = {};
                if (mapObj["buff"].length > 0 && mapObj["debuff"].length > 0)
                {
                    var randomNum:int = Math.floor(Math.random() * 2);
                    if (randomNum == 1) // add buff
                    {
                        effect = getEffect(mapObj["buff"]);
                    }
                    else // add debuff
                    {
                        effect = getEffect(mapObj["debuff"]);
                    }
                    effect["effectType"] = randomNum == 1 ? BattleUtils.BUFF_TYPE : BattleUtils.DEBUFF_TYPE;
                    return effect;
                }
                else if (mapObj["buff"].length > 0)
                {
                    effect = getEffect(mapObj["buff"]);
                    effect["effectType"] = BattleUtils.BUFF_TYPE;
                    return effect;
                }
                else if (mapObj["debuff"].length > 0)
                {
                    effect = getEffect(mapObj["debuff"]);
                    effect["effectType"] = BattleUtils.DEBUFF_TYPE;
                    return effect;
                }
                else
                {
                    return null;
                }
            }
            return null;
        }

        private static function getEffect(mapEffect:Array):Object
        {
            var random:int = Math.floor(Math.random() * mapEffect.length);
            return mapEffect[random];
        }

        public static function addRandomEffect(mapIndex:int, target:Pet, overheadEffect:Function):void
        {
            var randomEffect:Object = getRandomEffect(mapIndex);
            if (randomEffect == null)
            {
                return;
            }
            var effectObj:Object = BattleUtils.createSkillEffectObject(randomEffect);
            var isBuff:Boolean = randomEffect["effectType"] == BattleUtils.BUFF_TYPE;
            if (isBuff)
            {
                target.getBuffArr()[effectObj["type"]] = (effectObj);
            }
            else
            {
                target.getDebuffArr()[effectObj["type"]] = (effectObj);
            }
            overheadEffect(true, effectObj, randomEffect["effectType"], target, true);
        }

        public static function checkEffectResistance(mapIndex:int, effectObj:Object):Boolean
        {
            var mapObj:Object = MapEffect.MAP["map" + mapIndex];
            if (mapObj["resistanceChance"] == 0)
            {
                return false;
            }
            var chance:int = Math.floor(Math.random() * 100);
            trace("map_effect resistance chance:" + chance);
            if (chance <= mapObj["resistanceChance"])
            {
                return mapObj["resistance"].indexOf(effectObj["type"]) >= 0;
            }
            return false;
        }
    }
}