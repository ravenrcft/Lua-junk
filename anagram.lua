--lua 5.3.5 


function checkAnagram(word, word2)
    a = {}
    b = {}

    for i = 1, #word do
        local substr = string.sub(word, i, i)
        table.insert(a, substr)
    end

    for i = 1, #word2 do
        local substr = string.sub(word2, i, i)
        table.insert(b, substr)
    end

    table.sort(a)
    table.sort(b)
end

io.write("What's the first word?")
userinput = io.read("*l")
firstword = string.lower(string.gsub(userinput, ("%A"), ""))

io.write("What's the second word?")
userinput2 = io.read("*l")
secondword = string.lower(string.gsub(userinput2, ("%A"), ""))

checkAnagram(firstword, secondword)

print("Sorted letters of first word: " .. table.concat(a))
print("Sorted letters of second word: " .. table.concat(b))

-- Check if the sorted letters are equal
print("Are the words anagrams? " .. tostring(table.concat(a) == table.concat(b)))