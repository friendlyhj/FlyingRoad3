#modloaded bathappymod
#ikwid
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;
import crafttweaker.data.IData;
import mods.tconstruct.Casting;
import mods.tconstruct.Alloy;
import mods.tconstruct.Melting;
import mods.tconstruct.Drying;

<contenttweaker:wheat_melt:*>.addTooltip(game.localize("crafttweaker.wheatmelt.description"));
<contenttweaker:blaze_melt:*>.addTooltip(game.localize("crafttweaker.blazemelt.description"));

val allEntries = oreDict.entries;
//var oreName as string[] = ["Iron","Gold","Cobalt","Ardite"];
for enchEntry in allEntries {
    var oreDictName as string = enchEntry.name;
    if (oreDictName.startsWith("piece")){
        var key as string = oreDictName.substring(5);
        var piece as IItemStack = enchEntry.firstItem;
        var ore as IItemStack = oreDict.get("ore" + key).firstItem;
        if (!isNull(ore) && !isNull(piece)) {recipes.addShaped("piece_to_ore_" + key,ore,[[piece,piece],[piece,piece]]);}
    }
}

<ore:itemSoulMixture>.add(<contenttweaker:soul_mixture>);
<ore:ingotNetherEssential>.add(<contenttweaker:nether_ingot>);

recipes.addShaped("plant_matter",<contenttweaker:plant_matter>,
[[null,<ore:treeLeaves>,null],
[<ore:treeLeaves>,<minecraft:apple>,<ore:treeLeaves>],
[null,<ore:treeLeaves>,null]]);

recipes.addShapeless("wheat_melt",<contenttweaker:wheat_melt>,[<minecraft:wheat>,<minecraft:wheat>,<ore:stickWood>,<minecraft:flint>,<ore:gravel>]);

recipes.addShaped("aquamarine",<contenttweaker:aquamarine>,
[[<ore:dustPrismarine>,<ore:gemPrismarine>,<minecraft:clay_ball>],
[<ore:gemPrismarine>,<ore:gemQuartz>,<ore:gemPrismarine>],
[<minecraft:clay_ball>,<ore:gemPrismarine>,<ore:dustPrismarine>]]);

recipes.addShaped("smashment",<contenttweaker:smashment>,
[[null,<ore:gunpowder>,null],
[<ore:gunpowder>,<tconstruct:large_plate>.withTag({Material: "stone"}),<ore:gunpowder>],
[null,<ore:gunpowder>,null]]);

recipes.addShaped("gunpowder_bone",<contenttweaker:gunpower_in_bone>,
[[null,<ore:gunpowder>,null],
[<ore:gunpowder>,<ore:bone>,<ore:gunpowder>],
[null,<ore:gunpowder>,null]]);

recipes.addShapeless("blaze_melt",<contenttweaker:blaze_melt>,[<minecraft:blaze_rod>,<minecraft:blaze_rod>,<minecraft:iron_ingot>,<minecraft:flint>,<ore:netherrack>]);

val pan as IItemStack = <tconstruct:pan_head>.withTag({Material: "plant_matter"});
recipes.addShaped("orement",<contenttweaker:orement>,
[[pan,<minecraft:clay>,pan],
[<minecraft:clay>,<minecraft:clay>,<minecraft:clay>],
[pan,<minecraft:clay>,pan]]);

recipes.addShapeless("soul_mixture",<contenttweaker:soul_mixture> * 2,[<minecraft:rotten_flesh>,<minecraft:rotten_flesh>,<minecraft:dye:15>,<minecraft:dye:15>,<minecraft:dye:15>,<minecraft:gunpowder>]);

