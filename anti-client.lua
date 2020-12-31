Config = {}
Config.Locale = 'de'



Locales['de'] = {
    ['welcome'] = '~g~Orient AntiCheat Admin Menü Açıldı.',
    ['welcome2'] = 'Orient AntiCheat Admin Menü',
    ['opadmin'] = '~w~> ~w~Admin ~g~Seçenekleri',
    ['onplayers'] = '~w~> ~w~Oyuncu ~b~Seçenekleri',
    ['srvertool'] = '~w~> ~w~Sunucu ~p~Seçenekleri',
}


local a = "~w~Orient ~s~AntiCheat"
local b = false
local c = false
local d = false
local e = true
local f = false
local g = false
local h = false
local i = false
local j = 0
TriggerServerEvent("OrtAC:menuaktif")
RegisterNetEvent("OrtAC:menuaktify")
AddEventHandler(
    "OrtAC:menuaktify",
    function()
        e = false
        b = false
        c = false
        d = false
    end
)
local k = {}
k.debug = false
local function l(m)
    local n = {}
    local o = GetGameTimer() / 2000
    n.r = math.floor(math.sin(o * m + 0) * 127 + 128)
    n.g = math.floor(math.sin(o * m + 2) * 127 + 128)
    n.b = math.floor(math.sin(o * m + 4) * 127 + 128)
    return n
end
local p = {}
local q = {up = 172, down = 173, left = 174, right = 175, select = 176, back = 177}
local r = 0
local s = nil
local t = nil
local u = 0.21
local w = 0.10
local A = 0.03
local B = 0.9
local C = 0.040
local D = 6
local E = 0.470
local F = 0.005
local G = 0.005
local H = _U("welcome2")
local function I(J)
    if k.debug then
        Citizen.Trace("[OrientAC] " .. tostring(J))
    end
end
local function K(L, M, N)
    if L and p[L] then
        p[L][M] = N
        I(L .. " menu ozelligi { " .. tostring(M) .. ", " .. tostring(N) .. " }")
    end
end
local function O(L)
    if L and p[L] then
        return p[L].visible
    else
        return false
    end
end
local function P(L, Q, R)
    if L and p[L] then
        K(L, "visible", Q)
        if not R and p[L] then
            K(L, "currentOption", 1)
        end
        if Q then
            if L ~= t and O(t) then
                P(t, false)
            end
            t = L
        end
    end
end
local function S(J, x, y, T, U, V, W, X, Y)
    SetTextColour(U.r, U.g, U.b, U.a)
    SetTextFont(T)
    SetTextScale(V, V)
    if X then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end
    if p[t] then
        if W then
            SetTextCentre(W)
        elseif Y then
            SetTextWrap(p[t].x, p[t].x + u - F)
            SetTextRightJustify(true)
        end
    end
    SetTextEntry("STRING")
    AddTextComponentString(J)
    DrawText(x, y)
end
local function Z(x, y, _, height, U)
    DrawRect(x, y, _, height, U.r, U.g, U.b, U.a)
end
local function a0()
    if p[t] then
        local x = p[t].x + u / 2
        local y = p[t].y + w / 2
        if p[t].titleBackgroundSprite then
            DrawSprite(
                p[t].titleBackgroundSprite.dict,
                p[t].titleBackgroundSprite.name,
                x,
                y,
                u,
                w,
                0.,
                255,
                255,
                255,
                255
            )
        else
            Z(x, y, u, w, p[t].titleBackgroundColor)
        end
        S(p[t].title, x, y - w / 2 + A, p[t].titleFont, p[t].titleColor, B, true)
    end
end
local function a1()
    if p[t] then
        local x = p[t].x + u / 2
        local y = p[t].y + w + C / 2
        local a2 = {
            r = p[t].titleBackgroundColor.r,
            g = p[t].titleBackgroundColor.g,
            b = p[t].titleBackgroundColor.b,
            a = 255
        }
        Z(x, y, u, C, p[t].subTitleBackgroundColor)
        S(p[t].subTitle, p[t].x + F, y - C / 2 + G, D, a2, E, false)
        if r > p[t].maxOptionCount then
            S(
                tostring(p[t].currentOption) .. " / " .. tostring(r),
                p[t].x + u,
                y - C / 2 + G,
                D,
                a2,
                E,
                false,
                false,
                true
            )
        end
    end
end
local function a3(J, a4)
    local x = p[t].x + u / 2
    local a5 = nil
    if p[t].currentOption <= p[t].maxOptionCount and r <= p[t].maxOptionCount then
        a5 = r
    elseif r > p[t].currentOption - p[t].maxOptionCount and r <= p[t].currentOption then
        a5 = r - (p[t].currentOption - p[t].maxOptionCount)
    end
    if a5 then
        local y = p[t].y + w + C + C * a5 - C / 2
        local a6 = nil
        local a7 = nil
        local a8 = nil
        local X = false
        if p[t].currentOption == r then
            a6 = p[t].menuFocuTHackgroundColor
            a7 = p[t].menuFocusTextColor
            a8 = p[t].menuFocusTextColor
        else
            a6 = p[t].menuBackgroundColor
            a7 = p[t].menuTextColor
            a8 = p[t].menuSubTextColor
            X = true
        end
        Z(x, y, u, C, a6)
        S(J, p[t].x + F, y - C / 2 + G, D, a7, E, false, X)
        if a4 then
            S(a4, p[t].x + F, y - C / 2 + G, D, a8, E, false, X, true)
        end
    end
