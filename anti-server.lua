ORT_AC.OpenMenuAllowed   = {"OrientAC-Admin"}
ORT_AC.ClearAreaAllowed  = {"OrientAC-Admin","OrientAC-Mod"}



ESX = nil
local a = LoadResourceFile("es_extended", "client/common.lua")
if a then
    a = a:gsub("AddEventHandler", "")
    a = a:gsub("cb", "")
    a = a:gsub("function ", "")
    a = a:gsub("return ESX", "")
    a = a:gsub("(ESX)", "")
    a = a:gsub("function", "")
    a = a:gsub("getSharedObject%(%)", "")
    a = a:gsub("end", "")
    a = a:gsub("%(", "")
    a = a:gsub("%)", "")
    a = a:gsub(",", "")
    a = a:gsub("\n", "")
    a = a:gsub("'", "")
    a = a:gsub("%s+", "")
    if tostring(a) ~= "esx:getSharedObject" then
    end
end
TriggerEvent(
    tostring(a),
    function(b)
        ESX = b
    end
)
RegisterServerEvent("OrtAC:araclaritemizle")
RegisterServerEvent("OrtAC:pedleritemizle")
RegisterServerEvent("OrtAC:alanitemizle")
RegisterServerEvent("OrtAC:menuac")
RegisterServerEvent("OrtAC:kontrolet")
RegisterServerEvent("OrtAC:menuaktif")
function logo()
  print([[-

^1------------------------------------------

^2   ____  _____ _______            _____ 
^2  / __ \|  __ \__   __|     /\   / ____|
^2 | |  | | |__) | | |______ /  \ | |     
^2 | |  | |  _  /  | |______/ /\ \| |     
^2 | |__| | | \ \  | |     / ____ \ |____ 
^2  \____/|_|  \_\ |_|    /_/    \_\_____|
 
^1------------------------------------------


^7------------------------------------------
     ^7           v1.0
^7------------------------------------------

  ]])
  print("\n^7---------------------------------------------------------")
  print("\n^7[Orient-AntiCheat^7] |^2 Basariyla Baslatildi. / OrientDev.net")
            print("\n^7---------------------------------------------------------^0")
            print("\n")
end
function check(g, h, i)
    if g == 200 then
        local j = json.decode(h)
        if j.status == 301 then
            logo()
            print("\n^1[Orient-AntiCheat^7] |^2OrientDev.net")
            print("\n^1----------------------------------------------------------------------^0")
            print("\n\n\n\n")
            Wait(7000)
            StopResource(GetCurrentResourceName())
            os.exit()
        else
            Wait(7000)
            logo()
            print("\n^7[Orient-AntiCheat^7] |^2 Basariyla Baslatildi. / OrientDev.net")
            print("\n^1----------------------------------------------------------------------^0")
            print("\n")
        end
    else
        logo()
        print("\n^1----------------------------------------------------------------------^0")
        print("\n\n\n\n")
        Wait(2000)
        StopResource(GetCurrentResourceName())
        os.exit()
    end
    SetTimeout(4600000, auth)
end
local k = "https://media.discordapp.net/attachments/770573148348874794/786002205135994890/minilogo.png"
local l = "Orient AntiCheat Log System"
local m = ""
local n = {}
function loadBans()
    m = LoadResourceFile(GetCurrentResourceName(), "bans.json") or ""
    if m ~= "" then
        n = json.decode(m)
    else
        n = {}
    end
end
function isBanned(source)
    if n[source] ~= nil then
        return n[source]
    else
        return false
    end
end
function permBanUser(o, source)
    n[source] = {banner = o, reason = "[Orient-AntiCheat] | Yasaklandınız. / OrientDev.net", expire = 0}
    SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(n), -1)
end



