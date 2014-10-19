-- Script to manage chacon dio switch devices
-- Author: Sylvain Afchain

states = {On="Off", Off="On"}

function chacon(device, code, state) 
	print(string.format("Change Chacon DIO state of %s(%s) from %s state to %s", device, code, states[state], state))
	os.execute(string.format("chacon 0 %s 1 %s", code, string.lower(states[state])))
end

name_to_code = {}

-- Edit the device name dio code according to your devices
name_to_code["Chauffe serviettes rdc"] = "12325261"

commandArray = {}
for device, state in pairs(devicechanged) do
	if name_to_code[device] ~= nil then
		chacon(device, name_to_code[device], state)
	end
end
return commandArray
