ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent("paketti:anna")
AddEventHandler("paketti:anna", function()
  ESX.UI.Menu.CloseAll()
  
  Citizen.Wait(100)
  annaLahja()
  pakettinotif()
end)

function annaLahja()
  TriggerServerEvent('paketti:annalahja')
end


function pakettinotif()
  ESX.ShowNotification("~w~You ~g~opened~w~Your ~b~gift! ~n~~r~Merry ~r~Xmas!")
end

