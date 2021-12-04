ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem(Config.ItemName, function(source)
  local	_source = source
  local Player = ESX.GetPlayerFromId(_source)
  Player.removeInventoryItem(Config.ItemName, 1)
  TriggerClientEvent('esx:showNotification', source, '3')
  Wait(1000)
  TriggerClientEvent('esx:showNotification', source, '2')
  Wait(1000)
  TriggerClientEvent('esx:showNotification', source, '1')
  Wait(1000)
  TriggerClientEvent('esx:showNotification', source, Config.OpeningBox)
  PakettiLahja(Player)
end)

function PakettiLahja(xPlar)
  local Gift = math.random(1, 2048)

	if Gift >= 1 and Gift <= 60 then
		xPlar.addInventoryItem('goldbar', 100)

	elseif lahja >= 61 and Gift <=100 then
		xPlar.addInventoryItem('rolex', 1)

	elseif Gift >= 101 and Gift <= 130 then
		xPlar.addInventoryItem('rolex', 2)

	elseif Gift >= 900 and Gift <= 901 then
		xPlar.addInventoryItem('autokuponki', 1)

	elseif Gift >= 1500 and Gift <= 1501 then
		xPlar.addInventoryItem('autokuponki2', 1)

	else
		xPlar.addAccountMoney('bank', Config.RandomMoneyAmount)
	end

end