end
function k.CreateMenu(L, a9)
    p[L] = {}
    p[L].title = a9
    p[L].subTitle = H
    p[L].visible = false
    p[L].previousMenu = nil
    p[L].aboutToBeClosed = false
    p[L].x = 0.75
    p[L].y = 0.35
    p[L].currentOption = 1
    p[L].maxOptionCount = 10
    p[L].titleFont = 6
    p[L].titleColor = {r = 0, g = 0, b = 0, a = 255}
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                local aa = l(1.0)
                p[L].titleBackgroundColor = {r = 0, g = 255, b = 255, a = 105}
                p[L].menuFocuTHackgroundColor = {r = 0, g = 255, b = 255, a = 100}
            end
        end
    )
    p[L].titleBackgroundSprite = nil
    p[L].menuTextColor = {r = 255, g = 255, b = 255, a = 255}
    p[L].menuSubTextColor = {r = 0, g = 0, b = 0, a = 255}
    p[L].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
    p[L].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 100}
    p[L].subTitleBackgroundColor = {
        r = p[L].menuBackgroundColor.r,
        g = p[L].menuBackgroundColor.g,
        b = p[L].menuBackgroundColor.b,
        a = 255
    }
    p[L].buttonPressedSound = {name = "~r~> ~r~Onayla", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"}
    I(tostring(L) .. " Menü Olusturuldu")
end
function k.CreateSubMenu(L, ab, ac)
    if p[ab] then
        k.CreateMenu(L, p[ab].title)
        if ac then
            K(L, "subTitle", ac)
        else
            K(L, "subTitle", p[ab].subTitle)
        end
        K(L, "previousMenu", ab)
        K(L, "x", p[ab].x)
        K(L, "y", p[ab].y)
        K(L, "maxOptionCount", p[ab].maxOptionCount)
        K(L, "titleFont", p[ab].titleFont)
        K(L, "titleColor", p[ab].titleColor)
        K(L, "titleBackgroundColor", p[ab].titleBackgroundColor)
        K(L, "titleBackgroundSprite", p[ab].titleBackgroundSprite)
        K(L, "menuTextColor", p[ab].menuTextColor)
        K(L, "menuSubTextColor", p[ab].menuSubTextColor)
        K(L, "menuFocusTextColor", p[ab].menuFocusTextColor)
        K(L, "menuFocuTHackgroundColor", p[ab].menuFocuTHackgroundColor)
        K(L, "menuBackgroundColor", p[ab].menuBackgroundColor)
        K(L, "subTitleBackgroundColor", p[ab].subTitleBackgroundColor)
    else
        I("Hata" .. tostring(L) .. " submenu: " .. tostring(ab) .. " membü yok")
    end
end
function k.CurrentMenu()
    return t
end
function k.OpenMenu(L)
    if L and p[L] then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        P(L, true)
        if p[L].titleBackgroundSprite then
            RequestStreamedTextureDict(p[L].titleBackgroundSprite.dict, false)
            while not HasStreamedTextureDictLoaded(p[L].titleBackgroundSprite.dict) do
                Citizen.Wait(0)
            end
        end
        I(tostring(L) .. " Menü Aç")
    else
        I("Hata " .. tostring(L) .. " Menu Yok")
    end
end
function k.IsMenuOpened(L)
    return O(L)
end
function k.CloseMenu()
    if p[t] then
        if p[t].aboutToBeClosed then
            p[t].aboutToBeClosed = false
            P(t, false)
            I(tostring(t) .. " Menu")
            PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            r = 0
            t = nil
            s = nil
        else
            p[t].aboutToBeClosed = true
            I(tostring(t) .. " Menu Kapanacak")
        end
    end
end
function k.Button(J, a4)
    local ad = J
    if a4 then
        ad = "{ " .. tostring(ad) .. ", " .. tostring(a4) .. " }"
    end
    if p[t] then
        r = r + 1
        local ae = p[t].currentOption == r
        a3(J, a4)
        if ae then
            if s == q.select then
                PlaySoundFrontend(-1, p[t].buttonPressedSound.name, p[t].buttonPressedSound.set, true)
                I(ad .. " Dugme Var")
                return true
            elseif s == q.left or s == q.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end
        return false
    else
        I("hata " .. ad .. " hata " .. tostring(t) .. " hata")
        return false
    end
end
function k.MenuButton(J, L)
    if p[L] then
        if k.Button(J) then
            P(t, false)
            P(L, true, true)
            return true
        end
    else
        I("hata" .. tostring(J) .. " hata: " .. tostring(L) .. " hata")
    end
    return false
end
function k.CheckBox(J, bool, af)
    local ag = "~r~~h~KAPALI"
    if bool then
        ag = "~g~~h~AÇIK"
    end
    if k.Button(J, ag) then
        bool = not bool
        I(tostring(J) .. " checkbox gewechselt zu " .. tostring(bool))
        af(bool)
        return true
    end
    return false
end
function TSE(ah, ai, aj, ak, al, am, an, ao, ap, aq)
    TriggerServerEvent(ah, ai, aj, ak, al, am, an, ao, ap, aq)
end
function k.Display()
    if O(t) then
        if p[t].aboutToBeClosed then
            k.CloseMenu()
        else
            ClearAllHelpMessages()
            a0()
            a1()
            s = nil
            if IsDisabledControlJustPressed(0, q.down) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if p[t].currentOption < r then
                    p[t].currentOption = p[t].currentOption + 1
                else
                    p[t].currentOption = 1
                end
            elseif IsDisabledControlJustPressed(0, q.up) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if p[t].currentOption > 1 then
                    p[t].currentOption = p[t].currentOption - 1
                else
                    p[t].currentOption = r
                end
            elseif IsDisabledControlJustPressed(0, q.left) then
                s = q.left
            elseif IsDisabledControlJustPressed(0, q.right) then
                s = q.right
            elseif IsDisabledControlJustPressed(0, q.select) then
			    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                s = q.select
            elseif IsDisabledControlJustPressed(0, q.back) then
                if p[p[t].previousMenu] then
                    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    P(p[t].previousMenu, true)
                else
                    k.CloseMenu()
                end
            end
            r = 0
        end
    end
end
function k.SetMenuWidth(L, _)
    K(L, "width", _)
end
function k.SetMenuX(L, x)
    K(L, "x", x)
end
function k.SetMenuY(L, y)
    K(L, "y", y)
end
function k.SetMenuMaxOptionCountOnScreen(L, ar)
    K(L, "maxOptionCount", ar)
end
function k.SetTitleColor(L, as, an, ai, ah)
    K(L, "titleColor", {["r"] = as, ["g"] = an, ["b"] = ai, ["a"] = ah or p[L].titleColor.a})
end
function k.SetTitleBackgroundColor(L, as, an, ai, ah)
    K(L, "titleBackgroundColor", {["r"] = as, ["g"] = an, ["b"] = ai, ["a"] = ah or p[L].titleBackgroundColor.a})
end
function k.SetTitleBackgroundSprite(L, at, au)
    K(L, "titleBackgroundSprite", {dict = at, name = au})
end
function k.SetSubTitle(L, J)
    K(L, "subTitle", J)
end
function k.SetMenuBackgroundColor(L, as, an, ai, ah)
    K(L, "menuBackgroundColor", {["r"] = as, ["g"] = an, ["b"] = ai, ["a"] = ah or p[L].menuBackgroundColor.a})
end
function k.SetMenuTextColor(L, as, an, ai, ah)
    K(L, "menuTextColor", {["r"] = as, ["g"] = an, ["b"] = ai, ["a"] = ah or p[L].menuTextColor.a})
end
function k.SetMenuSubTextColor(L, as, an, ai, ah)
    K(L, "menuSubTextColor", {["r"] = as, ["g"] = an, ["b"] = ai, ["a"] = ah or p[L].menuSubTextColor.a})
end
function k.SetMenuFocusColor(L, as, an, ai, ah)
    K(L, "menuFocusColor", {["r"] = as, ["g"] = an, ["b"] = ai, ["a"] = ah or p[L].menuFocusColor.a})
end
function k.SetMenuButtonPressedSound(L, av, aw)
    K(L, "buttonPressedSound", {["name"] = av, ["set"] = aw})
end
function RespawnPed(ax, ay, az)
    SetEntityCoordsNoOffset(ax, ay.x, ay.y, ay.z, false, false, false, true)
    NetworkResurrectLocalPlayer(ay.x, ay.y, ay.z, az, true, false)
    SetPlayerInvincible(ax, false)
    ClearPedBloodDamage(ax)
end
function KeyboardInput(aA, aB, aC)
    AddTextEntry("FMMC_KEY_TIP1", aA .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", aB, "", "", "", aC)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        AddTextEntry("FMMC_KEY_TIP1", "")
        local n = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return n
    else
        AddTextEntry("FMMC_KEY_TIP1", "")
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
function DrawText3D(x, y, z, J, as, an, ai)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(0.0, 0.20)
    SetTextColour(as, an, ai, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(J)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
function math.round(aD, aE)
    return tonumber(string.format("%." .. (aE or 0) .. "f", aD))
end
local function l(m)
    local n = {}
    local o = GetGameTimer() / 1000
    n.r = math.floor(math.sin(o * m + 0) * 127 + 128)
    n.g = math.floor(math.sin(o * m + 2) * 127 + 128)
    n.b = math.floor(math.sin(o * m + 4) * 127 + 128)
    return n
end
local function aF(J, aG)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(J)
    DrawNotification(aG, false)
end
local aH = "GenerationF"
local aI = a
local aJ = "SelfMenu"
local aK = "Self Menu"
local aL = "TeleportMenu"
local aM = "AdvM"
local aN = "VehicleMenu"
local aO = "OnlinePlayerMenu"
local aP = "PlayerOptionsMenu"
local aQ = "Credits"
local aR = "MiscTriggers"
local aS = "ESPMenu"
local function aT(J, x, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(J)
    DrawText(x, y)
end
function RequestModelSync(aU)
    local aV = GetHashKey(aU)
    RequestModel(aV)
    while not HasModelLoaded(aV) do
        RequestModel(aV)
        Citizen.Wait(0)
    end
end
local function aW()
    local aX = KeyboardInput("X Değeri", "", 100)
    local aY = KeyboardInput("Y Değeri", "", 100)
    local aZ = KeyboardInput("Z Değeri", "", 100)
    if aX ~= "" and aY ~= "" and aZ ~= "" then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, aX + 0.5, aY + 0.5, aZ + 0.5, 1, 0, 0, 1)
            aF("~g~Belirlenen koordinata başarıyla ışınlandın!", false)
        end
    else
        aF("~b~Yanlış değer!", true)
    end
end
local function a_()
    if DoeTHlipExist(GetFirstBlipInfoId(8)) then
        local b0 = GetBlipInfoIdIterator(8)
        local b1 = GetFirstBlipInfoId(8, b0)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, b1, Citizen.ResultAsVector())
        wp = true
    else
        aF("~b~Isınlandın!", true)
    end
    local b2 = 0.0
    height = 1000.0
    while wp do
        Citizen.Wait(0)
        if wp then
            if
                IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                    GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
             then
                entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
            else
                entity = GetPlayerPed(-1)
            end
            SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
            FreezeEntityPosition(entity, true)
            local b3 = GetEntityCoords(entity, true)
            if b2 == 0.0 then
                height = height - 25.0
                SetEntityCoords(entity, b3.x, b3.y, height)
                bool, b2 = GetGroundZFor_3dCoord(b3.x, b3.y, b3.z, 0)
            else
                SetEntityCoords(entity, b3.x, b3.y, b2)
                FreezeEntityPosition(entity, false)
                wp = false
                height = 1000.0
                b2 = 0.0
                aF("~g~Isınlandın!", false)
                break
            end
        end
    end
end
local function b4()
    local b5 = KeyboardInput("Arac modeli", "", 100)
    if b5 and IsModelValid(b5) and IsModelAVehicle(b5) then
        RequestModel(b5)
        while not HasModelLoaded(b5) do
            Citizen.Wait(0)
        end
        local b6 =
            CreateVehicle(GetHashKey(b5), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)
        SetPedIntoVehicle(PlayerPedId(), b6, -1)
    else
        aF("~b~~h~Arac hatası!", true)
    end
end
local function b7(entity)
    DeleteVehicle(entity)
    DeleteEntity(entity)
end
local function b8()
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
function RequestControl(entity)
    local b9 = 0
    NetworkRequestControlOfEntity(entity)
    while not NetworkHasControlOfEntity(entity) do
        b9 = b9 + 100
        Citizen.Wait(100)
        if b9 > 5000 then
            aF("5 Kontrol", true)
        end
    end
end
function getEntity(ba)
    local n, entity = GetEntityPlayerIsFreeAimingAt(ba, Citizen.ReturnResultAnyway())
    return entity
end
function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
end
function DrawSpecialText(bb, bc)
    SetTextEntry_2("STRING")
    AddTextComponentString(bb)
    DrawSubtitleTimed(bc, 1)
end
if ORT_AC.AntiCarDestroy then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(15000)
                for bd in EnumerateVehicles() do
                    if GetEntityHealth(bd) == 0 then
                        SetEntityAsMissionEntity(bd, false, false)
                        DeleteEntity(bd)
                    end
                end
            end
        end
    )
end
local be = {__gc = function(bf)
        if bf.destructor and bf.handle then
            bf.destructor(bf.handle)
        end
        bf.destructor = nil
        bf.handle = nil
    end}
function EnumerateEntities(bg, bh, bi)
    return coroutine.wrap(
        function()
            local bj, L = bg()
            if not L or L == 0 then
                bi(bj)
                return
            end
            local bf = {handle = bj, destructor = bi}
            setmetatable(bf, be)
            local bk = true
            repeat
                coroutine.yield(L)
                bk, L = bh(bj)
            until not bk
            bf.destructor, bf.handle = nil, nil
            bi(bj)
        end
    )
end
local bl = {
    "WEAPON_KNIFE",
    "WEAPON_HAMMER",
    "WEAPON_GOLFCLUB",
    "WEAPON_MACHETE",
    "WEAPON_FLASHLIGHT",
    "WEAPON_BALL",
    "WEAPON_STUNGUN",
    "WEAPON_MICROSMG",
    "WEAPON_ASSAULTSMG",
    "WEAPON_GUSENBERG",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_CARBINERIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_BAT",
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_SMG",
    "WEAPON_COMBATPDW"
}
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
function RotationToDirection(bm)
    local bn = bm.z * 0.0174532924
    local bo = bm.x * 0.0174532924
    local bp = math.abs(math.cos(bo))
    return vector3(-math.sin(bn) * bp, math.cos(bn) * bp, math.sin(bo))
end
function OscillateEntity(entity, bq, br, bs, bt)
    if entity ~= 0 and entity ~= nil then
        local bu = (br - bq) * bs * bs - 2.0 * bs * bt * GetEntityVelocity(entity)
        ApplyForceToEntity(entity, 3, bu.x, bu.y, bu.z + 0.1, 0.0, 0.0, 0.0, false, false, true, true, false, true)
    end
end
Citizen.CreateThread(
    function()
        while e do
            Citizen.Wait(0)
            if DeleteGun then
                local bv = getEntity(PlayerId(-1))
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    aF(
                        "~g~İptal"
                    )
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 200, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 200)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL") then
                        if IsPlayerFreeAiming(PlayerId(-1)) then
                            if IsEntityAPed(bv) then
                                if IsPedInAnyVehicle(bv, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(bv, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(bv, true))
                                        SetEntityAsMissionEntity(bv, 1, 1)
                                        DeleteEntity(bv)
                                        NetworkDelete(bv)
                                        aF("~g~Silindi!")
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(bv, 1, 1)
                                        DeleteEntity(bv)
                                        NetworkDelete(bv)
                                        aF("~g~Silindi!")
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(bv, 1, 1)
                                    DeleteEntity(bv)
                                    NetworkDelete(bv)
                                    aF("~g~Silindi!")
                                end
                            end
                        end
                    end
                end
            end
            if d then
                for ap = 1, 255 do
                    if NetworkIsPlayerActive(ap) and GetPlayerPed(ap) ~= GetPlayerPed(-1) then
                        local aa = {r = 255, g = 0, b = 255, a = 255}
                        local bw = GetPlayerPed(ap)
                        local bx, by, bz = table.unpack(GetEntityCoords(PlayerPedId()))
                        local x, y, z = table.unpack(GetEntityCoords(bw))
                        local bA = 130
                        local bB = 999999
                        distance = math.floor(GetDistanceBetweenCoords(bx, by, bz, x, y, z, true))
                        if c then
                            if distance < bA then
                                if NetworkIsPlayerTalking(ap) then
                                    DrawText3D(
                                        x,
                                        y,
                                        z + 1.2,
                                        GetPlayerServerId(ap) .. "  |  " .. GetPlayerName(ap),
                                        aa.r,
                                        aa.g,
                                        aa.b
                                    )
                                else
                                    DrawText3D(
                                        x,
                                        y,
                                        z + 1.2,
                                        GetPlayerServerId(ap) .. "  |  " .. GetPlayerName(ap),
                                        255,
                                        255,
                                        255
                                    )
                                end
                            end
                        end
                        local bC =
                            "Isim: " ..
                            GetPlayerName(ap) ..
                                "\nServer ID: " ..
                                    GetPlayerServerId(ap) ..
                                        "\nOyuncu ID: " ..
                                            ap ..
                                                "\nMesafe: " ..
                                                    math.round(GetDistanceBetweenCoords(bx, by, bz, x, y, z, true), 1)
                        if IsPedInAnyVehicle(bw, true) then
                            local bD =
                                GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(bw))))
                            bC = bC .. "\nA: " .. bD
                        end
                        if distance < bB then
                            if espinfo and d then
                                DrawText3D(x, y, z - 1.0, bC, aa.r, aa.g, aa.b)
                            end
                            if espbox and d then
                                LineOneBegin = GetOffsetFromEntityInWorldCoords(bw, -0.3, -0.3, -0.9)
                                LineOneEnd = GetOffsetFromEntityInWorldCoords(bw, 0.3, -0.3, -0.9)
                                LineTwoBegin = GetOffsetFromEntityInWorldCoords(bw, 0.3, -0.3, -0.9)
                                LineTwoEnd = GetOffsetFromEntityInWorldCoords(bw, 0.3, 0.3, -0.9)
                                LineThreeBegin = GetOffsetFromEntityInWorldCoords(bw, 0.3, 0.3, -0.9)
                                LineThreeEnd = GetOffsetFromEntityInWorldCoords(bw, -0.3, 0.3, -0.9)
                                LineFourBegin = GetOffsetFromEntityInWorldCoords(bw, -0.3, -0.3, -0.9)
                                TLineOneBegin = GetOffsetFromEntityInWorldCoords(bw, -0.3, -0.3, 0.8)
                                TLineOneEnd = GetOffsetFromEntityInWorldCoords(bw, 0.3, -0.3, 0.8)
                                TLineTwoBegin = GetOffsetFromEntityInWorldCoords(bw, 0.3, -0.3, 0.8)
                                TLineTwoEnd = GetOffsetFromEntityInWorldCoords(bw, 0.3, 0.3, 0.8)
                                TLineThreeBegin = GetOffsetFromEntityInWorldCoords(bw, 0.3, 0.3, 0.8)
                                TLineThreeEnd = GetOffsetFromEntityInWorldCoords(bw, -0.3, 0.3, 0.8)
                                TLineFourBegin = GetOffsetFromEntityInWorldCoords(bw, -0.3, -0.3, 0.8)
                                ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(bw, -0.3, 0.3, 0.8)
                                ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(bw, -0.3, 0.3, -0.9)
                                ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(bw, 0.3, 0.3, 0.8)
                                ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(bw, 0.3, 0.3, -0.9)
                                ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(bw, -0.3, -0.3, 0.8)
                                ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(bw, -0.3, -0.3, -0.9)
                                ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(bw, 0.3, -0.3, 0.8)
                                ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(bw, 0.3, -0.3, -0.9)
                                DrawLine(
                                    LineOneBegin.x,
                                    LineOneBegin.y,
                                    LineOneBegin.z,
                                    LineOneEnd.x,
                                    LineOneEnd.y,
                                    LineOneEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    LineTwoBegin.x,
                                    LineTwoBegin.y,
                                    LineTwoBegin.z,
                                    LineTwoEnd.x,
                                    LineTwoEnd.y,
                                    LineTwoEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    LineThreeBegin.x,
                                    LineThreeBegin.y,
                                    LineThreeBegin.z,
                                    LineThreeEnd.x,
                                    LineThreeEnd.y,
                                    LineThreeEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    LineThreeEnd.x,
                                    LineThreeEnd.y,
                                    LineThreeEnd.z,
                                    LineFourBegin.x,
                                    LineFourBegin.y,
                                    LineFourBegin.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    TLineOneBegin.x,
                                    TLineOneBegin.y,
                                    TLineOneBegin.z,
                                    TLineOneEnd.x,
                                    TLineOneEnd.y,
                                    TLineOneEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    TLineTwoBegin.x,
                                    TLineTwoBegin.y,
                                    TLineTwoBegin.z,
                                    TLineTwoEnd.x,
                                    TLineTwoEnd.y,
                                    TLineTwoEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    TLineThreeBegin.x,
                                    TLineThreeBegin.y,
                                    TLineThreeBegin.z,
                                    TLineThreeEnd.x,
                                    TLineThreeEnd.y,
                                    TLineThreeEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    TLineThreeEnd.x,
                                    TLineThreeEnd.y,
                                    TLineThreeEnd.z,
                                    TLineFourBegin.x,
                                    TLineFourBegin.y,
                                    TLineFourBegin.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    ConnectorOneBegin.x,
                                    ConnectorOneBegin.y,
                                    ConnectorOneBegin.z,
                                    ConnectorOneEnd.x,
                                    ConnectorOneEnd.y,
                                    ConnectorOneEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    ConnectorTwoBegin.x,
                                    ConnectorTwoBegin.y,
                                    ConnectorTwoBegin.z,
                                    ConnectorTwoEnd.x,
                                    ConnectorTwoEnd.y,
                                    ConnectorTwoEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    ConnectorThreeBegin.x,
                                    ConnectorThreeBegin.y,
                                    ConnectorThreeBegin.z,
                                    ConnectorThreeEnd.x,
                                    ConnectorThreeEnd.y,
                                    ConnectorThreeEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                                DrawLine(
                                    ConnectorFourBegin.x,
                                    ConnectorFourBegin.y,
                                    ConnectorFourBegin.z,
                                    ConnectorFourEnd.x,
                                    ConnectorFourEnd.y,
                                    ConnectorFourEnd.z,
                                    aa.r,
                                    aa.g,
                                    aa.b,
                                    255
                                )
                            end
                            if esplines and d then
                                DrawLine(bx, by, bz, x, y, z, aa.r, aa.g, aa.b, 255)
                            end
                        end
                    end
                end
            end
            if showCoords then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format("%.2f", x))
                roundy = tonumber(string.format("%.2f", y))
                roundz = tonumber(string.format("%.2f", z))
                aT("~r~X:~s~ " .. roundx, 0.05, 0.00)
                aT("~r~Y:~s~ " .. roundy, 0.11, 0.00)
                aT("~r~Z:~s~ " .. roundz, 0.17, 0.00)
            end
            if Noclip then
                local ax = GetPlayerPed(-1)
                local x, y, z = getPosition()
                local bE, bF, bG = getCamDirection()
                local bH = 3
                SetEntityVelocity(ax, 0.0001, 0.0001, 0.0001)
                if IsControlPressed(0, 32) then
                    x = x + bH * bE
                    y = y + bH * bF
                    z = z + bH * bG
                end
                if IsControlPressed(0, 269) then
                    x = x - bH * bE
                    y = y - bH * bF
                    z = z - bH * bG
                end
                SetEntityCoordsNoOffset(ax, x, y, z, true, true, true)
            end
            if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
            end
            if h then
                SetEntityInvincible(GetPlayerPed(-1), true)
                SetPlayerInvincible(PlayerId(), true)
                SetPedCanRagdoll(GetPlayerPed(-1), false)
                ClearPedBloodDamage(GetPlayerPed(-1))
                ResetPedVisibleDamage(GetPlayerPed(-1))
                ClearPedLastWeaponDamage(GetPlayerPed(-1))
                SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
                SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
                SetEntityCanBeDamaged(GetPlayerPed(-1), false)
            else
                SetEntityInvincible(GetPlayerPed(-1), false)
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(GetPlayerPed(-1), true)
                ClearPedBloodDamage(GetPlayerPed(-1))
                ResetPedVisibleDamage(GetPlayerPed(-1))
                ClearPedLastWeaponDamage(GetPlayerPed(-1))
                SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
                SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
                SetEntityCanBeDamaged(GetPlayerPed(-1), true)
            end
        end
    end
)
RegisterNetEvent("OrtAC:noclip")
AddEventHandler(
    "OrtAC:noclip",
    function()
        g = not g
        local ax = GetPlayerPed(-1)
        if g then
            SetEntityInvincible(ax, true)
            SetEntityVisible(ax, false, false)
        else
            SetEntityInvincible(ax, false)
            SetEntityVisible(ax, true, false)
        end
        if g == true then
            aF("~w~OrtAC ~g~NOCLIP ~w~aktif.", true)
        else
            aF("~w~OrtAC ~r~NOCLIP ~w~deaktif.", true)
        end
    end
)
RegisterNetEvent("OrtAC:gorunmezlik")
AddEventHandler(
    "OrtAC:gorunmezlik",
    function()
        i = not i
        local ax = GetPlayerPed(-1)
        SetEntityVisible(ax, not i, false)
        if i == true then
            aF("~w~OrtAC ~g~Görünmezlik ~w~aktif", true)
        else
            aF("~w~OrtAC ~r~Görünmezli~w~deaktif.", true)
        end
    end
)
function getCamDirection()
    local az = GetGameplayCamRelativeHeading() + GetEntityHeading(GetPlayerPed(-1))
    local bI = GetGameplayCamRelativePitch()
    local x = -math.sin(az * math.pi / 180.0)
    local y = math.cos(az * math.pi / 180.0)
    local z = math.sin(bI * math.pi / 180.0)
    local bJ = math.sqrt(x * x + y * y + z * z)
    if bJ ~= 0 then
        x = x / bJ
        y = y / bJ
        z = z / bJ
    end
    return x, y, z
