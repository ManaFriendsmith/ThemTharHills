local misc = require("__pf-functions__/misc")
local rm = require("__pf-functions__/recipe-manipulation")

--do this in DFF so brimstuff gets its turn.
if misc.difficulty == 3 and mods["space-age"] and #data.raw.recipe["cryogenic-plant"].ingredients > 6 then
    rm.AddIngredient("hydrocoptic-marzelvane", "lithium-plate", 1)
    rm.RemoveIngredient("cryogenic-plant", "lithium-plate", 99999)
end
