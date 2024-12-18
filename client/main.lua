Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        local Wheels = GetVehicleWheelType(vehicle)
        if vehicle and vehicle ~= 0 then
            local isOnNoGrip = false
            for i = 0, 3 do
                local surfaceMaterial = GetVehicleWheelSurfaceMaterial(vehicle, i)
                if surfaceMaterial then
                    print("Roda", i, "está em uma superfície:", surfaceMaterial, "e um pneu:", Wheels)
                end
                if (surfaceMaterial == 42 or surfaceMaterial == 35 or surfaceMaterial == 32 or surfaceMaterial == 48 or surfaceMaterial == 21 or surfaceMaterial == 18 or surfaceMaterial == 19 or surfaceMaterial == 23 ) and Wheels ~= 4 then
                    isOnNoGrip = true
                    print('Esta com roda errada')
                    break
                end                
            end

            if isOnNoGrip then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionCurveMin", 0.7)
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionCurveMax", 0.7)
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionLossMult", 0.7)
            else
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionCurveMin", 2.4)
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionCurveMax", 2.5)
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionLossMult", 1.0)
            end
        end
        Wait(500)
    end
end)
