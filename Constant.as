package
{

    public class Constant
    {

        public static const MAX_CHAR_IN_GAME:uint = 14;
        public static const GAME_MODE_PVP:String = "PvP";
        public static const GAME_MODE_PVE:String = "PvE";
        public static const GAME_MODE_ARR:Array = [GAME_MODE_PVP, GAME_MODE_PVE];
        public static const CUSTOM_CHAR_STATS:Array = [DEFAULT_STATS, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
        public static const DEFAULT_STATS = "DEFAULT";

        public static const PLAYER:String = "p";
        public static const ENEMY:String = "e";

        public static const PET_LIST:Array = [
                "bird_1", "toad_1", "bat_1",  "bunny_1",
                "raccoon_1",

                "hedgehog_1", "cat_4", "wolf_0",
                "bat_3", 
                "bunny_3", "bunny_7",

                "bat_2", 
                "pet_157", "fox_2",
                "pet_155", "pet_165",
                "pumpkin_1", "pumpkin_2",
                "pet_154", "pet_194",
                "pet_210", "pet_211",

                "bunny_easter_free",
                "bunny_5", "bunny_6",
                "bunny_2", "bunny_4",
                "dragon_2",
                "pet_182", "pet_183",
                "pet_208",
            ];
        
        public static const PET_LIST_UNRELEASE:Array = [
                "hedgehog_1", 
                "cat_4", 
                "wolf_0",
                "bunny_3", "bunny_7",
            ];

        public static const PET_LIST_EASTER:Array = [
                "bunny_easter_free",
                "bunny_5", "bunny_6",
                "bunny_2", "bunny_4",
                "dragon_2",
                "pet_182", "pet_183",
                "pet_208",
            ];

        public static const PET_LIST_DEMO:Array = [
                "bird_1",
                "toad_1",
                "bunny_easter_free",
                "pumpkin_1",
                "pumpkin_2",
                "raccoon_1",
                "pet_154",
                "pet_194", // comm
                "pet_210",
                "hedgehog_1", // comm
                "cat_4",
                "wolf_0",
            ];

        public static const PET_LIST_HALLOWEEN:Array = [
                "bat_1",
                "bat_2",
                "bat_3",
                "pet_157",

                "fox_2",
                "pet_155",
                "pet_165",

                "pumpkin_1",
                "pumpkin_2",
                "pet_154",
                "pet_194",
                "pet_210",
                "pet_211",
            ];
    }

}