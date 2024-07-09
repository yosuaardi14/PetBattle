package
{

    public class Constant
    {

        public static const MAX_CHAR_IN_GAME:uint = 7;
        public static const GAME_MODE_PVP:String = "PVP";
        public static const GAME_MODE_PVE:String = "PVE";
        public static const GAME_MODE_ARR:Array = [GAME_MODE_PVP, GAME_MODE_PVE];
        public static const CUSTOM_CHAR_STATS:Array = [DEFAULT_STATS, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
        public static const DEFAULT_STATS:String = "Default";
        public static const WIN_CONDITION_DEFAULT = "Default";
        public static const WIN_CONDITION_DEFEAT_MASTER = "Defeat Master";
        public static const WIN_CONDITION_FIRST_DEFEAT = "First Defeat";
        public static const WIN_CONDITION_MOST_DAMAGE = "Most Damage";
        public static const WIN_CONDITION_ARR:Array = [WIN_CONDITION_DEFAULT, WIN_CONDITION_DEFEAT_MASTER, WIN_CONDITION_FIRST_DEFEAT, WIN_CONDITION_MOST_DAMAGE];

        public static const ATB_MAX_VALUE:int = 100;

        public static const PLAYER:String = "p";
        public static const ENEMY:String = "e";

        public static const PET_LIST:Array = [
                "bird_1", "cat_1", "dog_1", "snake_1", "pig_1", "pig_2",
                "bat_1", "bunny_1", "snake_2",
                "toad_1",
                "turtle_1", "pig_3",
                "bird_4", "pet_123",

                "pet_191",
                "pet_195",
                "pet_200",
                "pet_212",
                "pet_228",

                // "hedgehog_1", "cat_4", "wolf_0",
                // "bat_3",
                // "bunny_3", "bunny_7",

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

                "raccoon_1",
                "panda_1",
                "pet_119",
                "pet_144",
                "pet_188",
                "pet_164",
                "pet_220",

                "dog_7",
                "pet_121",
                "pet_190",
                "pet_227",
                "pet_193",

                "dog_2", "dummy_pet",
                "bird_8",
                "egg_01", "egg_02",
                "pet_124", "pet_125", "pet_126", "pet_127", "pet_128", "pet_129", "pet_130", "pet_136", "pet_132", "pet_133", "pet_134", "pet_135",
                "pet_148", "pet_149", "pet_150", "pet_156",
                "pet_202", "pet_203", "pet_204",
                "pet_205", "pet_206",

                "turkey_1",
                "totem_bird",
                "tail_4", "tail_4_2",
                // "pet_159", "pet_160",
                "pet_213", "pet_214",
                "pet_145",

                "reindeer_1",
                "snowman_1",
                "reindeer_2",
                "pet_101", "pet_102",
                "pet_137",
                "pet_161", "pet_162", "pet_163",
                "pet_196", "pet_197",

                "tail_10", "tail_10_2", "tail_10_3",
                "fox_1", "snake_0", // "tail_7", "tail_6",
                "tail_5", "tail_4_3", "pet_131", "pet_141", // "pet_146",
                "pet_216", "pet_217", // "pet_218", "pet_221",
                "pet_222",

                "festival_1",
                // "valentinebear",
                "pet_103",
                "pet_180", "pet_181",
                "pet_201",

                "pet_139",
                "pet_147",
                "pet_179",
                "pet_232",
                "pet_233",
            ];

        public static const PET_LIST_UNRELEASE:Array = [
                "hedgehog_1",
                "cat_4",
                "wolf_0",
                "bunny_3", "bunny_7",
                "bat_3",
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

        public static const PET_LIST_COOPERATIVE:Array = [
                "pet_191",
                "pet_195",
                "pet_200",
                "pet_212",
                "pet_228",
            ];

        public static const PET_LIST_ANNIVERSARY:Array = [
                "dog_2", "dummy_pet",
                "bird_8",
                "egg_01", "egg_02",
                "pet_124", "pet_125", "pet_126", "pet_127", "pet_128", "pet_129", "pet_130", "pet_136", "pet_132", "pet_133", "pet_134", "pet_135",
                "pet_148", "pet_149", "pet_150", "pet_156",
                "pet_202", "pet_203", "pet_204",
                "pet_205", "pet_206",
            ];

        public static const PET_LIST_SAKURA_FEST:Array = [
                "raccoon_1",
                "panda_1",
                "pet_119",
                "pet_144",
                "pet_188",
                "pet_164",
                "pet_220",
            ];

        public static const PET_LIST_SOCCER_FEVER:Array = [
                "dog_7",
                "pet_121",
                "pet_190",
                "pet_227",
                "pet_193", // olympic
            ];

        public static const PET_LIST_FRIENDSHIP:Array = [
                "turtle_1", "pig_3",
                "bird_4", "pet_123",
            ];

        public static const PET_LIST_THANKSGIVING:Array = [
                "turkey_1",
                "totem_bird",
                "tail_4", "tail_4_2",
                "pet_159", "pet_160",
                "pet_213", "pet_214",
                "pet_145", // Litle Sleipnir
            ];

        public static const PET_LIST_CHRISTMAS:Array = [
                "reindeer_1",
                "snowman_1",
                "reindeer_2",
                "pet_101", "pet_102",
                "pet_137",
                "pet_161", "pet_162", "pet_163",
                "pet_196", "pet_197",
            ];

        public static const PET_LIST_TAILED_BEAST:Array = [
                // Original
                "tail_10", "tail_10_2", "tail_10_3",
                "fox_1", "snake_0", "tail_7", "tail_6", "tail_5", "tail_4_3", "pet_131", "pet_141", "pet_146",
                // Seasonal
                "pet_216", "pet_217", "pet_218", "pet_221", "pet_222",
            ];

        public static const PET_LIST_VALENTINE:Array = [
                "festival_1",
                "valentinebear",
                "pet_103",
                "pet_180", "pet_181",
                "pet_201",
            ];

        public static const PET_LIST_DRAGON_PET:Array = [
                // I
                "pet_104", "pet_105", "pet_106", "pet_107", "pet_108",
                "pet_142",
                "pet_184",
                "pet_230", "pet_231",
                // II
                "pet_109", "pet_110", "pet_111", "pet_112", "pet_113", "pet_114", "pet_115", "pet_116",
                "pet_140",
                "pet_185",
                // III
                "pet_117", "pet_118", "pet_122",
                "pet_138",
                "pet_143",
                "pet_151", "pet_152", "pet_153",
                "pet_158",
                "pet_178",
                "pet_186",
                "pet_189",
                // IV
                "pet_187",
                "pet_192",
                "pet_198", "pet_199",
                "pet_215",
                "pet_219",
            ];

    }

}