#loader contenttweaker
#ignoreBracketErrors
#modloaded bathappymod
#priority 233
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.SoundType;
import mods.contenttweaker.SoundEvent;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.Part;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.RegisterMaterialPart;
import mods.contenttweaker.PartDataPiece;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.ActionResult;
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.ctutils.utils.Math;
import mods.ctutils.player.Player;
import mods.contenttweaker.MutableItemStack;
import mods.contenttweaker.Hand;
import crafttweaker.data.IData;

val tab = mods.contenttweaker.VanillaFactory.createCreativeTab("tinkers_skyisland", <item:tconstruct:wooden_hopper>);
tab.register();

//定义函数
function ItemBuilder(name as string,maxn as int,glow as bool){
    print("Adding Item : " + name);
    var itemt = VanillaFactory.createItem(name);
    itemt.maxStackSize = maxn;
    itemt.glowing = glow;
    itemt.creativeTab = <creativetab:tinkers_skyisland>;
    itemt.register();
}

function FluidBuilder(name as string,color as string,temperature as int,viscosity as int,density as int,luminosity as int,isLava as bool){
    print("Adding Fluid : " + name);
    var fluidt = VanillaFactory.createFluid(name,Color.fromHex(color));
    fluidt.temperature = temperature; //default 300
    fluidt.viscosity = viscosity; //default 1000
    fluidt.density = density; //default 1000
    fluidt.luminosity = luminosity; //default 0
    if (isLava) {
    fluidt.material = <blockmaterial:lava>;
    fluidt.stillLocation = "base:fluids/molten";
    fluidt.flowingLocation = "base:fluids/molten_flowing";
    } else {
    fluidt.material = <blockmaterial:water>;
    fluidt.stillLocation = "base:fluids/liquid";
    fluidt.flowingLocation = "base:fluids/liquid_flow";
    }
    fluidt.register();
}

function BlockBuilder(name as string,blockMaterial as BlockMaterial,hardness as float,resistance as float,blockSoundType as SoundType,lightValue as int,gravity as bool,toolClass as string,toolLevel as int,beaconBase as bool){
    print("Adding Block : " + name);
    var blockt = VanillaFactory.createBlock(name,blockMaterial);
    blockt.setBlockHardness(hardness);
    blockt.setBlockResistance(resistance);
    blockt.setBlockSoundType(blockSoundType);
    blockt.setLightValue(lightValue);
    blockt.gravity = gravity;
    blockt.setToolClass(toolClass);
    blockt.setToolLevel(toolLevel);
    blockt.beaconBase = beaconBase;
    blockt.register();
}
//函数用法：
//newItem(物品ID,最大堆叠数,是否有附魔光芒);
//newFluid(流体ID,颜色,温度,粘度,密度,亮度,是否为岩浆);
//newBlock(方块ID,方块材质,硬度,抗爆等级,放置方块声音,亮度,是否受重力影响,破坏该方块所需工具,所需挖掘等级,是否可作为信标底座);

ItemBuilder("plant_matter",64,false);
ItemBuilder("gunpower_in_bone",64,false);
ItemBuilder("aquamarine",64,false);
ItemBuilder("aquamarinec",64,true);
ItemBuilder("smashment",64,false);
ItemBuilder("orement",64,false);
ItemBuilder("gildediron",64,false);
ItemBuilder("soul_mixture",64,false);
ItemBuilder("clay_sapling",64,false);
ItemBuilder("nether_ingot",64,false);
FluidBuilder("nether_essential", "FF3366",1500,1000,6000,15,true);
FluidBuilder("soulsand", "3D280F",300,3000,1500,0,false);
FluidBuilder("obsidiangold", "AAAA00",1500,1000,3000,14,true);


val melt = VanillaFactory.createItem("wheat_melt");
melt.maxStackSize = 1;
melt.maxDamage = 50;
melt.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    var isTruePlayer as bool = false;
    if (world.remote) {
        return ActionResult.success();
    }
    if (world.getBlockState(pos) == <block:minecraft:cobblestone>) {
        if (!Player.isFake(player)) { // 与events.zs的tick计时器配合，防止连点，仅检测真玩家
            isTruePlayer = true;
            var process as int = player.data.meltToolProcess.asInt();
            if (process % 4 != 0) {
                return ActionResult.pass(); // 下次点击时间小于4 ticks，跳出事件
            } else {
                process += 1;
                player.update(player.data + {meltToolProcess : process as int});
            }
        }
        var damage as int = player.getHeldItem(hand).damage;
        if (damage == 50) {
            world.setBlockState(<block:minecraft:lava>, pos);
            val posU = pos.getOffset("down", 1);
            val blockStateU = world.getBlockState(posU);
            // world.setBlockState(<block:minecraft:air>, posU);
            // world.setBlockState(blockStateU, posU); // 强制方块更新
            // 清除TileEntity的数据警告！
        }
        player.getHeldItem(hand).damage(1, player);
        if (isTruePlayer) {
            player.update(player.data + {meltToolProcess : 0 as int});
        }
        return ActionResult.success();
    }
    return ActionResult.pass();
};
melt.register();

