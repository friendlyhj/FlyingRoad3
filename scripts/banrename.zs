import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.command.ICommandSender;
import crafttweaker.player.IPlayer;

<minecraft:wooden_sword>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:wooden_shovel>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:wooden_pickaxe>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:wooden_axe>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:wooden_hoe>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:stone_sword>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:stone_shovel>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:stone_pickaxe>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:stone_axe>.addTooltip("\u00A79已ban，请使用匠魂");
<minecraft:stone_hoe>.addTooltip("\u00A79已ban，请使用匠魂");
<tconstruct:cast_custom:4>.addTooltip("\u00A79已ban，勿念");
<thermalexpansion:augment:337>.addTooltip("\u00A79已ban，勿念");
<actuallyadditions:item_spawner_changer>.addTooltip("\u00A79已ban，勿念");
<extrautils2:teleporter:1>.addTooltip("\u00A79已ban，勿念");

//do you wanna cheat? tan 90°

#ignoreBracketErrors

var n as int = 0;
if (loadedMods in "torcherino"){
	recipes.removeAll();
	for itemm in loadedMods["minecraft"].items {
		itemm.addTooltip("由于你添加加速火把");
		itemm.addTooltip("系统自动删除所有物品的合成");
		itemm.addTooltip("删除加速火把以解决此问题");
	}
	recipes.addShaped(<minecraft:paper>.withTag({display:{Lore:["不是很喜欢加模组的吗","不是很喜欢加速火把吗","把火把插你py里","让你好好加一个速"]}}),[[null,<minecraft:clock>,null],[<minecraft:clock>,<minecraft:torch>,<minecraft:clock>],[null,<minecraft:clock>,null]]);
	n += 1;
}
if (loadedMods in "projecte"){
	recipes.removeAll();
	for itemm in loadedMods["minecraft"].items {
		itemm.addTooltip("由于你添加不等价交换");
		itemm.addTooltip("系统自动删除所有物品的合成");
		itemm.addTooltip("删除不等价交换以解决此问题");
	}
	recipes.addShaped(<minecraft:paper>.withTag({display:{Lore:["禁止不等价交换，人人做起！"]}}),[[<ore:dustRedstone>,<ore:dustGlowstone>,<ore:dustRedstone>],[<ore:dustGlowstone>,<ore:gemDiamond>,<ore:dustGlowstone>],[<ore:dustRedstone>,<ore:dustGlowstone>,<ore:dustRedstone>]]);
	recipes.addShaped(<minecraft:paper>.withTag({display:{Lore:["禁止不等价交换，人人做起！"]}}),[[<ore:dustGlowstone>,<ore:dustRedstone>,<ore:dustGlowstone>],[<ore:dustRedstone>,<ore:gemDiamond>,<ore:dustRedstone>],[<ore:dustGlowstone>,<ore:dustRedstone>,<ore:dustGlowstone>]]);
	n += 1;
}
if (loadedMods in "deconstruction"){
	recipes.removeAll();
	for itemm in loadedMods["minecraft"].items {
		itemm.addTooltip("由于你添加拆解台");
		itemm.addTooltip("系统自动删除所有物品的合成");
		itemm.addTooltip("删除拆解台以解决此问题");
	}
	recipes.addShaped(<minecraft:paper>.withTag({display:{Lore:["禁止拆解刷物品！"]}}),[[<ore:ingotIron>,<ore:gemDiamond>,<ore:ingotIron>],[<ore:plankWood>,<ore:workbench>,<ore:plankWood>],[<ore:plankWood>,<ore:plankWood>,<ore:plankWood>]]);
	n += 1;
}
if (loadedMods in "xijun") {
	recipes.removeAll();
}

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
	if (loadedMods in "torcherino") {
		val ser as ICommandSender = mods.ctutils.commands.Commands.getServerCommandSender();
		val player as IPlayer = event.player;
		player.sendChat("§eforestbat加入了游戏。");
		player.sendChat("<forestbat> 不是很喜欢加模组吗？不是很喜欢加速火把吗？");
		player.sendChat("<forestbat> 把火把插你py里，让你好好加个速。");
		player.health = 0.0f;
		player.sendChat(player.name + "因py被森林蝙蝠插入了加速火把加速过度而死。");
		player.sendChat("§eforestbat退出了游戏。");
		server.commandManager.executeCommand(ser, "/summon draconicevolution:entitychaosenergyvortex " ~ player.x ~ " 128 " ~ player.z);
	}
});

events.onPlayerRespawn(function(event as PlayerRespawnEvent) {
	if (loadedMods in "torcherino") {
		val player as IPlayer = event.player;
		player.health = 0.0f;
		player.sendChat(player.name + "因py被森林蝙蝠插入了加速火把加速过度而死。");
	}
});

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
	if (loadedMods in "xijun") {
		val ser as ICommandSender = mods.ctutils.commands.Commands.getServerCommandSender();
		val player as IPlayer = event.player;
		player.health = 0.0f;
		player.sendChat(player.name ~ "被细菌感染而死。");
		server.commandManager.executeCommand(ser, "/summon draconicevolution:entitychaosenergyvortex " ~ player.x ~ " 128 " ~ player.z);
	}
});

events.onPlayerRespawn(function(event as PlayerRespawnEvent) {
	if (loadedMods in "xijun") {
		val player as IPlayer = event.player;
		player.health = 0.0f;
		player.sendChat(player.name ~ "被细菌感染而死。");
	}
});