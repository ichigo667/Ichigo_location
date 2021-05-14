ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buyPanto')
AddEventHandler('buyPanto', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 50
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= price then
    
    xPlayer.removeMoney(price)
         TriggerClientEvent('esx:showNotification', source, "~b~Vous avez payez ~g~50$ ~w~!")
         TriggerClientEvent('esx:showNotification', source, "~b~Votre véhicule est ~g~pret~b~ sur le parking ~w~. Bonne route !")
    else
        local xMoney = xPlayer.removeMoney(50)
         TriggerClientEvent('esx:showNotification', source, "~r~Vous devez ~g~50$ ~r~a votre banque")
    end
end)

RegisterNetEvent('buyFuto')
AddEventHandler('buyFuto', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local prix = 250
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= prix then
    
    xPlayer.removeMoney(prix)
         TriggerClientEvent('esx:showNotification', source, "~b~Vous avez payez ~g~250$ ~w~!")
         TriggerClientEvent('esx:showNotification', source, "~b~Votre véhicule est ~g~pret~b~ sur le parking ~w~. Bonne route !")

    else
        local xMoney = xPlayer.removeMoney(250)
         TriggerClientEvent('esx:showNotification', source, "~r~Vous devez ~g~250$ ~r~a votre banque")
    end
end)

RegisterNetEvent('buyScooter')
AddEventHandler('buyScooter', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= price then
    
    xPlayer.removeMoney(price)
         TriggerClientEvent('esx:showNotification', source, "~b~Vous avez payez ~g~25$ ~w~!")
         TriggerClientEvent('esx:showNotification', source, "~b~Votre scooter est ~g~pret~b~ sur le parking ~w~. Bonne route !")
    else
        local xMoney = xPlayer.removeMoney(25)
         TriggerClientEvent('esx:showNotification', source, "~r~Vous devez ~g~25$ ~r~a votre banque")
    end
end)

RegisterNetEvent('buyVelo')
AddEventHandler('buyVelo', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 15
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= price then

    xPlayer.removeMoney(price)
         TriggerClientEvent('esx:showNotification', source, "~b~Vous avez payez ~g~15$ ~w~!")
         TriggerClientEvent('esx:showNotification', source, "~b~Votre vélo est ~g~pret~b~ sur le parking ~w~. Bonne route !")
    else
        local xMoney = xPlayer.removeMoney(15)
         TriggerClientEvent('esx:showNotification', source, "~r~Vous devez ~g~15$ ~r~a votre banque")
    end
end)





-----By !chigo#0477