#loader crafttweaker
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerTickEvent;
import mods.ctutils.player.Player;
import crafttweaker.event.PlayerRespawnEvent;

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    val player as IPlayer = event.player;
    if (!player.world.remote && !Player.isFake(player) && player.alive) {
        player.update({meltToolProcess : 0 as int} + player.data);
    }
});

events.onPlayerRespawn(function(event as PlayerRespawnEvent) {
    val player as IPlayer = event.player;
    if (!player.world.remote && !Player.isFake(player) && player.alive) {
        player.update({meltToolProcess : 0 as int} + player.data);
    }
});

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    if (!player.world.remote && !Player.isFake(player) && player.alive) {
        val processData as IData = player.data.meltToolProcess;
        var process as int = 0;
        if (!isNull(processData)) {
            process = processData.asInt();
        } else {
            process = 1;
        }
        if (process % 4 != 0) {
            player.update(player.data + {meltToolProcess : (process + 1) as int});
        }
    }
});