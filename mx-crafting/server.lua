ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('mx-crafting:craft')
AddEventHandler('mx-crafting:craft', function(z, a, craftedItem, craftedItemcount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if z == 1 then
        if xPlayer.getInventoryItem(a[1].reqitem).count >= a[1].count then
            xPlayer.removeInventoryItem(a[1].reqitem, a[1].count)
            xPlayer.addInventoryItem(craftedItem, craftedItemcount)
            xPlayer.showNotification("Crafted Item !")
        else
            xPlayer.showNotification("There is not enough material.")
        end
    elseif z == 2 then
        if xPlayer.getInventoryItem(a[1].reqitem).count >= a[1].count and xPlayer.getInventoryItem(a[2].reqitem).count >= a[2].count then
            xPlayer.removeInventoryItem(a[1].reqitem, a[1].count)
            xPlayer.removeInventoryItem(a[2].reqitem, a[2].count)
            xPlayer.addInventoryItem(craftedItem, craftedItemcount)
            xPlayer.showNotification("Crafted Item !")
        else
            xPlayer.showNotification("There is not enough material.")
        end
    elseif z == 3 then
        if xPlayer.getInventoryItem(a[1].reqitem).count >= a[1].count and xPlayer.getInventoryItem(a[2].reqitem).count >= a[2].count and xPlayer.getInventoryItem(a[3].reqitem).count >= a[3].count then
            xPlayer.removeInventoryItem(a[1].reqitem, a[1].count)
            xPlayer.removeInventoryItem(a[2].reqitem, a[2].count)
            xPlayer.removeInventoryItem(a[3].reqitem, a[3].count)
            xPlayer.addInventoryItem(craftedItem, craftedItemcount)
            xPlayer.showNotification("Crafted Item !")
        else
            xPlayer.showNotification("There is not enough material.")
        end
    elseif z == 4 then
        if xPlayer.getInventoryItem(a[1].reqitem).count >= a[1].count and xPlayer.getInventoryItem(a[2].reqitem).count >= a[2].count and xPlayer.getInventoryItem(a[3].reqitem).count >= a[3].count and xPlayer.getInventoryItem(a[4].reqitem).count >= a[4].count then
            xPlayer.removeInventoryItem(a[1].reqitem, a[1].count)
            xPlayer.removeInventoryItem(a[2].reqitem, a[2].count)
            xPlayer.removeInventoryItem(a[3].reqitem, a[3].count)
            xPlayer.removeInventoryItem(a[4].reqitem, a[4].count)
            xPlayer.addInventoryItem(craftedItem, craftedItemcount)
            xPlayer.showNotification("Crafted Item !")
        else
            xPlayer.showNotification("There is not enough material.")
        end
    end
end)
