
local flib_table = require("__flib__.table")

local function addConnectionCategory(connection)
    local categories = connection.connection_category

    if categories and type(categories) == "string" then
        categories = { categories }
    elseif not categories then
        categories = {}
        connection.connection_category = categories
    end

    if not flib_table.find(categories, "default") then
        table.insert(categories, "default")
    end
    table.insert(categories, "ld-pipe")
end

-- Add ld-pipe connection to mining-drill entities
for entity_name in pairs(data.raw["mining-drill"]) do
    -- Adds to drill inputs
    if data.raw["mining-drill"][entity_name].input_fluid_box then
        data.raw["mining-drill"][entity_name].input_fluid_box.max_pipeline_extent = 320000

        for _, connection in pairs(data.raw["mining-drill"][entity_name].input_fluid_box.pipe_connections) do
            addConnectionCategory(connection)
        end
    end
    
    -- Adds to pumpjacks output
    if data.raw["mining-drill"][entity_name].output_fluid_box then
        data.raw["mining-drill"][entity_name].output_fluid_box.max_pipeline_extent = 320000

        for _, connection in pairs(data.raw["mining-drill"][entity_name].output_fluid_box.pipe_connections) do
            addConnectionCategory(connection)
        end
    end
end

-- Add ld-pipe connection to pumps
for entity_type in pairs(data.raw["pump"]) do
    if not data.raw["pump"][entity_type].fluid_box then
        break
    end

    for _, connection in pairs(data.raw["pump"][entity_type].fluid_box.pipe_connections) do
        addConnectionCategory(connection)
    end
end

-- Add ld-pipe connection to flamethrowers
for entity_type in pairs(data.raw["fluid-turret"]) do
    if not data.raw["fluid-turret"][entity_type].fluid_box then
        break
    end

    for _, connection in pairs(data.raw["fluid-turret"][entity_type].fluid_box.pipe_connections) do
        addConnectionCategory(connection)
        data.raw["fluid-turret"][entity_type].fluid_box.max_pipeline_extent = 320000
    end
end
