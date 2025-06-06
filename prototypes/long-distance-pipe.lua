local ldPipe = table.deepcopy(data.raw["pipe"]["pipe"])

ldPipe.name = "ld-pipe"
ldPipe.minable = { mining_time = 0.1, result = "ld-pipe" }
ldPipe.fluid_box.pipe_connections = {
    { direction = defines.direction.north, position = { 0, 0 }, connection_category = "ld-pipe" },
    { direction = defines.direction.east, position = { 0, 0 }, connection_category = "ld-pipe" },
    { direction = defines.direction.south, position = { 0, 0 }, connection_category = "ld-pipe" },
    { direction = defines.direction.west, position = { 0, 0 }, connection_category = "ld-pipe" },
}
ldPipe.fluid_box.max_pipeline_extent = 320000

data:extend({
    {
        type = "recipe",
        name = "ld-pipe",
        enabled = false,
        ingredients = {
            { type = "item", name = "steel-plate", amount = 1 },
        },
        results = { { type = "item", name = "ld-pipe", amount = 1 } },
    },
    {
        type = "item",
        name = "ld-pipe",
        icon = ldPipe.icon,
        subgroup = "energy-pipe-distribution",        
        order = "a[pipe]-aa[ld-pipe]",
        place_result = "ld-pipe",
        stack_size = 100,
    },
    ldPipe
    -- {
    --     type = "pipe",
    --     name = "ld-pipe",
    --     icon = pipe.icon,
    --     flags = { "placeable-neutral", "player-creation" },
    --     minable = { mining_time = 0.1, result = "ld-pipe" },
    --     fast_replaceable_group = "pipe",
    --     collision_box = { { -0.29, -0.29 }, { 0.29, 0.29 } },
    --     selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    --     pictures = pipe.pictures,
        
    --     fluid_box = {
    --         volume = 100,
    --         pipe_connections = {
    --             { direction = defines.direction.north, position = { 0, 0 }, connection_category = "ld-pipe" },
    --             { direction = defines.direction.east, position = { 0, 0 }, connection_category = "ld-pipe" },
    --             { direction = defines.direction.south, position = { 0, 0 }, connection_category = "ld-pipe" },
    --             { direction = defines.direction.west, position = { 0, 0 }, connection_category = "ld-pipe" },
    --         },
    --         max_pipeline_extent = 320000,
    --         hide_connection_info = true,
    --         pipe_covers = pipecoverspictures(),
    --         pictures = pipe.fluid_box.pictures
    --     },
    --     max_health = 200,
    --     corpse = "pipe-remnants",
    --     icon_draw_specification = { scale = 0.5 },
    --     resistances = pipe.resistances,
    --     working_sound = item_sounds.pipe,
    --     horizontal_window_bounding_box = { { -0.25, -0.28125 }, { 0.25, 0.15625 } },
    --     vertical_window_bounding_box = { { -0.28125, -0.5 }, { 0.03125, 0.125 } },
    -- }
})