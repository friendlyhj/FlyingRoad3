#loader contenttweaker
#ignoreBracketErrors
#modloaded bathappymod
#priority 45
import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.contenttweaker.tconstruct.TraitDataRepresentation;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.contenttweaker.tconstruct.Material;
import crafttweaker.item.IItemStack;
import mods.ctutils.utils.Math;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.item.IIngredient;
import crafttweaker.player.IPlayer;


val moist = mods.contenttweaker.tconstruct.TraitBuilder.create("moist");
moist.color = 0xFF00FF;
moist.localizedName = ("湿润");
moist.localizedDescription = ("§o水乃生命之源……§r\n§f破坏特定方块时湿润它。\n沙子=>粘土块 下界石英矿石=>海晶碎片/海晶砂粒");
moist.onBlockHarvestDrops = function(trait, tool, event) {
    var id as string = event.block.definition.id;
    if (id == "minecraft:sand"){
        event.drops = [<item:minecraft:clay> % 100];
    } else if (id == "minecraft:quartz_ore"){
        event.drops = [<item:minecraft:prismarine_shard> % 100,<item:minecraft:prismarine_crystals> % 50];
    }
};
moist.register();


val soft = mods.contenttweaker.tconstruct.TraitBuilder.create("soft");
soft.color = 0xFFFFFF;
soft.localizedName = ("柔软");
soft.localizedDescription = ("§o宛如湿面条！§r\n§f对生物不会造成任何伤害。");
soft.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
    return 0.0f;
};
soft.register();


val vibrant = mods.contenttweaker.tconstruct.TraitBuilder.create("vibrant");
vibrant.color = 0xFF00FF;
vibrant.localizedName = ("生机");
vibrant.localizedDescription = ("§o活跃的生命力！§r\n§f使用工具时有几率掉落种子。");
vibrant.onBlockHarvestDrops = function(trait, tool, event) {
    var seed as double = Math.random();
    if (!(seed >= 0.00500000000001)) {
        event.drops += <item:minecraft:melon_seeds> % 100;
    } else if (!(seed >= 0.01000000000001)) {
        event.drops += <item:minecraft:pumpkin_seeds> % 100;
    } else if (seed >= 0.95){
        event.drops += <item:minecraft:wheat_seeds> % 100;
    } else if (seed >= 0.948){
        event.drops += <item:minecraft:cactus> % 100;
    } else if (seed >= 0.93){
        event.drops += <item:minecraft:reeds> % 100;
    } else if (seed >= 0.9){
        event.drops += <item:contenttweaker:grass_seed> % 100;
    }
};
vibrant.register();

val petrified = mods.contenttweaker.tconstruct.TraitBuilder.create("petrified");
petrified.color = 0x999999;
petrified.localizedName = ("石化");
petrified.localizedDescription = ("§o时间的沉淀……§r\n§f破坏骨块掉落圆石，有几率掉落煤炭。");
petrified.addItem(<item:contenttweaker:gunpower_in_bone>);
petrified.onBlockHarvestDrops = function(trait,tool,event){
    var id as string = event.block.definition.id;
    if (id == "minecraft:bone_block"){
        event.drops = [<item:minecraft:cobblestone> * 6 % 100,<item:minecraft:coal:0> % 60];
    }
};
petrified.register();

val smashment = mods.contenttweaker.tconstruct.TraitBuilder.create("smashment");
smashment.color = 0xD94242;
smashment.maxLevel = 2;
smashment.countPerLevel = 9;
smashment.addItem(<item:contenttweaker:smashment>);
smashment.localizedName = ("粉碎");
smashment.localizedDescription = ("§o实锤了！§r\n§f使你的工具就像个无中生有的锤子\n圆石=>沙砾 沙砾=>沙子\n二级允许压缩锤");
smashment.onBlockHarvestDrops = function(trait,tool,event){
    var compress as bool = (trait.getData(tool).level == 2);
    if (event.block.definition.id == "minecraft:cobblestone"){event.drops = [<item:minecraft:gravel> % 100];}
    else if (event.block.definition.id == "minecraft:gravel"){event.drops = [<item:minecraft:sand> % 100];}
    if (compress) {
        var dropping as IItemStack = <item:minecraft:dirt>;
        if (event.drops.length == 1){dropping = event.drops[0].stack;}
        if (<ore:compressed1xCobblestone> has dropping) {event.drops = [<item:minecraft:gravel> * 9 % 100];}
        else if (<ore:compressed1xGravel> has dropping) {event.drops = [<item:minecraft:sand> * 9 % 100];}
    }
};
smashment.register();

