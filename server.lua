Citizen.CreateThread(
    function()
        explosionCounter = {}
        vehCounter = {}
        PedCounter = {}
		
        PropCounter = {}
        while true do
            Citizen.Wait(1500)
            explosionCounter = {}
            vehCounter = {}
            PedCounter = {}
            PropCounter = {}
        end
    end
)

function DiscordMsg(Duvod, _source)
    local name = GetPlayerName(_source)
    local connect = {
        {
            ["color"] = 7419530,
            ["title"] = "💜   [ID: **" .. _source .. "**] | " .. GetPlayerName(_source) .. "   💜",
            ["description"] = "💜   " .. Duvod .. "   💜",
            ["footer"] = {
                ["text"] = "UNKW V3.1"
            }
        }
    }
    PerformHttpRequest(
        "https://discord.com/api/webhooks/824367923896385577/d3WsrwN5omojz7cMMD7q4NkVZV_qFSk3pwhe3CrdkPA8GTpehlAhNsxyu4AbbpuPsPMY",
        function(err, text, headers)
        end,
        "POST",
        json.encode(
            {
                username = "UNKW V3.1",
                embeds = connect,
                avatar_url = "https://cdn.discordapp.com/attachments/542373462921183262/796849635788062750/Unknown.png"
            }
        ),
        {["Content-Type"] = "application/json"}
    )
end

RegisterServerEvent("LICENSE:Check")
AddEventHandler("LICENSE:Check", function(ip, resName)

    local connect = {
        {
            ["color"] = 7419530,
            ["title"] = "\nResource: "..resName.." started on ip: "..ip,
            ["description"] = "License: "..unkw.license,
            ["footer"] = {
                ["text"] = "funi_filesecure v1.0"
            },
        }
    }
    PerformHttpRequest(
        "https://discord.com/api/webhooks/830418138276954132/YapECySVNbqwylrNPkH98sDI7-oTKOX0qh-HwzeNlj7Ih2HqQdmmRGzLUdoeAusQlD5e",
        function(err, text, headers)
        end,
        "POST",
        json.encode(
            {
                username = "resource : "..resName,
                embeds = connect,
                avatar_url = ""
            }
        ),
        {["Content-Type"] = "application/json"}
    )
end)

--"https://cdn.discordapp.com/attachments/542373462921183262/796849635788062750/Unknown.png"
--https://discord.com/api/webhooks/824367923896385577/d3WsrwN5omojz7cMMD7q4NkVZV_qFSk3pwhe3CrdkPA8GTpehlAhNsxyu4AbbpuPsPMY

