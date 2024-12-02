DROP TABLE IF EXISTS MeleeWeapon;
DROP TABLE IF EXISTS MagicWeapon;
DROP TABLE IF EXISTS Weapon;
DROP TABLE IF EXISTS Armour;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Spell;
DROP TABLE IF EXISTS ItemWithFunction;
DROP TABLE IF EXISTS DropItem;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Quest;
DROP TABLE IF EXISTS AttackPattern;
DROP TABLE IF EXISTS Boss;
DROP TABLE IF EXISTS Enemy;
DROP TABLE IF EXISTS NonPlayableCharacter;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Entity;
DROP TABLE IF EXISTS Area;

CREATE TABLE Area (
    areaID INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT,
    recommendedLevel INTEGER NOT NULL,
    CONSTRAINT positiveRecommendedLevel CHECK (recommendedLevel >= 1)
);

CREATE TABLE Entity (
    entityID INTEGER PRIMARY KEY AUTOINCREMENT,
    health INTEGER NOT NULL,
    xCoordinate INTEGER NOT NULL,
    yCoordinate INTEGER NOT NULL,
    areaID INTEGER,
    CONSTRAINT Entity_Area_FK FOREIGN KEY (areaID) REFERENCES Area(areaID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT positiveHealth CHECK (health >= 0),
    CONSTRAINT positiveCoordinates CHECK (xCoordinate >= 0 AND yCoordinate >= 0)
);


CREATE TABLE Player (
    entityID INTEGER PRIMARY KEY,
    level INTEGER NOT NULL,
    maxHealth INTEGER NOT NULL,
    soulsCollected INTEGER NOT NULL,
    vigour INTEGER NOT NULL,
    stamina INTEGER NOT NULL,
    strength INTEGER NOT NULL,
    dexterity INTEGER NOT NULL,
    intelligence INTEGER NOT NULL,
    faith INTEGER NOT NULL,
    CONSTRAINT Player_Entity_FK FOREIGN KEY (entityID) REFERENCES Entity(entityID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT positiveLevel CHECK (level >= 1),
    CONSTRAINT attributeSumMatchesLevel CHECK (level == vigour + stamina + strength + dexterity + intelligence + faith),
    CONSTRAINT positiveSouls CHECK (soulsCollected >= 0),
    CONSTRAINT positiveAttributes CHECK (vigour >= 1 AND stamina >= 1 AND strength >= 1 AND dexterity >= 1 AND intelligence >= 1 AND faith >= 1)
);

CREATE TABLE NonPlayableCharacter (
    entityID INTEGER PRIMARY KEY,
    dialogue TEXT,
    CONSTRAINT NonPlayableCharacter_Entity_FK FOREIGN KEY (entityID) REFERENCES Entity(entityID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Enemy (
    entityID INTEGER PRIMARY KEY,
    maxHealth INTEGER NOT NULL,
    damage INTEGER NOT NULL,
    resistance INTEGER NOT NULL,
    CONSTRAINT Enemy_Entity_FK FOREIGN KEY (entityID) REFERENCES Entity(entityID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT positiveDamage CHECK (damage >= 0),
    CONSTRAINT positiveResistance CHECK (resistance >= 0)
);

CREATE TABLE Boss (
    enemyID INTEGER PRIMARY KEY,
    dialogue TEXT,
    nPhases INTEGER NOT NULL,
    CONSTRAINT Boss_Enemy_FK FOREIGN KEY (enemyID) REFERENCES Enemy(entityID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT validNumberPhases CHECK (nPhases > 0)
);

CREATE TABLE AttackPattern (
    bossID INTEGER NOT NULL,
    phase INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    CONSTRAINT AttackPattern_PK PRIMARY KEY (bossID, phase),
    CONSTRAINT AttackPattern_Boss_FK FOREIGN KEY (bossID) REFERENCES Boss(enemyID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Quest (
    questID INTEGER PRIMARY KEY AUTOINCREMENT,
    objective TEXT NOT NULL,
    reward TEXT,
    progress FLOAT NOT NULL,
    recommendedLevel INTEGER NOT NULL,
    playerID INTEGER,
    npcID INTEGER,
    CONSTRAINT Quest_Player_FK FOREIGN KEY (playerID) REFERENCES Player(entityID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT Quest_NonPlayableCharacter_FK FOREIGN KEY (npcID) REFERENCES NonPlayableCharacter(entityID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT positiveLevel CHECK (recommendedLevel >= 0),
    CONSTRAINT validProgress CHECK (progress >= 0 AND progress <= 1)
);

CREATE TABLE Inventory (
    playerID INTEGER PRIMARY KEY,
    nSlots INTEGER NOT NULL,
    CONSTRAINT Inventory_Player_FK FOREIGN KEY (playerID) REFERENCES Player(entityID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT validNumberSlots CHECK (nSlots > 0 AND nSlots <= 200)
);

CREATE TABLE Item (
    itemID INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    inventoryID INTEGER,
    CONSTRAINT Item_Inventory_FK FOREIGN KEY (inventoryID) REFERENCES Inventory(playerID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE DropItem (
    itemID INTEGER PRIMARY KEY,
    enemyID INTEGER NOT NULL,
    dropRarity INTEGER NOT NULL,
    dropChance FLOAT NOT NULL,
    quantity INTEGER NOT NULL,
    CONSTRAINT MonsterDrop_Item_FK FOREIGN KEY (itemID) REFERENCES Item(itemID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT MonsterDrop_Enemy_FK FOREIGN KEY (enemyID) REFERENCES Enemy(entityID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT validDropChance CHECK (dropChance >= 0 AND dropChance <= 1),
    CONSTRAINT postiveQuantity CHECK (quantity >= 0)
);

CREATE TABLE ItemWithFunction (
    itemID INTEGER PRIMARY KEY,
    function TEXT NOT NULL,
    CONSTRAINT ItemWithFunction_Item_FK FOREIGN KEY (itemID) REFERENCES Item(itemID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Spell (
    itemID INTEGER PRIMARY KEY,
    spellType TEXT NOT NULL,
    requiredInteligence INTEGER NOT NULL,
    requiredFaith INTEGER NOT NULL,
    manaCost INTEGER NOT NULL,
    spellRange INTEGER NOT NULL,
    CONSTRAINT Spell_Item_FK FOREIGN KEY (itemID) REFERENCES Item(itemID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT postiveIntelligence CHECK (requiredInteligence >= 0),
    CONSTRAINT postiveFaith CHECK (requiredFaith >= 0),
    CONSTRAINT postiveManaCost CHECK (manaCost >= 0),
    CONSTRAINT postiveSpellRange CHECK (spellRange >= 0)
);

CREATE TABLE Equipment (
    itemID INTEGER PRIMARY KEY,
    weight INTEGER NOT NULL,
    durability INTEGER NOT NULL,
    upgradeLevel INTEGER NOT NULL,
    soulsToUpgrade INTEGER NOT NULL,
    CONSTRAINT Spell_Item_FK FOREIGN KEY (itemID) REFERENCES Item(itemID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT positiveWeight CHECK (weight >= 0),
    CONSTRAINT positiveDurability CHECK (durability >= 0),
    CONSTRAINT postiveUpgradeLevel CHECK (upgradeLevel >= 0),
    CONSTRAINT postiveSoulsToUpgrade CHECK (soulsToUpgrade >= 0)
);

CREATE TABLE Armour (
    equipmentID INTEGER PRIMARY KEY,
    armourPiece TEXT NOT NULL,
    physicalResistance INTEGER NOT NULL,
    magicResistance INTEGER NOT NULL,
    elementalResistance INTEGER NOT NULL,
    CONSTRAINT Armour_Equipment_FK FOREIGN KEY (equipmentID) REFERENCES Equipment(itemID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT positivePhysicalResistance CHECK (physicalResistance >= 0),
    CONSTRAINT postiveMagicResistance CHECK (magicResistance >= 0),
    CONSTRAINT postiveElementalResistance CHECK (elementalResistance >= 0)
);

CREATE TABLE Weapon (
    equipmentID INTEGER PRIMARY KEY,
    requiredStrength INTEGER NOT NULL,
    requiredDexterity INTEGER NOT NULL,
    damage INTEGER NOT NULL,
    CONSTRAINT Weapon_Equipment_FK FOREIGN KEY (equipmentID) REFERENCES Equipment(itemID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT positiveRequiredStrength CHECK (requiredStrength >= 0),
    CONSTRAINT positiveRequiredDexterity CHECK (requiredDexterity >= 0),
    CONSTRAINT positiveDamage CHECK (damage >= 0)
);

CREATE TABLE MagicWeapon (
    weaponID INTEGER PRIMARY KEY,
    magicType TEXT NOT NULL,
    requiredInteligence INTEGER NOT NULL,
    requiredFaith INTEGER NOT NULL,
    manaCost INTEGER NOT NULL,
    CONSTRAINT MagicWeapon_Weapon_FK FOREIGN KEY (weaponID) REFERENCES Weapon(equipmentID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT positiveRequiredIntelligene CHECK (requiredInteligence >= 0),
    CONSTRAINT positiveRequiredFaith CHECK (requiredFaith >= 0),
    CONSTRAINT positiveManaCost CHECK (manaCost >= 0)
);

CREATE TABLE MeleeWeapon (
    weaponID INTEGER PRIMARY KEY,
    meleeType TEXT NOT NULL,
    physicalDamage INTEGER NOT NULL,
    meleeRange INTEGER NOT NULL,
    attackSpeed INTEGER NOT NULL,
    CONSTRAINT MeleeWeapon_Weapon_FK FOREIGN KEY (weaponID) REFERENCES Weapon(equipmentID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT positivePhysicalDamage CHECK (physicalDamage >= 0),
    CONSTRAINT positiveMeleeRange CHECK (meleeRange > 0),
    CONSTRAINT positiveAttackSpeed CHECK (attackSpeed >= 0)
);