end
function getPosition()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    return x, y, z
end
local bK = ""
local bL = 0
local bM = false
local bN = {}
local bO = false
local bP = 0
local bQ = {}
RegisterNetEvent("_SendPlayers")
AddEventHandler(
    "_SendPlayers",
    function(ak)
        bN = ak
    end
)
RegisterNetEvent("_SendPos")
AddEventHandler(
    "_SendPos",
    function(ak, bR)
        bQ[tostring(bR)] = {recv = true, coords = ak}
    end
)
local function bS(bT, bU)
    bP = bP + 1
    local bV = bP
    TriggerServerEvent("_GetCoords", bT, bV)
    while bQ[tostring(bV)] == nil do
        Wait(10)
    end
    local aj = bQ[tostring(bV)].coords
    bQ[tostring(bV)] = nill
    bU(aj)
end
local bW = false
local bX = nil
local bY = 0
local bZ = 90
local b_ = -3.5
local c0 = nil
local function c1(c2, b_, bY, bZ)
    local c3 = bY * math.pi / 180.0
    local c4 = bZ * math.pi / 180.0
    local c5 = {
        x = c2.x + b_ * math.sin(c4) * math.cos(c3),
        y = c2.y - b_ * math.sin(c4) * math.sin(c3),
        z = c2.z - b_ * math.cos(c4)
    }
    return c5
