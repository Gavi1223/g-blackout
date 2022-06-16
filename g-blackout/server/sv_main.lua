function BlackoutTimer()
    local timer = CONFIG.BlackoutCooldown
    repeat 
        Citizen.Wait(1000)
        timer = timer - 1
    until timer == 0
    CONFIG.BlackoutStatus = false
    --Make Chatmassage for everyone because powerplant up again
--    exports.ghmattimysql:execute("UPDATE heists_availability SET `availability` = @availability WHERE heist = @heist", {['@heist'] = 'blackout', ['@availability'] = 'no'})
    

    TriggerClientEvent('chatMessage', -1, "^1[LS Water & Power]", {255, 0, 0}, "City power has been restored!")
    TriggerClientEvent("blackout:clientblackout", -1, CONFIG.BlackoutStatus)
end






--------------------------------------------------------------------------------------------
-------------------------------------Random Blackout----------------------------------------
--------------------------------------------------------------------------------------------





Citizen.CreateThread(function()
    while true do
      Citizen.Wait(600000)               --- After how much time you want to trigger this // 1 mins = 60000 
        local blackoutchance = math.random(1, 2)
        if blackoutchance == 1 then
            print("blackout")

            if not CONFIG.BlackoutStatus then
                CONFIG.BlackoutStatus = true
--                exports.ghmattimysql:execute("UPDATE heists_availability SET `availability` = @availability WHERE heist = @heist", {['@heist'] = 'blackout', ['@availability'] = 'yes'})

                
                TriggerClientEvent('chatMessage', -1, "^1[LS Water & Power]", {255, 0, 0}, "City power is currently out, we're working on restoring it!")
                TriggerClientEvent("blackout:clientblackout", -1, CONFIG.BlackoutStatus)
                BlackoutTimer()
            end
        else
            print("no blackout this time")
        end
    end
end)
















