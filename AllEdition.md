# All Edition

## TODO FUTURE
- add Effect: pet_save_cp (when CP System Added)

## TODO
- Refactor Battle and SelectCharacter to AS File (?) -> Using Linkage (?)
- Add Battle ATB Bar (TODO ?)

## v0.2
### 24 Apr
#### Game UI
#### Characters
#### Feature
- rearrange the background sequence (DONE)
#### Other
- refactor many codes

### 23 Apr
#### Game UI
-add special skill button (DONE)
#### Characters
#### Feature

### 22 Apr
#### Game UI
-add map effect resistance (WIP)
#### Characters
-update Chick and Baby Bird Icon (DONE)
#### Feature
-show overheadeffect when character start turn (DONE)
-add map effect resistance system (DONE)

### 21 Apr
#### Game UI
-update OverheadNumber MovieClip (DONE)
#### Feature
-show overheadeffect when character start turn (TODO)

### 16 - 19 Apr
#### Map Effect
- Strengthen, Protection, Weaken, Blind, Numb, Dodge +

### 15 Apr
#### Game UI
- Add Map Effect Info (WIP)
- Move Control Party, Agility System to Select Char
#### Feature
- Add Map Effect System (WIP) -> All Map Effect will be overturn effect
#### Map Effect
- Stun, Restriction, Heal

### 14 Apr
#### Game UI
#### Characters
- Little Minotaur, Cerberus, Griffin, Wanyudo, Gashadokuro (DONE)
- Raita, Zoshi, Dorimaru, Chick, Baby Bird (DONE)
### 13 Apr
#### Game UI
- Change UI Select Character add AP, Pet Type, Show All Character Body not Icon (DONE)
#### Characters
- Football Player Rakura, Ace Striker, Monkey Keeper, Ace Striker, Felinia (DONE)
- Kame, Katsura, Takachi, Daruma Family (DONE)
- Suzu, Eriko, Leiko, Suki, Inokuchi, Tomaru (DONE)
#### Effect
- heal_damage
- flame_eater (TEST)
- pet_reflect_attack
- ecstatic_sound
- pet_drain_hp_kekkai

### 12 Apr
#### Game UI
- Change UI Select Character add Name, Level, HP, CP Information (DONE)
#### Feature
- Add ATB Mode Selection (need to test)
#### Characters
- Football Player Rakura (Need Check Library because only copy from Rakura)
#### WIP
- Add MapEffect File

### 16 Mar
#### TODO (Too many error)
- Fixing code depends on asconfig.json (WARNING)

#### Bug Fix
- coilding_wave doesn't reduce CP but reduce HP 2 times

#### Game System
- CP System
- ATB System

## v0.1
- Add Feat: Stats Option (Default or Define Level)
- Add Characters: Easter (DONE)

### 16 Mar
#### TODO
- Testing Critical

#### FIXED
- drain bug not to master
- checkDebuff isDead or Pass

#### In Game UI
- Add Game Mode Selection in Custom (PvP/PvE)
- Player Win Text in PvP too Large -> P1/P2 Win

### 15 Mar
#### TODO 
- PvP and PvE Mode
- PvP only available in Custom (Add game UI TODO)
- Fix selectedTarget for PvP Mode

#### In Game UI
- show overhead number when reduce HP/CP or recover HP/CP

### 13 Mar
#### TODO
- Add Feat: Stats Option (Default or Define Level) (TESTING)
- Add check isDead when checkDebuff (TESTING)
- Add New Target Type Team (DONE)

#### FIXED
- game map when click prev in first map, show error

#### Game System
- effect sleep removed when target is attacked

### 12 Mar
#### FIXED
- refactor overhead effect because there is a chance effect system (the overhead still appear when the effect not added) done
- refactor bunny_frenzy (only need to add in buff the side effect checking will be added in checkBuff() function) maybe different case because kabocha attack and get the buff (CHECK AGAIN)
- check bug maybe pet_damage_to_cp done not bug
- overheadEffect move to addEffect (???) done -> move
- serene_mind bug 1 turn but 2 (buff maybe checkBuff) done -> checking the duration not has
- guard bug like serene mind bug (done)
#### Game System
- add effect chance check (add chance variable in effect object)

#### Characters
- Easa, 
- Zenitsu, Eashin

### 11 Mar
#### Game UI
- Add Character List Pagination (DONE)

#### Characters
- Sonic Bunny, Earth Turtle, Dark Bee, Itikura, Rakura, Zen, Zetsu (DONE)

#### Effect
##### Add Effect
- catalytic_matter, crit_chance_dmg, restrict_charge, pet_lightning (DONE)

#

### [Date]
#### Game UI
#### Characters
#### Effect
#### Feature