Cfg = {}

Cfg.blip = true                 -- Blip olsun mu
Cfg.ped = true                  -- Ped olsun mu
Cfg.pos = {x = 1000.32, y = -103.89, z = 73.95, h = 121.65}     -- Pedin ve blipin yeri.

MX = {
    ['Pistol'] = {
        inform = {
            label = "Silah craftla",    -- Menüde gözükecek olan isim
            value = "pistol",           -- Bir değer girin özel harf olmasın.
            CraftedItem = "WEAPON_COMBATPISTOL",                -- Craftlayınca vericek item
            count = 1,                                          -- Craftlayınca kaç tane verilsin
            Craft = { -- Maksimum 4 eşya arttırabilirsiniz !
                [1] = {
                    reqitem = "demir",                              -- Craftlamak için gerekli item
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
                -- [4] = {                                      -- Maksimum 4 !
                --     reqitem = "armor",
                --     count = 1,
                -- }
            }
        }
    },
    ['Zırh'] = {
        inform = {
            label = "Zırh craftla",
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
