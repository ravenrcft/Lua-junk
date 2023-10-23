--lua 5.3.5 
math.randomseed(os.time())

repeat
  io.write("How many tries would you like? (will use last try)")
  userinput = string.gsub(io.read("*l"), "(%D)", ""); userinput = tonumber(userinput)
  if userinput > 5 then
    print("Must be less than 6.")
  end
until userinput <= 5
print("\u{2501}\u{2501}\u{2501}\u{2501}\u{2501}\u{2501}\u{2501}\u{2501}\u{2501}\u{2501}")


local a = {}
if userinput > 1 then
  for i = 1, userinput do
    table.insert(a, math.random(1,100))
  end
else
  table.insert(a, math.random(1,100))
end

local tries = table.concat(a, ",")
print("Player tries: ",tries)

local b = {}
local comprand = math.random(1,5)
if comprand > 1 then
  for i = 1, comprand do
    table.insert(b, math.random(1,100))
  end
else
  table.insert(b, math.random(1,100))
end

local comptries = table.concat(b, ",")

print("Computer tries: ", comptries)

if a[userinput] > b[comprand] then
  print("Player wins with ", a[userinput],  " vs.", b[comprand])
else
  print("Player losses with ", a[userinput],  " vs.", b[comprand])
end