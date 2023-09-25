--lua 5.3.5 

function insert(origtext, index, addtext)
  local pretext = string.sub(origtext,  1, index - 1)
  local posttext = string.sub(origtext, index)

  return pretext .. addtext .. posttext
end
