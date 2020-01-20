import crafttweaker.command.ICommandSender;
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerRespawnEvent;
import mods.ctutils.world.World;
import mods.ctutils.world.IGameRules;
import crafttweaker.player.IPlayer;
import mods.ctutils.player.Player;
import crafttweaker.event.PlayerTickEvent;


// 进存档自动开启死亡不掉落和关闭防爆
events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    val ser as ICommandSender = mods.ctutils.commands.Commands.getServerCommandSender();
    val rules as IGameRules = World.getGameRules(event.player.world);
    if (!rules.getBoolean("keepInventory")) {
        server.commandManager.executeCommand(ser, "/gamerule keepInventory true");
        event.player.sendMessage("已自动开启死亡不掉落。");
    }
    if (!rules.getBoolean("mobGriefing")) {
        server.commandManager.executeCommand(ser, "/gamerule mobGriefing true");
    }
});

// 玩家NBT继承器
static storageData as IData[string] = {};
events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    if (!player.world.remote && !Player.isFake(player)) {
        storageData[player.id] = player.data;
    }
});

events.onPlayerRespawn(function(event as PlayerRespawnEvent) {
    val player as IPlayer = event.player;
    if (!player.world.remote && !isNull(storageData[player.id])) {
        player.update(storageData[player.id]);
    }
});