end
local function c6()
    local playerPed = PlayerPedId()
    SetCamActive(bX, false)
    RenderScriptCams(false, false, 0, true, true)
    SetEntityCollision(playerPed, true, true)
    SetEntityVisible(playerPed, true)
    SetEntityCoords(playerPed, c0.x, c0.y, c0.z)
end
function SpectatePlayer(c7, c8)
    local playerPed = PlayerPedId()
    bW = not bW
    if bW then
        c0 = GetEntityCoords(playerPed)
        if not DoesCamExist(bX) then
            bX = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        end
        SetCamActive(bX, true)
        RenderScriptCams(true, false, 0, true, true)
        Citizen.CreateThread(
            function()
                bS(
                    c8,
                    function(ay)
                        if ay ~= nil then
                            SetEntityCollision(playerPed, false, false)
                            SetEntityVisible(playerPed, false)
                            SetEntityCoords(playerPed, ay.x, ay.y, ay.z + 10)
                            SetCamCoord(bX, ay.x, ay.y, ay.z)
                            local c9 = nil
                            while bW do
                                Wait(0)
                                playerPed = PlayerPedId()
                                c9 = GetPlayerPed(GetPlayerFromServerId(c8))
                                local ay = GetEntityCoords(c9)
                                local ca = #(ay - GetEntityCoords(playerPed))
                                if ca <= 5 then
                                    Wait(500)
                                    bS(
                                        c8,
                                        function(aj)
                                            ay = aj
                                        end
                                    )
                                else
                                    NetworkSetInSpectatorMode(true, c9)
                                end
                                for cb, ba in ipairs(GetActivePlayers()) do
                                    if ba ~= PlayerId() then
                                        SetEntityNoCollisionEntity(playerPed, GetPlayerPed(ba), true)
                                        SetEntityVisible(playerPed, false)
                                    end
                                end
                                if IsControlPressed(2, 241) then
                                    b_ = b_ + 2.0
                                end
                                if IsControlPressed(2, 242) then
                                    b_ = b_ - 2.0
                                end
                                if b_ > -1 then
                                    b_ = -1
                                end
                                local cc = GetDisabledControlNormal(0, 1)
                                local cd = GetDisabledControlNormal(0, 2)
                                bY = bY + cc * 10
                                if bY >= 360 then
                                    bY = 0
                                end
                                bZ = bZ + cd * 10
                                if bZ >= 360 then
                                    bZ = 0
                                end
                                local ce = c1(ay, b_, bY, bZ)
                                SetCamCoord(bX, ce.x, ce.y, ce.z)
                                PointCamAtEntity(bX, c9)
                                SetEntityCoords(playerPed, ay.x, ay.y, ay.z + 10)
                            end
                            NetworkSetInSpectatorMode(false, c9)
                            c6()
                        end
                    end
                )
            end
        )
    end
