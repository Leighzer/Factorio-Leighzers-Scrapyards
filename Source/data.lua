local resource_autoplace = require("resource-autoplace")

if not leighzermods then --generic mod variable to store information that may be needed later
    leighzermods = {}        
end

if not leighzermods.leighzerscrapyards then
    leighzermods.leighzerscrapyards = {}    
end

if not leighzermods.leighzerscrapyards.productivityEnabledRecipes then --list of recipe names that are going to get productivity modules enabled
    leighzermods.leighzerscrapyards.productivityEnabledRecipes = {}
end

data:extend(
{   
   {--prototype for the actual ore object that is in the ground
    type = "resource",
    name = "scrap-ore",
    icon = "__leighzerscrapyards__/graphics/icons/scrap-ore.png",
    icon_size = 64,
    flags = {"placeable-neutral"},
    order="x-b",
    map_color = {r=120, g=120, b=120},--color used for ore patch when viewed from mini map
    minable =
    {     
      mining_particle = "scrap-ore-particle",
      mining_time = 1,
      result = "scrap-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "scrap-ore",
      order = "z",
      base_density = 10,
      has_starting_area_placement = true,    
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 22 / 3
    },
    
    stage_counts = {15000, 7500, 2500, 500, 100},
    stages =
    {
      sheet =
      {
        filename = "__leighzerscrapyards__/graphics/entity/scrap-ore/hr-scrap-ore.png",
        priority = "extra-high",
        size = 128,
        scale = 0.5,
        frame_count = 1,
        variation_count = 5,
        -- hr_version = --only have gfx for one version
        -- {
        --   filename = "__leighzerscrapyards__/graphics/entity/scrap-ore/hr-scrap-ore.png",
        --   priority = "extra-high",
        --   size = 128,
        --   frame_count = 1,
        --   variation_count = 5,
        --   scale = 0.5
        -- }
      }
    },
    leighzermorphite = {
      disabled = true,
    }
  },
  {--prototype for particles that fly out when you hand mine the ore in the ground    
  type = "optimized-particle",
  name = "scrap-ore-particle",    
  life_time = 180,
  pictures =
    {
      {
        filename = "__leighzerscrapyards__/graphics/particle/scrap-ore-particle/scrap-ore-particle-1.png",         
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1
      },
      {
        filename = "__leighzerscrapyards__/graphics/particle/scrap-ore-particle/scrap-ore-particle-2.png",         
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1
      },
      {
        filename = "__leighzerscrapyards__/graphics/particle/scrap-ore-particle/scrap-ore-particle-3.png",         
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1
      },
      {
        filename = "__leighzerscrapyards__/graphics/particle/scrap-ore-particle/scrap-ore-particle-4.png",         
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1
      }
    },
    shadows =
    {
      {
        filename = "__leighzerscrapyards__/graphics/particle/scrap-ore-particle/scrap-ore-particle-shadow-1.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1
      },
      {
        filename = "__leighzerscrapyards__/graphics/particle/scrap-ore-particle/scrap-ore-particle-shadow-2.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1
      },
      {
        filename = "__leighzerscrapyards__/graphics/particle/scrap-ore-particle/scrap-ore-particle-shadow-3.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1
      },
      {
        filename = "__leighzerscrapyards__/graphics/particle/scrap-ore-particle/scrap-ore-particle-shadow-4.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        frame_count = 1
      }
    }
  },
  {--autoplace-control = new game mapgen menu item to toggle ore generation options (frequency,size,richness,etc.)
    type = "autoplace-control",
    name = "scrap-ore",
    richness = true,
    order = "x-b",
    category="resource"
  },
  {
    type = "noise-layer",
    name = "scrap-ore"
  },
  {--prototype for object that gets stored in inventory when ore is mined
    type = "item",
    name = "scrap-ore",
    icon = "__leighzerscrapyards__/graphics/icons/scrap-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__leighzerscrapyards__/graphics/icons/scrap-ore.png",   scale = 0.25, mipmap_count = 4 },
      -- { size = 64, filename = "__leighzerscrapyards__/graphics/icons/scrap-ore-1.png", scale = 0.25, mipmap_count = 4 },
      -- { size = 64, filename = "__leighzerscrapyards__/graphics/icons/scrap-ore-2.png", scale = 0.25, mipmap_count = 4 },
      -- { size = 64, filename = "__leighzerscrapyards__/graphics/icons/scrap-ore-3.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "x-b",
    stack_size = 50,
  },
  {
    type = "recipe",
    name = "scrap-processing",
    energy_required = 5,
    enabled = true,
    category = "advanced-crafting",
    ingredients = {{"scrap-ore", 10}},
    icon = "__leighzerscrapyards__/graphics/icons/scrap-ore.png",
    icon_size = 64,
    results = {{"iron-plate",4},{"iron-gear-wheel",2},{"copper-plate",3},{"copper-cable",3},{"electronic-circuit",1}},
    subgroup = "raw-material",
    order = "c[scrap-ore]"
  },
  {
    type = "recipe",
    name = "iron-gear-wheel-reclamation",
    energy_required = 2,
    enabled = true,
    category = "advanced-crafting",
    ingredients = {{"iron-gear-wheel",2}},
    icons = {{icon="__leighzerscrapyards__/graphics/icons/recycle.png",icon_size=64}, {icon="__base__/graphics/icons/iron-plate.png",icon_size=64}},
    results = {{"iron-plate",1}},
    subgroup = "raw-material",
    order = "d-a-a[gear-wheel-reclamation]",
    main_product = "",    
  },
  {
    type = "recipe",
    name = "electronic-circuit-reclamation",
    energy_required = 8,
    enabled = true,
    category = "advanced-crafting",
    ingredients = {{"electronic-circuit",8}},
    icons = {{icon="__leighzerscrapyards__/graphics/icons/recycle.png",icon_size=64}, {icon="__base__/graphics/icons/iron-plate.png",icon_size=64}, {icon="__base__/graphics/icons/copper-cable.png",icon_size=64,scale=0.35}},
    results = {{"iron-plate",2}, {"copper-cable",3}},
    subgroup = "raw-material",
    order = "d-a-c[electronic-circuit-reclamation]",
    main_product = "",
  },
  {
    type = "recipe",
    name = "copper-cable-reclamation",
    energy_required = 8,
    enabled = true,
    category = "advanced-crafting",
    ingredients = {{"copper-cable",8}},
    icons = {{icon="__leighzerscrapyards__/graphics/icons/recycle.png",icon_size=64}, {icon="__base__/graphics/icons/copper-plate.png",icon_size=64}},
    results = {{"copper-plate",1}},
    subgroup = "raw-material",
    order = "d-a-b[copper-cable-reclamation]",
    main_product = "",
  },
  {
    type = "recipe",
    name = "scrap-iron-plate",
    energy_required = 10,
    enabled = true,
    category = "advanced-crafting",
    ingredients = {{"iron-plate", 36}},
    icons = {{icon="__leighzerscrapyards__/graphics/icons/recycle.png",icon_size=64}, {icon="__leighzerscrapyards__/graphics/icons/scrap-ore.png",icon_size=64,scale=0.35}},
    results = {{"scrap-ore",5}},
    subgroup = "raw-material",
    order = "d-b-a[scrap-iron-plate]",
    main_product = "",
  },
  {
    type = "recipe",
    name = "scrap-copper-plate",
    energy_required = 10,
    enabled = true,
    category = "advanced-crafting",
    ingredients = {{"copper-plate", 24}},
    icons = {{icon="__leighzerscrapyards__/graphics/icons/recycle.png",icon_size=64}, {icon="__leighzerscrapyards__/graphics/icons/scrap-ore.png",icon_size=64, scale=0.35}},
    results = {{"scrap-ore",5}},
    subgroup = "raw-material",
    order = "d-b-b[scrap-iron-plate-copper-plate]",
    main_product = "",    
  },
})

table.insert(leighzermods.leighzerscrapyards.productivityEnabledRecipes, 'scrap-processing')
table.insert(leighzermods.leighzerscrapyards.productivityEnabledRecipes, 'iron-gear-wheel-reclamation')
table.insert(leighzermods.leighzerscrapyards.productivityEnabledRecipes, 'electronic-circuit-reclamation')
table.insert(leighzermods.leighzerscrapyards.productivityEnabledRecipes, 'copper-cable-reclamation')
table.insert(leighzermods.leighzerscrapyards.productivityEnabledRecipes, 'scrap-iron-plate')
table.insert(leighzermods.leighzerscrapyards.productivityEnabledRecipes, 'scrap-copper-plate')