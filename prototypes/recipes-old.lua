local parts = require("variable-parts")
local rm = require("recipe-modify")

data:extend({
  {
    type = "recipe",
    name = "gold-powder",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients = {{"gold-ore", 1}, {type="fluid", name=parts.aquaregia and "aqua-regia" or "nitric-acid", amount=10}},
    result = "gold-powder",
    result_count = 2,
    crafting_machine_tint = {
        primary = {0.75, 0.7, 0, 1},
        secondary = {1, 0.95, 0, 1},
        tertiary = {0.5, 0.5, 1, 1},
        quaternary = {1, 1, 1, 1}
    }
  },
  {
    type = "recipe",
    name = "trace-gold-from-copper",
    icons = {
      {
        icon = "__ThemTharHills__/graphics/icons/gold-powder.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/copper-ore.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.25,
        shift = {-8, -8}
      }
    },
    category = "chemistry",
    enabled = false,
    energy_required = 3,
    localised_name = {"recipe-name.trace-gold-from-copper"},
    ingredients = {{"copper-ore", 3}, {type="fluid", name=parts.aquaregia and "aqua-regia" or "nitric-acid", amount=30}},
    results = {{type="item", name="gold-powder", amount=1}, mods["IfNickel"] and {type="item", name="nickel-ore", amount=1, probability=0.25} or nil},
    main_product = "gold-powder",
    always_show_products = true,
    crafting_machine_tint = {
        primary = {0.75, 0.4, 0, 1},
        secondary = {1, 0.65, 0, 1},
        tertiary = {0.5, 0.5, 1, 1},
        quaternary = {1, 1, 1, 1}
    },
    allow_decomposition = false,
    ib_badge = "Au",
    ib_corner = "right-top"
  },
  {
    type = "recipe",
    name = "gold-plate",
    category = "smelting",
    enabled = false,
    energy_required = 3.2,
    ingredients = {{"gold-powder", 3}},
    result = parts.gold,
    result_count = 1
  },
  {
    type = "recipe",
    name = "gold-wire",
    category = "crafting",
    enabled = false,
    energy_required = 0.5,
    ingredients = {{parts.gold, 1}},
    result = parts.wire,
    result_count = 2,
    lasermill = {helium=1, productivity=true, type="gubbins", multiply=2}
  },
  {
    type = "recipe",
    name = "transceiver",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = 2,
      ingredients = {{"electronic-circuit", 3}, {parts.wire, 5}, parts.preferred({"quartz", "silica", "iron-stick"}, {1, 1, 1}), parts.preferred({"pcb-solder", "solder"}, {1, 1})},
      result = "transceiver"
    },
    expensive = {
      enabled = false,
      energy_required = 2,
      ingredients = {{"electronic-circuit", 3}, {parts.wire, 10}, parts.preferred({"quartz", "silica", "iron-stick"}, {1, 1, 1}), parts.preferred({"pcb-solder", "solder"}, {2, 2})},
      result = "transceiver"
    }
  },
  {
    type = "recipe",
    name = "advanced-cable",
    category = "advanced-crafting",
    normal = {
      enabled = false,
      energy_required = 3,
      ingredients = {parts.preferred({"silver-wire", "tinned-cable", "copper-cable"}, {3, 1, 1}), {parts.wire, 6}, {"plastic-bar", 3}},
      result = "advanced-cable"
    },
    expensive = {
      enabled = false,
      energy_required = 3,
      ingredients = {parts.preferred({"silver-wire", "tinned-cable", "copper-cable"}, {6, 2, 2}), {parts.wire, 12}, {"plastic-bar", 3}},
      result = "advanced-cable"
    }
  },
  {
    type = "recipe",
    name = "hv-power-regulator",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = 6,
      ingredients = {{"advanced-circuit", 5}, {"advanced-cable", 2}, {"battery", 2}, parts.preferred({"cooling-fan", "aluminum-plate", "galvanized-steel-plate", "steel-plate"}, {1, 5, 1, 1}), parts.optionalIngredient("el_energy_crystal_item", 1), parts.optionalIngredient("acsr-cable", 1)},
      result = "hv-power-regulator"
    },
    expensive = {
      enabled = false,
      energy_required = 6,
      ingredients = {{"advanced-circuit", 5}, {"advanced-cable", 4}, {"battery", 4}, parts.preferred({"cooling-fan", "aluminum-plate", "galvanized-steel-plate", "steel-plate"}, {1, 5, 1, 1}), parts.optionalIngredient("el_energy_crystal_item", 2), parts.optionalIngredient("acsr-cable", 1)},
      result = "hv-power-regulator"
    }
  },
  {
    type = "recipe",
    name = "integrated-circuit",
    category = "advanced-crafting",
    normal = {
      enabled = false,
      energy_required = 1,
      ingredients = {{"plastic-bar", 1}, {parts.gold, 2}, parts.preferred({"ll-silicon", "silicon-wafer", "silicon", "copper-plate"}, {2, 1, 2, 2})},
      result = "integrated-circuit",
      result_count = 2
    },
    expensive = {
      enabled = false,
      energy_required = 1,
      ingredients = {{"plastic-bar", 1}, {parts.gold, 2}, parts.preferred({"ll-silicon", "silicon-wafer", "silicon", "copper-plate"}, {2, 1, 2, 2})},
      result = "integrated-circuit",
      result_count = 2
    }
  }
}
)

