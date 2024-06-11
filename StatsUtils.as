package
{
    public class StatsUtils
    {
        public static function handleDamageStats(attacker, defender, dmg):void
        {
            handleDamageDealtStats(attacker, dmg);
            handleDamageTakenStats(defender, dmg);
            handleHitStats(attacker);
            handleCriticalHitStats(attacker);
        }

        public static function handleCriticalHitStats(char):void
        {
            if (char.isCritical)
            {
                char.battleStats["totalCriticalHit"] += 1;
            }
        }

        public static function handleHealStats(char, heal):void
        {
            char.battleStats["totalHeal"] += heal;
        }

        public static function handleDamageDealtStats(char, dmg):void
        {
            char.battleStats["totalDamage"] += dmg;
        }

        public static function handleDamageTakenStats(char, dmg):void
        {
            char.battleStats["totalDamageTaken"] += dmg;
        }

        public static function handleHitStats(char):void
        {
            char.battleStats["totalHit"] += 1;
        }

        public static function handlePassStats(char):void
        {
            char.battleStats["totalPass"] += 1;
        }

        public static function handlePurifyStats(char):void
        {
            char.battleStats["totalPurify"] += 1;
        }

        public static function handleDodgeStats(char):void
        {
            char.battleStats["totalDodge"] += 1;
        }

        public static function handleTurnStats(char):void
        {
            char.battleStats["totalTurn"] += 1;
        }

        public static function handleMissTurnStats(char):void
        {
            char.battleStats["missedTurn"] += 1;
        }

        public static function handleTotalDamageArr(arr):int
        {
            var totalDamage = 0;
            for (var i = 0; i < arr.length; i++)
            {
                totalDamage += arr[i].battleStats["totalDamage"];
            }
            return totalDamage;
        }

    }
}