-- Script édité le 06.06.2017 par [GDN]Ashgal

-- Fonction pour l'edition de texte dans le champs de noticifation
function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

-- Script d'usure avancée du moteur des véhicules
Citizen.CreateThread(function()

	while true do
		
		Citizen.Wait(0)

		ped = GetPlayerPed(-1)
		if ped then
			vehicle = GetVehiclePedIsIn(ped, false)
			if vehicle and GetPedInVehicleSeat(vehicle, -1) == ped then
				Citizen.Wait(200)
				
				-- On check l'état du moteur, s'il se trouve entre 15 et 950, nous le forçons à 15 
				if GetVehicleEngineHealth(vehicle) >14 and GetVehicleEngineHealth(vehicle) < 900 then 
				   SetVehicleEngineHealth(vehicle, 15.0)
				   ShowNotification("~w~Le ~b~moteur ~w~est ~r~trop endommagé.~n~ ~w~Appelez un dépanneur!") 
				   -- On reduit drastiquement la puissance moteur
				   SetVehicleEnginePowerMultiplier(vehicle, -80.0)
				   -- On active les warnings
				   SetVehicleIndicatorLights(vehicle, 0, 1)
				   SetVehicleIndicatorLights(vehicle, 1, 1)


			   	elseif GetVehicleEngineHealth(vehicle) >= 900 then
			   		   SetVehicleEnginePowerMultiplier(vehicle, 0.0)


				end
			end
		end

	end
end)

