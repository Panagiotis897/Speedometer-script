function text(content, x, y)
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(1.9, 1.9)
    SetTextEntry("STRING")
    AddTextComponentString(content)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local speed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6)
        local fuel = GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1)))
        local gear = GetVehicleCurrentGear(GetVehiclePedIsIn(GetPlayerPed(-1), false))
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text("Speed " .. math.floor(speed), 0.87, 0.65)
            text("Fuel " .. math.floor(fuel), 0.87, 0.70)
            text("Gear " .. gear, 0.87, 0.8)
        end
    end
end)