val quartz = VanillaFactory.createItem("quartz_shard");
quartz.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (world.getBlockState(pos) == <block:minecraft:netherrack>) {
        if (!world.remote) {
            world.setBlockState(<block:minecraft:quartz_ore>, pos);
            player.getHeldItem(hand).shrink(1);
        }
        return ActionResult.success();
    }
    return ActionResult.pass();
};
quartz.register();

val meltad = VanillaFactory.createItem("blaze_melt");
meltad.maxStackSize = 1;
meltad.maxDamage = 1200;
meltad.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    var isTruePlayer as bool = false;
    if (world.remote) {
        return ActionResult.success();
    }
    if (world.getBlockState(pos) == <block:minecraft:cobblestone>) {
        if (!Player.isFake(player)) { // 与events.zs的tick计时器配合，防止连点，仅检测真玩家
            isTruePlayer = true;
            var process as int = player.data.meltToolProcess.asInt();
            if (process % 4 != 0) {
                return ActionResult.pass(); // 下次点击时间小于4 ticks，跳出事件
            } else {
                process += 1;
                player.update(player.data + {meltToolProcess : process as int});
            }
        }
        var damage as int = player.getHeldItem(hand).damage;
        if (damage != 0 && damage % 10 == 0) {
            world.setBlockState(<block:minecraft:lava>, pos);
            val posU = pos.getOffset("down", 1);
            val blockStateU = world.getBlockState(posU);
            // world.setBlockState(<block:minecraft:air>, posU);
            // world.setBlockState(blockStateU, posU); // 强制方块更新
            // 清除TileEntity的数据警告！
        }
        player.getHeldItem(hand).damage(1, player);
        if (isTruePlayer) {
            player.update(player.data + {meltToolProcess : 0 as int});
        }
        return ActionResult.success();
    }
    return ActionResult.pass();
};
meltad.register();

val grass = VanillaFactory.createItem("grass_seed");
grass.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (world.getBlockState(pos) == <block:minecraft:dirt>) {
        if (!world.remote) {
            world.setBlockState(<block:minecraft:grass>, pos);
            player.getHeldItem(hand).shrink(1);
        }
        return ActionResult.success();
    }
    return ActionResult.pass();
};
grass.register();


/* var soulwand = VanillaFactory.createItem("soulwand");
soulwand.maxStackSize = 1;
soulwand.maxDamage = 1458;
 soulwand.itemRightClick = function(stack, world, player, hand){
    var result as IRayTraceResult = player.getRayTrace(5.0, 5.0f, true, true, true);
    var entity as IEntity = null;
    if !isNull(result) {
        entity = result.entity;
        //if !result.isMiss {player.sendChat("Not Miss!");}
    } else {
        player.sendChat("Null!");
    }
     if (!isNull(entity) && entity.alive) {
        entity.setDead();
        var seed as double = Math.random();
        var am as int = 1;
        if seed >= 0.75 {am = 4;}
        else if seed >= 0.50 {am = 3;}
        else if seed >= 0.25 {am = 2;}
        am = min(am, 1458 - stack.damage);
        if (am != 0){
            stack.damage(am, player);
            world.spawnEntity((<item:minecraft:soul_sand> * am).createEntityItem(world, Math.floor(entity.x), Math.floor(entity.y), Math.floor(entity.z)));
            return "Success";
        }
    } else {
        player.sendChat("Null Entity!");
    }
    return "Pass";
}; 
soulwand.register(); */


function materialBuilder(name as string,color as int) as Material{
    return MaterialSystem.getMaterialBuilder().setName(name).setColor(color).build();
}
static builder as PartBuilder = mods.contenttweaker.MaterialSystem.getPartBuilder();
static piece as Part = builder.setName("piece").setPartType(MaterialSystem.getPartType("item")).setOreDictName("piece").build();
static materialList as Material[string] = {};

for key,value in scripts.tinkers_skyisland.config.oreList{
    materialList[key] = materialBuilder(key,value[0]);
}

piece.registerToMaterials(materialList.values);


