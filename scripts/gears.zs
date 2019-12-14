import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;

// ore dictionary
<ore:gearEnergeticAlloy>.add(<enderio:item_material:12>);
<ore:gearVibrantAlloy>.add(<enderio:item_material:13>);
<ore:gearDarkSteel>.add(<enderio:item_material:73>);
<ore:rodAluminum>.add(<immersiveengineering:material:3>);
<ore:rodAluminium>.add(<immersiveengineering:material:3>);
<ore:rodIron>.add(<immersiveengineering:material:1>);
<ore:rodSteel>.add(<immersiveengineering:material:2>);

//function
function isEqualOr(a as int,b as int[]) as bool{
	for j in b{
		if (a == j){
			return true;
		}
	}
	return false;
}

function rodSupplier(ore as IOreDictEntry) as IIngredient {
	var key as string = youyihjLib.getMetalName(ore);
	var snakeKey as string = youyihjLib.toSnakeCase(key);
	if (snakeKey == "platinum"||snakeKey == "signalum"||snakeKey == "lumium"||snakeKey == "enderium"||snakeKey == "mithril"){
		snakeKey ~= "_plustic";
	}
	var rodOre as IOreDictEntry = oreDict.get("rod" ~ key);
	var ticRod as IItemStack = <tconstruct:tool_rod>.withTag({Material : snakeKey});
	if (rodOre.empty) {
		return ticRod;
	} else if (snakeKey.contains("alum") || snakeKey.contains("tin") || snakeKey.contains("gold")) {
		return rodOre;
	} else return ticRod.or(rodOre);
}

val ga as IOreDictEntry = <ore:gearStone>;
for ench in oreDict.entries {
	var key as string = youyihjLib.getMetalNameNew(ench, "gear");
	if (!isNull(key)) {
		var gear as IItemStack = ench.firstItem;
		var ingot as IOreDictEntry = oreDict.get("ingot" ~ key);
		var rod as IIngredient = rodSupplier(ench);
		if (key == "DarkSteel") {
			rod = <tconstruct:tool_rod>.withTag({Material: "dark_steel"});
		}
		var nugget as IIngredient = oreDict.get("nugget" ~ key);
			if (!ingot.empty && ingot.firstItem.definition.owner != "draconicevolution" && ingot.firstItem.definition.owner != "bigreactors") {
				if (!key.contains("Alum")) {
					mods.thermalexpansion.Compactor.removeGearRecipe(ingot.firstItem);
				}
				if (!key.contains("Aluminum")) {
					youyihjLib.recipeTweak(true, gear, [
						[rod,ingot,rod],
						[ingot,ga,ingot],
						[rod,ingot,rod]
					]);
				}
			mods.immersiveengineering.MetalPress.removeRecipe(gear);
			mods.tconstruct.Casting.removeTableRecipe(gear);
			mods.immersiveengineering.MetalPress.addRecipe(gear,ingot,<immersiveengineering:mold:1>,16000,6);
		}
	}
}


recipes.remove(<thermalexpansion:augment:337>);
mods.tconstruct.Casting.removeTableRecipe(<tconstruct:cast_custom:4>);
<enderio:item_material:11>.displayName = "基岩-铁复合齿轮";
//rodremove
var allJAOPCArod = [
<immersiveengineering:material:3>,
<immersiveengineering:material:2>,
<immersiveengineering:material:1>,
<jaopca:item_stickardite>,
<jaopca:item_stickcobalt>,
<jaopca:item_stickcopper>,
<jaopca:item_stickdraconium>,
<jaopca:item_stickgold>,
<jaopca:item_stickiridium>,
<jaopca:item_sticklead>,
<jaopca:item_stickmithril>,
<jaopca:item_sticknickel>,
<jaopca:item_stickosmium>,
<jaopca:item_stickplatinum>,
<jaopca:item_sticksilver>,
<jaopca:item_sticktin>,
<jaopca:item_stickuranium>,
<jaopca:item_stickyellorium>,
<jaopca:item_stickcoal>,
<jaopca:item_stickdiamond>,
<jaopca:item_stickemerald>,
<jaopca:item_sticklapis>,
<jaopca:item_stickquartz>,
<jaopca:item_stickquartzblack>] as IItemStack[];
for i, enchJAOPCArod in allJAOPCArod{
	recipes.remove(enchJAOPCArod);
}