if parts.aquaregia then
  data:extend({
    {
      type = "recipe",
      name = "aqua-regia",
      category = "chemistry",
      enabled = false,
      energy_required = 1,
      subgroup = "fluid-recipes",
      order = "y04a", --this is where it belongs with se. otherwise it will be moved later.
      ingredients = {{type="fluid", name="hydrogen-chloride", amount=mods["Krastorio2"] and 100 or 40}, {type="fluid", name="nitric-acid", amount=mods["Krastorio2"] and 100 or 160}},
      results = {{type="fluid", name="aqua-regia", amount=200}},
      emissions_multiplier = 0.25,
      crafting_machine_tint = {
        primary = {0.75, 0.75, 1, 1},
        secondary = {0.75, 1, 0.75, 1},
        tertiary = {1, 0.2, 0, 0.3},
        quaternary = {1, 1, 1, 0.6}
      }
    }
  })
end

if mods["bzgold"] and data.raw.item["silver-plate"] and rm.CheckIngredient("integrated-circuit", "copper-plate") then
  data:extend({
    {
      type = "recipe",
      name = "integrated-circuit-silver",
      icons = {
        {
          icon = "__ThemTharHills__/graphics/icons/integrated-circuit.png",
          icon_size = 64
        },
        {
          icon = "__bzgold__/graphics/icons/silver-plate.png",
          icon_size = 128,
          scale = 0.125,
          shift = {8, -8}
        }
      },
      category = "advanced-crafting",
      normal = {
        enabled = false,
        energy_required = 1,
        ingredients = {{"plastic-bar", 1}, {parts.gold, 2}, {"silver-plate", 2}},
        result = "integrated-circuit",
        result_count = 2
      },
      expensive = {
        enabled = false,
        energy_required = 1,
        ingredients = {{"plastic-bar", 1}, {parts.gold, 2}, {"silver-plate", 2}},
        result = "integrated-circuit",
        result_count = 2
      }
    }
  })
  data.raw.recipe["integrated-circuit"].icons = {
    {
      icon = "__ThemTharHills__/graphics/icons/integrated-circuit.png",
      icon_size = 64
    },
    {
      icon = "__base__/graphics/icons/copper-plate.png",
      icon_size = 64,
      scale = 0.25,
      shift = {8, -8}
    }
  }
end

