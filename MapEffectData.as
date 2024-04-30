package
{
    public class MapEffectData
    {
        public static const MAP_EFFECT_STUN:String = "map_effect_stun";
        public static const MAP_EFFECT_BUNDLE:String = "map_effect_bundle";
        public static const MAP_EFFECT_PET_HEAL:String = "map_effect_pet_heal";
        public static const MAP_EFFECT_PET_BURN:String = "map_effect_pet_burn";
        public static const MAP_EFFECT_DAMAGE_REDUCTION:String = "map_effect_damage_reduction";
        public static const MAP_EFFECT_PET_DAMAGE_BONUS:String = "map_effect_pet_damage_bonus";
        public static const MAP_EFFECT_PET_WEAKEN:String = "map_effect_pet_weaken";
        public static const MAP_EFFECT_PET_BLIND:String = "map_effect_pet_blind";
        public static const MAP_EFFECT_DODGE_REDUCTION:String = "map_effect_dodge_reduction";
        public static const MAP_EFFECT_PET_DODGE_BONUS:String = "map_effect_pet_dodge_bonus";

        public static function displaySpecialText(param1:Object):String
        {
            var effectName:String = "";
            var duration:String = String(int(param1["duration"]) - 1);
            var amount:String = String(param1["amount"]);
            var durationTxt:String = ""; // (int(param1["duration"]) - 1) > 1 ? " turns" : " turn";
            var durationDesc:String = "(" + duration + durationTxt + ")";
            if (duration == "0")
            {
                durationDesc = "Faded";
            }
            switch ("map_effect_" + param1["type"])
            {
                // SKIP TURN
                case MAP_EFFECT_STUN:
                    return "Map Stun " + durationDesc;
                case MAP_EFFECT_BUNDLE:
                    return "Map Restriction " + durationDesc;
                    // HP
                case MAP_EFFECT_PET_HEAL:
                    return "Map Heal " + amount + "% " + durationDesc;
                case MAP_EFFECT_PET_BURN:
					return "Map Burn -" + amount + "% " + durationDesc;
                    // DAMAGE
                case MAP_EFFECT_DAMAGE_REDUCTION:
                    return "Map Protection " + amount + "% " + durationDesc;
                case MAP_EFFECT_PET_DAMAGE_BONUS:
                    return "Map Strengthen " + amount + "% " + durationDesc;
                case MAP_EFFECT_PET_WEAKEN:
                    return "Map Weaken " + amount + "% " + durationDesc;
                    // DODGE or ACCURACY
                case MAP_EFFECT_PET_BLIND:
                    return "Map Blind " + amount + "% " + durationDesc;
                case MAP_EFFECT_DODGE_REDUCTION:
                    return "Map Numb " + amount + "% " + durationDesc;
                case MAP_EFFECT_PET_DODGE_BONUS:
                    return "Map Dodge +" + amount + "% " + durationDesc;
                default:
                    trace(param1["type"] + " not found");
                    return "";
            }
        }
    }
}