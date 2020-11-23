ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local textstatus = true

menu = function()
            ESX.UI.Menu.CloseAll()
			local elements = {}
            textstatus = false
            for k,v in pairs(MX) do
                table.insert(elements, {
                    label  = v.inform.label,
                    mx     = v.inform.value,
                    craft = v.inform.Craft,
                    craftedItem = v.inform.CraftedItem,
                    count =  v.inform.count
                })
            end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
				title    = ('MX-Crafting'),
				align    = 'top-right',
				elements = elements
			}, function(data, menu)
                menu.close()
                    TriggerEvent("mythic_progbar:client:progress", {
                    name = "mx-crafting",
                    duration = 4000,
                    label = "Eşya craftlıyorsun",
                    useWhileDead = false,
                    canCancel = false,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "amb@prop_human_bum_bin@base",
                        anim = "base",
                    },
                    prop = {
                        model = "",
                    }
                     }, function(status)
                        if not status then
                            TriggerServerEvent('mx-crafting:craft', #data.current.craft, data.current.craft, data.current.craftedItem, data.current.count)
                            textstatus = true
                            menu.close()
                            ClearPedTasks(PlayerPedId())
                        end
                    end)
                end, function(data, menu)
                menu.close()
                textstatus = true
			end)
end

local sleep = 2000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(sleep)
        perform = true
        local ped = PlayerPedId()
        local pedcoords = GetEntityCoords(ped)
        local dst = GetDistanceBetweenCoords(pedcoords, Cfg.pos.x, Cfg.pos.y, Cfg.pos.z, true)
    if textstatus == true then
        if dst <= 8 then
            perform = false
            DrawText3DMX(Cfg.pos.x, Cfg.pos.y, Cfg.pos.z, "Esya craftlamak icin ~r~[E]~s~ bas")
        end
        if dst <= 2 and IsControlJustPressed(0, 38) then
            menu()
        end
    end

        if perform then
            sleep = 2000
        end

        if not perform then
            sleep = 7
        end
    end    
end)

if Cfg.ped then
    Citizen.CreateThreadNow(function()
           RequestModel(0x0703F106)
           while not HasModelLoaded(0x0703F106) do
               Wait(7)
           end

           local crafter = CreatePed(1, 0x0703F106, Cfg.pos.x, Cfg.pos.y, Cfg.pos.z - 1, Cfg.pos.h, false, true)
           SetBlockingOfNonTemporaryEvents(crafter, true)
           SetPedDiesWhenInjured(crafter, false)
           SetPedCanPlayAmbientAnims(crafter, true)
           SetPedCanRagdollFromPlayerImpact(crafter, false)
           SetEntityInvincible(crafter, true)
           FreezeEntityPosition(crafter, true)
    end)
end

if Cfg.blip then
    Citizen.CreateThreadNow(function ()
            Citizen.Wait(5000)
            bb = AddBlipForCoord(Cfg.pos.x, Cfg.pos.y, Cfg.pos.z)
            SetBlipSprite(bb, 89)
            SetBlipColour(bb, 1)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Crafter")
            EndTextCommandSetBlipName(bb)
            SetBlipAsShortRange(bb, true)
    end)
end

function DrawText3DMX(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end