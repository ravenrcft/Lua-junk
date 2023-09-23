--lua 5.3.5 

function insert(origtext, index, addtext)
  local pretext = string.sub(origtext,  1, index - 1)
  local posttext = string.sub(origtext, index)

  local result = pretext .. addtext .. posttext
  return result
end