if mods["Krastorio2"] then
  data:extend({
    {
      type = "recipe",
      name = "ammonia-from-potassium-nitrate",
      icons = {
        {
          icon = "__Krastorio2Assets__/icons/fluids/ammonia.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__ThemTharHills__/graphics/icons/potassium-nitrate.png",
          icon_size = 64,
          shift = {-8, -8},
          scale = 0.25
        }
      },
      category = "chemistry",
      subgroup = "fluid-recipes",
      order = "y03[ammonia]alt",
      normal = {
        enabled = false,
        energy_required = 2,
        ingredients = {{type="fluid", name="water", amount=20}, {type="item", name="potassium-nitrate", amount=1}},
        results = {{type="fluid", name="ammonia", amount=20}}
      },
      expensive = {
        enabled = false,
        energy_required = 2,
        ingredients = {{type="fluid", name="water", amount=20}, {type="item", name="potassium-nitrate", amount=2}},
        results = {{type="fluid", name="ammonia", amount=20}}
      },
      crafting_machine_tint = {
        primary = {0.5, 0.5, 1, 1},
        secondary = {1, 1, 1, 1},
        tertiary = {0.5, 0.5, 1, 1},
        quaternary = {0.8, 0.8, 0.8, 1}
      }
    }
  })

  local matterutil = require("__Krastorio2__/lib/public/data-stages/matter-util")
  data:extend(
    {
      {
        type = "technology",
        name = "kr-matter-gold-processing",
        icons = {
          {
            icon = "__Krastorio2Assets__/technologies/matter-copper.png",
            icon_size = 256,
            icon_mipmaps = 4,
          },
          {
            icon = "__ThemTharHills__/graphics/icons/gold-ore.png",
            icon_size = 64,
            icon_mipmaps = 4,
            scale = 2
          }
        },
        effects = {},
        prerequisites = { "kr-matter-processing" },
        order = "g-e-e",
        unit = {
          count = 350,
          ingredients = {
            { "production-science-pack", 1 },
            { "utility-science-pack", 1 },
            { "matter-tech-card", 1 },
          },
          time = 45
        }
      },
      {
        type = "recipe",
        name = "nitric-acid-early",
        icons = {
          {
            icon = "__Krastorio2Assets__/icons/fluids/nitric-acid.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = "__ThemTharHills__/graphics/icons/potassium-nitrate.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          }
        },
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "y04[nitric-acid]alt",
        enabled = false,
        energy_required = 3,
        ingredients = {{"potassium-nitrate", 1}, {type="fluid", name="water", amount=30}},
        results = {{type="fluid", name="nitric-acid", amount=5}},
        crafting_machine_tint = {
          primary = {0.75, 0.75, 1, 1},
          secondary = {1, 1, 1, 1},
          tertiary = {0.5, 0.5, 1, 1},
          quaternary = {1, 1, 1, 1}
        }
      },
      {
        type = "recipe",
        name = "gold-wire-s-c",
        category = "smelting-crafting",
        enabled = false,
        energy_required = 1,
        ingredients = {{"gold-powder", 3}},
        result = parts.wire,
        result_count = 2
      }
    }
  )
  matterutil.createMatterRecipe({
    item_name = "gold-ore",
    minimum_conversion_quantity = 10,
    matter_value = 5,
    energy_required = 1,
    need_stabilizer = false,
    unlocked_by_technology = "kr-matter-gold-processing"
  })
  matterutil.createMatterRecipe({
    item_name = parts.gold,
    minimum_conversion_quantity = 10,
    matter_value = mods["space-exploration"] and 11.25 or 15,
    energy_required = 3,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-gold-processing"
  })
else
  data:extend({
    {
      type = "recipe",
      name = "nitric-acid",
      category = "chemistry",
      enabled = false,
      energy_required = 1,
      subgroup = "fluid-recipes",
      order = "y04", --this is where it belongs with se. otherwise it will be moved later.
      ingredients = {{"copper-plate", 1}, {type="fluid", name="water", amount=100}, {type="fluid", name="sulfuric-acid", amount=10}, parts.optionalIngredient("potassium-nitrate", 1)},
      results = {{type="fluid", name="nitric-acid", amount=100}},
      crafting_machine_tint = {
        primary = {0.5, 0.75, 1, 1},
        secondary = {1, 1, 1, 1},
        tertiary = {0.25, 0.5, 1, 1},
        quaternary = {1, 1, 1, 1}
      }
    }
  })
end

