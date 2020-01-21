#priority 450
#loader contenttweaker
#modloaded bathappymod
//The Config of Tinker's Skyisland
//匠魂空岛的配置文件

import crafttweaker.item.IItemStack;

//Ores which can be obtained by Prospector trait
//可以通过探矿特性获取的矿物
static oreList as int[][string] = {
    //"name" : [color,chance,isNetherOre] (1 = 1‰) (isNetherOre = 0 means Overworld, 1 means Nether)
    "Iron" : [0xBF8040,200,0],
    "Gold" : [0xFFFF00,120,0],
    "Cobalt" : [0x3333FF,200,1],
    "Ardite" : [0xFF751A,140,1],
    "Copper" : [0xFF9933,175,0],
    "Tin" : [0xE6FFF2,145,0],
    "Aluminium" : [0xBFBFBF,120,0],
    "Lead" : [0x6779AD,120,0],
    "Silver" : [0xF2F2F2,125,0],
    "Nickel" : [0xFFFFCC,140,0],
    "Osmium" : [0xBBDDFF,130,0],
    "Yellorium" : [0xDCF400,10,0],
    "Platinum" : [0x69DAF0,8,0],
    "Iridium" : [0xC8C6DD,5,0]
};

//Ores or Gems which can be obtained by Lapidary Calibration trait
//可以通过宝石刻印校准获取的矿物
static gemList as int[IItemStack] = {
    //IItemStack : chance (1 = 1%)
    <item:minecraft:redstone> : 18,
    <item:minecraft:glowstone_dust> : 8,
    <item:minecraft:diamond> : 1,
    <item:minecraft:emerald> : 1,
    <item:minecraft:dye:4> : 6,
    <item:appliedenergistics2:material> : 6,
    <item:enderio:item_material:20> : 9,
    <item:appliedenergistics2:material:45> : 1
};