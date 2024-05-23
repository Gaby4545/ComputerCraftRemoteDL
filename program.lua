local ar = peripheral.find("arController")
if ar ~= nil then
    ar.setRelativeMode(true, 1600, 900)
else
    print("No ar Glasses found")
end

function mainLoop()
    while true do
        if ar ~= nil then
            ar.clear() 
            ar.drawRightboundString(os.date(), -10, 10, 0xffffff)
        end

        sleep(1);
    end
end