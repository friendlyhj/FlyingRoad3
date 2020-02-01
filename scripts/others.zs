#modloaded bathappymod
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

//一些乱七八糟的修改
function recipeNine(input as IItemStack,output as IItemStack){
	recipes.addShaped(output,[[input,input,input],[input,input,input],[input,input,input]]);
	recipes.addShapeless(input * 9,[output]);
}
recipes.remove(<extrautils2:teleporter:1>);
recipes.addShaped(<enderio:item_broken_spawner>.withTag({entityId: "minecraft:zombie"}),[[<enderio:block_end_iron_bars>,<mysticalagriculture:chunk:6>,<enderio:block_end_iron_bars>],[<mysticalagriculture:chunk:6>,<mysticalagriculture:ingot_storage:6>,<mysticalagriculture:chunk:6>],[<enderio:block_end_iron_bars>,<mysticalagriculture:chunk:6>,<enderio:block_end_iron_bars>]]);

youyihjLib.recipeTweak(false, <actuallyadditions:item_misc:4> * 3,[[<minecraft:wheat>,<minecraft:wheat>,<minecraft:wheat>,<minecraft:water_bucket>]]);

youyihjLib.recipeTweak(true, <actuallyadditions:item_mining_lens>,[[<mysticalagriculture:gold_essence>,<mysticalagriculture:diamond_essence>,<mysticalagriculture:emerald_essence>],[<mysticalagriculture:black_quartz_essence>,<actuallyadditions:item_color_lens>,<mysticalagriculture:iron_essence>],[<mysticalagriculture:lapis_lazuli_essence>,<mysticalagriculture:coal_essence>,<mysticalagriculture:redstone_essence>]]);
recipes.addShaped(<tconstruct:spaghetti>,[[<actuallyadditions:item_food:15>,<actuallyadditions:item_food:15>,<actuallyadditions:item_food:15>],[<actuallyadditions:item_food:15>,<minecraft:stonebrick:3>,<actuallyadditions:item_food:15>],[<actuallyadditions:item_food:15>,<actuallyadditions:item_food:15>,<actuallyadditions:item_food:15>]]);
recipes.remove(<actuallyadditions:item_spawner_changer>);
youyihjLib.recipeTweak(true, <extrautils2:quarry>,[[<enderio:block_alloy_endergy:6>,<extrautils2:decorativesolid:3>,<enderio:block_alloy_endergy:6>],[<extrautils2:decorativesolid:3>,<extrautils2:snowglobe:1>,<extrautils2:decorativesolid:3>],[<enderio:block_alloy_endergy:6>,<extrautils2:decorativesolid:3>,<enderio:block_alloy_endergy:6>]]);
mods.extrautils2.Resonator.add(<extrautils2:snowglobe:1>,<extrautils2:snowglobe>,9000);
<ore:blockGlassHardened>.remove(<enderio:block_fused_quartz:*>);
recipes.remove(<draconicevolution:energy_storage_core>);
recipes.remove(<draconicevolution:energy_pylon>);
recipes.remove(<minecraft:wooden_pickaxe>);
recipes.remove(<minecraft:stone_pickaxe>);
recipes.remove(<minecraft:wooden_axe>);
recipes.remove(<minecraft:stone_axe>);
recipes.remove(<minecraft:wooden_sword>);
recipes.remove(<minecraft:stone_sword>);
recipes.remove(<minecraft:wooden_shovel>);
recipes.remove(<minecraft:stone_shovel>);
recipes.remove(<minecraft:wooden_hoe>);
recipes.remove(<minecraft:stone_hoe>);
recipes.addShapeless("name_tag", <minecraft:name_tag>,[<actuallyadditions:item_crystal_empowered:5>,<minecraft:paper>,<minecraft:paper>]);
recipes.remove(<thermalfoundation:glass:*>);
recipes.remove(<thermalfoundation:glass_alloy:*>);
recipes.remove(<enderio:item_material:14>);
recipes.addShaped(<enderio:item_material:14>,[[<ore:nuggetPulsatingIron>,<ore:nuggetPulsatingIron>,<ore:nuggetPulsatingIron>],[<ore:nuggetPulsatingIron>,<actuallyadditions:item_crystal:2>,<ore:nuggetPulsatingIron>],[<ore:nuggetPulsatingIron>,<ore:nuggetPulsatingIron>,<ore:nuggetPulsatingIron>]]);
recipes.remove(<enderio:item_material:15>);
recipes.addShaped(<enderio:item_material:15>,[[<enderio:item_alloy_nugget:2>,<enderio:item_alloy_nugget:2>,<enderio:item_alloy_nugget:2>],[<enderio:item_alloy_nugget:2>,<actuallyadditions:item_crystal:4>,<enderio:item_alloy_nugget:2>],[<enderio:item_alloy_nugget:2>,<enderio:item_alloy_nugget:2>,<enderio:item_alloy_nugget:2>]]);
mods.mekanism.crusher.removeRecipe(<appliedenergistics2:material:5>);
mods.immersiveengineering.BlastFurnace.addRecipe(<enderio:item_material:5>,<ore:sand>,100);
furnace.remove(<appliedenergistics2:material:5>);
furnace.remove(<bigreactors:ingotgraphite>,<minecraft:coal:*>);
furnace.addRecipe(<bigreactors:ingotgraphite>,<ore:fuelCoke>,0.18);
recipeNine(<minecraft:stick>,<contenttweaker:compressed_sticks>);
recipes.addShapeless(<contenttweaker:tiny_coal_coke> * 8,[<ore:fuelCoke>]);
recipes.addShaped(<immersiveengineering:material:6>,[[<contenttweaker:tiny_coal_coke>,<contenttweaker:tiny_coal_coke>,<contenttweaker:tiny_coal_coke>],[<contenttweaker:tiny_coal_coke>,null,<contenttweaker:tiny_coal_coke>],[<contenttweaker:tiny_coal_coke>,<contenttweaker:tiny_coal_coke>,<contenttweaker:tiny_coal_coke>]]);
recipes.addShaped(<actuallyadditions:block_tiny_torch> * 4,[[<contenttweaker:tiny_coal_coke>],[<ore:stickWood>]]);
furnace.setFuel(<contenttweaker:tiny_coal_coke>, 400);
recipes.addShapeless(<actuallyadditions:item_misc:5> * 4,[<ore:blockQuartzBlack>]);
mods.actuallyadditions.Empowerer.addRecipe(<contenttweaker:forestbat>,<minecraft:apple>,<minecraft:dye:14>,<minecraft:dye:14>,<minecraft:dye:14>,<minecraft:torch>,150,40);
recipes.remove(<extrautils2:angelring:*>);

