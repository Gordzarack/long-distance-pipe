local ldPipeToGround = table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])

ldPipeToGround.name = "ld-pipe-to-ground"
ldPipeToGround.minable = { mining_time = 0.1, result = "ld-pipe-to-ground" }
ldPipeToGround.fluid_box.pipe_connections = {
        {
          flow_direction = "input-output",
          direction = defines.direction.north,
          position = { 0, 0 },
          connection_category = "ld-pipe",
        },
        {
          flow_direction = "input-output",
          direction = defines.direction.south,
          position = { 0, 0 },
          connection_type = "underground",
          max_underground_distance = 20,
          connection_category = "ld-pipe",
        },
}
ldPipeToGround.fluid_box.max_pipeline_extent = 320000

data:extend({
  {
    type = "recipe",
    name = "ld-pipe-to-ground",
    enabled = false,
    ingredients = {
      { type = "item", name = "ld-pipe", amount = 10 },
      { type = "item", name = "steel-plate", amount = 5 },
    },
    results = { { type = "item", name = "ld-pipe-to-ground", amount = 2 } },
  },
  {
    type = "item",
    name = "ld-pipe-to-ground",
    icon = ldPipeToGround.icon,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-ba[ld-pipe-to-ground]",
    place_result = "ld-pipe-to-ground",
    stack_size = 50,
  },
  ldPipeToGround
  -- {
  --   type = "pipe-to-ground",
  --   name = "ld-pipe-to-ground",
  --   icon = pipeToGround.icon,
  --   flags = { "placeable-neutral", "player-creation" },
  --   minable = { mining_time = 0.1, result = "ld-pipe-to-ground" },
  --   fast_replaceable_group = "pipe",
  --   collision_box = { { -0.29, -0.29 }, { 0.29, 0.2 } },
  --   selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
  --   pictures = pipeToGround.pictures,
  --   fluid_box = {
  --     volume = 100,
  --     max_pipeline_extent = 320000,
  --     pipe_covers = pipecoverspictures(),
  --     pipe_connections = {
  --     },
  --     hide_connection_info = true,
  --   },
  --   max_health = 150,
  --   corpse = "pipe-remnants",
  --   icon_draw_specification = { scale = 0.5 },
  --   resistances = pipeToGround.resistances,
  --   working_sound = sounds.pipe,
  --   visualization = pipeToGround.visualization,
  -- },
})
