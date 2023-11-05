--lua 5.3.5 

-- A chunk can be a sequence of commands (or statements) or a single statement executed in interactive mode

-- Because Lua is used as a data-description language, 
-- chunks with several megabytes are not uncommon.

-- Instead of writing your program to a file, 
-- you can run the stand-alone interpreter in interactive mode.
-- If you call lua without any arguments, you will get its prompt.

-- % lua


-- Thereafter, each command you type (such as 'print("Hello World")') executes immediately.
-- To exit the interactive mode and the interpreter, just type the end-of-file control character:
-- 'ctrl+d' for POSIX or 'ctrl+z' for windows or call the function 'os.exit()' in the interpreter 
-----

-- Interactive mode examples:

math.pi / 4    --> 0.78539816339745
a = 15
a ^ 2          --> 225
a + 2          --> 17

 -- In older versions of Lua you need to precede expressions with equal signs

a = 15
= a ^ 2        --> 225

-- For compatibility, lua 5.3 still accepts prefixed equal signs
-----
  
-- To run a chunk not in interactive mode, you must enclose the expression in a print function

print(math.pi / 4)
a = 15
print(a ^ 2)
print(a + 2)
-----
  
-- Lua usually interprets each line that you type in interactive mode as a complete chunk or expression.
-- However, if it detects that the line is not complete, it waits for more input, until it has a complete chunk.

-- We can instruct lua, by using '-i' option to instruct it to start an interactive session after running a given chunk

% lua -i prog

-- A command line like this one will run the chunk in the file 'prog' and then prompt for interaction.
-- This is especially useful for debugging and manual testing

-- Another way to run chunks is with the function 'dofile', 
-- which is immediately executes as a file (i.e. 'lib1.lua').

function norm(x, y)
  return math.sqrt(x^2 + y^2)
end

function twice(x)
  return 2.0 * x
end

-- Then in interactive mode, you can type this code:

dofile("lib1.lua")      --> load our library 
n = norm(3.4, 1.0)
twice(n)                --> 7.0880180586677

-- The function 'dofile' is useful also when you are testing a piece of code.
-- You can work with two windows: one with in a text-editor and another is a console window  in interactive mode
-- After saving a modification in the program, you can execute it in the console to load the new code.