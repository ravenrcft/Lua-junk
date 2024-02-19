math.randomseed(os.time())


--local duplicates = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0}

--local resources = {}
local workforce = 0
local parts = 0
local food = 0

local count = 0

while true do
	print("+++++")
	count = count + 1
	print("Step [" .. count .. "]")

	-- Random number generator
	-- 1 and 2 are Workforce
	-- 3 and 4 are Parts
	-- 5 and 6 are Food
	-- Check resource table to see if it has any duplicates
	-- If so, add +10 to the respective resource
	-- Also, find and delete the array index in the resource table
	local roll = 0
	local duplicates = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0}

	for i = 1, 6 do
		local randNum = math.random(6)
		roll = roll + 1
		print("=====")
		print("Roll#" .. roll .. " / Die:" .. randNum)


		duplicates[randNum] = duplicates[randNum] + 1
		for k,v in ipairs(duplicates) do
			print(k,v)
			if v > 1 then
				print("Key: " .. k .. " has a value of " .. v)
				print("duplicates[k] = " .. duplicates[k])
				if k == 1 then
					workforce = workforce + 10
					duplicates[k] = 0
					print("workforce ++")
				elseif k == 2 then
					workforce = workforce + 10
					duplicates[k] = 0
					print("workforce ++")
				elseif k == 3 then
					parts = parts + 10
					duplicates[k] = 0
					print("parts ++")
				elseif k == 4 then
					parts = parts + 10
					duplicates[k] = 0
					print("parts ++")
				elseif k == 5 then
					food = food + 10
					duplicates[k] = 0
					print("food ++")
				elseif k == 6 then
					food = food + 10
					duplicates[k] = 0
					print("food ++")
				end
			end
		end
	end

	if count >= 7 then break end
end

print("workforce: " .. workforce .. " / parts: " .. parts .. " / food: " .. food)
