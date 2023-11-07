--lua 5.3.5 
math.randomseed(os.time())
-- Roll dice 
-- If there are duplicates, 
-- they are removed and you add up the face value of the remaining dice until you only have 2 or less dice.


local collection = 20
local sum = 0
local roll = {}
local duplicates = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0}
--local remainder = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0}
local diceIcon = {[1] = "\u{2680}", [2] = "\u{2681}", [3] = "\u{2682}", [4] = "\u{2683}", [5] = "\u{2684}", [6] = "\u{2685}"}

for i = 1, 6 do
  local randNum = math.random(1, 6)
  table.insert(roll, randNum)
  
  duplicates[randNum] = duplicates[randNum] + 1  
end

for k, v in pairs(roll) do
  io.write(diceIcon[v])
end

for k, v in pairs(duplicates) do
  -- checking if dups value is less than 2, if so, remove from table
  if v < 2 then
    duplicates[k] = nil
    -- if dups value is greater than 0, add dice face value 
    if v > 0 then
      sum = sum + k
    end
  end
end

local dupCount = 0
for k,v in pairs(duplicates) do
  dupCount = dupCount + 1
end

--print("dupcount;",dupCount)

if dupCount > 0 then
  print("\nRemoved duplicates.")
  for k, v in pairs(duplicates) do
    print(v,"x:",diceIcon[k])
    collection = collection - v
  end
end


print("\nRemaining total: ",sum)
print("remaining dice collection: ", collection)