end
Citizen.CreateThread(
    function()
        local cf = nil
        while true do
            Wait(10000)
            TriggerServerEvent("_UpdateTs")
        end
    end
)
Citizen.CreateThread(
    function()
        local cf = nil
        while true do
            Wait(2000)
            local c5 = GetEntityCoords(GetPlayerPed(-1), true)
            if cf == nil or #(cf - c5) > 2 then
                cf = c5
                TriggerServerEvent("_UpdatePos", c5)
            end
        end
    end
)
function IsLocked(ax)
    local cg = GetEntityModel(ax)
    for cb, v in pairs(ORT_AC.BlacklistPeds) do
        if GetHashKey(v) == cg then
            TriggerServerEvent("ort_ac:logla", "Yasaklı ped tespit edildi ! Ped hash: " ..ax)
            return true
        end
    end
    return false
end
if ORT_AC.AntiPedAttack then
    Citizen.CreateThread(
        function()
            local cf = nill
            while true do
                Wait(1000)
                local ch, ax = FindFirstPed()
                local ci = false
                repeat
                    Citizen.Wait(20)
                    if not IsPedAPlayer(ax) then
                        if IsPedArmed(ax) or IsPedInMeleeCombat(ax) or IsPedInCombat(ax) or IsLocked(ax) then
                            RemoveAllPedWeapons(ax, true)
                            SetEntityInvincible(ax, false)
                            SetPedMaxHealth(ax, 200)
                            ApplyDamageToPed(ax, 10000, false)
                            DeleteEntity(ax)
                        end
                    end
                    ci, ax = FindNextPed(ch)
                until not ci
                EndFindPed(ch)
            end
        end
    )
end
AntiCheat = true
if ORT_AC.PlayerProtection then
    Citizen.CreateThread(
        function()
            while true do
                local cj = GetPlayerPed(-1)
                SetExplosiveAmmoThisFrame(cj, 0)
                SetExplosiveMeleeThisFrame(cj, 0)
                SetFireAmmoThisFrame(cj, 0)
                SetEntityProofs(GetPlayerPed(-1), false, true, true, false, false, false, false, false)
                Citizen.Wait(0)
            end
        end
    )
end



if ORT_AC.AntiCarRam then
    Citizen.CreateThread(
        function()
            local cn = 200
            while true do
                Citizen.Wait(30)
                if IsEntityOnFire(PlayerPedId()) then
                    StopEntityFire(PlayerPedId())
                    SetEntityHealth(PlayerPedId(), cn)
                else
                    cn = GetEntityHealth(PlayerPedId())
                end
                for entity in EnumerateVehicles() do
                    if GetPedInVehicleSeat(entity, -1) == 0 and GetEntitySpeed(entity) > 50.0 then
                        NetworkDelete(entity)
                    end
                end
            end
        end
    )
end
function NetworkDelete(entity)
    if DoesEntityExist(entity) and not (IsEntityAPed(entity) and IsPedAPlayer(entity)) then
        NetworkRequestControlOfEntity(entity)
        local co = 5
        while co > 0 and not NetworkHasControlOfEntity(entity) do
            Citizen.Wait(1)
            co = co - 1
        end
        DetachEntity(entity, 0, false)
        SetEntityCollision(entity, false, false)
        SetEntityAlpha(entity, 0.0, true)
        SetEntityAsMissionEntity(entity, true, true)
        SetEntityAsNoLongerNeeded(entity)
        DeleteEntity(entity)
    end
end
function Networkingdelete(entity)
    if DoesEntityExist(entity) then
        NetworkRequestControlOfEntity(entity)
        local co = 2000
        while co > 0 and not NetworkHasControlOfEntity(entity) do
            Wait(1000)
            co = co - 100
        end
        DeleteEntity(entity)
    end
end

if ORT_AC.AntiCheat then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(1)
                SetPedInfiniteAmmoClip(PlayerPedId(), false)
                SetPlayerInvincible(PlayerId(), false)
                SetEntityInvincible(PlayerPedId(), false)
                SetEntityCanBeDamaged(PlayerPedId(), true)
                ResetEntityAlpha(PlayerPedId())
                local cs = IsPedFalling(PlayerPedId())
                local ct = IsPedRagdoll(PlayerPedId())
                local cu = GetPedParachuteState(PlayerPedId())
                if cu >= 0 or ct or cs then
                    SetEntityMaxSpeed(PlayerPedId(), 80.0)
                else
                    SetEntityMaxSpeed(PlayerPedId(), 7.1)
                end
            end
        end
    )
end
if ORT_AC.AntiGodmode then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(30000)
                local cv = PlayerPedId()
                local cw = GetEntityHealth(cv)
                SetEntityHealth(cv, cw - 2)
                local cx = math.random(10, 150)
                Citizen.Wait(cx)
                if not IsPlayerDead(PlayerId()) then
                    if PlayerPedId() == cv and GetEntityHealth(cv) == cw and GetEntityHealth(cv) ~= 0 then
                        TriggerServerEvent('ort_ac:banla', '[Orient-AntiCheat] (Ban) | Godmode açmaya çalıştı.')
                    elseif GetEntityHealth(cv) == cw - 2 then
                        SetEntityHealth(cv, GetEntityHealth(cv) + 2)
                    end
                end
                if GetEntityHealth(PlayerPedId()) > 200 then
                    TriggerServerEvent('ort_ac:banla', '[Orient-AntiCheat] (Ban) | Godmode açmaya çalıştı.')
                end
                if GetPedArmour(PlayerPedId()) < 200 then
                    Wait(50)
                    if GetPedArmour(PlayerPedId()) == 200 then
                        TriggerServerEvent('ort_ac:banla', '[Orient-AntiCheat] (Ban) | Godmode açmaya çalıştı.')
                    end
                end
            end
        end
    )
