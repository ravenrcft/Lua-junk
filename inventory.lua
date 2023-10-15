--lua 5.3.5 

local inventory = {}
--add multiple items in a loop?
--ask to add on to existing items quantity


function getitem(name)
  io.write("What item would you like to " .. name .. "?")
  return tostring(io.read("*l"))
end

function getquantity()
  io.write("How many to add?")
  return tonumber(io.read("*l"))
end

function additem()
  local item = getitem("add")
  local quantity = getquantity()
  if quantity > 0 then
    if inventory[item] ~= nil then
      prevquantity = inventory[item]
      inventory[item] = prevquantity + quantity  
      print(item .. " already exist, adding " .. quantity .. " + " .. prevquantity .. " to a total of " .. inventory[item])  
    else
      inventory[item] = quantity
      print("Adding " .. item .. " with " .. quantity .. " quantity.")
    end
  else
    print("Quantity must be more than 0.")
    io.write("Do you want to update the quantity?")
    local response = io.read("*l")
    if response == ("y" or "yes") then
      update(item)
    end
  end
end

function list()
  if next(inventory) == nil then
    print("The inventory is empty.")
  else
    for key, value in pairs(inventory) do
      print("[Item: " .. key .. "]" .. " | " .. "[Quanity: "  .. value .. "]")
    end
  end
end

function update(item)
  list()
  if item == nil then
    item = getitem("update")
  end
  if inventory[item] ~= nil then
    local quantity = getquantity()
    if quantity > 0 then
      inventory[item] = quantity
      print("Item " .. item .. " updated to a " .. quantity .. " quantity.")
    else
      print("Quantity must be more than 0.")
      io.write("Would you like to delete the item?")
      local response = io.read("*l")
      if response == ("y" or "yes") then
        print("Deleting " .. item .. " with " .. inventory[item] .. " quantity.")
        inventory[item] = nil
      end
    end
  else
    print("Item not found in inventory.")
  end
end

function delete(item)
  local item = getitem("delete")
  if inventory[item] ~= nil then
    print("Deleting " .. item .. " with " .. inventory[item] .. " quantity.")
    inventory[item] = nil
  else
    print(item .. " is not in the inventory.")
  end
end

function deleteall()
  print("Emptying inventory.")
  inventory = {}
end

io.write("Would you like to open the inventory?")
local openinv = io.read()
if openinv == ("y" or "yes") then
  activeInventory = true
end

while activeInventory do
  io.write("What would you like to do? add, delete, update, list, or exit")
  local response = io.read("*l")
  if response == "add" then
    additem()
  elseif response == "delete" then 
    delete()
  elseif response == "deleteall" then
    deleteall()
  elseif response == "update" then
    update()
  elseif response == "list" then
    list()
  elseif response == "exit" then
    print("Closing... ")
    break
  else
    print("That is not one of the known responses.")
  end
end


--for key, value in pairs(inventory) do
--  print(key .. " ; "  .. value)
--end
print("Goodbye!")