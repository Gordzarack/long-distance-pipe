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
ldPipeToGround.fluid_box.pipe_covers = {
    north = {
    layers = {
      {
        filename = "__long-distance-pipe__/assets/long-distance-pipe-covers/pipe-cover-north.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  east = {
    layers = {
      {
        filename = "__long-distance-pipe__/assets/long-distance-pipe-covers/pipe-cover-east.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  south = {
    layers = {
      {
        filename = "__long-distance-pipe__/assets/long-distance-pipe-covers/pipe-cover-south.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
  west = {
    layers = {
      {
        filename = "__long-distance-pipe__/assets/long-distance-pipe-covers/pipe-cover-west.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      {
        filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
}
ldPipeToGround.fluid_box.max_pipeline_extent = 320000
ldPipeToGround.pictures = {
  north = {
    filename = "__long-distance-pipe__/assets/long-distance-pipe-to-ground/pipe-to-ground-up.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
  },
  south = {
    filename = "__long-distance-pipe__/assets/long-distance-pipe-to-ground/pipe-to-ground-down.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
  },
  west = {
    filename = "__long-distance-pipe__/assets/long-distance-pipe-to-ground/pipe-to-ground-left.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
  },
  east = {
    filename = "__long-distance-pipe__/assets/long-distance-pipe-to-ground/pipe-to-ground-right.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
  },
}

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
    icon = "__long-distance-pipe__/assets/icons/pipe-to-ground.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-ba[ld-pipe-to-ground]",
    place_result = "ld-pipe-to-ground",
    stack_size = 50,
  },
  ldPipeToGround
})
