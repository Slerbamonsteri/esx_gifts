ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local fileName = "Log"
local resourceDirectory = "resources/"..GetCurrentResourceName().."/"

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
  PakettiLahja(_source, Player)
end)

function PakettiLahja(src, xPlar)
  local Gift = math.random(1, 2048)

	if Gift >= 1 and Gift <= 60 then
		xPlar.addInventoryItem('goldbar', 100)
		WriteLog(src, "Unboxed "..Config.ItemName.." and got Goldbar")

	elseif lahja >= 61 and Gift <=100 then
		xPlar.addInventoryItem('rolex', 1)
		WriteLog(src, "Unboxed "..Config.ItemName.." and got rolex")

	elseif Gift >= 101 and Gift <= 130 then
		xPlar.addInventoryItem('rolex', 2)
		WriteLog(src, "Unboxed "..Config.ItemName.." and got rolex x2")

	elseif Gift >= 900 and Gift <= 901 then
		xPlar.addInventoryItem('autokuponki', 1)
		WriteLog(src, "Unboxed "..Config.ItemName.." and got autokuponki")

	elseif Gift >= 1500 and Gift <= 1501 then
		xPlar.addInventoryItem('autokuponki2', 1)
		WriteLog(src, "Unboxed "..Config.ItemName.." and got autokuponki2")

	else
		local Money = Config.RandomMoneyAmount
		RealMoney = Money

		xPlar.addAccountMoney('bank', RealMoney)
		WriteLog(src, "Unboxed "..Config.ItemName.." and got some money in bank: "..RealMoney)

	end

end

function WriteLog(source, action)
    local time = os.date("%m/%d/%Y %I:%M %p")
	local name = GetPlayerName(source)

	for k, v in ipairs(GetPlayerIdentifiers(source)) do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			IDSteam = v
		end
		if string.sub(v, 1, string.len("license:")) == "license:" then
			IDRock = v
		end
		if string.sub(v, 1, string.len("discord:")) == "discord:" then
			IdDisc = v
		end
	end

	if IDSteam == nil then 
		IDSteam = "N/A"
	end

	if IDRock == nil then
		IDRock = "N/A"
	end

	if IdDisc == nil then 
		IdDisc = "N/A"
	end

	if name == nil then 
		name = "N/A"
	end
	
	if source == nil then
		source = "N/A"
	end

    file = io.open(resourceDirectory .. fileName .. ".txt", "a")
    if file then
        file:write("Time: [" .. time .. "] | Name: " .. name .. " | Steam: " .. IDSteam .. " -> License: " .. IDRock .. " -> Discord: " .. IdDisc .. " ( Action: " .. action .. " ) \r\n")
    end
    file:close()
end
