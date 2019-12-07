#loader crafttweaker
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerTickEvent;
import mods.ctutils.player.Player;
import crafttweaker.event.PlayerRespawnEvent;

/* events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
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
 */
events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    if (!player.world.remote && !Player.isFake(player)) {
        val playerData as IData = player.data;
        if (!(playerData in "meltToolProcess")) {
            print("meltToolProcess tag is not found! Adding a tag with value 0.");
            player.update(playerData + {meltToolProcess : 0 as int});
            print("Added.");
        } else {
            var process as int = playerData.meltToolProcess.asInt();
            if (process % 4 != 0) {
                player.update(playerData + {meltToolProcess : (playerData.meltToolProcess.asInt() + 1 ) as int});
            }
        }
    }
});
