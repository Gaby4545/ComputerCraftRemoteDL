local ar = peripheral.find("arController")
ar.setRelativeMode(true, 1600, 900)

local function mainLoop()
    while true do
        ar.clear()
        sleep(1);
        ar.drawRightboundString(os.date(), -10, 10, 0xffffff)
    end
end