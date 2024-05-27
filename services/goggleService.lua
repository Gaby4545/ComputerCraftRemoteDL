local args = {...}

local ar = peripheral.find("arController")

function mainLoop()
    ar.clear()
    ar.drawItemIcon("minecraft:dirt", 10, 20)
    ar.drawString("dirt", 30, 25, 0xffffff)

    while true do
        if ar ~= nil then
            ar.clearElement("time")
            ar.drawStringWithId("time", os.date(), 10, 10, 0xffffff)
        end

        sleep(1);
    end
end

function main()
    if ar ~= nil then
        print("ARGlasses found!")
        ar.setRelativeMode(true, 1600, 900)
        mainLoop()
    else
        print("No ARGlasses found")
        shell.exit() -- Makes the shell exit after end of program
    end
end

main()