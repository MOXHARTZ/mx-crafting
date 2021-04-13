MX = {
    [1] = {
        config = {
            jobReq = "police",                              -- Jobname or false or nil. 
            coords = vec3(1000.32, -103.89, 73.95),         -- DrawText3D coords
            blip = { -- https://docs.fivem.net/docs/game-references/blips/
                active = true,
                coords = vec3(1000.32, -103.89, 73.95),
                name = 'Crafter',
                sprite = 89,
                color = 1,
                scale = 0.5
            },
            ped = { -- https://docs.fivem.net/docs/game-references/ped-models/
                active = true,
                coords = vec3(1000.32, -103.89, 73.95),
                h = 121.65,
                model = `a_m_m_afriamer_01`
            },
            animation = {
                animDict = 'amb@prop_human_bum_bin@base',
                anim = "base",
            },
        },
        CraftItems = {
            ['Pistol'] = {
                inform = {                          
                    label = "Screw",                                -- Menu name
                    value = "screwdriverset",                       -- any value
                    CraftedItem = "screwdriverset",                 -- Get craft item
                    count = 1,                                      -- Craft item count
                    Craft = { 
                        [1] = {
                            reqitem = "copper",                      -- NOT LIMIT XD
                            count = 1,
                        },
                        [2] = {
                            reqitem = "iron",
                            count = 1,
                        }
                    }
                }
            },
            ['?'] = {
                inform = {                          
                    label = "COMBAT PISTOL",                                -- Menu name
                    value = "pistol",                       -- any value
                    CraftedItem = "weapon_combatpistol",                 -- Get craft item
                    count = 1,                                      -- Craft item count
                    Craft = { 
                        [1] = {
                            reqitem = "metalscrap",                      -- NOT LIMIT XD
                            count = 1,
                        },
                        [2] = {
                            reqitem = "steel",
                            count = 1,
                        }
                    }
                }
            },
        },
    },
    -- [2] = {
    --     config = {
    --         jobReq = false,                              -- Jobname or false or nil. 
    --         coords = vec3(823.31, -161.65, 73.89),         -- DrawText3D coords
    --         blip = { -- https://docs.fivem.net/docs/game-references/blips/
    --             active = true,
    --             coords = vec3(823.31, -161.65, 73.89),
    --             name = 'crafter v2',
    --             sprite = 89,
    --             color = 1,
    --             scale = 0.5
    --         },
    --         ped = { -- https://docs.fivem.net/docs/game-references/ped-models/
    --             active = true,
    --             coords = vec3(823.31, -161.65, 73.89),
    --             h = 111.5,
    --             model = `a_m_m_afriamer_01`
    --         },
    --         animation = {
    --             animDict = 'amb@prop_human_bum_bin@base',
    --             anim = "base",
    --         },
    --     },
    --     CraftItems = {
    --         ['Pistol'] = {
    --             inform = {                          
    --                 label = "AAAA ...",                                -- Menu name
    --                 value = "screwdriverset",                       -- any value
    --                 CraftedItem = "screwdriverset",                 -- Get craft item
    --                 count = 1,                                      -- Craft item count
    --                 Craft = { 
    --                     [1] = {
    --                         reqitem = "copper",                      -- NOT LIMIT XD
    --                         count = 1,
    --                     },
    --                     [2] = {
    --                         reqitem = "iron",
    --                         count = 1,
    --                     }
    --                 }
    --             }
    --         },
    --     },
    -- }
}

-- MX = {
    
--     ['Zırh'] = {
--         inform = {
--             label = "Armor Craft",
--             value = "armor",
--             CraftedItem = "heavyarmor",
--             count = 1,
--             Craft = {
--                 [1] = {
--                     reqitem = "kumas",
--                     count = 1,
--                 },
--                 [2] = {
--                     reqitem = "smallarmor",
--                     count = 1,
--                 },
--                 [3] = {
--                     reqitem = "armor",
--                     count = 1,
--                 }
--             }
--         }
--     }
-- }
