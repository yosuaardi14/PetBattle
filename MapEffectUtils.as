package
{
    public class MapEffectUtils
    {
        public static function getRandomEffect():void
        {
            // Random
        }

        public static function addRandomEffect(mapIndex:int):void
        {
            var effect = MapEffect.MAP["map"+mapIndex]["effect"];
        }
    }
}