val prospector = mods.contenttweaker.tconstruct.TraitBuilder.create("prospector");
prospector.color = 0x66CCFF;
prospector.maxLevel = 2;
prospector.countPerLevel = 9;
prospector.addItem(<item:contenttweaker:orement>);
prospector.localizedName = ("探矿");
prospector.localizedDescription = ("§o地质学家§r\n§f破坏沙砾或地狱岩会掉落矿物碎片。\n与时运兼容，但时运III + 探矿 I 挖沙砾只能获得燧石，请使用探矿 II 挖压缩沙砾。");
prospector.canApplyTogetherTrait = function(TraitRepresentation, otherTrait){
    return otherTrait != "smashment";
};
prospector.extraInfo = function(thisTrait, item, tag){
    var info as string[] = ["破坏沙砾或地狱岩时，获得："];
    for key,value in scripts.tinkers_skyisland.config.oreList{
        info += game.localize("base.material." ~ key.toLowerCase()) ~ " : " ~ ((0.0 + value[1]) / 10) ~ "%"; 
    }
    return info;
};
prospector.onBlockHarvestDrops = function(trait,tool,event){
    // BEGIN FORTUNE SUPPORT. HAS SOME PROBLEM?
    val tab as float[] = [1.0, 1.1, 1.3, 1.5];
    val lib as int[][string] = scripts.tinkers_skyisland.config.oreList;
    for key,value in lib {
        lib[key][1] = value[1] * tab[event.fortuneLevel];
    }
    // END FORTUNE SUPPORT.
    var pieceDrop as WeightedItemStack[string] = {};
    var pieceDropCompressed as WeightedItemStack[string] = {};
    var dropping as IItemStack = <item:minecraft:dirt>;
    var group as int = 0;
    var compress as bool = (trait.getData(tool).level == 2);
    if (event.drops.length == 1){dropping = event.drops[0].stack;}
    if (<ore:gravel> has dropping) {
        for key,value in lib{
            var stack as IItemStack = oreDict.get("piece" + key).firstItem;
            if (!isNull(stack) && oreDict in ("ore" + key) && value[2] == 0) {
                pieceDrop[key] = stack.weight((0.0f + value[1]) / 1000);
            }
        }
        event.drops = pieceDrop.values;
    }
    if (<ore:netherrack> has dropping) {
        group = 1;
        for key,value in lib{
            var stack as IItemStack = oreDict.get("piece" + key).firstItem;
            if (!isNull(stack) && oreDict in ("ore" + key) && value[2] == 1) {
                pieceDrop[key] = stack.weight((0.0f + value[1]) / 1000);
            }
        }
        event.drops = pieceDrop.values;		
    }
    if (compress) {
        var isDo as bool = false;
        if (<ore:compressed1xGravel> has dropping) {
            group = 0;
            isDo = true;
        } else if (<ore:compressed1xNetherrack> has dropping){
            group = 1;
            isDo = true;
        }
        if (isDo) {
            var chance as double[string] = {};
            var member as string[int] = {};
            var returnItem as int[string] = {};
            var j as int = 0;
            for key,value in lib{
                if (value[2] == group) {
                    chance[key] = 1.0 - (0.0 + value[1]) / 1000;
                    member[j] = key;
                    j += 1;
                }
            }
            for i in 0 to 7{
                for i in 0 to j {
                    var seed as double = Math.random();
                    if (seed >= chance[member[i]]){
                        if (isNull(returnItem[member[i]])) {
                            returnItem[member[i]] = 1;
                        } else {
                            returnItem[member[i]] = returnItem[member[i]] + 1;
                        }
                    }
                }
            }
             for key,value in returnItem{
                var stack as IItemStack = oreDict.get("piece" + key).firstItem;
                if (!isNull(stack) && oreDict in ("ore" + key)) {
                    pieceDropCompressed[key] = stack * value % 100;
                }
            }
            event.drops = pieceDropCompressed.values; 
        }
    }
};
prospector.register();

val lapidary = mods.contenttweaker.tconstruct.TraitBuilder.create("lapidary_calibration");
//lapidary.maxLevel = 2;
lapidary.color = 0xFFFFFF;
lapidary.localizedName = ("宝石校准");
lapidary.localizedDescription = ("§o闪闪发亮……§r\n§f破坏石头时掉落各种宝石与非金属材料");
lapidary.canApplyTogetherTrait = function(TraitRepresentation, otherTrait){
    return otherTrait != "prospector";
};
lapidary.extraInfo = function(thisTrait, item, tag){
    var info as string[] = ["破坏石头后获得："];
    for key,value in scripts.tinkers_skyisland.config.gemList{
        info += (key.displayName ~ " : " ~ value ~ "%");
    }
    return info;
}; 
lapidary.onBlockHarvestDrops = function(trait,tool,event){
    var j as int = 0;
    var id as string = event.block.definition.id;
    var gemDrop as WeightedItemStack[int] = {};
    var fortune as int = event.fortuneLevel;
    if (id == "minecraft:stone") {
        for key,value in scripts.tinkers_skyisland.config.gemList{
            j += 1;
            if (fortune <= 0) {gemDrop[j] = key % value;} 
            //REGISTER AND FORTUNE SUPPORT
            else if (fortune == 1) {gemDrop[j] = key % (1.1 * value);}
            else if (fortune == 2) {gemDrop[j] = key % (1.3 * value);} 
            else if (fortune >= 3) {gemDrop[j] = key % (1.5 * value);} 
        }
        event.drops = gemDrop.values;
    }
};
lapidary.register();