//rodmachineIO
var allrod = [
<immersiveengineering:material:1>,
<tconstruct:tool_rod>.withTag({Material: "copper"}),
<tconstruct:tool_rod>.withTag({Material: "silver"}),
<tconstruct:tool_rod>.withTag({Material: "lead"}),
<tconstruct:tool_rod>.withTag({Material: "nickel"}),
<tconstruct:tool_rod>.withTag({Material: "platinum_plustic"}),
<tconstruct:tool_rod>.withTag({Material: "iridium"}),
<tconstruct:tool_rod>.withTag({Material: "steel"}),
<tconstruct:tool_rod>.withTag({Material: "electrum"}),
<tconstruct:tool_rod>.withTag({Material: "invar"}),
<tconstruct:tool_rod>.withTag({Material: "bronze"}),
<tconstruct:tool_rod>.withTag({Material: "signalum_plustic"}),
<tconstruct:tool_rod>.withTag({Material: "lumium_plustic"}),
<tconstruct:tool_rod>.withTag({Material: "enderium_plustic"}),
<tconstruct:tool_rod>.withTag({Material: "energetic_alloy"}),
<tconstruct:tool_rod>.withTag({Material: "vibrant_alloy"}),
<immersiveengineering:material:3>,
<jaopca:item_stickgold>,
<jaopca:item_sticktin>,
<jaopca:item_stickmithril>,
<tconstruct:tool_rod>.withTag({Material: "dark_steel"}),
<tconstruct:tool_rod>.withTag({Material: "osmium"}),
<tconstruct:tool_rod>.withTag({Material: "constantan"})] as IItemStack[];

var allnugget = [
<minecraft:iron_nugget>,
<mekanism:nugget:5>,
<thermalfoundation:material:194>,
<thermalfoundation:material:195>,
<thermalfoundation:material:197>,
<thermalfoundation:material:198>,
<thermalfoundation:material:199>,
<mekanism:nugget:4>,
<thermalfoundation:material:225>,
<thermalfoundation:material:226>,
<mekanism:nugget:2>,
<thermalfoundation:material:229>,
<thermalfoundation:material:230>,
<thermalfoundation:material:231>,
<enderio:item_alloy_nugget:1>,
<enderio:item_alloy_nugget:2>,
<thermalfoundation:material:196>,
<minecraft:gold_nugget>,
<mekanism:nugget:6>,
<thermalfoundation:material:200>,
<enderio:item_alloy_nugget:6>,
<mekanism:nugget:1>,
<immersiveengineering:metal:26>] as IItemStack[];

for i, enchrod in allrod{
	var enchnugget = allnugget[i];
	if (isEqualOr(i,[6,7,12,13,14,15,16,20,21])){
	mods.thermalexpansion.Compactor.addPressRecipe(enchrod, enchnugget * 5, 3000);
	} else {
	mods.thermalexpansion.Compactor.addPressRecipe(enchrod, enchnugget * 5, 2000);
	}
}	

mods.tconstruct.Casting.addTableRecipe(<immersiveengineering:material:3>,<tconstruct:cast>.withTag({PartType: "tconstruct:tool_rod"}),<liquid:aluminum>, 144, false, 30);
mods.tconstruct.Casting.addTableRecipe(<jaopca:item_stickgold>,<tconstruct:cast>.withTag({PartType: "tconstruct:tool_rod"}),<liquid:gold>, 144, false, 30);
mods.tconstruct.Casting.addTableRecipe(<jaopca:item_sticktin>,<tconstruct:cast>.withTag({PartType: "tconstruct:tool_rod"}),<liquid:tin>, 144, false, 30);
mods.tconstruct.Casting.addTableRecipe(<jaopca:item_stickmithril>,<tconstruct:cast>.withTag({PartType: "tconstruct:tool_rod"}),<liquid:mithril>, 144, false, 30);


