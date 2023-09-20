function ispali(word)
  word = string.lower(word)
  wordlength = #word; divlength = math.floor(wordlength / 2)
  if string.sub(word, 1, divlength) == (string.reverse(string.sub(word, -divlength, -1))) then
    return true
  end
  return false
end
