local terminal = term.current()

local function handleClick(button, x, y) 

end

local function waitForClick()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        terminal.clear()
        terminal.setCursorPos(1, 1)
        terminal.write("Home")
        terminal.setCursorPos(1, 2)
        terminal.write("Btn" .. button .. ": " .. x .. "," .. y)

        handleClick(button, x, y) 
    end
end

waitForClick()