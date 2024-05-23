-- This file should be launch automaticaly on boot

-- Getting the ids of all peripherals that are connected
faces = peripheral.getNames()

-- This is the terminal on the computer itself
terminal = term.native()

-- Global table that will contain all peripherals
peripherals = {} -- Stores all connected peripherals

print()
print("Finding Peripherals")
-- Iterate over all peripherals and store them in the table
for i, face in ipairs(faces) do
    type = peripheral.getType(face)

    print("Found ".. type .."@".. face) 

    -- Create the table if it does not exist
    if peripherals[type] == nil then
        peripherals[type] = {}
    end

     -- Storing the peripheral
    table.insert(peripherals[type], peripheral.wrap(face))
end

-- If there are goggles, let's run the goggleProgram!
allGoggles = peripherals["arController"];
if allGoggles ~= null then
    local goggles = allGoggles[1]
    shell.run("background", "goggleProgram")
end