Casting.addTableRecipe(<contenttweaker:aquamarinec>,<contenttweaker:aquamarine>,<liquid:cobalt>,144,true,1975);
Casting.addTableRecipe(<minecraft:slime_ball>,<minecraft:magma_cream>,<liquid:water>,2500,true,100);
mods.mekanism.GasConversion.register(<contenttweaker:soul_mixture>, <gas:soul> * 200);
mods.mekanism.chemical.injection.addRecipe(<minecraft:sand>, <gas:soul>, <minecraft:soul_sand>);
Melting.addRecipe(<liquid:soulsand> * 80,<minecraft:soul_sand>, 320);
Alloy.addRecipe(<liquid:nether_essential> * 120,[<liquid:iron> * 32, <liquid:soulsand> * 40, <liquid:blood> * 80]);
Casting.addTableRecipe(<minecraft:blaze_rod>,<tconstruct:cast>.withTag({PartType: "tconstruct:tough_tool_rod"}),<liquid:nether_essential>, 960, false, 200);
Casting.addBasinRecipe(<minecraft:netherrack>,<ore:cobblestone>,<liquid:nether_essential>, 60, true, 20);
Casting.addTableRecipe(<minecraft:ghast_tear>,<ore:enderpearl>,<liquid:nether_essential>, 6000, true, 1000);
Casting.addTableRecipe(<minecraft:nether_wart>,<minecraft:pumpkin_seeds>,<liquid:nether_essential>, 3600, true, 860);
Casting.addTableRecipe(<contenttweaker:clay_sapling>,<ore:treeSapling>,<liquid:clay>, 1440, true, 2880);
Drying.addRecipe(<tconstruct:slime_sapling>,<contenttweaker:clay_sapling>, 12000);
Casting.addBasinRecipe(<tconstruct:slime_dirt>,<minecraft:dirt>,<liquid:water>, 8000, true, 800);
Casting.addTableRecipe(<tconstruct:slime_sapling:1>,<tconstruct:slime_sapling>,<liquid:gold>, 1440, true, 1200);
Casting.addTableRecipe(<tconstruct:slime_sapling:2>,<tconstruct:slime_sapling>,<liquid:nether_essential>, 6000, true, 1200);
Casting.addTableRecipe(<contenttweaker:quartz_shard>,<tconstruct:cast>.withTag({PartType: "tconstruct:shard"}),<liquid:glass>, 2000, false, 60);
Melting.addRecipe(<liquid:obsidiangold> * 144,<contenttweaker:gildediron>,500);
Alloy.addRecipe(<liquid:obsidiangold> * 1,[<liquid:gold> * 1, <liquid:obsidian> * 2]);
Casting.addTableRecipe(<contenttweaker:gildediron>,<tconstruct:cast_custom>,<liquid:obsidiangold>, 144, false, 40);
Casting.addBasinRecipe(<appliedenergistics2:sky_stone_block>,<appliedenergistics2:material:45>,<liquid:lava>, 2000, true, 80);
Casting.addBasinRecipe(<minecraft:end_stone>,<ore:cobblestone>,<liquid:ender>, 125, true, 40);
Casting.addBasinRecipe(<minecraft:soul_sand>,null,<liquid:soulsand>, 80, false, 20);
Casting.addTableRecipe(<contenttweaker:nether_ingot>,<tconstruct:cast_custom>,<liquid:nether_essential>, 60, false, 40);
Melting.addRecipe(<liquid:nether_essential> * 60,<contenttweaker:nether_ingot>,480);
Casting.addBasinRecipe(<minecraft:sponge:1>, <minecraft:hay_block>, <liquid:water>, 12000, true, 200);

recipes.addShapeless("black_quartz",<actuallyadditions:item_misc:5>,[<minecraft:quartz>,<ore:dustCoal>]);
recipes.addShapeless("black_quartz1",<actuallyadditions:item_misc:5>,[<minecraft:quartz>,<ore:dustCharcoal>]);

<entity:minecraft:skeleton>.addPlayerOnlyDrop(<minecraft:skull:1>.weight(0.015));
<entity:minecraft:zombie>.removeDrop(<minecraft:iron_ingot>);
<entity:minecraft:witch>.removeDrop(<minecraft:redstone>);
<entity:minecraft:witch>.removeDrop(<minecraft:glowstone_dust>);

val allTicTools as IItemStack[] = [
    <plustic:katana>,
    <plustic:laser_gun>,
    <tconstruct:arrow>,
    <tconstruct:battlesign>,
    <tconstruct:bolt>,
    <tconstruct:broadsword>,
    <tconstruct:cleaver>,
    <tconstruct:crossbow>,
    <tconstruct:excavator>,
    <tconstruct:frypan>,
    <tconstruct:hammer>,
    <tconstruct:hatchet>,
    <tconstruct:kama>,
    <tconstruct:longbow>,
    <tconstruct:longsword>,
    <tconstruct:lumberaxe>,
    <tconstruct:mattock>,
    <tconstruct:pickaxe>,
    <tconstruct:rapier>,
    <tconstruct:scythe>,
    <tconstruct:shortbow>,
    <tconstruct:shovel>,
    <tconstruct:shuriken>
];

for enchTicTool in allTicTools {
    recipes.addHiddenShapeless(enchTicTool.definition.name ~ "_infinity_three", enchTicTool.withTag({Unbreakable : 1, display: {Lore: ["§d无限 III"]}}), 
    [<mekanism:basicblock:2>,<mekanism:basicblock:2>,<mekanism:basicblock:2>,
    <minecraft:nether_star>,enchTicTool.marked("t"),<minecraft:nether_star>,
    <mekanism:basicblock:2>,<mekanism:basicblock:2>,<mekanism:basicblock:2>],
    function (out, input, info) {
        val data as IData = input.t.tag;
        val modifiers as string[] = data.Modifiers.asString().split("\\{");
        for modifier in modifiers {
            if (modifier.contains("infinity") && modifier.contains("current: 18")) {
                return input.t.withTag(data + {Unbreakable : 1, display: {Lore: ["§d无限 III"]}});
            }
        }
        return null;
    },
    null);
}

recipes.addShaped("show_infinity_three",<minecraft:barrier>.withTag({display: {Name: "无法破坏 匠魂工具"}}),
[[<mekanism:basicblock:2>,<mekanism:basicblock:2>,<mekanism:basicblock:2>],
[<minecraft:nether_star>,<minecraft:barrier>.withTag({display: {Name: "任意18/18无限II匠魂工具"}}),<minecraft:nether_star>],
[<mekanism:basicblock:2>,<mekanism:basicblock:2>,<mekanism:basicblock:2>]],
function (out, input, info){
    return null;
}, null);

mods.actuallyadditions.AtomicReconstructor.addRecipe(<minecraft:coal>, <minecraft:coal:1>, 1000);

mods.thermalexpansion.Crucible.addRecipe(<liquid:nether_essential> * 60, <contenttweaker:nether_ingot>, 4000);