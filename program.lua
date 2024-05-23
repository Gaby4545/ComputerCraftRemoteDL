local ar = peripheral.find("arController")
if ar ~= nil then
    print("ARGlasses found!")
    ar.setRelativeMode(true, 1600, 900)
else
    print("No ARGlasses found")
end

function mainLoop()
    while true do
        if ar ~= nil then
            ar.clear() 
            ar.drawString(os.date(), 10, 10, 0xffffff)
            ar.drawString("dirt", 30, 25, 0xffffff)
        end

        sleep(1);
    end
end