# All Edition

## TODO FUTURE
- add Effect: pet_save_cp (when CP System Added)

## TODO
- Refactor Battle and SelectCharacter to AS File (?) -> Using Linkage (?)
- Add Battle ATB Bar (TODO ?)
- Refactor code using Utils
- add Match and Character Battle Stats (WIP)
- add Buff and Debuff List (TODO ?)
- bug on PvP control party automatically enabled (DONE)
- add info dialog on SelectChar (Agility System, Button) (TODO)

## v0.2
### 11 May
#### Game UI
#### Characters
- Remove Unrelease Pet
#### Effect
#### Map Effect
#### Feature
#### Other

### 10 May
#### Game UI
- update main menu UI
#### Characters
- Blue Cybot, Chibi Zord (5), Gold Cybot, Chibi Intel Zord (5)
- Mini Taiko, Inari Fox, Takoyaki Master, Mini Wishing Tree
- Kyozan, Aomaru, Silver Monkey King, Ninja Falcon, Miko Cat
- Origami Panda, Sakura Tori, Origami Butterfly, Origami Pegasus, Origami Kirin, Sakura Dragon Girl
#### Effect
#### Map Effect
#### Feature
#### Other
- add hundredPercentAttack Check 

### 5 May
#### Game UI
- add info dialog on SelectChar (Agility System, Button) (WIP)
#### Characters
#### Effect
#### Map Effect
#### Feature
#### Other
- refactor control char function, checkDebuff

### 4 May
#### Game UI
- update custom UI (WIP)
- add battle mode selection (WIP)
#### Characters
#### Effect
#### Map Effect
#### Feature
#### Other
- add watchMode in checkGameFinish

### 3 May
#### Game UI
#### Characters
#### Effect
#### Map Effect
#### Feature
#### Other
- move watchMode

### 2 May
#### Game UI
#### Characters
#### Effect
#### Map Effect
#### Feature
#### Other
- fix Bug UI show stats button in Android (DONE)
- Refactor create movieclip from asset
### 1 May
#### Game UI
- add char Stats (WIP)
#### Characters
- fix Kame max level
#### Effect
- update EffectData displayText
#### Map Effect
#### Feature
- add Watch Mode (Test mode only)
#### Other
- add StatsUtils
- add Heal, DamageTaken Stats

### 30 Apr
#### Game UI
- update Serene Mind displaytext from OverheadNumber to OverheadEffect
#### Effect
- update add_all_cooldown effect -> (basic attack not affected by it)
#### Other
- move effectArray Logic to addEffect
- add battleStats to Pet Class
- fix pass, missedturn

### 29 Apr
#### Game UI
- add PlayerId to Indicate player the sequence
- add Resisted Text in OverheadEffect
#### Characters
#### Effect
#### Map Effect
#### Feature
#### Other
- fix randomChar scaleX -> set selectTurn variable before selectRandom
- remove MapEffectData (TODO ? Move it to EffectData)

### 28 Apr
#### Game UI
- add Pet Info Dialog (WIP 80%)
- add after battle stats (WIP 2%)
- remove surrender button
- add clear all and get random character (DONE)
- update Select Map UI
#### Characters
#### Effect
#### Map Effect
#### Feature
#### Other

### 27 Apr
#### Game UI
- add Pet Info Dialog (WIP)
- add Total Turn, Damage Team (DONE)
#### Characters
#### Effect
#### Feature
- add specialSkill, attributeSkill Boolean (Maybe Switch in Future)
#### Other
- Refactor Warning
- revert back duration > 1 -> duration > 0

### 26 Apr
#### Game UI
- add Action Bar, Total Turn / Char
- add Confirmation Dialog for Run
- add Timeout after Game Finish
#### Characters
#### Effect
#### Feature
- Attribute Skill System (TODO)
- Overhead Effect Fix and Update using EffectData (TODO)
#### Other
- Refactor switchButton

### 25 Apr
#### Game UI
#### Characters
- ponpoco animation bug (DONE)
#### Effect
- check guard turn (0 or 1) (TODO TEST)
#### Feature
- testing special skill feature (WIP)
- can use cooldown last skill (DONE) -> because LINE 1167-1169 (btnPass)

### 24 Apr
#### Game UI
- update PetType Visibility in Character List
#### Characters
- update character position animation
- update Mini Treefolk Skill Effect
#### Feature
- rearrange the background sequence (DONE)
- add Run feature -> TODO Confirmation Popup
#### Other
- refactor many codes
- add mapId -> mapEffect id
- fix bug control party button not appear when PvP Opponent has more than 1 char 
- fix bug player target visible when control party activated and PVE, opponent turn

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
#### Map Effect
- Burn

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
#### Map Effect
#### Feature
#### Other