end
local cy = nil
local cz = nil
local cA = nil
local cB = nil
AddEventHandler(
    "playerSpawned",
    function()
        cA = #GetRegisteredCommands()
        cB = GetNumResources()
    end
)
RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
    "esx:playerLoaded",
    function()
        cA = #GetRegisteredCommands()
        cB = GetNumResources()
    end
)
BlacklistedCmdsxd = {
    "chocolate",
    "pk",
    "haha",
    "lol",
    "panickey",
    "killmenu",
    "panik",
    "ssssss",
    "brutan",
    "panic",
    "brutanpremium",
    "hammafia",
    "hamhaxia",
    "redstonia",
    "hoax",
    "desudo",
    "jd",
    "ham",
    "hammafia",
    "hamhaxia",
    "redstonia",
    "hoax",
    "lua options",
    "God Mode",
    "Maestro",
    "FunCtionOk",
    "tiago",
    "lynx9_fixed",
    "SovietH4X",
    "GodCap",
    "Lynx",
    "fuck",
    "savage",
    "redengine"
}
Citizen.CreateThread(
    function()
        while true do
            if ORT_AC.AntiInjectionv2 then
                Citizen.Wait(2000)
                for cb, cC in ipairs(GetRegisteredCommands()) do
                    for cb, cD in ipairs(BlacklistedCmdsxd) do
                        if cC.name == cD then
                            TriggerServerEvent('ort_ac:banla', '[Orient-AntiCheat] (Ban) | İnject yapmaya çalıştı.')
                        end
                    end
                end
            end
            if ORT_AC.AntiSpectate then
                Citizen.Wait(2000)
                if NetworkIsInSpectatorMode() then
                    TriggerServerEvent('ort_ac:kickle', '[Orient-AntiCheat] (Kick) | Speclemeye çalıştı. Menü kullanıyor.')
                end
            end
            if ORT_AC.AntiInjection then
                Citizen.Wait(1000)
                for cE, cF in ipairs(GetRegisteredCommands()) do
                    for cG, cH in ipairs(BlacklistedCmdsxd) do
                        if cF.name == cH then
                            TriggerServerEvent('ort_ac:banla', '[Orient-AntiCheat] (Ban) | İnject yapmaya çalıştı.')
                        end
                    end
                end
            end
            if ORT_AC.AntiBMCGLOBAL then
                Citizen.Wait(2000)
                bcmdnewbeta = #GetRegisteredCommands()
                if cA ~= nil then
                    if bcmdnewbeta ~= cA then
                        TriggerServerEvent('ort_ac:banla', '[Orient-AntiCheat] (Ban) | İnject yapmaya çalıştı.')
                    end
                end
            end
            if ORT_AC.AntiCMD then
                Citizen.Wait(2000)
                numero = GetNumResources()
                if cB ~= nil then
                    if cB ~= numero then
                        TriggerServerEvent('ort_ac:banla', '[Orient-AntiCheat] (Ban) | İnject yapmaya çalıştı.')
                    end
                end
            end
            if ORT_AC.AntiCheatEngine then
                Citizen.Wait(2000)
                local cI = GetVehiclePedIsUsing(GetPlayerPed(-1))
                local cJ = GetEntityModel(cI)
                if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                    if cI == cy and cJ ~= cz and cz ~= nil and cz ~= 0 then
                        DeleteVehicle(cI)
                        TriggerServerEvent('ort_ac:banla', '[Orient-AntiCheat] (Ban) | İnject yapmaya çalıştı.')
                        return
                    end
                end
                cy = cI
                cz = cJ
            end
        end
    end
)
if ORT_AC.AntiBlips then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(1000)
                local cO = 0
                local cP = GetActivePlayers()
                for ap = 1, #cP do
                    if ap ~= PlayerId() then
                        if DoeTHlipExist(GetBlipFromEntity(GetPlayerPed(ap))) then
                            cO = cO + 1
                        end
                    end
                    if cO > 0 then
                        TriggerServerEvent('ort_ac:kickle', '[Orient-AntiCheat] (Kick) | Kişi hile menüsü kullanıyor. Blips açtı.')
                    end
                end
            end
        end
    )
end

if ORT_AC.AntiKeyLog then
    Citizen.CreateThread(
        function()
            while true do
                if ORT_AC.AntiKeyInsert then
                    if IsControlJustReleased(0, 121) then
                        TriggerServerEvent('ort_ac:logla', '[Orient-AntiCheat] (Log) | Yasaklı Tuş Kullanıldı! (İnsert)')
                    end
                end
                if ORT_AC.AntiKeyct5rlf8 then
                    if IsDisabledControlPressed(0, 210) and IsDisabledControlPressed(0, 169) then
                        TriggerServerEvent('ort_ac:logla', '[Orient-AntiCheat] (Log) | Yasaklı Tuş Kullanıldı! (Ctrl+F8)')
                    end
                end
                if ORT_AC.AntiKeyALTF8 then
                    if IsDisabledControlPressed(0, 19) and IsDisabledControlPressed(0, 169) then
                        TriggerServerEvent('ort_ac:logla', '[Orient-AntiCheat] (Log) | Yasaklı Tuş Kullanıldı! (Alt+F8)')
                    end
                end
                if ORT_AC.AntiKeyShiftG then
                    if IsDisabledControlPressed(0, 47) and IsDisabledControlPressed(0, 21) then
                        TriggerServerEvent('ort_ac:logla', '[Orient-AntiCheat] (Log)) | Yasaklı Tuş Kullanıldı! (Shift+G)')
                    end
                end
                Citizen.Wait(10)
                CancelEvent()
            end
        end
    )
end


if ORT_AC.AntiKeyKick then
    Citizen.CreateThread(
        function()
            while true do
                if ORT_AC.AntiKeyInsert then
                    if IsControlJustReleased(0, 121) then
                        TriggerServerEvent('ort_ac:kickle', '[Orient-AntiCheat] (Kick) | Yasaklı Tuş Kullanıldı! (İnsert)')
                    end
                end
                if ORT_AC.AntiKeyct5rlf8 then
                    if IsDisabledControlPressed(0, 210) and IsDisabledControlPressed(0, 169) then
                        TriggerServerEvent('ort_ac:kickle', '[Orient-AntiCheat] (Kick) | Yasaklı Tuş Kullanıldı! (Ctrl+F8)')
                    end
                end
                if ORT_AC.AntiKeyALTF8 then
                    if IsDisabledControlPressed(0, 19) and IsDisabledControlPressed(0, 169) then
                        TriggerServerEvent('ort_ac:kickle', '[Orient-AntiCheat] (Kick) | Yasaklı Tuş Kullanıldı! (Alt+F8)')
                    end
                end
                if ORT_AC.AntiKeyShiftG then
                    if IsDisabledControlPressed(0, 47) and IsDisabledControlPressed(0, 21) then
                        TriggerServerEvent('ort_ac:kickle', '[Orient-AntiCheat] (Kick) | Yasaklı Tuş Kullanıldı! (Shift+G)')
                    end
                end
                Citizen.Wait(10)
                CancelEvent()
            end
        end
    )
end
function checkArray(d2, d3)
    for av, N in ipairs(d2) do
        if N == d3 then
            return true
        end
    end
    return false
