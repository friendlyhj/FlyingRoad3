/*
    Author: youyihj
    License: CC BY-NC-SA 4.0
*/

#priority 32767
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemCondition;
import crafttweaker.data.IData;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockDefinition;

zenClass youyihjLib {
	zenConstructor() {
		this.tweakRecipeAmount = 0;
	}

	var tweakRecipeAmount as int = 0;
	//获取物品ID 原版石头 minecraft:stone
	function getItemName(input as IItemStack) as string {
		val id as string = input.definition.id;
		val meta as int = input.metadata;
		if (meta == 0){
			return id;
		} else return (id + meta);
	}
	//获取物品ID 只是冒号由下划线取代 原版石头 minecraft_stone
	function getItemNameWithUnderline(input as IItemStack) as string {
		var mod as string = input.definition.owner;
		var id as string = input.definition.id.split(":")[1];
		var meta as int = input.metadata;
		if (meta == 0){
			return (mod + "_" + id);
		} else return (mod + "_" + id + "_" + meta);
	}
	
	//修改合成，先删后加，第一个参数true表有序，false无序，需要二维数组（即使是无序）
	function recipeTweak(isShaped as bool,out as IItemStack,input as IIngredient[][]) as int {
		var recipeName as string = this.getItemNameWithUnderline(out);
		if (out.hasTag) {
			recipeName ~= ("_withtag_" ~ this.tweakRecipeAmount);
		}
		recipes.remove(out.withAmount(1),true);
		if (isShaped) {
			recipes.addShaped(recipeName,out,input);
		} else {
			recipes.addShapeless(recipeName,out,input[0]);
		}
		this.tweakRecipeAmount += 1;
		return this.tweakRecipeAmount;
	}	
	function createSurround(core as IIngredient,surrounded as IIngredient) as IIngredient[][] {
		return [[surrounded,surrounded,surrounded],
		[surrounded,core,surrounded],
		[surrounded,surrounded,surrounded]];
	}
	
	function createFull3(input as IIngredient) as IIngredient[][] {
		return [[input,input,input],
		[input,input,input],
		[input,input,input]];
	}
	
	function createFull2(input as IIngredient) as IIngredient[][] {
		return [[input,input],[input,input]];
	}

	function createCross(five as IIngredient, four as IIngredient) as IIngredient[][] {
		return [[five, four, five],
		[four, five, four],
		[five, four, five]];
	}
	
	//删除工作台与熔炉合成，并在JEI内隐藏
	function removeAllRecipe(input as IItemStack) as bool {
		recipes.remove(input);
		furnace.remove(input);
		furnace.setFuel(input, 0);
		mods.jei.JEI.removeAndHide(input);
		return true;
	}
	//数组复数删除
	function removeAllRecipes(input as IItemStack[]) as bool {
		for item in input {
			this.removeAllRecipe(item);
		}
		return true;
	}
	//IItemStack => youyihjItemStack;
	function getItem(stack as IItemStack) as scripts.classes.youyihjItemStack.youyihjItemStack {
		return scripts.classes.youyihjItemStack.youyihjItemStack(stack);
	}

	//从矿辞中提取金属名
	function getMetalName(arg as IOreDictEntry) as string {
		var input as string = arg.name;
		var temp as string = "";
		var i as int = input.length - 1;
		while (i >= 0) {
			temp = input[i] ~ temp;
			if (input[i].toUpperCase() == input[i] && temp != "Alloy") {
				return temp;
			}
			i -= 1;
		}
		return "Invalid";
	}

	function getMetalNameNew(ore as IOreDictEntry, partName as string) as string {
		var name as string = ore.name;
		if (name.length > 0 && partName.length > 0) {
			if (name.contains(partName)) {
				return name.substring(partName.length);
			}
		}
		return null;
	}

	function toLowerCamelCase(arg as string) as string {
        if (arg.contains("_")) { //snake case
            var splitResult as string[] = arg.split("_");
            var temp as string = "";
            for i, j in splitResult {
                if (i == 0) {
                    temp ~= j;
                } else if (i >= 1) {
                    temp ~= (j[0].toUpperCase() ~ j.substring(1)); 
                }
            }
            return temp;
        } else if (arg[0].toLowerCase() != arg[0]) { //upper camel case
            return arg[0].toLowerCase() ~ arg.substring(1);
        } else return arg; //lower camel case or invalid case
    }

    function toUpperCamelCase(arg as string) as string {
        if (arg.contains("_")) { //snake case
            var splitResult as string[] = arg.split("_");
            var temp as string = "";
            for i, j in splitResult {
                temp ~= (j[0].toUpperCase() ~ j.substring(1));
            }
            return temp;
        } else if (arg[0].toUpperCase() != arg[0]) { //lower camel case
            return arg[0].toUpperCase() ~ arg.substring(1);
        } else return arg; //upper camel case or invalid case
    }

    function toSnakeCase(arg as string) as string {
        if (arg.contains("_")) { //snake case
            return arg;
        } else { //camel case
            var temp as string = "";
            for i in 0 .. arg.length {
                if (i != 0 && arg[i].toLowerCase() != arg[i]) {
                    temp ~= "_";
                }
                temp ~= arg[i];
            }
            return temp.toLowerCase();
        }
    }
}
function getYouyihjLib() as youyihjLib{
	return youyihjLib();
}

