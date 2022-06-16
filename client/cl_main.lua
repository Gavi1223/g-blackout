

RegisterNetEvent('blackout:clientblackout')
AddEventHandler('blackout:clientblackout', function(blackout)
    SetArtificialLightsStateAffectsVehicles(false)
    SetArtificialLightsState(blackout)
end)