//rodmeltremove
mods.tconstruct.Melting.removeRecipe(<liquid:iron>, <tconstruct:tool_rod>.withTag({Material: "iron"}));
mods.tconstruct.Melting.removeRecipe(<liquid:copper>, <tconstruct:tool_rod>.withTag({Material: "copper"}));
mods.tconstruct.Melting.removeRecipe(<liquid:silver>, <tconstruct:tool_rod>.withTag({Material: "silver"}));
mods.tconstruct.Melting.removeRecipe(<liquid:nickel>, <tconstruct:tool_rod>.withTag({Material: "nickel"}));
mods.tconstruct.Melting.removeRecipe(<liquid:platinum>, <tconstruct:tool_rod>.withTag({Material: "platinum_plustic"}));
mods.tconstruct.Melting.removeRecipe(<liquid:iridium>, <tconstruct:tool_rod>.withTag({Material: "iridium"}));
mods.tconstruct.Melting.removeRecipe(<liquid:steel>, <tconstruct:tool_rod>.withTag({Material: "steel"}));
mods.tconstruct.Melting.removeRecipe(<liquid:electrum>, <tconstruct:tool_rod>.withTag({Material: "electrum"}));
mods.tconstruct.Melting.removeRecipe(<liquid:invar>, <tconstruct:tool_rod>.withTag({Material: "invar"}));
mods.tconstruct.Melting.removeRecipe(<liquid:bronze>, <tconstruct:tool_rod>.withTag({Material: "bronze"}));
mods.tconstruct.Melting.removeRecipe(<liquid:signalum>, <tconstruct:tool_rod>.withTag({Material: "signalum_plustic"}));
mods.tconstruct.Melting.removeRecipe(<liquid:lumium>, <tconstruct:tool_rod>.withTag({Material: "lumium_plustic"}));
mods.tconstruct.Melting.removeRecipe(<liquid:enderium>, <tconstruct:tool_rod>.withTag({Material: "enderium_plustic"}));
mods.tconstruct.Melting.removeRecipe(<liquid:energetic_alloy>, <tconstruct:tool_rod>.withTag({Material: "energetic_alloy"}));
mods.tconstruct.Melting.removeRecipe(<liquid:vibrant_alloy>, <tconstruct:tool_rod>.withTag({Material: "vibrant_alloy"}));
mods.tconstruct.Melting.removeRecipe(<liquid:dark_steel>, <tconstruct:tool_rod>.withTag({Material: "dark_steel"}));
mods.tconstruct.Melting.removeRecipe(<liquid:osmium>,<tconstruct:tool_rod>.withTag({Material: "osmium"}));
mods.tconstruct.Melting.removeRecipe(<liquid:constantan>,<tconstruct:tool_rod>.withTag({Material: "constantan"}));

//iemold
val iemold = <immersiveengineering:mold>.definition;
var iepart = [
<thermalfoundation:material:352>,
<minecraft:bedrock>, //placeholder useless iepart[1]
<tconstruct:tool_rod>.withTag({Material: "steel"}),
<immersiveengineering:bullet>,
<immersiveengineering:material:23>] as IIngredient[];


for i in 0 to 5{
	mods.immersiveengineering.Blueprint.removeRecipe(iemold.makeStack(i));
	var iepartinfor = iepart[i];
	if (i != 1){
		mods.tconstruct.Casting.addTableRecipe(iemold.makeStack(i),iepartinfor,<liquid:steel>,1440,true,1200);
	} else {
		recipes.addShaped(iemold.makeStack(i),[[<immersiveengineering:mold:2>,<immersiveengineering:mold>,<immersiveengineering:mold:2>],[<immersiveengineering:mold>,<mekanism:basicblock:2>,<immersiveengineering:mold>],[<immersiveengineering:mold:2>,<immersiveengineering:mold>,<immersiveengineering:mold:2>]]);
	}
}

recipes.addShaped(<immersiveengineering:metal_decoration1:1> * 6,[[<ore:ingotSteel>,<ore:ingotSteel>,<ore:ingotSteel>],[null,<tconstruct:tool_rod>.withTag({Material: "steel"}).onlyWithTag({Material: "steel"}),null],[<tconstruct:tool_rod>.withTag({Material: "steel"}).onlyWithTag({Material: "steel"}),null,<tconstruct:tool_rod>.withTag({Material: "steel"}).onlyWithTag({Material: "steel"})]]);