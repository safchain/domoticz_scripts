-- Script to manage homeasy switch devices compatible
-- Author: Sylvain Afchain <safchain@gmail.com>

states = {On="off", Off="on"}

function homeasy(device, address, command)
	print(string.format("Homeasy changes state of %s(%s) from %s state to %s",
        device, address, states[command], command))
	os.execute(string.format("homeasy --gpio 0 --address %s --command %s",
        address, string.lower(states[command])))
end

name_to_address = {}

-- Edit the device name/address according to your devices
name_to_address["Chauffe serviettes rdc"] = "12325261"

commandArray = {}
for device, command in pairs(devicechanged) do
	if name_to_address[device] ~= nil then
		homeasy(device, name_to_address[device], command)
	end
end
return commandArray
