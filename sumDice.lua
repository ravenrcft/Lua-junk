--lua 5.3.5 
math.randomseed(os.time())


-- Ask user how many dice they wish to start with (min 20/max 100)
-- Each roll asks how many dice they wish to throw (min 2), anymore than 6 is guaranteed duplicates but is allowed. 
-- If the user throws 2 dice for 3 rolls in a row, the game instantly ends


-- Roll dice 
-- If there are duplicates, 
-- they are removed and you add up the face value of the remaining dice until you only have 2 or less dice.

turn = 0
total = 0
check2 = 0
dash = "——————————————"

io.write("How many dice do you wish to start with in your collection?")
local collection = string.gsub(io.read("*l"), "(%D)", ""); collection = tonumber(collection)


while collection > 2 do


repeat
  io.write("How many dice do you wish to throw? (Remaining: ", (collection),")")
  throw = string.gsub(io.read("*l"), "(%D)", ""); throw = tonumber(throw)
until throw <= collection

print(dash)
turn = turn + 1
print("Turn",turn)



if throw == 2 then
  check2 = check2 + 1
  if check2 > 1 then
    print("Careful: You must throw more than 2 dice in 3 rolls in a row or the game ends!")
  end
elseif throw ~= 2 then
  check2 = 0
end

if check2 > 2 then
  overMin = true
end


local sum = 0
local roll = {}
local duplicates = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0}
local diceIcon = {[1] = "\u{2680}", [2] = "\u{2681}", [3] = "\u{2682}", [4] = "\u{2683}", [5] = "\u{2684}", [6] = "\u{2685}"}

for i = 1, throw do
  local randNum = math.random(1, 6)
  table.insert(roll, randNum)
  
  duplicates[randNum] = duplicates[randNum] + 1  
end

for k, v in pairs(roll) do
  io.write(diceIcon[v])
end
print("\n")
print(dash)

for k, v in pairs(duplicates) do
  -- checking if dups value is less than 2, if so, remove from table
  if v < 2 then
    duplicates[k] = nil
    -- if dups value is greater than 0 (i.e. 1; unique die), add dice face value 
    if v > 0 then
      sum = sum + k
    end
  end
end

local dupCount = 0
for k,v in pairs(duplicates) do
  dupCount = dupCount + 1
end


if dupCount > 0 then
  print("\nRemoved duplicates.")
  for k, v in pairs(duplicates) do
    print(v,"x:",diceIcon[k])
    collection = collection - v
  end
end


total = total + sum


print("\t")
if overMin or (collection < 3) then
  print("Game over!")
  collection = 0
end
--print("Turn:",turn)
print("\nAdded: ",sum)
print("Total sum: ",total)
print("Remaining dice collection: ", collection)
print(dash)
print("\t")
end

