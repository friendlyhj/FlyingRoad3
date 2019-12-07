import crafttweaker.item.IItemStack;
recipes.addShaped(<thermalfoundation:material:1028> * 20,[[<forge:bucketfilled>.withTag({FluidName: "ender", Amount: 1000}).onlyWithTag({FluidName: "ender", Amount: 1000}),<mekanism:basicblock:2>,<forge:bucketfilled>.withTag({FluidName: "cryotheum", Amount: 1000}).onlyWithTag({FluidName: "cryotheum", Amount: 1000})],[<ore:blockIridium>,<minecraft:dragon_egg>,<ore:blockIridium>],[<forge:bucketfilled>.withTag({FluidName: "pyrotheum", Amount: 1000}).onlyWithTag({FluidName: "pyrotheum", Amount: 1000}),<mekanism:basicblock:2>,<forge:bucketfilled>.withTag({FluidName: "petrotheum", Amount: 1000}).onlyWithTag({FluidName: "petrotheum", Amount: 1000})]]);
mods.thermalexpansion.Crucible.addRecipe(<liquid:mana> * 50, <thermalfoundation:material:1028>, 640000);
youyihjLib.recipeTweak(true,<draconicevolution:draconic_core>,[[<plustic:osmiridiumingot>,<mekanism:atomicalloy>,<plustic:osmiridiumingot>],[<extrautils2:ingredients:12>,<thermalfoundation:storage:8>,<extrautils2:ingredients:12>],[<draconicevolution:draconium_ingot>,<draconicevolution:draconium_ingot>,<draconicevolution:draconium_ingot>]]);
youyihjLib.recipeTweak(true,<draconicevolution:wyvern_core>,[[<ore:ingotEndSteel>,<actuallyadditions:item_crystal_empowered:4>,<ore:ingotEndSteel>],[<ore:ingotEnderium>,<extrautils2:simpledecorative:2>,<ore:ingotEnderium>],[<draconicevolution:draconic_core>,<draconicevolution:draconic_core>,<draconicevolution:draconic_core>]]);
youyihjLib.recipeTweak(true,<draconicevolution:wyvern_energy_core>,[[<ore:ingotSoularium>,<actuallyadditions:block_crystal>,<ore:ingotSoularium>],[<enderio:item_basic_capacitor:2>,<draconicevolution:draconic_core>,<enderio:item_basic_capacitor:2>],[<ore:ingotSoularium>,<actuallyadditions:block_crystal>,<ore:ingotSoularium>]]);
youyihjLib.recipeTweak(true,<draconicevolution:grinder>,[[<extrautils2:spike_diamond>,<extrautils2:spike_diamond>,<extrautils2:spike_diamond>],[<draconicevolution:wyvern_core>,<enderio:item_material:54>,<draconicevolution:wyvern_core>],[<thermalfoundation:material:264>,<enderio:item_material:13>,<thermalfoundation:material:264>]]);
youyihjLib.recipeTweak(true,<draconicevolution:particle_generator>,[[<actuallyadditions:block_crystal>,<minecraft:blaze_rod>,<actuallyadditions:block_crystal>],[<minecraft:blaze_rod>,<draconicevolution:draconic_core>,<minecraft:blaze_rod>],[<actuallyadditions:block_crystal>,<minecraft:blaze_rod>,<actuallyadditions:block_crystal>]]);
youyihjLib.recipeTweak(true,<draconicevolution:particle_generator:2>,[[<actuallyadditions:item_crystal_empowered:2>,<mekanism:compresseddiamond>,<actuallyadditions:item_crystal_empowered:2>],[<mekanism:compresseddiamond>,<draconicevolution:particle_generator>,<mekanism:compresseddiamond>],[<actuallyadditions:item_crystal_empowered:2>,<mekanism:compresseddiamond>,<actuallyadditions:item_crystal_empowered:2>]]);
youyihjLib.recipeTweak(true,<draconicevolution:fusion_crafting_core>,[[<actuallyadditions:block_crystal_empowered:1>,null,<actuallyadditions:block_crystal_empowered:1>],[null,<draconicevolution:particle_generator:2>,null],[<draconicevolution:particle_generator:2>,null,<draconicevolution:particle_generator:2>]]);
var dr = [<draconicevolution:wyvern_axe>,
<draconicevolution:wyvern_bow>,
<draconicevolution:wyvern_pick>,
<draconicevolution:wyvern_shovel>,
<draconicevolution:wyvern_sword>,
<draconicevolution:wyvern_helm>,
<draconicevolution:wyvern_chest>,
<draconicevolution:wyvern_legs>,
<draconicevolution:wyvern_boots>] as IItemStack[];
var sa = [<mysticalagriculture:superium_axe:*>,
<mysticalagriculture:superium_bow:*>,
<mysticalagriculture:superium_pickaxe:*>,
<mysticalagriculture:superium_shovel:*>,
<mysticalagriculture:superium_sword:*>,
<mysticalagriculture:supremium_helmet:*>,
<mysticalagriculture:supremium_chestplate:*>,
<mysticalagriculture:supremium_leggings:*>,
<mysticalagriculture:supremium_boots:*>] as IItemStack[];

recipes.remove(<draconicevolution:crafting_injector>);


for i, drone in dr{
	var saone = sa[i];
	youyihjLib.recipeTweak(true, drone,[[<ore:ingotDraconium>,<draconicevolution:wyvern_core>,<ore:ingotDraconium>],[<ore:ingotDraconium>,saone,<ore:ingotDraconium>],[<ore:ingotDraconium>,<draconicevolution:wyvern_energy_core>,<ore:ingotDraconium>]]);
}

mods.thermalexpansion.InductionSmelter.addRecipe(<plustic:osmiridiumingot> * 2, <thermalfoundation:material:135>, <mekanism:ingot:1>, 8000);