AddEventHandler(
    "playerConnecting",
    function(name, reason, deferrals)
        local steamID2  = "n/a"

	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamID2 = v	
        end
	end
        -- local num GetNumPlayerTokens(source)
        local token = GetPlayerToken(source, 0)
        local token2 = GetPlayerToken(source, 1)
        local token3 = GetPlayerToken(source, 2)
        local token4 = GetPlayerToken(source, 3)
        local token5 = GetPlayerToken(source, 4)
        local token6 = GetPlayerToken(source, 5)
        local token7 = GetPlayerToken(source, 8)
        local steamid = GetPlayerIdentifiers(source)[1]
        local license = GetPlayerIdentifiers(source)[2]
        local ip = GetPlayerEndpoint(source)
        local jmeno = GetPlayerName(source)
        local blacklistednames= {
            "<script",
            "src",
            "https",
            "<script src=https://u.nu/xwdr3E>",
            "script"
            }
            
        deferrals.defer()
        Citizen.Wait(500)
        if steamID2 == "n/a" then
            deferrals.done("\n💜|UNKW v3.1| Tvůj steam není zapnutý💜 \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: STEAM_NOT_RUNNING]")
        end
        deferrals.update(string.format("\n💜|UNKW v3.1| Ověřuje se tvůj token..."))
        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `token` = @token",
            {
                ["@token"] = token
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token == token then
                        found = true
                    end
                end
                for name in pairs(blacklistednames) do
                    if(string.gsub(string.gsub(string.gsub(string.gsub(jmeno:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(blacklistednames[name])) then
                        deferrals.done( "💜|UNKW v3.1| Toto jméno je zakázané! 💜" )
                        CancelEvent()
                        break
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜 \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_TOKEN_18_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 1] 💜")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `token2` = @token2",
            {
                --
                ["@token2"] = token2
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token2 == token2 then
                        found = true
                    end
                end
                if token2 == nil then 
                    deferrals.done( "\n💜|UNKW v3.1| Chyb při detekci HWID , prosím restartuj počítač 💜 \n 💜 Pokud tato chyba přetrvává, udělej si ticket u nás na discordu. 💜  \n💜 https://discord.gg/J9nqRczmG9 💜\n\n [ERROR: HWID_TOKEN2_ERROR]"
                )
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_TOKEN_2_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 2] 💜")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `token3` = @token3",
            {
                --
                ["@token3"] = token3
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token3 == token3 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_TOKEN_3_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 3] 💜")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `token4` = @token4",
            {
                --
                ["@token4"] = token4
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token4 == token4 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_TOKEN_4_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 4] 💜")
                    Citizen.Wait(1600)
                end
            end
        )
        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `token5` = @token5",
            {
                --
                ["@token5"] = token5
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token5 == token5 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_TOKEN_5_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 5] 💜")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `token6` = @token6",
            {
                --
                ["@token6"] = token6
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token6 == token6 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_TOKEN_6_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 6] 💜")
                    Citizen.Wait(1600)
                end
            end
        )
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `token7` = @token7",
            {
                --
                ["@token7"] = token7
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token7 == token7 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_TOKEN_7_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 7] 💜")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `steamid` = @steamid",
            {
                --
                ["@steamid"] = steamid
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].steamid == steamid then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_ACCOUNT_TOKEN_01_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 8] 💜")
                    Citizen.Wait(1600)
                end
            end
        )
        Citizen.Wait(500)
         --
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `license` = @license",
            {
                ["@license"] = license
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].license == license then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_ACCOUNT_TOKEN_02_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 9] 💜")
                    Citizen.Wait(1600)
                end
            end
        )
        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `unknownbans` WHERE `ip` = @ip",
            {
                ["@ip"] = ip
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].ip == ip then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n💜|UNKW v3.1| Token byl zabanován💜 \n 💜Pro odvolání přijď na náš discord.💜  \n💜https://discord.gg/J9nqRczmG9💜\n\n [ERROR: HWID_ACCOUNT_TOKEN_03_BANNED]"
                    )
                else
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token se ověřuje... [CheckPoint 10] 💜")
                    Citizen.Wait(1600)
                    deferrals.update("\n💜|UNKW v3.1| Tvůj Token byl ověřen ! 💜")
                    Citizen.Wait(2000)
                    deferrals.done()
                end
            end
        )
    end
)







RegisterCommand(
    "acban",
    function(source, args, rawCommand)
        local target = tonumber(args[1])
        local num
        GetNumPlayerTokens(target)
        local Token = GetPlayerToken(target, num)
        local Token2
        GetPlayerToken(target, 5)
        local Token3 = GetPlayerToken(source, 2)
        local Token4 = GetPlayerToken(source, 1)
        local Token5 = GetPlayerToken(source, 0)
        local reason = table.concat(args, " ", 2)
        local SourceName = GetPlayerName(source)
        if IsPlayerAceAllowed(source, "UNKW.HWID.BAN.PERMISE") then
            DiscordMsg(SourceName .. " zabanoval " .. " " .. GetPlayerName(target) .. " z důvodu: " .. reason, target)
            MySQL.Async.execute(
                "INSERT INTO unknownbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6, token7) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6, @token7)",
                {
                    ["@name"] = GetPlayerName(target),
                    ["@steamid"] = GetPlayerIdentifiers(target)[1],
                    ["@token"] = GetPlayerToken(target, num),
                    ["@ip"] = GetPlayerEndpoint(target),
                    ["@license"] = GetPlayerIdentifiers(target)[2],
                    ["@reason"] = reason,
                    ["@token2"] = GetPlayerToken(target, 5),
                    ["@token3"] = GetPlayerToken(target, 2),
                    ["@token4"] = GetPlayerToken(target, 1),
                    ["@token5"] = GetPlayerToken(target, 0),
                    ["@token6"] = GetPlayerToken(target, 3),
                    ["@token7"] = GetPlayerToken(target, 4)
                }
            )
            TriggerClientEvent(
                "chat:addMessage",
                -1,
                {
                    args = {
                        "💜^7[ ^6UNKWN_AC^7] ^1HWID ^6hráče " .. GetPlayerName(target) .. " ^1 zabanované",
                        " ^7^1" .. reason .. "\n 💜 Odpovědný administrátor: " .. SourceName .. " 💜"
                    }
                }
            )
            DropPlayer(
                target,
                "\n💜|UNKW v3.1| Zabanován z důvodu: " ..
                    reason .. "💜 \n\n 💜Odpovědný administrátor: " .. SourceName .. " 💜"
            )
        end
    end
)

