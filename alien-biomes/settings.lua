local allowed_values = function() return {"Enabled", "Disabled"} end
data:extend{
    {
        type = "string-setting",
        name = "alien-biomes-disable-vegetation",
        setting_type = "startup",
        default_value = "Disabled",
        allowed_values = allowed_values(),
        order = "h"
    },
    {
        type = "string-setting",
        name = "alien-biomes-remove-obsolete-tiles",
        setting_type = "startup",
        default_value = "Disabled",
        allowed_values = allowed_values(),
        order = "i"
    },
    {
        type = "int-setting",
        name = "tile-speed-reduction",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 0,
        maximum_value = 100,
        order = "z-a"
    },

}
local biome_settings = {
  "dirt-brown",
  "dirt-tan",
  "frozen",
  "grass-green",
  "grass-olive",
  "grass-yellow",
  "sand-brown",
  "sand-tan"
}
for _, setting in pairs(biome_settings) do
  data:extend({{
      type = "string-setting",
      name = "alien-biomes-include-"..setting,
      setting_type = "startup",
      default_value = "Enabled",
      allowed_values = allowed_values(),
      order = "t-" .. setting
  }})
end
data:extend({{
    type = "string-setting",
    name = "alien-biomes-include-inland-shallows",
    setting_type = "startup",
    default_value = "Enabled",
    allowed_values = allowed_values(),
    order = "t-z-a-wetland"
}})
data:extend({{
    type = "string-setting",
    name = "alien-biomes-include-coastal-shallows",
    setting_type = "startup",
    default_value = "Enabled",
    allowed_values = allowed_values(),
    order = "t-z-b-shallows"
}})

data:extend({{
    type = "string-setting",
    name = "alien-biomes-include-rivers",
    setting_type = "startup",
    default_value = "Disabled",
    allowed_values = allowed_values(),
    order = "t-z-b-shallows"
}})
