---@type data.TechnologyPrototype?
local tech_to_unlock
for _, technology in pairs(data.raw.technology) do
    if technology.effects then			
        for index, effect in pairs(technology.effects) do
            if effect.type == "unlock-recipe" then
                if effect.recipe == "pump" then
                  tech_to_unlock = technology

                  table.insert(tech_to_unlock.effects, index, {
                    type = "unlock-recipe",
                    recipe = "ld-pipe"
                  })
                  table.insert(tech_to_unlock.effects, index, {
                    type = "unlock-recipe",
                    recipe = "ld-pipe-to-ground"
                  })
                  break
                end
            end
        end
        if tech_to_unlock then break end
    end
end