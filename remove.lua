--lua 5.3.5 

function remove(text, index, incrementing)
  local pretext = string.sub(text, 1, index - 1)
  local posttext = string.sub(text, index + incrementing, #text)
  return pretext .. posttext
end
