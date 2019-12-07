#loader contenttweaker
#ignoreBracketErrors
#priority 233
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.SoundType;
import mods.contenttweaker.SoundEvent;
import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.contenttweaker.tconstruct.TraitDataRepresentation;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.contenttweaker.tconstruct.Material;
import crafttweaker.command.ICommandSender;
import crafttweaker.command.ICommandManager;
import mods.contenttweaker.Hand;
import mods.contenttweaker.ActionResult;

//定义函数
function itemCreator(name as string,maxn as int,glow as bool){
	var itemt = VanillaFactory.createItem(name);
	itemt.maxStackSize = maxn;
	itemt.glowing = glow;
	itemt.register();
}

function fluidCreator(name as string,color as string,temperature as int,viscosity as int,density as int,luminosity as int,isLava as bool){
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

function blockCreator(name as string,blockMaterial as BlockMaterial,hardness as float,resistance as float,blockSoundType as SoundType,lightValue as int,gravity as bool,toolClass as string,toolLevel as int,beaconBase as bool){
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


itemCreator("tiny_coal_coke",64,false);
itemCreator("compressed_sticks",64,false);
blockCreator("xu_frame",<blockmaterial:iron>,3,50,<soundtype:metal>,0,false,"pickaxe",0,false);
blockCreator("compressed_skystone",<blockmaterial:rock>,30,6000,<soundtype:stone>,0,false,"pickaxe",3,false);
blockCreator("compressed_skystone_crushed",<blockmaterial:rock>,30,3000,<soundtype:stone>,0,true,"shovel",3,false);

val urban_legend = mods.contenttweaker.tconstruct.TraitBuilder.create("urban_legend");
urban_legend.color = 0xFFFFFF;
urban_legend.localizedName = (game.localize("contenttweaker.trait.urban_legend.name"));
urban_legend.localizedDescription = ("§o" + game.localize("contenttweaker.trait.urban_legend.description1") + "§r\n§f" + game.localize("contenttweaker.trait.urban_legend.description2"));
urban_legend.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
	if (target.definition.id == "minecraft:enderman"){
		return (originalDamage + target.health);
	} else return newDamage;
};
urban_legend.register();

val w_ender_pearl =  mods.contenttweaker.tconstruct.MaterialBuilder.create("wither_ender_pearl");
w_ender_pearl.color = 0x333333;
w_ender_pearl.craftable = true;
w_ender_pearl.addItem(<item:darkutils:material:1>);
w_ender_pearl.representativeItem = <item:darkutils:material:1>;
w_ender_pearl.addHeadMaterialStats(120,2,3,0);
w_ender_pearl.addHandleMaterialStats(1.4,-30);
w_ender_pearl.addExtraMaterialStats(20);
w_ender_pearl.addMaterialTrait(<ticontrait:urban_legend>,null);
w_ender_pearl.itemLocalizer = function(thisMaterial,itemName){return game.localize("item.darkutils.material.unstable.name") + " " + itemName;};
w_ender_pearl.localizedName = game.localize("item.darkutils.material.unstable.name");
w_ender_pearl.register();

val bat = VanillaFactory.createItem("forestbat");
bat.onItemUse = function(player, world, pos, hand, facing, blockHit) {
	if (!world.remote) {
    	player.getHeldItem(hand).shrink(1);
		<entity:minecraft:bat>.spawnEntity(world, pos.getOffset("up", 1));
		player.sendMessage("新人请说出常用模组");
    	return ActionResult.success();
	}
	return ActionResult.pass();
};
bat.register();