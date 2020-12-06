ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('paketti', function(source) --## Add your own item
  local Player = ESX.GetPlayerFromId(source)
  TriggerClientEvent('paketti:anna', source)
  Player.removeInventoryItem('paketti', 1) --## add your own item
  
end)

RegisterServerEvent('paketti:annalahja')
AddEventHandler('paketti:annalahja', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  local lahja = math.random(1,2048) 
	
	if lahja >= 1 and lahja <= 60 then
		xPlayer.addInventoryItem('goldbar', 100) --## add/modify your own items
	elseif lahja >= 61 and lahja <=100 then
		xPlayer.addInventoryItem('rolex', 1) 
	elseif lahja >= 101 and lahja <= 130 then
		xPlayer.addInventoryItem('rolex', 2)
	elseif lahja >= 900 and lahja <= 901 then
		xPlayer.addInventoryItem('autokuponki', 1)
	elseif lahja >= 1500 and lahja <= 1501 then
		xPlayer.addInventoryItem('autokuponki2', 1)
	else
		xPlayer.addAccountMoney('bank', 50000) 
	end
end)