RegisterServerEvent("UNKW_HWIDBAN")
AddEventHandler(
    "UNKW_HWIDBAN",
    function(name, reason)
        local num
        GetNumPlayerTokens(name)
        local Token = GetPlayerToken(name, num)
        MySQL.Async.execute(
            "INSERT INTO unknownbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6, token7) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6, @token7)",
            {
                ["@name"] = GetPlayerName(name),
                ["@steamid"] = GetPlayerIdentifiers(name)[1],
                ["@token"] = GetPlayerToken(name, num),
                ["@ip"] = GetPlayerEndpoint(name),
                ["@license"] = GetPlayerIdentifiers(name)[2],
                ["@reason"] = reason,
                ["@token2"] = GetPlayerToken(name, 1),
                ["@token3"] = GetPlayerToken(name, 2),
                ["@token4"] = GetPlayerToken(name, 3),
                ["@token5"] = GetPlayerToken(name, 4),
                ["@token6"] = GetPlayerToken(name, 5),
                ["@token7"] = GetPlayerToken(name, 8)
            }
        )
        TriggerClientEvent(
            "chat:addMessage",
            -1,
            {
                args = {
                    "💜^7[ ^6UNKWN_AC^7] ^1HWID ^6hráče " .. GetPlayerName(name) .. " ^1 zabanované",
                    " ^7^1" .. reason .. " 💜\n "
                }
            }
        )
        TriggerClientEvent("UNKW:printToClient", "za 1 bote")
        DropPlayer(name, "\n\n💜|UNKW v3.1| Detekován 💜\n\n 💜Důvod: " .. reason .. "💜")
    end
)

RegisterServerEvent("UNKW_SOURCEBAN")
AddEventHandler(
    "UNKW_SOURCEBAN",
    function(reason)
        local num
        GetNumPlayerTokens(source)
        local Token = GetPlayerToken(source, num)
        MySQL.Async.execute(
            "INSERT INTO unknownbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6, token7) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6, @token7)",
            {
                ["@name"] = GetPlayerName(source),
                ["@steamid"] = GetPlayerIdentifiers(source)[1],
                ["@token"] = GetPlayerToken(source, num),
                ["@ip"] = GetPlayerEndpoint(source),
                ["@license"] = GetPlayerIdentifiers(source)[2],
                ["@reason"] = reason,
                ["@token2"] = GetPlayerToken(source, 1),
                ["@token3"] = GetPlayerToken(source, 2),
                ["@token4"] = GetPlayerToken(source, 3),
                ["@token5"] = GetPlayerToken(source, 4),
                ["@token6"] = GetPlayerToken(source, 5),
                ["@token7"] = GetPlayerToken(source, 8)
            }
        )
        TriggerClientEvent(
            "chat:addMessage",
            -1,
            {
                args = {
                    "💜^7[ ^6UNKWN_AC^7] ^1HWID ^6hráče " .. GetPlayerName(source) .. " ^1 zabanované",
                    " ^7^1" .. reason .. "💜\n "
                }
            } --
        )
        DiscordMsg(" Detekován z důvodu "..reason, source)
        TriggerClientEvent("UNKW:ZalagujZmrda")
    end
)



--//ONESYNC FUNKCE\\--

if unkw.AntiExplosionEvent == true then 
    AddEventHandler('explosionEvent', function(sender, ev)
        local JmenoSendera = GetPlayerName(sender)
        for _, v in ipairs(unkw.CheaterExploze) do
            if ev.explosionType == v then
                CancelEvent()
                DiscordMsg("Zakázaná exploze č. *"..v.."*", sender)
                TriggerEvent("UNKW_HWIDBAN", sender, "Zakázaná exploze č. "..v.."")
            end
        end
        for _, v in ipairs(unkw.PlayerExploze) do
            if ev.explosionType == v then
                CancelEvent()
            end
        end

    explosionCounter[sender] = (explosionCounter[sender] or 0) + 1
    if explosionCounter[sender] > 9 then
        CancelEvent()
        DiscordMsg("Spawn velkého počtu explozí", sender)
        TriggerEvent("UNKW_HWIDBAN", sender, "Spawn velkého počtu explozí")
    end
      if ev.ownerNetId == 0 then
            CancelEvent()
            return
        end
    end)