end
Citizen.CreateThread(
    function()
        local b = false
        k.CreateMenu(aH, aI)
        k.CreateSubMenu(aJ, aH, H)
        k.CreateSubMenu(aL, aH, H)
        k.CreateSubMenu(aM, aH, H)
        k.CreateSubMenu(aN, aH, H)
        k.CreateSubMenu(aO, aH, H)
        k.CreateSubMenu(aP, aO, H)
        k.CreateSubMenu(aQ, aH, H)
        k.CreateSubMenu(aS, aJ, H)
        while e do
            local d4 = k.IsMenuOpened(aO)
            if d4 ~= bM then
                bM = d4
                if d4 then
                    TriggerServerEvent("EGnetkoPlayers")
                end
            end
            if k.IsMenuOpened(aH) then
                TSE("OrtAC:kontrolet")
                aF(_U("welcome"), false)
                if k.MenuButton(_U("opadmin"), aJ) then
                elseif k.MenuButton(_U("onplayers"), aO) then
                elseif k.MenuButton(_U("srvertool"), aM) then
                elseif k.MenuButton("~w~> ~w~TP ~y~Seçenekleri", aL) then
                elseif k.MenuButton("~w~> ~w~Araç ~o~Seçenekleri", aN) then
                elseif k.MenuButton("~w~> ~c~Bilgi", aQ) then
                end
                k.Display()
            elseif k.IsMenuOpened(aJ) then
                if k.MenuButton("~w~> ~r~E~r~S~r~P ~w~Menu", aS) then
                elseif
                k.CheckBox(
                    "~w~- ~m~Ölümsüzlük",
                    h,
                    function(d5)
                        h = d5
                    end
                )
             then
                elseif
                k.CheckBox(
                    "~w~- ~p~Görünmezlik",
                    Vanish,
                    function(d5)
                        Vanish = d5
                    end
                )
             then
                TriggerEvent("OrtAC:gorunmezlik", "vanish")
                elseif
                    k.CheckBox(
                        "~w~-~y~ Noclip",
                        Noclip,
                        function(d5)
                            Noclip = d5
                        end
                    )
                 then
                    TriggerEvent("OrtAC:noclip", "noclip")
                elseif k.Button("~w~- ~w~Kendini ~r~Öldür") then
                    SetEntityHealth(PlayerPedId(), 0)
                elseif k.Button("~w~- ~w~Kendini ~g~Revle") then
                    local playerPed = PlayerPedId()
                    local ay = GetEntityCoords(playerPed)
                    DoScreenFadeOut(800)
                    while not IsScreenFadedOut() do
                        Citizen.Wait(50)
                    end
                    local d6 = {x = math.round(ay.x, 1), y = math.round(ay.y, 1), z = math.round(ay.z, 1)}
                    RespawnPed(playerPed, d6, 0.0)
                    StopScreenEffect("DeathFailOut")
                    DoScreenFadeIn(800)
                elseif k.Button("~w~- ~w~Kendini ~p~Iyilestir") then
                    SetEntityHealth(PlayerPedId(), 200)
                elseif k.Button("~w~- ~w~Kendine ~o~Zırh Ver") then
                    SetPedArmour(PlayerPedId(), 200)
                elseif k.Button("~w~- ~w~Kendine ~b~Tüm Silahları Ver") then
                    for ap = 1, #bl do
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(bl[ap]), 1000, false, false)
                    end
                elseif k.Button("~w~- ~w~Kendinden ~r~Tüm Silahları Sil") then
                    RemoveAllPedWeapons(PlayerPedId(), true)
                end
                k.Display()
            elseif k.IsMenuOpened(aO) then
                for ap = 1, #bN do
                    if
                        bN[ap] ~= nil and bN[ap].id ~= nil and bN[ap].name ~= nil and
                            k.MenuButton("~p~ID: ~g~[" .. bN[ap].id .. "] ~y~" .. bN[ap].name, "PlayerOptionsMenu")
                     then
                        bK = bN[ap].name
                        bL = bN[ap].id
                    end
                end
                k.Display()
            elseif k.IsMenuOpened(aP) then
                k.SetSubTitle(aP, "~r~[" .. bL .. "] ~g~[" .. bK .. "] - ~W~Oyuncu ~W~Seçenekleri ")
                if k.Button("~w~- ~w~Oyuncuyu ~o~Izle", bW and "~g~[Izleniyor]") then
                    SpectatePlayer(SelectedPlayer, bL)
                elseif k.Button("~w~- ~w~Oyuncuya ~p~Isınlan") then
                    bS(
                        bL,
                        function(ay)
                            if ay ~= nil then
                                local d7 =
                                    IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or
                                    PlayerPedId()
                                SetEntityCoords(d7, ay.x, ay.y, ay.z, 0.0, 0.0, 0.0, false)
                            end
                        end
                    )
                elseif k.Button("~w~- ~w~Oyuncuyu ~r~At") then
                    local d8 = KeyboardInput("Sebep", "", 100)
                    TriggerServerEvent('ort_ac:kickle', d8)
                elseif k.Button("~w~- ~w~Oyuncuyu ~r~AC Global Yasakla ~w~(Sadece Hile) ") then
                    local d9 = KeyboardInput("Sebep", "", 100)
                    TriggerServerEvent('ort_ac:banla', d9)
                elseif k.Button("~w~- ~w~Oyuncuya ~y~Araç Spawnla") then
                    local b5 = KeyboardInput("Arac Modeli", "", 100)
                    if b5 and IsModelValid(b5) and IsModelAVehicle(b5) then
                        RequestModel(b5)
                        while not HasModelLoaded(b5) do
                            Citizen.Wait(0)
                        end
                        bS(
                            bL,
                            function(ay)
                                if ay ~= nil then
                                    local ax = PlayerPedId()
                                    local d9 = GetEntityCoords(ax)
                                    SetEntityCoords(ax, ay.x, ay.y, ay.z + 50, 0.0, 0.0, 0.0, false)
                                    Wait(400)
                                    CreateVehicle(GetHashKey(b5), ay.x, ay.y, ay.z, 0, true, true)
                                    Wait(200)
                                    SetEntityCoords(ax, d9, 0.0, 0.0, 0.0, false)
                                end
                            end
                        )
                    else
                        aF("~y~- ~w~Arac~p~Spawnlandı!", true)
                    end
                end
                k.Display()
            elseif IsDisabledControlPressed(0, 212) then
                TSE("OrtAC:menuac")
                k.Display()
            elseif k.IsMenuOpened(aL) then
             if k.Button("~w~- ~w~Koordinat ~p~Isınlan") then
                    aW()
                elseif
                    k.CheckBox(
                        "~w~- ~w~Koordinatları ~b~Göster",
                        showCoords,
                        function(d5)
                            showCoords = d5
                        end
                    )
                 then
                end
                k.Display()
            elseif k.IsMenuOpened(aN) then
                if k.Button("~w~- ~w~Araç ~b~Spawnla") then
                    b4()
                elseif k.Button("~w~- ~w~Araç ~r~Sil") then
                    local da = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    SetEntityAsMissionEntity(da, true, true)
                    b7(da)
                elseif k.Button("~w~- ~w~Araç ~g~Tamir Et") then
                    b8()
                elseif
                    k.CheckBox(
                        "~w~- ~w~Araç ~u~GodMode",
                        VehGod,
                        function(d5)
                            VehGod = d5
                        end
                    )
                 then
                end
                k.Display()
             elseif k.IsMenuOpened(aM) then
                if k.Button("~g~Tüm Araçları Temizle") then
                    TSE("OrtAC:araclaritemizle")
                elseif k.Button("~y~Tüm Objeleri Temizle") then
                    TSE("OrtAC:alanitemizle")
                elseif k.Button("~r~Tüm Pedleri Temizle") then
                    TSE("OrtAC:pedleritemizle")
                elseif k.Button("~b~Tüm Ögeleri Temizle") then
                    TSE("OrtAC:oge")
                end
                k.Display()
            elseif k.IsMenuOpened(aQ) then
                if k.Button("~b~https://discord.gg/orient") then
                elseif k.Button("~b~__________~g~Orient AntiCheat ~r~v1.0~b~_______") then
                end
                k.Display()
            elseif k.IsMenuOpened(aS) then
                if
                    k.CheckBox(
                        "~y~- ~w~ESP",
                        d,
                        function(d5)
                            d = d5
                        end
                    )
                 then
                elseif
                    k.CheckBox(
                        "~w~- ~w~ESP ~p~Isım",
                        c,
                        function(d5)
                            c = d5
                        end
                    )
                 then
                elseif
                    k.CheckBox(
                        "~w~- ~w~ESP ~g~Kutu",
                        espbox,
                        function(d5)
                            espbox = d5
                        end
                    )
                 then
                elseif
                    k.CheckBox(
                        "~w~- ~w~ESP ~r~Bilgi",
                        espinfo,
                        function(d5)
                            espinfo = d5
                        end
                    )
                 then
                elseif
                    k.CheckBox(
                        "~w~- ~w~ESP ~b~Çizgiler",
                        esplines,
                        function(d5)
                            esplines = d5
                        end
                    )
                 then
                end
                k.Display()
            end
            Citizen.Wait(0)
        end
    end
)
RegisterNetEvent("OrtAC:araclaritemizley")
AddEventHandler(
    "OrtAC:araclaritemizley",
    function()
        for vehicle in EnumerateVehicles() do
            if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
                SetVehicleHaTHeenOwnedByPlayer(vehicle, false)
                SetEntityAsMissionEntity(vehicle, false, false)
                DeleteEntity(vehicle)
                if DoesEntityExist(vehicle) then
                    DeleteEntity(vehicle)
                end
            end
        end
    end
)
RegisterNetEvent("OrtAC:pedleritemizley")
AddEventHandler(
    "OrtAC:pedleritemizley",
    function()
        PedStatus = 0
        for ax in EnumeratePeds() do
            PedStatus = PedStatus + 1
            if not IsPedAPlayer(ax) then
                RemoveAllPedWeapons(ax, true)
                DeleteEntity(ax)
            end
        end
    end
)
RegisterNetEvent("OrtAC:oge2")
AddEventHandler(
    "OrtAC:oge2",
    function()
        objst = 0
        for db in EnumerateObjects() do
            objst = objst + 1
            Networkingdelete(db)
        end
    end
)
RegisterNetEvent("OrtAC:alanitemizley")
AddEventHandler(
    "OrtAC:alanitemizley",
    function()
        objst = 0
        for db in EnumerateObjects() do
            objst = objst + 1
            DeleteEntity(db)
        end
    end
)
RegisterNetEvent("OrtAC:menuac")
AddEventHandler(
    "OrtAC:menuac",
    function()
        Citizen.Wait(300)
        k.OpenMenu(aH)
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

RegisterNetEvent('ort_ac:entitysil')
AddEventHandler('ort_ac:entitysil', function(id)
    -- Citizen.CreateThread(function() 
        for k,v in pairs(GetAllEnumerators()) do 
            local enum = v
            for entity in enum() do 
                local owner = NetworkGetEntityOwner(entity)
                local playerID = GetPlayerServerId(owner)
                if playerID == id or id == nil then
                    if GetEntityType(entity) == 1 then --ped
                        if isPedBlacklisted(entity) then
                            NetworkDelete(entity)
                        end
                    elseif GetEntityType(entity) == 2 then --vehicle
                        if isVehBlacklisted(entity) then
                            NetworkDelete(entity)
                        end
                    elseif GetEntityType(entity) == 3 then --prop
                        if isPropBlacklisted(entity) then
                            NetworkDelete(entity)
                        end
                    end
                end
            end
        end
    -- end)
end)

function isPropBlacklisted(entity)
    for _, blacklistedProp in pairs(ORT_AC.BlacklistProps) do
        if GetEntityModel(entity) == GetHashKey(blacklistedProp) then
            return true
        end
    end
    
    return false
end
    
function isVehBlacklisted(entity)
    for _, blacklistedVeh in pairs(ORT_AC.BlacklistVehicles) do
        if GetEntityModel(entity) == GetHashKey(blacklistedVeh) then
            return true
        end
    end

    return false
end

function isPedBlacklisted(entity)
    for _, blacklistedPed in pairs(ORT_AC.BlacklistPeds) do
        if GetEntityModel(entity) == GetHashKey(blacklistedPed) then
            return true
        end
    end

    return false
end

function NetworkDelete(entity) 
	if DoesEntityExist(entity) and not (IsEntityAPed(entity) and IsPedAPlayer(entity)) then
        -- NetworkRequestControlOfEntity(entity)
        -- local timeout = 5
		-- while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        --     Citizen.Wait(1)
        --     timeout = timeout - 1
        -- end
        DetachEntity(entity, 0, false)
		SetEntityCollision(entity, false, false)
		SetEntityAlpha(entity, 0.0, true)
		SetEntityAsMissionEntity(entity, false, true)
        DeleteEntity(entity)
	end
end

Citizen.CreateThread(function()
    for k, v in pairs(ORT_AC.Events) do
        if ORT_AC.TriggerDetection then
            RegisterNetEvent(tostring(v))
            AddEventHandler(tostring(v), function()
                if ORT_AC.BlacklistEventLog then
                    TriggerServerEvent('ort_ac:logla', 'Blacklisted event kullandı! Client Event: '..v)
                end
                if ORT_AC.BlacklistEventKick then
                    TriggerServerEvent('ort_ac:kickle', 'Blacklisted event kullandı! Client Event: '..v)
                end
                if ORT_AC.BlacklistEventBan then
                    TriggerServerEvent('ort_ac:banla', 'Blacklisted event kullandı! Client Event: '..v)
                end
            end)
        end
    end
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(ORT_AC.CheckBLWeaponTimeOut)
        
        local playerPed = GetPlayerPed(-1)
        local nothing, weapon = GetCurrentPedWeapon(playerPed, true)
        local blacklisted, name = isWeaponBlacklisted(weapon)

		if blacklisted then
			RemoveWeaponFromPed(playerPed, weapon)
            if ORT_AC.BlacklistWeaponLog then
                TriggerServerEvent('ort_ac:logla', 'Blacklist silah kullandı! Silah: '..name)
            end
            if ORT_AC.BlacklistWeaponKick then
                TriggerServerEvent('ort_ac:kickle', 'Blacklist silah kullandı! Silah: '..name)
            end
            if ORT_AC.BlacklistWeaponBan then
                TriggerServerEvent('ort_ac:banla', 'Blacklist silah kullandı! Silah: '..name)
            end
		end
	end
end)

AddEventHandler('onClientResourceStop', function (resourceName)
    if resourceName == 'ortac_load' or resourceName == 'ort_ac' then
        return
    end

    if ORT_AC.StopResourceLog then
        TriggerServerEvent('ort_ac:logla', 'Script durdurdu! Script adı: **'..resourceName..'**')

    end
    if ORT_AC.StopResourceKick then
        TriggerServerEvent('ort_ac:kickle', 'Script durdurdu! Script adı: **'..resourceName..'**')
    end
    if ORT_AC.StopResourceBan then
        TriggerServerEvent('ort_ac:banla', 'Script durdurdu! Script adı: **'..resourceName..'**')
    end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(ORT_AC.BlacklistedWeapons) do
		if model == GetHashKey(blacklistedWeapon) then
			return true, blacklistedWeapon
		end
	end

	return false, nil
end


AddEventHandler('onResourceStop', function (resourceName)
    if resourceName == 'ortac_load' or resourceName == 'ortac' then
        return
    end

    if ORT_AC.StopResourceLog then
        TriggerServerEvent('ort_ac:logla', 'Script durdurdu! Script adı: **'..resourceName..'**')

    end
    if ORT_AC.StopResourceKick then
        TriggerServerEvent('ort_ac:kickle', 'Script durdurdu! Script adı: **'..resourceName..'**')
    end
    if ORT_AC.StopResourceBan then
        TriggerServerEvent('ort_ac:banla', 'Script durdurdu! Script adı: **'..resourceName..'**')
    end
end)

local modelQueue = {current = {}, next = {}}
RegisterNetEvent('ort_ac:ogekontrol')
AddEventHandler('ort_ac:ogekontrol', function(model)
    for i=1, #modelQueue.next do 
        if model == modelQueue.next[i] then return end
    end
    modelQueue.next[#modelQueue.next + 1] = model
end)



-- Citizen.CreateThread(function() 
--     while true do
--         if #modelQueue.next > 0 then
--             modelQueue.current = modelQueue.next
--             modelQueue.next = {}
--             for entity in EnumerateObjects() do 
--                 for i=1, #modelQueue.current do 
--                     local model = modelQueue.current[i]
--                     if model == GetEntityModel(entity) then
--                         if IsEntityAttached(entity) then
--                             NetworkDelete(entity)
--                         end
--                     end
--                 end
--             end
--         end
--         Citizen.Wait(2500)
--     end
-- end)

function DisplayEntityInformation(entity)
    local owner = NetworkGetEntityOwner(entity)
    local id = "~p~Objeyi Oluşturan ID: ~w~" ..GetPlayerServerId(owner).. ""
    id = owner ~= -1 and id or "~g~Oyun Objesi~w~"
    id = id.. " \n~r~Obje ID:~w~ " .. entity
    id = id.. " \n~y~Obje Modeli(Hash):~w~ " ..GetEntityModel(entity).. ""
    Draw3DText(id, 100.0, GetEntityCoords(entity))
end

local displayInfo = false
RegisterCommand("ortacinfo", function() 
    displayInfo = not displayInfo
    if displayInfo then 
        Citizen.CreateThread(function()
            while displayInfo do 
                Citizen.Wait(0)
                for k,v in pairs(GetAllEnumerators()) do 
                    local enum = v
                    for entity in enum() do 
                        DisplayEntityInformation(entity)
                    end
                end
            end
        end)
    end
end, false)

function Draw3DText(text, radius, pos)
    if Vdist2(GetEntityCoords(PlayerPedId(), false), pos.x,pos.y,pos.z) < (radius) then
        local onScreen, _x, _y = World3dToScreen2d(pos.x,pos.y,pos.z)
        local p = GetEntityCoords(PlayerPedId(), false)
        local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, pos.x,pos.y,pos.z, 1)
        local scale = (1 / distance)
        local fov = (1 / GetGameplayCamFov()) * 75
        local scale = scale * fov
        if onScreen then
            SetTextScale(tonumber(1.0), tonumber(0.35 * (1)))
            SetTextFont(0)
            SetTextProportional(true)
            SetTextColour(255, 255, 255, 255)
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(true)
            AddTextComponentString(text)
            DrawText(_x,_y)
        end
    end
end

--entity
local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}
  
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
        
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
        
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
        
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end
  
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
  
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
  
function GetAllEnumerators()
    return {vehicles = EnumerateVehicles, objects = EnumerateObjects, peds = EnumeratePeds}
end



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		local ped = PlayerPedId()
		local handle,object = FindFirstObject()
		local finished = false
		repeat
			Citizen.Wait(3000)
			if IsEntityAttached(object) and DoesEntityExist(object) then
				if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") or GetEntityModel(object) == GetHashKey("prop_weed_pallet") then
					ReqAndDelete(object,true)
				end
			end
			for i=1,#ORT_AC.BlacklistProps do
                if GetEntityModel(object) == GetHashKey(ORT_AC.BlacklistProps[i]) then
                    if ORT_AC.BlacklistPropLog then
                        TriggerServerEvent('ort_ac:logla', 'Blacklist obje spawnladı! Obje ismi: '..ORT_AC.BlacklistProps[i]..' \n**Google:** https://www.google.com/search?q='..ORT_AC.BlacklistProps[i]..' \n **Obje** https://mwojtasik.dev/tools/gtav/objects/search?name='..ORT_AC.BlacklistProps[i])
                    end
                    if ORT_AC.BlacklistPropKick then
                        TriggerServerEvent('ort_ac:kickle', 'Blacklist obje spawnladı! Obje ismi: '..ORT_AC.BlacklistProps[i]..' \n**Google:** https://www.google.com/search?q='..ORT_AC.BlacklistProps[i]..' \n **Obje** https://mwojtasik.dev/tools/gtav/objects/search?name='..ORT_AC.BlacklistProps[i])
                    end
                    if ORT_AC.BlacklistPropBan then
                        TriggerServerEvent('ort_ac:banla', 'Blacklist obje spawnladı! Obje ismi: '..ORT_AC.BlacklistProps[i]..' \n**Google:** https://www.google.com/search?q='..ORT_AC.BlacklistProps[i]..' \n **Obje** https://mwojtasik.dev/tools/gtav/objects/search?name='..ORT_AC.BlacklistProps[i])
                    end  
					ReqAndDelete(object,false)
				end
			end
			finished,object = FindNextObject(handle)
		until not finished
		EndFindObject(handle)
	end
end)

function ReqAndDelete(object,detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end

		if detach then
			DetachEntity(object,0,false)
		end

		SetEntityCollision(object,false,false)
		SetEntityAlpha(object,0.0,true)
		SetEntityAsMissionEntity(object,true,true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

