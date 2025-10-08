local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

--mods that just use vanilla-like ore generation will not get special design effort
if mods["tenebris"] then
    data.raw.planet["tenebris"].map_gen_settings.autoplace_controls["gold-ore"] = {}
    data.raw.planet["tenebris"].map_gen_settings.autoplace_settings.entity.settings["gold-ore"] = {}    
end

if mods["terrapalus"] then
    data.raw.planet["terrapalus"].map_gen_settings.autoplace_controls["gold-ore"] = {}
    data.raw.planet["terrapalus"].map_gen_settings.autoplace_settings.entity.settings["gold-ore"] = {}    
end

if mods["maraxsis"] then
    if misc.difficulty == 3 then
        rm.ReplaceIngredientProportional("hydrocoptic-marzelvane", "superconductor", "tungsten-plate")
        rm.ReplaceIngredientProportional("hydrocoptic-marzelvane", "fluoroketone-cold", "maraxsis-brackish-water")

        tm.AddUnlock("maraxsis-hydro-plant", "hydrocoptic-marzelvane", "maraxsis-brackish-water")
        rm.AddIngredient("maraxsis-hydro-plant", "hydrocoptic-marzelvane", 4)
        rm.AddIngredient("maraxsis-salt-reactor", "hydrocoptic-marzelvane", 4)

        rm.MultiplyRecipe("hydraulic-science-pack", 2)
        rm.AddIngredient("hydraulic-science-pack", "hydrocoptic-marzelvane", 1)
    end
end

--cerys: I'm really not sure if you can obtain all ores in decent ratios from recycling stuff.
--as I understand it cerys is a meticulously designed puzzle, adding explicit compat would almost be like adding compat with ultracube

--arrakis, shattered planet: incomplete