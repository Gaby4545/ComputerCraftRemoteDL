terminal = term.current()
termX, termY = terminal.getSize()


win = nil
actionBar = nil

buttons = {}

function handleClick() 

end

function waitForClick()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        win.clear()
        win.setCursorPos(1, 1)
        win.write("Btn" .. button .. ": " .. x .. "," .. y)

        handleClick(button, x, y) 
    end
end

--- The start of it all
function main() 
    terminal.clear()
    win = window.create(terminal, 1, 1, termX, termY-1)
    win.setBackgroundColour(colours.lightGrey)
    win.setTextColour(colours.white)
    win.clear()
    win.write("Testing my window!")

    actionBar = window.create(terminal, 1, termY-1, termX, termY-1)

    actionBar.setCursorPos(1, 2)
    actionBar.setBackgroundColour(colours.grey)
    actionBar.write("Back")

    waitForClick()
end

main()