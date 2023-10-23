--lua 5.3.5 


function roman(userinput)
  -- Input a number for roman numeral result
  local number = string.gsub(userinput, "(%D)", ""); local number = tonumber(number)
  if number > 3999 then
    return "ERROR: Can only count upto 3999 with current symbols."
  end
  local number = string.reverse(tostring(number))
  
  local a = {}
  for i = 1, #number do
    local substr = string.sub(number, i, i)
    table.insert(a, substr)
  end
  
  local r1, r2, r3, r4 = table.unpack(a)
  local r1 = tonumber(r1); local r2 = tonumber(r2); local r3 = tonumber(r3); local r4 = tonumber(r4)
  local a = {}
  
  local _numeral = {
    -- I = 1 || V = 5 || X = 10
    --1    2      3      4    5    6      7      8      9
    {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"},
    -- X = 10 || L = 50 || C = 100
    --1    2      3     4     5     6     7      8       9
    {"X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"},
    -- C = 100 || D = 500 || M = 1,000
    --1    2      3     4     5     6     7      8       9
    {"C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"},
    -- M = 1,000
    --1     2     3
    {"M", "MM", "MMM"}
  } 
  
  if r4 ~= nil then
    table.insert(a, _numeral[4][r4])
  end
  if r3 ~= nil then
    table.insert(a, _numeral[3][r3])
  end
  if r2 ~= nil then
    table.insert(a, _numeral[2][r2])
  end
  if r1 ~= nil then
    table.insert(a, _numeral[1][r1])
  end
  
  return table.concat(a)
end

function reverseroman(userinput)
  -- Enter roman numerals for a returned numeric value
  local letters = string.gsub(userinput, ("%A"), "")
  local total = 0
  
  local a = {}
  for i = 1, #letters do
    local substr = string.sub(letters, i, i)
    table.insert(a, substr)
  end  
  
  for i = 1, #letters do
    local j = i - 1
    if a[i] == "I" then
      total = total + 1
    elseif a[i] == "V" then
      total = total + 5
      if a[j] == "I" and j >= 0 then
        total = total - 2
      end
    elseif a[i] == "X" then
      total = total + 10
      if a[j] == "I" and j >= 0 then
        total = total - 2
      end 
    elseif a[i] == "L" then
      total = total + 50
      if a[j] == "X" and j >= 0 then
        total = total - 20
      end
    elseif a[i] == "C" then
      total = total + 100
      if a[j] == "X" and j >= 0 then
        total = total - 20
      elseif a[j] == "L" and j >= 0 then
         total = total - 100
      end
    elseif a[i] == "D" then
      total = total + 500
      if a[j] == "C" and j >= 0 then
        total = total - 200
      end
    elseif a[i] == "M" then
      total = total + 1000
      if a[j] == "C" and j >= 0 then
        total = total - 200
      elseif a[j] == "D" and j >= 0 then
        total = total - 1000
      end
    end  
  end
  
  return total
end