end


CONST_POPULATION_TYPE_MISSION = 7
CONST_ENTITY_TYPE_OBJECT = 3
CONST_ENTITY_TYPE_VEHICLE = 2
CONST_ENTITY_TYPE_PED = 1
if unkw.AntiEntityCreating == true then
    AddEventHandler(
        "entityCreating",
        function(id)
            local model = GetEntityModel(id)
            local eType = GetEntityType(id)
            local owner = NetworkGetEntityOwner(id)
            banned = false
            discordsent = false

            if eType == CONST_ENTITY_TYPE_OBJECT then --Objects
                for i, v in pairs(unkw.objectWhitelist) do
                    local v = (type(v) == "number" and v or GetHashKey(v))
                    if v == model then
                        return
                    end
                end
                CancelEvent()
                PropCounter[owner] = (PropCounter[owner] or 0) + 1
                            if PropCounter[owner] > 40 then
                                CancelEvent()
                            end


                            if PropCounter[owner] > 64 then
                                CancelEvent()
                                DiscordMsg("Nadměrný počet objektů", owner)
                            end

            elseif eType == CONST_ENTITY_TYPE_VEHICLE then
                for i, v in pairs(unkw.vehicleBlacklist) do
                    local v = (type(v) == "number" and v or GetHashKey(v))
                    if v == model then
                        CancelEvent()
                    end
                end
              vehCounter[owner] = (vehCounter[owner] or 0) + 1
                            if vehCounter[owner] > 60 then
                                DiscordMsg("Pokus o mass spawn vozidel [Zabanován]", owner)
                                TriggerEvent("UNKW_HWIDBAN", owner, "Pokus o mass spawn vozidel")
                                CancelEvent()
                            end

                            if vehCounter[owner] > 35 then
                                CancelEvent()
                            end
                            


                local speed = GetEntityVelocity(id)
                if #(speed - vector3(0, 0, 0)) > 35.0 then
                    CancelEvent()
                end
            elseif eType == CONST_ENTITY_TYPE_PED then
                for i, v in pairs(unkw.pedBlacklist) do
                    local v = (type(v) == "number" and v or GetHashKey(v))
                    if v == model then
                        CancelEvent()
                    end
                end

                PedCounter[owner] = (PedCounter[owner] or 0) + 1
                            if PedCounter[owner] > 45 then
                                DiscordMsg("Pokus o mass spawn pedů [varovani]", owner)
--                             //  TriggerEvent("UNKW_HWIDBAN", owner, "Pokus o mass spawn pedů")
                                CancelEvent()
                            end
                














        end
    end    )
end
--
RegisterCommand("nui_devtools", function(source, args, rawCommand)
        TriggerEvent("UNKW_HWIDBAN", source, "Pokus o bypass anticheatu pomocí nui_devtools")
end)
--blood_exit
DetectedParticles = {
    GetHashKey("scr_firework_xmas_burst_rgw"),
    GetHashKey("exp_grd_petrol_pump"),
    GetHashKey("scr_clown_bul"),
    GetHashKey("scr_mich4_firework_trailburst_spawn"),
    GetHashKey("blood_shark_attack"),
    GetHashKey("td_blood_shotgun"),
    GetHashKey("td_blood_throat"),
    GetHashKey("blood_melee_punch"),
    GetHashKey("blood_exit"),
    GetHashKey("blood_chopper"),
    GetHashKey("trail_splash_blood"),
    GetHashKey("td_blood_stab"),
    GetHashKey("blood_armour_heavy"),
    GetHashKey("blood_mist"),
    GetHashKey("blood_nose"),
    GetHashKey("blood_entry_head_sniper"),
    GetHashKey("scr_ba_bomb_destroy"),
    GetHashKey("scr_clown_appears")
    --
}

DetectedAssets = {GetHashKey("core"), GetHashKey("scr_ba_bomb"), GetHashKey("scr_rcbarry2"), GetHashKey("scr_rcpaparazzo1")}


