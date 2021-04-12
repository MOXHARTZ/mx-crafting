Cfg = {}

Cfg.blip = true                 -- true active false deactive
Cfg.ped = true                  -- true active false deactive
Cfg.pos = {x = 1000.32, y = -103.89, z = 73.95, h = 121.65}     -- Ped, blip and craft coords.

MX = {
    ['Pistol'] = {
        inform = {
            label = "Weapon Craft",    -- Menu name
            value = "pistol",           -- any value
            CraftedItem = "WEAPON_COMBATPISTOL",                -- Get craft item
            count = 1,                                          -- Craft item count
            Craft = { -- Maksimum 4 eşya arttırabilirsiniz !
                [1] = {
                    reqitem = "demir",                              -- Req items. MAX 4 !
                    count = 1,
                },
                [2] = {
                    reqitem = "altin",
                    count = 1,
                },
                [3] = {
                    reqitem = "armor",
                    count = 1,
                }
                -- [4] = {                                      
                --     reqitem = "armor",
                --     count = 1,
                -- }
            }
        }
    },
    ['Zırh'] = {
        inform = {
            label = "Armor Craft",
            value = "armor",
            CraftedItem = "heavyarmor",
            count = 1,
            Craft = {
                [1] = {
                    reqitem = "kumas",
                    count = 1,
                },
                [2] = {
                    reqitem = "smallarmor",
                    count = 1,
                },
                [3] = {
                    reqitem = "armor",
                    count = 1,
                }
            }
        }
    }
}
