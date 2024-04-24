package
{
    public class MapEffect
    {
        public static function getMapByIndex(index:int):Object
        {
            return MAP["map" + index];
        }
        public static const MAP:Object = {
                "map0": {
                    "name": "Battle Arena I",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_damage_bonus",
                            "duration": 2,
                            "amount": 5
                        }
                    ],
                    "debuff": [
                        {
                            "type": "pet_weaken",
                            "duration": 2,
                            "amount": 5
                        }
                    ],
                    "resistanceChance": 100,
                    "resistance": ["stun", "pet_burn"]
                },
                "map1": {
                    "name": "Rock Cave",
                    "chance": 50,
                    "buff": [],
                    "debuff": [
                        {
                            "type": "stun",
                            "duration": 2
                        },
                        {
                            "type": "pet_blind",
                            "duration": 2,
                            "amount": 3
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map2": {
                    "name": "Hidden Forest",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "bundle",
                            "duration": 2
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map3": {
                    "name": "Hidden Cave",
                    "chance": 75,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "pet_blind",
                            "duration": 2,
                            "amount": 5
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map4": {
                    "name": "Field",
                    "chance": 100,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 1,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "dodge_reduction",
                            "duration": 2,
                            "amount": 10
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map5": {
                    "name": "Hidden Laboratory",
                    "chance": 100,
                    "buff": [],
                    "debuff": [
                        {
                            "type": "pet_blind",
                            "duration": 2,
                            "amount": 3
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map6": {
                    "name": "Hidden Laboratory II",
                    "chance": 50,
                    "buff": [],
                    "debuff": [
                        {
                            "type": "stun",
                            "duration": 3
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map7": {
                    "name": "Arena",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_dodge_bonus",
                            "duration": 2,
                            "amount": 10
                        }
                    ],
                    "debuff": [
                        {
                            "type": "stun",
                            "duration": 3
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map8": {
                    "name": "Saint Palace Arena",
                    "chance": 25,
                    "buff": [
                        {
                            "type": "pet_damage_bonus",
                            "duration": 2,
                            "amount": 50
                        },
                        {
                            "type": "pet_dodge_bonus",
                            "duration": 2,
                            "amount": 50
                        }
                    ],
                    "debuff": [
                        {
                            "type": "pet_weaken",
                            "duration": 2,
                            "amount": 50
                        },
                        {
                            "type": "dodge_reduction",
                            "duration": 2,
                            "amount": 50
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map9": {
                    "name": "Soul Forest",
                    "chance": 75,
                    "buff": [
                        {
                            "type": "pet_dodge_bonus",
                            "duration": 2,
                            "amount": 10
                        }
                    ],
                    "debuff": [],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map10": {
                    "name": "Fire Village Street",
                    "chance": 75,
                    "buff": [
                        {
                            "type": "pet_dodge_bonus",
                            "duration": 2,
                            "amount": 10
                        }
                    ],
                    "debuff": [
                        {
                            "type": "dodge_reduction",
                            "duration": 2,
                            "amount": 10
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map11": {
                    "name": "Battle Arena II",
                    "chance": 100,
                    "buff": [
                        {
                            "type": "pet_damage_bonus",
                            "duration": 2,
                            "amount": 5
                        }
                    ],
                    "debuff": [
                        {
                            "type": "pet_weaken",
                            "duration": 2,
                            "amount": 5
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map12": {
                    "name": "Forest",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "bundle",
                            "duration": 2
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map13": {
                    "name": "Practice",
                    "chance": 0,
                    "buff": [],
                    "debuff": [],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map14": {
                    "name": "Easter Field",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "bundle",
                            "duration": 2
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map15": {
                    "name": "Volcano",
                    "chance": 75,
                    "buff": [
                        {
                            "type": "pet_damage_bonus",
                            "duration": 2,
                            "amount": 25
                        }
                    ],
                    "debuff": [
                        {
                            "type": "pet_burn",
                            "amount": 5,
                            "duration": 2
                        }
                    ],
                    "resistanceChance": 100,
                    "resistance": ["pet_heal", "heal"]
                },
                "map16": {
                    "name": "Snow Village",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "bundle",
                            "duration": 2
                        },
                        {
                            "type": "stun",
                            "duration": 2
                        },
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map17": {
                    "name": "Kojima Cave",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "bundle",
                            "duration": 2
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map18": {
                    "name": "Thanksgiving Park",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "bundle",
                            "duration": 2
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map19": {
                    "name": "Halloween Desert",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "bundle",
                            "duration": 2
                        }
                    ],
                    "resistanceChance": 0,
                    "resistance": []
                },
                "map20": {
                    "name": "Snow Field",
                    "chance": 50,
                    "buff": [
                        {
                            "type": "pet_heal",
                            "amount": 2,
                            "duration": 2
                        }
                    ],
                    "debuff": [
                        {
                            "type": "bundle",
                            "duration": 2
                        },
                        {
                            "type": "stun",
                            "duration": 2
                        },
                    ],
                    "resistanceChance": 0,
                    "resistance": ["pet_burn"]
                }
            };
    }
}