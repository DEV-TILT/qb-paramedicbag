local QBCore = exports['qb-core']:GetCoreObject()


-- Simple Event's , you can create yours and put on qb-menu :)

RegisterNetEvent('qb-paramedicbag:Client:GiveRadio')
AddEventHandler("qb-paramedicbag:Client:GiveRadio", function()
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar("ems bag", "Taking a Radio", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
    end)
    Wait(1500)
    TriggerServerEvent("qb-paramedicbag:Server:AddItem", "radio", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["radio"], "add", 1)
end)

RegisterNetEvent('qb-paramedicbag:Client:Givebandage')
AddEventHandler("qb-paramedicbag:Client:Givebandage", function()
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar("ems bag", "Taking a Bandage", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
    end)
    Wait(1500)
    TriggerServerEvent("qb-paramedicbag:Server:AddItem", "bandage", 3)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bandage"], "add", 3)
end)
RegisterNetEvent('qb-paramedicbag:Client:Givepainkillers')
AddEventHandler("qb-paramedicbag:Client:Givepainkillers", function()
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar("ems bag", "Taking Painkillers", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
    end)
    Wait(1500)
    TriggerServerEvent("qb-paramedicbag:Server:AddItem", "painkillers", 2)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["painkillers"], "add", 2)
end)
RegisterNetEvent('qb-paramedicbag:Client:Givefirstaid')
AddEventHandler("qb-paramedicbag:Client:Givefirstaid", function()
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar("ems bag", "Taking Firstaid", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
    end)
    Wait(1500)
    TriggerServerEvent("qb-paramedicbag:Server:AddItem", "firstaid", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["firstaid"], "add", 1)
end)
RegisterNetEvent('qb-paramedicbag:Client:Giveweapon_flashlight')
AddEventHandler("qb-paramedicbag:Client:Giveweapon_flashlight", function()
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar("ems bag", "Taking Flashlight", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
    end)
    Wait(1500)
    TriggerServerEvent("qb-paramedicbag:Server:AddItem", "weapon_flashlight", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weapon_flashlight"], "add", 1)
end)


RegisterNetEvent('qb-paramedicbag:Client:MenuAmbulanceBag', function()
    local playerPed = PlayerPedId()
    if IsEntityDead(playerPed) then return QBCore.Functions.Notify(("You cannot Open Bag while dead"), "error", 2500) end
    if IsPedSwimming(playerPed) then return QBCore.Functions.Notify(("You cannot Open Bag in the water."), "error", 2500) end
    if IsPedSittingInAnyVehicle(playerPed) then return QBCore.Functions.Notify(("You cannot Open Bag inside a vehicle"), "error", 2500) end
    exports['qb-menu']:openMenu({
        { header = "[🚑] Ambulance Box", txt = "", isMenuHeader = true },
        { header = "[👜] Open AmbulanceBag",  params = { event = "qb-paramedicbag:Client:StorageAmbulanceBag" } },
        { header = "[🩹]Take Bandage ",  params = { event = "qb-paramedicbag:Client:Givebandage" } },
        { header = "[💊] Take Painkillers ",  params = { event = "qb-paramedicbag:Client:Givepainkillers" } },
        { header = "[💉] Take Firstaid ",  params = { event = "qb-paramedicbag:Client:Givefirstaid" } },
        { header = "[🔦] Take FlashLight ",  params = { event = "qb-paramedicbag:Client:Giveweapon_flashlight" } },
        { header = "[📻] Take Radio",  params = { event = "qb-paramedicbag:Client:GiveRadio" } },
        -- You can add more menus with your's personal events...
        { header = "", txt = "❌ Close", params = { event = "qb-menu:closeMenu" } },
    })
end)

RegisterNetEvent('qb-paramedicbag:Client:MenuAmbulanceBag', function()
    local playerPed = PlayerPedId()
    if IsEntityDead(playerPed) then return QBCore.Functions.Notify(("You cannot Open Bag while dead"), "error", 2500) end
    if IsPedSwimming(playerPed) then return QBCore.Functions.Notify(("You cannot Open Bag in the water."), "error", 2500) end
    if IsPedSittingInAnyVehicle(playerPed) then return QBCore.Functions.Notify(("You cannot Open Bag inside a vehicle"), "error", 2500) end
    exports['qb-menu']:openMenu({
        { header = "[🚑] Ambulance Box", txt = "", isMenuHeader = true },
        { header = "[👜] Open AmbulanceBag",  params = { event = "qb-paramedicbag:Client:StorageAmbulanceBag" } },
        { header = "[🩹]Take Bandage ",  params = { event = "qb-paramedicbag:Client:Givebandage" } },
        { header = "[💊] Take Painkillers ",  params = { event = "qb-paramedicbag:Client:Givepainkillers" } },
        { header = "[💉] Take Firstaid ",  params = { event = "qb-paramedicbag:Client:Givefirstaid" } },
        { header = "[🔦] Take FlashLight ",  params = { event = "qb-paramedicbag:Client:Giveweapon_flashlight" } },
        { header = "[📻] Take Radio",  params = { event = "qb-paramedicbag:Client:GiveRadio" } },
        -- You can add more menus with your's personal events...
        { header = "", txt = "❌ Close", params = { event = "qb-menu:closeMenu" } },
    })
end)
