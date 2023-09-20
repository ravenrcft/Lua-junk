function ispali(word) 
  local word = string.lower(word)
  local divlength = math.floor(#word / 2) 
  if string.sub(word, 1, divlength) == string.reverse(string.sub(word, -divlength, -1)) then 
    return true 
  end 
  return false 
end
