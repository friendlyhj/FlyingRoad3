import mods.ctutils.world.IGameRules;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.ctutils.world.World;
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import mods.ctutils.player.Player;
import crafttweaker.world.IWorld;

// 添加GameRule 和 需要的玩家NBT
events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    val rules as IGameRules = World.getGameRules(event.player.world);
    if (!rules.hasRule("amountSeedsCouldCraft")) {
        rules.addGameRule("amountSeedsCouldCraft", "12", "Numeric");
    }
    event.player.update({kindsSeedCrafted : 0 as int, listSeedCrafted : "" as string} + event.player.data);
});

// 合成修改
var n as int = 0;
for recipe in recipes.all {
    if (!isNull(recipe.output) && recipe.output.definition.owner.contains("mystical") && !recipe.name.contains("craft") && recipe.name.contains("seeds")) {
        print(recipe.name);
        recipes.remove(recipe.output);
        recipes.addShaped("seed_" ~ n, recipe.output, recipe.ingredients2D,
        function(out, ins, info) {
            val player as IPlayer = info.player;
            val world as IWorld = isNull(player) ? IWorld.getFromID(0) : player.world;
            val amount as int = World.getGameRules(world).getInt("amountSeedsCouldCraft");
            if (amount == 0) {
                return out;
            }
            if (isNull(player) || Player.isFake(player)) {
                return null;
            }
            val seedType as string = out.definition.id.split(":")[1];
            val kinds as int = player.data.kindsSeedCrafted.asInt();
            val list as string = player.data.listSeedCrafted.asString();
            if (list.contains(seedType)) {
                return out;
            } else {
                if (kinds >= amount) {
                    return <item:minecraft:stone>.withLore(["你已经合成的神秘农业的种子已达到限定范围", "不可以再次合成新的了。"]);
                } else {
                    return out;
                }
            }
        },
        function(out, info, player){
            val world as IWorld = isNull(player) ? IWorld.getFromID(0) : player.world;
            val amount as int = World.getGameRules(world).getInt("amountSeedsCouldCraft");
            if (!isNull(player) && !world.remote && !Player.isFake(player) && amount != 0) {
                val seedType as string = out.definition.id.split(":")[1];
                var kinds as int = player.data.kindsSeedCrafted.asInt();
                var list as string = player.data.listSeedCrafted.asString();
                if (!list.contains(seedType)) {
                    kinds += 1;
                    if (list.length > 1) {
                        list ~= "_and_";
                        list ~= seedType;
                    } else {
                        list = seedType;
                    }
                    player.update(player.data + {kindsSeedCrafted : kinds as int, listSeedCrafted : list as string});
                    player.sendMessage("你已经合成了" ~ kinds ~ "种种子。");
                    player.sendMessage("你还能合成" ~ (amount - kinds) ~ "种种子。");
                }
            }
        });
        n += 1;
    }
}
