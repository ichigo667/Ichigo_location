RMenu.Add('location', 'main', RageUI.CreateMenu("Location", "Choisissez votre choix de catégorie ."))
RMenu.Add('location', 'voiture', RageUI.CreateMenu("Liste des Véhicules", "Voici les propositions de Pablo"))
RMenu.Add('location', 'moto', RageUI.CreateMenu("Scooter", "Voici la proposition de Pablo"))
RMenu.Add('location', 'velo', RageUI.CreateMenu("Vélo", "Voici la proposition de Pablo"))

Citizen.CreateThread(function()
    while true do
    RageUI.IsVisible(RMenu:Get('location', 'main'), true, true, true, function()

         --------------------------------------- Sous Menu -----------------------------
        RageUI.Button("~r~Voiture", "Voir les Voitures que propose Ichigo .", { RightLabel = "→" },true, function()
        end, RMenu:Get('location', 'voiture'))
        RageUI.Button("~r~Scooter", "Voir les Motos que propose Ichigo .", { RightLabel = "→" },true, function()
        end, RMenu:Get('location', 'moto'))
        RageUI.Button("~r~Vélo", "Voir le Vélo que propose Ichigo .", { RightLabel = "→" },true, function()
        end, RMenu:Get('location', 'velo'))                                             
    end, function()
    end)

    --------------------------------------- Voiture -----------------------------

    RageUI.IsVisible(RMenu:Get('location', 'voiture'), true, true, true, function()


        RageUI.Button("~r~Panto", "Prende l'offre de la Panto .", {RightLabel = "~g~50$"}, true, function(Hovered, Active, Selected)
            if (Selected) then
            	TriggerServerEvent('buyPanto')
            	spawnCar("panto")
                RageUI.CloseAll()
            end
        end)
        RageUI.Button("~r~Futo", "Prende l'offre de la Futo .", {RightLabel = "~g~250$"}, true, function(Hovered, Active, Selected)
            if (Selected) then
            	TriggerServerEvent('buyFuto')
            	spawnCar("futo")
                RageUI.CloseAll()
            end
        end)
        RageUI.Button("~g~Retour", "Retourné au menu principal .", { RightLabel = "→" },true, function()
        end, RMenu:Get('location', 'main'))         
    end, function()
    end)

    --------------------------------------- Vélo -----------------------------

    	RageUI.IsVisible(RMenu:Get('location', 'velo'), true, true, true, function()

        RageUI.Button("~r~Vélo", "Prende l'offre du vélo que propose Pablo .", {RightLabel = "~g~15$"}, true, function(Hovered, Active, Selected)
            if (Selected) then
            	TriggerServerEvent('buyVelo')
            	spawnCar("cruiser")
                RageUI.CloseAll()
            end
        end)
        RageUI.Button("~g~Retour", "Retourné au menu principal .", { RightLabel = "→" },true, function()
        end, RMenu:Get('location', 'main'))         
    end, function()
    end)

        --------------------------------------- Moto -----------------------------
        RageUI.IsVisible(RMenu:Get('location', 'moto'), true, true, true, function()


        RageUI.Button("~r~Scooter", "Prende l'offre du scooter .", {RightLabel = "~g~25$"}, true, function(Hovered, Active, Selected)
            if (Selected) then
            	TriggerServerEvent('buyScooter')
            	spawnCar("faggio2")
                RageUI.CloseAll()
            end
        end)
        RageUI.Button("~g~Retour", "Retourné au menu principal .", { RightLabel = "→" },true, function()
        end, RMenu:Get('location', 'main'))         
end, function()
        end, 1)
        Citizen.Wait(0)
    end
end)

--- Menu Location a la positon

    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        while true do
            Wait(0)
    
                if Vdist2(GetEntityCoords(PlayerPedId(), false), -242.52, -342.58, 30.0) < 1.0 then
                          RageUI.Text({
                            message = "Appuyer sur ~w~[~g~E~w~] pour intéragir avec ~r~Ichigo",
                            time_display = 1
                        })
                            if IsControlJustPressed(1, 51) then
                                RageUI.Visible(RMenu:Get('location', 'main'), not RageUI.Visible(RMenu:Get('location', 'main')))
                            end
                        end
                    end    
            end)

--- Notification

function notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

--- Function pour faire spawn la voiture

spawnCar = function(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, -255.43, -345.08, 29.89, 5.94, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "LOCATION")
end

-- Blips

local blips = {
    {title="La location de Pablo", colour=46, id=304, x = -242.52, y = -342.58, z = 30.0}
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

--- Peds 

local v1 = vector3(-242.52, -342.58, 30.0)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Ichigo")
		end
	end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_soucent_02")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
	ped = CreatePed("PED_TYPE_CIVMALE", "a_m_m_soucent_02", -242.52, -342.58, 29.0, 41.23, true, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
end)











-----By !chigo#0477