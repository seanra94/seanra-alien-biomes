-- multiply axes by variants
-- note: equal influence, higher ranges overlapping other optimal point range wins.
-- beach_weight defaults to -1
return {
  mineral = { -- and sand
    dimensions = { distribution_temperature = {0.84, 1.0} },
    axes = {
      brown      = { dimensions = {mineral_a = {0.5, 1.0}, mineral_b = {0.0, 0.5}} },
      tan        = { dimensions = {mineral_a = {0.0, 0.5}, mineral_b = {0.0, 0.5}} },
    },
    variants = {
      ["dirt-1"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.3, 0.5}} },
      ["dirt-2"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.4, 0.6}} },
      ["dirt-3"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.5, 0.7}} },
      ["dirt-4"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.6, 1.0}} },
      ["dirt-5"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.0, 0.3}}, beach_weight = 1  },
      ["dirt-6"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.0, 0.3}}, beach_weight = 1  },
      ["sand-1"]   = { transition = "beach", group = "sand", dimensions = {distribution_moisture = {0.0, 0.0}} },
      ["sand-2"]   = { transition = "beach", group = "sand", dimensions = {distribution_moisture = {0.0, 0.0}} },
      ["sand-3"]   = { transition = "beach", group = "sand", dimensions = {distribution_moisture = {0.0, 0.0}} },
    }
  },
  vegetation = {
    dimensions = { distribution_temperature = {0.2, 1.0}, distribution_moisture = {0.0, 1.0} },
    axes = {
      green     = { dimensions = {vegetation_a = {0.0, 0.6}, vegetation_b = {0.0, 1.0}} },
      olive     = { dimensions = {vegetation_a = {0.6, 0.8}, vegetation_b = {0.0, 1.0}} },
      yellow    = { dimensions = {vegetation_a = {0.8, 0.9}, vegetation_b = {0.5, 1.0}} },
    },
    variants = {
      ["grass-1"]   = { transition = "beach", group = "grass" },
      ["grass-2"]   = { transition = "beach", group = "grass" },
      ["grass-3"]   = { transition = "beach", group = "grass", limit_axes = {"green"} },
      ["grass-4"]   = { transition = "beach", group = "grass", limit_axes = {"green"} },
    }
  },
  volcanic = {
    dimensions = { distribution_temperature = {1.0, 1.0}},
    axes = {
      orange     = { dimensions = {volcanic_b = {1.0, 1.0}}},
      green      = { dimensions = {volcanic_b = {1.0, 1.0}}},
      blue       = { dimensions = {volcanic_b = {1.0, 1.0}}},
      purple     = { dimensions = {volcanic_b = {1.0, 1.0}}},
    },
    variants = {
      ["heat-1"]     = { transition = "cliff", group = "volcanic", dimensions = {volcanic_a = {1.0, 1.0}}, beach_weight = 0 },
      ["heat-2"]     = { transition = "cliff", group = "volcanic", dimensions = {volcanic_a = {1.0, 1.0}}, },
      ["heat-3"]     = { transition = "cliff", group = "volcanic", dimensions = {volcanic_a = {1.0, 1.0}}, },
      ["heat-4"]     = { transition = "cliff", group = "volcanic", dimensions = {volcanic_a = {1.0, 1.0}}, },
    }
  },
  frozen = {
    dimensions = { distribution_temperature = {0.0, 0.2}},
    variants = {
      ["snow-0"]   = { transition = "cliff", group = "frozen", tags={"snow"} }, -- legacy powder
      ["snow-1"]   = { transition = "cliff", group = "frozen", tags={"snow"} }, -- powder
      ["snow-2"]   = { transition = "cliff", group = "frozen", tags={"snow"} }, -- hard lumpy snow
      ["snow-3"]   = { transition = "cliff", group = "frozen", tags={"snow"} }, -- hard snow
      ["snow-4"]   = { transition = "cliff", group = "frozen", tags={"snow"} }, -- rough snow (melting?)
      ["snow-5"]   = { transition = "cliff", group = "frozen", tags={"ice"}, beach_weight = 1 }, -- light ice light cracks (water)
      ["snow-6"]   = { transition = "cliff", group = "frozen", tags={"ice"}, beach_weight = 1 }, -- dark ice light cracks
      ["snow-7"]   = { transition = "cliff", group = "frozen", tags={"ice"}, }, -- smooth ice
      ["snow-8"]   = { transition = "cliff", group = "frozen", tags={"ice"}, }, -- light lumpy ice
      ["snow-9"]   = { transition = "cliff", group = "frozen", tags={"ice"}, beach_weight = 1 }, -- light ice dark cracks (inland)
    }
  }
}
-- split on water? ice can only go in high humidity or low elevation areas (except ice-8 for variation)
-- snow-5 is the water ice (water light makes cracks light)
