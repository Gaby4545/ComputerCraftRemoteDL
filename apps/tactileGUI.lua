terminal = term.current()
termX, termY = terminal.getSize()


window = nil
actionBar = nil

buttons = {}

function handleClick() 

end

function waitForClick()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        window.clear()
        window.setCursorPos(1, 1)
        window.write("Btn" .. button .. ": " .. x .. "," .. y)

        handleClick(button, x, y) 
    end
end

--- The start of it all
function main() 
    terminal.clear()
    window = window.create(terminal, 1, 1, termX, termY-1)
    window.setBackgroundColour(0x020202)
    window.setTextColour(colours.white)
    window.clear()
    window.write("Testing my window!")

    actionBar = window.create(terminal, 1, termY-1, termX, termY-1)

    actionBar.setCursorPos(1, 2)
    actionBar.setBackgroundColour(colours.grey)
    actionBar.write("Back")

    waitForClick()
end

main()