recipes.addShapeless("envil_drop",<extrautils2:ingredients:10>,[<darkutils:material>,<minecraft:clay_ball>,<ore:dustCoal>|<ore:dustCharcoal>]);

val sapling = <minecraft:sapling>.definition;

for i in 0 .. 6 {
	if (i != 5) {
        recipes.addShapeless("sapling_transform_" ~ i, sapling.makeStack(i+1),[sapling.makeStack(i),sapling.makeStack(i),sapling.makeStack(i)]);
    } else {
        recipes.addShapeless("spaling_transform_return", sapling.makeStack(0), [sapling.makeStack(i),sapling.makeStack(i),sapling.makeStack(i)]);
    }
} 

//mods.thermalexpansion.RedstoneFurnace.removeRecipe(<appliedenergistics2:material:2>);
//mods.thermalexpansion.RedstoneFurnace.removeRecipe(<appliedenergistics2:material:3>);

youyihjLib.recipeTweak(true, <tinker_io:upg:7>,
[[<ore:obsidian>,<tconstruct:casting:1>,<ore:obsidian>],
[<tconstruct:casting:1>,<tinker_io:upg>,<tconstruct:casting:1>],
[<ore:obsidian>,<tconstruct:casting:1>,<ore:obsidian>]]);

recipes.remove(<extrautils2:spike_wood>);
recipes.remove(<extrautils2:spike_stone>);
recipes.addShaped("spike_wood", <extrautils2:spike_wood> * 4,
[[null,<tconstruct:sword_blade>.withTag({Material: "wood"}),null],
[<tconstruct:sword_blade>.withTag({Material: "wood"}),<ore:plankWood>,<tconstruct:sword_blade>.withTag({Material: "wood"})],
[<ore:plankWood>,<ore:logWood>,<ore:plankWood>]]);
recipes.addShaped("spike_stone", <extrautils2:spike_stone> * 4,
[[null,<tconstruct:sword_blade>.withTag({Material: "stone"}),null],
[<tconstruct:sword_blade>.withTag({Material: "stone"}),<ore:cobblestone>,<tconstruct:sword_blade>.withTag({Material: "stone"})],
[<ore:cobblestone>,<ore:compressed1xCobblestone>,<ore:cobblestone>]]);
youyihjLib.recipeTweak(true, <extrautils2:user>,[
    [<extrautils2:decorativesolid:3>,<ore:ingotSteel>,<extrautils2:decorativesolid:3>],
    [<ore:ingotSteel>,<minecraft:dropper>,<ore:ingotSteel>],
    [<extrautils2:decorativesolid:3>,<minecraft:blaze_rod>,<extrautils2:decorativesolid:3>]
]);
youyihjLib.recipeTweak(false, <tinker_io:solidfuel> * 4,
[[<ore:dustAluminum>,<minecraft:gunpowder>,<ore:dustCoal>|<ore:dustCharcoal>,<ore:dustNiter>,<ore:dustBlaze>]]);

recipes.remove(<rf-capability-adapter:aecapabilityadapter_part>);
youyihjLib.recipeTweak(true, <rf-capability-adapter:aecapabilityadapter>,[
    [<ore:ingotAluminum>,<rf-capability-adapter:aecapabilityadapter_part>,<ore:ingotAluminum>],
    [<rf-capability-adapter:aecapabilityadapter_part>,<appliedenergistics2:part:76>,<rf-capability-adapter:aecapabilityadapter_part>],
    [<ore:ingotAluminum>,<rf-capability-adapter:aecapabilityadapter_part>,<ore:ingotAluminum>]
]);