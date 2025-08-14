function ispali(word)
    local word = word:lower()
    local divLength = math.floor(#word / 2)
    if word:sub(1,divLength) == word:sub(-divLength, -1):reverse() then
        return true
    end
    return false
end
