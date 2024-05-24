-- This is a script for loading different programs at boot
-- This file should be launched automaticaly on boot because it's name is startup.lua

-- Getting the ids of all peripherals that are connected
faces = peripheral.getNames()

-- This is the terminal on the computer itself
terminal = term.native()

-- Global table that contains all peripherals
peripherals = {}


function findPeripherals() 
    print("Finding Peripherals")
    -- Iterate over all peripherals and store them in the table
    for i, face in ipairs(faces) do
        type = peripheral.getType(face)
    
        print("Found ".. type .." @ ".. face) 
    
        -- Create the table if it does not exist
        if peripherals[type] == nil then
            peripherals[type] = {}
        end
    
         -- Storing the peripheral
        table.insert(peripherals[type], peripheral.wrap(face))
    end
end

function main() 
    print()
    findPeripherals()

    -- If there are goggles, let's run the goggleProgram!
    allGoggles = peripherals["arController"];
    if allGoggles ~= null then
        local goggles = allGoggles[1]
        shell.run("background", "goggleProgram")
    end
end

main()