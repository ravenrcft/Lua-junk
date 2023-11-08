--lua 5.3.5 


-- Global variables do not need declarations, they are simply used.
-- It is not an error to access a non-initialuzed variable, you simply get a value of nil

b       --> nil
b = 10
b       --> 10

-- If you assigned nil to a global var, lua behaves as if it was never used

b = nil
b       --> nil

-- Lua does not differeniate a non-initalized var from one that was assigned nil.
-- After assignment, lua can eventually reclaim the memory