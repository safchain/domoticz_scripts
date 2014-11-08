-- Script to manage Somfy RTS devices
-- Author: Sylvain Afchain <safchain@gmail.com>

states = {Open="up", Closed="down"}

function srts(device, address, command)
	print(string.format("Somfy RTS changes state of %s(%s) from %s state to %s",
        device, address, states[command], command))
	os.execute(string.format("srts --gpio 0 --address %s --command %s",
        address, string.lower(states[command])))
end

name_to_address = {}

-- Edit the device name/address according to your devices
name_to_address["Volet roulant Marion"] = "5555"
name_to_address["Volet roulant Emma"] = "6666"

commandArray = {}
for device, command in pairs(devicechanged) do
	if name_to_address[device] ~= nil then
		srts(device, name_to_address[device], command)
	end
end
return commandArray