val soul = mods.contenttweaker.tconstruct.TraitBuilder.create("soul");
soul.color = 0xFFFFFF;
soul.localizedName = ("摄魂");
soul.localizedDescription = ("§oGHOST NOT FACING WALL IS PUSH§r\n§f杀死怪物后，副手若有沙子，将其中1-4个转换为灵魂沙");
soul.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
    if (!target.alive && !target instanceof IPlayer){
        var off = crafttweaker.entity.IEntityEquipmentSlot.offhand();
        var offIng as IIngredient = attacker.offHandHeldItem;
        var offItem as IItemStack = attacker.offHandHeldItem;
        if (!isNull(offItem) && offItem.definition.id == "minecraft:sand"){
            var seed as double = Math.random();
            var am as int = 1;
            if (seed >= 0.75) {am = 4;}
            else if (seed >= 0.50) {am = 3;}
            else if (seed >= 0.25) {am = 2;}
            if ((offIng.amount) >= (am + 1)){
                if (!target.world.remote) {
                    if (target.world.spawnEntity((<item:minecraft:soul_sand> * am).createEntityItem(target.world,Math.floor(target.x),Math.floor(target.y),Math.floor(target.z)))) {
                        attacker.setItemToSlot(off,<item:minecraft:sand> * (offIng.amount - am));
                    }
                }
            } else {
                am = offIng.amount;
                attacker.setItemToSlot(off,<item:minecraft:soul_sand> * am);
            }
        }
    }
};
soul.register();

val inf = mods.contenttweaker.tconstruct.TraitBuilder.create("infinity");
inf.color = 0xCC6666;
inf.addItem(<item:mekanism:basicblock:2>);
inf.maxLevel = 2;
inf.countPerLevel = 9;
inf.localizedName = "无限";
inf.localizedDescription = "§o洪荒之力！§r\n§f达到二级后你的工具将不消耗耐久。\n与EIO种植站不兼容\n18/18无限II工具在工作台另加6个强化黑曜石和2个下界之星可把工具升级为无法破坏。";
inf.onToolDamage = function(trait, tool, unmodifiedAmount, newAmount, holder) {
    if (trait.getData(tool).level == 2) {return 0;}
    else return newAmount;
};
inf.canApplyTogetherTrait = function(TraitRepresentation, otherTrait) {
    return otherTrait != "brittle";
};
inf.register();

val plantMatter = mods.contenttweaker.tconstruct.MaterialBuilder.create("plant_matter");
plantMatter.color = 0x55CA52;
plantMatter.craftable = true; 
plantMatter.addItem(<item:contenttweaker:plant_matter>);
plantMatter.representativeItem = <item:contenttweaker:plant_matter>;
plantMatter.addHeadMaterialStats(18,1.5f,1,0);
plantMatter.addHandleMaterialStats(1.01,-5);
plantMatter.addExtraMaterialStats(5);
plantMatter.addMaterialTrait(<ticontrait:soft>,"head");
plantMatter.addMaterialTrait(<ticontrait:soft>,"handle");
plantMatter.addMaterialTrait(<ticontrait:soft>,"extra");
plantMatter.addMaterialTrait(<ticontrait:moist>,"head");
plantMatter.addMaterialTrait(<ticontrait:vibrant>,"extra");
plantMatter.addMaterialTrait("ecological","handle");
plantMatter.itemLocalizer = function(thisMaterial,itemName){return "自然物质 " + itemName;};
plantMatter.localizedName = "自然物质";
plantMatter.register();

val aqr = mods.contenttweaker.tconstruct.MaterialBuilder.create("aquamarinec");
aqr.color = 0x385CB8;
aqr.craftable = true;
aqr.addItem(<item:contenttweaker:aquamarinec>);
aqr.representativeItem = <item:contenttweaker:aquamarinec>;
aqr.addHeadMaterialStats(599,4.0f,3.2f,3);
aqr.addHandleMaterialStats(0.75,150);
aqr.addExtraMaterialStats(28);
aqr.addMaterialTrait(<ticontrait:lapidary_calibration>,"head");
aqr.addMaterialTrait(<ticontrait:lapidary_calibration>,"extra");
aqr.addMaterialTrait("lightweight","handle");
aqr.addMaterialTrait("aquadynamic","handle");
aqr.itemLocalizer = function(thisMaterial,itemName){return "钴强化海蓝宝石 " + itemName;};
aqr.localizedName = "钴强化海蓝宝石";
aqr.register();

val gild = mods.contenttweaker.tconstruct.MaterialBuilder.create("gildediron");
gild.color = 0xAAAA00;
gild.castable = true;
gild.liquid = <fluid:obsidiangold>;
gild.addItem(<item:contenttweaker:gildediron>);
gild.representativeItem = <item:contenttweaker:gildediron>;
gild.addHeadMaterialStats(198,8.0f,3.4f,2);
gild.addHandleMaterialStats(0.85,80);
gild.addExtraMaterialStats(40);
gild.addMaterialTrait(<ticontrait:soul>,"head");
gild.addMaterialTrait("magnetic1","extra");
gild.addMaterialTrait("magnetic1","handle");
gild.itemLocalizer = function(thisMaterial,itemName){return "黑曜石金 " + itemName;};
gild.localizedName = "黑曜石金";
gild.register();