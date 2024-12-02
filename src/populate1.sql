PRAGMA foreign_keys = ON;

INSERT INTO Area (areaID, description, recommendedLevel) VALUES
(1, 'Trading Haul', 1),
(2, 'Cave', 5),
(3, 'Arena', 15),
(4, 'Hidden Gem Cave', 30),
(5, 'Light Temple', 20),
(6, 'Alley', 10),
(7, 'Shadow Realm', 50),
(8, 'Jungle', 20),
(9, 'Main Lobby', 1),
(10, 'Spider Nest', 70),
(11, 'Tilted Towers', 69),
(12, 'Los Santos', 80),
(13, 'Route A', 30);

INSERT INTO Entity (entityID, health, xCoordinate, yCoordinate, areaID) VALUES
(1, 83, 65, 72, 1),
(2, 100, 42, 27, 1),
(3, 15, 67, 74, 2),
(4, 400, 95, 12, 4),
(5, 26, 85, 2, 2),
(6, 100, 84, 26, 3),
(7, 100, 35, 28, 2),
(8, 200, 55, 12, 5),
(9, 35, 45, 198, 9),
(10, 500, 34, 48, 10),
(11, 50, 62, 74, 10),
(12, 40, 52, 56, 10),
(13, 70, 93, 62, 10),
(14, 700, 4, 20, 11),
(15, 40, 23, 27, 8),
(16, 35, 84, 62, 8),
(17, 40, 72, 15, 8),
(18, 30, 73, 52, 8),
(19, 25, 53, 37, 8),
(20, 100, 64, 62, 9),
(21, 100, 82, 51, 9),
(22, 100, 45, 68, 9),
(23, 100, 89, 34, 9),
(24, 100, 59, 76, 9),
(25, 100, 45, 20, 9),
(26, 50, 45, 56, 12),
(27, 60, 81, 65, 12),
(28, 55, 16, 47, 12),
(29, 50, 84, 12, 12),
(30, 45, 64, 47, 12),
(31, 60, 15, 16, 12),
(32, 1000, 51, 26, 12),
(33, 15, 53, 86, 13),
(34, 20, 12, 43, 13),
(35, 40, 27, 72, 13),
(36, 35, 45, 45, 13),
(37, 20, 20, 78, 13);

INSERT INTO Player (entityID, level, maxHealth, soulsCollected, vigour, stamina, strength, dexterity, intelligence, faith) VALUES
(1, 27, 100, 65, 10, 3, 2, 7, 4, 1);

INSERT INTO NonPlayableCharacter (entityID, dialogue) VALUES
(2, 'Get me 5 souls before the sunset and I will reward you!'),
(6, NULL),
(20, NULL),
(21, NULL),
(22, NULL),
(23, 'Kill the mighty spider and come back'),
(24, NULL),
(25, NULL);

INSERT INTO Enemy (entityID, maxHealth, damage, resistance) VALUES
(3, 50, 20, 2),
(4, 400, 105, 20),
(5, 40, 7, 1),
(7, 100, 20, 5),
(8, 200, 55, 10),
(9, 35, 15, 4),
(10, 500, 200, 30),
(11, 50, 10, 10),
(12, 40, 20, 5),
(13, 70, 15, 7),
(14, 700, 201, 41),
(15, 40, 15, 3),
(16, 35, 10, 2),
(17, 40, 5, 5),
(18, 30, 15, 3),
(19, 25, 20, 2),
(26, 50, 20, 5),
(27, 60, 30, 7),
(28, 55, 25, 8),
(29, 50, 20, 6),
(30, 45, 25, 7),
(31, 60, 30, 5),
(32, 1000, 300, 50),
(33, 15, 15, 3),
(34, 20, 10, 4),
(35, 40, 20, 1),
(36, 35, 15, 8),
(37, 20, 20, 4);

INSERT INTO Boss (enemyID, dialogue, nPhases) VALUES
(4, 'You will never defeat me!', 3),
(8, NULL, 2),
(10, 'You walked into the wrong nest!', 5),
(14, 'Fortnite is cool', 7),
(32, 'Oh sheep here we go again', 2);

INSERT INTO AttackPattern (bossID, phase, name, description) VALUES
(4, 1, 'Slash', 'The boss slashes his sword stunning anyone caught by it'),
(4, 2, 'Charge', NULL),
(4, 3, 'Burst', NULL),
(8, 1, 'Area', NULL),
(8, 2, 'Blast', NULL),
(10, 1, 'Basic Web', 'The spider shoots a web that damages the player'),
(10, 2, 'Slow trap', 'The spider shoots webs that trap and slow down the player'),
(10, 3, 'Bite', NULL),
(10, 4, 'Recover', NULL),
(10, 5, 'Headbutt', NULL),
(14, 1, 'T-Pose', NULL),
(14, 2, 'Rejubilation', NULL),
(14, 3, 'Orange Justice', NULL),
(14, 4, 'Dance Moves', NULL),
(14, 5, 'Floss', NULL),
(14, 6, 'Electric Shuffle', NULL),
(14, 7, 'Take the L', NULL),
(32, 1, 'Minigun', NULL),
(32, 2, 'CJ', NULL);

