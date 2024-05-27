-- This is a script for loading different programs at boot
-- This file should be launched automaticaly on boot because it's name is startup.lua

require("api/configAPI")

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

--- Checks the config for autoLaunching programs
function autoLaunch()
    print("AutoLaunching")
    local startupConf = getConfig("system", "startup.json")

    for i, program in ipairs(startupConf["launchServices"]) do 
        if shell.(program)
        shell.openTab(program)
    end
end

function main()
    print()
    findPeripherals()

    -- Adding apps to path
    shell.setPath(shell.path() .. ":/apps")
    shell.setPath(shell.path() .. ":/services")

    autoLaunch()
end

main()