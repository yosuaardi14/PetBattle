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
                    ]
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
                    ]
                },
                "map2": {
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
                    ]
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
                    ]
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
                    ]
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
                    ]
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
                    ]
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
                    ]
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
                    ]
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
                    "debuff": []
                },
                "map10": {
                    "name": "City",
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
                    ]
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
                    ]
                }
            };
    }
}