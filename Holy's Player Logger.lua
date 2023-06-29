-- Made by holyjoey.
-- Stripped from old script, holyscript

--Natives
util.require_natives(1663599433)

-- Creating own log
menu.toggle(menu.my_root(), "Enable Join Logging", { "PlayerLog" }, "Logs all player joins into PlayersLog.txt", function(on)
    enableLog = on
end)
players.on_join(function(pid)
    if not enableLog then
        return
    end
    -- "C:\Users\<username>\AppData\Roaming\Stand\Lua Scripts\Holy's Player Logger" is store
    local store = filesystem.scripts_dir() .. "\\Holy's Player Logger"
    if not filesystem.exists(store .. "\\PlayersLog.txt") then
        -- create directories if they doesn't exist
        filesystem.mkdirs(store)
        -- create file
        local f = io.open(store .. "\\PlayersLog.txt", "w")
        f:close()
    end
    -- write to file
    local f = io.open(store .. "\\PlayersLog.txt", "a")
    function dec_to_ipv4(ip)
        return string.format(
            "%i.%i.%i.%i",
            ip >> 24 & 0xFF,
            ip >> 16 & 0xFF,
            ip >> 8  & 0xFF,
            ip 		 & 0xFF
        )
    end
    f:write(players.get_name(pid) .. " ("..players.get_rockstar_id(pid)..") joined on " .. os.date("%d %b %Y at %X") .. " with IP: " .. dec_to_ipv4(players.get_connect_ip(pid)) ..".\n")
    f:close()
end)