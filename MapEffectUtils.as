package
{
    public class MapEffectUtils
    {
        private static function getRandomEffect(mapIndex:int):Object
        {
            // Random
            var mapObj = MapEffect.MAP["map" + mapIndex];
            if (mapObj["chance"] == 0)
            {
                return null;
            }
            var chance = Math.floor(Math.random() * 100);
            trace("map_effect chance:" + chance);
            if (chance <= mapObj["chance"])
            {
                var effect = {};
                if (mapObj["buff"].length > 0 && mapObj["debuff"].length > 0)
                {
                    var randomNum = Math.floor(Math.random() * 2);
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
            var random = Math.floor(Math.random() * mapEffect.length);
            return mapEffect[random];
        }

        public static function addRandomEffect(mapIndex:int, target:Pet, overheadEffect:Function):void
        {
            var randomEffect = getRandomEffect(mapIndex);
            if (randomEffect == null)
            {
                return;
            }
            var effectObj = BattleUtils.createSkillEffectObject(randomEffect);
            var isBuff = randomEffect["effectType"] == BattleUtils.BUFF_TYPE;
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
    }
}