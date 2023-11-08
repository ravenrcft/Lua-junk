--lua 5.3.5 

-- Our first program in Lua just prints "Hello, Dcoder"
-- (file) hello.lua

print("Hello, Dcoder!")

-- If you are using a stand-alone interpreter, 
-- all you have to do to run your first program is to call the interpreter; usually named lua.

-- % lua hello.lua
-----

-- A more complex example asks the user for a number and prints its factorial.

function fact(n)
  if n == 0 then
    return 1
  else
    return n * fact(n - 1)
  end
end

print("enter a number:")
a = io.read("*n")
print(fact(a))