if mods["space-exploration"] then
  se_delivery_cannon_recipes["gold-ore"] = {name= "gold-ore"}
  se_delivery_cannon_recipes[parts.gold] = {name= parts.gold}
  se_delivery_cannon_recipes["gold-ingot"] = {name= "gold-ingot"}
  if mods["Krastorio2"] then
    se_delivery_cannon_recipes["potassium-nitrate"] = {name= "potassium-nitrate"}
  else
    se_delivery_cannon_recipes["nitric-acid-barrel"] = {name= "nitric-acid-barrel"}
  end

  data:extend(
    {
      {
        type = "recipe",
        icon = "__ThemTharHills__/graphics/icons/molten-gold.png",
        icon_size = 64,
        subgroup = "gold",
        name = "molten-gold",
        category = "smelting",
        energy_required = 60,
        ingredients = {{"gold-powder", 72}, {type="fluid", name="se-pyroflux", amount=10}},
        results = {{type="fluid", name="molten-gold", amount=900}},
        enabled = false
      },
      {
        type = "recipe",
        name = "gold-ingot",
        category = "casting",
        energy_required = 25,
        ingredients = {{type="fluid", name="molten-gold", amount=250}},
        result = "gold-ingot",
        main_product = "gold-ingot", --required for bismuth to not break
        result_count = 1,
        enabled = false
      },
      {
        type = "recipe",
        name = "gold-ingot-to-plate",
        icons = {
          { icon = "__ThemTharHills__/graphics/icons/gold-plate.png", icon_size = 64 },
          { icon = "__ThemTharHills__/graphics/icons/gold-ingot.png", icon_size = 64, scale=0.25, shift= {-8, -8}},
        },
        category = "crafting",
        energy_required = 5,
        ingredients = {{"gold-ingot", 1}},
        result = parts.gold,
        result_count = 10,
        allow_decomposition = false,
        enabled = false
      }
    }
  )
end

if mods["FreightForwarding"] then
  data:extend({
    {
      type = "recipe",
      name = "noble-nodule-dredging",
      category = "ff-dredging",
      energy_required = 50,
      ingredients = {},
      results = {{type="item", name="noble-nodule", amount_min=75, amount_max=150}},
      show_amount_in_title = false,
      always_show_products = true,
      enabled = false
    },
    {
      type = "recipe",
      name = "noble-nodule-washing",
      category = "chemistry",
      energy_required = 15,
      allow_decomposition = false,
      ingredients = {{"noble-nodule", 18}, {type="fluid", name="nitric-acid", amount=15}},
      results = {{type="item", name="gold-ore", amount_min=40, amount_max=50}, {type="item", name=data.raw.item["silver-ore"] and "silver-ore" or "copper-ore", amount_min=0, amount_max=8}, {type="item", name="stone", amount_min=0, amount_max=4}, {type="item", name="noble-nodule", amount_min=0, amount_max=6}},
      main_product = "gold-ore",
      enabled = false,
      crafting_machine_tint = {
        primary = {r = 0.9, g = 0.8, b = 0, a = 1.0},
        secondary = {r = 1.0, g = 1.0, b = 1.0, a = 1.0},
        tertiary = {r = 1.0, g = 1.0, b = 0.8, a = 1.0},
        quaternary = {r = 0.75, g = 0.75, b = 0.0, a = 0.5}
      }
    }
  })
end

if mods["LunarLandings"] then
  if not mods["BrassTacks"] then
    data:extend({
      {
        type = "recipe",
        name = "cheese-ore-processing",
        category = "ll-electric-smelting",
        subgroup = "ll-raw-material-moon",
        order = "a[moon-rock]-c",
        icon = "__ThemTharHills__/graphics/icons/cheese-ore.png",
        icon_size = 64,
        energy_required = 10,
        ingredients = { {"cheese-ore", 20} },
        results = {{type="item", name="gold-ore", amount=10}, {type="item", name="ll-moon-rock", amount=3}, {type="fluid", name="light-oil", amount=10, fluidbox_index = 1}},
        always_show_products = true,
        enabled = false
      }
    })
  end
  data:extend({
    {
      type = "recipe",
      name = "entangled-transceiver",
      category = "ll-quantum-resonating",
      localised_name = { "recipe-name.entangled-transceiver" },
      icons = {
        {
          icon = "__ThemTharHills__/graphics/icons/transceiver.png",
          icon_size = 64
        },
        {
          icon = "__LunarLandings__/graphics/icons/polariton/polariton.png",
          icon_size = 64,
          scale = 0.25,
          shift = {-8, -8}
        }
      },
      energy_required = 15,
      allow_decomposition = false,
      ingredients = {{"integrated-circuit", 30}, {"ll-down-polariton", 1}, {"ll-right-polariton", 1}},
      results = {{type="item", name="transceiver", amount=30}, {type="item", name="ll-up-polariton", amount=2}},
      main_product = "transceiver",
      enabled = false
    }
  })
end
