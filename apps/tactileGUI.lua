terminal = term.current()
termX, termY = terminal.getSize()


win = nil
actionBar = nil

buttons = {}

function handleClick(button, x, y) 

end

function waitForClick()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        actionBar.clear()
        actionBar.setCursorPos(5, 1)
        actionBar.write("Btn" .. button .. ": " .. x .. "," .. y)

        handleClick(button, x, y) 
    end
end

--- The start of it all
function main() 
    terminal.clear()
    win = window.create(terminal, 1, 1, termX, termY-1)
    win.setBackgroundColour(colours.black)
    win.setTextColour(colours.white)
    win.clear()
    win.write("Testing my window!")

    actionBar = window.create(terminal, 1, termY-1, termX, termY-1)

    actionBar.setCursorPos(1, 2)
    win.setBackgroundColour(colours.lightGrey)
    actionBar.setBackgroundColour(colours.grey)
    actionBar.write("Back")

    term.redirect(win)
    shell.run("home")
    term.redirect(terminal)

    waitForClick()
end

main()