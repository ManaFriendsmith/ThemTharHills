local misc = require("__pf-functions__/misc")
local tm = require("__pf-functions__/technology-manipulation")

data:extend({
    {
        type = "technology",
        name = "gold-processing",
        icon = "__ThemTharHills__/graphics/technology/gold-processing.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "nitric-acid"
            },
            {
                type = "unlock-recipe",
                recipe = "gold-powder"
            },
            {
                type = "unlock-recipe",
                recipe = "gold-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "depleted-acid-reprocessing"
            }
        },
        prerequisites = {"sulfur-processing"},
        unit = {
            count = 50,
            time = 15,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            }
        }
    }
})

if mods["space-age"] then
    tm.AddUnlock("foundry", "trace-metals-from-copper", "-concrete-from-molten-iron")

    data:extend({
        {
            type = "technology",
            name = "electrolytronics",
            icons = {
                {
                    icon = "__base__/graphics/technology/advanced-circuit.png",
                    icon_size = 256,
                    icon_mipmaps = 4,
                },
                {
                    icon = "__space-age__/graphics/technology/holmium-processing.png",
                    icon_size = 256,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = {-32, -32}
                }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "holmium-wire"
                },
                {
                    type = "unlock-recipe",
                    recipe = "holmium-microchip"
                }
            },
            prerequisites = {"electromagnetic-science-pack", "metallurgic-science-pack"},
            unit = {
                count = 1500,
                time = 60,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"electromagnetic-science-pack", 1}
                }
            }
        }
    })
else
    tm.AddUnlock("gold-processing", "trace-metals-from-copper", "gold-powder")
end


if misc.difficulty > 1 then
    data:extend({
        {
            type = "technology",
            name = "gold-electronics",
            icon = "__ThemTharHills__/graphics/technology/gold-electronics.png",
            icon_size = 256,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "gold-wire"
                },
                {
                    type = "unlock-recipe",
                    recipe = "transceiver"
                },
                {
                    type = "unlock-recipe",
                    recipe = "stepper-motor"
                }
            },
            prerequisites = {"gold-processing"},
            research_trigger = {
                type = "craft-item",
                item = "gold-plate"
            }
        }
    })

    if misc.difficulty == 3 then
        tm.AddUnlock("gold-electronics", "semiboloid-stator", "-stepper-motor")
    end
else
    tm.AddUnlock("gold-processing", "gold-wire", "-depleted-acid-reprocessing")
end

if mods["space-age"] then
    data:extend({
        {
            type = "technology",
            name = "neural-electronics",
            icon = "__ThemTharHills__/graphics/technology/neural-electronics.png",
            icon_size = 256,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "neural-bioculture"
                },
                {
                    type = "unlock-recipe",
                    recipe = "neural-microchip"
                },
                {
                    type = "unlock-recipe",
                    recipe = "neural-conductor"
                }
            },
            prerequisites = {"biochamber"},
            research_trigger = {
                type = "craft-item",
                item = "pentapod-egg"
            }
        }
    })
end