import crafttweaker.command.ICommandSender;
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerRespawnEvent;
import mods.ctutils.world.World;
import mods.ctutils.world.IGameRules;

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