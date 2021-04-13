ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('mx-crafting:hasItem', function(source, cb, Craft)
    local xPlayer = ESX.GetPlayerFromId(source)
    local heart = 0
    for i = 1, #Craft do
        if xPlayer.getInventoryItem(Craft[i].reqitem) and xPlayer.getInventoryItem(Craft[i].reqitem).count >= Craft[i].count then
            heart = heart + 1
        else
            xPlayer.showNotification("There is not enough material. Material : "..Craft[i].reqitem..' Material amount : '..Craft[i].count)
            cb(false)
            break
        end
    end
    if heart >= #Craft then
        cb(true)
    end
end)

RegisterServerEvent('mx-crafting:craft')
AddEventHandler('mx-crafting:craft', function(Craft, craftedItem, craftedItemcount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    for n = 1, #Craft do
        xPlayer.removeInventoryItem(Craft[n].reqitem, Craft[n].count)
    end
    xPlayer.addInventoryItem(craftedItem, craftedItemcount)
end)
