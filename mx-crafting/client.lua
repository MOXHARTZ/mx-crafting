ESX = nil local textstatus = true

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData() == nil do
        Citizen.Wait(100)
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    PlayerData = playerData
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(jobInf)
    PlayerData.job = jobInf
end)

Menu = function(index)
    if index then
        ESX.UI.Menu.CloseAll()
	    local elements = {}
        textstatus = false
        for _,v in pairs(MX[index].CraftItems) do
            table.insert(elements, {
                label  = v.inform.label,
                mx     = v.inform.value,
                craft = v.inform.Craft,
                craftedItem = v.inform.CraftedItem,
                count =  v.inform.count,
                anim = MX[index].config.animation
            })
        end
	    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craft', {
	    	title    = 'Crafting',
	    	align    = 'top-right',
	    	elements = elements
	    }, function(data, menu)
                menu.close()
                ESX.TriggerServerCallback('mx-crafting:hasItem', function(has) 
                    if has then
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "mx-crafting",
                            duration = 4000,
                            label = "Crafting...",
                            useWhileDead = false,
                            canCancel = false,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = data.current.anim.animDict,
                                anim = data.current.anim.anim,
                            },
                            prop = {
                                model = "",
                            }
                             }, function(status)
                                if not status then
                                    TriggerServerEvent('mx-crafting:craft', data.current.craft, data.current.craftedItem, data.current.count)
                                    textstatus = true
                                    menu.close()
                                    ClearPedTasks(PlayerPedId())
                                end
                        end)
                    else
                        textstatus = true 
                    end
                end, data.current.craft)
            end, function(data, menu)
            menu.close()
            textstatus = true
	    end)
    end
end

Citizen.CreateThread(function()
    while true do
        local sleep = 1250
        local ped = PlayerPedId()
        local pedcoords = GetEntityCoords(ped)
        for i = 1, #MX do   
            local dst = #(MX[i].config.coords - pedcoords)
            if textstatus then
                if dst <= 8.0 then
                    if MX[i].config.jobReq then
                        if PlayerData and PlayerData.job and PlayerData.job.name == MX[i].config.jobReq then
                            sleep = 3
                            DrawText3D(MX[i].config.coords.x, MX[i].config.coords.y, MX[i].config.coords.z, "~r~[E]~s~ Craft Menu")
                            if MX[i].config.ped.active then
                                DrawMarker(2, MX[i].config.ped.coords.x, MX[i].config.ped.coords.y, MX[i].config.ped.coords.z + 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                            end
                        end
                    else
                        sleep = 3
                        DrawText3D(MX[i].config.coords.x, MX[i].config.coords.y, MX[i].config.coords.z, "~r~[E]~s~ Craft Menu")
                        if MX[i].config.ped.active then
                            DrawMarker(2, MX[i].config.ped.coords.x, MX[i].config.ped.coords.y, MX[i].config.ped.coords.z + 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                        end
                    end
                end
                if dst <= 2 and IsControlJustPressed(0, 38) then
                    Menu(i)
                end
            end
        end
        Citizen.Wait(sleep)
    end    
end)

Citizen.CreateThread(function()
    for i = 1, #MX do
        if MX[i].config.ped.active then
            local cf = MX[i].config.ped
            RequestModel(cf.model)
            while not HasModelLoaded(cf.model) do Citizen.Wait(3) end
            local crafter = CreatePed(1, cf.model, cf.coords.x, cf.coords.y, cf.coords.z - 1, cf.h, 0, 0)
            SetBlockingOfNonTemporaryEvents(crafter, true)
            SetPedDiesWhenInjured(crafter, false)
            SetPedCanPlayAmbientAnims(crafter, true)
            SetPedCanRagdollFromPlayerImpact(crafter, false)
            SetEntityInvincible(crafter, true)
            FreezeEntityPosition(crafter, true)
        end
    end 
end)

Citizen.CreateThread(function()
    for i = 1, #MX do
        if MX[i].config.blip.active then
            local ff = MX[i].config.blip
            Citizen.Wait(5000)
            local blip = AddBlipForCoord(ff.coords)
            SetBlipSprite(blip, ff.sprite)
            SetBlipColour(blip, ff.color)
            SetBlipScale(blip, ff.scale)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(ff.name)
            EndTextCommandSetBlipName(blip)
            SetBlipAsShortRange(blip, true)
        end
    end
end)

function DrawText3D(x, y, z, text)
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
