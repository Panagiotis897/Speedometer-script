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
        local rpm = GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1), false))
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(" KMH " .. math.floor(speed), 0.78, 0.8)
            text("Fuel " .. math.floor(fuel), 0.8, 0.70)
            if gear == 0 then
                text("Gear " .. "R", 0.03, 0.6)
            else
                text("Gear " .. gear, 0.03, 0.6)
            end
            text("RPM " .. math.floor(rpm * 8000), 0.02, 0.7)
        end
    end
end)
