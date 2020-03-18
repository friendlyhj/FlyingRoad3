#modloaded bathappymod
//test
val ex = <contenttweaker:xu_frame>;
val ed = <extrautils2:machine>.withTag({Type:"extrautils2:generator"}).onlyWithTag({Type:"extrautils2:generator"});


youyihjLib.recipeTweak(true, <thermalexpansion:frame>,[[<ore:ingotIron>|<ore:ingotAluminum>,<enderio:item_basic_capacitor>,<ore:ingotIron>|<ore:ingotAluminum>],[<ore:blockGlass>,<ore:gearTin>,<ore:blockGlass>],[<ore:ingotIron>|<ore:ingotAluminum>,<ore:blockGlass>,<ore:ingotIron>|<ore:ingotAluminum>]]);
youyihjLib.recipeTweak(true, <thermalexpansion:frame:64>,[[<ore:ingotTin>,<minecraft:piston>,<ore:ingotTin>],[<ore:blockGlass>,<ore:gearCopper>,<ore:blockGlass>],[<ore:ingotTin>,<ore:blockGlass>,<ore:ingotTin>]]);
youyihjLib.recipeTweak(true, <thermalexpansion:frame:128>,[[<actuallyadditions:item_crystal>,<enderio:item_basic_capacitor>,<actuallyadditions:item_crystal>],[<ore:blockGlass>,<ore:gearLead>,<ore:blockGlass>],[<actuallyadditions:item_crystal>,<ore:blockGlass>,<actuallyadditions:item_crystal>]]);
youyihjLib.recipeTweak(true, <actuallyadditions:block_misc:9>,[[<ore:ingotIron>,<minecraft:quartz>,<ore:ingotIron>],[<actuallyadditions:item_misc:5>,<thermalexpansion:frame:64>,<actuallyadditions:item_misc:5>],[<ore:ingotIron>,<minecraft:quartz>,<ore:ingotIron>]]);
youyihjLib.recipeTweak(true, <enderio:item_basic_capacitor:1>,[[<actuallyadditions:item_crystal>,<enderio:item_alloy_ingot:1>,<actuallyadditions:item_crystal>],[<enderio:item_basic_capacitor>,<ore:dustCoal>,<enderio:item_basic_capacitor>],[<actuallyadditions:item_crystal>,<enderio:item_alloy_ingot:1>,<actuallyadditions:item_crystal>]]);
youyihjLib.recipeTweak(true, <enderio:item_basic_capacitor:2>,[[<ore:dustGlowstone>,<enderio:item_alloy_ingot:2>,<ore:dustGlowstone>],[<enderio:item_basic_capacitor:1>,<ore:ingotEnderium>,<enderio:item_basic_capacitor:1>],[<ore:dustGlowstone>,<enderio:item_alloy_ingot:2>,<ore:dustGlowstone>]]);

youyihjLib.recipeTweak(true, <enderio:block_cap_bank:1>,[[<ore:ingotIron>,<enderio:item_basic_capacitor>,<ore:ingotIron>],[<enderio:item_basic_capacitor>,<actuallyadditions:block_crystal>,<enderio:item_basic_capacitor>],[<ore:ingotIron>,<enderio:item_basic_capacitor>,<ore:ingotIron>]]);

