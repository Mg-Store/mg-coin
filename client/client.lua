local activeAreas = {}
local itemTimers = {}
local areaEntered = {}

function isPlayerInArea(points, playerCoords)
    local x, y = playerCoords.x, playerCoords.y
    local inside = false
    local j = #points

    for i = 1, #points do
        local xi, yi = points[i].x, points[i].y
        local xj, yj = points[j].x, points[j].y

        local intersect = ((yi > y) ~= (yj > y)) and (x < (xj - xi) * (y - yi) / (yj - yi) + xi)
        if intersect then
            inside = not inside
        end
        j = i
    end

    return inside
end

CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for id, area in pairs(Config.Areas) do
            local isInArea = isPlayerInArea(area.points, playerCoords)

            if isInArea and not activeAreas[id] then
                activeAreas[id] = true
                areaEntered[id] = GetGameTimer()
                TriggerEvent('ox_lib:notify', {type = 'success', description = area.notify.enter})
                TriggerEvent('ox_lib:notify', {type = 'inform', description = area.notify.alert})

                StartItemTimer(id, area)
            elseif not isInArea and activeAreas[id] then
                activeAreas[id] = false
                areaEntered[id] = nil
                itemTimers[id] = nil
                TriggerEvent('ox_lib:notify', {type = 'error', description = area.notify.exit})
            end
        end

        Wait(1000)
    end
end)

function StartItemTimer(id, area)
    if not itemTimers[id] then
        itemTimers[id] = CreateThread(function()
            local entryTime = areaEntered[id]
            if entryTime then
                local delay = area.interval - (GetGameTimer() - entryTime)
                if delay > 0 then
                    Wait(delay)
                end
            end

            while activeAreas[id] do
                TriggerServerEvent('qb-core:addItem', area.item, area.amount)
                Wait(area.interval)
            end

            itemTimers[id] = nil
        end)
    end
end

CreateThread(function()
    for id, area in pairs(Config.Areas) do
        if area.showBlip then
            local blip = AddBlipForCoord(area.blip.coords)
            SetBlipSprite(blip, area.blip.icon)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, area.blip.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(area.blip.name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)
