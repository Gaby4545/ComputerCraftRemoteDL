terminal = term.current()

function handleClick(button, x, y) 

end

function waitForClick()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        terminal.clear()
        terminal.setCursorPos(1, 1)
        terminal.write("Btn" .. button .. ": " .. x .. "," .. y)

        handleClick(button, x, y) 
    end
end

waitForClick()