AddEventHandler(
    "playerConnecting",
    function(u, v, C)
        local s = GetPlayerName(source)
        local license, D, E, F, discord, G = "n/a", "n/a", "n/a", "n/a", "n/a", "n/a"
        for H, B in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("steam:")) == "steam:" then
                D = B
            elseif string.sub(B, 1, string.len("live:")) == "live:" then
                E = B
            elseif string.sub(B, 1, string.len("xbl:")) == "xbl:" then
                F = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                G = B
            end
        end
        for H, B in ipairs(GetPlayerIdentifiers(source)) do
            local I = isBanned(B)
            if I ~= false then
                v(
                    "­[Orient-AntiCheat] (Ban) | Sistemden *global* yasaklandınız."
                )
                TriggerEvent(
                    "discordlog:sendToDiscord2",
                    "­ Tehlikeli Oyuncu Tespit Edildi! ",
                    "**\nTespit: **Yasaklı birisi girmeye çalıştı." ..
                        "**\nİsim: **" ..
                            s ..
                                "**\n Steam: **" ..
                                    D ..
                                        "**\n Discord: **" ..
                                            discord .. "**\n Fivem: **" .. license .. "**\nIP: **" .. G,
                    0xe74c3c
                )
                CancelEvent()
                break
            end
        end
    end
)
RegisterServerEvent("discordlog:sendToDiscord2")
AddEventHandler(
    "discordlog:sendToDiscord2",
    function(s, t, J)
        local K = {
            {["color"] = J, ["title"] = "**" .. s .. "**", ["description"] = t, ['author'] = {['name'] = 'Orient AntiCheat', ['icon_url'] = 'https://media.discordapp.net/attachments/770573148348874794/786002205135994890/minilogo.png'},  ["footer"] = {["text"] = "dev. by Orient#6666 | OrientDev.net"}, ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ')}
        }
        PerformHttpRequest(
            ORT_AC.LOG,
            function(p, q, r)
            end,
            "POST",
            json.encode({username = l, embeds = K, avatar_url = "https://media.discordapp.net/attachments/770573148348874794/786002205135994890/minilogo.png"}),
            {["Content-Type"] = "application/json"}
        )
    end
)
local L = {}
local M = 0
local function N()
    local O = os.time(os.date("!*t"))
    if M == 0 or M < O then
        M = O + 10
        local P = {}
        local Q = ESX.GetPlayers()
        for i = 1, #Q, 1 do
            local R = {id = Q[i], name = GetPlayerName(Q[i])}
            table.insert(P, R)
        end
        L = P
    end
    return L
end
local S = {}
local T = {}
AddEventHandler(
    "playerConnecting",
    function()
        T[tostring(source)] = os.time()
    end
)
AddEventHandler(
    "playerDropped",
    function(U)
        local s = GetPlayerName(source)
        local X = GetPlayerIdentifier(source)
        local identifiers, Y = GetPlayerIdentifiers(source)
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        for H, B in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
    end
)
RegisterNetEvent("EGnetkoPlayers")
AddEventHandler(
    "EGnetkoPlayers",
    function()
        TriggerClientEvent("_SendPlayers", source, N())
    end
)
RegisterNetEvent("_GetCoords")
AddEventHandler(
    "_GetCoords",
    function(V, W)
        TriggerClientEvent("_SendPos", source, S[V], W)
    end
)
RegisterServerEvent("_UpdatePos")
AddEventHandler(
    "_UpdatePos",
    function(B)
        S[source] = B
        T[tostring(source)] = os.time()
    end
)
RegisterServerEvent("_UpdateTs")
AddEventHandler(
    "_UpdateTs",
    function(B)
        T[tostring(source)] = os.time()
    end
)
CreateThread(
    function()
        while true do
            Wait(200000)
            local O = os.time()
            for H, B in pairs(T) do
                if O - B > 200 then
                end
            end
        end
    end
)
RegisterServerEvent("OrtAC:Kickledim")
AddEventHandler(
    "OrtAC:Kickledim",
    function(src)
        local s = GetPlayerName(src)
        local X = GetPlayerIdentifier(src)
        local identifiers, Y = GetPlayerIdentifiers(source)
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        for H, B in pairs(GetPlayerIdentifiers(src)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end   
        DropPlayer(src, '\n[Orient-AntiCheat] | '..ORT_AC.KickMessage..'')
        CancelEvent()
    end
)
RegisterServerEvent("OrtAC:Banladim")
AddEventHandler(
    "OrtAC:Banladim",
    function(src, text)
        local s = GetPlayerName(src)
        local X = GetPlayerIdentifier(src)
        local identifiers, Y = GetPlayerIdentifiers(source)
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        for H, B in ipairs(GetPlayerIdentifiers(src)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                permBanUser(X, B)
            end
        end
        for H, B in pairs(GetPlayerIdentifiers(src)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end     
        DropPlayer(src, '\n[Orient-AntiCheat] | '..ORT_AC.BanMessage..'')
        CancelEvent()
    end
)


---EVENTLER




function doesPlayerHavePerms(ad, ae)
    local af = false
    for H, B in ipairs(ae) do
        if IsPlayerAceAllowed(ad, B) then
            return true
        end
    end
    return false
end
function SombraSBaclogkick(source, ag, ah)
    if ah then
        local s = GetPlayerName(source)
        for H, B in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
        TriggerEvent(
            "discordlog:sendToDiscord2",
            "­Hile Tespit Edildi!",
            "**\nName: **" ..
                tostring(s) ..
                    "**\n Steam: **" ..
                        tostring(steamid) ..
                            "**\n Discord: **" ..
                                tostring(discord) ..
                                    "**\n Fivem: **" ..
                                        tostring(license) ..
                                            "**\nIP: **" .. tostring(ips) .. "**\nTespit: **" .. tostring(ag),
            3447003
        )
        DropPlayer(source, ag)
    end
end
AddEventHandler(
    "OrtAC:ihlaltespit",
    function(ag, ah)
        if not doesPlayerHavePerms(source, ORT_AC.ClearAreaAllowed) then
            SombraSBaclogkick(source, ag, ah)
        end
    end
)
AddEventHandler(
    "OrtAC:menuaktif",
    function()
        for H, B in ipairs(ORT_AC.OpenMenuAllowed) do
            if not IsPlayerAceAllowed(source, B) then
                TriggerClientEvent("adminmenuenabley", source)
            end
        end
    end
)
AddEventHandler(
    "OrtAC:kontrolet",
    function()
        if not doesPlayerHavePerms(source, ORT_AC.OpenMenuAllowed) then
            SombraSBaclogkick(source, "[Orient-AntiCheat] | Yetkin Yok. ")
        end
    end
)
AddEventHandler(
    "OrtAC:menuac",
    function()
        for H, B in ipairs(ORT_AC.OpenMenuAllowed) do
            if IsPlayerAceAllowed(source, B) then
                TriggerClientEvent("OrtAC:menuac", source)
                dclog(source, "Admin Menüsünü Açtı.") 
            end
        end
    end
)
AddEventHandler(
    "OrtAC:araclaritemizle",
    function()
        if doesPlayerHavePerms(source, ORT_AC.ClearAreaAllowed) then
            TriggerClientEvent("OrtAC:araclaritemizley", -1)
        else
            SombraSBaclogkick(source, "­[Orient-AntiCheat] (Kick) | Arac Temizlemeye Yetkin Yok.", true)
        end
    end
)
AddEventHandler(
    "OrtAC:pedleritemizle",
    function()
        if doesPlayerHavePerms(source, ORT_AC.ClearAreaAllowed) then
            TriggerClientEvent("OrtAC:pedleritemizley", -1)
        else
            SombraSBaclogkick(source, "­[Orient-AntiCheat] (Kick) |!", true)
        end
    end
)
RegisterNetEvent("OrtAC:oge")
AddEventHandler(
    "OrtAC:oge",
    function()
        if doesPlayerHavePerms(source, ORT_AC.ClearAreaAllowed) then
            TriggerClientEvent("OrtAC:oge2", -1)
        else
            SombraSBaclogkick(
                source,
                "­[Orient-AntiCheat] (Kick) |!",
                true
            )
        end
    end
)
AddEventHandler(
    "OrtAC:alanitemizle",
    function()
        if doesPlayerHavePerms(source, ORT_AC.ClearAreaAllowed) then
            TriggerClientEvent("OrtAC:alanitemizley", -1)
        else
            SombraSBaclogkick(source, "­[Orient-AntiCheat] (Kick) |!", true)
        end
    end
)

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------




local cf = {
    DiscordWebhook = ORT_AC.LOG,
    SteamApiKey = ORT_AC.SteamApiKey,
}

PerformHttpRequest(cf.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({
    ['username'] = ORT_AC.WebhookName,
    ['avatar_url'] = ORT_AC.WebhookAvatarUrl,
    ['embeds'] = {{
        ['author'] = {
            ['name'] = 'Orient AntiCheat',
            ['icon_url'] = 'https://i.imgyukle.com/2020/12/14/Yq1IUS.png'
        },
        ['footer'] = {
            ['text'] = 'dev. by Orient - OrientDev.net'
        },
        ['color'] = 3601085,
        ['description'] = 'Anticheat başlatıldı!',
        ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ')
    }}
}), {['Content-Type'] = 'application/json' })


AddEventHandler('explosionEvent',function(source, ev)
    local src = source

    if ORT_AC.ExplosionsList[ev.explosionType] ~= nil then
        if ORT_AC.ExplosionsList[ev.explosionType].block then
            CancelEvent()
        end
        if ORT_AC.ExplosionLog then
            if ORT_AC.ExplosionsList[ev.explosionType].log then
                dclog(src, 'Yasaklı Patlayıcı Tespit Edildi! Patlayıcı İsmi: '..ORT_AC.ExplosionsList[ev.explosionType].name)
            end
        end
        if ORT_AC.ExplosionKick then
            if ORT_AC.ExplosionsList[ev.explosionType].kick then
                TriggerServerEvent('ort_ac:kickle', 'Yasaklı Patlayıcı Tespit Edildi! Patlayıcı İsmi: '..ORT_AC.ExplosionsList[ev.explosionType].name)
            end
        end
        if ORT_AC.ExplosionBan then
            if ORT_AC.ExplosionsList[ev.explosionType].ban then
                TriggerServerEvent('ort_ac:banla', 'Yasaklı Patlayıcı Tespit Edildi! Patlayıcı İsmi: '..ORT_AC.ExplosionsList[ev.explosionType].name)
            end
        end
    end
end)
    
local CooldownList = {}
AddEventHandler('entityCreated', function(entity)
    if DoesEntityExist(entity) then
        if GetEntityType(entity) == 3 then
            TriggerClientEvent('ort_ac:ogekontrol', -1, GetEntityModel(entity))
        end
        if GetEntityType(entity) == 3 or GetEntityType(entity) == 2 or GetEntityType(entity) == 1 then
            local src = NetworkGetEntityOwner(entity)
            if CooldownList[src] == nil then 
                CooldownList[src] = {count = 0, time = os.time()}
            end
            local seconds = os.time() - CooldownList[src].time
            if seconds <= ORT_AC.SpamTimecycle then
                CooldownList[src].count = CooldownList[src].count + 1
                if CooldownList[src].count >= ORT_AC.SpamMaxEntities then
                    TriggerClientEvent('ort_ac:entitysil', -1, tonumber(src))
                    if ORT_AC.SpamEntityLog then
                        dclog(src, 'Varlık oluşturma limitini aştı!\n**Oluşturduğu varlık sayısı:** '..CooldownList[src].count)
                    end
                    if ORT_AC.SpamEntityKick then
                        Citizen.Wait(3000)
                        TriggerServerEvent('ort_ac:kickle', 'Varlık oluşturma limitini aştı!\n**Oluşturduğu varlık sayısı:** '..CooldownList[src].count)
                        CooldownList[src] = nil
                    end
                    if ORT_AC.SpamEntityBan then
                        Citizen.Wait(3000)
                        TriggerServerEvent('ort_ac:banla', 'Varlık oluşturma limitini aştı!\n**Oluşturduğu varlık sayısı:** '..CooldownList[src].count)
                        CooldownList[src] = nil
                    end
                end
            else
                CooldownList[src] = nil
            end
        end
        if GetEntityType(entity) == 3 then
            local src = NetworkGetEntityOwner(entity)
            for _, blacklistedProps in pairs(ORTAC.BlacklistProps) do
                if GetEntityModel(entity) == GetHashKey(blacklistedProps) then
                    if ORT_AC.BlacklistPropLog then
                        dclog(src, 'Blacklist obje spawnladı! Obje ismi: '..blacklistedProps..'\n**Plebmasters:** https://plebmasters.de/?search='..blacklistedProps..'&app=objects \n**Google:** https://www.google.com/search?q='..blacklistedProps..' \n **Mwojtasik:** https://mwojtasik.dev/tools/gtav/objects/search?name='..blacklistedProps)
                    end
                    if ORT_AC.BlacklistPropDrop then
                        Citizen.Wait(3000)
                        TriggerServerEvent('ort_ac:kickle', 'Blacklist obje spawnladı! Obje ismi: '..blacklistedProps..'\n**Plebmasters:** https://plebmasters.de/?search='..blacklistedProps..'&app=objects \n**Google:** https://www.google.com/search?q='..blacklistedProps..' \n **Mwojtasik:** https://mwojtasik.dev/tools/gtav/objects/search?name='..blacklistedProps)
                        CooldownList[src] = nil
                    end
                    if ORT_AC.BlacklistPropBan then
                        Citizen.Wait(3000)
                        TriggerServerEvent('ort_ac:banla', 'Blacklist obje spawnladı! Obje ismi: '..blacklistedProps..'\n**Plebmasters:** https://plebmasters.de/?search='..blacklistedProps..'&app=objects \n**Google:** https://www.google.com/search?q='..blacklistedProps..' \n **Mwojtasik:** https://mwojtasik.dev/tools/gtav/objects/search?name='..blacklistedProps)
                        CooldownList[src] = nil
                    end
                    TriggerClientEvent('ort_ac:entitysil', -1, tonumber(src))
                    CancelEvent()
                    return
                end
            end
        elseif GetEntityType(entity) == 2 then
            local src = NetworkGetEntityOwner(entity)
            for _, blacklistedVeh in pairs(ORT_AC.BlacklistVehicles) do
                if GetEntityModel(entity) == GetHashKey(blacklistedVeh) then
                    local src = NetworkGetEntityOwner(entity)
                    if ORT_AC.BlacklistVehLog then
                        dclog(src, 'Blacklist araç spawnladı! Araç ismi: '..blacklistedVeh..'\n **GtaBase:** https://www.gtabase.com/search?searchword='..blacklistedVeh)
                    end
                    if ORT_AC.BlacklistVehKick then
                        Citizen.Wait(3000)
                        TriggerServerEvent('ort_ac:kickle', 'Blacklist araç spawnladı! Araç ismi: '..blacklistedVeh..'\n **GtaBase:** https://www.gtabase.com/search?searchword='..blacklistedVeh)
                        CooldownList[src] = nil
                    end
                    if ORT_AC.BlacklistVehBan then
                        Citizen.Wait(3000)
                        TriggerServerEvent('ort_ac:banla', 'Blacklist araç spawnladı! Araç ismi: '..blacklistedVeh..'\n **GtaBase:** https://www.gtabase.com/search?searchword='..blacklistedVeh)
                        CooldownList[src] = nil
                    end
                    TriggerClientEvent('ort_ac:entitysil', -1, tonumber(src))
                    CancelEvent()
                    return
                end
            end
        elseif GetEntityType(entity) == 1 then
            local src = NetworkGetEntityOwner(entity)
            for _, blacklistedPed in pairs(ORT_AC.BlacklistPeds) do
                if GetEntityModel(entity) == GetHashKey(blacklistedPed) then
                    local src = NetworkGetEntityOwner(entity)
                    if ORT_AC.BlacklistPedLog then
                        dclog(src, 'Blacklist ped spawnladı! Ped modeli: '..blacklistedPed..'\n **Ped picture:** https://docs.fivem.net/peds/'..blacklistedPed..'.png')
                    end
                    if ORT_AC.BlacklistPedKick then
                        Citizen.Wait(3000)
                        TriggerServerEvent('ort_ac:kickle', 'Blacklist ped spawnladı! Ped modeli: '..blacklistedPed..'\n **Ped picture:** https://docs.fivem.net/peds/'..blacklistedPed..'.png')
                        CooldownList[src] = nil
                    end
                    if ORT_AC.BlacklistPedBan then
                        Citizen.Wait(3000)
                        TriggerServerEvent('ort_ac:banla', 'Blacklist ped spawnladı! Ped modeli: '..blacklistedPed..'\n **Ped picture:** https://docs.fivem.net/peds/'..blacklistedPed..'.png')
                        CooldownList[src] = nil
                    end
                    TriggerClientEvent('ort_ac:entitysil', -1, tonumber(src))
                    CancelEvent()
                    return
                end
            end
        end
    end
end)

AddEventHandler('chatMessage', function(source, color, message)
    if not message then
        return
    end

    local src = source

    for k, v in pairs(ORT_AC.Words) do
        if string.match(message, v) then
            if ORT_AC.BlacklistWordLog then
                dclog(src, 'Chate blacklist mesaj yolladı! Mesaj: '..v)
            end
            if ORT_AC.BlacklistWordKick then
                TriggerServerEvent('ort_ac:kickle', 'Chate blacklist mesaj yolladı! Mesaj: '..v)
            end
            if ORT_AC.BlacklistWordBan then
                TriggerServerEvent('ort_ac:banla', 'Chate blacklist mesaj yolladı! Mesaj: '..v)
            end


            CancelEvent()
        end
        return
    end
end)


Citizen.CreateThread(function()
    for k, v in pairs(ORT_AC.Events) do
        if ORT_AC.TriggerDetection then
            RegisterServerEvent(tostring(v))
            AddEventHandler(tostring(v), function()
                local src = source

                if ORT_AC.BlacklistEventLog then
                    dclog(src, 'İNJECT YAPILIYOR!!! Yasaklı event kullandı! Event: '..v)
                end
                if ORT_AC.BlacklistEventKick then
                    TriggerServerEvent('ort_ac:kickle', 'İNJECT YAPILIYOR!!! Yasaklı event kullandı! Event: '..v)
                end
                if ORT_AC.BlacklistEventBan then
                    TriggerServerEvent('ort_ac:banla', 'İNJECT YAPILIYOR!!! Yasaklı event kullandı! Event: '..v)
                end
            end)
        end
    end
end)

Citizen.CreateThread(function()
    for i=1, #ORT_AC.Commands, 1 do
        RegisterCommand(ORT_AC.Commands[i], function(source)
            local src = source
            if ORT_AC.BlacklistCommandKick then
                TriggerServerEvent('ort_ac:kickle', 'Blacklist komut kullandı! Komut: **/' .. ORT_AC.Commands[i]..'**')
            end
            if ORT_AC.BlacklistCommandBan then
                TriggerServerEvent('ort_ac:kickle', 'Blacklist komut kullandı! Komut: **/' .. ORT_AC.Commands[i]..'**')
            end
            if ORT_AC.BlacklistCommandLog then
                dclog(src, 'Blacklist komut kullandı! Komut: **/' .. ORT_AC.Commands[i]..'**')
            end
         end)
    end
end)

RegisterCommand('ortacdel', function(source, args)
    TriggerClientEvent('ort_ac:entitysil', -1, tonumber(args[1]))
end)


RegisterServerEvent('ort_ac:drop')
AddEventHandler('ort_ac:drop', function()
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]

    DropPlayer(src, ORT_AC.KickMessage)
end)

RegisterServerEvent('ort_ac:logla')
AddEventHandler('ort_ac:logla', function(text)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]

    dclog(src, '\n**Loglandı:** '..text..'') 
end)

RegisterServerEvent('ort_ac:banla')
AddEventHandler('ort_ac:banla', function(text)
 if not doesPlayerHavePerms(source, ORT_AC.ClearAreaAllowed) then
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    dclog(src, '\n**Banlandı:** '..text..'') 
    TriggerEvent("OrtAC:Banladim", src)
  end
end)
RegisterServerEvent('ort_ac:kickle')
AddEventHandler('ort_ac:kickle', function(text)
if not doesPlayerHavePerms(source, ORT_AC.ClearAreaAllowed) then
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    dclog(src, '\n**Kicklendi:** '..text..'') 
    TriggerEvent("OrtAC:Kickledim", src)
   end
end)

function dclog(source, text)
    local src = source
    local playerName = Sanitize(GetPlayerName(src))
    
    for H, B in pairs(GetPlayerIdentifiers(src)) do
        if string.match(B, 'license:') then
            license = B
        end
        if string.match(B, 'live:') then
            live = B
        end
        if string.match(B, 'xbl:') then
            xbl = B
        end
        if string.match(B, 'discord:') then
            discord = B
        end
    end
    
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(v, 'steam:') then
            identifierSteamHex = v
            identifierSteamDex = tonumber(string.sub(identifierSteamHex, 7), 16)
        end
        if string.match(v, 'discord:') then
            identifierDiscord = v
        end
        if string.match(v, 'ip:') then
            identifierIp = v
        end
    end
	
	local discord_webhook = cf.DiscordWebhook
	if discord_webhook == '' or discord_webhook == nil then
	    return
    end
    
	local headers = {
	  ['Content-Type'] = 'application/json'
	}
	local data = {
	  ['username'] = ORT_AC.WebhookName,
	  ['avatar_url'] = ORT_AC.WebhookAvatarUrl,
	  ['embeds'] = {{
        ['thumbnail'] = {
            ['url'] = 'https://i.hizliresim.com/Y7kyjS.png'
          },
		['author'] = {
          ['name'] = 'Orient AntiCheat',
          ['icon_url'] = 'https://i.imgyukle.com/2020/12/14/Yq1IUS.png'
        },
        ['footer'] = {
            ['text'] = 'dev. by Orient - OrientDev.net'
        },
		['color'] = 3601085,
		['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ')
	  }}
    }
    text = '' ..text..'\n**              ID**: '..tonumber(src)..'\n**Steam İsmi:** '..playerName

    if identifierSteamHex ~= nil then
        text = text..'\n**Steam Hex:** '..identifierSteamHex
        if identifierSteamDex ~= nil and (cf.SteamApiKey ~= '' or cf.SteamApiKey ~= nil) then
            PerformHttpRequest('https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key='.. cf.SteamApiKey ..'&steamids='..identifierSteamDex, function(errorCode, resultJson, resultHeaders)
                resultData = json.decode(resultJson)
                profileurl = resultData.response.players[1].profileurl
                profileavatar = resultData.response.players[1].avatarmedium
                profilecreatedate = resultData.response.players[1].timecreated
                if (resultData.response.players[1].communityvisibilitystate == 1 or resultData.response.players[1].communityvisibilitystate == 2) then
                    profilevisibility = 'Gizli'
                elseif resultData.response.players[1].communityvisibilitystate == 3 then
                    profilevisibility = 'Herkese Açık'
                end
                if identifierDiscord ~= nil then
                    text = text..'\n**              Discord:** <@'..string.sub(identifierDiscord, 9)..'>'
                    identifierDiscord = nil
                end
                if discord ~= nil then
                    text = text..'\n**Discord Id:** '..string.sub(discord, 9)
                    discord = nil
                end
                if xbl ~= nil then
                    text = text..'\n**Xbox Live Id:** '..string.sub(xbl, 5)
                    xbl = nil
                end
                if live ~= nil then
                    text = text..'\n**Microsoft ID:** '..string.sub(live, 6)
                    live = nil
                end
                if license ~= nil then
                    text = text..'\n**GTA License:** '..string.sub(license, 9)
                    license = nil
                end
                if identifierIp ~= nil then
                    text = text..'\n**Ip:** '..string.sub(identifierIp, 4)
                    identifierIp = nil
                end
                if profileurl ~= nil then
                    text = text..'\n**Profil Linki:** '..profileurl
                    profileurl = nil
                    if profilevisibility ~= nil then
                        text = text..'\n**Profil Gizliliği:** '..profilevisibility
                        profilevisibility = nil
                    end
                    if profilecreatedate ~= nil then
                        text = text..'\n**Hesap Oluşturma Tarihi:** '..os.date('%d-%m-%Y %H:%M:%S', profilecreatedate)
                        profilecreatedate = nil
                    end
                    if profileavatar ~= nil then
                        data['embeds'][1]['thumbnail']['url'] = profileavatar
                        profileavatar = nil
                    end
                end
                
                data['embeds'][1]['description'] = text
	            PerformHttpRequest(cf.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
            end, 'GET', '')
        else
            if identifierDiscord ~= nil then
                text = text..'\n**Discord:** <@'..string.sub(identifierDiscord, 9)..'>'
                identifierDiscord = nil
            end
            if identifierIp ~= nil then
                text = text..'\n**Ip:** '..string.sub(identifierIp, 4)
                identifierIp = nil
            end
            data['embeds'][1]['description'] = text
            PerformHttpRequest(cf.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
        end
       
        identifierSteamHex = nil
        identifierSteamDex = nil
    end
end



function Sanitize(str)
	local replacements = {
		['&' ] = '&amp;',
		['<' ] = '&lt;',
		['>' ] = '&gt;',
		['\n'] = '<br/>'
	}

	return str
		:gsub('[&<>\n]', replacements)
		:gsub(' +', function(s)
			return ' '..('&nbsp;'):rep(#s-1)
		end)
end




loadBans()




Citizen.CreateThread(function()
logo()


end)
