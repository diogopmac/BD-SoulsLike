# BD-SoulsLike

The project is designed to track essential aspects of a SoulsLike game. All information is divided into
four main categories: Entities, Areas, Items or Events.

For our Entities, we need to know that every Entity in the game has its ID, a current health, a location
on x, and a location on y. The entity we control in the game is the Player. For the player, it should store
information such as level, its max health, the number of souls it collected (currency of the game), and
base attributes such as vigour, stamina, strength, dexterity, intelligence and faith.
Next, the Non-Playable Character (or NPC). This Entity is responsible for giving Quests and giving tips
or crucial information for the game progression to the player. Each NPC has a dialogue when you
interact with them and should give a Quest.

The Quest should have an ID, an objective, a reward, the current progress of the Quest and the
recommended level for the quest completion. The Enemy is also an Entity, and it can appear on
various situations of the game, being hostile and attacking the player, when sighted. It should store its
max health, its resistance and its damage output. Bosses are a specific type of enemy, much
dangerous and only required to defeat once, dictating crucial progress in the game. 
The bosses should have a dialogue when you enter the boss arena and record the number of phases of the boss
fight, determining the amount of different attack patterns and aggressiveness.

The Player can walk into Areas in the game, each area having an ID, a brief description of the Area,
and a recommended level to have a normal experience in that Area. Every area has a set of different
Enemies.

Player and Enemy both possess items. Every Item should have an ID and its name. Players have an
Inventory, which carries a determined number of Items. Every item in the game should be either an
Equipment or a general Item with a function. Each piece of Equipment should track weight, durability,
the current level and the required souls to upgrade it, and it should be one of three types: Melee,
Magic or Armour. Melee should have a type (sword, axe, etc), the requirements for using it, strength
and dexterity, and its physical damage output. Magic should also have a type (enchantment, damage
magic, etc), required stats, intelligence and faith, the mana cost for the spell and its magical damage
output. Armour should track the piece of armour (helmet, plate, etc) and the resistance it gives the
entity. An Item with function should only track its functionality (crafting, keys, etc). Enemies at death
can drop Items, each having a different percentage of dropping (it can be zero.)

## Chart (LucidChart)

![SoulsLikeGPT](https://github.com/user-attachments/assets/fb5951ed-07fe-4d1a-813d-99c8ae08b0ab)
