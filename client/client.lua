local QBCore = exports['qb-core']:GetCoreObject()
local emsbag1 = nil
local function dropemsbag()
    DetachEntity(emsbag1)
    PlaceObjectOnGroundProperly(emsbag1)
end
local function spawnemsbag()
    local hasBag = true
    CreateThread(function()
        while hasBag do
            Wait(0)
            if IsControlJustReleased(0, 38) then -- If E is pressed it drop the  bag
                hasBag = false
                dropemsbag()
                Wait(1500)
            end
        end
    end)
end
local ObjectList = {}

RegisterNetEvent('qb-paramedicbag:Client:SpawnAmbulanceBag', function()
    local hash = GetHashKey('prop_cs_shopping_bag')
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.5))
    QBCore.Functions.LoadModel(hash)
    emsbag1 = CreateObjectNoOffset(hash, x, y, z, true, false)
    SetModelAsNoLongerNeeded(hash)
    AttachEntityToEntity(emsbag1, ped, GetPedBoneIndex(ped, 57005), 0.42, 0, -0.05, 0.10, 270.0, 60.0, true, true, false,
        true, 1, true)
        spawnemsbag()
    TriggerServerEvent("qb-paramedicbag:Server:RemoveItem","emsbag",1)
end)

RegisterNetEvent('qb-paramedicbag:Client:spawnLight', function()

    TriggerServerEvent("qb-paramedicbag:Server:SpawnAmbulanceBag", "emsbag")
end)

RegisterNetEvent('qb-paramedicbag:Client:GuardarAmbulanceBag')
AddEventHandler("qb-paramedicbag:Client:GuardarAmbulanceBag", function()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local playerPedPos = GetEntityCoords(PlayerPedId(), true)
    local AmbulanceBag = GetClosestObjectOfType(playerPedPos, 10.0, GetHashKey("prop_cs_shopping_bag"), false, false, false)
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar("ems bag", "Taking Back the Paramedic Bag...", 1500, false, true, {
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
    QBCore.Functions.Notify(("Paramedic Bag Taken Back with success."), "success", 2500)
    SetEntityAsMissionEntity(AmbulanceBag, 1, 1)
    DeleteObject(AmbulanceBag)
    TriggerServerEvent("qb-paramedicbag:Server:AddItem","emsbag",1)
end)

local citizenid = nil
AddEventHandler("qb-paramedicbag:Client:StorageAmbulanceBag", function()
    local charinfo = QBCore.Functions.GetPlayerData().charinfo
    citizenid = QBCore.Functions.GetPlayerData().citizenid
    TriggerEvent("inventory:client:SetCurrentStash", "Ambulance Bag",citizenid)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Ambulance Bag",citizenid, {
        maxweight = Config.Stash.MaxWeighStash,
        slots = Config.Stash.MaxSlotsStash,
    })
end)

local AmbulanceBags = {
    `prop_cs_shopping_bag`,
}

exports['qb-target']:AddTargetModel(AmbulanceBags, {
    options = {
        {
            event = "qb-paramedicbag:Client:MenuAmbulanceBag",
            icon = "fa-solid fa-suitcase-medical",
            label = "Paramedic Bag"
        },
        {
            event = "qb-paramedicbag:Client:GuardarAmbulanceBag",
            icon = "fa-solid fa-suitcase-medical",
            label = "Take Back Paramedic Bag"
        }
    },
    distance = 2.5,
})