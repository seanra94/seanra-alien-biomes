data:extend({
  {
    type = "noise-layer",
    name = "grass3"
  },
  {
    type = "noise-layer",
    name = "pita"
  }
})

-- fields https://wiki.factorio.com/Types/AutoplaceSpecification
--[[
sharpness = 0.3 -- probability distribution: 0 = linear line, 1 = vertical step at 0.5, 0.5 starts a linear line from 0.25 to o.75
placement_density = 1,
max_probability = 0.5. -- Multiplier for output of the sharpness filter.
coverage = 0.2, -- Sets a fraction of surface that should be covered by this item.
random_probability_penalty = 0.2, -- random value between 0 and this number is subtracted from probability after sharpness
tile_restriction = tile list

-- in peaks
{ influence = -1 },
min_influence
max_influence
noise-layer -- Range of the noise is approximately from -1.5 to 1.5.
_optimal to _range to _max_range is a scale from 1 to 0 to -1
dimension (_optimal) value is then multiplied by noise if any
]]--

-- condense autoplaces for quick reference
local autoplaces = {
  -- fluff
  ["asterisk"] = {
    random_probability_penalty = 0.25,
    peaks = {
      { influence = -0.7 },
      {
        influence = 0.4,
        max_influence = 0.4,
        noise_layer = "fluff",
        noise_octaves_difference = -2,
        noise_persistence = 0.8,
      },
      {
        water_optimal = 0.7,
        water_range = 0.2,
        water_max_range = 0.3,
      }
    },
  },
  ["asterisk-mini"] = {
    random_probability_penalty = 0.25,
    peaks = {
      { influence = -0.7 },
      {
        influence = 0.4,
        max_influence = 0.4,
        noise_layer = "fluff",
        noise_octaves_difference = -2,
        noise_persistence = 0.7,
      },
      {
        water_optimal = 0.7,
        water_range = 0.2,
        water_max_range = 0.3,
      }
    }
  },
  ["desert-bush"] = {
    random_probability_penalty = 0.25,
    order = "a[doodad]-d[fluff]",
    sharpness = 0.9,
    max_probability = 0.5,
    random_probability_penalty = 0.9,
    peaks =
    {
      { influence = -0.7 },
      {
        influence = 0.4,
        max_influence = 0.4,
        noise_layer = "fluff",
        noise_octaves_difference = -2,
        noise_persistence = 0.7,
        water_optimal = 0.5,
        water_range = 0.1,
        water_max_range = 0.2,
      },
    },
  },

  -- pita
  ["croton"] = {
    order = "a[doodad]-e[pita]",
    sharpness = 0.7,
    max_probability = 0.95,
    random_probability_penalty = 0.25,
    peaks =
    {
      { influence = -0.7 },
      {
        influence = 0.4,
        max_influence = 0.4,
        noise_layer = "pita",
        noise_octaves_difference = -2,
        noise_persistence = 0.8,
      },
      {
          water_optimal = 1,
          water_range = 0.2,
          water_max_range = 0.3,
        }
    },
  },
  ["pita"] =
  {
    order = "a[doodad]-e[pita]",
    sharpness = 0.7,
    max_probability = 0.7,
      random_probability_penalty = 0.25,
    peaks = {
      { influence = -0.7 },
      {
        influence = 0.4,
        max_influence = 0.4,
        noise_layer = "pita",
        noise_octaves_difference = -2,
        noise_persistence = 0.7,
      },
      {
        water_optimal = 0.6,
        water_range = 0.2,
        water_max_range = 0.4,
      }
    },
  },
  ["pita-mini"] = {
    order = "a[doodad]-e[pita]",
    sharpness = 0.7,
    max_probability = 0.7,
    random_probability_penalty = 0.25,
    peaks =
    {
      { influence = -0.7 },
      {
        influence = 0.4,
        max_influence = 0.4,
        noise_layer = "pita",
        noise_octaves_difference = -2,
        noise_persistence = 0.7,
      },
      {
        water_optimal = 0.6,
        water_range = 0.2,
        water_max_range = 0.4,
      }
    },
  },

  -- garballo
  ["bush-mini"] = {
    order = "a[doodad]-e[garballo]",
    sharpness = 0.8,
    random_probability_penalty = 0.5,
    peaks =
    {
      { influence = -0.7 },
      {
        influence = 0.4,
        max_influence = 0.4,
        noise_layer = "garballo",
        noise_octaves_difference = -2,
        noise_persistence = 0.8,
      },
      {
        water_optimal = 1,
        water_range = 0.2,
        water_max_range = 0.3,
      }
    },
  },

  -- grass
  ["carpet-grass"] = {
    order = "a[doodad]-f[grass]-c",
    sharpness = 0.3,
    max_probability = 0.3, -- was 0.01
    random_probability_penalty = 0.25,
    peaks =
    {
      { influence = -0.3 }, -- 0.5 -- since coverage = 0 isn"t low enough (!), need to substract some more
      {
        influence = 0.3,
        max_influence = 0.3,
        noise_layer = "grass3",
        noise_octaves_difference = -2.8,
        noise_persistence = 0.7
      },
      {
        water_optimal = 1,
        water_range = 0.4,
        water_max_range = 0.45,
      }
    },
  },
  ["hairy-grass"] = {
    order = "a[doodad]-f[grass]-b",
    sharpness = 0.2,
    max_probability = 0.05, -- was 0.01
    random_probability_penalty = 0.25,
    peaks =
    {
      { influence = -0.3 },
      {
        influence = 0.3,
        max_influence = 0.3,
        noise_layer = "grass2",
        noise_octaves_difference = -2.8,
        noise_persistence = 0.7
      },
      {
        water_optimal = 1,
        water_range = 0.4,
        water_max_range = 0.41,
      }
    },
  },
  ["small-grass"] = {
    order = "a[doodad]-f[grass]-d",
    sharpness = 0.2,
    max_probability = 0.02,
    random_probability_penalty = 0.25,
    peaks =
    {
      { influence = -0.3 },
      {
        influence = 0.3,
        max_influence = 0.3,
        noise_layer = "grass1",
        noise_octaves_difference = -2.8,
        noise_persistence = 0.7
      },
      {
        water_optimal = 1,
        water_range = 0.4,
        water_max_range = 0.41,
      }
    },
  },
}
return {
{
  name = "asterisk",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-b[asterisk-mini]-b[green]",
  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selectable_in_game = false,
  render_layer = "decorative",
  autoplace = autoplaces["asterisk"],
  pictures =
  {
    --gAst
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-00.png",
      priority = base_decorative_sprite_priority,
      width = 60,
      height = 40,
      shift = util.by_pixel(5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-00.png",
        priority = base_decorative_sprite_priority,
        width = 120,
        height = 80,
        shift = util.by_pixel(5, -4),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-01.png",
      priority = base_decorative_sprite_priority,
      width = 65,
      height = 47,
      shift = util.by_pixel(0.5, -5.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-01.png",
        priority = base_decorative_sprite_priority,
        width = 130,
        height = 95,
        shift = util.by_pixel(1, -5.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-02.png",
      priority = base_decorative_sprite_priority,
      width = 61,
      height = 38,
      shift = util.by_pixel(-0.5, 1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-02.png",
        priority = base_decorative_sprite_priority,
        width = 122,
        height = 76,
        shift = util.by_pixel(0, 1),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-03.png",
      priority = base_decorative_sprite_priority,
      width = 60,
      height = 38,
      shift = util.by_pixel(6, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-03.png",
        priority = base_decorative_sprite_priority,
        width = 121,
        height = 75,
        shift = util.by_pixel(5.75, -0.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-04.png",
      priority = base_decorative_sprite_priority,
      width = 42,
      height = 38,
      shift = util.by_pixel(4, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-04.png",
        priority = base_decorative_sprite_priority,
        width = 85,
        height = 77,
        shift = util.by_pixel(3.75, -3.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-05.png",
      priority = base_decorative_sprite_priority,
      width = 67,
      height = 39,
      shift = util.by_pixel(-0.5, -1.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-05.png",
        priority = base_decorative_sprite_priority,
        width = 132,
        height = 77,
        shift = util.by_pixel(-0.5, -1.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-06.png",
      priority = base_decorative_sprite_priority,
      width = 42,
      height = 46,
      shift = util.by_pixel(3, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-06.png",
        priority = base_decorative_sprite_priority,
        width = 84,
        height = 92,
        shift = util.by_pixel(3, -4),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-07.png",
      priority = base_decorative_sprite_priority,
      width = 60,
      height = 40,
      shift = util.by_pixel(6, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-07.png",
        priority = base_decorative_sprite_priority,
        width = 118,
        height = 79,
        shift = util.by_pixel(6, -2.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-08.png",
      priority = base_decorative_sprite_priority,
      width = 51,
      height = 39,
      shift = util.by_pixel(3.5, 0.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-08.png",
        priority = base_decorative_sprite_priority,
        width = 104,
        height = 78,
        shift = util.by_pixel(3.5, 0.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-09.png",
      priority = base_decorative_sprite_priority,
      width = 44,
      height = 30,
      shift = util.by_pixel(-1, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-09.png",
        priority = base_decorative_sprite_priority,
        width = 88,
        height = 61,
        shift = util.by_pixel(-1, -2.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-10.png",
      priority = base_decorative_sprite_priority,
      width = 44,
      height = 31,
      shift = util.by_pixel(3, -9.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-10.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 63,
        shift = util.by_pixel(2.75, -9.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-11.png",
      priority = base_decorative_sprite_priority,
      width = 45,
      height = 28,
      shift = util.by_pixel(13.5, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-11.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 58,
        shift = util.by_pixel(13.75, -1),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-12.png",
      priority = base_decorative_sprite_priority,
      width = 45,
      height = 32,
      shift = util.by_pixel(-7.5, 2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-12.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 64,
        shift = util.by_pixel(-7.5, 2),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-13.png",
      priority = base_decorative_sprite_priority,
      width = 44,
      height = 36,
      shift = util.by_pixel(4, -5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-13.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 73,
        shift = util.by_pixel(4.25, -4.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-14.png",
      priority = base_decorative_sprite_priority,
      width = 38,
      height = 28,
      shift = util.by_pixel(1, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-14.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 56,
        shift = util.by_pixel(1, -3),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-15.png",
      priority = base_decorative_sprite_priority,
      width = 43,
      height = 25,
      shift = util.by_pixel(3.5, -0.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-15.png",
        priority = base_decorative_sprite_priority,
        width = 85,
        height = 51,
        shift = util.by_pixel(3.25, -0.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-16.png",
      priority = base_decorative_sprite_priority,
      width = 46,
      height = 36,
      shift = util.by_pixel(8, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-16.png",
        priority = base_decorative_sprite_priority,
        width = 92,
        height = 71,
        shift = util.by_pixel(8, -1.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-17.png",
      priority = base_decorative_sprite_priority,
      width = 46,
      height = 33,
      shift = util.by_pixel(3, -0.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-17.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 65,
        shift = util.by_pixel(3, -0.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-18.png",
      priority = base_decorative_sprite_priority,
      width = 58,
      height = 34,
      shift = util.by_pixel(4, -5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-18.png",
        priority = base_decorative_sprite_priority,
        width = 117,
        height = 69,
        shift = util.by_pixel(4.25, -4.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/asterisk-19.png",
      priority = base_decorative_sprite_priority,
      width = 41,
      height = 32,
      shift = util.by_pixel(0.5, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk/hr-asterisk-19.png",
        priority = base_decorative_sprite_priority,
        width = 82,
        height = 64,
        shift = util.by_pixel(0.5, -2),
        scale = 0.5
      },
    },
  }
},
{
  name = "asterisk-mini",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-b[asterisk-mini]-c[green]",
  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selectable_in_game = false,
  render_layer = "decorative",
  autoplace = autoplaces["asterisk-mini"],
  pictures =
  {
    --miniAstG
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-00.png",
      priority = base_decorative_sprite_priority,
      width = 21,
      height = 20,
      shift = util.by_pixel(8.5, 1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-00.png",
        priority = base_decorative_sprite_priority,
        width = 42,
        height = 41,
        shift = util.by_pixel(8.5, 1.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-01.png",
      priority = base_decorative_sprite_priority,
      width = 15,
      height = 20,
      shift = util.by_pixel(3.5, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-01.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 40,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-02.png",
      priority = base_decorative_sprite_priority,
      width = 24,
      height = 20,
      shift = util.by_pixel(-1, 2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-02.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 39,
        shift = util.by_pixel(-1.25, 2.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-03.png",
      priority = base_decorative_sprite_priority,
      width = 27,
      height = 16,
      shift = util.by_pixel(-1.5, 0),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-03.png",
        priority = base_decorative_sprite_priority,
        width = 54,
        height = 32,
        shift = util.by_pixel(-1.5, 0),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-04.png",
      priority = base_decorative_sprite_priority,
      width = 20,
      height = 21,
      shift = util.by_pixel(-7, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-04.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 43,
        shift = util.by_pixel(-6.75, -1.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-05.png",
      priority = base_decorative_sprite_priority,
      width = 20,
      height = 20,
      shift = util.by_pixel(-4, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-05.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 39,
        shift = util.by_pixel(-4.25, -1.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-06.png",
      priority = base_decorative_sprite_priority,
      width = 15,
      height = 9,
      shift = util.by_pixel(-0.5, 0.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-06.png",
        priority = base_decorative_sprite_priority,
        width = 31,
        height = 19,
        shift = util.by_pixel(-0.25, 0.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-07.png",
      priority = base_decorative_sprite_priority,
      width = 14,
      height = 10,
      shift = util.by_pixel(0, 0),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-07.png",
        priority = base_decorative_sprite_priority,
        width = 27,
        height = 20,
        shift = util.by_pixel(0.25, 0.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-08.png",
      priority = base_decorative_sprite_priority,
      width = 17,
      height = 10,
      shift = util.by_pixel(-1.5, 0),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-08.png",
        priority = base_decorative_sprite_priority,
        width = 32,
        height = 20,
        shift = util.by_pixel(-1.5, 0.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-09.png",
      priority = base_decorative_sprite_priority,
      width = 13,
      height = 13,
      shift = util.by_pixel(0.5, -1.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-09.png",
        priority = base_decorative_sprite_priority,
        width = 26,
        height = 27,
        shift = util.by_pixel(1, -1.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-10.png",
      priority = base_decorative_sprite_priority,
      width = 18,
      height = 12,
      shift = util.by_pixel(0, 1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-10.png",
        priority = base_decorative_sprite_priority,
        width = 37,
        height = 23,
        shift = util.by_pixel(-0.25, 0.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/asterisk-mini-11.png",
      priority = base_decorative_sprite_priority,
      width = 23,
      height = 16,
      shift = util.by_pixel(-3.5, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/asterisk-mini/hr-asterisk-mini-11.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 33,
        shift = util.by_pixel(-3.5, -2.75),
        scale = 0.5
      },
    },
  }
},
{
  name = "bush-mini",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-j[bush]-a[mini]-a[green]",
  collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selectable_in_game = false,
  autoplace = autoplaces["bush-mini"],
  pictures =
  {
    --gBushMini
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-00.png",
      priority = base_decorative_sprite_priority,
      width = 31,
      height = 22,
      shift = util.by_pixel(2.5, 1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-00.png",
        priority = base_decorative_sprite_priority,
        width = 62,
        height = 45,
        shift = util.by_pixel(3.5, 1.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-01.png",
      priority = base_decorative_sprite_priority,
      width = 37,
      height = 23,
      shift = util.by_pixel(3.5, -1.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-01.png",
        priority = base_decorative_sprite_priority,
        width = 73,
        height = 46,
        shift = util.by_pixel(4.25, -1),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-02.png",
      priority = base_decorative_sprite_priority,
      width = 29,
      height = 18,
      shift = util.by_pixel(2.5, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-02.png",
        priority = base_decorative_sprite_priority,
        width = 58,
        height = 38,
        shift = util.by_pixel(3, -1.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-03.png",
      priority = base_decorative_sprite_priority,
      width = 31,
      height = 25,
      shift = util.by_pixel(-0.5, 0.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-03.png",
        priority = base_decorative_sprite_priority,
        width = 61,
        height = 50,
        shift = util.by_pixel(0.25, 1),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-04.png",
      priority = base_decorative_sprite_priority,
      width = 28,
      height = 22,
      shift = util.by_pixel(2, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-04.png",
        priority = base_decorative_sprite_priority,
        width = 55,
        height = 44,
        shift = util.by_pixel(2.75, -3),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-05.png",
      priority = base_decorative_sprite_priority,
      width = 29,
      height = 21,
      shift = util.by_pixel(-1.5, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-05.png",
        priority = base_decorative_sprite_priority,
        width = 57,
        height = 42,
        shift = util.by_pixel(-0.75, -1.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-06.png",
      priority = base_decorative_sprite_priority,
      width = 32,
      height = 21,
      shift = util.by_pixel(4, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-06.png",
        priority = base_decorative_sprite_priority,
        width = 63,
        height = 43,
        shift = util.by_pixel(4.25, -1.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-07.png",
      priority = base_decorative_sprite_priority,
      width = 32,
      height = 24,
      shift = util.by_pixel(1, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-07.png",
        priority = base_decorative_sprite_priority,
        width = 64,
        height = 49,
        shift = util.by_pixel(1.5, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-08.png",
      priority = base_decorative_sprite_priority,
      width = 27,
      height = 18,
      shift = util.by_pixel(-1.5, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-08.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 36,
        shift = util.by_pixel(-0.75, -0.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-09.png",
      priority = base_decorative_sprite_priority,
      width = 24,
      height = 16,
      shift = util.by_pixel(3, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-09.png",
        priority = base_decorative_sprite_priority,
        width = 47,
        height = 33,
        shift = util.by_pixel(3.75, -2.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-10.png",
      priority = base_decorative_sprite_priority,
      width = 19,
      height = 16,
      shift = util.by_pixel(-0.5, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-10.png",
        priority = base_decorative_sprite_priority,
        width = 38,
        height = 31,
        shift = util.by_pixel(0, -2.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/bush-mini-11.png",
      priority = base_decorative_sprite_priority,
      width = 21,
      height = 12,
      shift = util.by_pixel(0.5, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/bush-mini/hr-bush-mini-11.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 25,
        shift = util.by_pixel(0.75, -0.25),
        scale = 0.5
      },
    },
  }
},
{
  name = "carpet-grass",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-a[grass]-b[carpet]",
  collision_box = {{-2, -2}, {2, 2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  selectable_in_game = false,
  autoplace = autoplaces["carpet-grass"],
  pictures =
  {
    --greenCarpet
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-08.png",
      priority = base_decorative_sprite_priority,
      width = 126,
      height = 121,
      shift = util.by_pixel(-4, 12.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 252,
        height = 241,
        shift = util.by_pixel(-4, 12.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-09.png",
      priority = base_decorative_sprite_priority,
      width = 130,
      height = 68,
      shift = util.by_pixel(0, 9),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 260,
        height = 135,
        shift = util.by_pixel(0, 9.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-10.png",
      priority = base_decorative_sprite_priority,
      width = 136,
      height = 145,
      shift = util.by_pixel(5, -7.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 272,
        height = 290,
        shift = util.by_pixel(5, -7.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-11.png",
      priority = base_decorative_sprite_priority,
      width = 134,
      height = 127,
      shift = util.by_pixel(1, -1.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 267,
        height = 253,
        shift = util.by_pixel(0.75, -1.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-03.png",
      priority = base_decorative_sprite_priority,
      width = 142,
      height = 108,
      shift = util.by_pixel(2, -15),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 282,
        height = 220,
        shift = util.by_pixel(2, -15.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-04.png",
      priority = base_decorative_sprite_priority,
      width = 129,
      height = 73,
      shift = util.by_pixel(3.5, -7.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 264,
        height = 146,
        shift = util.by_pixel(2, -7.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-05.png",
      priority = base_decorative_sprite_priority,
      width = 118,
      height = 131,
      shift = util.by_pixel(4, 1.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 235,
        height = 262,
        shift = util.by_pixel(4.25, 2),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-06.png",
      priority = base_decorative_sprite_priority,
      width = 126,
      height = 129,
      shift = util.by_pixel(2, -6.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 260,
        height = 257,
        shift = util.by_pixel(-0.5, -6.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-07.png",
      priority = base_decorative_sprite_priority,
      width = 122,
      height = 126,
      shift = util.by_pixel(6, 2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 244,
        height = 255,
        shift = util.by_pixel(5.5, 2.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-00.png",
      priority = base_decorative_sprite_priority,
      width = 144,
      height = 146,
      shift = util.by_pixel(2, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 289,
        height = 292,
        shift = util.by_pixel(1.75, -3),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-01.png",
      priority = base_decorative_sprite_priority,
      width = 137,
      height = 132,
      shift = util.by_pixel(0.5, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 273,
        height = 264,
        shift = util.by_pixel(0.25, -0.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/carpet-grass-02.png",
      priority = base_decorative_sprite_priority,
      width = 123,
      height = 93,
      shift = util.by_pixel(-4.5, 14.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/carpet-grass/hr-carpet-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 246,
        height = 185,
        shift = util.by_pixel(-4.5, 14.25),
        scale = 0.5
      },
    },
  }
},
{
  name = "croton",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-d[croton]-a[green]",
  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  render_layer = "decorative",
  selectable_in_game = false,
  autoplace = autoplaces["croton"],
  pictures =
  {
    --crotonG
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-00.png",
      priority = base_decorative_sprite_priority,
      width = 39,
      height = 28,
      shift = util.by_pixel(4.5, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-00.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 54,
        shift = util.by_pixel(4.25, -3),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-01.png",
      priority = base_decorative_sprite_priority,
      width = 39,
      height = 25,
      shift = util.by_pixel(5.5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-01.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 52,
        shift = util.by_pixel(6, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-02.png",
      priority = base_decorative_sprite_priority,
      width = 36,
      height = 27,
      shift = util.by_pixel(7, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-02.png",
        priority = base_decorative_sprite_priority,
        width = 71,
        height = 54,
        shift = util.by_pixel(6.75, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-03.png",
      priority = base_decorative_sprite_priority,
      width = 35,
      height = 28,
      shift = util.by_pixel(3.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-03.png",
        priority = base_decorative_sprite_priority,
        width = 70,
        height = 56,
        shift = util.by_pixel(4, -4),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-04.png",
      priority = base_decorative_sprite_priority,
      width = 37,
      height = 27,
      shift = util.by_pixel(5.5, -5.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-04.png",
        priority = base_decorative_sprite_priority,
        width = 74,
        height = 54,
        shift = util.by_pixel(5.5, -5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-05.png",
      priority = base_decorative_sprite_priority,
      width = 35,
      height = 26,
      shift = util.by_pixel(7.5, -5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-05.png",
        priority = base_decorative_sprite_priority,
        width = 71,
        height = 53,
        shift = util.by_pixel(7.75, -4.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-06.png",
      priority = base_decorative_sprite_priority,
      width = 35,
      height = 24,
      shift = util.by_pixel(4.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-06.png",
        priority = base_decorative_sprite_priority,
        width = 71,
        height = 49,
        shift = util.by_pixel(4.25, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-07.png",
      priority = base_decorative_sprite_priority,
      width = 33,
      height = 21,
      shift = util.by_pixel(4.5, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-07.png",
        priority = base_decorative_sprite_priority,
        width = 65,
        height = 42,
        shift = util.by_pixel(4.75, -2.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-08.png",
      priority = base_decorative_sprite_priority,
      width = 36,
      height = 27,
      shift = util.by_pixel(6, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-08.png",
        priority = base_decorative_sprite_priority,
        width = 70,
        height = 56,
        shift = util.by_pixel(6, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-09.png",
      priority = base_decorative_sprite_priority,
      width = 33,
      height = 24,
      shift = util.by_pixel(4.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-09.png",
        priority = base_decorative_sprite_priority,
        width = 65,
        height = 48,
        shift = util.by_pixel(4.25, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-10.png",
      priority = base_decorative_sprite_priority,
      width = 27,
      height = 21,
      shift = util.by_pixel(4.5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-10.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 42,
        shift = util.by_pixel(4.25, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-11.png",
      priority = base_decorative_sprite_priority,
      width = 25,
      height = 16,
      shift = util.by_pixel(3.5, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-11.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 33,
        shift = util.by_pixel(3.75, -2.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-12.png",
      priority = base_decorative_sprite_priority,
      width = 30,
      height = 24,
      shift = util.by_pixel(7, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-12.png",
        priority = base_decorative_sprite_priority,
        width = 59,
        height = 48,
        shift = util.by_pixel(6.75, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-13.png",
      priority = base_decorative_sprite_priority,
      width = 25,
      height = 18,
      shift = util.by_pixel(4.5, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-13.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 35,
        shift = util.by_pixel(4.75, -3.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-14.png",
      priority = base_decorative_sprite_priority,
      width = 30,
      height = 21,
      shift = util.by_pixel(4, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-14.png",
        priority = base_decorative_sprite_priority,
        width = 59,
        height = 41,
        shift = util.by_pixel(3.75, -4.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-15.png",
      priority = base_decorative_sprite_priority,
      width = 25,
      height = 18,
      shift = util.by_pixel(4.5, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-15.png",
        priority = base_decorative_sprite_priority,
        width = 50,
        height = 35,
        shift = util.by_pixel(4.5, -2.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-16.png",
      priority = base_decorative_sprite_priority,
      width = 32,
      height = 21,
      shift = util.by_pixel(5, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-16.png",
        priority = base_decorative_sprite_priority,
        width = 64,
        height = 42,
        shift = util.by_pixel(5, -2.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-17.png",
      priority = base_decorative_sprite_priority,
      width = 21,
      height = 16,
      shift = util.by_pixel(3.5, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-17.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 31,
        shift = util.by_pixel(3.75, -2.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-18.png",
      priority = base_decorative_sprite_priority,
      width = 21,
      height = 16,
      shift = util.by_pixel(5.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-18.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 32,
        shift = util.by_pixel(5.25, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/croton-19.png",
      priority = base_decorative_sprite_priority,
      width = 18,
      height = 14,
      shift = util.by_pixel(3, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/croton/hr-croton-19.png",
        priority = base_decorative_sprite_priority,
        width = 36,
        height = 30,
        shift = util.by_pixel(3, -2),
        scale = 0.5
      },
    },
  }
},
{
  name = "desert-bush",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-g[red-desert-bush]",
  collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selectable_in_game = false,
  autoplace = autoplaces["desert-bush"],
  pictures =
  {
    --gdbush
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-00.png",
      priority = base_decorative_sprite_priority,
      width = 38,
      height = 24,
      shift = util.by_pixel(10, -5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-00.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 48,
        shift = util.by_pixel(9.75, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-01.png",
      priority = base_decorative_sprite_priority,
      width = 31,
      height = 24,
      shift = util.by_pixel(4.5, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-01.png",
        priority = base_decorative_sprite_priority,
        width = 63,
        height = 48,
        shift = util.by_pixel(4.75, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-02.png",
      priority = base_decorative_sprite_priority,
      width = 33,
      height = 26,
      shift = util.by_pixel(6.5, -7),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-02.png",
        priority = base_decorative_sprite_priority,
        width = 67,
        height = 53,
        shift = util.by_pixel(6.25, -7.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-03.png",
      priority = base_decorative_sprite_priority,
      width = 32,
      height = 24,
      shift = util.by_pixel(3, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-03.png",
        priority = base_decorative_sprite_priority,
        width = 65,
        height = 49,
        shift = util.by_pixel(3.25, -2.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-04.png",
      priority = base_decorative_sprite_priority,
      width = 33,
      height = 26,
      shift = util.by_pixel(4.5, -7),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-04.png",
        priority = base_decorative_sprite_priority,
        width = 65,
        height = 51,
        shift = util.by_pixel(4.75, -7.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-05.png",
      priority = base_decorative_sprite_priority,
      width = 38,
      height = 24,
      shift = util.by_pixel(11, -5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-05.png",
        priority = base_decorative_sprite_priority,
        width = 76,
        height = 49,
        shift = util.by_pixel(11, -4.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-06.png",
      priority = base_decorative_sprite_priority,
      width = 38,
      height = 25,
      shift = util.by_pixel(8, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-06.png",
        priority = base_decorative_sprite_priority,
        width = 75,
        height = 50,
        shift = util.by_pixel(8.25, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-07.png",
      priority = base_decorative_sprite_priority,
      width = 38,
      height = 23,
      shift = util.by_pixel(5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-07.png",
        priority = base_decorative_sprite_priority,
        width = 76,
        height = 46,
        shift = util.by_pixel(5, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-08.png",
      priority = base_decorative_sprite_priority,
      width = 29,
      height = 22,
      shift = util.by_pixel(4.5, -7),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-08.png",
        priority = base_decorative_sprite_priority,
        width = 57,
        height = 44,
        shift = util.by_pixel(4.25, -7),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-09.png",
      priority = base_decorative_sprite_priority,
      width = 27,
      height = 18,
      shift = util.by_pixel(7.5, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-09.png",
        priority = base_decorative_sprite_priority,
        width = 55,
        height = 36,
        shift = util.by_pixel(7.75, -1),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-10.png",
      priority = base_decorative_sprite_priority,
      width = 26,
      height = 19,
      shift = util.by_pixel(2, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-10.png",
        priority = base_decorative_sprite_priority,
        width = 52,
        height = 37,
        shift = util.by_pixel(2.5, -4.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/desert-bush-11.png",
      priority = base_decorative_sprite_priority,
      width = 28,
      height = 20,
      shift = util.by_pixel(9, -6),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/desert-bush/hr-desert-bush-11.png",
        priority = base_decorative_sprite_priority,
        width = 57,
        height = 39,
        shift = util.by_pixel(8.75, -5.75),
        scale = 0.5
      },
    },
  }
},
{
  name = "hairy-grass",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-a[grass]-a[hairy]",
  collision_box = {{-1, -1}, {1, 1}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selectable_in_game = false,
  autoplace = autoplaces["hairy-grass"],
  pictures =
  {
    --hairyGreen
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-13.png",
      priority = base_decorative_sprite_priority,
      width = 40,
      height = 26,
      shift = util.by_pixel(4, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-13.png",
        priority = base_decorative_sprite_priority,
        width = 79,
        height = 52,
        shift = util.by_pixel(4.25, -4),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-14.png",
      priority = base_decorative_sprite_priority,
      width = 40,
      height = 21,
      shift = util.by_pixel(6, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-14.png",
        priority = base_decorative_sprite_priority,
        width = 80,
        height = 41,
        shift = util.by_pixel(6.5, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-15.png",
      priority = base_decorative_sprite_priority,
      width = 37,
      height = 34,
      shift = util.by_pixel(3.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-15.png",
        priority = base_decorative_sprite_priority,
        width = 72,
        height = 68,
        shift = util.by_pixel(3.5, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-16.png",
      priority = base_decorative_sprite_priority,
      width = 36,
      height = 19,
      shift = util.by_pixel(2, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-16.png",
        priority = base_decorative_sprite_priority,
        width = 73,
        height = 39,
        shift = util.by_pixel(1.75, -3.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-17.png",
      priority = base_decorative_sprite_priority,
      width = 29,
      height = 23,
      shift = util.by_pixel(4.5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-17.png",
        priority = base_decorative_sprite_priority,
        width = 59,
        height = 47,
        shift = util.by_pixel(4.25, -3.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-18.png",
      priority = base_decorative_sprite_priority,
      width = 24,
      height = 14,
      shift = util.by_pixel(6, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-18.png",
        priority = base_decorative_sprite_priority,
        width = 49,
        height = 29,
        shift = util.by_pixel(5.75, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-19.png",
      priority = base_decorative_sprite_priority,
      width = 45,
      height = 24,
      shift = util.by_pixel(6.5, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-19.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 48,
        shift = util.by_pixel(6.75, -2),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-06.png",
      priority = base_decorative_sprite_priority,
      width = 51,
      height = 45,
      shift = util.by_pixel(8.5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 102,
        height = 90,
        shift = util.by_pixel(9, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-07.png",
      priority = base_decorative_sprite_priority,
      width = 60,
      height = 33,
      shift = util.by_pixel(9, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 122,
        height = 67,
        shift = util.by_pixel(9, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-08.png",
      priority = base_decorative_sprite_priority,
      width = 51,
      height = 31,
      shift = util.by_pixel(0.5, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 101,
        height = 63,
        shift = util.by_pixel(0.75, -4.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-09.png",
      priority = base_decorative_sprite_priority,
      width = 41,
      height = 39,
      shift = util.by_pixel(6.5, -6.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 82,
        height = 77,
        shift = util.by_pixel(6.5, -6.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-10.png",
      priority = base_decorative_sprite_priority,
      width = 55,
      height = 38,
      shift = util.by_pixel(5.5, -5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 109,
        height = 76,
        shift = util.by_pixel(5.75, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-11.png",
      priority = base_decorative_sprite_priority,
      width = 41,
      height = 27,
      shift = util.by_pixel(4.5, -5.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 84,
        height = 52,
        shift = util.by_pixel(4.5, -5.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-12.png",
      priority = base_decorative_sprite_priority,
      width = 33,
      height = 30,
      shift = util.by_pixel(6.5, -6),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-12.png",
        priority = base_decorative_sprite_priority,
        width = 66,
        height = 60,
        shift = util.by_pixel(7, -6),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-00.png",
      priority = base_decorative_sprite_priority,
      width = 73,
      height = 60,
      shift = util.by_pixel(8.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 147,
        height = 118,
        shift = util.by_pixel(8.75, -4),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-01.png",
      priority = base_decorative_sprite_priority,
      width = 77,
      height = 46,
      shift = util.by_pixel(9.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 153,
        height = 91,
        shift = util.by_pixel(9.75, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-02.png",
      priority = base_decorative_sprite_priority,
      width = 79,
      height = 48,
      shift = util.by_pixel(5.5, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 158,
        height = 96,
        shift = util.by_pixel(5, -1),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-03.png",
      priority = base_decorative_sprite_priority,
      width = 86,
      height = 72,
      shift = util.by_pixel(3, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 172,
        height = 144,
        shift = util.by_pixel(3, -2),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-04.png",
      priority = base_decorative_sprite_priority,
      width = 81,
      height = 36,
      shift = util.by_pixel(4.5, -3),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 161,
        height = 73,
        shift = util.by_pixel(4.75, -3.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hairy-grass-05.png",
      priority = base_decorative_sprite_priority,
      width = 60,
      height = 36,
      shift = util.by_pixel(4, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/hairy-grass/hr-hairy-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 119,
        height = 72,
        shift = util.by_pixel(3.75, -4),
        scale = 0.5
      },
    },

  }
},
{
  name = "pita",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-c[pita]-a[green]",
  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  render_layer = "object",
  selectable_in_game = false,
  autoplace = autoplaces["pita"],
  pictures =
  {
    --gpita
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-00.png",
      priority = base_decorative_sprite_priority,
      width = 77,
      height = 53,
      shift = util.by_pixel(11.5, -5.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-00.png",
        priority = base_decorative_sprite_priority,
        width = 153,
        height = 104,
        shift = util.by_pixel(11.25, -5.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-01.png",
      priority = base_decorative_sprite_priority,
      width = 73,
      height = 53,
      shift = util.by_pixel(11.5, -9.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-01.png",
        priority = base_decorative_sprite_priority,
        width = 146,
        height = 104,
        shift = util.by_pixel(11.5, -9.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-02.png",
      priority = base_decorative_sprite_priority,
      width = 59,
      height = 41,
      shift = util.by_pixel(9.5, -6.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-02.png",
        priority = base_decorative_sprite_priority,
        width = 120,
        height = 83,
        shift = util.by_pixel(9.5, -6.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-03.png",
      priority = base_decorative_sprite_priority,
      width = 60,
      height = 42,
      shift = util.by_pixel(10, -6),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-03.png",
        priority = base_decorative_sprite_priority,
        width = 121,
        height = 84,
        shift = util.by_pixel(10.25, -6),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-04.png",
      priority = base_decorative_sprite_priority,
      width = 73,
      height = 47,
      shift = util.by_pixel(12.5, -9.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-04.png",
        priority = base_decorative_sprite_priority,
        width = 144,
        height = 95,
        shift = util.by_pixel(12.5, -9.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-05.png",
      priority = base_decorative_sprite_priority,
      width = 70,
      height = 46,
      shift = util.by_pixel(9, -7),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-05.png",
        priority = base_decorative_sprite_priority,
        width = 140,
        height = 92,
        shift = util.by_pixel(8.5, -7.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-06.png",
      priority = base_decorative_sprite_priority,
      width = 78,
      height = 60,
      shift = util.by_pixel(7, -7),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-06.png",
        priority = base_decorative_sprite_priority,
        width = 156,
        height = 120,
        shift = util.by_pixel(7, -7),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-07.png",
      priority = base_decorative_sprite_priority,
      width = 78,
      height = 62,
      shift = util.by_pixel(10, -5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-07.png",
        priority = base_decorative_sprite_priority,
        width = 155,
        height = 123,
        shift = util.by_pixel(10.25, -5.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-08.png",
      priority = base_decorative_sprite_priority,
      width = 81,
      height = 59,
      shift = util.by_pixel(11.5, -6.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-08.png",
        priority = base_decorative_sprite_priority,
        width = 162,
        height = 116,
        shift = util.by_pixel(11.5, -6.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-09.png",
      priority = base_decorative_sprite_priority,
      width = 62,
      height = 39,
      shift = util.by_pixel(6, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-09.png",
        priority = base_decorative_sprite_priority,
        width = 123,
        height = 78,
        shift = util.by_pixel(6.25, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-10.png",
      priority = base_decorative_sprite_priority,
      width = 50,
      height = 35,
      shift = util.by_pixel(4, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-10.png",
        priority = base_decorative_sprite_priority,
        width = 99,
        height = 70,
        shift = util.by_pixel(4.25, -4),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-11.png",
      priority = base_decorative_sprite_priority,
      width = 49,
      height = 33,
      shift = util.by_pixel(6.5, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-11.png",
        priority = base_decorative_sprite_priority,
        width = 98,
        height = 64,
        shift = util.by_pixel(6.5, -2.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-12.png",
      priority = base_decorative_sprite_priority,
      width = 49,
      height = 39,
      shift = util.by_pixel(6.5, -5.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-12.png",
        priority = base_decorative_sprite_priority,
        width = 99,
        height = 77,
        shift = util.by_pixel(6.25, -5.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-13.png",
      priority = base_decorative_sprite_priority,
      width = 55,
      height = 36,
      shift = util.by_pixel(8.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-13.png",
        priority = base_decorative_sprite_priority,
        width = 109,
        height = 71,
        shift = util.by_pixel(8.25, -4.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/pita-14.png",
      priority = base_decorative_sprite_priority,
      width = 50,
      height = 34,
      shift = util.by_pixel(7, -5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita/hr-pita-14.png",
        priority = base_decorative_sprite_priority,
        width = 100,
        height = 68,
        shift = util.by_pixel(6.5, -5),
        scale = 0.5
      },
    },
  }
},
{
  name = "pita-mini",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-d[pita-mini]-a[green]",
  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  render_layer = "decorative",
  selectable_in_game = false,
  autoplace = autoplaces["pita-mini"],
  pictures =
  {
    --pitaMini
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-00.png",
      priority = base_decorative_sprite_priority,
      width = 42,
      height = 26,
      shift = util.by_pixel(4, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-00.png",
        priority = base_decorative_sprite_priority,
        width = 83,
        height = 52,
        shift = util.by_pixel(4.25, -2),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-01.png",
      priority = base_decorative_sprite_priority,
      width = 37,
      height = 28,
      shift = util.by_pixel(4.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-01.png",
        priority = base_decorative_sprite_priority,
        width = 75,
        height = 57,
        shift = util.by_pixel(4.75, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-02.png",
      priority = base_decorative_sprite_priority,
      width = 44,
      height = 29,
      shift = util.by_pixel(5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-02.png",
        priority = base_decorative_sprite_priority,
        width = 87,
        height = 57,
        shift = util.by_pixel(4.75, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-03.png",
      priority = base_decorative_sprite_priority,
      width = 48,
      height = 31,
      shift = util.by_pixel(6, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-03.png",
        priority = base_decorative_sprite_priority,
        width = 96,
        height = 62,
        shift = util.by_pixel(6, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-04.png",
      priority = base_decorative_sprite_priority,
      width = 44,
      height = 35,
      shift = util.by_pixel(4, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-04.png",
        priority = base_decorative_sprite_priority,
        width = 87,
        height = 68,
        shift = util.by_pixel(3.75, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-05.png",
      priority = base_decorative_sprite_priority,
      width = 46,
      height = 33,
      shift = util.by_pixel(5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-05.png",
        priority = base_decorative_sprite_priority,
        width = 92,
        height = 65,
        shift = util.by_pixel(5.5, -3.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-06.png",
      priority = base_decorative_sprite_priority,
      width = 31,
      height = 22,
      shift = util.by_pixel(3.5, -1),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-06.png",
        priority = base_decorative_sprite_priority,
        width = 64,
        height = 45,
        shift = util.by_pixel(3.5, -0.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-07.png",
      priority = base_decorative_sprite_priority,
      width = 36,
      height = 20,
      shift = util.by_pixel(4, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-07.png",
        priority = base_decorative_sprite_priority,
        width = 73,
        height = 39,
        shift = util.by_pixel(3.75, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-08.png",
      priority = base_decorative_sprite_priority,
      width = 33,
      height = 23,
      shift = util.by_pixel(5.5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-08.png",
        priority = base_decorative_sprite_priority,
        width = 66,
        height = 46,
        shift = util.by_pixel(5.5, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-09.png",
      priority = base_decorative_sprite_priority,
      width = 49,
      height = 37,
      shift = util.by_pixel(5.5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-09.png",
        priority = base_decorative_sprite_priority,
        width = 97,
        height = 72,
        shift = util.by_pixel(5.75, -3.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-10.png",
      priority = base_decorative_sprite_priority,
      width = 51,
      height = 35,
      shift = util.by_pixel(4.5, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-10.png",
        priority = base_decorative_sprite_priority,
        width = 101,
        height = 71,
        shift = util.by_pixel(4.75, -4.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-11.png",
      priority = base_decorative_sprite_priority,
      width = 49,
      height = 36,
      shift = util.by_pixel(5.5, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-11.png",
        priority = base_decorative_sprite_priority,
        width = 98,
        height = 71,
        shift = util.by_pixel(5.5, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-12.png",
      priority = base_decorative_sprite_priority,
      width = 45,
      height = 31,
      shift = util.by_pixel(6.5, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-12.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 63,
        shift = util.by_pixel(6.5, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-13.png",
      priority = base_decorative_sprite_priority,
      width = 42,
      height = 31,
      shift = util.by_pixel(4, -4.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-13.png",
        priority = base_decorative_sprite_priority,
        width = 84,
        height = 64,
        shift = util.by_pixel(4.5, -4.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/pita-mini-14.png",
      priority = base_decorative_sprite_priority,
      width = 39,
      height = 29,
      shift = util.by_pixel(2.5, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/pita-mini/hr-pita-mini-14.png",
        priority = base_decorative_sprite_priority,
        width = 79,
        height = 58,
        shift = util.by_pixel(2.75, -3),
        scale = 0.5
      },
    },
  }
},
{
  name = "small-grass",
  type = "optimized-decorative",
  subgroup = "grass",
  order = "b[decorative]-a[grass]-c[small]",
  collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
  selection_box = {{-1, -1}, {1, 1}},
  selectable_in_game = false,
  autoplace = autoplaces["small-grass"],
  pictures =
  {
    --greenSmall
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-00.png",
      priority = base_decorative_sprite_priority,
      width = 60,
      height = 42,
      shift = util.by_pixel(6, -6),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-00.png",
        priority = base_decorative_sprite_priority,
        width = 122,
        height = 84,
        shift = util.by_pixel(6, -6),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-01.png",
      priority = base_decorative_sprite_priority,
      width = 51,
      height = 33,
      shift = util.by_pixel(1.5, 0.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-01.png",
        priority = base_decorative_sprite_priority,
        width = 101,
        height = 65,
        shift = util.by_pixel(1.25, 0.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-02.png",
      priority = base_decorative_sprite_priority,
      width = 43,
      height = 37,
      shift = util.by_pixel(2.5, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-02.png",
        priority = base_decorative_sprite_priority,
        width = 86,
        height = 74,
        shift = util.by_pixel(3, -2.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-03.png",
      priority = base_decorative_sprite_priority,
      width = 54,
      height = 38,
      shift = util.by_pixel(-3, -4),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-03.png",
        priority = base_decorative_sprite_priority,
        width = 106,
        height = 74,
        shift = util.by_pixel(-3, -4),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-04.png",
      priority = base_decorative_sprite_priority,
      width = 50,
      height = 34,
      shift = util.by_pixel(-2, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-04.png",
        priority = base_decorative_sprite_priority,
        width = 100,
        height = 67,
        shift = util.by_pixel(-2.5, -2.25),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-05.png",
      priority = base_decorative_sprite_priority,
      width = 58,
      height = 33,
      shift = util.by_pixel(-2, -3.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-05.png",
        priority = base_decorative_sprite_priority,
        width = 116,
        height = 65,
        shift = util.by_pixel(-2, -3.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-06.png",
      priority = base_decorative_sprite_priority,
      width = 41,
      height = 35,
      shift = util.by_pixel(2.5, -2.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-06.png",
        priority = base_decorative_sprite_priority,
        width = 81,
        height = 70,
        shift = util.by_pixel(2.75, -3),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-07.png",
      priority = base_decorative_sprite_priority,
      width = 48,
      height = 27,
      shift = util.by_pixel(-3, -1.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-07.png",
        priority = base_decorative_sprite_priority,
        width = 95,
        height = 54,
        shift = util.by_pixel(-3.25, -1.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-08.png",
      priority = base_decorative_sprite_priority,
      width = 45,
      height = 28,
      shift = util.by_pixel(-2.5, -2),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-08.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 56,
        shift = util.by_pixel(-2.75, -2.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-09.png",
      priority = base_decorative_sprite_priority,
      width = 39,
      height = 27,
      shift = util.by_pixel(0.5, -1.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-09.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 54,
        shift = util.by_pixel(0.25, -1.5),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-10.png",
      priority = base_decorative_sprite_priority,
      width = 23,
      height = 17,
      shift = util.by_pixel(6.5, -1.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-10.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 33,
        shift = util.by_pixel(6, -1.75),
        scale = 0.5
      },
    },
    {
      filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/small-grass-11.png",
      priority = base_decorative_sprite_priority,
      width = 20,
      height = 13,
      shift = util.by_pixel(3, -0.5),
      hr_version = {
        filename = "__alien-biomes__/graphics/decorative/vegetation/base/small-grass/hr-small-grass-11.png",
        priority = base_decorative_sprite_priority,
        width = 39,
        height = 26,
        shift = util.by_pixel(3.25, 0),
        scale = 0.5
      },
    },
  }
},
}
