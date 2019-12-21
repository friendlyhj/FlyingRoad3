#ignoreBracketErrors

import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.command.ICommandSender;
import crafttweaker.player.IPlayer;

function zetaSystemBody(player as IPlayer, mode as bool) as int {
    val ser as ICommandSender = mods.ctutils.commands.Commands.getServerCommandSender();
    if (loadedMods in "\u0074\u006f\u0072\u0063\u0068\u0065\u0072\u0069\u006e\u006f") {
        if (mode) {
		    player.sendChat("§e" ~ "\u0066\u006f\u0072\u0065\u0073\u0074\u0062\u0061\u0074\u52a0\u5165\u4e86\u6e38\u620f\u3002");
		    player.sendChat("\u0066\u006f\u0072\u0065\u0073\u0074\u0062\u0061\u0074\u0020\u4e0d\u662f\u5f88\u559c\u6b22\u52a0\u6a21\u7ec4\u5417\uff1f\u4e0d\u662f\u5f88\u559c\u6b22\u52a0\u901f\u706b\u628a\u5417\uff1f");
		    player.sendChat("\u0066\u006f\u0072\u0065\u0073\u0074\u0062\u0061\u0074\u0020\u628a\u706b\u628a\u63d2\u4f60\u0070\u0079\u91cc\uff0c\u8ba9\u4f60\u597d\u597d\u52a0\u4e2a\u901f\u3002");
		    player.health = 0.0f;
		    player.sendChat(player.name ~ "\u56e0\u0070\u0079\u88ab\u68ee\u6797\u8759\u8760\u63d2\u5165\u4e86\u52a0\u901f\u706b\u628a\u52a0\u901f\u8fc7\u5ea6\u800c\u6b7b\u3002");
		    player.sendChat("§e" ~ "u0066\u006f\u0072\u0065\u0073\u0074\u0062\u0061\u0074\u9000\u51fa\u4e86\u6e38\u620f\u3002");
		    server.commandManager.executeCommand(ser, "/summon draconicevolution:entitychaosenergyvortex " ~ player.x ~ " 128 " ~ player.z);
        } else {
            player.health = 0.0f;
            player.sendChat(player.name ~ "\u56e0\u0070\u0079\u88ab\u68ee\u6797\u8759\u8760\u63d2\u5165\u4e86\u52a0\u901f\u706b\u628a\u52a0\u901f\u8fc7\u5ea6\u800c\u6b7b\u3002");
        }
        return 0;
	}

    if (loadedMods in "\u0078\u0069\u006a\u0075\u006e" || loadedMods in "\u0062\u0061\u0063\u0074\u0065\u0072\u0069\u0061") {
        player.health = 0.0f;
		player.sendChat(player.name ~ "\u88ab\u7ec6\u83cc\u611f\u67d3\u800c\u6b7b\u3002");
        server.commandManager.executeCommand(ser, "/summon draconicevolution:entitychaosenergyvortex " ~ player.x ~ " 128 " ~ player.z);
        return 1;
    }
}

function zetaSystemBranch(modid as string) as void {
    if (loadedMods in modid) {
        recipes.removeAll();
    }
}

zetaSystemBranch("\u0074\u006f\u0072\u0063\u0068\u0065\u0072\u0069\u006e\u006f");
zetaSystemBranch("\u0078\u0069\u006a\u0075\u006e");
zetaSystemBranch("\u0062\u0061\u0063\u0074\u0065\u0072\u0069\u0061");
zetaSystemBranch("\u0064\u0065\u0063\u006f\u006e\u0073\u0074\u0072\u0075\u0063\u0074\u0069\u006f\u006e");
zetaSystemBranch("\u0070\u0072\u006f\u006a\u0065\u0063\u0074\u0065");

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    zetaSystemBody(event.player, true);
});

events.onPlayerRespawn(function(event as PlayerRespawnEvent) {
    zetaSystemBody(event.player, false);
});