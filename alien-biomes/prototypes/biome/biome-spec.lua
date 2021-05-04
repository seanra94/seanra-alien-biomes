-- multiply axes by variants
-- note: equal influence, higher ranges overlapping other optimal point range wins.
-- beach_weight defaults to -1
return {
  mineral = { -- and sand
    dimensions = { distribution_temperature = {0.8, 1.0} },
    axes = {
      brown      = { dimensions = {mineral_a = {0.5, 1.0}, mineral_b = {0.0, 1.0}} },
      tan        = { dimensions = {mineral_a = {0.0, 0.5}, mineral_b = {0.0, 1.0}} },
    },
    variants = {
      ["dirt-1"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.99, 1.0}} },
      ["dirt-2"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.99, 1.0}} },
      ["dirt-3"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.99, 1.0}} },
      ["dirt-4"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.99, 1.0}} },
      ["dirt-5"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.99, 1.0}} },
      ["dirt-6"]   = { transition = "beach", group = "dirt", dimensions = {distribution_moisture = {0.99, 1.0}} },
    }
  },
  vegetation = {
    dimensions = { distribution_temperature = {0.2, 0.8}, distribution_moisture = {0.0, 1.0} },
    axes = {
      green     = { dimensions = {vegetation_a = {0.0, 0.33}, vegetation_b = {0.0, 1.0}} },
      olive     = { dimensions = {vegetation_a = {0.33, 0.66}, vegetation_b = {0.0, 1.0}} },
      yellow    = { dimensions = {vegetation_a = {0.66, 1.0}, vegetation_b = {0.0, 1.0}} },
    },
    variants = {
      ["grass-1"]   = { transition = "beach", group = "grass" },
      ["grass-2"]   = { transition = "beach", group = "grass" },
      ["grass-3"]   = { transition = "beach", group = "grass", limit_axes = {"green"} },
      ["grass-4"]   = { transition = "beach", group = "grass", limit_axes = {"green"} },
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
