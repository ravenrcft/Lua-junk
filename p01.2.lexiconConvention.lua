--lua 5.3.5 

-- Identifiers (or names) in lua can be any string of letters, digits, and underscores,
-- not beginning with a digit

i,    j,    i10,    _iJ
aSomewhatLongName   _INPUT

-- You should avoid identifiers starting with an underscore followed by one or more upper-case letters (e.g. _VERSION);
-- They are reserved for special uses in Lua.
-- Usually, underscores (from a personal opinion) are reserved for dummy variables.

-- The following words are restricted, and cant be used as identifiers:


and    break    do     else       elseif
end    false    for    function   goto
if     in       local  nil        not
or     repeat   return then       true
until  while

-- Lua is case sensitive: 'and' is a reserved word, but 'And' and 'AND' are two different identifiers.
-----

-- Single comments are defined by '--' and run until the end of the line
-- Multiline comments start with '--[['   like for example:
  
--[[A multline
long comment  
]]

-- A common trick is to enclose the code between '--[[' and '--]]', like here:

--[[
  print(10)
--]]

-- But to reactivate the code, add a single hyphen '-'

---[[
  print(10)
--]]

-- In the first example, the '--[[' in the first line starts the comment, 
-- and the two hyphens in the last line are still inside that comment.
-- In the second example, the '---[[' starts an ordinary single comment '--' so the multiline comment does not continue past the end of the line.  
-----

-- Lua needs no seperator/delimitor between consecutive statements but we can use semicolons ';' if you wish

a = 1
b = a * 2

a = 1;
b = a * 2;

a = 1; b = a * 2

a = 1  b = a * 2