youyihjLib.recipeTweak(true, <mekanism:energytablet>,[[<actuallyadditions:item_crystal>,<ore:ingotElectrum>,<actuallyadditions:item_crystal>],[<mekanism:enrichedalloy>,<enderio:item_basic_capacitor>,<mekanism:enrichedalloy>],[<actuallyadditions:item_crystal>,<ore:ingotElectrum>,<actuallyadditions:item_crystal>]]);
recipes.remove(<extrautils2:machine>);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:enchanter"}),[[null,<minecraft:enchanted_book>,null],[<ore:ingotPlatinum>,ex,<ore:ingotPlatinum>],[<actuallyadditions:item_crystal_empowered:2>,<minecraft:enchanting_table>,<actuallyadditions:item_crystal_empowered:2>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_survival"}),[[<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>],[<ore:ingotCopper>,<minecraft:piston>,<ore:ingotCopper>],[<ore:stone>,ex,<ore:stone>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator"}),[[<ore:ingotIron>,<ore:ingotIron>,<ore:ingotIron>],[<ore:ingotIron>,<ore:gearIron>,<ore:ingotIron>],[<ore:stone>,ex,<ore:stone>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_lava"}),[[<ore:ingotGold>,<ore:ingotGold>,<ore:ingotGold>],[<ore:ingotGold>,<ore:gearInvar>,<ore:ingotGold>],[<ore:ingotLead>,ex,<ore:ingotLead>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_culinary"}),[[<enderio:item_alloy_ingot>,<enderio:item_alloy_ingot>,<enderio:item_alloy_ingot>],[<enderio:item_alloy_ingot>,<ore:gearSteel>,<enderio:item_alloy_ingot>],[<ore:ingotIron>,ed,<ore:ingotIron>]]);
youyihjLib.recipeTweak(false, <extrautils2:machine>.withTag({Type:"extrautils2:generator_redstone"}),[[<extrautils2:machine>.withTag({Type:"extrautils2:generator_lava"}).onlyWithTag({Type:"extrautils2:generator_lava"}),<minecraft:redstone_block>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_ender"}),[[<minecraft:ender_pearl>,<minecraft:ender_eye>,<minecraft:ender_pearl>],[<minecraft:ender_pearl>,<ore:gearEnderium>,<minecraft:ender_pearl>],[<actuallyadditions:item_crystal:1>,ed,<actuallyadditions:item_crystal:1>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_potion"}),[[<enderio:item_alloy_ingot:6>,<enderio:item_alloy_ingot:6>,<enderio:item_alloy_ingot:6>],[<enderio:item_alloy_ingot:6>,<minecraft:brewing_stand>,<enderio:item_alloy_ingot:6>],[<actuallyadditions:item_crystal:1>,ed,<actuallyadditions:item_crystal:1>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_pink"}),[[<minecraft:wool:6>,<minecraft:wool:6>,<minecraft:wool:6>],[<minecraft:wool:6>,<ore:gearSilver>,<minecraft:wool:6>],[<minecraft:dirt>,<extrautils2:machine>.withTag({Type:"extrautils2:generator_survival"}).onlyWithTag({Type:"extrautils2:generator_survival"}),<minecraft:dirt>]]);
youyihjLib.recipeTweak(false, <extrautils2:machine>.withTag({Type:"extrautils2:generator_overclock"}),[[ed,<ore:gearLumium>,<ore:gearInvar>,<ore:gearElectrum>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_tnt"}),[[<minecraft:tnt>,<minecraft:tnt>,<minecraft:tnt>],[<minecraft:tnt>,<ore:gearBronze>,<minecraft:tnt>],[<ore:obsidian>,ed,<ore:obsidian>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_netherstar"}),[[<ore:ingotUnstable>,<minecraft:nether_star>,<ore:ingotUnstable>],[<ore:ingotUnstable>,<extrautils2:simpledecorative:2>,<ore:ingotUnstable>],[<mekanism:basicblock:2>,<extrautils2:machine>.withTag({Type:"extrautils2:generator_overclock"}).onlyWithTag({Type:"extrautils2:generator_overclock"}),<mekanism:basicblock:2>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_dragonsbreath"}),[[<minecraft:end_rod>,<minecraft:dragon_breath>,<minecraft:end_rod>],[<minecraft:end_rod>,<ore:gearLumium>,<minecraft:end_rod>],[<minecraft:end_stone>,<extrautils2:machine>.withTag({Type:"extrautils2:generator_potion"}).onlyWithTag({Type:"extrautils2:generator_potion"}),<minecraft:end_stone>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_ice"}),[[<thermalfoundation:material:1025>,<minecraft:ice>,<thermalfoundation:material:1025>],[<minecraft:snow>,<ore:gearConstantan>,<minecraft:snow>],[<ore:ingotSilver>,ex,<ore:ingotSilver>]]);
youyihjLib.recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_death"}),[[<minecraft:bone_block>,<ore:itemSkull>,<minecraft:bone_block>],[<minecraft:bone_block>,<ore:gearTin>,<minecraft:bone_block>],[<ore:dustGlowstone>,ed,<ore:dustGlowstone>]]);
youyihjLib.recipeTweak(false, <extrautils2:machine>.withTag({Type:"extrautils2:generator_enchant"}),[[<extrautils2:machine>.withTag({Type:"extrautils2:generator_potion"}).onlyWithTag({Type:"extrautils2:generator_potion"}),<ore:gearPlatinum>,<minecraft:enchanted_book>,<minecraft:enchanted_book>]]);
youyihjLib.recipeTweak(false, <extrautils2:machine>.withTag({Type:"extrautils2:generator_slime"}),[[<extrautils2:machine>.withTag({Type:"extrautils2:generator_ice"}).onlyWithTag({Type:"extrautils2:generator_ice"}),<ore:gearNickel>,<ore:slimeball>,<ore:slimeball>]]);
youyihjLib.recipeTweak(true, ex,[[<ore:ingotInvar>,<extrautils2:ingredients:1>,<ore:ingotInvar>],[<minecraft:quartz>,<thermalexpansion:frame>,<minecraft:quartz>],[<ore:ingotInvar>,<minecraft:quartz>,<ore:ingotInvar>]]);
youyihjLib.recipeTweak(true, <extrautils2:terraformer:9>,[[<ore:ingotTin>,<ore:blockGlowstone>,<ore:ingotTin>],[<ore:treeSapling>,ex,<ore:treeSapling>],[<ore:ingotTin>,<ore:blockGlowstone>,<ore:ingotTin>]]);

youyihjLib.recipeTweak(true, <mekanism:basicblock:8>,[[<ore:ingotSteel>,<ore:ingotInvar>,<ore:ingotSteel>],[<ore:ingotInvar>,<ore:gearOsmium>,<ore:ingotInvar>],[<ore:ingotSteel>,<thermalexpansion:frame>,<ore:ingotSteel>]]);

youyihjLib.recipeTweak(true, <enderio:item_material>,[[<ore:ingotSteel>,<minecraft:iron_bars>,<ore:ingotSteel>],[<minecraft:iron_bars>,<enderio:item_material:20>,<minecraft:iron_bars>],[<ore:ingotSteel>,<ore:gearIron>,<ore:ingotSteel>]]);

youyihjLib.recipeTweak(true, <enderio:block_enchanter>,[[<actuallyadditions:item_crystal_empowered:4>,<minecraft:writable_book>,<actuallyadditions:item_crystal_empowered:4>],[<extrautils2:simpledecorative>,<enderio:block_xp_vacuum>,<extrautils2:simpledecorative>],[null,<enderio:block_dark_steel_anvil:*>,null]]);

youyihjLib.recipeTweak(true, <mekanismgenerators:generator:6>,[[null,<extrautils2:passivegenerator:4>,null],[<mekanism:controlcircuit:1>,<ore:blockAluminum>,<mekanism:controlcircuit:1>],[<actuallyadditions:item_crystal:5>,<enderio:item_material:73>,<actuallyadditions:item_crystal:5>]]);

youyihjLib.recipeTweak(true, <mekanismgenerators:solarpanel>,[[<ore:dustLapis>,<ore:blockGlass>,<ore:dustLapis>],[<ore:itemSilicon>,<mekanism:enrichedalloy>,<ore:itemSilicon>],[<ore:ingotOsmium>,<ore:ingotOsmium>,<ore:ingotOsmium>]]);
recipes.remove(<mekanismgenerators:generator:3>);

youyihjLib.recipeTweak(true, <mekanismgenerators:generator:4>,[[<ore:ingotEnergeticAlloy>,<mekanism:reinforcedalloy>,<ore:ingotEnergeticAlloy>],[<actuallyadditions:item_crystal:4>,<mekanism:basicblock:8>,<actuallyadditions:item_crystal:4>],[<mekanism:ingot:3>,<mekanism:ingot:3>,<mekanism:ingot:3>]]);
youyihjLib.recipeTweak(false, <mekanismgenerators:generator:10>,[[<bigreactors:turbinehousing>,<mekanism:enrichedalloy>]]);
recipes.remove(<mekanismgenerators:generator:11>);
youyihjLib.recipeTweak(false, <mekanismgenerators:generator:11>,[[<bigreactors:turbinefluidport>,<mekanism:enrichedalloy>,<ore:dyeOrange>]]);
recipes.remove(<mekanismgenerators:generator:12>);
youyihjLib.recipeTweak(false, <mekanismgenerators:generator:12>,[[<bigreactors:turbinefluidport>,<mekanism:enrichedalloy>,<ore:dyeBlue>]]);
recipes.remove(<mekanismgenerators:generator:13>);
youyihjLib.recipeTweak(true, <mekanismgenerators:generator:13>,[[<ore:ingotSilver>,<thermalfoundation:material:1025>,<ore:ingotSilver>],[<thermalfoundation:material:1025>,<mekanismgenerators:generator:10>,<thermalfoundation:material:1025>],[<ore:ingotSilver>,<thermalfoundation:material:1025>,<ore:ingotSilver>]]);
youyihjLib.recipeTweak(false, <mekanismgenerators:generator:8>,[[<bigreactors:turbinebearing>,<mekanism:enrichedalloy>]]);
recipes.remove(<mekanismgenerators:reactor:*>);
recipes.remove(<mekanismgenerators:reactorglass:*>);
recipes.remove(<mekanismgenerators:generator>);
youyihjLib.recipeTweak(true,<mekanism:machineblock:8>,[[<ore:ingotInvar>,<minecraft:furnace>,<ore:ingotInvar>],[<minecraft:furnace>,<mekanism:basicblock:8>,<minecraft:furnace>],[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>]]);
youyihjLib.recipeTweak(true,<immersiveengineering:stone_decoration:1> * 3,[[<tconstruct:materials>,<minecraft:brick>,<tconstruct:materials>],[<minecraft:brick>,<minecraft:coal:*>,<minecraft:brick>],[<tconstruct:materials>,<minecraft:brick>,<tconstruct:materials>]]);