INSERT INTO Quest (questID, objective, reward, progress, recommendedLevel, playerID, npcID) VALUES
(1, 'Get 5 souls', '3000 coins', 0, 10, NULL, 2),
(2, 'Kill 15 monsters', 'Random common item', 0, 15, 1, 6),
(3, 'Kill 10 monsters', '10 coins', 1, 5, 1, NULL),
(4, 'Get 1000 coins', '100 EXP', 1, 5, 1, NULL),
(5, 'Find the Hidden Gem Cave', '1000 EXP', 1, 7, 1, 20),
(6, 'Log-in for 10 days', '100 coins', 1, 0, 1, 21),
(7, 'Find the Spider Nest', '100 coins', 0, 70, NULL, 22),
(8, 'Kill the Mighty Spider', '1500 EXP', 0, 70, NULL, 23),
(9, 'Win your first battle in the Arena', '500 coins', 1, 10, 1, 24),
(10, 'Win 10 battles in the Arena', '2000 coins', 0, 20, 1, 25);

INSERT INTO Inventory (playerID, nSlots) VALUES
(1, 30);

INSERT INTO Item (itemID, name, inventoryID) VALUES
(1, 'Coin', NULL),
(2, 'Iron Sword', 1),
(3, 'Teleport Stone', 1),
(4, 'Fireball', 1),
(5, 'Basic Helmet', 1),
(6, 'Mage Robe', 1),
(7, 'Light Staff', NULL),
(8, 'Traveller Boots', 1),
(9, 'Coin', NULL),
(10, 'Spider Fang', NULL),
(11, 'String', NULL),
(12, 'String', NULL),
(13, 'Dark Scythe', NULL),
(14, 'Ice Shards', NULL),
(15, 'Health boost', 1),
(16, 'Fire Sword', NULL),
(17, 'Wormhole', NULL),
(18, 'Razor Leaf', NULL),
(19, 'Mage Flip-Flops', NULL),
(20, 'Fire Staff', NULL),
(21, 'Scrap', NULL),
(22, 'Scrap', 1),
(23, 'Apple', 1),
(24, 'Bread', 1),
(25, 'Moonlight Greatsword', NULL),
(26, 'Spear', NULL),
(27, 'Morning Star', NULL);

INSERT INTO MonsterDrop (itemID, enemyID, dropRarity, dropChance, quantity) VALUES
(1, 3, 1, 1, 10),
(7, 8, 10, 1, 1),
(9, 9, 1, 0.5, 10),
(10, 10, 30, 0.7, 1),
(11, 11, 1, 0.6, 2),
(12, 13, 1, 0.3, 5),
(13, 14, 30, 0.001, 1),
(14, 17, 5, 0.5, 1),
(16, 11, 10, 0.01, 1),
(17, 32, 100, 0.001, 1),
(20, 27, 20, 0.12, 1),
(21, 26, 1, 0.8, 3),
(25, 36, 30, 0.05, 1),
(26, 5, 20, 0.1, 1);

INSERT INTO ItemWithFunction (itemID, function) VALUES
(3, 'Teleportation'),
(10, 'Opens a secret door'),
(17, 'Creates a wormhole'),
(23, 'Recovers health over time'),
(24, 'Recovers health quickly');

INSERT INTO Spell (itemID, spellType, requiredInteligence, requiredFaith, manaCost, spellRange) VALUES
(4, 'Fire', 5, 5, 10, 15),
(14, 'Ice', 10, 7, 20, 10),
(15, 'Life', 10, 10, 50, 0),
(18, 'Grass', 20, 25, 30, 20);

INSERT INTO Equipment (itemID, weight, durability, upgradeLevel, soulsToUpgrade) VALUES
(2, 5, 98, 15, 50),
(5, 10, 100, 20, 50),
(6, 5, 250, 50, 100),
(7, 8, 200, 40, 90),
(8, 5, 100, 10, 20),
(13, 15, 400, 80, 200),
(16, 10, 250, 30, 70),
(19, 5, 100, 40, 65),
(20, 10, 150, 35, 70),
(25, 25, 400, 65, 100),
(26, 10, 150, 10, 50),
(27, 30, 500, 100, 200);

INSERT INTO Armour (equipmentID, armourPiece, physicalResistance, magicResistance, elementalResistance) VALUES
(5, 'Head', 10, 0, 0),
(6, 'Chest', 5, 15, 10),
(8, 'Feet', 5, 0, 0),
(19, 'Feet', 5, 10, 10);

INSERT INTO Weapon (equipmentID, requiredStrength, requiredDexterity, damage) VALUES
(2, 5, 5, 15),
(7, 10, 10, 30),
(13, 50, 60, 150),
(16, 20, 20, 50),
(20, 15, 20, 30),
(25, 40, 30, 70),
(26, 5, 7, 20),
(27, 60, 70, 250);

INSERT INTO MagicWeapon (weaponID, magicType, requiredInteligence, requiredFaith, manaCost) VALUES
(7, 'Light', 10, 10, 25),
(16, 'Fire', 15, 15, 30),
(20, 'Fire', 20, 25, 30),
(27, 'Light', 60, 40, 100);

INSERT INTO MeleeWeapon (weaponID, meleeType, physicalDamage, meleeRange, attackSpeed) VALUES
(2, 'Slash', 15, 2, 2),
(13, 'Swing', 100, 4, 3),
(25, 'Slash', 30, 3, 1),
(26, 'Stab', 20, 4, 1);