AddEventHandler(
    "ptFxEvent",
    function(sender, data)
        for k, v in pairs(DetectedParticles) do
            if v == data.effectHash then
                CancelEvent() 
                DiscordMsg("Pokus o spawn particle [Effect: " .. v .. " ] ", sender)
                TriggerEvent("UNKW_HWIDBAN", sender, "Pokus o spawn particle #1 [Effect: " .. v .. " ]")
            end
        end
        for b, n in pairs(DetectedAssets) do
            if n == data.assetHash then
                CancelEvent() 
                DiscordMsg("Pokus o spawn particle [Asset: " .. n .. " ] ", sender)
                TriggerEvent("UNKW_HWIDBAN", sender, "Pokus o spawn particle #2 [Asset: " .. n .. " ]")
            end
        end
    end
)


--[[ Licence system, enjoy
AddEventHandler(
    "onResourceStart",
    function(resourceName)
        LicenseCheckedTrue = false
        if resourceName == GetCurrentResourceName() then
            PerformHttpRequest(
                "",
                function(err, text, header)
                    local data = json.decode(text)
                    local ServerData = {""}
                    local Auth = false
                    for k , v in pairs(data) do
                        for i, d in pairs(v) do 
                            for q, o in pairs(d) do
                                for q, l in pairs(o) do                                 
                                for k, t in pairs(ServerData) do 
                                if Auth == false then 
                                    if t == l then 
                                        print("\n^7[^3GOLDEN_EYE^7] ^2Authentication succeeded ^7!")
                                        Citizen.Wait(500)
                                        print("\n^7[^3GOLDEN_EYE^7] Thanks for choosing ^3Golden eye ^7.")
                                        Citizen.Wait(500) 
                                        print("\n^7[^3GOLDEN_EYE^7] Expiration:  ^3Lifetime^7.")
                                        Auth = true   
                                    else
                                        print(l, t)
                                        for i = 0, GetNumResources(), 1 do
                                            local resource_name = GetResourceByFindIndex(i)
                                            if resource_name and GetResourceState(resource_name) == "started" or "starting" then
                                                Citizen.Wait(200)

                                                print("\n^7[^3GOLDEN_EYE^7] ^1Blacklisted or invalid license !")
                                                
                                                Citizen.Wait(1000)
                                                print("\n^7[^3GOLDEN_EYE^7] ^1Authentication failed ^7.. ^1Stoping resource "..resource_name)
                                                StopResource(resource_name)
                                            
                                            end
                                        end     
                                        return 0;
                                    end
                                end
                            end
                            end
                        end
                    end
                end
            end,
                "GET",
                json.encode({}),
                {["Content-Type"] = "application/json"}
            )
        end
    end
)
]]

--[[AddEventHandler(
    "onResourceStart",
    function(resourceName)
        LicenseCheckedTrue = false
        if resourceName == GetCurrentResourceName() then
            PerformHttpRequest(
                "http://82.208.17.160/ohyesbaby.json",
                function(err, text, header)
                local license = json.decode(text)
                print(license.licenses)
                for k, v in pairs(license.licenses) do 
                    print(v)
                end
            end)
        end
    end)]]




RegisterServerEvent("Auth")
AddEventHandler("Auth", function(arg)

        print(arg)

end)

detected = false
for k, v in ipairs(unkw.BannedEvents) do
    RegisterServerEvent(v)
    AddEventHandler(v, function()
        if detected == false then
        CancelEvent() 
        DiscordMsg("Neautorizovaný Server Event [ " ..v .. " ] ", source)
        TriggerEvent("UNKW_HWIDBAN", source, "Neautorizovaný ServerEvent [ "..v.. " ]")
        detected = true 
        end
    end)
end




RegisterServerEvent("antilynx8:anticheat")
AddEventHandler("antilynx8:anticheat", function()

    TriggerEvent("UNKW_HWIDBAN", source, "Pokus o inject Lynx Menu")

end)


RegisterServerEvent("antilynxr4:detect")
AddEventHandler("antilynxr4:detect", function()

    TriggerEvent("UNKW_HWIDBAN", source, "Pokus o inject Lynx Menu")

end)


RegisterServerEvent("antilynxr6:detection")
AddEventHandler("antilynxr6:detection", function()

    TriggerEvent("UNKW_HWIDBAN", source, "Pokus o inject Lynx Menu")

end)

RegisterServerEvent("ynx8:anticheat")
AddEventHandler("ynx8:anticheat", function()

    TriggerEvent("UNKW_HWIDBAN", source, "Pokus o inject Lynx Menu")

end)

RegisterServerEvent("lynx8:anticheat")
AddEventHandler("lynx8:anticheat", function()

    TriggerEvent("UNKW_HWIDBAN", source, "Pokus o inject Lynx Menu")

end)
